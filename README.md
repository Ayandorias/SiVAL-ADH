Die Chronik wird nun in einen Sprachstil überführt, der den aktuellen Konventionen der digitalen Kommunikation und Dokumentation entspricht, während die objektive und beobachtende Haltung beibehalten wird. Die Eleganz des Ausdrucks wird der Effizienz und Klarheit geopfert, um eine breitere Zugänglichkeit für moderne Leser zu gewährleisten.

🔊 JSON-Schema für Lautsprechertreiber-Spezifikationen

Dieses JSON-Schema dient zur strukturierten Erfassung von technischen Daten für Lautsprechertreiber (Chassis). Der Fokus liegt auf der Eindeutigkeit der Messwerte durch die explizite Angabe der Maßeinheiten. Das ist essenziell für die automatisierte Verarbeitung und korrekte Umrechnung der Daten.

Das Schema ist in vier Hauptkategorien unterteilt.

1. 🏗 Schema-Struktur und Datenformat

Alle quantitativen Parameter werden als verschachteltes Objekt mit den Feldern "value" und "unit" gespeichert.

Beispiel:
JSON

"fs": {
  "value": 40.0,
  "unit": "Hz"
}

General Information (general_info)

Dieser Block dient der Identifikation und der allgemeinen Beschreibung des Treibers.
Parameter	Typ	Beschreibung
uuid	string	Eindeutige ID (z.B. UUID v4).
brand	string	Der Markenname.
manufacturer	string	Der tatsächliche Hersteller (falls abweichend).
providedby	string	Quelle der Daten (z.B. "Datenblatt", "user").
comment	string	Allgemeine Anmerkungen.
model	string	Die spezifische Modellbezeichnung.
indexed	boolean	Flag zur Kennzeichnung der Indexierung (true/false).
speaker_type	string	Die Treiberart (z.B. "Woofer", "Tweeter").

2. Electrical Parameters (electrical_parameters)

Erfassung der elektrischen Kenngrößen.
Parameter	Beschreibung	Mögliche Einheiten ("unit")
impedance	Nennimpedanz (Z).	Ω
sensitivity	Kennschalldruck (SPL1W​).	dB SPL
re	DC-Widerstand der Schwingspule (Re​).	Ω
le	Induktivität der Schwingspule (Le​).	H, mH
znom	Nennimpedanz (Znom​).	Ω
pe	Nennbelastbarkeit (Pe​ RMS).	W
pmax	Maximale Belastbarkeit (Pmax​).	W
bl	Kraftfaktor (B⋅l).	N/A, Tm
motor_constant	Motorkonstante (Bl/Re​).	N/W​
flux_density	Magnetische Flussdichte.	T, G

3. Thiele-Small Parameters (thiele_small_parameters)

Referenzdaten für die Tiefton-Analyse.
Parameter	Beschreibung	Mögliche Einheiten ("unit")
fs	Resonanzfrequenz (fS​).	Hz, kHz
qms, qes, qts	Mechanische, Elektrische und Gesamtgüte.	Dimensionslos (als number eintragen)
mms	Bewegte Masse inkl. Luftlast (Mms​).	g, kg
mmd	Bewegte Masse exkl. Luftlast (Mmd​).	g, kg
stiffness	Federsteifigkeit (KMS​).	N/m, N/mm
cms	Mechanische Nachgiebigkeit (CMS​).	m/N, µm/N
vas	Äquivalentes Luftvolumen (VAS​).	L, dm³, cm³, m³
rms	Mechanischer Widerstand (RMS​).	N·s/m
sd	Effektive Membranfläche (SD​).	cm², m²
xmax	Max. lineare Auslenkung (Xmax​).	mm, cm, m
xlim	Mechanische Grenze der Auslenkung (Xlim​).	mm, cm, m
vd	Max. Verdrängungsvolumen (VD​).	cm³, L, m³

    💡 Tipp: Für die Q-Faktoren (qms, qes, qts) nur den Wert eintragen. xmax, xlim und vd können null sein, wenn der Wert fehlt.

4. Physical Dimensions (physical_dimensions)

Daten zu den physischen Abmessungen und Materialien.
Parameter	Beschreibung	Mögliche Einheiten ("unit")
vc_diameter	Durchmesser der Schwingspule.	mm, cm, in
winding_height	Wickelhöhe der Schwingspule.	mm, cm, in
air_gap_height	Höhe des Magnet-Luftspalts.	mm, cm, in
effective_diameter	Effektiver Durchmesser.	mm, cm, in
nominal_diameter	Nenndurchmesser (als string beibehalten).	in (Zoll), mm (z.B. 8" oder 203mm)
baffle_cutout_diameter	Schallwand-Ausschnittsdurchmesser.	mm, cm, in
volume_occupied	Vom Treiber eingenommenes Gehäusevolumen.	L, dm³, cm³, m³
net_weight	Eigengewicht des Treibers.	kg, g
material	Membran- oder Sicken-Material (z.B. "Paper", "Rubber").	N/A (als string eintragen)

🛠 Handhabung und Konvertierung der Einheiten

Das Programm muss die angegebenen "unit"-Werte lesen und bei Bedarf korrekt in eine Standardeinheit (z.B. SI) umrechnen. Die Trennung von Wert und Einheit dient der Datenintegrität.
Parameter	Häufige Einheit	SI-Einheit	Faktor zur SI-Einheit
le	mH	H	10−3
mms / mmd	g	kg	10−3
cms	µm/N	m/N	10−6
vas	L	m³	10−3
sd	` cm²}$	m²	10−4


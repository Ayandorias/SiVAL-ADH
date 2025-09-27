Die **Chronik** wird nun in einen Sprachstil überführt, der den aktuellen Konventionen der digitalen Kommunikation und Dokumentation entspricht, während die **objektive** und **beobachtende** Haltung beibehalten wird. Die Eleganz des Ausdrucks wird der **Effizienz** und **Klarheit** geopfert, um eine breitere Zugänglichkeit für moderne Leser zu gewährleisten.

-----

## 🔊 JSON-Schema für Lautsprechertreiber-Spezifikationen

Dieses JSON-Schema dient zur **strukturierten Erfassung** von technischen Daten für Lautsprechertreiber (Chassis). Der Fokus liegt auf der **Eindeutigkeit** der Messwerte durch die explizite Angabe der **Maßeinheiten**. Das ist essenziell für die automatisierte Verarbeitung und korrekte Umrechnung der Daten.

Das Schema ist in vier Hauptkategorien unterteilt.

-----

### 1\. 🏗 Schema-Struktur und Datenformat

Alle **quantitativen Parameter** werden als verschachteltes Objekt mit den Feldern `"value"` und `"unit"` gespeichert.

**Beispiel:**

```json
"fs": {
  "value": 40.0,
  "unit": "Hz"
}
```

#### General Information (`general_info`)

Dieser Block dient der **Identifikation** und der allgemeinen Beschreibung des Treibers.

| Parameter | Typ | Beschreibung |
| :--- | :--- | :--- |
| `uuid` | `string` | **Eindeutige ID** (z.B. UUID v4). |
| `brand` | `string` | Der **Markenname**. |
| `manufacturer` | `string` | Der tatsächliche **Hersteller** (falls abweichend). |
| `providedby` | `string` | **Quelle** der Daten (z.B. "Datenblatt", "user"). |
| `comment` | `string` | **Allgemeine Anmerkungen**. |
| `model` | `string` | Die **spezifische Modellbezeichnung**. |
| `indexed` | `boolean` | Flag zur Kennzeichnung der **Indexierung** (`true`/`false`). |
| `speaker_type` | `string` | Die **Treiberart** (z.B. "Woofer", "Tweeter"). |

-----

### 2\. Electrical Parameters (`electrical_parameters`)

Erfassung der **elektrischen Kenngrößen**.

| Parameter | Beschreibung | Mögliche Einheiten (`"unit"`) |
| :--- | :--- | :--- |
| `impedance` | Nennimpedanz ($\text{Z}$). | `Ω` |
| `sensitivity` | Kennschalldruck ($\text{SPL}_{1\text{W}}$). | `dB SPL` |
| `re` | DC-Widerstand der Schwingspule ($\text{R}_{\text{e}}$). | `Ω` |
| `le` | Induktivität der Schwingspule ($\text{L}_{\text{e}}$). | `H`, `mH` |
| `znom` | Nennimpedanz ($\text{Z}_{\text{nom}}$). | `Ω` |
| `pe` | Nennbelastbarkeit ($\text{P}_{\text{e}}$ RMS). | `W` |
| `pmax` | Maximale Belastbarkeit ($\text{P}_{\text{max}}$). | `W` |
| `bl` | Kraftfaktor ($\text{B}\cdot\text{l}$). | `N/A`, `Tm` |
| `motor_constant` | Motorkonstante ($\text{Bl}/\sqrt{\text{Re}}$). | $\text{N}/\sqrt{\text{W}}$ |
| `flux_density` | Magnetische Flussdichte. | `T`, `G` |

-----

### 3\. Thiele-Small Parameters (`thiele_small_parameters`)

Referenzdaten für die **Tiefton-Analyse**.

| Parameter | Beschreibung | Mögliche Einheiten (`"unit"`) |
| :--- | :--- | :--- |
| `fs` | Resonanzfrequenz ($\text{f}_{\text{S}}$). | `Hz`, `kHz` |
| **`qms`**, **`qes`**, **`qts`** | Mechanische, Elektrische und Gesamtgüte. | **Dimensionslos** (als **`number`** eintragen) |
| `mms` | Bewegte Masse inkl. Luftlast ($\text{M}_{\text{ms}}$). | `g`, `kg` |
| `mmd` | Bewegte Masse exkl. Luftlast ($\text{M}_{\text{md}}$). | `g`, `kg` |
| `stiffness` | Federsteifigkeit ($\text{K}_{\text{MS}}$). | `N/m`, `N/mm` |
| `cms` | Mechanische Nachgiebigkeit ($\text{C}_{\text{MS}}$). | `m/N`, `µm/N` |
| `vas` | Äquivalentes Luftvolumen ($\text{V}_{\text{AS}}$). | **`L`**, **`dm³`**, **`cm³`**, **`m³`** |
| `rms` | Mechanischer Widerstand ($\text{R}_{\text{MS}}$). | `N·s/m` |
| `sd` | Effektive Membranfläche ($\text{S}_{\text{D}}$). | `cm²`, `m²` |
| `xmax` | Max. lineare Auslenkung ($\text{X}_{\text{max}}$). | `mm`, `cm`, `m` |
| `xlim` | Mechanische Grenze der Auslenkung ($\text{X}_{\text{lim}}$). | `mm`, `cm`, `m` |
| `vd` | Max. Verdrängungsvolumen ($\text{V}_{\text{D}}$). | `cm³`, `L`, `m³` |

> 💡 *Tipp: Für die Q-Faktoren (`qms`, `qes`, `qts`) nur den Wert eintragen. **`xmax`**, **`xlim`** und **`vd`** können **`null`** sein, wenn der Wert fehlt.*

-----

### 4\. Physical Dimensions (`physical_dimensions`)

Daten zu den **physischen Abmessungen** und Materialien.

| Parameter | Beschreibung | Mögliche Einheiten (`"unit"`) |
| :--- | :--- | :--- |
| `vc_diameter` | Durchmesser der Schwingspule. | `mm`, `cm`, `in` |
| `winding_height` | Wickelhöhe der Schwingspule. | `mm`, `cm`, `in` |
| `air_gap_height` | Höhe des Magnet-Luftspalts. | `mm`, `cm`, `in` |
| `effective_diameter` | Effektiver Durchmesser. | `mm`, `cm`, `in` |
| `nominal_diameter` | **Nenndurchmesser** (als **`string`** beibehalten). | `in` (Zoll), `mm` (z.B. **`8"`** oder **`203mm`**) |
| `baffle_cutout_diameter` | Schallwand-Ausschnittsdurchmesser. | `mm`, `cm`, `in` |
| `volume_occupied` | Vom Treiber eingenommenes Gehäusevolumen. | `L`, `dm³`, `cm³`, `m³` |
| `net_weight` | Eigengewicht des Treibers. | `kg`, `g` |
| `material` | Membran- oder Sicken-Material (z.B. "Paper", "Rubber"). | **N/A** (als **`string`** eintragen) |

-----

## 🛠 Handhabung und Konvertierung der Einheiten

Das Programm muss die angegebenen `"unit"`-Werte lesen und bei Bedarf korrekt in eine **Standardeinheit** (z.B. $\text{SI}$) umrechnen. Die Trennung von Wert und Einheit dient der **Datenintegrität**.

| Parameter | Häufige Einheit | SI-Einheit | Faktor zur SI-Einheit |
| :--- | :--- | :--- | :--- |
| `le` | `mH` | **$\text{H}$** | $10^{-3}$ |
| `mms` / `mmd` | `g` | **$\text{kg}$** | $10^{-3}$ |
| `cms` | `µm/N` | **$\text{m/N}$** | $10^{-6}$ |
| `vas` | `L` | **$\text{m³}$** | $10^{-3}$ |
| `sd` | ` cm²}$ | **$\text{m²}$** | $10^{-4}$ | |  `xmax`/`xlim`|`mm`| **$\text{m}$** | $10^{-3}$ | |`vd`|`cm³}$ | **$\\text{m³}$\*\* | $10^{-6}$ |

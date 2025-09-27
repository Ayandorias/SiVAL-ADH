<img src="pictures/logo_big.svg" alt="SiVAL Logo" width="auto" height="150">

<span style="font-size: 48pt;">Speaker Info</span>

# 🔊 JSON-Schema für Lautsprechertreiber-Spezifikationen

Dieses JSON-Schema dient zur **strukturierten Erfassung** von technischen Daten für Lautsprechertreiber (Chassis). Der Fokus liegt auf der **Eindeutigkeit** der Messwerte durch die explizite Angabe der **Maßeinheiten**. Dies ist essenziell für die automatisierte Verarbeitung und korrekte Umrechnung der Daten.

## 🏗 Das Schema (JSON-Schema Draft-04)

Das folgende Schema definiert die erlaubte Struktur und die Datentypen. Es ist die formale Grundlage für alle Dateneinträge.

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "general_info": {
      "type": "object",
      "description": "General and identifying information about the speaker driver.",
      "properties": {
        "uuid": { "type": "string" }, "brand": { "type": "string" }, "manufacturer": { "type": "string" },
        "providedby": { "type": "string" }, "comment": { "type": "string" }, "model": { "type": "string" },
        "indexed": { "type": "boolean" }, "speaker_type": { "type": "string" }
      },
      "required": ["uuid", "brand", "manufacturer", "providedby", "comment", "model", "indexed"]
    },
    "electrical_parameters": {
      "type": "object",
      "description": "Electrical characteristics of the speaker driver.",
      "properties": {
        "impedance": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "sensitivity": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "re": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "le": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "znom": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "pe": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "pmax": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "bl": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "motor_constant": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "flux_density": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] }
      },
      "required": ["impedance", "sensitivity", "re", "le", "znom", "pe", "pmax", "bl", "motor_constant", "flux_density"]
    },
    "thiele_small_parameters": {
      "type": "object",
      "description": "Thiele-Small (T-S) parameters for driver performance analysis.",
      "properties": {
        "fs": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "qms": { "type": "number" }, "qes": { "type": "number" }, "qts": { "type": "number" },
        "mms": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "mmd": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "stiffness": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "cms": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "vas": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "rms": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "sd": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "xmax": { "type": ["object", "null"], "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "xlim": { "type": ["object", "null"], "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "vd": { "type": ["object", "null"], "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] }
      },
      "required": ["fs", "qms", "qes", "qts", "mms", "mmd", "stiffness", "cms", "vas", "rms", "sd", "xmax", "xlim", "vd"]
    },
    "physical_dimensions": {
      "type": "object",
      "description": "Physical dimensions and construction details.",
      "properties": {
        "vc_diameter": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "winding_height": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "air_gap_height": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "effective_diameter": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "nominal_diameter": { "type": "string" },
        "baffle_cutout_diameter": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "volume_occupied": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "net_weight": { "type": "object", "properties": { "value": { "type": "number" }, "unit": { "type": "string" } }, "required": ["value", "unit"] },
        "material": { "type": "string" }
      },
      "required": ["vc_diameter", "winding_height", "air_gap_height", "effective_diameter", "nominal_diameter", "baffle_cutout_diameter", "volume_occupied", "net_weight", "material"]
    }
  }
}
```

-----

## ℹ️ Erläuterung der Hauptobjekte

### 1\. `general_info` (Allgemeine Informationen)

Dieser Abschnitt dient der **administrativen Identifikation** des Treibers und erfasst Metadaten wie Herkunft, Modell und Treiberart.

### 2\. `electrical_parameters` (Elektrische Parameter)

Hier werden die **elektrischen Kenngrößen** der Schwingspule und des Motorsystems dokumentiert, welche die Interaktion mit dem Verstärker definieren.

### 3\. `thiele_small_parameters` (Thiele-Small-Parameter)

Dieser Block enthält die **akustischen und mechanischen Parameter** zur Berechnung und Simulation des Tieftonverhaltens in einem Gehäuse.

### 4\. `physical_dimensions` (Physische Abmessungen)

Dieser Abschnitt erfasst die **geometrischen Maße** und die **Materialbeschaffenheit** des Treibers für die mechanische Konstruktion von Gehäusen.

-----

## ⚠️ Wichtiger Hinweis zur numerischen Konvention (JSON-Standard)

Die **JSON-Spezifikation** (und damit auch der Qt-JSON-Parser) erfordert die Verwendung des **englischen Standards** für numerische Werte. Abweichungen führen zu Parser-Fehlern.

| Konvention | Regel | Beispiel |
| :--- | :--- | :--- |
| **Dezimaltrennzeichen** | Es muss der **Punkt** (`.`) verwendet werden. | **Korrekt:** `"value": 1.5` |
| **Tausendertrennzeichen** | Tausendertrennzeichen dürfen **nicht** verwendet werden. | **Korrekt:** `"value": 1200` |

-----

## 🔍 Detaillierte Parameter und Einheiten

Alle quantitativen Parameter nutzen die Struktur **`{"value": Wert, "unit": Einheit}`**.

### Electrical Parameters (`electrical_parameters`)

| Parameter | Beschreibung | Mögliche Einheiten (`"unit"`) | Bedeutung der Einheit |
| :--- | :--- | :--- | :--- |
| `impedance` | Nennimpedanz ($\text{Z}$). | `Ohm` | **Ohm** ($\Omega$) |
| `sensitivity` | Kennschalldruck ($\text{SPL}_{1\text{W}}$). | `dB` | **Dezibel Schalldruckpegel** |
| `re` | DC-Widerstand ($\text{R}_{\text{e}}$). | `Ohm` | **Ohm** ($\Omega$) |
| `le` | Induktivität ($\text{L}_{\text{e}}$). | `H`, `mH` | **Henry**, **Millihenry** |
| `znom` | Nennimpedanz ($\text{Z}_{\text{nom}}$). | `Ohm` | **Ohm** ($\Omega$) |
| `pe` | Nennbelastbarkeit ($\text{P}_{\text{e}}$ RMS). | `W` | **Watt** |
| `pmax` | Maximale Belastbarkeit ($\text{P}_{\text{max}}$). | `W` | **Watt** |
| `bl` | Kraftfaktor ($\text{B}\cdot\text{l}$). | `NA`, `Tm` | **Newton pro Ampere**, **Tesla-Meter** |
| `motor_constant` | Motorkonstante ($\text{Bl}/\sqrt{\text{Re}}$). | `N_sqrtW` | **Newton pro Wurzel-Watt** |
| `flux_density` | Magnetische Flussdichte. | `T`, `G` | **Tesla**, **Gauss** |

### Thiele-Small Parameters (`thiele_small_parameters`)

| Parameter | Beschreibung | Mögliche Einheiten (`"unit"`) | Bedeutung der Einheit |
| :--- | :--- | :--- | :--- |
| `fs` | Resonanzfrequenz ($\text{f}_{\text{S}}$). | `Hz`, `kHz` | **Hertz**, **Kilohertz** |
| **`qms`**, **`qes`**, **`qts`** | Mechanische, Elektrische und Gesamtgüte. | **Dimensionslos** (als **`number`** eintragen) | |
| `mms` | Bewegte Masse inkl. Luftlast ($\text{M}_{\text{ms}}$). | `g`, `kg` | **Gramm**, **Kilogramm** |
| `mmd` | Bewegte Masse exkl. Luftlast ($\text{M}_{\text{md}}$). | `g`, `kg` | **Gramm**, **Kilogramm** |
| `stiffness` | Federsteifigkeit ($\text{K}_{\text{MS}}$). | `N_m`, `N_mm` | **Newton pro Meter**, **Newton pro Millimeter** |
| `cms` | Nachgiebigkeit ($\text{C}_{\text{MS}}$). | `m_N`, `um_N` | **Meter pro Newton**, **Mikrometer pro Newton** |
| `vas` | Äquivalentes Luftvolumen ($\text{V}_{\text{AS}}$). | `L`, `l`, `dm3`, `cm3`, `m3` | **Liter**, **Kubikdezimeter**, **Kubikzentimeter**, **Kubikmeter** |
| `rms` | Mechanischer Widerstand ($\text{R}_{\text{MS}}$). | `Ns_m` | **Newton-Sekunde pro Meter** |
| `sd` | Effektive Membranfläche ($\text{S}_{\text{D}}$). | `cm2`, `m2` | **Quadratzentimeter**, **Quadratmeter** |
| `xmax` | Max. lineare Auslenkung ($\text{X}_{\text{max}}$). | `mm`, `cm`, `m` | **Millimeter**, **Zentimeter**, **Meter** |
| `xlim` | Mechanische Grenze der Auslenkung ($\text{X}_{\text{lim}}$). | `mm`, `cm`, `m` | **Millimeter**, **Zentimeter**, **Meter** |
| `vd` | Max. Verdrängungsvolumen ($\text{V}_{\text{D}}$). | `cm3`, `L`, `l`, `m3` | **Kubikzentimeter**, **Liter**, **Kubikmeter** |

### Physical Dimensions (`physical_dimensions`)

| Parameter | Beschreibung | Mögliche Einheiten (`"unit"`) | Bedeutung der Einheit |
| :--- | :--- | :--- | :--- |
| `vc_diameter` | Durchmesser der Schwingspule. | `mm`, `cm`, `in` | **Millimeter**, **Zentimeter**, **Zoll** |
| `winding_height` | Wickelhöhe der Schwingspule. | `mm`, `cm`, `in` | **Millimeter**, **Zentimeter**, **Zoll** |
| `air_gap_height` | Höhe des Magnet-Luftspalts. | `mm`, `cm`, `in` | **Millimeter**, **Zentimeter**, **Zoll** |
| `effective_diameter` | Effektiver Durchmesser. | `mm`, `cm`, `in` | **Millimeter**, **Zentimeter**, **Zoll** |
| **`nominal_diameter`** | **Nenndurchmesser** (z.B. **`8"`** oder **`203mm`**). | **Reiner String-Wert** (keine Unit) | **Zoll** oder **Millimeter** |
| `baffle_cutout_diameter` | Schallwand-Ausschnittsdurchmesser. | `mm`, `cm`, `in` | **Millimeter**, **Zentimeter**, **Zoll** |
| `volume_occupied` | Vom Treiber eingenommenes Gehäusevolumen. | `L`, `l`, `dm3`, `cm3`, `m3` | **Liter**, **Kubikdezimeter**, **Kubikzentimeter**, **Kubikmeter** |
| `net_weight` | Eigengewicht des Treibers. | `kg`, `g` | **Kilogramm**, **Gramm** |
| `material` | Membran- oder Sicken-Material. | **Reiner String-Wert** (keine Unit) | |

-----

## 🛠 Handhabung und Konvertierung der Einheiten


Das Programm muss die angegebenen `"unit"`-Werte lesen und bei Bedarf korrekt in eine **Standardeinheit** (z.B. $\text{SI}$) umrechnen. Die Trennung von Wert und Einheit dient der **Datenintegrität**.

| Parameter | Häufige Einheit | SI-Einheit | Faktor zur SI-Einheit |
| :--- | :--- | :--- | :--- |
| `le` | `mH` | **$\text{H}$** | $10^{-3}$ |
| `mms` / `mmd` | `g` | **$\text{kg}$** | $10^{-3}$ |
| `cms` | `µm/N` | **$\text{m/N}$** | $10^{-6}$ |
| `vas` | `L` | **$\text{m³}$** | $10^{-3}$ |
| `sd` | `cm²` | **$\text{m²}$** | $10^{-4}$ | 
|  `xmax`/`xlim`|`mm`| **$\text{m}$** | $10^{-3}$ | 
|`vd`|`cm³` | **$\\text{m³}$** | $10^{-6}$ |
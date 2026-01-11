<img src="pictures/logo_big.svg" alt="SiVAL Logo" width="auto" height="150">

<span style="font-size: 48pt;">Speaker Info</span>

# 🔊 JSON Schema for Speaker Driver Specifications

This document describes the standard for the **structured acquisition** of technical data for loudspeaker drivers (chassis). The focus is on **data integrity** and the **unambiguity** of measured values through the explicit specification of measurement units.

The goal is to create a universal interface that accepts both metric and imperial inputs and harmonizes them for further processing.

---

## ℹ️ Structure Explanation (Main Objects)

The dataset is logically divided into four main sections to represent the different aspects of a driver:

### 1. `general_info` (General Information)
This section serves for **administrative identification**. It contains metadata such as manufacturer, model name, a unique ID (UUID), and the classification of the driver.

### 2. `electrical_parameters` (Electrical Parameters)
Here, the **electrical characteristics** of the voice coil and motor system are documented. These values are essential for crossover calculation and amplifier selection.

### 3. `thiele_small_parameters` (Thiele-Small Parameters)
This block contains the **acoustic and mechanical parameters** (T/S) that describe the driver's behavior in the low-frequency range. They form the basis for any enclosure simulation.

### 4. `physical_dimensions` (Physical Dimensions)
This section captures the **geometric dimensions** (for installation) and the **material properties** of the driver.

---

## ⚠️ Important Conventions (The Golden Rules)

To ensure machine processing capability, the following rules must be strictly adhered to:

### 1. Numerical Format (JSON Standard)
The **JSON specification** strictly requires the use of the **English standard**:
* **Decimal Separator:** Dot (`.`) – *Example: `1.5` (not `1,5`)*
* **Thousands Separator:** None – *Example: `1200` (not `1,200` or `1.200`)*

### 2. Value-Unit Pairs
All physical quantities are passed not as a naked number, but as an object. This prevents confusion (e.g., mm vs. inch).

**Incorrect:**
```json
"vas": 45.5
```

**Correct:**
```json
"vas": {
  "value": 45.5,
  "unit": "L"
}
```

---

## 🔍 Detailed Parameter Reference

The following tables list all allowed parameters and their permissible units (`"unit"`).

### A. Electrical Parameters (`electrical_parameters`)

| Parameter | Description | Allowed Units (`"unit"`) |
| :--- | :--- | :--- |
| `impedance` | Nominal Impedance ($Z$). | `Ohm` |
| `sensitivity` | Sensitivity ($\text{SPL}_{1\text{W}}$). | `dB` |
| `re` | DC Resistance ($\text{R}_{\text{e}}$). | `Ohm` |
| `le` | Inductance ($\text{L}_{\text{e}}$). | `H`, `mH` |
| `znom` | Nominal Impedance ($\text{Z}_{\text{nom}}$). | `Ohm` |
| `pe` | Nominal Power Handling ($\text{P}_{\text{e}}$ RMS). | `W` |
| `pmax` | Max Power Handling ($\text{P}_{\text{max}}$). | `W` |
| `bl` | Force Factor ($\text{B}\cdot\text{l}$). | `N/A`, `Tm` |
| `motor_constant` | Motor Constant. | `N/sqrt(W)` |
| `flux_density` | Magnetic Flux Density. | `T`, `G` |

### B. Thiele-Small Parameters (`thiele_small_parameters`)

| Parameter | Description | Allowed Units (`"unit"`) |
| :--- | :--- | :--- |
| `fs` | Resonant Frequency ($\text{f}_{\text{S}}$). | `Hz`, `kHz` |
| `qms`, `qes`, `qts` | Q-Factors. | **Dimensionless** (as `number`) |
| `mms` / `mmd` | Moving Mass. | `g`, `kg`, `oz`, `lb` |
| `stiffness` | Suspension Stiffness ($\text{K}_{\text{MS}}$). | `N/m`, `N/mm`, `lb/in` |
| `cms` | Suspension Compliance ($\text{C}_{\text{MS}}$). | `m/N`, `mm/N`, `um/N` |
| `vas` | Equivalent Volume of Compliance ($\text{V}_{\text{AS}}$). | `L`, `l`, `dm3`, `cm3`, `m3`, `in3`, `ft3` |
| `rms` | Mechanical Resistance ($\text{R}_{\text{MS}}$). | `kg/s`, `Ns/m` |
| `sd` | Effective Diaphragm Area ($\text{S}_{\text{D}}$). | `cm2`, `m2`, `in2`, `ft2` |
| `xmax` / `xlim` | Excursion Limits. | `mm`, `cm`, `m`, `in` |
| `vd` | Volume of Displacement ($\text{V}_{\text{D}}$). | `cm3`, `L`, `l`, `m3`, `in3`, `ft3` |

### C. Physical Dimensions (`physical_dimensions`)

| Parameter | Description | Allowed Units (`"unit"`) |
| :--- | :--- | :--- |
| `vc_diameter` | Voice Coil Diameter. | `mm`, `cm`, `in` |
| `winding_height` | Voice Coil Winding Height. | `mm`, `cm`, `in` |
| `air_gap_height` | Air Gap Height (Top Plate). | `mm`, `cm`, `in` |
| `effective_diameter` | Effective Piston Diameter. | `mm`, `cm`, `in` |
| `nominal_diameter` | Nominal Diameter (Category). | **No Unit** (String) |
| `baffle_cutout_diameter`| Baffle Cutout Diameter. | `mm`, `cm`, `in` |
| `volume_occupied` | Volume Occupied (Driver Displacement). | `L`, `l`, `dm3`, `cm3`, `m3`, `in3`, `ft3` |
| `net_weight` | Net Weight. | `kg`, `g`, `oz`, `lb` |
| `material` | Cone Material. | **No Unit** (String) |

---

## 🏗 The JSON Schema (Technical Definition)

This is the formal definition (Draft-07) used to validate the datasets. It implements the rules and units mentioned above.

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "SiVAL Speaker Specification",
  "type": "object",
  "required": [
    "general_info",
    "electrical_parameters",
    "thiele_small_parameters",
    "physical_dimensions"
  ],
  "properties": {
    "general_info": {
      "type": "object",
      "description": "Administrative identification of the driver.",
      "required": ["uuid", "brand", "manufacturer", "providedby", "comment", "model", "indexed"],
      "properties": {
        "uuid": { "type": "string", "format": "uuid" },
        "brand": { "type": "string" },
        "manufacturer": { "type": "string" },
        "providedby": { "type": "string" },
        "comment": { "type": "string" },
        "model": { "type": "string" },
        "indexed": { "type": "boolean" },
        "speaker_type": { "type": "string" }
      }
    },
    "electrical_parameters": {
      "type": "object",
      "description": "Electrical characteristics.",
      "required": ["impedance", "sensitivity", "re", "le", "znom", "pe", "pmax", "bl", "motor_constant", "flux_density"],
      "properties": {
        "impedance": { "$ref": "#/$defs/val_ohm" },
        "sensitivity": { "$ref": "#/$defs/val_db" },
        "re": { "$ref": "#/$defs/val_ohm" },
        "le": { "$ref": "#/$defs/val_henry" },
        "znom": { "$ref": "#/$defs/val_ohm" },
        "pe": { "$ref": "#/$defs/val_watt" },
        "pmax": { "$ref": "#/$defs/val_watt" },
        "bl": { "$ref": "#/$defs/val_bl" },
        "motor_constant": { "$ref": "#/$defs/val_motor" },
        "flux_density": { "$ref": "#/$defs/val_magnetic" }
      }
    },
    "thiele_small_parameters": {
      "type": "object",
      "description": "Acoustic and mechanical parameters (T/S).",
      "required": ["fs", "qms", "qes", "qts", "mms", "mmd", "stiffness", "cms", "vas", "rms", "sd", "xmax", "xlim", "vd"],
      "properties": {
        "fs": { "$ref": "#/$defs/val_freq" },
        "qms": { "type": "number" },
        "qes": { "type": "number" },
        "qts": { "type": "number" },
        "mms": { "$ref": "#/$defs/val_mass" },
        "mmd": { "$ref": "#/$defs/val_mass" },
        "stiffness": { "$ref": "#/$defs/val_stiffness" },
        "cms": { "$ref": "#/$defs/val_compliance" },
        "vas": { "$ref": "#/$defs/val_volume" },
        "rms": { "$ref": "#/$defs/val_resistance_mech" },
        "sd": { "$ref": "#/$defs/val_area" },
        "xmax": { "anyOf": [{ "$ref": "#/$defs/val_length_excursion" }, { "type": "null" }] },
        "xlim": { "anyOf": [{ "$ref": "#/$defs/val_length_excursion" }, { "type": "null" }] },
        "vd": { "anyOf": [{ "$ref": "#/$defs/val_volume" }, { "type": "null" }] }
      }
    },
    "physical_dimensions": {
      "type": "object",
      "description": "Geometric dimensions and material.",
      "required": ["vc_diameter", "winding_height", "air_gap_height", "effective_diameter", "nominal_diameter", "baffle_cutout_diameter", "volume_occupied", "net_weight", "material"],
      "properties": {
        "vc_diameter": { "$ref": "#/$defs/val_length_geom" },
        "winding_height": { "$ref": "#/$defs/val_length_geom" },
        "air_gap_height": { "$ref": "#/$defs/val_length_geom" },
        "effective_diameter": { "$ref": "#/$defs/val_length_geom" },
        "nominal_diameter": { "type": "string" },
        "baffle_cutout_diameter": { "$ref": "#/$defs/val_length_geom" },
        "volume_occupied": { "$ref": "#/$defs/val_volume" },
        "net_weight": { "$ref": "#/$defs/val_mass" },
        "material": { "type": ["string", "null"] }
      }
    }
  },
  "$defs": {
    "val_ohm": {
      "type": "object",
      "properties": { "value": { "type": "number" }, "unit": { "type": "string", "enum": ["Ohm"] } },
      "required": ["value", "unit"]
    },
    "val_db": {
      "type": "object",
      "properties": { "value": { "type": "number" }, "unit": { "type": "string", "enum": ["dB"] } },
      "required": ["value", "unit"]
    },
    "val_henry": {
      "type": "object",
      "properties": { "value": { "type": "number" }, "unit": { "type": "string", "enum": ["H", "mH"] } },
      "required": ["value", "unit"]
    },
    "val_watt": {
      "type": "object",
      "properties": { "value": { "type": "number" }, "unit": { "type": "string", "enum": ["W"] } },
      "required": ["value", "unit"]
    },
    "val_bl": {
      "type": "object",
      "properties": { "value": { "type": "number" }, "unit": { "type": "string", "enum": ["Tm", "N/A"] } },
      "required": ["value", "unit"]
    },
    "val_motor": {
      "type": "object",
      "properties": { "value": { "type": "number" }, "unit": { "type": "string", "enum": ["N/sqrt(W)"] } },
      "required": ["value", "unit"]
    },
    "val_magnetic": {
      "type": "object",
      "properties": { "value": { "type": "number" }, "unit": { "type": "string", "enum": ["T", "G"] } },
      "required": ["value", "unit"]
    },
    "val_freq": {
      "type": "object",
      "properties": { "value": { "type": "number" }, "unit": { "type": "string", "enum": ["Hz", "kHz"] } },
      "required": ["value", "unit"]
    },
    "val_mass": {
      "type": "object",
      "properties": { "value": { "type": "number" }, "unit": { "type": "string", "enum": ["g", "kg", "oz", "lb"] } },
      "required": ["value", "unit"]
    },
    "val_stiffness": {
      "type": "object",
      "properties": { "value": { "type": "number" }, "unit": { "type": "string", "enum": ["N/m", "N/mm", "lb/in"] } },
      "required": ["value", "unit"]
    },
    "val_compliance": {
      "type": "object",
      "properties": { "value": { "type": "number" }, "unit": { "type": "string", "enum": ["m/N", "mm/N", "um/N"] } },
      "required": ["value", "unit"]
    },
    "val_volume": {
      "type": "object",
      "properties": { "value": { "type": "number" }, "unit": { "type": "string", "enum": ["L", "l", "dm3", "cm3", "m3", "in3", "ft3"] } },
      "required": ["value", "unit"]
    },
    "val_resistance_mech": {
      "type": "object",
      "properties": { "value": { "type": "number" }, "unit": { "type": "string", "enum": ["kg/s", "Ns/m"] } },
      "required": ["value", "unit"]
    },
    "val_area": {
      "type": "object",
      "properties": { "value": { "type": "number" }, "unit": { "type": "string", "enum": ["cm2", "m2", "in2", "ft2"] } },
      "required": ["value", "unit"]
    },
    "val_length_excursion": {
      "type": "object",
      "properties": { "value": { "type": "number" }, "unit": { "type": "string", "enum": ["mm", "cm", "m", "in"] } },
      "required": ["value", "unit"]
    },
    "val_length_geom": {
      "type": "object",
      "properties": { "value": { "type": "number" }, "unit": { "type": "string", "enum": ["mm", "cm", "in"] } },
      "required": ["value", "unit"]
    }
  }
}
```

---

## 🛠 Conversion Factors (Reference)

The importing system must normalize all values to **SI base units** to ensure a uniform database.

| Quantity | Source Unit | Target (SI) | Factor |
| :--- | :--- | :--- | :--- |
| **Length** | `in` (inch) | **m** | 0.0254 |
| | `mm` | **m** | 0.001 |
| **Area** | `in2` (sq inch) | **m²** | 0.00064516 |
| | `ft2` (sq foot) | **m²** | 0.092903 |
| **Volume** | `L`, `dm3` | **m³** | 0.001 |
| | `ft3` (cubic ft) | **m³** | 0.0283168 |
| | `in3` (cubic in) | **m³** | 1.6387e-5 |
| **Mass** | `oz` (ounce) | **kg** | 0.0283495 |
| | `lb` (pound) | **kg** | 0.453592 |

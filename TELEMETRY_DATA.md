# Complete Telemetry Data Reference

This document lists **ALL** telemetry data available from ETS2/ATS via the Funbit Telemetry Server, based on the official [SCS SDK documentation](https://github.com/Funbit/ets2-telemetry-server/blob/master/Telemetry.md).

## 📊 Data We Currently Use

Properties actively used in the ARK Dashboard (marked with ✅):

### Truck Data
- ✅ `truck.speed` - Current speed (m/s)
- ✅ `truck.engineRpm` - Current engine RPM
- ✅ `truck.engineRpmMax` - Maximum engine RPM
- ✅ `truck.displayedGear` - Displayed gear (integer)
- ✅ `truck.gear` - Physical gear (integer)
- ✅ `truck.forwardGears` - Number of forward gears
- ✅ `truck.gameSteer` - Steering input (-1 to 1)
- ✅ `truck.gameThrottle` - Throttle input (0 to 1)
- ✅ `truck.gameBrake` - Brake input (0 to 1)
- ✅ `truck.gameClutch` - Clutch input (0 to 1)
- ✅ `truck.parkBrakeOn` - Parking brake status
- ✅ `truck.fuelWarningOn` - Low fuel warning
- ✅ `truck.blinkerLeftOn` - Left turn signal switch
- ✅ `truck.blinkerRightOn` - Right turn signal switch
- ✅ `truck.blinkerLeftActive` - Left blinker flashing
- ✅ `truck.blinkerRightActive` - Right blinker flashing
- ✅ `truck.lightsBeaconOn` - Rotating beacon active
- ✅ `truck.differentialLockOn` - Diff lock engaged
- ✅ `truck.motorBrakeOn` - Engine brake active
- ✅ `truck.retarderBrake` - Retarder level (0-3)
- ✅ `truck.airPressure` - Air pressure (PSI) - used for ABS logic
- ✅ `truck.make` - Truck manufacturer (e.g., "Volvo")
- ✅ `truck.model` - Truck model (e.g., "FH16")

### Job Data
- ✅ `job.sourceCity` - Departure city
- ✅ `job.destinationCity` - Destination city
- ✅ `job.cargo` - Cargo name
- ✅ `job.mass` - Cargo weight (kg)

### Trailer Data
- ✅ `trailer.attached` - Trailer connection status
- ✅ `trailer.name` - Trailer/cargo name
- ✅ `trailer.mass` - Trailer weight (kg)

### Game Data
- ✅ `game.gameName` - "ETS2" or "ATS"

---

## 🗂️ Complete Data Reference

All properties available from the Funbit API endpoint: `http://localhost:25555/api/ets2/telemetry`

### Game Object

| Property | Type | Description | Example |
|----------|------|-------------|---------|
| `game.connected` | bool | Game connection status | `true` |
| `game.gameName` | string | Game name | `"ETS2"` or `"ATS"` |
| `game.paused` | bool | Game is paused | `false` |
| `game.time` | datetime | In-game time | `"0001-01-08T21:09:00Z"` |
| `game.timeScale` | float | Time multiplier | `19.0` (19x speed) |
| `game.nextRestStopTime` | datetime | Next rest requirement | `"0001-01-09T05:09:00Z"` |
| `game.version` | string | Game version | `"1.45"` |
| `game.telemetryPluginVersion` | string | Plugin version | `"11"` |

### Truck Object

#### Engine & Drivetrain
| Property | Type | Description | Range/Example |
|----------|------|-------------|---------------|
| `truck.engineRpm` | float | Current RPM | `0.0` - `engineRpmMax` |
| `truck.engineRpmMax` | float | Maximum RPM | `1900.0` - `2500.0` |
| `truck.fuel` | float | Current fuel (liters) | `0.0` - `fuelCapacity` |
| `truck.fuelCapacity` | float | Tank capacity (liters) | `300.0` - `700.0` |
| `truck.fuelAverageConsumption` | float | Average consumption (l/km) | `0.35` |
| `truck.fuelWarningFactor` | float | Low fuel threshold | `0.15` (15%) |
| `truck.fuelWarningOn` | bool | Low fuel warning active | `false` |
| `truck.adblue` | float | AdBlue level (liters) | `0.0` - `adblueCapacity` |
| `truck.adblueCapacity` | float | AdBlue tank capacity | `60.0` |
| `truck.adblueAverageConsumption` | float | AdBlue consumption | `0.05` |
| `truck.adblueWarningOn` | bool | Low AdBlue warning | `false` |

#### Speed & Gear
| Property | Type | Description | Range/Example |
|----------|------|-------------|---------------|
| `truck.speed` | float | Speed (m/s) | `25.5` (× 3.6 = 91.8 km/h) |
| `truck.cruiseControlSpeed` | float | CC speed (km/h) | `90.0` |
| `truck.cruiseControlOn` | bool | Cruise control active | `true` |
| `truck.speedLimit` | float | Current limit (km/h) | `90.0` |
| `truck.gear` | int | Physical gear | `-1` (R), `0` (N), `1-12` |
| `truck.displayedGear` | int | Displayed gear | `-1` (R), `0` (N), `1-12` |
| `truck.forwardGears` | int | Total forward gears | `12` |
| `truck.reverseGears` | int | Total reverse gears | `1` |
| `truck.shifterType` | string | Transmission type | `"manual"`, `"automatic"`, `"hshifter"`, `"arcade"` |

#### Brakes
| Property | Type | Description | Range/Example |
|----------|------|-------------|---------------|
| `truck.parkBrakeOn` | bool | Parking brake engaged | `false` |
| `truck.motorBrakeOn` | bool | Engine brake active | `true` |
| `truck.retarderBrake` | int | Retarder level | `0-3` |
| `truck.retarderStepCount` | int | Available retarder steps | `3` |
| `truck.airPressure` | float | Air brake pressure (PSI) | `0.0` - `150.0` |
| `truck.airPressureWarningOn` | bool | Low air pressure | `false` |
| `truck.airPressureWarningValue` | float | Warning threshold | `65.0` |
| `truck.airPressureEmergencyOn` | bool | Emergency brake active | `false` |
| `truck.airPressureEmergencyValue` | float | Emergency threshold | `30.0` |

#### Lights
| Property | Type | Description | Range/Example |
|----------|------|-------------|---------------|
| `truck.lightsParking` | bool | Parking lights | `false` |
| `truck.lightsBeamLow` | bool | Low beam | `true` |
| `truck.lightsBeamHigh` | bool | High beam | `false` |
| `truck.lightsAuxFront` | bool | Aux front lights | `false` |
| `truck.lightsAuxRoof` | bool | Roof lights | `false` |
| `truck.lightsBeaconOn` | bool | Rotating beacon | `false` |
| `truck.lightsBrakeOn` | bool | Brake lights | `false` |
| `truck.lightsReverseOn` | bool | Reverse lights | `false` |
| `truck.lightsHazardWarningOn` | bool | Hazard lights | `false` |

#### Turn Signals
| Property | Type | Description | Range/Example |
|----------|------|-------------|---------------|
| `truck.blinkerLeftOn` | bool | Left signal switch on | `true` |
| `truck.blinkerRightOn` | bool | Right signal switch on | `false` |
| `truck.blinkerLeftActive` | bool | Left blinker flashing | `true` |
| `truck.blinkerRightActive` | bool | Right blinker flashing | `false` |

#### Input Controls
| Property | Type | Description | Range/Example |
|----------|------|-------------|---------------|
| `truck.steer` | float | Steering (raw) | `-1.0` to `1.0` |
| `truck.throttle` | float | Throttle (raw) | `0.0` to `1.0` |
| `truck.brake` | float | Brake (raw) | `0.0` to `1.0` |
| `truck.clutch` | float | Clutch (raw) | `0.0` to `1.0` |
| `truck.gameSteer` | float | Steering (gameplay) | `-1.0` to `1.0` |
| `truck.gameThrottle` | float | Throttle (gameplay) | `0.0` to `1.0` |
| `truck.gameBrake` | float | Brake (gameplay) | `0.0` to `1.0` |
| `truck.gameClutch` | float | Clutch (gameplay) | `0.0` to `1.0` |

> **Note:** `game*` variants reflect actual gameplay input after assists/automation.  
> Regular variants show raw controller input.

#### Damage & Wear
| Property | Type | Description | Range/Example |
|----------|------|-------------|---------------|
| `truck.wearEngine` | float | Engine wear | `0.0` to `1.0` (0-100%) |
| `truck.wearTransmission` | float | Transmission wear | `0.0` to `1.0` |
| `truck.wearCabin` | float | Cabin damage | `0.0` to `1.0` |
| `truck.wearChassis` | float | Chassis damage | `0.0` to `1.0` |
| `truck.wearWheels` | float | Wheel wear | `0.0` to `1.0` |
| `truck.wearTrailer` | float | Trailer damage | `0.0` to `1.0` |

#### Electric System
| Property | Type | Description | Range/Example |
|----------|------|-------------|---------------|
| `truck.electricOn` | bool | Electric system powered | `true` |
| `truck.engineOn` | bool | Engine running | `true` |
| `truck.batteryVoltage` | float | Battery voltage (V) | `24.0` - `28.0` |
| `truck.batteryVoltageWarningOn` | bool | Low battery warning | `false` |

#### Temperature
| Property | Type | Description | Range/Example |
|----------|------|-------------|---------------|
| `truck.waterTemperature` | float | Coolant temp (°C) | `0.0` - `100.0` |
| `truck.waterTemperatureWarningOn` | bool | Overheat warning | `false` |
| `truck.oilTemperature` | float | Oil temp (°C) | `0.0` - `120.0` |
| `truck.oilTemperatureWarningOn` | bool | Oil temp warning | `false` |
| `truck.oilPressure` | float | Oil pressure (PSI) | `0.0` - `100.0` |
| `truck.oilPressureWarningOn` | bool | Low oil pressure | `false` |

#### Differential Lock
| Property | Type | Description | Range/Example |
|----------|------|-------------|---------------|
| `truck.differentialLockOn` | bool | Diff lock engaged | `true` |

#### Truck Identification
| Property | Type | Description | Range/Example |
|----------|------|-------------|---------------|
| `truck.make` | string | Manufacturer | `"Volvo"`, `"Scania"`, `"MAN"` |
| `truck.makeId` | string | Manufacturer ID | `"volvo"` |
| `truck.model` | string | Model name | `"FH16"`, `"R 2009"` |
| `truck.id` | string | Unique truck ID | `"vehicle.volvo.fh16"` |
| `truck.licensePlate` | string | License plate | `"AB 12345"` |
| `truck.licensePlateCountry` | string | Plate country | `"sweden"` |
| `truck.licensePlateCountryId` | string | Country ID | `"se"` |

#### Position & Orientation
| Property | Type | Description | Range/Example |
|----------|------|-------------|---------------|
| `truck.x` | float | World X coordinate | `12345.67` |
| `truck.y` | float | World Y coordinate | `45.23` |
| `truck.z` | float | World Z coordinate | `-8765.43` |
| `truck.heading` | float | Heading (radians) | `0.0` to `6.28` |
| `truck.pitch` | float | Pitch angle (radians) | `-3.14` to `3.14` |
| `truck.roll` | float | Roll angle (radians) | `-3.14` to `3.14` |

#### Odometer
| Property | Type | Description | Range/Example |
|----------|------|-------------|---------------|
| `truck.odometer` | float | Total distance (km) | `154235.6` |

### Trailer Object

| Property | Type | Description | Range/Example |
|----------|------|-------------|---------------|
| `trailer.attached` | bool | Trailer connected | `true` |
| `trailer.id` | string | Trailer ID | `"scs.box.chassis_steel"` |
| `trailer.name` | string | Cargo/trailer name | `"Machinery"` |
| `trailer.mass` | float | Trailer weight (kg) | `25000.0` |
| `trailer.wear` | float | Trailer damage | `0.0` to `1.0` |
| `trailer.x` | float | Trailer X position | `12340.0` |
| `trailer.y` | float | Trailer Y position | `45.0` |
| `trailer.z` | float | Trailer Z position | `-8760.0` |
| `trailer.heading` | float | Trailer heading | `0.0` to `6.28` |
| `trailer.pitch` | float | Trailer pitch | `-3.14` to `3.14` |
| `trailer.roll` | float | Trailer roll | `-3.14` to `3.14` |

### Job Object

| Property | Type | Description | Range/Example |
|----------|------|-------------|---------------|
| `job.income` | int | Job payment (€) | `15420` |
| `job.deadlineTime` | datetime | Delivery deadline | `"0001-01-10T08:00:00Z"` |
| `job.remainingTime` | datetime | Time until deadline | `"0000-00-01T10:51:00Z"` |
| `job.sourceCity` | string | Departure city | `"Berlin"` |
| `job.sourceCityId` | string | City ID | `"berlin"` |
| `job.sourceCompany` | string | Pickup company | `"Tradeaux"` |
| `job.sourceCompanyId` | string | Company ID | `"tradeaux"` |
| `job.destinationCity` | string | Destination city | `"Praha"` |
| `job.destinationCityId` | string | City ID | `"praha"` |
| `job.destinationCompany` | string | Delivery company | `"Posped"` |
| `job.destinationCompanyId` | string | Company ID | `"posped"` |
| `job.cargo` | string | Cargo name | `"Furniture"` |
| `job.cargoId` | string | Cargo ID | `"furniture"` |
| `job.mass` | float | Cargo weight (kg) | `18000.0` |
| `job.isSpecial` | bool | Special transport | `false` |
| `job.plannedDistanceKm` | int | Route distance (km) | `623` |

### Navigation Object

| Property | Type | Description | Range/Example |
|----------|------|-------------|---------------|
| `navigation.estimatedTime` | datetime | ETA | `"0001-01-09T04:22:00Z"` |
| `navigation.estimatedDistance` | int | Distance to destination (m) | `456789` |
| `navigation.speedLimit` | float | Current speed limit (km/h) | `90.0` |

---

## 🎯 Custom Logic Properties

Since ETS2/ATS don't provide these directly, we calculate them:

### ABS Simulation
```javascript
const absActive = 
    (truck.gameBrake > 0.5) &&           // Hard braking
    (truck.speed * 3.6 > 30) &&          // Above 30 km/h
    (truck.airPressure > 65);            // Sufficient air pressure
```

**Why this works:**
- ABS activates during hard braking
- Only effective at speed
- Requires adequate air pressure

### TCS Simulation
```javascript
const rpmPercent = truck.engineRpm / truck.engineRpmMax;
const tcsActive = 
    (truck.gameThrottle > 0.6) &&        // Heavy throttle
    (truck.speed * 3.6 < 50) &&          // Low speed
    (rpmPercent > 0.7) &&                // High RPM
    (truck.gear > 0);                    // Forward gear
```

**Why this works:**
- TCS prevents wheel spin
- Most likely at low speed + high throttle
- High RPM with low speed = wheel slip

### Hazard Light Synchronization
```javascript
const hazardOn = truck.blinkerLeftOn && truck.blinkerRightOn;
if (hazardOn) {
    // Use leftBlinker as master timing for both sides
    leftSignal.active = truck.blinkerLeftActive;
    rightSignal.active = truck.blinkerLeftActive;
}
```

---

## 📝 Data Type Reference

| Type | Description | Example |
|------|-------------|---------|
| `bool` | Boolean (true/false) | `true` |
| `int` | Integer number | `42` |
| `float` | Floating point number | `3.14` |
| `string` | Text string | `"Hello"` |
| `datetime` | ISO 8601 timestamp | `"0001-01-09T12:00:00Z"` |

---

## 🔄 Unit Conversions

### Speed
```javascript
// m/s to km/h
const kmh = truck.speed * 3.6;

// m/s to mph
const mph = truck.speed * 2.23694;
```

### Weight
```javascript
// kg to metric tons
const tons = truck.mass / 1000;

// kg to pounds
const lbs = truck.mass * 2.20462;
```

### Angle
```javascript
// Radians to degrees
const degrees = radians * (180 / Math.PI);

// Degrees to radians
const radians = degrees * (Math.PI / 180);
```

### Temperature
```javascript
// Celsius to Fahrenheit
const fahrenheit = (celsius * 9/5) + 32;
```

---

## 📡 API Endpoint

All this data is available from:
```
HTTP GET http://localhost:25555/api/ets2/telemetry
```

Returns JSON object with all properties listed above.

### Example Response
```json
{
  "game": {
    "connected": true,
    "gameName": "ETS2",
    "paused": false,
    "time": "0001-01-08T21:09:00Z"
  },
  "truck": {
    "speed": 25.5,
    "engineRpm": 1450,
    "engineRpmMax": 2300,
    "displayedGear": 8,
    "make": "Volvo",
    "model": "FH16"
  },
  "job": {
    "sourceCity": "Berlin",
    "destinationCity": "Praha",
    "cargo": "Machinery",
    "income": 15420
  }
}
```

---

## 🔗 References

- **Funbit Telemetry Documentation**: https://github.com/Funbit/ets2-telemetry-server/blob/master/Telemetry.md
- **SCS SDK Documentation**: https://modding.scssoft.com/wiki/Documentation/Engine/SDK/Telemetry
- **ETS2 Modding Wiki**: https://modding.scssoft.com/

---

*Last updated: October 21, 2025*
*Compatible with: Funbit Telemetry Server v3.3.0+*

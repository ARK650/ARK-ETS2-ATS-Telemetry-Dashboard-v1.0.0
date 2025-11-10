# Available Truck Data from Funbit API

## ✅ Currently Used in Dashboard

### Engine & Performance
- `truck.engineRpm` - Current RPM (for RPM gauge)
- `truck.engineRpmMax` - Maximum RPM (for shift light)
- `truck.speed` - Speed in km/h (for speed indicator)
- `truck.displayedGear` - Displayed gear (for gear display)
- `truck.gear` - Physical gear
- `truck.forwardGears` - Total forward gears

### Controls & Input
- `truck.gameSteer` - Steering input (-1 to 1) (for steering wheel)
- `truck.gameThrottle` - Throttle input (0 to 1) (for throttle bar)
- `truck.gameBrake` - Brake input (0 to 1) (for brake bar)
- `truck.gameClutch` - Clutch input (0 to 1) (for clutch bar)

### Warning Lights
- `truck.parkBrakeOn` - Parking brake (warning icon)
- `truck.fuelWarningOn` - Low fuel warning (warning icon)
- `truck.blinkerLeftOn` - Left turn signal switch
- `truck.blinkerRightOn` - Right turn signal switch
- `truck.blinkerLeftActive` - Left blinker flashing
- `truck.blinkerRightActive` - Right blinker flashing
- `truck.lightsBeaconOn` - Rotating beacon (warning icon)
- `truck.differentialLockOn` - Diff lock (warning icon)
- `truck.motorBrakeOn` - Engine brake (warning icon)
- `truck.retarderBrake` - Retarder level (warning icon)
- `truck.airPressure` - Air pressure (for ABS logic)

### Truck Info
- `truck.make` - Manufacturer (e.g., "Volvo")
- `truck.model` - Model (e.g., "FH16")

### Fuel Data
- `truck.fuel` - Current fuel level (liters)
- `truck.fuelCapacity` - Tank capacity (liters)
- `truck.fuelAverageConsumption` - Average consumption (L/km)

---

## 🆕 Available But Not Used Yet

### Engine Details
- `truck.cruiseControlSpeed` - Cruise control target speed
- `truck.cruiseControlOn` - CC active status
- `truck.electricOn` - Electric system powered
- `truck.engineOn` - Engine running
- `truck.shifterType` - Transmission type ("manual", "automatic", etc.)
- `truck.reverseGears` - Number of reverse gears

### Temperature & Pressure
- `truck.waterTemperature` - Coolant temp (°C)
- `truck.waterTemperatureWarningOn` - Overheat warning
- `truck.oilTemperature` - Oil temp (°C)
- `truck.oilTemperatureWarningOn` - Oil temp warning
- `truck.oilPressure` - Oil pressure (PSI)
- `truck.oilPressureWarningOn` - Low oil pressure warning
- `truck.batteryVoltage` - Battery voltage (V)
- `truck.batteryVoltageWarningOn` - Low battery warning

### Advanced Braking
- `truck.retarderStepCount` - Available retarder levels
- `truck.airPressureWarningOn` - Low air pressure
- `truck.airPressureWarningValue` - Warning threshold
- `truck.airPressureEmergencyOn` - Emergency brake active
- `truck.airPressureEmergencyValue` - Emergency threshold

### All Lights
- `truck.lightsParking` - Parking lights
- `truck.lightsBeamLow` - Low beam
- `truck.lightsBeamHigh` - High beam
- `truck.lightsAuxFront` - Aux front lights
- `truck.lightsAuxRoof` - Roof lights
- `truck.lightsBrakeOn` - Brake lights
- `truck.lightsReverseOn` - Reverse lights
- `truck.lightsHazardWarningOn` - Hazard lights

### Damage & Wear
- `truck.wearEngine` - Engine wear (0.0 to 1.0)
- `truck.wearTransmission` - Transmission wear
- `truck.wearCabin` - Cabin damage
- `truck.wearChassis` - Chassis damage
- `truck.wearWheels` - Wheel wear
- `truck.wearTrailer` - Trailer damage

### Raw Input (Before Assists)
- `truck.steer` - Raw steering input
- `truck.throttle` - Raw throttle input
- `truck.brake` - Raw brake input
- `truck.clutch` - Raw clutch input

### AdBlue System
- `truck.adblue` - AdBlue level (liters)
- `truck.adblueCapacity` - AdBlue tank capacity
- `truck.adblueAverageConsumption` - AdBlue consumption rate
- `truck.adblueWarningOn` - Low AdBlue warning

### Speed Limits
- `truck.speedLimit` - Current speed limit (km/h)
- `navigation.speedLimit` - Navigation speed limit

### Position & Distance
- `truck.x` - World X coordinate
- `truck.y` - World Y coordinate
- `truck.z` - World Z coordinate
- `truck.heading` - Heading (radians)
- `truck.odometer` - Total distance traveled (km)

### Truck Identification
- `truck.makeId` - Manufacturer ID
- `truck.id` - Unique truck ID
- `truck.licensePlate` - License plate
- `truck.licensePlateCountry` - Plate country
- `truck.licensePlateCountryId` - Country ID

---

## 💡 Widget Ideas Using Available Data

### Gauge/Indicator Widgets
1. **Oil Pressure Gauge** - `truck.oilPressure` (PSI)
2. **Oil Temperature Gauge** - `truck.oilTemperature` (°C)
3. **Water Temperature Gauge** - `truck.waterTemperature` (°C)
4. **Battery Voltage Indicator** - `truck.batteryVoltage` (V)
5. **Air Pressure Gauge** - `truck.airPressure` (PSI)
6. **Fuel Level Gauge** - `truck.fuel / truck.fuelCapacity` (%)

### Status Displays
7. **Cruise Control Display** - Speed + On/Off status
8. **Damage/Wear Summary** - Combined wear percentage
9. **AdBlue Level** - With warning
10. **Speed Limit Indicator** - Current limit vs actual speed
11. **Odometer Display** - Total km driven
12. **Transmission Type** - Manual/Auto indicator

### Advanced Features
13. **Retarder Level Indicator** - Visual display of current level (0-3)
14. **Lights Status Panel** - All lights on/off (parking, beam, aux, etc.)
15. **Temperature Warning System** - Alert when temps too high
16. **Maintenance Reminder** - Based on wear levels
17. **Efficiency Score** - Based on fuel consumption, wear, etc.

---

## 🔧 Potential Calculated Metrics

Using available data, we could calculate:

1. **Fuel Range** - `(fuel / fuelAverageConsumption)` = km remaining
2. **Fuel Percentage** - `(fuel / fuelCapacity) * 100`
3. **Average Speed** - Track speed over time
4. **Time to Destination** - `(distance / averageSpeed)`
5. **Efficiency Rating** - Compare actual vs optimal consumption
6. **Wear Rate** - Track wear increase over time
7. **Uptime** - Time since engine started
8. **Idle Time** - Time at 0 speed with engine on

---

## ❌ NOT Available (Can't Be Used)

These properties are mentioned in documentation but NOT exposed by Funbit:

- `truck.pitch` - Truck pitch angle (would be useful for orientation)
- `truck.roll` - Truck roll angle (would be useful for orientation)
- Most acceleration data (accelerationX, accelerationY, accelerationZ)
- Trailer-specific wear/damage details
- Individual wheel data
- Suspension data
- Steering angle limits

---

## 📊 Summary

**Total Available Properties:**
- ✅ **25 properties** currently used
- 🆕 **50+ properties** available but not used
- ❌ **~10 properties** not available from API

**Best Candidates for New Widgets:**
1. Oil Pressure + Temperature (engine health)
2. Water Temperature (overheating warning)
3. Fuel Level Gauge (% remaining)
4. Air Pressure Gauge (brake system)
5. Cruise Control Display
6. Damage/Wear Summary

---

*Last updated: November 8, 2025*

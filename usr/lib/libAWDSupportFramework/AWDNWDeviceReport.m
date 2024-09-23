@implementation AWDNWDeviceReport

- (void)dealloc
{
  objc_super v3;

  -[AWDNWDeviceReport setBatteryAccumulator:](self, "setBatteryAccumulator:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDNWDeviceReport;
  -[AWDNWDeviceReport dealloc](&v3, sel_dealloc);
}

- (void)setBatteryPercentage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_batteryPercentage = a3;
}

- (void)setHasBatteryPercentage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasBatteryPercentage
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setBatteryCurrentCapacity:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_batteryCurrentCapacity = a3;
}

- (void)setHasBatteryCurrentCapacity:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasBatteryCurrentCapacity
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBatteryMaximumCapacity:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_batteryMaximumCapacity = a3;
}

- (void)setHasBatteryMaximumCapacity:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasBatteryMaximumCapacity
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBatteryDesignCapacity:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_batteryDesignCapacity = a3;
}

- (void)setHasBatteryDesignCapacity:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBatteryDesignCapacity
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setBatteryAbsoluteCapacity:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_batteryAbsoluteCapacity = a3;
}

- (void)setHasBatteryAbsoluteCapacity:(BOOL)a3
{
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBatteryAbsoluteCapacity
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setBatteryVoltage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_batteryVoltage = a3;
}

- (void)setHasBatteryVoltage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasBatteryVoltage
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setBatteryTimeRemaining:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_batteryTimeRemaining = a3;
}

- (void)setHasBatteryTimeRemaining:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBatteryTimeRemaining
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setBatteryExternalPowerIsConnected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_batteryExternalPowerIsConnected = a3;
}

- (void)setHasBatteryExternalPowerIsConnected:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasBatteryExternalPowerIsConnected
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setBatteryIsCharging:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_batteryIsCharging = a3;
}

- (void)setHasBatteryIsCharging:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasBatteryIsCharging
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setBatteryFullyCharged:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_batteryFullyCharged = a3;
}

- (void)setHasBatteryFullyCharged:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasBatteryFullyCharged
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setBatteryAtWarnLevel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_batteryAtWarnLevel = a3;
}

- (void)setHasBatteryAtWarnLevel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasBatteryAtWarnLevel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setBatteryAtCriticalLevel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_batteryAtCriticalLevel = a3;
}

- (void)setHasBatteryAtCriticalLevel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasBatteryAtCriticalLevel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setDevicePluggedIn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_devicePluggedIn = a3;
}

- (void)setHasDevicePluggedIn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasDevicePluggedIn
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setDeviceScreenOn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_deviceScreenOn = a3;
}

- (void)setHasDeviceScreenOn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasDeviceScreenOn
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (int)motionState
{
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    return self->_motionState;
  else
    return 0;
}

- (void)setMotionState:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_motionState = a3;
}

- (void)setHasMotionState:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasMotionState
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (id)motionStateAsString:(int)a3
{
  if (a3 >= 6)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DD30[a3];
}

- (int)StringAsMotionState:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_MOTION_STATE_UNKNOWN")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_MOTION_STATE_STATIONARY")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_MOTION_STATE_MOVING")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_MOTION_STATE_WALKING")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_MOTION_STATE_RUNNING")) & 1) != 0)
    return 4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_MOTION_STATE_VEHICULAR")))
    return 5;
  return 0;
}

- (int)thermalPressure
{
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    return self->_thermalPressure;
  else
    return 0;
}

- (void)setThermalPressure:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_thermalPressure = a3;
}

- (void)setHasThermalPressure:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasThermalPressure
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)thermalPressureAsString:(int)a3
{
  id result;

  if (a3 > 19)
  {
    if (a3 > 39)
    {
      if (a3 == 40)
        return CFSTR("NW_DEVICE_THERMAL_PRESSURE_TRAPPING");
      if (a3 == 50)
        return CFSTR("NW_DEVICE_THERMAL_PRESSURE_SLEEPING");
    }
    else
    {
      if (a3 == 20)
        return CFSTR("NW_DEVICE_THERMAL_PRESSURE_MODERATE");
      if (a3 == 30)
        return CFSTR("NW_DEVICE_THERMAL_PRESSURE_HEAVY");
    }
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  }
  else
  {
    result = CFSTR("NW_DEVICE_THERMAL_PRESSURE_NOMINAL");
    switch(a3)
    {
      case 0:
        return result;
      case 1:
        result = CFSTR("NW_DEVICE_THERMAL_PRESSURE_MODERATE_MAC");
        break;
      case 2:
        result = CFSTR("NW_DEVICE_THERMAL_PRESSURE_HEAVY_MAC");
        break;
      case 3:
        result = CFSTR("NW_DEVICE_THERMAL_PRESSURE_TRAPPING_MAC");
        break;
      case 4:
        result = CFSTR("NW_DEVICE_THERMAL_PRESSURE_SLEEPING_MAC");
        break;
      case 10:
        result = CFSTR("NW_DEVICE_THERMAL_PRESSURE_LIGHT");
        break;
      default:
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    }
  }
  return result;
}

- (int)StringAsThermalPressure:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_THERMAL_PRESSURE_NOMINAL")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_THERMAL_PRESSURE_MODERATE_MAC")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_THERMAL_PRESSURE_HEAVY_MAC")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_THERMAL_PRESSURE_TRAPPING_MAC")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_THERMAL_PRESSURE_SLEEPING_MAC")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_THERMAL_PRESSURE_LIGHT")) & 1) != 0)
    return 10;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_THERMAL_PRESSURE_MODERATE")) & 1) != 0)
    return 20;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_THERMAL_PRESSURE_HEAVY")) & 1) != 0)
    return 30;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_THERMAL_PRESSURE_TRAPPING")) & 1) != 0)
    return 40;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_THERMAL_PRESSURE_SLEEPING")))
    return 50;
  return 0;
}

- (int)cellularMode
{
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    return self->_cellularMode;
  else
    return 0;
}

- (void)setCellularMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_cellularMode = a3;
}

- (void)setHasCellularMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCellularMode
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)cellularModeAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DD60[a3];
}

- (int)StringAsCellularMode:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_CELLULAR_MODE_UNKNOWN")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_CELLULAR_MODE_OFF")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_CELLULAR_MODE_AUTO")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DEVICE_CELLULAR_MODE_ON")))
    return 3;
  return 0;
}

- (BOOL)hasBatteryAccumulator
{
  return self->_batteryAccumulator != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDNWDeviceReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDNWDeviceReport description](&v3, sel_description), -[AWDNWDeviceReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $076F708C0EA769010F5C0656953AFB31 has;
  uint64_t motionState;
  __CFString *v6;
  int thermalPressure;
  const __CFString *v8;
  uint64_t cellularMode;
  __CFString *v10;
  AWDNWAccumulator *batteryAccumulator;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_batteryPercentage), CFSTR("batteryPercentage"));
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_batteryCurrentCapacity), CFSTR("batteryCurrentCapacity"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_batteryMaximumCapacity), CFSTR("batteryMaximumCapacity"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_batteryDesignCapacity), CFSTR("batteryDesignCapacity"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_batteryAbsoluteCapacity), CFSTR("batteryAbsoluteCapacity"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_batteryVoltage), CFSTR("batteryVoltage"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_batteryTimeRemaining), CFSTR("batteryTimeRemaining"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_batteryExternalPowerIsConnected), CFSTR("batteryExternalPowerIsConnected"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_batteryIsCharging), CFSTR("batteryIsCharging"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_batteryFullyCharged), CFSTR("batteryFullyCharged"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_batteryAtWarnLevel), CFSTR("batteryAtWarnLevel"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_batteryAtCriticalLevel), CFSTR("batteryAtCriticalLevel"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_devicePluggedIn), CFSTR("devicePluggedIn"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_deviceScreenOn), CFSTR("deviceScreenOn"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
LABEL_37:
    thermalPressure = self->_thermalPressure;
    if (thermalPressure > 19)
    {
      if (thermalPressure > 39)
      {
        if (thermalPressure == 40)
        {
          v8 = CFSTR("NW_DEVICE_THERMAL_PRESSURE_TRAPPING");
          goto LABEL_54;
        }
        if (thermalPressure == 50)
        {
          v8 = CFSTR("NW_DEVICE_THERMAL_PRESSURE_SLEEPING");
          goto LABEL_54;
        }
      }
      else
      {
        if (thermalPressure == 20)
        {
          v8 = CFSTR("NW_DEVICE_THERMAL_PRESSURE_MODERATE");
          goto LABEL_54;
        }
        if (thermalPressure == 30)
        {
          v8 = CFSTR("NW_DEVICE_THERMAL_PRESSURE_HEAVY");
          goto LABEL_54;
        }
      }
LABEL_53:
      v8 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_thermalPressure);
    }
    else
    {
      v8 = CFSTR("NW_DEVICE_THERMAL_PRESSURE_NOMINAL");
      switch(thermalPressure)
      {
        case 0:
          break;
        case 1:
          v8 = CFSTR("NW_DEVICE_THERMAL_PRESSURE_MODERATE_MAC");
          break;
        case 2:
          v8 = CFSTR("NW_DEVICE_THERMAL_PRESSURE_HEAVY_MAC");
          break;
        case 3:
          v8 = CFSTR("NW_DEVICE_THERMAL_PRESSURE_TRAPPING_MAC");
          break;
        case 4:
          v8 = CFSTR("NW_DEVICE_THERMAL_PRESSURE_SLEEPING_MAC");
          break;
        case 10:
          v8 = CFSTR("NW_DEVICE_THERMAL_PRESSURE_LIGHT");
          break;
        default:
          goto LABEL_53;
      }
    }
LABEL_54:
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("thermalPressure"));
    if ((*(_DWORD *)&self->_has & 0x80) == 0)
      goto LABEL_59;
LABEL_55:
    cellularMode = self->_cellularMode;
    if (cellularMode >= 4)
      v10 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cellularMode);
    else
      v10 = off_24C10DD60[cellularMode];
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("cellularMode"));
    goto LABEL_59;
  }
LABEL_33:
  motionState = self->_motionState;
  if (motionState >= 6)
    v6 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_motionState);
  else
    v6 = off_24C10DD30[motionState];
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("motionState"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
    goto LABEL_37;
LABEL_17:
  if ((*(_BYTE *)&has & 0x80) != 0)
    goto LABEL_55;
LABEL_59:
  batteryAccumulator = self->_batteryAccumulator;
  if (batteryAccumulator)
    objc_msgSend(v3, "setObject:forKey:", -[AWDNWAccumulator dictionaryRepresentation](batteryAccumulator, "dictionaryRepresentation"), CFSTR("batteryAccumulator"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNWDeviceReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $076F708C0EA769010F5C0656953AFB31 has;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
LABEL_18:
    PBDataWriterWriteInt32Field();
LABEL_19:
  if (self->_batteryAccumulator)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  $076F708C0EA769010F5C0656953AFB31 has;
  AWDNWAccumulator *batteryAccumulator;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 9) = self->_batteryPercentage;
    *((_DWORD *)a3 + 17) |= 0x10u;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_batteryCurrentCapacity;
  *((_DWORD *)a3 + 17) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 8) = self->_batteryMaximumCapacity;
  *((_DWORD *)a3 + 17) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 7) = self->_batteryDesignCapacity;
  *((_DWORD *)a3 + 17) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 2) = self->_batteryAbsoluteCapacity;
  *((_DWORD *)a3 + 17) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 11) = self->_batteryVoltage;
  *((_DWORD *)a3 + 17) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 10) = self->_batteryTimeRemaining;
  *((_DWORD *)a3 + 17) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  *((_BYTE *)a3 + 62) = self->_batteryExternalPowerIsConnected;
  *((_DWORD *)a3 + 17) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  *((_BYTE *)a3 + 64) = self->_batteryIsCharging;
  *((_DWORD *)a3 + 17) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  *((_BYTE *)a3 + 63) = self->_batteryFullyCharged;
  *((_DWORD *)a3 + 17) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  *((_BYTE *)a3 + 61) = self->_batteryAtWarnLevel;
  *((_DWORD *)a3 + 17) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  *((_BYTE *)a3 + 60) = self->_batteryAtCriticalLevel;
  *((_DWORD *)a3 + 17) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  *((_BYTE *)a3 + 65) = self->_devicePluggedIn;
  *((_DWORD *)a3 + 17) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  *((_BYTE *)a3 + 66) = self->_deviceScreenOn;
  *((_DWORD *)a3 + 17) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 13) = self->_motionState;
  *((_DWORD *)a3 + 17) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_36:
  *((_DWORD *)a3 + 14) = self->_thermalPressure;
  *((_DWORD *)a3 + 17) |= 0x200u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_18:
    *((_DWORD *)a3 + 12) = self->_cellularMode;
    *((_DWORD *)a3 + 17) |= 0x80u;
  }
LABEL_19:
  batteryAccumulator = self->_batteryAccumulator;
  if (batteryAccumulator)
    objc_msgSend(a3, "setBatteryAccumulator:", batteryAccumulator);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  $076F708C0EA769010F5C0656953AFB31 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_batteryPercentage;
    *(_DWORD *)(v5 + 68) |= 0x10u;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_batteryCurrentCapacity;
  *(_DWORD *)(v5 + 68) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 32) = self->_batteryMaximumCapacity;
  *(_DWORD *)(v5 + 68) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 28) = self->_batteryDesignCapacity;
  *(_DWORD *)(v5 + 68) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 8) = self->_batteryAbsoluteCapacity;
  *(_DWORD *)(v5 + 68) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 44) = self->_batteryVoltage;
  *(_DWORD *)(v5 + 68) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 40) = self->_batteryTimeRemaining;
  *(_DWORD *)(v5 + 68) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *(_BYTE *)(v5 + 62) = self->_batteryExternalPowerIsConnected;
  *(_DWORD *)(v5 + 68) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *(_BYTE *)(v5 + 64) = self->_batteryIsCharging;
  *(_DWORD *)(v5 + 68) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  *(_BYTE *)(v5 + 63) = self->_batteryFullyCharged;
  *(_DWORD *)(v5 + 68) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  *(_BYTE *)(v5 + 61) = self->_batteryAtWarnLevel;
  *(_DWORD *)(v5 + 68) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  *(_BYTE *)(v5 + 60) = self->_batteryAtCriticalLevel;
  *(_DWORD *)(v5 + 68) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  *(_BYTE *)(v5 + 65) = self->_devicePluggedIn;
  *(_DWORD *)(v5 + 68) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  *(_BYTE *)(v5 + 66) = self->_deviceScreenOn;
  *(_DWORD *)(v5 + 68) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
LABEL_35:
    *(_DWORD *)(v5 + 56) = self->_thermalPressure;
    *(_DWORD *)(v5 + 68) |= 0x200u;
    if ((*(_DWORD *)&self->_has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_34:
  *(_DWORD *)(v5 + 52) = self->_motionState;
  *(_DWORD *)(v5 + 68) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
    goto LABEL_35;
LABEL_17:
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_18:
    *(_DWORD *)(v5 + 48) = self->_cellularMode;
    *(_DWORD *)(v5 + 68) |= 0x80u;
  }
LABEL_19:

  v6[2] = -[AWDNWAccumulator copyWithZone:](self->_batteryAccumulator, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $076F708C0EA769010F5C0656953AFB31 has;
  int v7;
  AWDNWAccumulator *batteryAccumulator;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = self->_has;
  v7 = *((_DWORD *)a3 + 17);
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_batteryPercentage != *((_DWORD *)a3 + 9))
      goto LABEL_110;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_batteryCurrentCapacity != *((_DWORD *)a3 + 6))
      goto LABEL_110;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_batteryMaximumCapacity != *((_DWORD *)a3 + 8))
      goto LABEL_110;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_batteryDesignCapacity != *((_DWORD *)a3 + 7))
      goto LABEL_110;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_batteryAbsoluteCapacity != *((_DWORD *)a3 + 2))
      goto LABEL_110;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_batteryVoltage != *((_DWORD *)a3 + 11))
      goto LABEL_110;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_batteryTimeRemaining != *((_DWORD *)a3 + 10))
      goto LABEL_110;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0)
      goto LABEL_110;
    if (self->_batteryExternalPowerIsConnected)
    {
      if (!*((_BYTE *)a3 + 62))
        goto LABEL_110;
    }
    else if (*((_BYTE *)a3 + 62))
    {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0)
      goto LABEL_110;
    if (self->_batteryIsCharging)
    {
      if (!*((_BYTE *)a3 + 64))
        goto LABEL_110;
    }
    else if (*((_BYTE *)a3 + 64))
    {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0)
      goto LABEL_110;
    if (self->_batteryFullyCharged)
    {
      if (!*((_BYTE *)a3 + 63))
        goto LABEL_110;
    }
    else if (*((_BYTE *)a3 + 63))
    {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0)
      goto LABEL_110;
    if (self->_batteryAtWarnLevel)
    {
      if (!*((_BYTE *)a3 + 61))
        goto LABEL_110;
    }
    else if (*((_BYTE *)a3 + 61))
    {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0)
      goto LABEL_110;
    if (self->_batteryAtCriticalLevel)
    {
      if (!*((_BYTE *)a3 + 60))
        goto LABEL_110;
    }
    else if (*((_BYTE *)a3 + 60))
    {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0)
      goto LABEL_110;
    if (self->_devicePluggedIn)
    {
      if (!*((_BYTE *)a3 + 65))
        goto LABEL_110;
    }
    else if (*((_BYTE *)a3 + 65))
    {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    if ((v7 & 0x10000) != 0)
      goto LABEL_110;
    goto LABEL_93;
  }
  if ((v7 & 0x10000) == 0)
    goto LABEL_110;
  if (self->_deviceScreenOn)
  {
    if (!*((_BYTE *)a3 + 66))
      goto LABEL_110;
    goto LABEL_93;
  }
  if (*((_BYTE *)a3 + 66))
  {
LABEL_110:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_93:
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_motionState != *((_DWORD *)a3 + 13))
      goto LABEL_110;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_thermalPressure != *((_DWORD *)a3 + 14))
      goto LABEL_110;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_cellularMode != *((_DWORD *)a3 + 12))
      goto LABEL_110;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_110;
  }
  batteryAccumulator = self->_batteryAccumulator;
  if ((unint64_t)batteryAccumulator | *((_QWORD *)a3 + 2))
    LOBYTE(v5) = -[AWDNWAccumulator isEqual:](batteryAccumulator, "isEqual:");
  else
    LOBYTE(v5) = 1;
  return v5;
}

- (unint64_t)hash
{
  $076F708C0EA769010F5C0656953AFB31 has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    v3 = 2654435761 * self->_batteryPercentage;
    if ((*(_BYTE *)&has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_batteryCurrentCapacity;
      if ((*(_BYTE *)&has & 8) != 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_batteryMaximumCapacity;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  v5 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_batteryDesignCapacity;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  v6 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_batteryAbsoluteCapacity;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  v7 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_batteryVoltage;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  v8 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_batteryTimeRemaining;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  v9 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_batteryExternalPowerIsConnected;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  v10 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_batteryIsCharging;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  v11 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_batteryFullyCharged;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  v12 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_batteryAtWarnLevel;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  v13 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_batteryAtCriticalLevel;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  v14 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_devicePluggedIn;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_deviceScreenOn;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  v16 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_motionState;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_17;
LABEL_34:
    v18 = 0;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_18;
LABEL_35:
    v19 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ -[AWDNWAccumulator hash](self->_batteryAccumulator, "hash");
  }
LABEL_33:
  v17 = 0;
  if ((*(_WORD *)&has & 0x200) == 0)
    goto LABEL_34;
LABEL_17:
  v18 = 2654435761 * self->_thermalPressure;
  if ((*(_BYTE *)&has & 0x80) == 0)
    goto LABEL_35;
LABEL_18:
  v19 = 2654435761 * self->_cellularMode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ -[AWDNWAccumulator hash](self->_batteryAccumulator, "hash");
}

- (void)mergeFrom:(id)a3
{
  int v3;
  uint64_t v4;

  v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x10) != 0)
  {
    self->_batteryPercentage = *((_DWORD *)a3 + 9);
    *(_DWORD *)&self->_has |= 0x10u;
    v3 = *((_DWORD *)a3 + 17);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_batteryCurrentCapacity = *((_DWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 2u;
  v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  self->_batteryMaximumCapacity = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 8u;
  v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 1) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  self->_batteryDesignCapacity = *((_DWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 4u;
  v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 1) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  self->_batteryAbsoluteCapacity = *((_DWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 1u;
  v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  self->_batteryVoltage = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x40u;
  v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  self->_batteryTimeRemaining = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x20u;
  v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x1000) == 0)
  {
LABEL_9:
    if ((v3 & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  self->_batteryExternalPowerIsConnected = *((_BYTE *)a3 + 62);
  *(_DWORD *)&self->_has |= 0x1000u;
  v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x4000) == 0)
  {
LABEL_10:
    if ((v3 & 0x2000) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  self->_batteryIsCharging = *((_BYTE *)a3 + 64);
  *(_DWORD *)&self->_has |= 0x4000u;
  v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x2000) == 0)
  {
LABEL_11:
    if ((v3 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  self->_batteryFullyCharged = *((_BYTE *)a3 + 63);
  *(_DWORD *)&self->_has |= 0x2000u;
  v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x800) == 0)
  {
LABEL_12:
    if ((v3 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  self->_batteryAtWarnLevel = *((_BYTE *)a3 + 61);
  *(_DWORD *)&self->_has |= 0x800u;
  v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x400) == 0)
  {
LABEL_13:
    if ((v3 & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  self->_batteryAtCriticalLevel = *((_BYTE *)a3 + 60);
  *(_DWORD *)&self->_has |= 0x400u;
  v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x8000) == 0)
  {
LABEL_14:
    if ((v3 & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  self->_devicePluggedIn = *((_BYTE *)a3 + 65);
  *(_DWORD *)&self->_has |= 0x8000u;
  v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x10000) == 0)
  {
LABEL_15:
    if ((v3 & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  self->_deviceScreenOn = *((_BYTE *)a3 + 66);
  *(_DWORD *)&self->_has |= 0x10000u;
  v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x100) == 0)
  {
LABEL_16:
    if ((v3 & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  self->_motionState = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x100u;
  v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x200) == 0)
  {
LABEL_17:
    if ((v3 & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_37:
  self->_thermalPressure = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x200u;
  if ((*((_DWORD *)a3 + 17) & 0x80) != 0)
  {
LABEL_18:
    self->_cellularMode = *((_DWORD *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x80u;
  }
LABEL_19:
  v4 = *((_QWORD *)a3 + 2);
  if (self->_batteryAccumulator)
  {
    if (v4)
      -[AWDNWAccumulator mergeFrom:](self->_batteryAccumulator, "mergeFrom:");
  }
  else if (v4)
  {
    -[AWDNWDeviceReport setBatteryAccumulator:](self, "setBatteryAccumulator:");
  }
}

- (unsigned)batteryPercentage
{
  return self->_batteryPercentage;
}

- (unsigned)batteryCurrentCapacity
{
  return self->_batteryCurrentCapacity;
}

- (unsigned)batteryMaximumCapacity
{
  return self->_batteryMaximumCapacity;
}

- (unsigned)batteryDesignCapacity
{
  return self->_batteryDesignCapacity;
}

- (unsigned)batteryAbsoluteCapacity
{
  return self->_batteryAbsoluteCapacity;
}

- (unsigned)batteryVoltage
{
  return self->_batteryVoltage;
}

- (unsigned)batteryTimeRemaining
{
  return self->_batteryTimeRemaining;
}

- (BOOL)batteryExternalPowerIsConnected
{
  return self->_batteryExternalPowerIsConnected;
}

- (BOOL)batteryIsCharging
{
  return self->_batteryIsCharging;
}

- (BOOL)batteryFullyCharged
{
  return self->_batteryFullyCharged;
}

- (BOOL)batteryAtWarnLevel
{
  return self->_batteryAtWarnLevel;
}

- (BOOL)batteryAtCriticalLevel
{
  return self->_batteryAtCriticalLevel;
}

- (BOOL)devicePluggedIn
{
  return self->_devicePluggedIn;
}

- (BOOL)deviceScreenOn
{
  return self->_deviceScreenOn;
}

- (AWDNWAccumulator)batteryAccumulator
{
  return self->_batteryAccumulator;
}

- (void)setBatteryAccumulator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end

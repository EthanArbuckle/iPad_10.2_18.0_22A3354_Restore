@implementation W5PowerStatus

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("Power Source Type: %@\n"), W5DescriptionForPowerSourceType(self->_powerSourceType));
  objc_msgSend(v3, "appendFormat:", CFSTR("Internal Battery Level: %.0f\n"), *(_QWORD *)&self->_internalBatteryLevel);
  objc_msgSend(v3, "appendFormat:", CFSTR("Battery Warning Level: %@\n"), W5DescriptionForBatteryWarningLevel(self->_batteryWarningLevel));
  objc_msgSend(v3, "appendFormat:", CFSTR("Power State: %@\n"), W5DescriptionForPowerStateCaps());
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5PowerStatus;
  if (-[W5PowerStatus conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (BOOL)isEqualToPowerStatus:(id)a3
{
  int64_t powerSourceType;
  int batteryWarningLevel;
  unsigned int powerStateCaps;
  unint64_t internalBatteryLevel;
  double v9;

  powerSourceType = self->_powerSourceType;
  if (powerSourceType != objc_msgSend(a3, "powerSourceType"))
    return 0;
  batteryWarningLevel = self->_batteryWarningLevel;
  if (batteryWarningLevel != objc_msgSend(a3, "batteryWarningLevel"))
    return 0;
  powerStateCaps = self->_powerStateCaps;
  if (powerStateCaps != objc_msgSend(a3, "powerStateCaps"))
    return 0;
  internalBatteryLevel = (unint64_t)self->_internalBatteryLevel;
  objc_msgSend(a3, "internalBatteryLevel");
  return internalBatteryLevel == (unint64_t)v9;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[W5PowerStatus isEqualToPowerStatus:](self, "isEqualToPowerStatus:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  int64_t v2;

  v2 = self->_powerSourceType ^ self->_batteryWarningLevel ^ self->_powerStateCaps;
  return v2 ^ objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_internalBatteryLevel), "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5PowerStatus *v4;

  v4 = -[W5PowerStatus init](+[W5PowerStatus allocWithZone:](W5PowerStatus, "allocWithZone:", a3), "init");
  -[W5PowerStatus setPowerSourceType:](v4, "setPowerSourceType:", self->_powerSourceType);
  -[W5PowerStatus setBatteryWarningLevel:](v4, "setBatteryWarningLevel:", self->_batteryWarningLevel);
  -[W5PowerStatus setPowerStateCaps:](v4, "setPowerStateCaps:", self->_powerStateCaps);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_powerSourceType, CFSTR("_powerSourceType"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_batteryWarningLevel, CFSTR("_batteryWarningLevel"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_internalBatteryLevel"), self->_internalBatteryLevel);
  objc_msgSend(a3, "encodeInt:forKey:", self->_powerStateCaps, CFSTR("_powerStateCaps"));
}

- (W5PowerStatus)initWithCoder:(id)a3
{
  W5PowerStatus *v4;
  float v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)W5PowerStatus;
  v4 = -[W5PowerStatus init](&v7, sel_init);
  if (v4)
  {
    v4->_powerSourceType = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_powerSourceType"));
    v4->_batteryWarningLevel = objc_msgSend(a3, "decodeIntForKey:", CFSTR("_batteryWarningLevel"));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("_internalBatteryLevel"));
    v4->_internalBatteryLevel = v5;
    v4->_powerStateCaps = objc_msgSend(a3, "decodeIntForKey:", CFSTR("_powerStateCaps"));
  }
  return v4;
}

- (int64_t)powerSourceType
{
  return self->_powerSourceType;
}

- (void)setPowerSourceType:(int64_t)a3
{
  self->_powerSourceType = a3;
}

- (int)batteryWarningLevel
{
  return self->_batteryWarningLevel;
}

- (void)setBatteryWarningLevel:(int)a3
{
  self->_batteryWarningLevel = a3;
}

- (double)internalBatteryLevel
{
  return self->_internalBatteryLevel;
}

- (void)setInternalBatteryLevel:(double)a3
{
  self->_internalBatteryLevel = a3;
}

- (unsigned)powerStateCaps
{
  return self->_powerStateCaps;
}

- (void)setPowerStateCaps:(unsigned int)a3
{
  self->_powerStateCaps = a3;
}

@end

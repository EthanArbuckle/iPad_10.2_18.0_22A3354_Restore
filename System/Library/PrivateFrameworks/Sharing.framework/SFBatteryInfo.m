@implementation SFBatteryInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFBatteryInfo)initWithCoder:(id)a3
{
  id v4;
  SFBatteryInfo *v5;
  double v6;
  SFBatteryInfo *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFBatteryInfo;
  v5 = -[SFBatteryInfo init](&v9, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("batteryLevel")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("batteryLevel"));
      v5->_batteryLevel = v6;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("batteryState")))
      v5->_batteryState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batteryState"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("batteryType")))
      v5->_batteryType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batteryType"));
    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double batteryLevel;
  id v5;

  batteryLevel = self->_batteryLevel;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("batteryLevel"), batteryLevel);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_batteryState, CFSTR("batteryState"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_batteryType, CFSTR("batteryType"));

}

- (id)description
{
  return (id)NSPrintF();
}

- (double)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(double)a3
{
  self->_batteryLevel = a3;
}

- (int64_t)batteryState
{
  return self->_batteryState;
}

- (void)setBatteryState:(int64_t)a3
{
  self->_batteryState = a3;
}

- (int64_t)batteryType
{
  return self->_batteryType;
}

- (void)setBatteryType:(int64_t)a3
{
  self->_batteryType = a3;
}

@end

@implementation SFPowerSourceLEDInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPowerSourceLEDInfo)initWithCoder:(id)a3
{
  id v4;
  SFPowerSourceLEDInfo *v5;
  SFPowerSourceLEDInfo *v6;
  objc_super v8;
  uint64_t v9;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFPowerSourceLEDInfo;
  v5 = -[SFPowerSourceLEDInfo init](&v8, sel_init);
  if (v5)
  {
    v9 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_LEDState = v9;
    v9 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_LEDColor = v9;
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t LEDState;
  uint64_t LEDColor;
  id v7;

  v4 = a3;
  LEDState = self->_LEDState;
  v7 = v4;
  if ((_DWORD)LEDState)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", LEDState, CFSTR("state"));
    v4 = v7;
  }
  LEDColor = self->_LEDColor;
  if ((_DWORD)LEDColor)
  {
    objc_msgSend(v7, "encodeInteger:forKey:", LEDColor, CFSTR("color"));
    v4 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int LEDState;
  int LEDColor;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    LEDState = self->_LEDState;
    if (LEDState == objc_msgSend(v5, "LEDState"))
    {
      LEDColor = self->_LEDColor;
      v8 = LEDColor == objc_msgSend(v5, "LEDColor");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_LEDColor ^ self->_LEDState;
}

- (id)description
{
  id v2;
  id v3;
  id v4;

  NSAppendPrintF();
  v2 = 0;
  NSAppendPrintF();
  v3 = v2;

  NSAppendPrintF();
  v4 = v3;

  return v4;
}

- (int)LEDColor
{
  return self->_LEDColor;
}

- (void)setLEDColor:(int)a3
{
  self->_LEDColor = a3;
}

- (int)LEDState
{
  return self->_LEDState;
}

- (void)setLEDState:(int)a3
{
  self->_LEDState = a3;
}

@end

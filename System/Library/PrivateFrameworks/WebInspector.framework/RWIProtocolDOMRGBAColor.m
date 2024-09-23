@implementation RWIProtocolDOMRGBAColor

- (RWIProtocolDOMRGBAColor)initWithR:(int)a3 g:(int)a4 b:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  RWIProtocolDOMRGBAColor *v8;
  RWIProtocolDOMRGBAColor *v9;
  RWIProtocolDOMRGBAColor *v10;
  objc_super v12;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)RWIProtocolDOMRGBAColor;
  v8 = -[RWIProtocolJSONObject init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[RWIProtocolDOMRGBAColor setR:](v8, "setR:", v7);
    -[RWIProtocolDOMRGBAColor setG:](v9, "setG:", v6);
    -[RWIProtocolDOMRGBAColor setB:](v9, "setB:", v5);
    v10 = v9;
  }

  return v9;
}

- (void)setR:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMRGBAColor;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("r"));
}

- (int)r
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMRGBAColor;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("r"));
}

- (void)setG:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMRGBAColor;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("g"));
}

- (int)g
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMRGBAColor;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("g"));
}

- (void)setB:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMRGBAColor;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("b"));
}

- (int)b
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMRGBAColor;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("b"));
}

- (void)setA:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMRGBAColor;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("a"), a3);
}

- (double)a
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMRGBAColor;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("a"));
  return result;
}

@end

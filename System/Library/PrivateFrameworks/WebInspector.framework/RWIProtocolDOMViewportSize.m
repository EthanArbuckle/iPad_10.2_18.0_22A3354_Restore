@implementation RWIProtocolDOMViewportSize

- (RWIProtocolDOMViewportSize)initWithWidth:(double)a3 height:(double)a4
{
  RWIProtocolDOMViewportSize *v6;
  RWIProtocolDOMViewportSize *v7;
  RWIProtocolDOMViewportSize *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RWIProtocolDOMViewportSize;
  v6 = -[RWIProtocolJSONObject init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[RWIProtocolDOMViewportSize setWidth:](v6, "setWidth:", a3);
    -[RWIProtocolDOMViewportSize setHeight:](v7, "setHeight:", a4);
    v8 = v7;
  }

  return v7;
}

- (void)setWidth:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMViewportSize;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("width"), a3);
}

- (double)width
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMViewportSize;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("width"));
  return result;
}

- (void)setHeight:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMViewportSize;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("height"), a3);
}

- (double)height
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMViewportSize;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("height"));
  return result;
}

@end

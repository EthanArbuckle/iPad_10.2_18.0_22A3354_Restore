@implementation RWIProtocolDOMVideoColorSpace

- (void)setFullRange:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoColorSpace;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("fullRange"));
}

- (BOOL)fullRange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoColorSpace;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("fullRange"));
}

- (void)setMatrix:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoColorSpace;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("matrix"));
}

- (NSString)matrix
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoColorSpace;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("matrix"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setPrimaries:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoColorSpace;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("primaries"));
}

- (NSString)primaries
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoColorSpace;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("primaries"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setTransfer:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoColorSpace;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("transfer"));
}

- (NSString)transfer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoColorSpace;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("transfer"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end

@implementation RWIProtocolCSSFontVariationAxis

- (RWIProtocolCSSFontVariationAxis)initWithTag:(id)a3 minimumValue:(double)a4 maximumValue:(double)a5 defaultValue:(double)a6
{
  id v10;
  RWIProtocolCSSFontVariationAxis *v11;
  RWIProtocolCSSFontVariationAxis *v12;
  objc_super v14;

  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSFontVariationAxis;
  v11 = -[RWIProtocolJSONObject init](&v14, sel_init);
  if (v11)
  {
    if (!v10)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("tag"));
    -[RWIProtocolCSSFontVariationAxis setTag:](v11, "setTag:", v10);
    -[RWIProtocolCSSFontVariationAxis setMinimumValue:](v11, "setMinimumValue:", a4);
    -[RWIProtocolCSSFontVariationAxis setMaximumValue:](v11, "setMaximumValue:", a5);
    -[RWIProtocolCSSFontVariationAxis setDefaultValue:](v11, "setDefaultValue:", a6);
    v12 = v11;
  }

  return v11;
}

- (void)setName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSFontVariationAxis;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("name"));
}

- (NSString)name
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSFontVariationAxis;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("name"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setTag:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSFontVariationAxis;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("tag"));
}

- (NSString)tag
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSFontVariationAxis;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("tag"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setMinimumValue:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSFontVariationAxis;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("minimumValue"), a3);
}

- (double)minimumValue
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSFontVariationAxis;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("minimumValue"));
  return result;
}

- (void)setMaximumValue:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSFontVariationAxis;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("maximumValue"), a3);
}

- (double)maximumValue
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSFontVariationAxis;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("maximumValue"));
  return result;
}

- (void)setDefaultValue:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSFontVariationAxis;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("defaultValue"), a3);
}

- (double)defaultValue
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSFontVariationAxis;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("defaultValue"));
  return result;
}

@end

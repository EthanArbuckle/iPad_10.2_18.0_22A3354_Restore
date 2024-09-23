@implementation RWIProtocolCSSShorthandEntry

- (RWIProtocolCSSShorthandEntry)initWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  RWIProtocolCSSShorthandEntry *v8;
  RWIProtocolCSSShorthandEntry *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RWIProtocolCSSShorthandEntry;
  v8 = -[RWIProtocolJSONObject init](&v11, sel_init);
  if (v8)
  {
    if (!v6)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("name"));
    if (!v7)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("value"));
    -[RWIProtocolCSSShorthandEntry setName:](v8, "setName:", v6);
    -[RWIProtocolCSSShorthandEntry setValue:](v8, "setValue:", v7);
    v9 = v8;
  }

  return v8;
}

- (void)setName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSShorthandEntry;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("name"));
}

- (NSString)name
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSShorthandEntry;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("name"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSShorthandEntry;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("value"));
}

- (NSString)value
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSShorthandEntry;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("value"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end

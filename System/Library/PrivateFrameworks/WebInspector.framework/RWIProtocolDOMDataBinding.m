@implementation RWIProtocolDOMDataBinding

- (RWIProtocolDOMDataBinding)initWithBinding:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  RWIProtocolDOMDataBinding *v8;
  RWIProtocolDOMDataBinding *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RWIProtocolDOMDataBinding;
  v8 = -[RWIProtocolJSONObject init](&v11, sel_init);
  if (v8)
  {
    if (!v6)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("binding"));
    if (!v7)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("value"));
    -[RWIProtocolDOMDataBinding setBinding:](v8, "setBinding:", v6);
    -[RWIProtocolDOMDataBinding setValue:](v8, "setValue:", v7);
    v9 = v8;
  }

  return v8;
}

- (void)setBinding:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMDataBinding;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("binding"));
}

- (NSString)binding
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMDataBinding;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("binding"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setType:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMDataBinding;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("type"));
}

- (NSString)type
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMDataBinding;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("type"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMDataBinding;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("value"));
}

- (NSString)value
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMDataBinding;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("value"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end

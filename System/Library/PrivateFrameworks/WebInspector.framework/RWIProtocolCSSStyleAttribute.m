@implementation RWIProtocolCSSStyleAttribute

- (RWIProtocolCSSStyleAttribute)initWithName:(id)a3 style:(id)a4
{
  id v6;
  id v7;
  RWIProtocolCSSStyleAttribute *v8;
  RWIProtocolCSSStyleAttribute *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RWIProtocolCSSStyleAttribute;
  v8 = -[RWIProtocolJSONObject init](&v11, sel_init);
  if (v8)
  {
    if (!v6)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("name"));
    if (!v7)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("style"));
    -[RWIProtocolCSSStyleAttribute setName:](v8, "setName:", v6);
    -[RWIProtocolCSSStyleAttribute setStyle:](v8, "setStyle:", v7);
    v9 = v8;
  }

  return v8;
}

- (void)setName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleAttribute;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("name"));
}

- (NSString)name
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleAttribute;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("name"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setStyle:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleAttribute;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("style"));
}

- (RWIProtocolCSSStyle)style
{
  void *v3;
  RWIProtocolCSSStyle *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolCSSStyle *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSStyleAttribute;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("style"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolCSSStyle alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolCSSStyleAttribute;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("style"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toJSONObject");
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = -[RWIProtocolJSONObject initWithJSONObject:](v4, "initWithJSONObject:", &v13);
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v8;
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v9;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end

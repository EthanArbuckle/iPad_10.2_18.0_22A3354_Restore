@implementation RWIProtocolCSSPropertyInfo

- (RWIProtocolCSSPropertyInfo)initWithName:(id)a3
{
  id v4;
  RWIProtocolCSSPropertyInfo *v5;
  RWIProtocolCSSPropertyInfo *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolCSSPropertyInfo;
  v5 = -[RWIProtocolJSONObject init](&v8, sel_init);
  if (v5)
  {
    if (!v4)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("name"));
    -[RWIProtocolCSSPropertyInfo setName:](v5, "setName:", v4);
    v6 = v5;
  }

  return v5;
}

- (void)setName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSPropertyInfo;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("name"));
}

- (NSString)name
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSPropertyInfo;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("name"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setAliases:(id)a3
{
  _DWORD *v4;
  objc_super v5;
  _DWORD *v6;

  Inspector::toJSONStringArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSPropertyInfo;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v5, sel_setJSONArray_forKey_, &v6, CFSTR("aliases"));
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*v4 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v4;
  }
}

- (NSArray)aliases
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSPropertyInfo;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("aliases"));
  Inspector::toObjCStringArray(&v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v3;
  }
  return (NSArray *)v2;
}

- (void)setLonghands:(id)a3
{
  _DWORD *v4;
  objc_super v5;
  _DWORD *v6;

  Inspector::toJSONStringArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSPropertyInfo;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v5, sel_setJSONArray_forKey_, &v6, CFSTR("longhands"));
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*v4 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v4;
  }
}

- (NSArray)longhands
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSPropertyInfo;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("longhands"));
  Inspector::toObjCStringArray(&v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v3;
  }
  return (NSArray *)v2;
}

- (void)setValues:(id)a3
{
  _DWORD *v4;
  objc_super v5;
  _DWORD *v6;

  Inspector::toJSONStringArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSPropertyInfo;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v5, sel_setJSONArray_forKey_, &v6, CFSTR("values"));
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*v4 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v4;
  }
}

- (NSArray)values
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSPropertyInfo;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("values"));
  Inspector::toObjCStringArray(&v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v3;
  }
  return (NSArray *)v2;
}

- (void)setInherited:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSPropertyInfo;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("inherited"));
}

- (BOOL)inherited
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSPropertyInfo;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("inherited"));
}

@end

@implementation RWIProtocolRuntimePropertyDescriptor

- (RWIProtocolRuntimePropertyDescriptor)initWithName:(id)a3
{
  id v4;
  RWIProtocolRuntimePropertyDescriptor *v5;
  RWIProtocolRuntimePropertyDescriptor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  v5 = -[RWIProtocolJSONObject init](&v8, sel_init);
  if (v5)
  {
    if (!v4)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("name"));
    -[RWIProtocolRuntimePropertyDescriptor setName:](v5, "setName:", v4);
    v6 = v5;
  }

  return v5;
}

- (void)setName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("name"));
}

- (NSString)name
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("name"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("value"));
}

- (RWIProtocolRuntimeRemoteObject)value
{
  void *v3;
  RWIProtocolRuntimeRemoteObject *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolRuntimeRemoteObject *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolRuntimeRemoteObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("value"));
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

- (void)setWritable:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("writable"));
}

- (BOOL)writable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("writable"));
}

- (void)setGet:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("get"));
}

- (RWIProtocolRuntimeRemoteObject)get
{
  void *v3;
  RWIProtocolRuntimeRemoteObject *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolRuntimeRemoteObject *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("get"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolRuntimeRemoteObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("get"));
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

- (void)setSet:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("set"));
}

- (RWIProtocolRuntimeRemoteObject)set
{
  void *v3;
  RWIProtocolRuntimeRemoteObject *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolRuntimeRemoteObject *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("set"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolRuntimeRemoteObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("set"));
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

- (void)setWasThrown:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("wasThrown"));
}

- (BOOL)wasThrown
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("wasThrown"));
}

- (void)setConfigurable:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("configurable"));
}

- (BOOL)configurable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("configurable"));
}

- (void)setEnumerable:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("enumerable"));
}

- (BOOL)enumerable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("enumerable"));
}

- (void)setIsOwn:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isOwn"));
}

- (BOOL)isOwn
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isOwn"));
}

- (void)setSymbol:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("symbol"));
}

- (RWIProtocolRuntimeRemoteObject)symbol
{
  void *v3;
  RWIProtocolRuntimeRemoteObject *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolRuntimeRemoteObject *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("symbol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolRuntimeRemoteObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("symbol"));
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

- (void)setIsPrivate:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isPrivate"));
}

- (BOOL)isPrivate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isPrivate"));
}

- (void)setNativeGetter:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("nativeGetter"));
}

- (BOOL)nativeGetter
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("nativeGetter"));
}

@end

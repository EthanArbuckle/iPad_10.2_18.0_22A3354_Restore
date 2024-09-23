@implementation RWIProtocolRuntimeCollectionEntry

- (RWIProtocolRuntimeCollectionEntry)initWithValue:(id)a3
{
  id v4;
  RWIProtocolRuntimeCollectionEntry *v5;
  RWIProtocolRuntimeCollectionEntry *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolRuntimeCollectionEntry;
  v5 = -[RWIProtocolJSONObject init](&v8, sel_init);
  if (v5)
  {
    if (!v4)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("value"));
    -[RWIProtocolRuntimeCollectionEntry setValue:](v5, "setValue:", v4);
    v6 = v5;
  }

  return v5;
}

- (void)setKey:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeCollectionEntry;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("key"));
}

- (RWIProtocolRuntimeRemoteObject)key
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
  v14.super_class = (Class)RWIProtocolRuntimeCollectionEntry;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolRuntimeRemoteObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolRuntimeCollectionEntry;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("key"));
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

- (void)setValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeCollectionEntry;
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
  v14.super_class = (Class)RWIProtocolRuntimeCollectionEntry;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolRuntimeRemoteObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolRuntimeCollectionEntry;
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

@end

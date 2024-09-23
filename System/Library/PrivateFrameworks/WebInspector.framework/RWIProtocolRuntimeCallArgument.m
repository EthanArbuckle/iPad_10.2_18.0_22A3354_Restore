@implementation RWIProtocolRuntimeCallArgument

- (void)setValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeCallArgument;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("value"));
}

- (RWIProtocolJSONObject)value
{
  void *v3;
  RWIProtocolJSONObject *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolJSONObject *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimeCallArgument;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolJSONObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolRuntimeCallArgument;
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

- (void)setObjectId:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeCallArgument;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("objectId"));
}

- (NSString)objectId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeCallArgument;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("objectId"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end

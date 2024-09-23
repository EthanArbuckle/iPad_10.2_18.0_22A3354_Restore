@implementation RWIProtocolRuntimeStructureDescription

- (void)setFields:(id)a3
{
  _DWORD *v4;
  objc_super v5;
  _DWORD *v6;

  Inspector::toJSONStringArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolRuntimeStructureDescription;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v5, sel_setJSONArray_forKey_, &v6, CFSTR("fields"));
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

- (NSArray)fields
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolRuntimeStructureDescription;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("fields"));
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

- (void)setOptionalFields:(id)a3
{
  _DWORD *v4;
  objc_super v5;
  _DWORD *v6;

  Inspector::toJSONStringArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolRuntimeStructureDescription;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v5, sel_setJSONArray_forKey_, &v6, CFSTR("optionalFields"));
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

- (NSArray)optionalFields
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolRuntimeStructureDescription;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("optionalFields"));
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

- (void)setConstructorName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeStructureDescription;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("constructorName"));
}

- (NSString)constructorName
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeStructureDescription;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("constructorName"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setPrototypeStructure:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeStructureDescription;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("prototypeStructure"));
}

- (RWIProtocolRuntimeStructureDescription)prototypeStructure
{
  void *v3;
  RWIProtocolRuntimeStructureDescription *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolRuntimeStructureDescription *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimeStructureDescription;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("prototypeStructure"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolRuntimeStructureDescription alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolRuntimeStructureDescription;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("prototypeStructure"));
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

- (void)setIsImprecise:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeStructureDescription;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isImprecise"));
}

- (BOOL)isImprecise
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeStructureDescription;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isImprecise"));
}

@end

@implementation RWIProtocolRuntimeTypeDescription

- (RWIProtocolRuntimeTypeDescription)initWithIsValid:(BOOL)a3
{
  _BOOL8 v3;
  RWIProtocolRuntimeTypeDescription *v4;
  RWIProtocolRuntimeTypeDescription *v5;
  RWIProtocolRuntimeTypeDescription *v6;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolRuntimeTypeDescription;
  v4 = -[RWIProtocolJSONObject init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[RWIProtocolRuntimeTypeDescription setIsValid:](v4, "setIsValid:", v3);
    v6 = v5;
  }

  return v5;
}

- (void)setIsValid:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeDescription;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isValid"));
}

- (BOOL)isValid
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeDescription;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isValid"));
}

- (void)setLeastCommonAncestor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeDescription;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("leastCommonAncestor"));
}

- (NSString)leastCommonAncestor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeDescription;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("leastCommonAncestor"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setTypeSet:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeDescription;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("typeSet"));
}

- (RWIProtocolRuntimeTypeSet)typeSet
{
  void *v3;
  RWIProtocolRuntimeTypeSet *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolRuntimeTypeSet *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimeTypeDescription;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("typeSet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolRuntimeTypeSet alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolRuntimeTypeDescription;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("typeSet"));
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

- (void)setStructures:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  _DWORD *v12;
  objc_super v14;
  _DWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    v6 = *MEMORY[0x24BDBCAB8];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v9 = (void *)MEMORY[0x24BDBCE88];
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "raise:format:", v6, CFSTR("array should contain objects of type '%@', found bad value: %@"), v11, v8);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  Inspector::toJSONObjectArray((Inspector *)v3, (uint64_t *)&v15);
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimeTypeDescription;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v14, sel_setJSONArray_forKey_, &v15, CFSTR("structures"));
  v12 = v15;
  v15 = 0;
  if (v12)
  {
    if (*v12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v12;
  }

}

- (NSArray)structures
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolRuntimeTypeDescription;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("structures"));
  Inspector::toObjCArray<RWIProtocolRuntimeStructureDescription>(&v6);
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

- (void)setIsTruncated:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeDescription;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isTruncated"));
}

- (BOOL)isTruncated
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeDescription;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isTruncated"));
}

@end

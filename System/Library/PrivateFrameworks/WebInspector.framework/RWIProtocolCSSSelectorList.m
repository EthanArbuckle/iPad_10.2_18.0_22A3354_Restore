@implementation RWIProtocolCSSSelectorList

- (RWIProtocolCSSSelectorList)initWithSelectors:(id)a3 text:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  RWIProtocolCSSSelectorList *v15;
  id v17;
  id v18;
  RWIProtocolCSSSelectorList *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v17 = a4;
  v24.receiver = self;
  v24.super_class = (Class)RWIProtocolCSSSelectorList;
  v19 = -[RWIProtocolJSONObject init](&v24, sel_init);
  if (v19)
  {
    if (!v18)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("selectors"));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v18;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      v9 = *MEMORY[0x24BDBCAB8];
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v12 = (void *)MEMORY[0x24BDBCE88];
            v13 = (objc_class *)objc_opt_class();
            NSStringFromClass(v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "raise:format:", v9, CFSTR("array should contain objects of type '%@', found bad value: %@"), v14, v11);

          }
          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    if (!v17)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("text"));
    -[RWIProtocolCSSSelectorList setSelectors:](v19, "setSelectors:", v6);
    -[RWIProtocolCSSSelectorList setText:](v19, "setText:", v17);
    v15 = v19;
  }

  return v19;
}

- (void)setSelectors:(id)a3
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
  v14.super_class = (Class)RWIProtocolCSSSelectorList;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v14, sel_setJSONArray_forKey_, &v15, CFSTR("selectors"));
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

- (NSArray)selectors
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSSelectorList;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("selectors"));
  Inspector::toObjCArray<RWIProtocolCSSSelector>(&v6);
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

- (void)setText:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSelectorList;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("text"));
}

- (NSString)text
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSelectorList;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("text"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setRange:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSelectorList;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("range"));
}

- (RWIProtocolCSSSourceRange)range
{
  void *v3;
  RWIProtocolCSSSourceRange *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolCSSSourceRange *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSSelectorList;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("range"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolCSSSourceRange alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolCSSSelectorList;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("range"));
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

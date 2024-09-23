@implementation RWIProtocolCSSInheritedStyleEntry

- (RWIProtocolCSSInheritedStyleEntry)initWithMatchedCSSRules:(id)a3
{
  RWIProtocolCSSInheritedStyleEntry *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  RWIProtocolCSSInheritedStyleEntry *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v21.receiver = self;
  v21.super_class = (Class)RWIProtocolCSSInheritedStyleEntry;
  v4 = -[RWIProtocolJSONObject init](&v21, sel_init);
  if (v4)
  {
    if (!v16)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("matchedCSSRules"));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v16;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v18;
      v8 = *MEMORY[0x24BDBCAB8];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v11 = (void *)MEMORY[0x24BDBCE88];
            v12 = (objc_class *)objc_opt_class();
            NSStringFromClass(v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "raise:format:", v8, CFSTR("array should contain objects of type '%@', found bad value: %@"), v13, v10);

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v6);
    }

    -[RWIProtocolCSSInheritedStyleEntry setMatchedCSSRules:](v4, "setMatchedCSSRules:", v5);
    v14 = v4;
  }

  return v4;
}

- (void)setInlineStyle:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSInheritedStyleEntry;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("inlineStyle"));
}

- (RWIProtocolCSSStyle)inlineStyle
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
  v14.super_class = (Class)RWIProtocolCSSInheritedStyleEntry;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("inlineStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolCSSStyle alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolCSSInheritedStyleEntry;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("inlineStyle"));
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

- (void)setMatchedCSSRules:(id)a3
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
  v14.super_class = (Class)RWIProtocolCSSInheritedStyleEntry;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v14, sel_setJSONArray_forKey_, &v15, CFSTR("matchedCSSRules"));
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

- (NSArray)matchedCSSRules
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSInheritedStyleEntry;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("matchedCSSRules"));
  Inspector::toObjCArray<RWIProtocolCSSRuleMatch>(&v6);
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

@end

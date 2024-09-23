@implementation RWIProtocolCSSStyle

- (RWIProtocolCSSStyle)initWithCssProperties:(id)a3 shorthandEntries:(id)a4
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  objc_class *v22;
  void *v23;
  RWIProtocolCSSStyle *v24;
  id v26;
  id v27;
  RWIProtocolCSSStyle *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v26 = a4;
  v38.receiver = self;
  v38.super_class = (Class)RWIProtocolCSSStyle;
  v28 = -[RWIProtocolJSONObject init](&v38, sel_init);
  if (v28)
  {
    v6 = (uint64_t *)MEMORY[0x24BDBCAB8];
    if (!v27)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("cssProperties"));
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v27;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v35;
      v9 = *v6;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v10);
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
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v7);
    }

    if (!v26)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v6, CFSTR("required property '%@' cannot be nil"), CFSTR("shorthandEntries"));
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v15 = v26;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v31;
      v18 = *v6;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v19);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v21 = (void *)MEMORY[0x24BDBCE88];
            v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "raise:format:", v18, CFSTR("array should contain objects of type '%@', found bad value: %@"), v23, v20);

          }
          ++v19;
        }
        while (v16 != v19);
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v16);
    }

    -[RWIProtocolCSSStyle setCssProperties:](v28, "setCssProperties:", obj);
    -[RWIProtocolCSSStyle setShorthandEntries:](v28, "setShorthandEntries:", v15);
    v24 = v28;
  }

  return v28;
}

- (void)setStyleId:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyle;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("styleId"));
}

- (RWIProtocolCSSStyleId)styleId
{
  void *v3;
  RWIProtocolCSSStyleId *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolCSSStyleId *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSStyle;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("styleId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolCSSStyleId alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolCSSStyle;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("styleId"));
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

- (void)setCssProperties:(id)a3
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
  v14.super_class = (Class)RWIProtocolCSSStyle;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v14, sel_setJSONArray_forKey_, &v15, CFSTR("cssProperties"));
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

- (NSArray)cssProperties
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSStyle;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("cssProperties"));
  Inspector::toObjCArray<RWIProtocolCSSProperty>(&v6);
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

- (void)setShorthandEntries:(id)a3
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
  v14.super_class = (Class)RWIProtocolCSSStyle;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v14, sel_setJSONArray_forKey_, &v15, CFSTR("shorthandEntries"));
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

- (NSArray)shorthandEntries
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSStyle;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("shorthandEntries"));
  Inspector::toObjCArray<RWIProtocolCSSShorthandEntry>(&v6);
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

- (void)setCssText:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyle;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("cssText"));
}

- (NSString)cssText
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyle;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("cssText"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setRange:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyle;
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
  v14.super_class = (Class)RWIProtocolCSSStyle;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("range"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolCSSSourceRange alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolCSSStyle;
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

- (void)setWidth:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyle;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("width"));
}

- (NSString)width
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyle;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("width"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setHeight:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyle;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("height"));
}

- (NSString)height
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyle;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("height"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end

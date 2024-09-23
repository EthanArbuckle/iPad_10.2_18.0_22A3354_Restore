@implementation RWIProtocolCSSFont

- (RWIProtocolCSSFont)initWithDisplayName:(id)a3 variationAxes:(id)a4
{
  RWIProtocolCSSFont *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  RWIProtocolCSSFont *v16;
  RWIProtocolCSSFont *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v20 = a4;
  v25.receiver = self;
  v25.super_class = (Class)RWIProtocolCSSFont;
  v6 = -[RWIProtocolJSONObject init](&v25, sel_init);
  if (v6)
  {
    if (!v19)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("displayName"));
    if (!v20)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("variationAxes"));
    v18 = v6;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v20;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v22;
      v10 = *MEMORY[0x24BDBCAB8];
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v13 = (void *)MEMORY[0x24BDBCE88];
            v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "raise:format:", v10, CFSTR("array should contain objects of type '%@', found bad value: %@"), v15, v12);

          }
          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }

    v6 = v18;
    -[RWIProtocolCSSFont setDisplayName:](v18, "setDisplayName:", v19);
    -[RWIProtocolCSSFont setVariationAxes:](v18, "setVariationAxes:", v7);
    v16 = v18;
  }

  return v6;
}

- (void)setDisplayName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSFont;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("displayName"));
}

- (NSString)displayName
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSFont;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("displayName"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setVariationAxes:(id)a3
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
  v14.super_class = (Class)RWIProtocolCSSFont;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v14, sel_setJSONArray_forKey_, &v15, CFSTR("variationAxes"));
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

- (NSArray)variationAxes
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSFont;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("variationAxes"));
  Inspector::toObjCArray<RWIProtocolCSSFontVariationAxis>(&v6);
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

- (void)setSynthesizedBold:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSFont;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("synthesizedBold"));
}

- (BOOL)synthesizedBold
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSFont;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("synthesizedBold"));
}

- (void)setSynthesizedOblique:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSFont;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("synthesizedOblique"));
}

- (BOOL)synthesizedOblique
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSFont;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("synthesizedOblique"));
}

@end

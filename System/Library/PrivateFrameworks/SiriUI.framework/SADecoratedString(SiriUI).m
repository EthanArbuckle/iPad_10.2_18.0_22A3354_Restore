@implementation SADecoratedString(SiriUI)

- (void)siriui_enumeratePropertyRangesUsingBlock:()SiriUI
{
  void (**v4)(id, void *, uint64_t, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(a1, "regions", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "property");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "siriui_range");
          v4[2](v4, v11, v12, v13);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
}

- (void)siriui_enumerateRangesOfRegionsWithProperty:()SiriUI usingBlock:
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __84__SADecoratedString_SiriUI__siriui_enumerateRangesOfRegionsWithProperty_usingBlock___block_invoke;
    v8[3] = &unk_24D7D9F80;
    v9 = v6;
    v10 = v7;
    objc_msgSend(a1, "siriui_enumeratePropertyRangesUsingBlock:", v8);

  }
}

- (id)siriui_attributedStringValueWithAttribute:()SiriUI value:forRegionsWithProperty:
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = (objc_class *)MEMORY[0x24BDD1688];
  v11 = a5;
  v12 = [v10 alloc];
  objc_msgSend(a1, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithString:", v13);

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __100__SADecoratedString_SiriUI__siriui_attributedStringValueWithAttribute_value_forRegionsWithProperty___block_invoke;
  v21[3] = &unk_24D7D9FA8;
  v15 = v14;
  v22 = v15;
  v23 = v8;
  v24 = v9;
  v16 = v9;
  v17 = v8;
  objc_msgSend(a1, "siriui_enumerateRangesOfRegionsWithProperty:usingBlock:", v11, v21);

  v18 = v24;
  v19 = v15;

  return v19;
}

@end

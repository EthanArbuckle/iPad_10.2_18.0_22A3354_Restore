@implementation NSAttributedString(SCRCAttributedStringExtras)

- (id)scrcSplitBasedOnMultipleAttributesWithLimit:()SCRCAttributedStringExtras
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v19;
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "length");
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0x7FFFFFFFFFFFFFFFLL;
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __94__NSAttributedString_SCRCAttributedStringExtras__scrcSplitBasedOnMultipleAttributesWithLimit___block_invoke;
  v19 = &unk_24CB25618;
  v20 = a1;
  v7 = v5;
  v21 = v7;
  v22 = &v24;
  v23 = a3;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, &v16);
  if (v25[3] < v6 && objc_msgSend(v7, "count", v16, v17, v18, v19, v20) == a3 - 1)
  {
    v8 = v25[3];
    v9 = objc_msgSend(a1, "length");
    objc_msgSend(a1, "attributedSubstringFromRange:", v8, v9 - v25[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v7, "addObject:", v12);

    }
  }
  v13 = v21;
  v14 = v7;

  _Block_object_dispose(&v24, 8);
  return v14;
}

- (id)scrcSplitBasedOnAttribute:()SCRCAttributedStringExtras limit:
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v21;
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "length");
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0x7FFFFFFFFFFFFFFFLL;
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __82__NSAttributedString_SCRCAttributedStringExtras__scrcSplitBasedOnAttribute_limit___block_invoke;
  v21 = &unk_24CB25640;
  v22 = a1;
  v9 = v7;
  v23 = v9;
  v24 = &v26;
  v25 = a4;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v8, 0, &v18);
  if (v27[3] < v8 && objc_msgSend(v9, "count", v18, v19, v20, v21, v22) == a4 - 1)
  {
    v10 = v27[3];
    v11 = objc_msgSend(a1, "length");
    objc_msgSend(a1, "attributedSubstringFromRange:", v10, v11 - v27[3]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = (void *)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v14, "removeAttribute:range:", v6, 0, objc_msgSend(v14, "length"));
      objc_msgSend(v9, "addObject:", v14);

    }
  }
  v15 = v23;
  v16 = v9;

  _Block_object_dispose(&v26, 8);
  return v16;
}

- (id)scrcIndexSetForAttributes:()SCRCAttributedStringExtras limit:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_msgSend(a1, "length");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1698]), "initWithIndex:", 0);
  objc_msgSend(v8, "addIndex:", v7);
  if (v7 >= 2)
  {
    v23 = a4;
    v24 = a1;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v25 = v6;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v16);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0x7FFFFFFFFFFFFFFFLL);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v13);
    }

    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __82__NSAttributedString_SCRCAttributedStringExtras__scrcIndexSetForAttributes_limit___block_invoke;
    v26[3] = &unk_24CB25690;
    v27 = v10;
    v28 = v9;
    v29 = v8;
    v30 = v23;
    v19 = v9;
    v20 = v10;
    objc_msgSend(v24, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v26);

    v6 = v25;
  }
  v21 = (void *)objc_msgSend(v8, "copy");

  return v21;
}

@end

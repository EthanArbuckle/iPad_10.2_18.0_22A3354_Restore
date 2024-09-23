@implementation CACEmojiManager

+ (id)sharedManager
{
  void *v2;
  void *v3;
  void *v4;
  CACEmojiManager *v5;
  void *v6;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!sSharedEmojiManager)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bestLocaleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = -[CACEmojiManager initWithLocaleIdentifier:]([CACEmojiManager alloc], "initWithLocaleIdentifier:", v4);
    v6 = (void *)sSharedEmojiManager;
    sSharedEmojiManager = (uint64_t)v5;

  }
  objc_sync_exit(v2);

  return (id)sSharedEmojiManager;
}

+ (void)resetSharedManager
{
  void *v2;
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v2 = (void *)sSharedEmojiManager;
  sSharedEmojiManager = 0;

  objc_sync_exit(obj);
}

- (CACEmojiManager)initWithLocaleIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *localeIdentifier;
  CACEmojiManager *v8;
  uint64_t v9;
  EMFEmojiLocaleData *emojiLocaleData;
  EMFEmojiPreferences *v11;
  EMFEmojiPreferences *emojiPreferences;
  objc_super v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    localeIdentifier = self->_localeIdentifier;
    self->_localeIdentifier = v6;
  }
  else
  {
    localeIdentifier = self->_localeIdentifier;
    self->_localeIdentifier = (NSString *)CFSTR("en-US");
  }

  v14.receiver = self;
  v14.super_class = (Class)CACEmojiManager;
  v8 = -[CACEmojiManager init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE2E810], "emojiLocaleDataWithLocaleIdentifier:", v8->_localeIdentifier);
    v9 = objc_claimAutoreleasedReturnValue();
    emojiLocaleData = v8->_emojiLocaleData;
    v8->_emojiLocaleData = (EMFEmojiLocaleData *)v9;

    v11 = (EMFEmojiPreferences *)objc_alloc_init(MEMORY[0x24BE2E818]);
    emojiPreferences = v8->_emojiPreferences;
    v8->_emojiPreferences = v11;

    -[EMFEmojiPreferences readEmojiDefaults](v8->_emojiPreferences, "readEmojiDefaults");
  }

  return v8;
}

- (void)enumerateEmojisInText:(id)a3 skinToneFilter:(int)a4 usingBlock:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  EMFEmojiLocaleData *emojiLocaleData;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void *v17;
  CACEmojiManager *v18;
  id v19;
  uint64_t *v20;
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    emojiLocaleData = self->_emojiLocaleData;
    v11 = objc_msgSend(v8, "length");
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __67__CACEmojiManager_enumerateEmojisInText_skinToneFilter_usingBlock___block_invoke;
    v17 = &unk_24F2AB470;
    v20 = &v22;
    v18 = self;
    v21 = v6;
    v12 = v9;
    v19 = v12;
    -[EMFEmojiLocaleData enumerateSearchResultsInText:range:options:searchType:usingBlock:](emojiLocaleData, "enumerateSearchResultsInText:range:options:searchType:usingBlock:", v8, 0, v11, 17, 1, &v14);
    if (!*((_BYTE *)v23 + 24))
    {
      -[CACEmojiManager emojiTokenUsingPrefixApproachForText:skinToneFilter:](self, "emojiTokenUsingPrefixApproachForText:skinToneFilter:", v8, v6, v14, v15, v16, v17, v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        (*((void (**)(id, void *, _QWORD, uint64_t))v12 + 2))(v12, v13, 0, objc_msgSend(v8, "length"));

    }
    _Block_object_dispose(&v22, 8);
  }

}

void __67__CACEmojiManager_enumerateEmojisInText_skinToneFilter_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "emojiStringsFromEmojiTokens:skinToneFilter:", a2, *(unsigned int *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)emojisForText:(id)a3 skinToneFilter:(int)a4
{
  id v5;
  void *v6;
  EMFEmojiLocaleData *emojiLocaleData;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
  uint64_t v36;
  void *v38;
  id v39;
  uint64_t v40;
  CACEmojiManager *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = self;
  emojiLocaleData = self->_emojiLocaleData;
  v8 = objc_msgSend(v5, "length");
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __48__CACEmojiManager_emojisForText_skinToneFilter___block_invoke;
  v61[3] = &unk_24F2AB498;
  v9 = v6;
  v62 = v9;
  v38 = v5;
  -[EMFEmojiLocaleData enumerateSearchResultsInText:range:options:searchType:usingBlock:](emojiLocaleData, "enumerateSearchResultsInText:range:options:searchType:usingBlock:", v5, 0, v8, 17, 1, v61);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v11 = v9;
  v43 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (v43)
  {
    v39 = v11;
    v40 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v58 != v40)
          objc_enumerationMutation(v11);
        v13 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v11, "count") <= 1)
          v14 = 1;
        else
          v14 = a4;
        -[CACEmojiManager emojiStringsFromEmojiTokens:skinToneFilter:](v42, "emojiStringsFromEmojiTokens:skinToneFilter:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
        {
          v44 = i;
          v16 = objc_msgSend(v10, "count");
          if (v16)
          {
            for (j = 0; j != v16; ++j)
            {
              objc_msgSend(v10, "objectAtIndex:", j);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = 0u;
              v50 = 0u;
              v51 = 0u;
              v52 = 0u;
              v19 = v15;
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
              if (v20)
              {
                v21 = v20;
                v22 = *(_QWORD *)v50;
                do
                {
                  for (k = 0; k != v21; ++k)
                  {
                    if (*(_QWORD *)v50 != v22)
                      objc_enumerationMutation(v19);
                    objc_msgSend(v18, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * k));
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v10, "addObject:", v24);

                  }
                  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
                }
                while (v21);
              }

            }
          }
          objc_msgSend(v10, "removeObjectsInRange:", 0, v16);
          v11 = v39;
          i = v44;
        }
        else
        {
          v55 = 0u;
          v56 = 0u;
          v53 = 0u;
          v54 = 0u;
          v25 = v15;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v54;
            do
            {
              for (m = 0; m != v27; ++m)
              {
                if (*(_QWORD *)v54 != v28)
                  objc_enumerationMutation(v25);
                objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * m));
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
            }
            while (v27);
          }

        }
      }
      v43 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    }
    while (v43);
  }

  -[CACEmojiManager emojiTokenUsingPrefixApproachForText:skinToneFilter:](v42, "emojiTokenUsingPrefixApproachForText:skinToneFilter:", v38, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v46;
      do
      {
        for (n = 0; n != v33; ++n)
        {
          if (*(_QWORD *)v46 != v34)
            objc_enumerationMutation(v31);
          v36 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * n);
          if ((objc_msgSend(v10, "containsObject:", v36) & 1) == 0)
            objc_msgSend(v10, "addObject:", v36);
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
      }
      while (v33);
    }
  }

  return v10;
}

uint64_t __48__CACEmojiManager_emojisForText_skinToneFilter___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)stringByReplacingEmojisWithDescriptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v4);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", objc_msgSend(v4, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "length");
  v7 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __59__CACEmojiManager_stringByReplacingEmojisWithDescriptions___block_invoke;
  v16[3] = &unk_24F2AB4C0;
  v8 = v5;
  v17 = v8;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 258, v16);
  v9 = objc_msgSend(v8, "length");
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __59__CACEmojiManager_stringByReplacingEmojisWithDescriptions___block_invoke_2;
  v13[3] = &unk_24F2AB4E8;
  v13[4] = self;
  v10 = v4;
  v14 = v10;
  v15 = &v18;
  objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 2, v13);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __59__CACEmojiManager_stringByReplacingEmojisWithDescriptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

void __59__CACEmojiManager_stringByReplacingEmojisWithDescriptions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEmoji:"))
  {
    v7 = (void *)MEMORY[0x24BE2E828];
    objc_msgSend(*(id *)(a1 + 32), "emojiLocaleData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "emojiTokenWithString:localeData:", v14, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "nameForType:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "stringByReplacingCharactersInRange:withString:", objc_msgSend(*(id *)(a1 + 40), "length") - (a3 + a4), a4, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

- (id)relatedEmojisForEmoji:(id)a3 skinToneFilter:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  -[CACEmojiManager stringByReplacingEmojisWithDescriptions:](self, "stringByReplacingEmojisWithDescriptions:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACEmojiManager emojisForText:skinToneFilter:](self, "emojisForText:skinToneFilter:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)emojiTokenUsingPrefixApproachForText:(id)a3 skinToneFilter:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = *(_QWORD *)&a4;
  v23 = *MEMORY[0x24BDAC8D0];
  -[EMFEmojiLocaleData emojiTokensForText:phoneticReading:options:searchType:includePrefixMatches:](self->_emojiLocaleData, "emojiTokensForText:phoneticReading:options:searchType:includePrefixMatches:", a3, 0, 17, 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "copyWithoutModifiers", (_QWORD)v18);
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    objc_msgSend(v8, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACEmojiManager emojiStringsFromEmojiTokens:skinToneFilter:](self, "emojiStringsFromEmojiTokens:skinToneFilter:", v15, v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)emojiStringsFromEmojiTokens:(id)a3 skinToneFilter:(int)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    v23 = v7;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
        if (!objc_msgSend(v12, "supportsSkinToneVariants", v23))
        {
LABEL_17:
          objc_msgSend(v12, "string");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);
          goto LABEL_18;
        }
        if (a4)
        {
          if (a4 != 1)
            goto LABEL_17;
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v12, "skinToneVariants");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v26;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v26 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "string");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "addObject:", v18);

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v15);
            v7 = v23;
          }
        }
        else
        {
          -[CACEmojiManager emojiPreferences](self, "emojiPreferences");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "lastUsedVariantEmojiForEmoji:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "string");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v20);

        }
LABEL_18:

        ++v11;
      }
      while (v11 != v9);
      v21 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      v9 = v21;
    }
    while (v21);
  }

  return v6;
}

- (void)willInsertStringPotentiallyContainingEmojis:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__CACEmojiManager_willInsertStringPotentiallyContainingEmojis___block_invoke;
  v7[3] = &unk_24F2AB4C0;
  v7[4] = self;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v7);

  -[CACEmojiManager emojiPreferences](self, "emojiPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeEmojiDefaults");

}

void __63__CACEmojiManager_willInsertStringPotentiallyContainingEmojis___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEmoji:"))
  {
    v3 = (void *)MEMORY[0x24BE2E828];
    objc_msgSend(*(id *)(a1 + 32), "emojiLocaleData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "emojiTokenWithString:localeData:", v7, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "emojiPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didUseEmoji:", v5);

  }
}

- (BOOL)isEmoji:(id)a3
{
  id v3;
  int v4;
  BOOL v5;
  BOOL v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "characterAtIndex:", 0);
  if ((v4 & 0xFC00) == 0xD800)
    v5 = (objc_msgSend(v3, "characterAtIndex:", 1) + (v4 << 10) - 56732672) >> 9 >= 0x15;
  else
    v5 = (v4 - 8448) >= 0x6C0;
  v6 = !v5;

  return v6;
}

- (int64_t)countOfEmojisInString:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = objc_msgSend(v4, "length");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__CACEmojiManager_countOfEmojisInString___block_invoke;
  v8[3] = &unk_24F2AB510;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v8);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __41__CACEmojiManager_countOfEmojisInString___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEmoji:", a2);
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (EMFEmojiLocaleData)emojiLocaleData
{
  return self->_emojiLocaleData;
}

- (void)setEmojiLocaleData:(id)a3
{
  objc_storeStrong((id *)&self->_emojiLocaleData, a3);
}

- (EMFEmojiPreferences)emojiPreferences
{
  return self->_emojiPreferences;
}

- (void)setEmojiPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_emojiPreferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiPreferences, 0);
  objc_storeStrong((id *)&self->_emojiLocaleData, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end

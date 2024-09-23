@implementation NSMutableAttributedString(WBSNSMutableAttributedExtras)

- (void)safari_replaceCharactersWithStringBindings:()WBSNSMutableAttributedExtras
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __102__NSMutableAttributedString_WBSNSMutableAttributedExtras__safari_replaceCharactersWithStringBindings___block_invoke;
  v31[3] = &unk_1E649D198;
  v26 = v5;
  v32 = v26;
  v7 = v6;
  v33 = v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v31);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "first", v26);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v13, "second");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "rangeValue");
          v19 = v18;
          objc_msgSend(v13, "first");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "replaceCharactersInRange:withString:", v17, v19, v20);
        }
        else
        {
          objc_msgSend(v13, "first");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v22 = objc_opt_isKindOfClass();

          if ((v22 & 1) == 0)
            continue;
          objc_msgSend(v13, "second");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v16, "rangeValue");
          v25 = v24;
          objc_msgSend(v13, "first");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "replaceCharactersInRange:withAttributedString:", v23, v25, v20);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v10);
  }

}

@end

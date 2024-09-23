@implementation NSRegularExpression(VK)

+ (id)vk_regexForSearchStrings:()VK
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v4, "appendString:", CFSTR("("));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendString:", v10);

          objc_msgSend(v4, "appendString:", CFSTR("|"));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v4, "length"))
      objc_msgSend(v4, "replaceCharactersInRange:withString:", objc_msgSend(v4, "length") - 1, 1, &stru_1E94661A8);
    objc_msgSend(v4, "appendString:", CFSTR(")"));
    v13 = 0;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v4, 1, &v13);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)vk_rangesForMatchesInString:()VK
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__24;
  v17 = __Block_byref_object_dispose__24;
  v18 = 0;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_msgSend(v4, "vk_range");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__NSRegularExpression_VK__vk_rangesForMatchesInString___block_invoke;
    v12[3] = &unk_1E9464FD0;
    v12[4] = &v13;
    objc_msgSend(a1, "enumerateMatchesInString:options:range:usingBlock:", v4, 0, v5, v6, v12);
  }
  v7 = objc_msgSend((id)v14[5], "copy");
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  _Block_object_dispose(&v13, 8);
  return v10;
}

@end

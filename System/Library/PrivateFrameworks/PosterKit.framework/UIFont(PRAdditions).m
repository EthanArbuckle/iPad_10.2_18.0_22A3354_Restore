@implementation UIFont(PRAdditions)

- (uint64_t)pr_variantWeight
{
  void *v2;
  void *v3;
  uint64_t v4;
  CFDictionaryRef v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFDictionary *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "pr_cachedVariantWeight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "pr_cachedVariantWeight");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntegerValue");

    return v4;
  }
  else
  {
    v6 = CTFontCopyVariation((CTFontRef)a1);
    if (v6
      && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2003265650.0),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v8))
    {
      objc_msgSend(a1, "pr_setCachedVariantWeight:", v8);
      v9 = objc_msgSend(v8, "unsignedIntegerValue");

    }
    else
    {
      v22 = v6;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v10 = (id)CTFontCopyVariationAxesInternal();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v24;
        v14 = *MEMORY[0x1E0CA8488];
        v15 = *MEMORY[0x1E0CA8480];
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v24 != v13)
              objc_enumerationMutation(v10);
            v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_msgSend(v17, "objectForKeyedSubscript:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v18)
            {
              if (objc_msgSend(v18, "unsignedIntegerValue") == 2003265652)
              {
                objc_msgSend(v17, "objectForKeyedSubscript:", v15);
                v20 = objc_claimAutoreleasedReturnValue();
                if (v20)
                {
                  v21 = (void *)v20;
                  objc_msgSend(a1, "pr_setCachedVariantWeight:", v20);
                  v9 = objc_msgSend(v21, "unsignedIntegerValue");

                  goto LABEL_18;
                }
              }
            }

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v12)
            continue;
          break;
        }
      }

      objc_msgSend(a1, "pr_setCachedVariantWeight:", &unk_1E21DCD58);
      v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

      v6 = v22;
    }

    return v9;
  }
}

- (uint64_t)pr_variantWeightRange
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "pr_minimumAllowedFontWeightFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pr_maximumAllowedFontWeightFont");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2 && v3)
  {
    v5 = objc_msgSend(v2, "pr_variantWeight") + 1;
    objc_msgSend(v4, "pr_variantWeight");
  }
  else
  {
    v21 = (void *)v3;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = (id)CTFontCopyVariationAxesInternal();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      v10 = *MEMORY[0x1E0CA8488];
      v22 = *MEMORY[0x1E0CA8498];
      v11 = *MEMORY[0x1E0CA8490];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14 && objc_msgSend(v14, "unsignedIntegerValue") == 2003265652)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", v22);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v11);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v16)
              v19 = v17 == 0;
            else
              v19 = 1;
            if (!v19)
            {
              v5 = objc_msgSend(v16, "unsignedIntValue") + 1;
              objc_msgSend(v18, "unsignedIntValue");

              goto LABEL_20;
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }

    v5 = 0;
LABEL_20:
    v4 = v21;
  }

  return v5;
}

- (id)pr_fontWithVariantWeight:()PRAdditions forRole:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFDictionary *v11;
  const __CTFontDescriptor *v12;
  CGFloat v13;
  CTFontRef CopyWithAttributes;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v19 = *MEMORY[0x1E0CA8470];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", 2003265650.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v12 = CTFontDescriptorCreateWithAttributes(v11);
  objc_msgSend(a1, "pointSize");
  CopyWithAttributes = CTFontCreateCopyWithAttributes((CTFontRef)a1, v13, 0, v12);
  CFRelease(v12);
  -[__CTFont pr_fontWithDefaultFallbacksForRole:](CopyWithAttributes, "pr_fontWithDefaultFallbacksForRole:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end

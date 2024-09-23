@implementation UIFont(Variant)

- (uint64_t)_variantWeight
{
  void *v2;
  void *v3;
  uint64_t v4;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const __CFArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFDictionary *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_cachedVariantWeight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "_cachedVariantWeight");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntegerValue");

    return v4;
  }
  else
  {
    v6 = CTFontCopyVariation((CTFontRef)a1);
    v7 = v6;
    if (v6
      && (-[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", &unk_1E1A97698),
          (v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = (void *)v8;
      objc_msgSend(a1, "_setCachedVariantWeight:", v8);
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

    }
    else
    {
      v23 = v7;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = CTFontCopyVariationAxes((CTFontRef)a1);
      v12 = -[__CFArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v25;
        v15 = *MEMORY[0x1E0CA8488];
        v16 = *MEMORY[0x1E0CA8480];
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v25 != v14)
              objc_enumerationMutation(v11);
            v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v18, "objectForKeyedSubscript:", v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v19)
            {
              if (objc_msgSend(v19, "unsignedIntegerValue") == 2003265652)
              {
                objc_msgSend(v18, "objectForKeyedSubscript:", v16);
                v21 = objc_claimAutoreleasedReturnValue();
                if (v21)
                {
                  v22 = (void *)v21;
                  objc_msgSend(a1, "_setCachedVariantWeight:", v21);
                  v10 = objc_msgSend(v22, "unsignedIntegerValue");

                  goto LABEL_18;
                }
              }
            }

          }
          v13 = -[__CFArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v13)
            continue;
          break;
        }
      }

      objc_msgSend(a1, "_setCachedVariantWeight:", &unk_1E1A976B0);
      v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

      v7 = v23;
    }

    return v10;
  }
}

- (id)_fontWithVariantWeight:()Variant
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = *MEMORY[0x1E0CA8470];
  v9 = &unk_1E1A97698;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorByAddingAttributes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "pointSize");
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

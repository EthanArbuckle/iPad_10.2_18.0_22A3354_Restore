@implementation RTIUtilities

+ (void)registerCustomInfoClasses:(id)a3 forType:(id)a4 forClass:(Class)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (1)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(v8);
      if (!--v11)
      {
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (!v11)
          break;
      }
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_rtiUtilities_lock);
  objc_msgSend(a1, "customInfoDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "customInfoDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v15, v17);

  }
  objc_msgSend(v15, "setObject:forKey:", v8, v9);
  os_unfair_lock_unlock((os_unfair_lock_t)&_rtiUtilities_lock);

}

+ (id)customInfoDictionary
{
  if (customInfoDictionary_onceToken != -1)
    dispatch_once(&customInfoDictionary_onceToken, &__block_literal_global_26);
  return (id)customInfoDictionary_customInfoDictionary;
}

void __58__RTIUtilities__attributedStringWithoutDefaultAttributes___block_invoke()
{
  void *v0;

  v0 = (void *)_attributedStringWithoutDefaultAttributes__attributesToRemove;
  _attributedStringWithoutDefaultAttributes__attributesToRemove = (uint64_t)&unk_1E35CDBF8;

}

void __36__RTIUtilities_customInfoDictionary__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)customInfoDictionary_customInfoDictionary;
  customInfoDictionary_customInfoDictionary = (uint64_t)v0;

}

+ (id)_attributedStringWithoutDefaultAttributes:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_attributedStringWithoutDefaultAttributes__onceToken != -1)
    dispatch_once(&_attributedStringWithoutDefaultAttributes__onceToken, &__block_literal_global_2);
  v4 = objc_msgSend(v3, "length");
  if (v3)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(v3, "mutableCopy");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = (id)_attributedStringWithoutDefaultAttributes__attributesToRemove;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "removeAttribute:range:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), 0, v5, (_QWORD)v13);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)customInfoClassesForType:(id)a3 forClass:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_rtiUtilities_lock);
  objc_msgSend(a1, "customInfoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&_rtiUtilities_lock);
  return v10;
}

+ (id)_codableAttributedString:(id)a3 validAttributes:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v6 = a4;
  if (a3)
  {
    v7 = (objc_class *)MEMORY[0x1E0CB3778];
    v8 = a3;
    v9 = [v7 alloc];
    objc_msgSend(v8, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithString:", v10);

    v12 = objc_msgSend(v11, "length");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57__RTIUtilities__codableAttributedString_validAttributes___block_invoke;
    v16[3] = &unk_1E35C2D40;
    v17 = v6;
    v19 = a1;
    v13 = v11;
    v18 = v13;
    objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", 0, v12, 0, v16);

    v14 = v18;
    a3 = v13;

  }
  return a3;
}

void __57__RTIUtilities__codableAttributedString_validAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8;
  __int128 v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__RTIUtilities__codableAttributedString_validAttributes___block_invoke_2;
  v10[3] = &unk_1E35C2D18;
  v11 = *(id *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 40);
  v8 = (id)v9;
  v12 = v9;
  v13 = a3;
  v14 = a4;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void __57__RTIUtilities__codableAttributedString_validAttributes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    v7 = *(void **)(a1 + 48);
    v11 = v5;
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_attributeToReplaceForCoding:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 40);
    if (v9)
      objc_msgSend(v10, "setAttributes:range:", v9, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    else
      objc_msgSend(v10, "addAttribute:value:range:", v5, v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
}

+ (id)_decodableAttributedString:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  if (!a3)
    return 0;
  v4 = (objc_class *)MEMORY[0x1E0CB3778];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:", v7);

  v9 = objc_msgSend(v8, "length");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__RTIUtilities__decodableAttributedString___block_invoke;
  v12[3] = &unk_1E35C2D90;
  v14 = a1;
  v10 = v8;
  v13 = v10;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v9, 0, v12);

  return v10;
}

void __43__RTIUtilities__decodableAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  __int128 v8;
  _QWORD v9[4];
  id v10[2];
  uint64_t v11;
  uint64_t v12;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__RTIUtilities__decodableAttributedString___block_invoke_2;
  v9[3] = &unk_1E35C2D68;
  v8 = *(_OWORD *)(a1 + 32);
  v7 = (id)v8;
  *(_OWORD *)v10 = v8;
  v11 = a3;
  v12 = a4;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __43__RTIUtilities__decodableAttributedString___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)a1[5];
  v12 = a2;
  v13[0] = a3;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_attributeToReplaceForDecoding:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)a1[4];
  if (v10)
    objc_msgSend(v11, "setAttributes:range:", v10, a1[6], a1[7]);
  else
    objc_msgSend(v11, "addAttribute:value:range:", v8, v7, a1[6], a1[7]);

}

+ (id)_attributeToReplaceForCoding:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("NSTextAnimation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = CFSTR("RTITextAnimation");
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_attributeToReplaceForDecoding:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("RTITextAnimation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (RTITextAnimationWithName(v3), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    v9 = CFSTR("NSTextAnimation");
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)unregisterCustomInfoType:(id)a3 forClass:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_rtiUtilities_lock);
  objc_msgSend(a1, "customInfoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObjectForKey:", v6);
  os_unfair_lock_unlock((os_unfair_lock_t)&_rtiUtilities_lock);

}

@end

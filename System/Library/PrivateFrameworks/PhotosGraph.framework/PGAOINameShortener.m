@implementation PGAOINameShortener

+ (id)shortenedAOIForLocationOrAreaNode:(id)a3 locationHelper:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Area"));

  if (v9)
  {
    v10 = v6;
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addressNodesFromAreaNodes:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v17 = (void *)v13;

    goto LABEL_7;
  }
  objc_msgSend(v6, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("City"));

  if (v15)
  {
    v16 = v6;
    objc_msgSend(v16, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "collection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addressNodesFromLocationNodes:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v17 = 0;
  v11 = 0;
LABEL_7:
  if (objc_msgSend(v11, "length"))
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __71__PGAOINameShortener_shortenedAOIForLocationOrAreaNode_locationHelper___block_invoke;
    v21[3] = &unk_1E84310C0;
    v22 = v7;
    v23 = &v25;
    v24 = a1;
    objc_msgSend(v17, "enumerateIdentifiersAsCollectionsWithBlock:", v21);
    if (*((_BYTE *)v26 + 24))
    {
      objc_msgSend(a1, "_shortenedAOIForName:", v11);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = v11;
    }
    v19 = v18;

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v19 = v11;
  }

  return v19;
}

+ (id)_shortenedAOIForName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v4 = a3;
  objc_msgSend(a1, "s_aoiReplacementsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__51611;
  v33 = __Block_byref_object_dispose__51612;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__51611;
  v27 = __Block_byref_object_dispose__51612;
  v28 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __43__PGAOINameShortener__shortenedAOIForName___block_invoke;
  v18 = &unk_1E84310E8;
  v6 = v5;
  v19 = v6;
  v21 = &v29;
  v7 = v4;
  v20 = v7;
  v22 = &v23;
  objc_msgSend(a1, "_enumerateWordCombinationsForName:usingBlock:", v7, &v15);
  v8 = v30[5];
  if (v8)
  {
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", v8, v24[5], v15, v16, v17, v18, v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "hasSuffix:", CFSTR(" and ")) & 1) != 0)
    {
      v10 = v7;
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pg_stringByTrailingCharactersInSet:options:", v13, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "length"))
        v10 = v11;
      else
        v10 = v7;
    }
    v12 = v10;

  }
  else
  {
    v12 = v7;
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v12;
}

+ (void)_enumerateWordCombinationsForName:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(void *, uint64_t);
  _QWORD aBlock[4];
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[3];
  char v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v14 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PGAOINameShortener__enumerateWordCombinationsForName_usingBlock___block_invoke;
    aBlock[3] = &unk_1E8431110;
    v10 = v7;
    v12 = v13;
    v11 = v6;
    v8 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    v8[2](v8, 1);

    _Block_object_dispose(v13, 8);
  }

}

+ (BOOL)isCountryWithAOISubstitutions:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (v3)
  {
    if (isCountryWithAOISubstitutions__onceToken != -1)
      dispatch_once(&isCountryWithAOISubstitutions__onceToken, &__block_literal_global_51599);
    v4 = objc_msgSend((id)isCountryWithAOISubstitutions__countriesWithSubstitutions, "containsObject:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)s_aoiReplacementsDictionary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PGAOINameShortener_s_aoiReplacementsDictionary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (s_aoiReplacementsDictionary_onceToken != -1)
    dispatch_once(&s_aoiReplacementsDictionary_onceToken, block);
  return (id)s_aoiReplacementsDictionary_s_aoiReplacementsDictionary;
}

void __49__PGAOINameShortener_s_aoiReplacementsDictionary__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("aoiReplacements"), CFSTR("plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)s_aoiReplacementsDictionary_s_aoiReplacementsDictionary;
  s_aoiReplacementsDictionary_s_aoiReplacementsDictionary = v1;

}

void __52__PGAOINameShortener_isCountryWithAOISubstitutions___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("US"), CFSTR("CA"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isCountryWithAOISubstitutions__countriesWithSubstitutions;
  isCountryWithAOISubstitutions__countriesWithSubstitutions = v0;

}

void __67__PGAOINameShortener__enumerateWordCombinationsForName_usingBlock___block_invoke(_QWORD *a1, int a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)a1[4];
  if (a2)
    objc_msgSend(v4, "reverseObjectEnumerator");
  else
    objc_msgSend(v4, "objectEnumerator");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1CAA4EB2C]();
        v13 = v12;
        if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
        {
          objc_autoreleasePoolPop(v12);
          goto LABEL_20;
        }
        if (v8)
        {
          if (a2)
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v11, v8, (_QWORD)v15);
          else
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v8, v11, (_QWORD)v15);
          v14 = objc_claimAutoreleasedReturnValue();

          v8 = (id)v14;
        }
        else
        {
          v8 = v11;
        }
        (*(void (**)(void))(a1[5] + 16))();
        objc_autoreleasePoolPop(v13);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
LABEL_20:

  }
}

void __43__PGAOINameShortener__shortenedAOIForName___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v4 = a2;
  v5 = *(void **)(a1 + 32);
  v10 = v4;
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v10, "length");
    if (v8 > objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"))
    {
      v9 = objc_msgSend(v7, "length");
      if (v9 < objc_msgSend(*(id *)(a1 + 40), "length"))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v7);
      }
    }
  }

}

void __71__PGAOINameShortener_shortenedAOIForLocationOrAreaNode_locationHelper___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "countryNodeFromAddressNodeAsCollection:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "names");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "isCountryWithAOISubstitutions:", v7);
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

@end

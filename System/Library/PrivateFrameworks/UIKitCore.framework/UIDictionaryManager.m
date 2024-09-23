@implementation UIDictionaryManager

uint64_t __56___UIDictionaryManager__downloadDictionaryAssetCatalog___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
    NSLog(CFSTR("[_UIDictionaryManager _downloadDictionaryAssetCatalog] failed. Error: %ld"), a2);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  return result;
}

uint64_t __59___UIDictionaryManager__allAvailableDefinitionDictionaries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "definitionLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v6, "definitionLanguage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (!v8 || v10)
  {
    if ((v8 | v10 ^ 1) == 1)
    {
      objc_msgSend(v6, "localizedLanguageName");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
        v13 = (__CFString *)v12;
      else
        v13 = &stru_1E16EDF20;
      objc_msgSend(v5, "localizedLanguageName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v14, "localizedStandardCompare:", v13);

    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = -1;
  }

  return v11;
}

uint64_t __59___UIDictionaryManager__allAvailableDefinitionDictionaries__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetIsLocal");
}

@end

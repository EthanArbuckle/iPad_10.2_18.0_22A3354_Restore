@implementation TIZhuyinPunctuationManager

+ (id)shareZhuyinPunctuationManager
{
  if (shareZhuyinPunctuationManager___onceToken != -1)
    dispatch_once(&shareZhuyinPunctuationManager___onceToken, &__block_literal_global);
  return (id)shareZhuyinPunctuationManager___sharedInstance;
}

void __59__TIZhuyinPunctuationManager_shareZhuyinPunctuationManager__block_invoke()
{
  TIZhuyinPunctuationManager *v0;
  void *v1;

  v0 = objc_alloc_init(TIZhuyinPunctuationManager);
  v1 = (void *)shareZhuyinPunctuationManager___sharedInstance;
  shareZhuyinPunctuationManager___sharedInstance = (uint64_t)v0;

}

- (id)candidatesFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TIZhuyinPunctuationManager punctuationMap](self, "punctuationMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BEB4E20], "candidateWithCandidate:forInput:", v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", v13, &stru_25012F088, CFSTR("CIMPunctuationDescription_zh_Hant"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAlternativeText:", v15);
        objc_msgSend(v8, "addObject:", v14);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v8;
}

- (NSDictionary)punctuationMap
{
  if (punctuationMap___onceToken != -1)
    dispatch_once(&punctuationMap___onceToken, &__block_literal_global_7);
  return (NSDictionary *)(id)punctuationMap___punctuationMap;
}

void __44__TIZhuyinPunctuationManager_punctuationMap__block_invoke()
{
  void *v0;

  v0 = (void *)punctuationMap___punctuationMap;
  punctuationMap___punctuationMap = (uint64_t)&unk_250133288;

}

@end

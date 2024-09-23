@implementation UIPrototypingSettingsManager

void __46___UIPrototypingSettingsManager_sharedManager__block_invoke()
{
  _UIPrototypingSettingsManager *v0;
  void *v1;

  v0 = objc_alloc_init(_UIPrototypingSettingsManager);
  v1 = (void *)_MergedGlobals_1274;
  _MergedGlobals_1274 = (uint64_t)v0;

}

void __58___UIPrototypingSettingsManager_synchronizeStoredSettings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _UIPrototypingValue *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = -[_UIPrototypingValue initWithDictionary:]([_UIPrototypingValue alloc], "initWithDictionary:", v5);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "storedSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "storedSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v10);

    }
  }

}

void __58___UIPrototypingSettingsManager_synchronizeStoredSettings__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "dictionaryRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

@end

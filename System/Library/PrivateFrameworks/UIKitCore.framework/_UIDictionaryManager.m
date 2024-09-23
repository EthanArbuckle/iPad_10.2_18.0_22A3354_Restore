@implementation _UIDictionaryManager

- (_UIDictionaryManager)init
{
  _UIDictionaryManager *v2;
  _UIDictionaryManager *v3;
  uint64_t v4;
  NSArray *availableDefinitionDictionaries;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDictionaryManager;
  v2 = -[_UIDictionaryManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UIDictionaryManager _allAvailableDefinitionDictionaries](v2, "_allAvailableDefinitionDictionaries");
    v4 = objc_claimAutoreleasedReturnValue();
    availableDefinitionDictionaries = v3->_availableDefinitionDictionaries;
    v3->_availableDefinitionDictionaries = (NSArray *)v4;

  }
  return v3;
}

+ (id)assetManager
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (BOOL)_hasDefinitionForTerm:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_availableDefinitionDictionaries;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_hasDefinitionForTerm:", v5, (_QWORD)v11) & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_14;
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)_definitionValuesForTerm:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_availableDefinitionDictionaries;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "activated", (_QWORD)v16))
        {
          objc_msgSend(v11, "_definitionValueForTerm:", v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "definition");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
              objc_msgSend(v5, "addObject:", v13);
          }

        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (!objc_msgSend(v5, "count"))
  {

    v5 = 0;
  }

  return v5;
}

- (id)_dictionaryAssetType
{
  void *v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = getDCSDictionaryAssetGetAssetTypeSymbolLoc_ptr;
  v10 = getDCSDictionaryAssetGetAssetTypeSymbolLoc_ptr;
  if (!getDCSDictionaryAssetGetAssetTypeSymbolLoc_ptr)
  {
    v3 = DictionaryServicesLibrary_0();
    v2 = dlsym(v3, "DCSDictionaryAssetGetAssetType");
    v8[3] = (uint64_t)v2;
    getDCSDictionaryAssetGetAssetTypeSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
  {
    ((void (*)(void))v2)();
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef _DCSDictionaryAssetGetAssetType(void)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDictionaryManager.m"), 34, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (void)_downloadDictionaryAssetCatalog:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  objc_msgSend(v5, "setAllowsExpensiveAccess:", 1);
  objc_msgSend(v5, "setDiscretionary:", 0);
  v6 = (void *)MEMORY[0x1E0D4E038];
  -[_UIDictionaryManager _dictionaryAssetType](self, "_dictionaryAssetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56___UIDictionaryManager__downloadDictionaryAssetCatalog___block_invoke;
  v9[3] = &unk_1E16BDBD8;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "startCatalogDownload:options:then:", v7, v5, v9);

}

- (id)_availableDictionaryAssets
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0D4E050]);
  -[_UIDictionaryManager _dictionaryAssetType](self, "_dictionaryAssetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithType:", v4);

  objc_msgSend(v5, "returnTypes:", 2);
  objc_msgSend(v5, "setDoNotBlockBeforeFirstUnlock:", 1);
  v6 = objc_msgSend(v5, "queryMetaDataSync");
  if (v6)
  {
    NSLog(CFSTR("[_UIDictionaryManager _availableDictionaryAssets] returned nil. Error: %ld"), v6);
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_allAvailableDefinitionDictionaries
{
  unint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _UIDefinitionDictionary *v13;
  _UIDefinitionDictionary *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v47;
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
  _QWORD v60[4];
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  void *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  -[_UIDictionaryManager _availableDictionaryAssets](self, "_availableDictionaryAssets");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 0x1E0C99000uLL;
  if (v38)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("AppleLanguages"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v5 = v38;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v63 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "_formatVersion");
          v66 = 0;
          v67 = &v66;
          v68 = 0x2020000000;
          v11 = getDCSDictionaryAssetGetCompatibilityVersionSymbolLoc_ptr;
          v69 = getDCSDictionaryAssetGetCompatibilityVersionSymbolLoc_ptr;
          if (!getDCSDictionaryAssetGetCompatibilityVersionSymbolLoc_ptr)
          {
            v12 = DictionaryServicesLibrary_0();
            v11 = dlsym(v12, "DCSDictionaryAssetGetCompatibilityVersion");
            v67[3] = (uint64_t)v11;
            getDCSDictionaryAssetGetCompatibilityVersionSymbolLoc_ptr = v11;
          }
          _Block_object_dispose(&v66, 8);
          if (!v11)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _DCSDictionaryAssetGetCompatibilityVersion(void)");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("_UIDictionaryManager.m"), 33, CFSTR("%s"), dlerror());

            __break(1u);
          }
          if (v10 == ((uint64_t (*)(void))v11)())
          {
            v13 = -[_UIDefinitionDictionary initWithAsset:]([_UIDefinitionDictionary alloc], "initWithAsset:", v9);
            v14 = v13;
            if (v13
              && (!-[_UIDefinitionDictionary _isTTYDictionary](v13, "_isTTYDictionary")
               || -[_UIDictionaryManager _isTTYEnabled](self, "_isTTYEnabled")))
            {
              if (-[_UIDefinitionDictionary assetIsLocal](v14, "assetIsLocal") || objc_msgSend(v9, "state") == 4)
                -[_UIDefinitionDictionary setActivated:](v14, "setActivated:", 1);
              objc_msgSend(v44, "addObject:", v14);
            }

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
      }
      while (v6);
    }

    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __59___UIDictionaryManager__allAvailableDefinitionDictionaries__block_invoke;
    v60[3] = &unk_1E16C1328;
    v61 = v42;
    v15 = v42;
    objc_msgSend(v44, "sortUsingComparator:", v60);

    v16 = v44;
    v2 = 0x1E0C99000;
  }
  else
  {
    v16 = 0;
  }
  v45 = v16;
  objc_msgSend(*(id *)(v2 + 3560), "arrayWithCapacity:", objc_msgSend(v16, "count"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "_filteredArrayOfObjectsPassingTest:", &__block_literal_global_307);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v41 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v57;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v57 != v40)
        {
          v19 = v18;
          objc_enumerationMutation(v17);
          v18 = v19;
        }
        v43 = v18;
        v20 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v18);
        objc_msgSend(v20, "rawAsset");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v21 = v45;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v53;
          while (2)
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v53 != v23)
                objc_enumerationMutation(v21);
              v25 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
              if (objc_msgSend(v17, "indexOfObjectIdenticalTo:", v25) == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v20, "localizedDictionaryName");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "localizedDictionaryName");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v26, "isEqual:", v27);

                if (v28)
                {
                  objc_msgSend(v25, "rawAsset");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v47, "state") == 3
                    || (v30 = objc_msgSend(v29, "_contentVersion"), v30 > objc_msgSend(v47, "_contentVersion")))
                  {
                    objc_msgSend(v20, "setAssetToUpgrade:", v29);
                  }
                  objc_msgSend(v39, "addObject:", v25);

                  goto LABEL_43;
                }
              }
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
            if (v22)
              continue;
            break;
          }
        }

        if (objc_msgSend(v47, "state") == 3)
        {
          objc_msgSend(v39, "addObject:", v20);
          objc_msgSend(v47, "purgeSync");
        }
LABEL_43:

        v18 = v43 + 1;
      }
      while (v43 + 1 != v41);
      v41 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
    }
    while (v41);
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v31 = v39;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v70, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v49;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v49 != v33)
          objc_enumerationMutation(v31);
        objc_msgSend(v45, "removeObject:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * k));
      }
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v70, 16);
    }
    while (v32);
  }

  return v45;
}

- (BOOL)_isTTYEnabled
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)qword_1ECD7D488;
  v11 = qword_1ECD7D488;
  if (!qword_1ECD7D488)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getRTTSettingsClass_block_invoke;
    v7[3] = &unk_1E16B14C0;
    v7[4] = &v8;
    __getRTTSettingsClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v3, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "TTYSoftwareEnabled");

  return v5;
}

- (NSArray)availableDefinitionDictionaries
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableDefinitionDictionaries, 0);
}

@end

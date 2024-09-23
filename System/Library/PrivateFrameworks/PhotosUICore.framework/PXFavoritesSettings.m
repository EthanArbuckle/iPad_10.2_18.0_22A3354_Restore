@implementation PXFavoritesSettings

+ (id)sharedInstance
{
  uint64_t v3;
  void *v4;

  os_unfair_lock_lock((os_unfair_lock_t)&PXSettingsSharedInstanceLock);
  if (!sharedInstance_sharedInstance_212473)
  {
    objc_msgSend(a1, "createSharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)sharedInstance_sharedInstance_212473;
    sharedInstance_sharedInstance_212473 = v3;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&PXSettingsSharedInstanceLock);
  return (id)sharedInstance_sharedInstance_212473;
}

+ (id)transientProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PXFavoritesSettings_transientProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transientProperties_onceToken_212468 != -1)
    dispatch_once(&transientProperties_onceToken_212468, block);
  return (id)transientProperties_transientProperties_212469;
}

+ (id)favoritesSubmoduleWithFavoritesSettingsKeyPath:(id)a3 delegate:(id)a4
{
  id v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v5 = a4;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 50);
  +[PXFavoritesSettings sharedInstance](PXFavoritesSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v5;
  objc_msgSend(v6, "setDelegate:", v5);
  for (i = 0; i != 50; ++i)
  {
    objc_msgSend(v6, "_keyForFavoriteNameAtIndex:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v6, "_keyForFavoriteExistingAtIndex:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K != 0"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D83048], "row");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleKeyPath:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "condition:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0D830A0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __79__PXFavoritesSettings_favoritesSubmoduleWithFavoritesSettingsKeyPath_delegate___block_invoke;
    v31[3] = &unk_1E5144E90;
    v16 = v6;
    v32 = v16;
    v33 = i;
    objc_msgSend(v15, "actionWithHandler:", v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "action:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v18);

  }
  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v30, CFSTR("Favorites"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v16, "_keyForFavoriteExistingAtIndex:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "predicateWithFormat:", CFSTR("%K != 0"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D83078];
  v34[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "moduleWithTitle:contents:", 0, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "submoduleWithModule:childSettingsKeyPath:condition:", v25, v29, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

uint64_t __79__PXFavoritesSettings_favoritesSubmoduleWithFavoritesSettingsKeyPath_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__PXFavoritesSettings_favoritesSubmoduleWithFavoritesSettingsKeyPath_delegate___block_invoke_2;
  v9[3] = &unk_1E5136E78;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v6, "_requestFavoriteSettingsAtIndex:fromViewController:resultHandler:", v5, v7, v9);

  return 1;
}

void __79__PXFavoritesSettings_favoritesSubmoduleWithFavoritesSettingsKeyPath_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = a2;
    objc_msgSend(v2, "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3F20], "px_viewControllerWithSettings:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "pushViewController:animated:", v4, 1);
  }
}

- (id)parentSettings
{
  return 0;
}

- (BOOL)isFavoriteSettings:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v4 = a3;
  -[PXFavoritesSettings favoritesSettingsClassNames](self, "favoritesSettingsClassNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();

  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v5, "containsObject:", v7);

  return (char)v6;
}

- (void)setIsFavorite:(BOOL)a3 settings:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  id v13;

  v4 = a3;
  v6 = a4;
  -[PXFavoritesSettings favoritesSettingsClassNames](self, "favoritesSettingsClassNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = v10;

  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v13, "insertObject:atIndex:", v12, 0);
  else
    objc_msgSend(v13, "removeObject:", v12);
  -[PXFavoritesSettings setFavoritesSettingsClassNames:](self, "setFavoritesSettingsClassNames:", v13);

}

- (void)setFavoritesSettingsClassNames:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *favoritesSettingsClassNames;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_favoritesSettingsClassNames;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      favoritesSettingsClassNames = self->_favoritesSettingsClassNames;
      self->_favoritesSettingsClassNames = v6;

      -[PXSettings save](self, "save");
      -[PXFavoritesSettings _notifyChange](self, "_notifyChange");
    }
  }

}

- (void)_notifyChange
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; i != 50; ++i)
  {
    -[PXFavoritesSettings _keyForFavoriteNameAtIndex:](self, "_keyForFavoriteNameAtIndex:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

    -[PXFavoritesSettings _keyForFavoriteExistingAtIndex:](self, "_keyForFavoriteExistingAtIndex:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        -[PXFavoritesSettings willChangeValueForKey:](self, "willChangeValueForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (k = 0; k != v14; ++k)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * k);
        -[PXFavoritesSettings didChangeValueForKey:](self, "didChangeValueForKey:", v17, (_QWORD)v19);
        -[PTSettings invalidateValueForKey:](self, "invalidateValueForKey:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  -[PXSettings save](self, "save");
  -[PXFavoritesSettings delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "favoritesSettingsDidChangeFavorites:", self);

}

- (void)_requestFavoriteSettingsAtIndex:(int64_t)a3 fromViewController:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t (**v15)(void);
  _QWORD v16[4];
  id v17;
  id v18;
  PXFavoritesSettings *v19;
  id v20;
  uint64_t (**v21)(void);
  int64_t v22;
  _QWORD aBlock[4];
  id v24;
  id v25;

  v8 = a4;
  v9 = a5;
  -[PXFavoritesSettings favoritesSettingsClassNames](self, "favoritesSettingsClassNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PXFavoritesSettings__requestFavoriteSettingsAtIndex_fromViewController_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5136EA0;
  v13 = v11;
  v24 = v13;
  v14 = v9;
  v25 = v14;
  v15 = (uint64_t (**)(void))_Block_copy(aBlock);
  if ((v15[2]() & 1) == 0)
  {
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __88__PXFavoritesSettings__requestFavoriteSettingsAtIndex_fromViewController_resultHandler___block_invoke_2;
    v16[3] = &unk_1E513AC50;
    v21 = v15;
    v17 = v13;
    v22 = a3;
    v18 = v10;
    v19 = self;
    v20 = v8;
    -[PXFavoritesSettings _performBlockAfterLoadingAccessorySettings:](self, "_performBlockAfterLoadingAccessorySettings:", v16);

  }
}

- (id)_keyForFavoriteNameAtIndex:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%li"), CFSTR("favoriteName"), a3);
}

- (id)_keyForFavoriteExistingAtIndex:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%li"), CFSTR("hasFavorite"), a3);
}

- (void)_performBlockAfterLoadingAccessorySettings:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[PXFavoritesSettings delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__PXFavoritesSettings__performBlockAfterLoadingAccessorySettings___block_invoke;
    v6[3] = &unk_1E5148A40;
    v7 = v4;
    objc_msgSend(v5, "favoritesSettings:loadAccessorySettingsWithCompletionHandler:", self, v6);

  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], v4);
  }

}

- (id)valueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  unsigned int (**v7)(void *, const __CFString *);
  void *v8;
  unint64_t v9;
  NSString *v10;
  Class v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  objc_super v18;
  _QWORD v19[5];
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__PXFavoritesSettings_valueForKey___block_invoke;
  aBlock[3] = &unk_1E5136EF0;
  v6 = v4;
  v21 = v6;
  v22 = &v23;
  v7 = (unsigned int (**)(void *, const __CFString *))_Block_copy(aBlock);
  -[PXFavoritesSettings favoritesSettingsClassNames](self, "favoritesSettingsClassNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7[2](v7, CFSTR("favoriteName")))
  {
    v9 = v24[3];
    if (v9 >= objc_msgSend(v8, "count"))
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v24[3]);
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      v11 = NSClassFromString(v10);
      if (-[objc_class isSubclassOfClass:](v11, "isSubclassOfClass:", objc_opt_class()))
      {
        -[objc_class settingsControllerModule](v11, "settingsControllerModule");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "valueForKey:", CFSTR("title"));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v10);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!self->_didEncounterUnknownSettingsClassName)
        {
          self->_didEncounterUnknownSettingsClassName = 1;
          v19[0] = v5;
          v19[1] = 3221225472;
          v19[2] = __35__PXFavoritesSettings_valueForKey___block_invoke_2;
          v19[3] = &unk_1E5149198;
          v19[4] = self;
          -[PXFavoritesSettings _performBlockAfterLoadingAccessorySettings:](self, "_performBlockAfterLoadingAccessorySettings:", v19);
        }
      }

    }
    v16 = &stru_1E5149688;
    if (v13)
      v16 = v13;
    v15 = v16;

  }
  else
  {
    if (v7[2](v7, CFSTR("hasFavorite")))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24[3] < (unint64_t)objc_msgSend(v8, "count"));
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18.receiver = self;
      v18.super_class = (Class)PXFavoritesSettings;
      -[PXFavoritesSettings valueForKey:](&v18, sel_valueForKey_, v6);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (__CFString *)v14;
  }

  _Block_object_dispose(&v23, 8);
  return v15;
}

- (PXFavoritesSettingsDelegate)delegate
{
  return (PXFavoritesSettingsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)favoritesSettingsClassNames
{
  return self->_favoritesSettingsClassNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoritesSettingsClassNames, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __35__PXFavoritesSettings_valueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", v3);
  if ((_DWORD)v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringFromIndex:", objc_msgSend(v3, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "integerValue");

  }
  return v4;
}

uint64_t __35__PXFavoritesSettings_valueForKey___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyChange");
}

void __66__PXFavoritesSettings__performBlockAfterLoadingAccessorySettings___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

uint64_t __88__PXFavoritesSettings__requestFavoriteSettingsAtIndex_fromViewController_resultHandler___block_invoke(uint64_t a1)
{
  Class v2;
  char v3;
  void *v4;

  v2 = NSClassFromString(*(NSString **)(a1 + 32));
  v3 = objc_opt_respondsToSelector();
  if ((v3 & 1) != 0)
  {
    -[objc_class sharedInstance](v2, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  return v3 & 1;
}

void __88__PXFavoritesSettings__requestFavoriteSettingsAtIndex_fromViewController_resultHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;

  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))() & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The class ”%@” doesn't appear to exist anymore."), *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Couldn't find internal settings"), v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAction:", v5);

    v6 = (void *)MEMORY[0x1E0DC3448];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __88__PXFavoritesSettings__requestFavoriteSettingsAtIndex_fromViewController_resultHandler___block_invoke_3;
    v11[3] = &unk_1E5136EC8;
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 48);
    v12 = v7;
    v13 = v9;
    v14 = v8;
    objc_msgSend(v6, "actionWithTitle:style:handler:", CFSTR("Remove"), 2, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAction:", v10);

    objc_msgSend(*(id *)(a1 + 56), "presentViewController:animated:completion:", v4, 1, 0);
  }
}

void __88__PXFavoritesSettings__requestFavoriteSettingsAtIndex_fromViewController_resultHandler___block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v2, "removeObjectAtIndex:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setFavoritesSettingsClassNames:", v2);

}

void __42__PXFavoritesSettings_transientProperties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___PXFavoritesSettings;
  objc_msgSendSuper2(&v5, sel_transientProperties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_delegate);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObject:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)transientProperties_transientProperties_212469;
  transientProperties_transientProperties_212469 = v3;

}

@end

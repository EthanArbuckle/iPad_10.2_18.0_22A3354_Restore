@implementation SBHIconStylePreviewManager

- (SBHIconStylePreviewManager)initWithIconListViews:(id)a3 additionalIconViews:(id)a4 iconImageCache:(id)a5 folderIconImageCache:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SBHIconStylePreviewManager *v14;
  uint64_t v15;
  NSArray *iconListViews;
  uint64_t v17;
  NSArray *additionalIconViews;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBHIconStylePreviewManager;
  v14 = -[SBHIconStylePreviewManager init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    iconListViews = v14->_iconListViews;
    v14->_iconListViews = (NSArray *)v15;

    v17 = objc_msgSend(v11, "copy");
    additionalIconViews = v14->_additionalIconViews;
    v14->_additionalIconViews = (NSArray *)v17;

    objc_storeStrong((id *)&v14->_iconImageCache, a5);
    objc_storeStrong((id *)&v14->_folderIconImageCache, a6);
    -[SBHIconStylePreviewManager prepare](v14, "prepare");
  }

  return v14;
}

- (void)prepare
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[SBHIconStylePreviewManager allIconViews](self, "allIconViews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bs_compactMap:", &__block_literal_global_32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (-[SBHIconStylePreviewManager canTintIconSpecially:](self, "canTintIconSpecially:", v10))
        {
          objc_msgSend(v4, "addObject:", v10);
        }
        else if (objc_msgSend(v10, "isFolderIcon"))
        {
          objc_msgSend(v10, "folder");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstList");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __37__SBHIconStylePreviewManager_prepare__block_invoke_2;
          v15[3] = &unk_1E8D87A40;
          v15[4] = self;
          objc_msgSend(v12, "directlyContainedIconsPassingTest:", v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  -[SBHIconStylePreviewManager setTintableIcons:](self, "setTintableIcons:", v4);
}

uint64_t __37__SBHIconStylePreviewManager_prepare__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "icon");
}

uint64_t __37__SBHIconStylePreviewManager_prepare__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "canTintIconSpecially:", a2);
}

- (BOOL)canTintIconSpecially:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  char v6;

  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v3, "isApplicationIcon") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v3, "isBookmarkIcon");
  }

  return v6;
}

- (void)updateUIWithTintedImageStyleConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v4 = a3;
  if (!-[SBHIconStylePreviewManager isGeneratingTintedImages](self, "isGeneratingTintedImages"))
  {
    -[SBHIconStylePreviewManager setGeneratingTintedImages:](self, "setGeneratingTintedImages:", 1);
    v5 = mach_continuous_time();
    -[SBHIconStylePreviewManager tintableIcons](self, "tintableIcons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconStylePreviewManager iconImageCache](self, "iconImageCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iconImageAppearanceWithUserInterfaceStyle:", -[SBHIconStylePreviewManager configurationUserInterfaceStyle](self, "configurationUserInterfaceStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__SBHIconStylePreviewManager_updateUIWithTintedImageStyleConfiguration___block_invoke;
    v10[3] = &unk_1E8D88960;
    v10[4] = self;
    v12 = v5;
    v11 = v4;
    v9 = (id)objc_msgSend(v7, "cacheImagesForIcons:imageAppearance:priority:reason:options:completionHandler:", v6, v8, 4, CFSTR("SBHIconStylePreviewManager tint images"), 0, v10);

  }
}

uint64_t __72__SBHIconStylePreviewManager_updateUIWithTintedImageStyleConfiguration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setGeneratingTintedImages:", 0);
  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  objc_msgSend(*(id *)(a1 + 32), "informObserversOfPreviewGenerationWithDuration:");
  return objc_msgSend(*(id *)(a1 + 32), "applyTintedImagesToIconViewsWithImageStyleConfiguration:", *(_QWORD *)(a1 + 40));
}

- (void)applyTintedImagesToIconViewsWithImageStyleConfiguration:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  int64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SBHIconStylePreviewManager configurationUserInterfaceStyle](self, "configurationUserInterfaceStyle");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__SBHIconStylePreviewManager_applyTintedImagesToIconViewsWithImageStyleConfiguration___block_invoke;
  v16[3] = &unk_1E8D88988;
  v6 = v4;
  v17 = v6;
  v18 = v5;
  -[SBHIconStylePreviewManager enumerateIconViewsUsingBlock:](self, "enumerateIconViewsUsingBlock:", v16);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SBHIconStylePreviewManager additionalViewsAffectedByUserInterfaceStyle](self, "additionalViewsAffectedByUserInterfaceStyle", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setOverrideUserInterfaceStyle:", v5);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
    }
    while (v9);
  }

}

void __86__SBHIconStylePreviewManager_applyTintedImagesToIconViewsWithImageStyleConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOverrideIconImageStyleConfiguration:", *(_QWORD *)(a1 + 32));
  v4 = objc_msgSend(v3, "isWidgetIcon");
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_msgSend(v5, "widgetAppearanceWithUserInterfaceStyle:", v6);
  else
    objc_msgSend(v5, "iconImageAppearanceWithUserInterfaceStyle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOverrideUserInterfaceStyle:", objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_userInterfaceStyleForIconImageAppearance:", v7));

}

- (void)updateUIWithImageStyleConfiguration:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "configurationType");
  if (v4 >= 4)
  {
    if (v4 == 4)
      -[SBHIconStylePreviewManager updateUIWithTintedImageStyleConfiguration:](self, "updateUIWithTintedImageStyleConfiguration:", v5);
  }
  else
  {
    -[SBHIconStylePreviewManager updateUIWithNonTintedImageStyleConfiguration:](self, "updateUIWithNonTintedImageStyleConfiguration:", v5);
  }

}

- (void)updateUIWithNonTintedImageStyleConfiguration:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  int64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SBHIconStylePreviewManager configurationUserInterfaceStyle](self, "configurationUserInterfaceStyle");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__SBHIconStylePreviewManager_updateUIWithNonTintedImageStyleConfiguration___block_invoke;
  v16[3] = &unk_1E8D88988;
  v6 = v4;
  v17 = v6;
  v18 = v5;
  -[SBHIconStylePreviewManager enumerateIconViewsUsingBlock:](self, "enumerateIconViewsUsingBlock:", v16);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SBHIconStylePreviewManager additionalViewsAffectedByUserInterfaceStyle](self, "additionalViewsAffectedByUserInterfaceStyle", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setOverrideUserInterfaceStyle:", v5);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
    }
    while (v9);
  }

}

void __75__SBHIconStylePreviewManager_updateUIWithNonTintedImageStyleConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOverrideIconImageStyleConfiguration:", *(_QWORD *)(a1 + 32));
  v4 = *(_QWORD *)(a1 + 40);
  if (objc_msgSend(v3, "isWidgetIcon"))
  {
    objc_msgSend(*(id *)(a1 + 32), "widgetAppearanceWithUserInterfaceStyle:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_userInterfaceStyleForIconImageAppearance:", v5);

  }
  objc_msgSend(v6, "setOverrideUserInterfaceStyle:", v4);

}

- (void)setImageStyleConfiguration:(id)a3
{
  SBHIconImageStyleConfiguration *v4;
  SBHIconImageStyleConfiguration *imageStyleConfiguration;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconImageStyleConfiguration *)objc_msgSend(v6, "copy");
    imageStyleConfiguration = self->_imageStyleConfiguration;
    self->_imageStyleConfiguration = v4;

    if (v6)
      -[SBHIconStylePreviewManager updateUIWithImageStyleConfiguration:](self, "updateUIWithImageStyleConfiguration:", v6);
    else
      -[SBHIconStylePreviewManager pausePreviewing](self, "pausePreviewing");
  }

}

- (void)pausePreviewing
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[SBHIconStylePreviewManager enumerateIconViewsUsingBlock:](self, "enumerateIconViewsUsingBlock:", &__block_literal_global_13);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[SBHIconStylePreviewManager additionalViewsAffectedByUserInterfaceStyle](self, "additionalViewsAffectedByUserInterfaceStyle", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setOverrideUserInterfaceStyle:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __45__SBHIconStylePreviewManager_pausePreviewing__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setOverrideIconImageStyleConfiguration:", 0);
  objc_msgSend(v2, "setOverrideUserInterfaceStyle:", 0);

}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (id)allIconViews
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SBHIconStylePreviewManager iconListViews](self, "iconListViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __42__SBHIconStylePreviewManager_allIconViews__block_invoke;
        v13[3] = &unk_1E8D85CC0;
        v14 = v3;
        objc_msgSend(v10, "enumerateDisplayedIconViewsUsingBlock:", v13);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  -[SBHIconStylePreviewManager additionalIconViews](self, "additionalIconViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  return v3;
}

uint64_t __42__SBHIconStylePreviewManager_allIconViews__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)enumerateIconViewsUsingBlock:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SBHIconStylePreviewManager *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self;
  -[SBHIconStylePreviewManager iconListViews](self, "iconListViews");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v28;
    v8 = MEMORY[0x1E0C809B0];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v7)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v26 = 0;
      v20[0] = v8;
      v20[1] = 3221225472;
      v20[2] = __59__SBHIconStylePreviewManager_enumerateIconViewsUsingBlock___block_invoke;
      v20[3] = &unk_1E8D86D60;
      v21 = v4;
      v22 = &v23;
      objc_msgSend(v10, "enumerateDisplayedIconViewsUsingBlock:", v20);
      LOBYTE(v10) = *((_BYTE *)v24 + 24) == 0;

      _Block_object_dispose(&v23, 8);
      if ((v10 & 1) == 0)
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    -[SBHIconStylePreviewManager additionalIconViews](v15, "additionalIconViews");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v31, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
LABEL_11:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v5);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13);
        LOBYTE(v23) = 0;
        (*((void (**)(id, uint64_t, uint64_t *))v4 + 2))(v4, v14, &v23);
        if ((_BYTE)v23)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v31, 16);
          if (v11)
            goto LABEL_11;
          break;
        }
      }
    }

  }
}

uint64_t __59__SBHIconStylePreviewManager_enumerateIconViewsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  char v6;

  v6 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v6)
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (int64_t)configurationUserInterfaceStyle
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[SBHIconStylePreviewManager iconListViews](self, "iconListViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_highestLevelTraitCollectionForView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  return v5;
}

- (void)informObserversOfPreviewGenerationWithDuration:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "stylePreviewManager:didGeneratePreviewsInDuration:", self, a3);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (NSArray)iconListViews
{
  return self->_iconListViews;
}

- (NSArray)additionalIconViews
{
  return self->_additionalIconViews;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return self->_folderIconImageCache;
}

- (NSArray)additionalViewsAffectedByUserInterfaceStyle
{
  return self->_additionalViewsAffectedByUserInterfaceStyle;
}

- (void)setAdditionalViewsAffectedByUserInterfaceStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SBHIconImageStyleConfiguration)imageStyleConfiguration
{
  return self->_imageStyleConfiguration;
}

- (NSArray)tintableIcons
{
  return self->_tintableIcons;
}

- (void)setTintableIcons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isGeneratingTintedImages
{
  return self->_generatingTintedImages;
}

- (void)setGeneratingTintedImages:(BOOL)a3
{
  self->_generatingTintedImages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintableIcons, 0);
  objc_storeStrong((id *)&self->_imageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_additionalViewsAffectedByUserInterfaceStyle, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_additionalIconViews, 0);
  objc_storeStrong((id *)&self->_iconListViews, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end

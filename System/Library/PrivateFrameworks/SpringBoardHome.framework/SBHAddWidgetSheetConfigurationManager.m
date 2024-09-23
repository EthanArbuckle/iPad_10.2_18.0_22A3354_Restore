@implementation SBHAddWidgetSheetConfigurationManager

- (SBHAddWidgetSheetConfigurationManager)initWithWidgetExtensionProvider:(id)a3
{
  id v5;
  SBHAddWidgetSheetConfigurationManager *v6;
  SBHAddWidgetSheetConfigurationManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHAddWidgetSheetConfigurationManager;
  v6 = -[SBHAddWidgetSheetConfigurationManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_widgetExtensionProvider, a3);
    v7->_allowedWidgetFamilies = 94;
    -[SBHAddWidgetSheetConfigurationManager setAllowsFakeWidgets:](v7, "setAllowsFakeWidgets:", 1);
    -[SBHAddWidgetSheetConfigurationManager setMinimumRequiredSDKVersion:](v7, "setMinimumRequiredSDKVersion:", 0);
  }

  return v7;
}

- (void)fetchGalleryContentForStackConfigurationViewController:(id)a3 addWidgetSheetViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  SBHIconGridSizeClassSet *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SBHAddWidgetSheetConfigurationManager *v17;
  id v18;
  unint64_t v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sourceStackIconView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[SBHAddWidgetSheetConfigurationManager _stackConfigurationGridSize](self, "_stackConfigurationGridSize");
    objc_msgSend(v8, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gridSizeClass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[SBHIconGridSizeClassSet initWithGridSizeClass:]([SBHIconGridSizeClassSet alloc], "initWithGridSizeClass:", v11);
    v13 = -[SBHIconGridSizeClassSet chsWidgetFamilyMask](v12, "chsWidgetFamilyMask");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __125__SBHAddWidgetSheetConfigurationManager_fetchGalleryContentForStackConfigurationViewController_addWidgetSheetViewController___block_invoke;
    v14[3] = &unk_1E8D8D8B0;
    v15 = v6;
    v16 = v8;
    v17 = self;
    v18 = v7;
    v19 = v9;
    -[SBHAddWidgetSheetConfigurationManager _fetchGalleryContentForGridSize:withFamilyMask:completion:](self, "_fetchGalleryContentForGridSize:withFamilyMask:completion:", v9, v13, v14);

  }
}

void __125__SBHAddWidgetSheetConfigurationManager_fetchGalleryContentForStackConfigurationViewController_addWidgetSheetViewController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sourceStackIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  v5 = v8;
  if (v3 == v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "setStackConfigurationSuggestedWidgetItems:", v8);
    objc_msgSend(*(id *)(a1 + 56), "presenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "presenterType") == 2)
      objc_msgSend(*(id *)(a1 + 56), "setSuggestedItems:forGalleryLayoutSize:", v8, *(_QWORD *)(a1 + 64));

    v5 = v8;
  }

}

- (void)fetchGalleryContentForHomeScreenEditingWithGridSize:(unint64_t)a3 addWidgetSheetViewController:(id)a4
{
  id v6;
  unint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  v7 = -[SBHAddWidgetSheetConfigurationManager _defaultEditingSuggestedWidgetItemsFamilyMask](self, "_defaultEditingSuggestedWidgetItemsFamilyMask");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __122__SBHAddWidgetSheetConfigurationManager_fetchGalleryContentForHomeScreenEditingWithGridSize_addWidgetSheetViewController___block_invoke;
  v9[3] = &unk_1E8D8D8D8;
  v9[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[SBHAddWidgetSheetConfigurationManager _fetchGalleryContentForGridSize:withFamilyMask:completion:](self, "_fetchGalleryContentForGridSize:withFamilyMask:completion:", a3, v7, v9);

}

void __122__SBHAddWidgetSheetConfigurationManager_fetchGalleryContentForHomeScreenEditingWithGridSize_addWidgetSheetViewController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setEditingSuggestedWidgetItems:");
  objc_msgSend(*(id *)(a1 + 40), "presenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "presenterType") != 2)
    objc_msgSend(*(id *)(a1 + 40), "setSuggestedItems:forGalleryLayoutSize:", v5, *(_QWORD *)(a1 + 48));

}

- (void)_fetchGalleryContentForGridSize:(unint64_t)a3 withFamilyMask:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  unint64_t v14;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CF8D68], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[SBHAddWidgetSheetConfigurationManager _galleryVariantForAddWidgetSheetLocation:](SBHAddWidgetSheetConfigurationManager, "_galleryVariantForAddWidgetSheetLocation:", -[SBHAddWidgetSheetConfigurationManager addWidgetSheetLocation](self, "addWidgetSheetLocation"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __99__SBHAddWidgetSheetConfigurationManager__fetchGalleryContentForGridSize_withFamilyMask_completion___block_invoke;
  v12[3] = &unk_1E8D8D900;
  v13 = v8;
  v14 = a4;
  v11 = v8;
  objc_msgSend(v9, "fetchGalleryItemsForVariant:gridSize:supportedFamilies:completionHandler:", v10, a3, a4, v12);

}

void __99__SBHAddWidgetSheetConfigurationManager__fetchGalleryContentForGridSize_withFamilyMask_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  CHSWidgetFamilyMaskDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogWidgets();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __99__SBHAddWidgetSheetConfigurationManager__fetchGalleryContentForGridSize_withFamilyMask_completion___block_invoke_cold_1((uint64_t)v7, v6, v9);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__SBHAddWidgetSheetConfigurationManager__fetchGalleryContentForGridSize_withFamilyMask_completion___block_invoke_8;
    block[3] = &unk_1E8D859C0;
    v10 = &v15;
    v15 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_DEFAULT, "Found suggested widget items [of families: %@]: %@", buf, 0x16u);
    }

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __99__SBHAddWidgetSheetConfigurationManager__fetchGalleryContentForGridSize_withFamilyMask_completion___block_invoke_10;
    v11[3] = &unk_1E8D85C70;
    v10 = &v13;
    v13 = *(id *)(a1 + 32);
    v12 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

uint64_t __99__SBHAddWidgetSheetConfigurationManager__fetchGalleryContentForGridSize_withFamilyMask_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __99__SBHAddWidgetSheetConfigurationManager__fetchGalleryContentForGridSize_withFamilyMask_completion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (unint64_t)_galleryVariantForAddWidgetSheetLocation:(unint64_t)a3
{
  return a3 == 2;
}

- (unint64_t)_stackConfigurationGridSize
{
  return 2 * (-[SBHAddWidgetSheetConfigurationManager addWidgetSheetStyle](self, "addWidgetSheetStyle") == 1);
}

- (unint64_t)_defaultEditingSuggestedWidgetItemsFamilyMask
{
  if (-[SBHAddWidgetSheetConfigurationManager addWidgetSheetStyle](self, "addWidgetSheetStyle") == 1)
    return 30;
  else
    return 14;
}

- (id)applicationWidgetCollectionsForEditingViewController:(id)a3 withAllowedSizeClasses:(id *)a4 allowingNonStackableItems:(BOOL)a5
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __CFString **v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  int v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v45;
  __CFString *v46;
  _BOOL4 v47;
  id v49;
  uint64_t v50;
  id v51;
  void *v52;
  SBHAddWidgetSheetConfigurationManager *v53;
  void *v54;
  _QWORD v55[5];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v47 = a5;
  v68 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v51 = *a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = objc_claimAutoreleasedReturnValue();
  -[CHSWidgetExtensionProvider sbh_descriptorsByExtensionIdentifier](self->_widgetExtensionProvider, "sbh_descriptorsByExtensionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_opt_new();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  v53 = self;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v63 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        SBHContainingBundleIdentifierForWidgetWithBundleIdentifier(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __143__SBHAddWidgetSheetConfigurationManager_applicationWidgetCollectionsForEditingViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke;
        v61[3] = &unk_1E8D8CD28;
        v61[4] = self;
        objc_msgSend(v14, "bs_filter:", v61);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 && objc_msgSend(v15, "count"))
        {
          objc_msgSend(v54, "objectForKey:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            v16 = (void *)objc_opt_new();
            objc_msgSend(v54, "setValue:forKey:", v16, v13);
          }
          objc_msgSend(v16, "addObjectsFromArray:", v15);

          self = v53;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    }
    while (v9);
  }

  v17 = (void *)v50;
  -[SBHAddWidgetSheetConfigurationManager _addFakeWidgetsToApplicationWidgetCollectionsIfAllowed:](self, "_addFakeWidgetsToApplicationWidgetCollectionsIfAllowed:", v50);
  v18 = objc_msgSend(v49, "presenterType");
  v19 = v18;
  if (v18)
  {
    if (v18 != 1)
    {
      v22 = 0;
      v21 = v51;
      goto LABEL_20;
    }
    v20 = SBIconLocationTodayView;
  }
  else
  {
    v20 = SBIconLocationRoot;
  }
  v21 = v51;
  v22 = *v20;
  if (v22)
  {
    -[SBHAddWidgetSheetConfigurationManager listLayoutProvider](self, "listLayoutProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutForIconLocation:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    SBHIconListLayoutSupportedIconGridSizeClasses(v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v25;
  }
LABEL_20:
  -[SBHAddWidgetSheetConfigurationManager configurationManagerDelegate](self, "configurationManagerDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_respondsToSelector();
  if (v19 == 1 && (v27 & 1) != 0)
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(v26, "rootFolderForAddWidgetSheetConfigurationManager:", self);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "todayList");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "icons");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v31)
    {
      v32 = v31;
      v45 = v26;
      v46 = v22;
      v52 = v21;
      v33 = *(_QWORD *)v58;
      while (2)
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v58 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
          if (objc_msgSend(v35, "isWidgetIcon"))
          {
            objc_msgSend(v35, "gridSizeClass");
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v36 == CFSTR("SBHIconGridSizeClassNewsLargeTall"))
            {

              self = v53;
LABEL_34:
              objc_msgSend(v52, "gridSizeClassSetByRemovingGridSizeClass:", CFSTR("SBHIconGridSizeClassNewsLargeTall"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_35;
            }
            v37 = v36;
            objc_msgSend(v35, "gridSizeClass");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("SBHIconGridSizeClassNewsLargeTall"));

            self = v53;
            if (v39)
              goto LABEL_34;
          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
        if (v32)
          continue;
        break;
      }
      v21 = v52;
LABEL_35:
      v17 = (void *)v50;
      v26 = v45;
      v22 = v46;
    }

  }
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __143__SBHAddWidgetSheetConfigurationManager_applicationWidgetCollectionsForEditingViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke_2;
  v55[3] = &unk_1E8D8D928;
  v55[4] = self;
  v40 = v17;
  v56 = v40;
  objc_msgSend(v54, "enumerateKeysAndObjectsUsingBlock:", v55);
  -[SBHAddWidgetSheetConfigurationManager _sortApplicationWidgetCollections:](self, "_sortApplicationWidgetCollections:", v40);
  if (v47)
    -[SBHAddWidgetSheetConfigurationManager _insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections:](self, "_insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections:", v40);
  v41 = objc_retainAutorelease(v21);
  *a4 = v41;
  v42 = v56;
  v43 = v40;

  return v43;
}

uint64_t __143__SBHAddWidgetSheetConfigurationManager_applicationWidgetCollectionsForEditingViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_isDescriptorAllowed:", v3)
    && objc_msgSend(*(id *)(a1 + 32), "_isDescriptorSupported:", v3)
    && objc_msgSend(*(id *)(a1 + 32), "_isDescriptorUpdatedForSDKRequirements:", v3))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "_isDescriptorContainerUnprotected:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __143__SBHAddWidgetSheetConfigurationManager_applicationWidgetCollectionsForEditingViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SBHApplicationWidgetCollection *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "iconModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationIconForBundleIdentifier:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "vendorNameForAppWithBundleIdentifier:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBHApplicationWidgetCollection initWithIcon:galleryItems:vendorName:]([SBHApplicationWidgetCollection alloc], "initWithIcon:galleryItems:vendorName:", v7, v5, v8);
  if (!v7)
  {
    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "extensionIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "extensionBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SBHContainingBundleRecordForWidgetWithBundleIdentifier(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "localizedName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[SBHApplicationWidgetCollection setContainerName:](v9, "setContainerName:", v14);
    }
    else
    {
      objc_msgSend(v13, "localizedShortName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHApplicationWidgetCollection setContainerName:](v9, "setContainerName:", v15);

    }
    -[SBHApplicationWidgetCollection setIconImageApplicationBundleIdentifier:](v9, "setIconImageApplicationBundleIdentifier:", v16);

  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

}

- (id)applicationControlCollections
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  SBLeafIcon *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  SBHApplicationWidgetCollection *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  __int128 v46;
  __int128 v47;
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
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[CHSWidgetExtensionProvider containers](self->_widgetExtensionProvider, "containers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v38)
  {
    v36 = *(_QWORD *)v55;
    v37 = v3;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v55 != v36)
          objc_enumerationMutation(obj);
        v41 = v4;
        v5 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v4);
        objc_msgSend(v5, "containerBundleIdentifier");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = [SBLeafIcon alloc];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUIDString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[SBLeafIcon initWithLeafIdentifier:applicationBundleID:](v7, "initWithLeafIdentifier:applicationBundleID:", v9, v6);

        v40 = (void *)v6;
        -[SBHAddWidgetSheetConfigurationManager vendorNameForAppWithBundleIdentifier:](self, "vendorNameForAppWithBundleIdentifier:", v6);
        v42 = objc_claimAutoreleasedReturnValue();
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v39 = v5;
        objc_msgSend(v5, "allExtensions");
        v45 = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v51;
          v44 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v51 != v13)
                objc_enumerationMutation(v45);
              objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "orderedControlDescriptors");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v15, "count"))
              {
                objc_msgSend(v15, "firstObject");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = -[SBHAddWidgetSheetConfigurationManager _isDescriptorContainerUnprotected:](self, "_isDescriptorContainerUnprotected:", v16);

                if (v17)
                {
                  v48 = 0u;
                  v49 = 0u;
                  v46 = 0u;
                  v47 = 0u;
                  v18 = v15;
                  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
                  if (v19)
                  {
                    v20 = v19;
                    v21 = *(_QWORD *)v47;
                    do
                    {
                      for (j = 0; j != v20; ++j)
                      {
                        if (*(_QWORD *)v47 != v21)
                          objc_enumerationMutation(v18);
                        v23 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
                        if (-[SBHAddWidgetSheetConfigurationManager _isDescriptorSupportedByDelegate:](self, "_isDescriptorSupportedByDelegate:", v23))
                        {
                          objc_msgSend(v10, "addObject:", v23);
                        }
                      }
                      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
                    }
                    while (v20);
                  }

                  v13 = v44;
                }
              }

            }
            v12 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
          }
          while (v12);
        }

        v25 = (void *)v42;
        v24 = (void *)v43;
        v26 = -[SBHApplicationWidgetCollection initWithIcon:galleryItems:vendorName:]([SBHApplicationWidgetCollection alloc], "initWithIcon:galleryItems:vendorName:", v43, v10, v42);
        objc_msgSend(v39, "localizedContainerDisplayName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHApplicationWidgetCollection setContainerName:](v26, "setContainerName:", v27);

        if (!v43)
        {
          objc_msgSend(v10, "firstObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "extensionIdentity");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "extensionBundleIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          SBHContainingBundleRecordForWidgetWithBundleIdentifier(v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "localizedName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            -[SBHApplicationWidgetCollection setContainerName:](v26, "setContainerName:", v32);
          }
          else
          {
            objc_msgSend(v31, "localizedShortName");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBHApplicationWidgetCollection setContainerName:](v26, "setContainerName:", v33);

          }
          -[SBHApplicationWidgetCollection setIconImageApplicationBundleIdentifier:](v26, "setIconImageApplicationBundleIdentifier:", v40);

          v25 = (void *)v42;
          v24 = 0;
        }
        v3 = v37;
        objc_msgSend(v37, "addObject:", v26);

        v4 = v41 + 1;
      }
      while (v41 + 1 != v38);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v38);
  }

  -[SBHAddWidgetSheetConfigurationManager _addCustomApplicationWidgetCollectionsToApplicationWidgetCollections:](self, "_addCustomApplicationWidgetCollectionsToApplicationWidgetCollections:", v3);
  -[SBHAddWidgetSheetConfigurationManager _sortApplicationWidgetCollections:](self, "_sortApplicationWidgetCollections:", v3);
  return v3;
}

- (id)vendorNameForAppWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBHAddWidgetSheetConfigurationManager configurationManagerDelegate](self, "configurationManagerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "addWidgetSheetConfigurationManager:vendorNameForAppWithBundleIdentifier:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isDescriptorSupported:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "supportedFamilies");
  return (-[SBHAddWidgetSheetConfigurationManager allowedWidgetFamilies](self, "allowedWidgetFamilies") & v4) != 0;
}

- (BOOL)_isDescriptorAllowed:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA9D60], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "showInternalWidgets") & 1) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else if (-[SBHAddWidgetSheetConfigurationManager _isVisibilityWidgetDefined:](self, "_isVisibilityWidgetDefined:", objc_msgSend(v4, "widgetVisibility")))
  {
    v7 = objc_alloc(MEMORY[0x1E0C99EA0]);
    objc_msgSend(v4, "extensionBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithSuiteName:", v8);

    v10 = *MEMORY[0x1E0D0FF68];
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D0FF68]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = objc_msgSend(v9, "BOOLForKey:", v10);
    else
      v12 = -[SBHAddWidgetSheetConfigurationManager _isDescriptorVisibleByDefault:](self, "_isDescriptorVisibleByDefault:", v4);
    LOBYTE(v6) = v12;

  }
  else
  {
    v6 = objc_msgSend(v4, "isInternal") ^ 1;
  }

  return v6;
}

- (BOOL)_isDescriptorUpdatedForSDKRequirements:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBHAddWidgetSheetConfigurationManager homeScreenDefaults](self, "homeScreenDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "shouldIgnoreMinimumRequiredSDKVersionForWidgets") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v4, "sbh_isLinkedOnOrAfter:", -[SBHAddWidgetSheetConfigurationManager minimumRequiredSDKVersion](self, "minimumRequiredSDKVersion"));

  return v6;
}

- (BOOL)_isDescriptorContainerUnprotected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetConfigurationManager configurationManagerDelegate](self, "configurationManagerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "addWidgetSheetConfigurationManager:containerBundleIdentiferForDescriptor:", self, v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  if (v6)
    v9 = -[SBHAddWidgetSheetConfigurationManager _isContainerBundleIdentifierUnprotected:](self, "_isContainerBundleIdentifierUnprotected:", v6);
  else
    v9 = 1;

  return v9;
}

- (BOOL)_isContainerBundleIdentifierUnprotected:(id)a3
{
  void *v3;
  char v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");
  v5 = (v4 | objc_msgSend(v3, "isLocked")) ^ 1;

  return v5;
}

- (BOOL)_isDescriptorSupportedByDelegate:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBHAddWidgetSheetConfigurationManager configurationManagerDelegate](self, "configurationManagerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "addWidgetSheetConfigurationManager:isDescriptorSupported:", self, v4);
  else
    v6 = 1;

  return v6;
}

- (BOOL)_isVisibilityWidgetDefined:(int64_t)a3
{
  return (unint64_t)a3 > 1;
}

- (BOOL)_isDescriptorVisibleByDefault:(id)a3
{
  return ((objc_msgSend(a3, "widgetVisibility") - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (void)_sortApplicationWidgetCollections:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_67);
}

uint64_t __75__SBHAddWidgetSheetConfigurationManager__sortApplicationWidgetCollections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

- (void)_addCustomApplicationWidgetCollectionsToApplicationWidgetCollections:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBHAddWidgetSheetConfigurationManager configurationManagerDelegate](self, "configurationManagerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "customApplicationWidgetCollectionsForAddWidgetSheetConfigurationManager:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v5);

  }
}

- (void)updatePresentedWidgetEditingViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  id v8;
  uint64_t v9;
  char v10;
  char v11;
  SBHIconGridSizeClassSet *v12;
  void *v13;
  SBHIconGridSizeClassSet *v14;
  void *v15;
  SBHIconGridSizeClassSet *v16;
  SBHIconGridSizeClassSet *v17;

  v4 = a3;
  objc_msgSend(v4, "presenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = v4;
    v9 = objc_msgSend(v8, "allowedWidgets");
    v11 = v10;
    v12 = [SBHIconGridSizeClassSet alloc];
    -[SBHAddWidgetSheetConfigurationManager effectiveGridSizeClassDomain](self, "effectiveGridSizeClassDomain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBHIconGridSizeClassSet initWithCHSWidgetFamilyMask:inDomain:](v12, "initWithCHSWidgetFamilyMask:inDomain:", v9, v13);

    v17 = v14;
    -[SBHAddWidgetSheetConfigurationManager applicationWidgetCollectionsForEditingViewController:withAllowedSizeClasses:allowingNonStackableItems:](self, "applicationWidgetCollectionsForEditingViewController:withAllowedSizeClasses:allowingNonStackableItems:", v5, &v17, v11 & 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v17;

    objc_msgSend(v8, "setApplicationWidgetCollections:", v15);
  }

}

- (id)homeScreenDefaults
{
  SBHomeScreenDefaults *homeScreenDefaults;
  void *v4;
  SBHomeScreenDefaults *v5;
  SBHomeScreenDefaults *v6;

  homeScreenDefaults = self->_homeScreenDefaults;
  if (!homeScreenDefaults)
  {
    -[SBHAddWidgetSheetConfigurationManager configurationManagerDelegate](self, "configurationManagerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "homeScreenDefaultsForAddWidgetSheetConfigurationManager:", self);
      v5 = (SBHomeScreenDefaults *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (SBHomeScreenDefaults *)objc_alloc_init(MEMORY[0x1E0DA9F98]);
    }
    v6 = self->_homeScreenDefaults;
    self->_homeScreenDefaults = v5;

    homeScreenDefaults = self->_homeScreenDefaults;
  }
  return homeScreenDefaults;
}

- (id)effectiveGridSizeClassDomain
{
  void *v2;

  -[SBHAddWidgetSheetConfigurationManager gridSizeClassDomain](self, "gridSizeClassDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_addFakeWidgetsToApplicationWidgetCollectionsIfAllowed:(id)a3
{
  id v4;

  if (self->_allowsFakeWidgets)
  {
    v4 = a3;
    -[SBHAddWidgetSheetConfigurationManager _addShortcutsSpecialAvocadoToApplicationWidgetCollections:](self, "_addShortcutsSpecialAvocadoToApplicationWidgetCollections:", v4);
    -[SBHAddWidgetSheetConfigurationManager _addSiriSuggestionsSpecialAvocadosToApplicationWidgetCollections:](self, "_addSiriSuggestionsSpecialAvocadosToApplicationWidgetCollections:", v4);
    -[SBHAddWidgetSheetConfigurationManager _addFilesSpecialAvocadosToApplicationWidgetCollections:](self, "_addFilesSpecialAvocadosToApplicationWidgetCollections:", v4);

  }
}

- (void)_addShortcutsSpecialAvocadoToApplicationWidgetCollections:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBHApplicationWidgetCollection *v7;
  SBHSpecialWidgetDescriptor *v8;
  SBHSpecialWidgetDescriptor *v9;
  void *v10;
  void *v11;
  void *v12;
  SBHApplicationWidgetCollection *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBHAddWidgetSheetConfigurationManager _shouldAddSpecialAvocadoOfType:](self, "_shouldAddSpecialAvocadoOfType:", 2)|| -[SBHAddWidgetSheetConfigurationManager _shouldAddSpecialAvocadoOfType:](self, "_shouldAddSpecialAvocadoOfType:", 6))
  {
    -[SBHAddWidgetSheetConfigurationManager iconModel](self, "iconModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationIconForBundleIdentifier:", CFSTR("com.apple.shortcuts"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SBHApplicationWidgetCollection alloc];
      v8 = -[SBHSpecialWidgetDescriptor initWithType:]([SBHSpecialWidgetDescriptor alloc], "initWithType:", 6);
      v14[0] = v8;
      v9 = -[SBHSpecialWidgetDescriptor initWithType:]([SBHSpecialWidgetDescriptor alloc], "initWithType:", 2);
      v14[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      SBHBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("APPLE_WIDGET_COLLECTION_NAME"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SBHApplicationWidgetCollection initWithIcon:galleryItems:vendorName:](v7, "initWithIcon:galleryItems:vendorName:", v6, v10, v12);

      objc_msgSend(v4, "addObject:", v13);
    }

  }
}

- (void)_addSiriSuggestionsSpecialAvocadosToApplicationWidgetCollections:(id)a3
{
  id v4;
  SBHSpecialWidgetDescriptor *v5;
  SBHSpecialWidgetDescriptor *v6;
  void *v7;
  SBHApplicationWidgetCollection *v8;
  void *v9;
  void *v10;
  void *v11;
  SBHApplicationWidgetCollection *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBHAddWidgetSheetConfigurationManager _shouldAddSpecialAvocadoOfType:](self, "_shouldAddSpecialAvocadoOfType:", 1))
  {
    v5 = -[SBHSpecialWidgetDescriptor initWithType:]([SBHSpecialWidgetDescriptor alloc], "initWithType:", 1);
    v6 = -[SBHSpecialWidgetDescriptor initWithType:]([SBHSpecialWidgetDescriptor alloc], "initWithType:", 4);
    -[SBHAddWidgetSheetConfigurationManager _widgetIconForDescriptor:sizeClass:](self, "_widgetIconForDescriptor:sizeClass:", v5, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [SBHApplicationWidgetCollection alloc];
    v15[0] = v6;
    v15[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SBHBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("APPLE_WIDGET_COLLECTION_NAME"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBHApplicationWidgetCollection initWithIcon:galleryItems:vendorName:](v8, "initWithIcon:galleryItems:vendorName:", v7, v9, v11);

    SBHBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PROACTIVE_SUGGESTIONS_WIDGET_COLLECTION_NAME"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHApplicationWidgetCollection setContainerName:](v12, "setContainerName:", v14);

    objc_msgSend(v4, "addObject:", v12);
  }

}

- (void)_addFilesSpecialAvocadosToApplicationWidgetCollections:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBHApplicationWidgetCollection *v7;
  SBHSpecialWidgetDescriptor *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBHAddWidgetSheetConfigurationManager _shouldAddSpecialAvocadoOfType:](self, "_shouldAddSpecialAvocadoOfType:", 3)&& -[SBHAddWidgetSheetConfigurationManager _isContainerBundleIdentifierUnprotected:](self, "_isContainerBundleIdentifierUnprotected:", CFSTR("com.apple.DocumentsApp")))
  {
    -[SBHAddWidgetSheetConfigurationManager iconModel](self, "iconModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationIconForBundleIdentifier:", CFSTR("com.apple.DocumentsApp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SBHApplicationWidgetCollection alloc];
      v8 = -[SBHSpecialWidgetDescriptor initWithType:]([SBHSpecialWidgetDescriptor alloc], "initWithType:", 3);
      v13[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SBHBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("APPLE_WIDGET_COLLECTION_NAME"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SBHApplicationWidgetCollection initWithIcon:galleryItems:vendorName:](v7, "initWithIcon:galleryItems:vendorName:", v6, v9, v11);

      objc_msgSend(v4, "addObject:", v12);
    }
    else
    {
      SBLogWidgets();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SBHAddWidgetSheetConfigurationManager _addFilesSpecialAvocadosToApplicationWidgetCollections:].cold.1(v12);
    }

  }
}

- (void)_insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections:(id)a3
{
  id v4;
  SBHSpecialWidgetDescriptor *v5;
  void *v6;
  void *v7;
  SBHApplicationWidgetCollection *v8;
  void *v9;
  void *v10;
  SBHApplicationWidgetCollection *v11;
  void *v12;
  SBHApplicationWidgetCollection *v13;
  _QWORD v14[4];
  SBHApplicationWidgetCollection *v15;
  SBHAddWidgetSheetConfigurationManager *v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBHAddWidgetSheetConfigurationManager _shouldAddSpecialAvocadoOfType:](self, "_shouldAddSpecialAvocadoOfType:", 5))
  {
    v5 = -[SBHSpecialWidgetDescriptor initWithType:]([SBHSpecialWidgetDescriptor alloc], "initWithType:", 5);
    v18[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetSheetConfigurationManager _widgetIconForDescriptors:sizeClass:](self, "_widgetIconForDescriptors:sizeClass:", v6, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [SBHApplicationWidgetCollection alloc];
    SBHBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("APPLE_WIDGET_COLLECTION_NAME"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SBHApplicationWidgetCollection initWithIcon:galleryItems:vendorName:](v8, "initWithIcon:galleryItems:vendorName:", v7, MEMORY[0x1E0C9AA60], v10);

    objc_msgSend(v4, "insertObject:atIndex:", v11, 0);
    objc_msgSend(MEMORY[0x1E0CF8D68], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __112__SBHAddWidgetSheetConfigurationManager__insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections___block_invoke;
    v14[3] = &unk_1E8D8D970;
    v15 = v11;
    v16 = self;
    v17 = v4;
    v13 = v11;
    objc_msgSend(v12, "fetchSmartStackOfVariant:completionHandler:", 0, v14);

  }
}

void __112__SBHAddWidgetSheetConfigurationManager__insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    SBLogWidgets();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __112__SBHAddWidgetSheetConfigurationManager__insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections___block_invoke_cold_1(v5, v6);
  }
  else
  {
    objc_msgSend(a2, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogWidgets();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_DEFAULT, "Found suggested default widget stack: %@", buf, 0xCu);
    }

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __112__SBHAddWidgetSheetConfigurationManager__insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections___block_invoke_52;
    v12[3] = &unk_1E8D86330;
    v13 = v7;
    v9 = *(id *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v14 = v9;
    v15 = v10;
    v16 = v11;
    v6 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
}

void __112__SBHAddWidgetSheetConfigurationManager__insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections___block_invoke_52(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  SBHWidgetStackDescriptor *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  SBHWidgetStackDescriptor *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "smallDefaultStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v53;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v53 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v7), "avocadoDescriptor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sanitizedDescriptor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(v2, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v5);
  }

  v10 = (void *)objc_opt_new();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "mediumDefaultStack");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v49;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v49 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v15), "avocadoDescriptor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sanitizedDescriptor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend(v10, "addObject:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    }
    while (v13);
  }

  v18 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "largeDefaultStack");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v45;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v45 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v23), "avocadoDescriptor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sanitizedDescriptor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
          objc_msgSend(v18, "addObject:", v25);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
    }
    while (v21);
  }

  v26 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v39 = a1;
  objc_msgSend(*(id *)(a1 + 32), "extraLargeDefaultStack");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v41;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v41 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v31), "avocadoDescriptor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "sanitizedDescriptor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
          objc_msgSend(v26, "addObject:", v33);

        ++v31;
      }
      while (v29 != v31);
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
    }
    while (v29);
  }

  v34 = -[SBHWidgetStackDescriptor initWithSmallStackDescriptors:mediumStackDescriptors:largeStackDescriptors:extraLargeStackDescriptors:]([SBHWidgetStackDescriptor alloc], "initWithSmallStackDescriptors:mediumStackDescriptors:largeStackDescriptors:extraLargeStackDescriptors:", v2, v10, v18, v26);
  v35 = *(void **)(v39 + 40);
  v56 = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setWidgetDescriptors:", v36);

  objc_msgSend(*(id *)(v39 + 48), "configurationManagerDelegate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addWidgetSheetViewControllerForAddWidgetSheetConfigurationManager:", *(_QWORD *)(v39 + 48));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setApplicationWidgetCollections:", *(_QWORD *)(v39 + 56));

}

- (BOOL)_shouldAddSpecialAvocadoOfType:(unint64_t)a3
{
  const __CFString *v3;
  void *v4;
  BOOL v5;

  if (!self->_allowsFakeWidgets)
    return 0;
  v3 = CFSTR("com.apple.shortcuts");
  if (a3 != 2 && a3 != 6)
  {
    if (a3 != 3)
      return 1;
    v3 = CFSTR("com.apple.DocumentsApp");
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, 0);
  v5 = v4 != 0;

  return v5;
}

- (id)_widgetIconForDescriptor:(id)a3 sizeClass:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[SBHAddWidgetSheetConfigurationManager widgetDragHandlerDelegate](self, "widgetDragHandlerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "widgetIconForDescriptor:sizeClass:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_widgetIconForDescriptors:(id)a3 sizeClass:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[SBHAddWidgetSheetConfigurationManager widgetDragHandlerDelegate](self, "widgetDragHandlerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "widgetIconForDescriptors:sizeClass:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)stackConfigurationSuggestedWidgetItems
{
  return self->_stackConfigurationSuggestedWidgetItems;
}

- (void)setStackConfigurationSuggestedWidgetItems:(id)a3
{
  objc_storeStrong((id *)&self->_stackConfigurationSuggestedWidgetItems, a3);
}

- (NSArray)editingSuggestedWidgetItems
{
  return self->_editingSuggestedWidgetItems;
}

- (void)setEditingSuggestedWidgetItems:(id)a3
{
  objc_storeStrong((id *)&self->_editingSuggestedWidgetItems, a3);
}

- (unint64_t)addWidgetSheetStyle
{
  return self->_addWidgetSheetStyle;
}

- (void)setAddWidgetSheetStyle:(unint64_t)a3
{
  self->_addWidgetSheetStyle = a3;
}

- (unint64_t)addWidgetSheetLocation
{
  return self->_addWidgetSheetLocation;
}

- (void)setAddWidgetSheetLocation:(unint64_t)a3
{
  self->_addWidgetSheetLocation = a3;
}

- (unint64_t)allowedWidgetFamilies
{
  return self->_allowedWidgetFamilies;
}

- (void)setAllowedWidgetFamilies:(unint64_t)a3
{
  self->_allowedWidgetFamilies = a3;
}

- (unint64_t)minimumRequiredSDKVersion
{
  return self->_minimumRequiredSDKVersion;
}

- (void)setMinimumRequiredSDKVersion:(unint64_t)a3
{
  self->_minimumRequiredSDKVersion = a3;
}

- (CHSWidgetExtensionProvider)widgetExtensionProvider
{
  return self->_widgetExtensionProvider;
}

- (SBHIconModel)iconModel
{
  return (SBHIconModel *)objc_loadWeakRetained((id *)&self->_iconModel);
}

- (void)setIconModel:(id)a3
{
  objc_storeWeak((id *)&self->_iconModel, a3);
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return (SBIconListLayoutProvider *)objc_loadWeakRetained((id *)&self->_listLayoutProvider);
}

- (void)setListLayoutProvider:(id)a3
{
  objc_storeWeak((id *)&self->_listLayoutProvider, a3);
}

- (SBHWidgetDragHandling)widgetDragHandlerDelegate
{
  return (SBHWidgetDragHandling *)objc_loadWeakRetained((id *)&self->_widgetDragHandlerDelegate);
}

- (void)setWidgetDragHandlerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_widgetDragHandlerDelegate, a3);
}

- (SBHAddWidgetSheetConfigurationManagerDelegate)configurationManagerDelegate
{
  return (SBHAddWidgetSheetConfigurationManagerDelegate *)objc_loadWeakRetained((id *)&self->_configurationManagerDelegate);
}

- (void)setConfigurationManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_configurationManagerDelegate, a3);
}

- (BOOL)allowsFakeWidgets
{
  return self->_allowsFakeWidgets;
}

- (void)setAllowsFakeWidgets:(BOOL)a3
{
  self->_allowsFakeWidgets = a3;
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  return self->_gridSizeClassDomain;
}

- (void)setGridSizeClassDomain:(id)a3
{
  objc_storeStrong((id *)&self->_gridSizeClassDomain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridSizeClassDomain, 0);
  objc_destroyWeak((id *)&self->_configurationManagerDelegate);
  objc_destroyWeak((id *)&self->_widgetDragHandlerDelegate);
  objc_destroyWeak((id *)&self->_listLayoutProvider);
  objc_destroyWeak((id *)&self->_iconModel);
  objc_storeStrong((id *)&self->_widgetExtensionProvider, 0);
  objc_storeStrong((id *)&self->_editingSuggestedWidgetItems, 0);
  objc_storeStrong((id *)&self->_stackConfigurationSuggestedWidgetItems, 0);
  objc_storeStrong((id *)&self->_homeScreenDefaults, 0);
}

void __99__SBHAddWidgetSheetConfigurationManager__fetchGalleryContentForGridSize_withFamilyMask_completion___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1CFEF3000, a3, OS_LOG_TYPE_ERROR, "Couldn't fetch suggested widget items [of families: %@] with error: %@", (uint8_t *)&v6, 0x16u);

}

- (void)_addFilesSpecialAvocadosToApplicationWidgetCollections:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "Error adding Files applicationWidgetCollection: nil icon", v1, 2u);
}

void __112__SBHAddWidgetSheetConfigurationManager__insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "Couldn't fetch default widget stack with error: %@", (uint8_t *)&v4, 0xCu);

}

@end

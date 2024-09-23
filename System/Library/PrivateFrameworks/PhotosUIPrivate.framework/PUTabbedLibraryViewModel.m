@implementation PUTabbedLibraryViewModel

- (id)tabbedLibraryViewController:(id)a3 tabBarItemForContentMode:(int)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[PUTabbedLibraryViewModel tabInfoForContentMode:](self, "tabInfoForContentMode:", *(_QWORD *)&a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0DC3D40]);
  objc_msgSend(v5, "labelKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v5, "iconName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "systemImageNamed:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v6, "initWithTitle:image:tag:", v8, v11, a4);

  return v12;
}

- (id)tabInfoForContentMode:(int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PUTabbedLibraryViewModel tabInfos](self, "tabInfos", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "contentMode") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (NSArray)tabInfos
{
  return self->_tabInfos;
}

+ (PUTabbedLibraryViewModel)viewModelWithDefaultParameters
{
  void *v2;
  PUTabbedLibraryViewModel *v3;

  +[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PUTabbedLibraryViewModel initWithSettings:]([PUTabbedLibraryViewModel alloc], "initWithSettings:", v2);

  return v3;
}

- (PUTabbedLibraryViewModel)initWithSettings:(id)a3
{
  id v5;
  PUTabbedLibraryViewModel *v6;
  PUTabbedLibraryViewModel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *tabInfos;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  objc_super v23;
  _QWORD v24[12];

  v24[11] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PUTabbedLibraryViewModel;
  v6 = -[PUTabbedLibraryViewModel init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    +[PULibraryTabInfo tabInfoWithLabelKey:iconName:contentMode:](PULibraryTabInfo, "tabInfoWithLabelKey:iconName:contentMode:", CFSTR("CURATED_LIBRARY_TAB"), CFSTR("photo.fill.on.rectangle.fill"), 10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v21;
    +[PULibraryTabInfo tabInfoWithLabelKey:iconName:contentMode:](PULibraryTabInfo, "tabInfoWithLabelKey:iconName:contentMode:", CFSTR("ALL_PHOTOS_TAB"), CFSTR("photo.fill.on.rectangle.fill"), 14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v20;
    +[PULibraryTabInfo tabInfoWithLabelKey:iconName:contentMode:](PULibraryTabInfo, "tabInfoWithLabelKey:iconName:contentMode:", CFSTR("SHARED_TAB"), CFSTR("cloud.fill"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v19;
    +[PULibraryTabInfo tabInfoWithLabelKey:iconName:contentMode:](PULibraryTabInfo, "tabInfoWithLabelKey:iconName:contentMode:", CFSTR("FOR_YOU_TAB"), CFSTR("heart.text.square.fill"), 11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v8;
    v22 = v5;
    +[PULibraryTabInfo tabInfoWithLabelKey:iconName:contentMode:](PULibraryTabInfo, "tabInfoWithLabelKey:iconName:contentMode:", CFSTR("ALBUMS_TAB"), CFSTR("rectangle.stack.fill"), 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[4] = v9;
    +[PULibraryTabInfo tabInfoWithLabelKey:iconName:contentMode:](PULibraryTabInfo, "tabInfoWithLabelKey:iconName:contentMode:", CFSTR("ALBUMS_TAB"), CFSTR("rectangle.stack.fill"), 13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[5] = v10;
    +[PULibraryTabInfo tabInfoWithLabelKey:iconName:contentMode:](PULibraryTabInfo, "tabInfoWithLabelKey:iconName:contentMode:", CFSTR("SEARCH_TAB"), CFSTR("magnifyingglass"), 12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[6] = v11;
    +[PULibraryTabInfo tabInfoWithLabelKey:iconName:contentMode:](PULibraryTabInfo, "tabInfoWithLabelKey:iconName:contentMode:", CFSTR("IMPORT_TAB"), CFSTR("square.and.arrow.down.fill"), 6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[7] = v12;
    +[PULibraryTabInfo tabInfoWithLabelKey:iconName:contentMode:](PULibraryTabInfo, "tabInfoWithLabelKey:iconName:contentMode:", CFSTR("Explore"), CFSTR("lightbulb"), 990);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[8] = v13;
    +[PULibraryTabInfo tabInfoWithLabelKey:iconName:contentMode:](PULibraryTabInfo, "tabInfoWithLabelKey:iconName:contentMode:", CFSTR("BLANK_TAB"), CFSTR("photo.fill.on.rectangle.fill"), 1000);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[9] = v14;
    +[PULibraryTabInfo tabInfoWithLabelKey:iconName:contentMode:](PULibraryTabInfo, "tabInfoWithLabelKey:iconName:contentMode:", CFSTR("NIL_TAB"), CFSTR("photo.fill.on.rectangle.fill"), 1001);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[10] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 11);
    v16 = objc_claimAutoreleasedReturnValue();
    tabInfos = v7->_tabInfos;
    v7->_tabInfos = (NSArray *)v16;

    v5 = v22;
  }

  return v7;
}

- (BOOL)tabbedLibraryViewController:(id)a3 shouldShowTabForContentMode:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  BOOL v11;
  BOOL v13;
  void *v14;
  char v15;
  void *v16;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(v6, "excludedContentModes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) != 0
    || (v10 = -[PUTabbedLibraryViewModel _ppt_shouldShowNilTab](self, "_ppt_shouldShowNilTab"), (_DWORD)v4 != 1001)
    && v10)
  {
    v11 = 0;
  }
  else
  {
    v11 = 0;
    if ((int)v4 > 989)
    {
      if ((_DWORD)v4 != 990)
      {
        if ((_DWORD)v4 == 1000)
        {
          v13 = -[PUTabbedLibraryViewModel _ppt_shouldShowBlankTab](self, "_ppt_shouldShowBlankTab");
        }
        else
        {
          if ((_DWORD)v4 != 1001)
            goto LABEL_5;
          v13 = -[PUTabbedLibraryViewModel _ppt_shouldShowNilTab](self, "_ppt_shouldShowNilTab");
        }
LABEL_23:
        v11 = v13;
        goto LABEL_5;
      }
      -[PUTabbedLibraryViewModel settings](self, "settings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "enablePrototypeTab");
LABEL_21:
      v11 = v15;

    }
    else
    {
      switch((int)v4)
      {
        case 1:
          v13 = -[PUTabbedLibraryViewModel _shouldShowSharedTabForTabbedLibraryViewController:](self, "_shouldShowSharedTabForTabbedLibraryViewController:", v6);
          goto LABEL_23;
        case 2:
          -[PUTabbedLibraryViewModel settings](self, "settings");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "enableAlbumsTab");
          goto LABEL_21;
        case 6:
          objc_msgSend(v6, "importViewController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v16 != 0;

          break;
        case 10:
          v13 = -[PUTabbedLibraryViewModel _shouldShowCuratedLibraryTabForTabbedLibraryViewController:](self, "_shouldShowCuratedLibraryTabForTabbedLibraryViewController:", v6);
          goto LABEL_23;
        case 11:
          v13 = -[PUTabbedLibraryViewModel _shouldShowForYouTabForTabbedLibraryViewController:](self, "_shouldShowForYouTabForTabbedLibraryViewController:", v6);
          goto LABEL_23;
        case 12:
          v13 = -[PUTabbedLibraryViewModel _shouldShowSearchTabForTabbedLibraryViewController:](self, "_shouldShowSearchTabForTabbedLibraryViewController:", v6);
          goto LABEL_23;
        case 13:
          -[PUTabbedLibraryViewModel settings](self, "settings");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "enableConsolidatedAlbumsTab");
          goto LABEL_21;
        case 14:
          v13 = -[PUTabbedLibraryViewModel _shouldShowAllPhotosTabForTabbedLibraryViewController:](self, "_shouldShowAllPhotosTabForTabbedLibraryViewController:", v6);
          goto LABEL_23;
        default:
          break;
      }
    }
  }
LABEL_5:

  return v11;
}

- (BOOL)_ppt_shouldShowNilTab
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PUShouldEnableNilTab"));

  return v3;
}

- (PUTabbedLibrarySettings)settings
{
  return self->_settings;
}

- (BOOL)_shouldShowSharedTabForTabbedLibraryViewController:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  char v13;

  v4 = a3;
  -[PUTabbedLibraryViewModel settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableSharedTab");

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D719E0];
  objc_msgSend(v7, "photoLibraryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "sharedStreamsEnabledForPhotoLibraryURL:", v9);

  objc_msgSend(v4, "sessionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "hasLocalTargetAlbum");
  if (v6)
    v13 = v10 & (v12 ^ 1);
  else
    v13 = 0;

  return v13;
}

- (BOOL)_shouldShowSearchTabForTabbedLibraryViewController:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  -[PUTabbedLibraryViewModel settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableSearchTab");

  objc_msgSend(v4, "sessionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v7, "hasTargetAlbum");
  return v6 & (v4 ^ 1);
}

- (BOOL)_shouldShowForYouTabForTabbedLibraryViewController:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  -[PUTabbedLibraryViewModel settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableForYouTab");

  objc_msgSend(v4, "sessionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v7, "hasTargetAlbum");
  return v6 & (v4 ^ 1);
}

- (BOOL)_shouldShowCuratedLibraryTabForTabbedLibraryViewController:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "sessionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasTargetAlbum");

  return v4 ^ 1;
}

- (BOOL)_shouldShowAllPhotosTabForTabbedLibraryViewController:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "sessionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSelectingAssets");

  return v4;
}

- (BOOL)_ppt_shouldShowBlankTab
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "BOOLForKey:", CFSTR("PUShouldEnableBlankTab")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    +[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "enableBlankTab");

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_tabInfos, 0);
}

@end

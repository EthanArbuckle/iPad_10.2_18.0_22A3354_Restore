@implementation SBHBookmark

- (SBHBookmark)initWithWebClip:(id)a3
{
  id v5;
  SBHBookmark *v6;
  SBHBookmark *v7;
  uint64_t v8;
  NSString *placeholderBundleIdentifier;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHBookmark;
  v6 = -[SBHBookmark init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webClip, a3);
    objc_msgSend(v5, "placeholderBundleIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    placeholderBundleIdentifier = v7->_placeholderBundleIdentifier;
    v7->_placeholderBundleIdentifier = (NSString *)v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__deviceUnlockedForFirstTime_, *MEMORY[0x1E0DAA220], 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DAA220], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBHBookmark;
  -[SBHBookmark dealloc](&v4, sel_dealloc);
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[SBHBookmark webClip](self, "webClip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)launchURL
{
  void *v2;
  void *v3;

  -[SBHBookmark webClip](self, "webClip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationLaunchURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (BOOL)isShortcutsWebClip
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SBHBookmark webClip](self, "webClip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortcutIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isSingleStepShortcutWebClip
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[SBHBookmark isShortcutsWebClip](self, "isShortcutsWebClip"))
    return 0;
  -[SBHBookmark webClip](self, "webClip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (CPSWebClip)appClip
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  CPSWebClip *v7;
  CPSWebClip *appClip;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (!self->_appClip && -[SBHBookmark isAppClip](self, "isAppClip"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v3 = (void *)getCPSWebClipStoreClass_softClass;
    v14 = getCPSWebClipStoreClass_softClass;
    if (!getCPSWebClipStoreClass_softClass)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getCPSWebClipStoreClass_block_invoke;
      v10[3] = &unk_1E8D85AF8;
      v10[4] = &v11;
      __getCPSWebClipStoreClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v11, 8);
    objc_msgSend(v4, "sharedStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWebClip identifier](self->_webClip, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronouslyGetAppClipWithIdentifier:", v6);
    v7 = (CPSWebClip *)objc_claimAutoreleasedReturnValue();
    appClip = self->_appClip;
    self->_appClip = v7;

  }
  return self->_appClip;
}

- (BOOL)isAppClip
{
  void *v3;
  char v4;

  if (self->_appClip)
    return 1;
  -[SBHBookmark webClip](self, "webClip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppClip");

  return v4;
}

- (void)_deviceUnlockedForFirstTime:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SBLeafIconDataSourceDidChangeNotification"), self);

}

- (BOOL)isUninstallSupported
{
  void *v2;
  char v3;

  -[SBHBookmark webClip](self, "webClip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "removalDisallowed") ^ 1;

  return v3;
}

- (id)icon:(id)a3 displayNameForLocation:(id)a4
{
  void *v4;
  void *v5;

  -[SBHBookmark webClip](self, "webClip", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 0;
}

- (id)icon:(id)a3 unmaskedImageWithInfo:(SBIconImageInfo *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = (void *)MEMORY[0x1D17DF4E4]();
  -[SBHBookmark webClip](self, "webClip");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  return v8;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  if (-[SBHBookmark isAppClip](self, "isAppClip", a3, a4))
  {
    v11 = objc_alloc(MEMORY[0x1E0D3A820]);
    -[SBHBookmark webClip](self, "webClip");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applicationBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithBundleIdentifier:", v13);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v9, v8, v7);
    objc_msgSend(v14, "prepareImageForDescriptor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = objc_alloc(MEMORY[0x1E0DC3870]);
      v18 = objc_msgSend(v16, "CGImage");
      objc_msgSend(v16, "scale");
      v19 = (void *)objc_msgSend(v17, "initWithCGImage:scale:orientation:", v18, 0);
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  double v6;
  double v7;
  double v8;
  int v9;
  double v11;
  double v12;
  double v13;
  id v15;
  SBIconImageInfo *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _QWORD v40[2];

  v9 = (int)a5;
  v11 = v8;
  v12 = v7;
  v13 = v6;
  v40[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = (void *)MEMORY[0x1D17DF4E4]();
  -[SBHBookmark webClip](self, "webClip");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = SBHIconServicesOptionsForImageOptions(v9);
  if (-[SBHBookmark isAppClip](self, "isAppClip"))
  {
    v20 = objc_alloc(MEMORY[0x1E0D3A820]);
    objc_msgSend(v18, "applicationBundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithBundleIdentifier:", v21);

    goto LABEL_11;
  }
  -[SBIconImageInfo sbh_iconImageAppearance](v16, "sbh_iconImageAppearance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "appearanceType");
  if ((unint64_t)(v24 - 2) < 2)
  {
    objc_msgSend(v18, "tintableIconImage");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else if (v24 == 1)
  {
    objc_msgSend(v18, "darkIconImage");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v24)
    {
      v26 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v18, "iconImage");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v25;
LABEL_10:
  v27 = objc_alloc(MEMORY[0x1E0D3A7C0]);
  v28 = objc_retainAutorelease(v26);
  v29 = objc_msgSend(v28, "CGImage");
  objc_msgSend(v28, "scale");
  v30 = (void *)objc_msgSend(v27, "initWithCGImage:scale:", v29);
  v31 = objc_alloc(MEMORY[0x1E0D3A820]);
  v40[0] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v31, "initWithImages:", v32);

LABEL_11:
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v13, v12, v11);
  SBHModifyImageDescriptorWithTraitCollection(v33, (uint64_t)v16, v19);
  objc_msgSend(v22, "prepareImageForDescriptor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = objc_alloc(MEMORY[0x1E0DC3870]);
    v36 = objc_msgSend(v34, "CGImage");
    objc_msgSend(v34, "scale");
    v37 = (void *)objc_msgSend(v35, "initWithCGImage:scale:orientation:", v36, 0);
  }
  else
  {
    v37 = 0;
  }
  SBHIconServicesAddDebugImageOverlayWithTraitCollection(v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v17);
  return v38;
}

- (BOOL)canGenerateIconsInBackgroundForIcon:(id)a3
{
  return 1;
}

- (id)supportedGridSizeClassesForIcon:(id)a3
{
  return +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass](SBHIconGridSizeClassSet, "gridSizeClassSetForDefaultGridSizeClass", a3);
}

- (BOOL)iconSupportsUninstall:(id)a3
{
  void *v3;
  char v4;

  -[SBHBookmark webClip](self, "webClip", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "removalDisallowed") ^ 1;

  return v4;
}

- (BOOL)iconCompleteUninstall:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SBWebBookmarkWasUninstalledNotification"), self);

  if (-[SBHBookmark isAppClip](self, "isAppClip"))
    v5 = -[SBHBookmark appClip](self, "appClip");
  -[SBHBookmark webClip](self, "webClip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "removeFromDisk");

  -[SBHBookmark _cleanupAppClipIfNecessary](self, "_cleanupAppClipIfNecessary");
  return v7;
}

- (id)folderTitleOptionsForIcon:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  SBHBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BOOKMARK_FOLDER_NAME"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)folderFallbackTitleForIcon:(id)a3
{
  return 0;
}

- (id)iTunesCategoriesOrderedByRelevancyForIcon:(id)a3
{
  return &unk_1E8E175D0;
}

- (void)_cleanupAppClipIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t v28[128];
  __int128 buf;
  Class (*v30)(uint64_t);
  void *v31;
  uint64_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (-[SBHBookmark isAppClip](self, "isAppClip"))
  {
    -[SBHBookmark appClip](self, "appClip");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applicationBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);
    objc_msgSend(v5, "appClipMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(MEMORY[0x1E0DC3F68], "webClips");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v21;
        while (2)
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v21 != v9)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10), "applicationBundleIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isEqualToString:", v4);

            if (v12)
            {
              SBLogCommon();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v4;
                _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_DEFAULT, "Bailing on cleanup of app clip '%@'; appclip in use by other UIWebClip",
                  (uint8_t *)&buf,
                  0xCu);
              }

              goto LABEL_21;
            }
            ++v10;
          }
          while (v8 != v10);
          v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v8)
            continue;
          break;
        }
      }

      SBLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v4;
        _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_DEFAULT, "Starting cleanup of app clip '%@'", (uint8_t *)&buf, 0xCu);
      }

      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v14 = (void *)getIXAppInstallCoordinatorClass_softClass;
      v27 = getIXAppInstallCoordinatorClass_softClass;
      v15 = MEMORY[0x1E0C809B0];
      if (!getIXAppInstallCoordinatorClass_softClass)
      {
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v30 = __getIXAppInstallCoordinatorClass_block_invoke;
        v31 = &unk_1E8D85AF8;
        v32 = &v24;
        __getIXAppInstallCoordinatorClass_block_invoke((uint64_t)&buf);
        v14 = (void *)v25[3];
      }
      v16 = objc_retainAutorelease(v14);
      _Block_object_dispose(&v24, 8);
      v18[0] = v15;
      v18[1] = 3221225472;
      v18[2] = __41__SBHBookmark__cleanupAppClipIfNecessary__block_invoke;
      v18[3] = &unk_1E8D88A08;
      v19 = v4;
      objc_msgSend(v16, "uninstallAppWithBundleID:requestUserConfirmation:completion:", v19, 0, v18);
      v7 = v19;
    }
    else
    {
      SBLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v4;
        _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_DEFAULT, "Bailing on cleanup of app clip '%@': Appclips were removed from install of the real app.", (uint8_t *)&buf, 0xCu);
      }
    }
LABEL_21:

  }
}

void __41__SBHBookmark__cleanupAppClipIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __41__SBHBookmark__cleanupAppClipIfNecessary__block_invoke_cold_1(a1, (uint64_t)v3, v4);

  }
}

- (UIWebClip)webClip
{
  return self->_webClip;
}

- (NSString)placeholderBundleIdentifier
{
  return self->_placeholderBundleIdentifier;
}

- (void)setPlaceholderBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appClip, 0);
  objc_storeStrong((id *)&self->_webClip, 0);
}

void __41__SBHBookmark__cleanupAppClipIfNecessary__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "Error uninstalling bundle identifier %@: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end

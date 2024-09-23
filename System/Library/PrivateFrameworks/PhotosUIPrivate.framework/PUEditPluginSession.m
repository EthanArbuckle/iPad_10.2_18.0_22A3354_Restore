@implementation PUEditPluginSession

- (PUEditPluginSession)init
{
  PUEditPluginSession *v2;
  PUEditPluginSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUEditPluginSession;
  v2 = -[PUEditPluginSession init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PUEditPluginSession updatePluginManager](v2, "updatePluginManager");
  return v3;
}

- (void)updatePluginManager
{
  PUEditPluginManager *v3;
  PUEditPluginManager *pluginManager;
  void *v5;

  +[PUEditPluginManager sharedManagerForMediaType:](PUEditPluginManager, "sharedManagerForMediaType:", -[PUEditPluginSession pluginManagerMediaType](self, "pluginManagerMediaType"));
  v3 = (PUEditPluginManager *)objc_claimAutoreleasedReturnValue();
  pluginManager = self->_pluginManager;
  self->_pluginManager = v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__pluginManagerPluginsDidChange_, CFSTR("PUEditPluginManagerPluginsDidChangeNotification"), self->_pluginManager);

  -[PUEditPluginManager rediscoverAvailablePlugins](self->_pluginManager, "rediscoverAvailablePlugins");
  -[PUEditPluginSession updateAvailability](self, "updateAvailability");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUEditPluginSession;
  -[PUEditPluginSession dealloc](&v4, sel_dealloc);
}

- (unint64_t)pluginManagerMediaType
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUEditPluginSession.m"), 172, CFSTR("subclass to implement"));

  return 0;
}

- (void)loadItemProviderWithSupportedAdjustmentData:(id)a3 loadHandler:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUEditPluginSession.m"), 177, CFSTR("subclass to implement"));

}

- (void)updateAvailability
{
  _BOOL4 v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = -[PUEditPluginManager hasNonMarkupPlugins](self->_pluginManager, "hasNonMarkupPlugins");
  -[PUEditPluginSession dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PUEditPluginSession dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pluginActivitiesForEditPluginSession:", self);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v8, "count"))
    v7 = 1;
  else
    v7 = v3;
  -[PUEditPluginSession setIsAvailable:](self, "setIsAvailable:", v7);

}

- (void)setIsAvailable:(BOOL)a3
{
  void *v4;
  char v5;
  id v6;

  if (self->_isAvailable != a3)
  {
    self->_isAvailable = a3;
    -[PUEditPluginSession delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[PUEditPluginSession delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "editPluginSessionAvailabilityDidChange:", self);

    }
  }
}

- (BOOL)markupIsAvailable
{
  return -[PUEditPluginManager hasMarkupPlugin](self->_pluginManager, "hasMarkupPlugin");
}

- (void)_unlockScreenIfNeededWithCompletionHandler:(id)a3
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(_QWORD);
  __int16 v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(_QWORD))a3;
  v22 = 0;
  *(_QWORD *)buf = 0;
  v24 = buf;
  v25 = 0x2020000000;
  v4 = getSBSSpringBoardServerPortSymbolLoc_ptr;
  v26 = getSBSSpringBoardServerPortSymbolLoc_ptr;
  if (!getSBSSpringBoardServerPortSymbolLoc_ptr)
  {
    v5 = SpringBoardServicesLibrary();
    v4 = dlsym(v5, "SBSSpringBoardServerPort");
    *((_QWORD *)v24 + 3) = v4;
    getSBSSpringBoardServerPortSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(buf, 8);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "mach_port_t PUSBSSpringBoardServerPort(void)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PUEditPluginSession.m"), 48, CFSTR("%s"), dlerror());

    goto LABEL_24;
  }
  v6 = ((uint64_t (*)(void))v4)();
  *(_QWORD *)buf = 0;
  v24 = buf;
  v25 = 0x2020000000;
  v7 = getSBGetScreenLockStatusSymbolLoc_ptr;
  v26 = getSBGetScreenLockStatusSymbolLoc_ptr;
  if (!getSBGetScreenLockStatusSymbolLoc_ptr)
  {
    v8 = SpringBoardServicesLibrary();
    v7 = dlsym(v8, "SBGetScreenLockStatus");
    *((_QWORD *)v24 + 3) = v7;
    getSBGetScreenLockStatusSymbolLoc_ptr = v7;
  }
  _Block_object_dispose(buf, 8);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "kern_return_t PUSBGetScreenLockStatus(mach_port_t, uint8_t *, uint8_t *)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PUEditPluginSession.m"), 47, CFSTR("%s"), dlerror());

    goto LABEL_24;
  }
  if (((unsigned int (*)(uint64_t, char *, __int16 *))v7)(v6, (char *)&v22 + 1, &v22))
  {
    PLPhotoEditGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Unable to determine current lock screen state, functioning as if screen is locked.", buf, 2u);
    }

    v22 = 257;
  }
  PLPhotoEditGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = HIBYTE(v22);
    LOWORD(v24) = 1024;
    *(_DWORD *)((char *)&v24 + 2) = v22;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_INFO, "Got Springboard lock status: %d %d", buf, 0xEu);
  }

  if ((_BYTE)v22)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __66__PUEditPluginSession__unlockScreenIfNeededWithCompletionHandler___block_invoke;
    v20[3] = &unk_1E589E4B0;
    v21 = v3;
    v11 = v20;
    *(_QWORD *)buf = 0;
    v24 = buf;
    v25 = 0x2020000000;
    v12 = getSBSRequestPasscodeUnlockUISymbolLoc_ptr;
    v26 = getSBSRequestPasscodeUnlockUISymbolLoc_ptr;
    if (!getSBSRequestPasscodeUnlockUISymbolLoc_ptr)
    {
      v13 = SpringBoardServicesLibrary();
      v12 = dlsym(v13, "SBSRequestPasscodeUnlockUI");
      *((_QWORD *)v24 + 3) = v12;
      getSBSRequestPasscodeUnlockUISymbolLoc_ptr = v12;
    }
    _Block_object_dispose(buf, 8);
    if (v12)
    {
      ((void (*)(_QWORD *))v12)(v11);

      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PUSBSRequestPasscodeUnlockUI(void (^__strong)(Boolean))");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PUEditPluginSession.m"), 46, CFSTR("%s"), dlerror());

LABEL_24:
    __break(1u);
  }
  if (v3)
    v3[2](v3);
LABEL_20:

}

- (void)beginMarkupSessionWithAsset:(id)a3 fromViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  -[PUEditPluginSession currentPlugin](self, "currentPlugin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__PUEditPluginSession_beginMarkupSessionWithAsset_fromViewController___block_invoke;
    v9[3] = &unk_1E58AB790;
    v9[4] = self;
    v10 = v6;
    v11 = v7;
    -[PUEditPluginSession _unlockScreenIfNeededWithCompletionHandler:](self, "_unlockScreenIfNeededWithCompletionHandler:", v9);

  }
}

- (void)_beginMarkupSessionWithAsset:(id)a3 fromViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  PUEditPlugin *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  id v20;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PUEditPluginSession setAsset:](self, "setAsset:", v6);
  -[PUEditPluginSession setHostViewController:](self, "setHostViewController:", v7);
  v8 = (void *)MEMORY[0x1E0CB35D8];
  +[PUEditPlugin pu_defaultMarkupExtensionIdentifier](PUEditPlugin, "pu_defaultMarkupExtensionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v8, "extensionWithIdentifier:error:", v9, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;

  if (v10)
  {
    v12 = -[PUEditPlugin initWithExtension:pluginCategoryType:]([PUEditPlugin alloc], "initWithExtension:pluginCategoryType:", v10, 0);
    -[PUEditPluginSession currentPlugin](self, "currentPlugin");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (!v14)
    {
      PXAssertGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_error_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "previous plugin selected", (uint8_t *)location, 2u);
      }

    }
    objc_initWeak(location, self);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__PUEditPluginSession__beginMarkupSessionWithAsset_fromViewController___block_invoke;
    v17[3] = &unk_1E58A2CC8;
    objc_copyWeak(&v19, location);
    v16 = v12;
    v18 = v16;
    -[PUEditPluginSession shouldLaunchPlugin:completion:](self, "shouldLaunchPlugin:completion:", v16, v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    PLPhotoEditGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v11;
      _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_INFO, "Error fetching markup extension:%@", (uint8_t *)location, 0xCu);
    }
  }

}

- (id)_linkPresentationImage
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];

  -[PUEditPluginSession asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  v5 = objc_opt_class();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__PUEditPluginSession__linkPresentationImage__block_invoke;
  v8[3] = &unk_1E589ECF8;
  v8[4] = self;
  objc_msgSend(v4, "registerObjectOfClass:visibility:loadHandler:", v5, 0, v8);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithItemProvider:properties:placeholderImage:", v4, 0, 0);

  return v6;
}

- (void)beginSessionWithAsset:(id)a3 fromViewController:(id)a4 sourceElement:(id)a5 includeMarkupInList:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __98__PUEditPluginSession_beginSessionWithAsset_fromViewController_sourceElement_includeMarkupInList___block_invoke;
  v16[3] = &unk_1E589F368;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = a6;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[PUEditPluginSession _unlockScreenIfNeededWithCompletionHandler:](self, "_unlockScreenIfNeededWithCompletionHandler:", v16);

}

- (void)_beginSessionWithAsset:(id)a3 fromViewController:(id)a4 sourceElement:(id)a5 includeMarkupInList:(BOOL)a6
{
  id v11;
  id v12;
  PUEditPluginManager *pluginManager;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  PUEditExtensionActivityViewController *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a4;
  -[PUEditPluginSession setAsset:](self, "setAsset:", a3);
  -[PUEditPluginSession setHostViewController:](self, "setHostViewController:", v12);

  pluginManager = self->_pluginManager;
  if (a6)
    -[PUEditPluginManager pluginActivities](pluginManager, "pluginActivities");
  else
    -[PUEditPluginManager pluginActivitiesExceptMarkup](pluginManager, "pluginActivitiesExceptMarkup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUEditPluginSession dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[PUEditPluginSession dataSource](self, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pluginActivitiesForEditPluginSession:", self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v19;
  }
  v20 = objc_alloc(MEMORY[0x1E0C99EA0]);
  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("/Library/Preferences/com.apple.mobileslideshow"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithSuiteName:", v21);

  v23 = -[PUEditExtensionActivityViewController initWithUserDefaults:userDefaultsIdentifier:applicationActivities:]([PUEditExtensionActivityViewController alloc], "initWithUserDefaults:userDefaultsIdentifier:applicationActivities:", v22, CFSTR("com.apple.photos.photo-editors"), v14);
  -[PUEditExtensionActivityViewController setConfigureForPhotosEdit:](v23, "setConfigureForPhotosEdit:", 1);
  -[PUEditExtensionActivityViewController setEditExtensionActivityViewControllerDelegate:](v23, "setEditExtensionActivityViewControllerDelegate:", self);
  v46[0] = *MEMORY[0x1E0D96D88];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUEditExtensionActivityViewController setExcludedActivityTypes:](v23, "setExcludedActivityTypes:", v24);

  v25 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
  v26 = objc_alloc_init(MEMORY[0x1E0CC1160]);
  -[PUEditPluginSession _linkPresentationImage](self, "_linkPresentationImage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setThumbnail:", v27);

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "editMenuEnabled");
  v30 = CFSTR("PLUGIN_LIST_ACTIONSHEET_TITLE_LEGACY");
  if (v29)
    v30 = CFSTR("PLUGIN_LIST_ACTIONSHEET_TITLE");
  v31 = v30;

  PULocalizedString(v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setName:", v32);
  objc_msgSend(v25, "setSpecialization:", v26);
  -[PUEditExtensionActivityViewController setPhotosHeaderMetadata:](v23, "setPhotosHeaderMetadata:", v25);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUEditPluginSession.m"), 350, CFSTR("source element is not a UIView"));

  }
  v33 = v11;
  -[PUEditExtensionActivityViewController popoverPresentationController](v23, "popoverPresentationController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setSourceView:", v33);

  objc_msgSend(v33, "bounds");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;

  -[PUEditExtensionActivityViewController popoverPresentationController](v23, "popoverPresentationController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setSourceRect:", v36, v38, v40, v42);

  -[PUEditPluginSession hostViewController](self, "hostViewController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "presentViewController:animated:completion:", v23, 1, 0);

}

- (id)_localizedEditorListTitle
{
  unint64_t v2;
  void *v3;

  v2 = -[PUEditPluginSession pluginManagerMediaType](self, "pluginManagerMediaType");
  if (v2 > 3)
  {
    v3 = 0;
  }
  else
  {
    PULocalizedString(off_1E589E5B0[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)editExtensionActivityViewController:(id)a3 didSelectActivity:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location[2];

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "plugin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUEditPluginSession.m"), 390, CFSTR("no plugin selected"));

    }
    -[PUEditPluginSession currentPlugin](self, "currentPlugin");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      PXAssertGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_error_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "previous plugin selected", (uint8_t *)location, 2u);
      }

    }
    -[PUEditPluginSession currentPlugin](self, "currentPlugin");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_initWeak(location, self);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __77__PUEditPluginSession_editExtensionActivityViewController_didSelectActivity___block_invoke;
      v14[3] = &unk_1E589E500;
      objc_copyWeak(&v17, location);
      v15 = v9;
      v16 = v7;
      -[PUEditPluginSession shouldLaunchPlugin:completion:](self, "shouldLaunchPlugin:completion:", v15, v14);

      objc_destroyWeak(&v17);
      objc_destroyWeak(location);
    }

  }
}

- (void)shouldLaunchPlugin:(id)a3 completion:(id)a4
{
  (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
}

- (void)presentAlertController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PUEditPluginSession hostViewController](self, "hostViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    do
    {
      objc_msgSend(v4, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "presentedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v6;
    }
    while (v7);
  }
  else
  {
    v6 = v4;
  }
  objc_msgSend(v6, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)_launchPlugin:(id)a3 afterDismissingViewController:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  PUEditPluginHostViewController *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PUProgressView *v23;
  PUProgressView *v24;
  PUEditPluginHostViewController *v25;
  void *v26;
  _QWORD block[5];
  PUEditPluginHostViewController *v28;
  PUProgressView *v29;
  _QWORD v30[4];
  void (**v31)(_QWORD);
  _QWORD aBlock[4];
  id v33;
  NSObject *v34;
  _QWORD v35[4];
  NSObject *v36;

  v7 = a3;
  v8 = a4;
  -[PUEditPluginSession currentPlugin](self, "currentPlugin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUEditPluginSession.m"), 422, CFSTR("previous plugin selected"));

  }
  -[PUEditPluginSession setCurrentPlugin:](self, "setCurrentPlugin:", v7);
  -[PUEditPluginSession delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[PUEditPluginSession delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "editPluginSessionWillBegin:", self);

  }
  v13 = dispatch_group_create();
  v14 = -[PUEditPluginHostViewController initWithPlugin:]([PUEditPluginHostViewController alloc], "initWithPlugin:", v7);
  -[PUEditPluginHostViewController setDataSource:](v14, "setDataSource:", self);
  -[PUEditPluginHostViewController setDelegate:](v14, "setDelegate:", self);
  dispatch_group_enter(v13);
  v15 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke;
  v35[3] = &unk_1E589E528;
  v16 = v13;
  v36 = v16;
  -[PUEditPluginHostViewController loadRemoteViewControllerWithCompletionHandler:](v14, "loadRemoteViewControllerWithCompletionHandler:", v35);
  if (v8)
  {
    dispatch_group_enter(v16);
    aBlock[0] = v15;
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_2;
    aBlock[3] = &unk_1E58ABCA8;
    v17 = v8;
    v33 = v17;
    v34 = v16;
    v18 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v17, "presentedViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v17, "presentedViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v15;
      v30[1] = 3221225472;
      v30[2] = __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_4;
      v30[3] = &unk_1E58ABAC8;
      v31 = v18;
      objc_msgSend(v20, "dismissViewControllerAnimated:completion:", 0, v30);

    }
    else
    {
      v18[2](v18);
    }

  }
  -[PUEditPluginSession hostViewController](self, "hostViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[PUProgressView initWithStyle:]([PUProgressView alloc], "initWithStyle:", 0);
  -[PUProgressView showInView:animated:afterDelay:](v23, "showInView:animated:afterDelay:", v22, 1, 2.0);
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_5;
  block[3] = &unk_1E58AB790;
  block[4] = self;
  v28 = v14;
  v29 = v23;
  v24 = v23;
  v25 = v14;
  dispatch_group_notify(v16, MEMORY[0x1E0C80D38], block);

}

- (void)editPluginHostViewController:(id)a3 loadItemProviderWithHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  PUEditPluginSession *v18;
  id v19;

  v7 = a3;
  v8 = a4;
  -[PUEditPluginSession currentPlugin](self, "currentPlugin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUEditPluginSession.m"), 483, CFSTR("no current plugin"));

  }
  -[PUEditPluginSession dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUEditPluginSession.m"), 484, CFSTR("data source missing"));

  }
  -[PUEditPluginSession dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__PUEditPluginSession_editPluginHostViewController_loadItemProviderWithHandler___block_invoke;
  v16[3] = &unk_1E589E578;
  v17 = v7;
  v18 = self;
  v19 = v8;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v11, "editPluginSession:loadAdjustmentDataWithHandler:", self, v16);

}

- (void)editPluginHostViewController:(id)a3 commitContentEditingOutput:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[PUEditPluginSession dataSource](self, "dataSource");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "editPluginSession:commitContentEditingOutput:withCompletionHandler:", self, v8, v7);

}

- (void)editPluginHostViewController:(id)a3 didFinishWithCompletionType:(unint64_t)a4
{
  id v6;
  void *v7;
  _QWORD v8[6];

  v6 = a3;
  -[PUEditPluginSession hostViewController](self, "hostViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__PUEditPluginSession_editPluginHostViewController_didFinishWithCompletionType___block_invoke;
  v8[3] = &unk_1E58AACF0;
  v8[4] = self;
  v8[5] = a4;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (PUEditPluginSessionDataSource)dataSource
{
  return (PUEditPluginSessionDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (PUEditPluginSessionDelegate)delegate
{
  return (PUEditPluginSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (PUEditableAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (int64_t)adjustmentType
{
  return self->_adjustmentType;
}

- (void)setAdjustmentType:(int64_t)a3
{
  self->_adjustmentType = a3;
}

- (PUEditPlugin)currentPlugin
{
  return self->_currentPlugin;
}

- (void)setCurrentPlugin:(id)a3
{
  objc_storeStrong((id *)&self->_currentPlugin, a3);
}

- (UIViewController)hostViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_hostViewController);
}

- (void)setHostViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong((id *)&self->_currentPlugin, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_pluginNavigationController, 0);
  objc_storeStrong((id *)&self->_pluginManager, 0);
}

void __80__PUEditPluginSession_editPluginHostViewController_didFinishWithCompletionType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "currentPlugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extension");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setCurrentPlugin:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "editPluginSession:didEndWithCompletionType:forPluginIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6);

  }
}

void __80__PUEditPluginSession_editPluginHostViewController_loadItemProviderWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a2;
  v4 = dispatch_group_create();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v5 = objc_msgSend(v3, "isOpaque");
  v6 = MEMORY[0x1E0C809B0];
  if (!v5)
  {
    if (v3)
    {
      dispatch_group_enter(v4);
      v7 = *(void **)(a1 + 32);
      v16[0] = v6;
      v16[1] = 3221225472;
      v16[2] = __80__PUEditPluginSession_editPluginHostViewController_loadItemProviderWithHandler___block_invoke_2;
      v16[3] = &unk_1E58A9168;
      v18 = &v19;
      v17 = v4;
      objc_msgSend(v7, "queryHandlingCapabilityForAdjustmentData:withResponseHandler:timeout:", v3, v16, 10.0);

      goto LABEL_6;
    }
    objc_msgSend(*(id *)(a1 + 40), "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isAdjusted");

    if (!v9)
      goto LABEL_6;
  }
  v20[3] = 2;
LABEL_6:
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __80__PUEditPluginSession_editPluginHostViewController_loadItemProviderWithHandler___block_invoke_3;
  v12[3] = &unk_1E589E550;
  v15 = &v19;
  v10 = *(void **)(a1 + 48);
  v12[4] = *(_QWORD *)(a1 + 40);
  v13 = v3;
  v14 = v10;
  v11 = v3;
  dispatch_group_notify(v4, MEMORY[0x1E0C80D38], v12);

  _Block_object_dispose(&v19, 8);
}

void __80__PUEditPluginSession_editPluginHostViewController_loadItemProviderWithHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = 1;
  if (!a2)
    v2 = 2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __80__PUEditPluginSession_editPluginHostViewController_loadItemProviderWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "setAdjustmentType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 1)
    v2 = *(_QWORD *)(a1 + 40);
  else
    v2 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "loadItemProviderWithSupportedAdjustmentData:loadHandler:", v2, *(_QWORD *)(a1 + 48));
}

void __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_3;
  v2[3] = &unk_1E58ABD10;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, v2);

}

uint64_t __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "standardAppearance");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScrollEdgeAppearance:", v6);

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configureEditPluginNavigationController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setModalPresentationStyle:", 5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setModalTransitionStyle:", 2);
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "lightModeEditor");

  if ((v6 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setOverrideUserInterfaceStyle:", 2);
  objc_msgSend(*(id *)(a1 + 32), "hostViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_6;
  v12[3] = &unk_1E58ABD10;
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v10, "presentViewController:animated:completion:", v11, 1, v12);

}

uint64_t __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideAnimated:", 0);
}

void __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__PUEditPluginSession_editExtensionActivityViewController_didSelectActivity___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_launchPlugin:afterDismissingViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

uint64_t __98__PUEditPluginSession_beginSessionWithAsset_fromViewController_sourceElement_includeMarkupInList___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginSessionWithAsset:fromViewController:sourceElement:includeMarkupInList:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
}

uint64_t __45__PUEditPluginSession__linkPresentationImage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__PUEditPluginSession__linkPresentationImage__block_invoke_2;
  v8[3] = &unk_1E589E4D8;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "editPluginSession:loadThumbnailImageWithSize:loadHandler:", v5, v8, 40.0, 40.0);

  return 0;
}

void __45__PUEditPluginSession__linkPresentationImage__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v13;
  CGFloat v14;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGImage *v27;
  CGImageRef v28;
  CGImage *v29;
  uint64_t v30;
  __int128 v31;
  CGAffineTransform v32;
  CGRect v33;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "imageOrientation");
  objc_msgSend(v5, "size");
  v9 = v8;
  v11 = v10;
  _Q0 = 0uLL;
  v13 = -1.0;
  v14 = -1.0;
  switch(v7)
  {
    case 1:
      break;
    case 2:
      _Q0 = xmmword_1AB0EF2C0;
      v14 = 0.0;
      v13 = 0.0;
      goto LABEL_9;
    case 3:
      _Q0 = xmmword_1AB0EF2B0;
      v14 = 0.0;
      v13 = 0.0;
      v9 = 0.0;
      break;
    case 4:
      v11 = 0.0;
      v13 = 1.0;
      break;
    case 5:
      v9 = 0.0;
      v14 = 1.0;
      break;
    case 6:
      __asm { FMOV            V0.2D, #-1.0; jumptable 00000001AAD8B690 case 6 }
      v14 = 0.0;
      v13 = 0.0;
      break;
    case 7:
      __asm { FMOV            V0.2D, #1.0; jumptable 00000001AAD8B690 case 7 }
      v14 = 0.0;
      v13 = 0.0;
      v9 = 0.0;
LABEL_9:
      v11 = 0.0;
      break;
    default:
      v14 = *MEMORY[0x1E0C9BAA8];
      _Q0 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 8);
      v13 = *(double *)(MEMORY[0x1E0C9BAA8] + 24);
      v9 = *(double *)(MEMORY[0x1E0C9BAA8] + 32);
      v11 = *(double *)(MEMORY[0x1E0C9BAA8] + 40);
      break;
  }
  v32.a = v14;
  v31 = _Q0;
  *(_OWORD *)&v32.b = _Q0;
  v32.d = v13;
  v32.tx = v9;
  v32.ty = v11;
  if (!CGAffineTransformIsIdentity(&v32))
  {
    objc_msgSend(v5, "CIImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", objc_msgSend(objc_retainAutorelease(v5), "CGImage"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v32.a = v14;
    *(_OWORD *)&v32.b = v31;
    v32.d = v13;
    v32.tx = v9;
    v32.ty = v11;
    objc_msgSend(v19, "imageByApplyingTransform:", &v32, v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCIImage:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v21;
  }
  objc_msgSend(v5, "size", v31);
  v23 = v22;
  objc_msgSend(v5, "size");
  v25 = v24;
  if ((PXFloatEqualToFloatWithTolerance() & 1) == 0)
  {
    if (v23 >= v25)
      v26 = v25;
    else
      v26 = v23;
    v5 = objc_retainAutorelease(v5);
    v27 = (CGImage *)objc_msgSend(v5, "CGImage");
    v33.origin.x = v23 * 0.5 - v26 * 0.5;
    v33.origin.y = v25 * 0.5 - v26 * 0.5;
    v33.size.width = v26;
    v33.size.height = v26;
    v28 = CGImageCreateWithImageInRect(v27, v33);
    if (v28)
    {
      v29 = v28;
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v28, objc_msgSend(v5, "imageOrientation"), 1.0);
      v30 = objc_claimAutoreleasedReturnValue();

      CGImageRelease(v29);
      v5 = (id)v30;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __71__PUEditPluginSession__beginMarkupSessionWithAsset_fromViewController___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_launchPlugin:afterDismissingViewController:", *(_QWORD *)(a1 + 32), 0);

  }
}

uint64_t __70__PUEditPluginSession_beginMarkupSessionWithAsset_fromViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginMarkupSessionWithAsset:fromViewController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __66__PUEditPluginSession__unlockScreenIfNeededWithCompletionHandler___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end

@implementation PUWallpaperActivity

- (PUWallpaperActivity)init
{
  PUWallpaperActivity *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  PUWallpaperActivity *result;
  void *v7;
  void *v8;
  objc_super v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v9.receiver = self;
  v9.super_class = (Class)PUWallpaperActivity;
  v2 = -[UIActivity init](&v9, sel_init);
  if (!v2)
    return v2;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v4 = (_QWORD *)getMCEffectiveSettingsChangedNotificationSymbolLoc_ptr;
  v13 = getMCEffectiveSettingsChangedNotificationSymbolLoc_ptr;
  if (!getMCEffectiveSettingsChangedNotificationSymbolLoc_ptr)
  {
    v5 = ManagedConfigurationLibrary_102895();
    v4 = dlsym(v5, "MCEffectiveSettingsChangedNotification");
    v11[3] = (uint64_t)v4;
    getMCEffectiveSettingsChangedNotificationSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v10, 8);
  if (v4)
  {
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__restrictionsChanged_, *v4, 0);

    -[PUWallpaperActivity _setNeedsUpdateWallpaperModificationAllowed:](v2, "_setNeedsUpdateWallpaperModificationAllowed:", 1);
    return v2;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMCEffectiveSettingsChangedNotification(void)");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PUWallpaperActivity.m"), 35, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUWallpaperActivity;
  -[PUWallpaperActivity dealloc](&v4, sel_dealloc);
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BD98];
}

- (id)activityTitle
{
  return (id)PLLocalizedFrameworkString();
}

- (id)_systemImageName
{
  if (_ActivitySystemImageName_onceToken != -1)
    dispatch_once(&_ActivitySystemImageName_onceToken, &__block_literal_global_111);
  return (id)_ActivitySystemImageName_imageName;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;

  if ((PLIsEDUMode() & 1) != 0)
    return 0;
  -[PXActivity itemSourceController](self, "itemSourceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isPreparingIndividualItems"))
  {
    if (v5)
      objc_msgSend(v5, "requestAssetsMediaTypeCount");
    objc_msgSend(v5, "assets", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    v4 = 0;
    if (v7 == 1 && v9 == 1)
    {
      -[PUWallpaperActivity _updateWallpaperModificationAllowedIfNeeded](self, "_updateWallpaperModificationAllowedIfNeeded");
      v4 = -[PUWallpaperActivity _isWallpaperModificationAllowed](self, "_isWallpaperModificationAllowed");
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)prepareWithActivityItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  UIViewController *v12;
  UIViewController *wallpaperActivityViewController;
  id v14;

  -[PXActivity itemSourceController](self, "itemSourceController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXCreateMutablePosterConfigurationForLockScreenRole();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D751F0]), "initWithConfigurationType:", 0);
  objc_msgSend(v8, "setOptions:", 1);
  objc_msgSend(v8, "setMedia:", v6);
  objc_msgSend(v7, "setDisplayNameLocalizationKey:", CFSTR("PHOTOS_WALLPAPER_SWITCHER_TITLE_PHOTOS"));
  objc_msgSend(v7, "assetDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v8, "saveToURL:error:", v9, &v14);
  v10 = v14;

  PXCreateWallpaperPosterEditingEntryPoint();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PXCreateWallpaperPosterInlineEditingViewController();
  v12 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  -[UIViewController setDelegate:](v12, "setDelegate:", self);
  -[UIViewController setModalPresentationStyle:](v12, "setModalPresentationStyle:", 0);
  wallpaperActivityViewController = self->_wallpaperActivityViewController;
  self->_wallpaperActivityViewController = v12;

}

- (void)performActivity
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 0);
}

- (id)activityViewController
{
  return self->_wallpaperActivityViewController;
}

- (void)_restrictionsChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PUWallpaperActivity__restrictionsChanged___block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_updateWallpaperModificationAllowedIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (-[PUWallpaperActivity _needsUpdateWallpaperModificationAllowed](self, "_needsUpdateWallpaperModificationAllowed"))
  {
    -[PUWallpaperActivity _setNeedsUpdateWallpaperModificationAllowed:](self, "_setNeedsUpdateWallpaperModificationAllowed:", 0);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2050000000;
    v3 = (void *)getMCProfileConnectionClass_softClass_102893;
    v11 = getMCProfileConnectionClass_softClass_102893;
    if (!getMCProfileConnectionClass_softClass_102893)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __getMCProfileConnectionClass_block_invoke_102894;
      v7[3] = &unk_1E58AAEB0;
      v7[4] = &v8;
      __getMCProfileConnectionClass_block_invoke_102894((uint64_t)v7);
      v3 = (void *)v9[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v8, 8);
    objc_msgSend(v4, "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isWallpaperModificationAllowed");

    -[PUWallpaperActivity _setWallpaperModificationAllowed:](self, "_setWallpaperModificationAllowed:", v6);
  }
}

- (void)inlineEditingViewController:(id)a3 didDismissWithResponse:(id)a4
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", objc_msgSend(a4, "entryPointResult", a3) == 1);
}

- (BOOL)_isWallpaperModificationAllowed
{
  return self->__wallpaperModificationAllowed;
}

- (void)_setWallpaperModificationAllowed:(BOOL)a3
{
  self->__wallpaperModificationAllowed = a3;
}

- (BOOL)_needsUpdateWallpaperModificationAllowed
{
  return self->__needsUpdateWallpaperModificationAllowed;
}

- (void)_setNeedsUpdateWallpaperModificationAllowed:(BOOL)a3
{
  self->__needsUpdateWallpaperModificationAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperActivityViewController, 0);
}

uint64_t __44__PUWallpaperActivity__restrictionsChanged___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_isWallpaperModificationAllowed");
  objc_msgSend(*(id *)(a1 + 32), "_setNeedsUpdateWallpaperModificationAllowed:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_updateWallpaperModificationAllowedIfNeeded");
  result = objc_msgSend(*(id *)(a1 + 32), "_isWallpaperModificationAllowed");
  if (v2 != (_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "updateActivityViewControllerVisibleShareActions");
  return result;
}

id __48__PUWallpaperActivity_prepareWithActivityItems___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0D75210];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithAssetUUID:", v5);
  return v6;
}

@end

@implementation PURootSettings

- (void)createChildren
{
  PUPhotoEditProtoSettings *v3;
  PUPhotoEditProtoSettings *photoEditingSettings;
  PUAudioClassificationSettings *v5;
  PUAudioClassificationSettings *audioClassificationSettings;
  PUAirPlaySettings *v7;
  PUAirPlaySettings *airPlaySettings;
  PUWelcomeSettings *v9;
  PUWelcomeSettings *welcomeSettings;
  PUSceneSettings *v11;
  PUSceneSettings *sceneSettings;
  PUPerformanceDiagnosticsSettings *v13;
  PUPerformanceDiagnosticsSettings *performanceDiagnosticsSettings;
  PUMedusaSettings *v15;
  PUMedusaSettings *medusaSettings;
  PUSlideshowSettings *v17;
  PUSlideshowSettings *slideshowSettings;
  PUFeedSettings *v19;
  PUFeedSettings *feedSettings;
  PUCurationSettings *v21;
  PUCurationSettings *curation;
  PUCompositeVideoSettings *v23;
  PUCompositeVideoSettings *compositeVideoSettings;
  PUAmbientPhotoFrameSettings *v25;
  PUAmbientPhotoFrameSettings *ambientPhotoFrameSettings;
  PXImportSettings *v27;
  PXImportSettings *importSettings;
  PUTabbedLibrarySettings *v29;
  PUTabbedLibrarySettings *tabbedLibrarySettings;
  PUSuggestionsSettings *v31;
  PUSuggestionsSettings *suggestions;
  PUAlbumListSettings *v33;
  PUAlbumListSettings *albumListSettings;
  PUIrisSettings *v35;
  PUIrisSettings *irisSettings;
  PUOneUpSettings *v37;
  PUOneUpSettings *oneUpSettings;
  PUPhotosGridSettings *v39;
  PUPhotosGridSettings *photosGridSettings;
  PXSharingSettings *v41;
  PXSharingSettings *sharingSettings;
  PXGenerativeStorySettings *v43;
  PXGenerativeStorySettings *generativeStorySettings;
  PUTilingViewSettings *v45;
  PUTilingViewSettings *tilingViewSettings;
  PUWorkaroundSettings *v47;
  PUWorkaroundSettings *workaroundSettings;

  v3 = -[PTSettings initWithDefaultValues]([PUPhotoEditProtoSettings alloc], "initWithDefaultValues");
  photoEditingSettings = self->_photoEditingSettings;
  self->_photoEditingSettings = v3;

  v5 = -[PTSettings initWithDefaultValues]([PUAudioClassificationSettings alloc], "initWithDefaultValues");
  audioClassificationSettings = self->_audioClassificationSettings;
  self->_audioClassificationSettings = v5;

  v7 = -[PTSettings initWithDefaultValues]([PUAirPlaySettings alloc], "initWithDefaultValues");
  airPlaySettings = self->_airPlaySettings;
  self->_airPlaySettings = v7;

  v9 = -[PTSettings initWithDefaultValues]([PUWelcomeSettings alloc], "initWithDefaultValues");
  welcomeSettings = self->_welcomeSettings;
  self->_welcomeSettings = v9;

  v11 = -[PTSettings initWithDefaultValues]([PUSceneSettings alloc], "initWithDefaultValues");
  sceneSettings = self->_sceneSettings;
  self->_sceneSettings = v11;

  v13 = -[PTSettings initWithDefaultValues]([PUPerformanceDiagnosticsSettings alloc], "initWithDefaultValues");
  performanceDiagnosticsSettings = self->_performanceDiagnosticsSettings;
  self->_performanceDiagnosticsSettings = v13;

  v15 = -[PTSettings initWithDefaultValues]([PUMedusaSettings alloc], "initWithDefaultValues");
  medusaSettings = self->_medusaSettings;
  self->_medusaSettings = v15;

  v17 = -[PTSettings initWithDefaultValues]([PUSlideshowSettings alloc], "initWithDefaultValues");
  slideshowSettings = self->_slideshowSettings;
  self->_slideshowSettings = v17;

  v19 = -[PTSettings initWithDefaultValues]([PUFeedSettings alloc], "initWithDefaultValues");
  feedSettings = self->_feedSettings;
  self->_feedSettings = v19;

  v21 = -[PTSettings initWithDefaultValues]([PUCurationSettings alloc], "initWithDefaultValues");
  curation = self->_curation;
  self->_curation = v21;

  v23 = -[PTSettings initWithDefaultValues]([PUCompositeVideoSettings alloc], "initWithDefaultValues");
  compositeVideoSettings = self->_compositeVideoSettings;
  self->_compositeVideoSettings = v23;

  v25 = -[PTSettings initWithDefaultValues]([PUAmbientPhotoFrameSettings alloc], "initWithDefaultValues");
  ambientPhotoFrameSettings = self->_ambientPhotoFrameSettings;
  self->_ambientPhotoFrameSettings = v25;

  v27 = (PXImportSettings *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B530]), "initWithDefaultValues");
  importSettings = self->_importSettings;
  self->_importSettings = v27;

  v29 = -[PTSettings initWithDefaultValues]([PUTabbedLibrarySettings alloc], "initWithDefaultValues");
  tabbedLibrarySettings = self->_tabbedLibrarySettings;
  self->_tabbedLibrarySettings = v29;

  v31 = -[PTSettings initWithDefaultValues]([PUSuggestionsSettings alloc], "initWithDefaultValues");
  suggestions = self->_suggestions;
  self->_suggestions = v31;

  v33 = -[PTSettings initWithDefaultValues]([PUAlbumListSettings alloc], "initWithDefaultValues");
  albumListSettings = self->_albumListSettings;
  self->_albumListSettings = v33;

  v35 = -[PTSettings initWithDefaultValues]([PUIrisSettings alloc], "initWithDefaultValues");
  irisSettings = self->_irisSettings;
  self->_irisSettings = v35;

  v37 = -[PTSettings initWithDefaultValues]([PUOneUpSettings alloc], "initWithDefaultValues");
  oneUpSettings = self->_oneUpSettings;
  self->_oneUpSettings = v37;

  v39 = -[PTSettings initWithDefaultValues]([PUPhotosGridSettings alloc], "initWithDefaultValues");
  photosGridSettings = self->_photosGridSettings;
  self->_photosGridSettings = v39;

  v41 = (PXSharingSettings *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B980]), "initWithDefaultValues");
  sharingSettings = self->_sharingSettings;
  self->_sharingSettings = v41;

  v43 = (PXGenerativeStorySettings *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B4B0]), "initWithDefaultValues");
  generativeStorySettings = self->_generativeStorySettings;
  self->_generativeStorySettings = v43;

  v45 = -[PTSettings initWithDefaultValues]([PUTilingViewSettings alloc], "initWithDefaultValues");
  tilingViewSettings = self->_tilingViewSettings;
  self->_tilingViewSettings = v45;

  v47 = -[PTSettings initWithDefaultValues]([PUWorkaroundSettings alloc], "initWithDefaultValues");
  workaroundSettings = self->_workaroundSettings;
  self->_workaroundSettings = v47;

}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PURootSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PURootSettings setAllowIrisUI:](self, "setAllowIrisUI:", 1);
  -[PURootSettings setInterfaceThemeClass:](self, "setInterfaceThemeClass:", objc_opt_class());
}

- (void)setInterfaceThemeClass:(Class)a3
{
  objc_storeStrong((id *)&self->_interfaceThemeClass, a3);
}

- (void)setAllowIrisUI:(BOOL)a3
{
  self->_allowIrisUI = a3;
}

- (PUTabbedLibrarySettings)tabbedLibrarySettings
{
  return self->_tabbedLibrarySettings;
}

+ (id)sharedInstance
{
  uint64_t v3;
  void *v4;

  os_unfair_lock_lock(MEMORY[0x1E0D7C768]);
  if (!sharedInstance_sharedInstance_81851)
  {
    objc_msgSend(a1, "createSharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)sharedInstance_sharedInstance_81851;
    sharedInstance_sharedInstance_81851 = v3;

  }
  os_unfair_lock_unlock(MEMORY[0x1E0D7C768]);
  return (id)sharedInstance_sharedInstance_81851;
}

+ (void)setupStatusBarInternalSettingsGestureOnInternalDevices
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  _QWORD v7[5];
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x1AF429AFC](a1, a2))
  {
    if (MEMORY[0x1AF429AF0]())
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("PUEnableDoubleTapSettings");
      v9[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "registerDefaults:", v4);

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("PUEnableDoubleTapSettings"));

      if (v6)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __72__PURootSettings_setupStatusBarInternalSettingsGestureOnInternalDevices__block_invoke;
        v7[3] = &__block_descriptor_40_e5_v8__0l;
        v7[4] = a1;
        if (setupStatusBarInternalSettingsGestureOnInternalDevices_onceToken != -1)
          dispatch_once(&setupStatusBarInternalSettingsGestureOnInternalDevices_onceToken, v7);
      }
    }
  }
}

- (id)parentSettings
{
  return 0;
}

- (void)restoreDefaultValues
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PURootSettings;
  -[PXSettings restoreDefaultValues](&v3, sel_restoreDefaultValues);
  objc_msgSend((id)objc_opt_class(), "_photoKitSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restoreDefaultValues");

}

- (id)favoritesSettings
{
  return (id)objc_msgSend(MEMORY[0x1E0D7B3D0], "sharedInstance");
}

- (void)applyArchiveValue:(id)a3 forKey:(id)a4
{
  id v6;
  NSString *v7;
  Class v8;
  objc_super v9;

  v6 = a4;
  v7 = (NSString *)a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("interfaceThemeClass")))
  {
    v8 = NSClassFromString(v7);

    -[PURootSettings setInterfaceThemeClass:](self, "setInterfaceThemeClass:", v8);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PURootSettings;
    -[PXSettings applyArchiveValue:forKey:](&v9, sel_applyArchiveValue_forKey_, v7, v6);

  }
}

- (id)archiveValueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("interfaceThemeClass")))
  {
    NSStringFromClass(-[PURootSettings interfaceThemeClass](self, "interfaceThemeClass"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PURootSettings;
    -[PXSettings archiveValueForKey:](&v8, sel_archiveValueForKey_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)reparentedRootSettings
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_photosUICoreSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setObservationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PURootSettings;
  -[PTSettings _setObservationEnabled:](&v14, sel__setObservationEnabled_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PURootSettings reparentedRootSettings](self, "reparentedRootSettings", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_setObservationEnabled:", v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (BOOL)irisUIEnabled
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "launchedToTest");

  return -[PURootSettings allowIrisUI](self, "allowIrisUI") | v4;
}

- (void)setEnforceDisableIrisUI:(BOOL)a3
{
  self->_enforceDisableIrisUI = a3;
}

- (void)favoritesSettingsDidChangeFavorites:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PURootSettings valueForKey:](self, "valueForKey:", CFSTR("_internal_libraryStateBriefDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PURootSettings setValue:forKey:](self, "setValue:forKey:", v7, CFSTR("_internal_libraryStateBriefDescription"));

  -[PURootSettings setValue:forKey:](self, "setValue:forKey:", v4, CFSTR("_internal_libraryStateBriefDescription"));
  -[PURootSettings valueForKey:](self, "valueForKey:", CFSTR("_memory_creationStateTitle"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PURootSettings setValue:forKey:](self, "setValue:forKey:", v10, CFSTR("_memory_creationStateTitle"));

  -[PURootSettings setValue:forKey:](self, "setValue:forKey:", v11, CFSTR("_memory_creationStateTitle"));
}

- (void)favoritesSettings:(id)a3 loadAccessorySettingsWithCompletionHandler:(id)a4
{
  id v4;
  id v5;
  void (**v6)(void);

  v6 = (void (**)(void))a4;
  v4 = PUTesterRootSettingsLoadIfNecessary(1);
  v5 = (id)PXSoftLinkedProtoRootSettingsLoadIfNecessary();
  v6[2]();

}

- (BOOL)allowIrisUI
{
  return self->_allowIrisUI;
}

- (PUCompositeVideoSettings)compositeVideoSettings
{
  return self->_compositeVideoSettings;
}

- (void)setCompositeVideoSettings:(id)a3
{
  objc_storeStrong((id *)&self->_compositeVideoSettings, a3);
}

- (void)setTabbedLibrarySettings:(id)a3
{
  objc_storeStrong((id *)&self->_tabbedLibrarySettings, a3);
}

- (PUPhotosGridSettings)photosGridSettings
{
  return self->_photosGridSettings;
}

- (void)setPhotosGridSettings:(id)a3
{
  objc_storeStrong((id *)&self->_photosGridSettings, a3);
}

- (PUPhotoEditProtoSettings)photoEditingSettings
{
  return self->_photoEditingSettings;
}

- (void)setPhotoEditingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_photoEditingSettings, a3);
}

- (PUFeedSettings)feedSettings
{
  return self->_feedSettings;
}

- (void)setFeedSettings:(id)a3
{
  objc_storeStrong((id *)&self->_feedSettings, a3);
}

- (PUMedusaSettings)medusaSettings
{
  return self->_medusaSettings;
}

- (void)setMedusaSettings:(id)a3
{
  objc_storeStrong((id *)&self->_medusaSettings, a3);
}

- (PUOneUpSettings)oneUpSettings
{
  return self->_oneUpSettings;
}

- (void)setOneUpSettings:(id)a3
{
  objc_storeStrong((id *)&self->_oneUpSettings, a3);
}

- (PUTilingViewSettings)tilingViewSettings
{
  return self->_tilingViewSettings;
}

- (void)setTilingViewSettings:(id)a3
{
  objc_storeStrong((id *)&self->_tilingViewSettings, a3);
}

- (Class)interfaceThemeClass
{
  return self->_interfaceThemeClass;
}

- (PUAirPlaySettings)airPlaySettings
{
  return self->_airPlaySettings;
}

- (void)setAirPlaySettings:(id)a3
{
  objc_storeStrong((id *)&self->_airPlaySettings, a3);
}

- (PUSlideshowSettings)slideshowSettings
{
  return self->_slideshowSettings;
}

- (void)setSlideshowSettings:(id)a3
{
  objc_storeStrong((id *)&self->_slideshowSettings, a3);
}

- (PUAlbumListSettings)albumListSettings
{
  return self->_albumListSettings;
}

- (void)setAlbumListSettings:(id)a3
{
  objc_storeStrong((id *)&self->_albumListSettings, a3);
}

- (PUWelcomeSettings)welcomeSettings
{
  return self->_welcomeSettings;
}

- (void)setWelcomeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_welcomeSettings, a3);
}

- (PUWorkaroundSettings)workaroundSettings
{
  return self->_workaroundSettings;
}

- (void)setWorkaroundSettings:(id)a3
{
  objc_storeStrong((id *)&self->_workaroundSettings, a3);
}

- (PUSceneSettings)sceneSettings
{
  return self->_sceneSettings;
}

- (void)setSceneSettings:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSettings, a3);
}

- (PXGenerativeStorySettings)generativeStorySettings
{
  return self->_generativeStorySettings;
}

- (void)setGenerativeStorySettings:(id)a3
{
  objc_storeStrong((id *)&self->_generativeStorySettings, a3);
}

- (PUAudioClassificationSettings)audioClassificationSettings
{
  return self->_audioClassificationSettings;
}

- (void)setAudioClassificationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_audioClassificationSettings, a3);
}

- (PUAmbientPhotoFrameSettings)ambientPhotoFrameSettings
{
  return self->_ambientPhotoFrameSettings;
}

- (void)setAmbientPhotoFrameSettings:(id)a3
{
  objc_storeStrong((id *)&self->_ambientPhotoFrameSettings, a3);
}

- (PXSharingSettings)sharingSettings
{
  return self->_sharingSettings;
}

- (void)setSharingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_sharingSettings, a3);
}

- (PUCurationSettings)curation
{
  return self->_curation;
}

- (void)setCuration:(id)a3
{
  objc_storeStrong((id *)&self->_curation, a3);
}

- (PUSuggestionsSettings)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_suggestions, a3);
}

- (PUIrisSettings)irisSettings
{
  return self->_irisSettings;
}

- (void)setIrisSettings:(id)a3
{
  objc_storeStrong((id *)&self->_irisSettings, a3);
}

- (PUPerformanceDiagnosticsSettings)performanceDiagnosticsSettings
{
  return self->_performanceDiagnosticsSettings;
}

- (void)setPerformanceDiagnosticsSettings:(id)a3
{
  objc_storeStrong((id *)&self->_performanceDiagnosticsSettings, a3);
}

- (PXImportSettings)importSettings
{
  return self->_importSettings;
}

- (void)setImportSettings:(id)a3
{
  objc_storeStrong((id *)&self->_importSettings, a3);
}

- (NSString)_internal_libraryStateBriefDescription
{
  return self->__internal_libraryStateBriefDescription;
}

- (void)set_internal_libraryStateBriefDescription:(id)a3
{
  objc_storeStrong((id *)&self->__internal_libraryStateBriefDescription, a3);
}

- (UIImage)_internal_libraryStateImage
{
  return self->__internal_libraryStateImage;
}

- (void)set_internal_libraryStateImage:(id)a3
{
  objc_storeStrong((id *)&self->__internal_libraryStateImage, a3);
}

- (NSString)_memory_creationStateTitle
{
  return self->__memory_creationStateTitle;
}

- (void)set_memory_creationStateTitle:(id)a3
{
  objc_storeStrong((id *)&self->__memory_creationStateTitle, a3);
}

- (UIImage)_memory_creationStateImage
{
  return self->__memory_creationStateImage;
}

- (void)set_memory_creationStateImage:(id)a3
{
  objc_storeStrong((id *)&self->__memory_creationStateImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__memory_creationStateImage, 0);
  objc_storeStrong((id *)&self->__memory_creationStateTitle, 0);
  objc_storeStrong((id *)&self->__internal_libraryStateImage, 0);
  objc_storeStrong((id *)&self->__internal_libraryStateBriefDescription, 0);
  objc_storeStrong((id *)&self->_importSettings, 0);
  objc_storeStrong((id *)&self->_performanceDiagnosticsSettings, 0);
  objc_storeStrong((id *)&self->_irisSettings, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_curation, 0);
  objc_storeStrong((id *)&self->_sharingSettings, 0);
  objc_storeStrong((id *)&self->_ambientPhotoFrameSettings, 0);
  objc_storeStrong((id *)&self->_audioClassificationSettings, 0);
  objc_storeStrong((id *)&self->_generativeStorySettings, 0);
  objc_storeStrong((id *)&self->_sceneSettings, 0);
  objc_storeStrong((id *)&self->_workaroundSettings, 0);
  objc_storeStrong((id *)&self->_welcomeSettings, 0);
  objc_storeStrong((id *)&self->_albumListSettings, 0);
  objc_storeStrong((id *)&self->_slideshowSettings, 0);
  objc_storeStrong((id *)&self->_airPlaySettings, 0);
  objc_storeStrong((id *)&self->_interfaceThemeClass, 0);
  objc_storeStrong((id *)&self->_tilingViewSettings, 0);
  objc_storeStrong((id *)&self->_oneUpSettings, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_feedSettings, 0);
  objc_storeStrong((id *)&self->_photoEditingSettings, 0);
  objc_storeStrong((id *)&self->_photosGridSettings, 0);
  objc_storeStrong((id *)&self->_tabbedLibrarySettings, 0);
  objc_storeStrong((id *)&self->_compositeVideoSettings, 0);
}

+ (id)settingsControllerModule
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  _QWORD v142[5];
  _QWORD v143[4];
  _QWORD v144[5];
  _QWORD v145[2];
  _QWORD v146[3];
  _QWORD v147[33];

  v147[31] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D7B778]);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__internal_libraryStateBriefDescription);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__internal_libraryStateImage);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "initWithPhotoLibrary:titleKeyPath:imageKeyPath:", v4, v5, v6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = (void *)v7;
  objc_msgSend(v8, "addObject:", v7);
  if (_os_feature_enabled_impl())
  {
    v9 = objc_alloc(MEMORY[0x1E0D7B4A8]);
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel__memory_creationStateTitle);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel__memory_creationStateImage);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithPhotoLibrary:titleKeyPath:imageKeyPath:", v10, v11, v12);

    objc_msgSend(v8, "addObject:", v13);
  }
  v140 = v8;
  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v8, CFSTR("Processing Progress"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D7B3D0];
  NSStringFromSelector(sel_favoritesSettings);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "favoritesSubmoduleWithFavoritesSettingsKeyPath:delegate:", v15, v16);
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    v18 = (void *)MEMORY[0x1E0D83048];
    objc_msgSend(MEMORY[0x1E0D7B8B0], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lemonadeSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pu_rowWithTitle:settings:", CFSTR("🍋 Lemonade"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v21);

  }
  v22 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_tabbedLibrarySettings);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rowWithTitle:childSettingsKeyPath:", CFSTR("Tabs & Sidebar"), v137);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v147[0] = v136;
  v23 = (void *)MEMORY[0x1E0D83048];
  objc_msgSend(a1, "_photosUICoreSettings");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "pu_rowWithTitle:settings:", CFSTR("PhotosUICore"), v135);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v147[1] = v134;
  objc_msgSend(MEMORY[0x1E0D83048], "pu_rowWithTitle:settingsProvider:", CFSTR("Tutorials"), &__block_literal_global_81734);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v147[2] = v133;
  v24 = (void *)MEMORY[0x1E0D83048];
  objc_msgSend(a1, "_photosUICoreSettings");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "diagnostics");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "pu_rowWithTitle:settings:", CFSTR("Diagnostics"), v131);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v147[3] = v130;
  v25 = (void *)MEMORY[0x1E0D83048];
  objc_msgSend(a1, "_photoKitSettings");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "pu_rowWithTitle:settings:", CFSTR("PhotoKit"), v129);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v147[4] = v128;
  v26 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_curation);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rowWithTitle:childSettingsKeyPath:", CFSTR("Curation"), v127);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v147[5] = v126;
  v27 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_welcomeSettings);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rowWithTitle:childSettingsKeyPath:", CFSTR("Welcome"), v125);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v147[6] = v124;
  v28 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_photosGridSettings);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rowWithTitle:childSettingsKeyPath:", CFSTR("Photos Grid"), v123);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v147[7] = v122;
  v29 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_photoEditingSettings);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rowWithTitle:childSettingsKeyPath:", CFSTR("Photo Editing"), v121);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v147[8] = v120;
  v30 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_feedSettings);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rowWithTitle:childSettingsKeyPath:", CFSTR("Feed"), v119);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v147[9] = v118;
  v31 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_medusaSettings);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rowWithTitle:childSettingsKeyPath:", CFSTR("Medusa"), v117);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v147[10] = v116;
  v32 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_oneUpSettings);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rowWithTitle:childSettingsKeyPath:", CFSTR("One Up"), v115);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v147[11] = v114;
  v33 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_workaroundSettings);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rowWithTitle:childSettingsKeyPath:", CFSTR("Workarounds"), v113);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v147[12] = v112;
  v34 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowIrisUI);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rowWithTitle:valueKeyPath:", CFSTR("Iris UI and Playback"), v111);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v147[13] = v110;
  v35 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_irisSettings);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "rowWithTitle:childSettingsKeyPath:", CFSTR("Iris"), v109);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v147[14] = v108;
  v36 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_tilingViewSettings);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowWithTitle:childSettingsKeyPath:", CFSTR("Tiling View"), v107);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v147[15] = v106;
  v37 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_slideshowSettings);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "rowWithTitle:childSettingsKeyPath:", CFSTR("Slideshow"), v105);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v147[16] = v103;
  v38 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_albumListSettings);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "rowWithTitle:childSettingsKeyPath:", CFSTR("Albums List"), v102);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v147[17] = v101;
  v39 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_sceneSettings);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rowWithTitle:childSettingsKeyPath:", CFSTR("Scenes"), v100);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v147[18] = v99;
  v40 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_audioClassificationSettings);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "rowWithTitle:childSettingsKeyPath:", CFSTR("Audio Classification"), v98);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v147[19] = v97;
  v41 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_suggestions);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "rowWithTitle:childSettingsKeyPath:", CFSTR("Suggestions"), v96);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v147[20] = v95;
  v42 = (void *)MEMORY[0x1E0D83048];
  objc_msgSend(a1, "_photosUICoreSettings");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "sharingSettings");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "pu_rowWithTitle:settings:", CFSTR("Sharing"), v93);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v147[21] = v92;
  v43 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_interfaceThemeClass);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "rowWithTitle:valueKeyPath:", CFSTR("Interface Theme"), v91);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v146[0] = objc_opt_class();
  v146[1] = objc_opt_class();
  v146[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v146, 3);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "possibleValues:titles:", v89, &unk_1E59BA768);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v147[22] = v88;
  v44 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_airPlaySettings);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "rowWithTitle:childSettingsKeyPath:", CFSTR("AirPlay"), v87);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v147[23] = v85;
  v45 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_performanceDiagnosticsSettings);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "rowWithTitle:childSettingsKeyPath:", CFSTR("Performance Diagnostics"), v84);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v147[24] = v83;
  v46 = (void *)MEMORY[0x1E0D83048];
  objc_msgSend(a1, "_photosUICoreSettings");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "importSettings");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "pu_rowWithTitle:settings:", CFSTR("Import"), v81);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v147[25] = v80;
  v47 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_compositeVideoSettings);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "rowWithTitle:childSettingsKeyPath:", CFSTR("Composite Video"), v79);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v147[26] = v78;
  v48 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_ambientPhotoFrameSettings);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "rowWithTitle:childSettingsKeyPath:", CFSTR("Ambient Photo Frame"), v77);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v147[27] = v49;
  v50 = (void *)MEMORY[0x1E0D83048];
  objc_msgSend(a1, "_photosUICoreSettings");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "generativeStorySettings");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "pu_rowWithTitle:settings:", CFSTR("Memory Creation"), v52);
  v104 = a1;
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v147[28] = v53;
  v54 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_284_81784);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "rowWithTitle:action:", CFSTR("Subscribe To Phototypes Roots"), v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v147[29] = v56;
  v57 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "rowWithTitle:action:", CFSTR("Restore All Defaults"), v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v147[30] = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 31);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v17;
  objc_msgSend(v17, "addObjectsFromArray:", v60);

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v17);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "pu_rowWithTitle:settingsProvider:", CFSTR("PhotosUI Tester"), &__block_literal_global_292_81789);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v145[0] = v63;
  objc_msgSend(MEMORY[0x1E0D83048], "pu_rowWithTitle:settingsProvider:", CFSTR("PhotosUICore Proto"), &__block_literal_global_295);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v145[1] = v64;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 2);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addObjectsFromArray:", v65);

  objc_msgSend(v62, "addObjectsFromArray:", sDebugRows);
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:asynchronousOutputProducer:", CFSTR("Print UI State"), &__block_literal_global_299);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v144[0] = v66;
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:asynchronousOutputProducer:", CFSTR("Print iCloud Photo Library Status"), &__block_literal_global_304_81793);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v144[1] = v67;
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:asynchronousOutputProducer:", CFSTR("Print Photo Analysis Status"), &__block_literal_global_307);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v144[2] = v68;
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:asynchronousOutputProducer:", CFSTR("Print Statistics"), &__block_literal_global_310);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v144[3] = v69;
  v142[0] = MEMORY[0x1E0C809B0];
  v142[1] = 3221225472;
  v142[2] = __42__PURootSettings_settingsControllerModule__block_invoke_13;
  v142[3] = &__block_descriptor_40_e30_v16__0__PTUIModuleController_8l;
  v142[4] = v104;
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Delete All Diagnostic Files"), v142);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v144[4] = v70;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 5);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addObjectsFromArray:", v71);

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v62, CFSTR("Debug"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)MEMORY[0x1E0D83078];
  v143[0] = v138;
  v143[1] = v139;
  v143[2] = v61;
  v143[3] = v72;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 4);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "moduleWithTitle:contents:", CFSTR("Photos"), v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  return v75;
}

+ (id)_saveScreenshot:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  UIImageJPEGRepresentation((UIImage *)a3, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("tapToRadar.jpg"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  objc_msgSend(v3, "writeToFile:options:error:", v5, 1, &v9);
  v6 = v9;
  if (v6)
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Unable to write screenshot to temp url: %@", buf, 0xCu);
    }

  }
  return v5;
}

+ (void)_presentTapToRadar
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;
  CGSize v51;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7B428], "defaultDescription");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3F20], "pu_currentViewControllerStack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "frame");
  v51.width = v13;
  v51.height = v14;
  UIGraphicsBeginImageContextWithOptions(v51, 0, 0.0);
  objc_msgSend(v4, "drawViewHierarchyInRect:", v6, v8, v10, v12);
  UIGraphicsGetImageFromCurrentImageContext();
  v15 = objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v37 = (void *)v15;
  objc_msgSend((id)objc_opt_class(), "_saveScreenshot:", v15);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "pu_debugCurrentAsset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v17;
    else
      v19 = 0;
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D09828]);
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D09830]);

    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", *MEMORY[0x1E0D09718], v18);
  }
  v22 = (void *)objc_opt_new();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v23 = v2;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v44;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v44 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v27), "debugURLsForDiagnostics");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObjectsFromArray:", v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v25);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0D7B428];
  v48 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = *MEMORY[0x1E0D7C3A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __36__PURootSettings__presentTapToRadar__block_invoke;
  v40[3] = &unk_1E58AAE08;
  v41 = v29;
  v42 = v16;
  v33 = v16;
  v34 = v29;
  LOWORD(v35) = 1;
  objc_msgSend(v30, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", CFSTR("Photos - [TTR] <Insert Bug Title>"), v39, CFSTR("Other Bug"), CFSTR("630529"), CFSTR("Photos (New Bugs) | iOS"), CFSTR("all"), 0, v31, v22, v35, v32, v40);

}

+ (void)presentSettingsController
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _PUSettingsController *v15;
  id v16;
  void (**v17)(void);
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v36;
  void *v37;
  id v38;
  objc_class *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id location;
  _QWORD v58[5];
  _QWORD v59[4];
  id v60;
  uint64_t *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  id *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  char v72;
  _BYTE v73[128];
  uint64_t v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v74 = *MEMORY[0x1E0C80C00];
  v72 = 0;
  SBSGetScreenLockStatus();
  if (!settingsWindow || objc_msgSend((id)settingsWindow, "isHidden"))
  {
    objc_msgSend(MEMORY[0x1E0DC3F20], "pu_currentViewControllerStack");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v45)
    {
LABEL_20:

      return;
    }
    objc_msgSend(a1, "_debugRowsForViewControllerStack:", v4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[PURootSettings _setDebugRows:](PURootSettings, "_setDebugRows:", v44);
    objc_msgSend(a1, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setObservationEnabled:", 1);
    v66 = 0;
    v67 = (id *)&v66;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__81489;
    v70 = __Block_byref_object_dispose__81490;
    v71 = 0;
    v6 = objc_msgSend(v4, "hash");
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v63 != v9)
            objc_enumerationMutation(v7);
          v6 ^= objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "hash");
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
      }
      while (v8);
    }

    if (v6 == presentSettingsController_lastHash)
    {
      objc_storeStrong(v67 + 5, (id)presentSettingsController_lastSettingsViewController);
      objc_msgSend(v67[5], "viewControllers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "copy");
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __43__PURootSettings_presentSettingsController__block_invoke_354;
      v59[3] = &unk_1E58A75F0;
      v61 = &v66;
      v13 = v11;
      v60 = v13;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v59);

    }
    v14 = v67[5];
    if (!v14)
    {
      v15 = -[_PUSettingsController initWithRootSettings:]([_PUSettingsController alloc], "initWithRootSettings:", v5);
      v16 = v67[5];
      v67[5] = v15;

      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __43__PURootSettings_presentSettingsController__block_invoke_2;
      v58[3] = &__block_descriptor_40_e22___UIBarButtonItem_8__0l;
      v58[4] = a1;
      objc_msgSend(v67[5], "setDismissButtonFactory:", v58);
      objc_msgSend(v67[5], "dismissButtonFactory");
      v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v17[2]();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67[5], "setDismissButton:", v18);

      objc_initWeak(&location, v67[5]);
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __43__PURootSettings_presentSettingsController__block_invoke_3;
      v55[3] = &unk_1E58A7638;
      objc_copyWeak(&v56, &location);
      objc_msgSend(v67[5], "setEllipsisBarButtonItemFactory:", v55);
      objc_destroyWeak(&v56);
      objc_destroyWeak(&location);
      v14 = v67[5];
    }
    presentSettingsController_lastHash = v6;
    objc_storeStrong((id *)&presentSettingsController_lastSettingsViewController, v14);
    v19 = v67[5];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __43__PURootSettings_presentSettingsController__block_invoke_4;
    v52[3] = &unk_1E58AACF0;
    v20 = v5;
    v53 = v20;
    v54 = a1;
    objc_msgSend(v19, "setOnViewDidDisappearBlock:", v52);
    v21 = (void *)settingsWindow;
    if (settingsWindow)
    {
LABEL_19:
      objc_msgSend(v21, "setHidden:", 0);
      objc_msgSend((id)settingsWindow, "setRootViewController:", v67[5]);
      objc_msgSend((id)settingsWindow, "makeKeyAndVisible");
      objc_msgSend((id)settingsWindow, "rootViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "frame");
      x = v75.origin.x;
      y = v75.origin.y;
      width = v75.size.width;
      height = v75.size.height;
      v36 = -CGRectGetHeight(v75);
      v76.origin.x = x;
      v76.origin.y = y;
      v76.size.width = width;
      v76.size.height = height;
      v77 = CGRectOffset(v76, 0.0, v36);
      objc_msgSend(v31, "setFrame:", v77.origin.x, v77.origin.y, v77.size.width, v77.size.height);
      v37 = (void *)MEMORY[0x1E0DC3F10];
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __43__PURootSettings_presentSettingsController__block_invoke_5;
      v46[3] = &unk_1E58AACA0;
      v38 = v31;
      v47 = v38;
      v48 = x;
      v49 = y;
      v50 = width;
      v51 = height;
      objc_msgSend(v37, "_animateUsingDefaultTimingWithOptions:animations:completion:", 2, v46, 0);

      _Block_object_dispose(&v66, 8);
      goto LABEL_20;
    }
    v22 = objc_alloc(MEMORY[0x1E0DC3F98]);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "connectedScenes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "anyObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_18:
        v26 = objc_msgSend(v22, "initWithWindowScene:", v25);
        v27 = (void *)settingsWindow;
        settingsWindow = v26;

        v28 = objc_alloc_init(MEMORY[0x1E0D7B2E0]);
        v29 = (void *)settingsDiagnosticsController;
        settingsDiagnosticsController = (uint64_t)v28;

        objc_msgSend((id)settingsDiagnosticsController, "setupOnInternalDevicesWithWindow:", settingsWindow);
        v21 = (void *)settingsWindow;
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "px_descriptionForAssertionMessage");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PURootSettings.m"), 484, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("UIApplication.sharedApplication.connectedScenes.anyObject"), v40, v42);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PURootSettings.m"), 484, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("UIApplication.sharedApplication.connectedScenes.anyObject"), v40);
    }

    goto LABEL_18;
  }
}

+ (void)dismissSettingsController
{
  if (settingsWindow)
  {
    if ((objc_msgSend((id)settingsWindow, "isHidden") & 1) == 0)
      objc_msgSend(a1, "dismissSettingsController:", 0);
  }
}

+ (void)dismissSettingsController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v3 = (id)settingsWindow;
  objc_msgSend((id)settingsWindow, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToast:", 0);
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)MEMORY[0x1E0DC3F10];
  v15 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __44__PURootSettings_dismissSettingsController___block_invoke;
  v27[3] = &unk_1E58AACA0;
  v28 = v5;
  v29 = v7;
  v30 = v9;
  v31 = v11;
  v32 = v13;
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __44__PURootSettings_dismissSettingsController___block_invoke_2;
  v19[3] = &unk_1E58A7660;
  v20 = v3;
  v21 = v28;
  v23 = v7;
  v24 = v9;
  v25 = v11;
  v26 = v13;
  v22 = v4;
  v16 = v4;
  v17 = v28;
  v18 = v3;
  objc_msgSend(v14, "_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v27, v19);

}

+ (id)_debugRowsForViewControllerStack:(id)a3
{
  void *v3;
  void (**v4)(void);
  void *v5;
  void (**v6)(void);
  void *v7;
  void (**v8)(void);
  void *v9;
  void (**v10)(void);
  void *v11;
  void (**v12)(void);
  void *v13;
  void (**v14)(void);
  void *v15;
  void (**v16)(void);
  void *v17;
  void *v18;
  void (**v19)(void);
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(void);
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  id v56;
  void *v57;
  id v59;
  id obj;
  uint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t i;
  void *v72;
  void (**v73)(void);
  void *v74;
  _QWORD v75[4];
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[4];
  id v88;
  _QWORD v89[4];
  id v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[4];
  id v94;
  _QWORD v95[4];
  id v96;
  _QWORD v97[4];
  id v98;
  _QWORD v99[4];
  void (**v100)(void);
  _QWORD v101[4];
  void (**v102)(void);
  _QWORD v103[4];
  void (**v104)(void);
  _QWORD v105[4];
  void (**v106)(void);
  _QWORD v107[4];
  void (**v108)(void);
  _QWORD v109[4];
  void (**v110)(void);
  _QWORD v111[4];
  void (**v112)(void);
  _QWORD v113[4];
  void (**v114)(void);
  _QWORD aBlock[4];
  id v116;
  id location;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  _QWORD v123[2];
  _QWORD v124[14];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v64 = (id)objc_claimAutoreleasedReturnValue();
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  objc_msgSend(v59, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v125, 16);
  if (v63)
  {
    v62 = *(_QWORD *)v119;
    do
    {
      for (i = 0; i != v63; ++i)
      {
        if (*(_QWORD *)v119 != v62)
          objc_enumerationMutation(obj);
        v72 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
        objc_initWeak(&location, v72);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke;
        aBlock[3] = &unk_1E58A7688;
        objc_copyWeak(&v116, &location);
        v73 = (void (**)(void))_Block_copy(aBlock);
        v73[2]();
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (v74)
        {
          objc_msgSend(a1, "_setCurrentAsset:", v74);
          v3 = (void *)MEMORY[0x1E0D83010];
          v113[0] = MEMORY[0x1E0C809B0];
          v113[1] = 3221225472;
          v113[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_2;
          v113[3] = &unk_1E58A76B0;
          v4 = v73;
          v114 = v4;
          objc_msgSend(v3, "pu_rowWithTitle:output:", CFSTR("Print Current Asset"), v113);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v124[0] = v70;
          v5 = (void *)MEMORY[0x1E0D83010];
          v111[0] = MEMORY[0x1E0C809B0];
          v111[1] = 3221225472;
          v111[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_3;
          v111[3] = &unk_1E58A76B0;
          v6 = v4;
          v112 = v6;
          objc_msgSend(v5, "pu_rowWithTitle:output:", CFSTR("Print Asset Resources"), v111);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v124[1] = v69;
          v7 = (void *)MEMORY[0x1E0D83010];
          v109[0] = MEMORY[0x1E0C809B0];
          v109[1] = 3221225472;
          v109[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_4;
          v109[3] = &unk_1E58A76B0;
          v8 = v6;
          v110 = v8;
          objc_msgSend(v7, "pu_rowWithTitle:output:", CFSTR("Print Asset Metadata"), v109);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v124[2] = v68;
          v9 = (void *)MEMORY[0x1E0D83010];
          v107[0] = MEMORY[0x1E0C809B0];
          v107[1] = 3221225472;
          v107[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_5;
          v107[3] = &unk_1E58A76D8;
          v10 = v8;
          v108 = v10;
          objc_msgSend(v9, "pu_rowWithTitle:action:", CFSTR("Show in Parallax Debug Viewer"), v107);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v124[3] = v67;
          v11 = (void *)MEMORY[0x1E0D83010];
          v105[0] = MEMORY[0x1E0C809B0];
          v105[1] = 3221225472;
          v105[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_6;
          v105[3] = &unk_1E58A76D8;
          v12 = v10;
          v106 = v12;
          objc_msgSend(v11, "pu_rowWithTitle:action:", CFSTR("Edit as Featured Poster"), v105);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v124[4] = v66;
          v13 = (void *)MEMORY[0x1E0D83010];
          v103[0] = MEMORY[0x1E0C809B0];
          v103[1] = 3221225472;
          v103[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_7;
          v103[3] = &unk_1E58A76D8;
          v14 = v12;
          v104 = v14;
          objc_msgSend(v13, "pu_rowWithTitle:action:", CFSTR("Create Photos Poster"), v103);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v124[5] = v65;
          v15 = (void *)MEMORY[0x1E0D83010];
          v101[0] = MEMORY[0x1E0C809B0];
          v101[1] = 3221225472;
          v101[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_8;
          v101[3] = &unk_1E58A76D8;
          v16 = v14;
          v102 = v16;
          objc_msgSend(v15, "pu_rowWithTitle:action:", CFSTR("Create Shuffle Poster"), v101);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v124[6] = v17;
          v18 = (void *)MEMORY[0x1E0D83010];
          v99[0] = MEMORY[0x1E0C809B0];
          v99[1] = 3221225472;
          v99[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_9;
          v99[3] = &unk_1E58A76D8;
          v19 = v16;
          v100 = v19;
          objc_msgSend(v18, "pu_rowWithTitle:action:", CFSTR("Create People Poster"), v99);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v124[7] = v20;
          v21 = (void *)MEMORY[0x1E0D83010];
          v97[0] = MEMORY[0x1E0C809B0];
          v97[1] = 3221225472;
          v97[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_10;
          v97[3] = &unk_1E58A8568;
          v98 = v74;
          objc_msgSend(v21, "pu_rowWithTitle:action:", CFSTR("Show as Wallpaper Lockscreen"), v97);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v124[8] = v22;
          v23 = (void *)MEMORY[0x1E0D83010];
          v95[0] = MEMORY[0x1E0C809B0];
          v95[1] = 3221225472;
          v95[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_11;
          v95[3] = &unk_1E58A76B0;
          v24 = v19;
          v96 = v24;
          objc_msgSend(v23, "pu_rowWithTitle:output:", CFSTR("Print Adjustment Data"), v95);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v124[9] = v25;
          v26 = (void *)MEMORY[0x1E0D83010];
          v93[0] = MEMORY[0x1E0C809B0];
          v93[1] = 3221225472;
          v93[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_12;
          v93[3] = &unk_1E58AB500;
          v27 = v24;
          v94 = v27;
          objc_msgSend(v26, "pu_rowWithTitle:asynchronousOutputProducer:", CFSTR("Print Story Highlights"), v93);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v124[10] = v28;
          v29 = (void *)MEMORY[0x1E0D83010];
          v91[0] = MEMORY[0x1E0C809B0];
          v91[1] = 3221225472;
          v91[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_426;
          v91[3] = &unk_1E58A7728;
          v30 = v27;
          v92 = v30;
          objc_msgSend(v29, "pu_rowWithTitle:settingsProvider:isTransient:", CFSTR("Image Manager Tester"), v91, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v124[11] = v31;
          v32 = (void *)MEMORY[0x1E0D83010];
          v89[0] = MEMORY[0x1E0C809B0];
          v89[1] = 3221225472;
          v89[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_2_429;
          v89[3] = &unk_1E58A76D8;
          v33 = v30;
          v90 = v33;
          objc_msgSend(v32, "pu_rowWithTitle:action:", CFSTR("Reset Suggestion State"), v89);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v124[12] = v34;
          v35 = (void *)MEMORY[0x1E0D83010];
          v87[0] = MEMORY[0x1E0C809B0];
          v87[1] = 3221225472;
          v87[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_438;
          v87[3] = &unk_1E58A76D8;
          v88 = v33;
          objc_msgSend(v35, "pu_rowWithTitle:action:", CFSTR("Prune CPL Resource"), v87);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v124[13] = v36;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 14);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v64, "addObjectsFromArray:", v37);
        }
        objc_msgSend(v72, "pu_debugCurrentViewModel");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          v85[0] = MEMORY[0x1E0C809B0];
          v85[1] = 3221225472;
          v85[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_2_439;
          v85[3] = &unk_1E58A7750;
          objc_copyWeak(&v86, &location);
          v39 = _Block_copy(v85);
          v40 = (void *)MEMORY[0x1E0D83010];
          v83[0] = MEMORY[0x1E0C809B0];
          v83[1] = 3221225472;
          v83[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_3_443;
          v83[3] = &unk_1E58A76B0;
          v41 = v39;
          v84 = v41;
          objc_msgSend(v40, "pu_rowWithTitle:output:", CFSTR("Print View Model"), v83);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v123[0] = v42;
          v43 = (void *)MEMORY[0x1E0D83010];
          v44 = (void *)MEMORY[0x1E0D830A0];
          v81[0] = MEMORY[0x1E0C809B0];
          v81[1] = 3221225472;
          v81[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_4_446;
          v81[3] = &unk_1E58AB550;
          v45 = v41;
          v82 = v45;
          objc_msgSend(v44, "actionWithHandler:", v81);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "rowWithTitle:action:", CFSTR("Log View Model (Continuously)"), v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v123[1] = v47;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 2);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v64, "addObjectsFromArray:", v48);
          objc_destroyWeak(&v86);
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v72, "pu_debugRows");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addObjectsFromArray:", v49);

        }
        objc_destroyWeak(&v116);
        objc_destroyWeak(&location);
      }
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v125, 16);
    }
    while (v63);
  }

  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(v59, "reverseObjectEnumerator");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v77, v122, 16);
  if (v52)
  {
    v53 = *(_QWORD *)v78;
    do
    {
      for (j = 0; j != v52; ++j)
      {
        if (*(_QWORD *)v78 != v53)
          objc_enumerationMutation(v51);
        objc_msgSend(v50, "addObject:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * j));
      }
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v77, v122, 16);
    }
    while (v52);
  }

  v55 = (void *)MEMORY[0x1E0D83010];
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_3_458;
  v75[3] = &unk_1E58A7F10;
  v76 = v50;
  v56 = v50;
  objc_msgSend(v55, "pu_rowWithTitle:output:", CFSTR("View Controller Stack"), v75);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addObject:", v57);

  return v64;
}

+ (void)_setDebugRows:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)sDebugRows;
  sDebugRows = v3;

}

+ (id)currentAsset
{
  return (id)sCurrentAsset;
}

+ (void)_setCurrentAsset:(id)a3
{
  objc_storeStrong((id *)&sCurrentAsset, a3);
}

+ (id)photosUITesterRootViewController
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getPUTesterRootSettingsViewControllerClass_softClass;
  v9 = getPUTesterRootSettingsViewControllerClass_softClass;
  if (!getPUTesterRootSettingsViewControllerClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getPUTesterRootSettingsViewControllerClass_block_invoke;
    v5[3] = &unk_1E58AAEB0;
    v5[4] = &v6;
    __getPUTesterRootSettingsViewControllerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return objc_alloc_init((Class)v3);
}

+ (id)_photoKitSettings
{
  return (id)objc_msgSend(MEMORY[0x1E0D71498], "sharedSettings");
}

+ (id)_photosUICoreSettings
{
  return (id)objc_msgSend(MEMORY[0x1E0D7B8B0], "sharedInstance");
}

+ (void)_deleteAllDiagnosticFiles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Delete All Diagnostic Files"), CFSTR("Are you sure? This action cannot be undone."), 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v2);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Delete"), 2, &__block_literal_global_504);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v3);

  objc_msgSend(MEMORY[0x1E0DC3F20], "pu_currentViewControllerStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

}

+ (void)configureToastForReminderToQuitAfterLaunch:(id)a3 target:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0D7BB10]);
  v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v8, "setMessage:", CFSTR("Photos usually needs to be quit and relaunched for changes to take effect."));
  objc_initWeak(&location, v6);
  v9 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__PURootSettings_configureToastForReminderToQuitAfterLaunch_target___block_invoke;
  v12[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "addActionWithTitle:action:", CFSTR("Quit"), v12);
  v10[0] = v9;
  v10[1] = 3221225472;
  v10[2] = __68__PURootSettings_configureToastForReminderToQuitAfterLaunch_target___block_invoke_2;
  v10[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v8, "addActionWithTitle:action:", CFSTR("Hide"), v10);
  objc_msgSend(v5, "setContentView:", v8);
  objc_msgSend(v5, "setAutoDismissalDelay:", 5.0);
  objc_msgSend(v5, "setCanSwipeToDismiss:", 1);
  objc_msgSend(v5, "setBottomMargin:", 30.0);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __68__PURootSettings_configureToastForReminderToQuitAfterLaunch_target___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "callOnViewDidDisappearBlock");

  exit(0);
}

void __68__PURootSettings_configureToastForReminderToQuitAfterLaunch_target___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_hideToast");

}

void __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;
  _QWORD v20[5];
  id v21;

  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0DC3B90]);
  objc_msgSend(v3, "setText:", CFSTR("Deleting…"));
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_firstKeyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showInView:", v5);

  objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__81489;
  v20[4] = __Block_byref_object_dispose__81490;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke_2;
  v14[3] = &unk_1E58A77E0;
  v16 = v18;
  v8 = v6;
  v15 = v8;
  v17 = v20;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke_3;
  v10[3] = &unk_1E58A77E0;
  v12 = v18;
  v9 = v3;
  v11 = v9;
  v13 = v20;
  objc_msgSend(v8, "performBlock:completionHandler:", v14, v10);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

}

void __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "deleteAllDiagnosticFiles:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

void __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke_3(uint64_t a1)
{
  id v2;
  __int128 v3;
  _QWORD block[4];
  __int128 v5;
  uint64_t v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke_4;
  block[3] = &unk_1E58A77E0;
  v3 = *(_OWORD *)(a1 + 32);
  v2 = (id)v3;
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 8) + 8) + 24))
  {
    objc_msgSend(v2, "setText:", CFSTR("Deleted"));
    objc_msgSend(*(id *)(a1 + 32), "done");
  }
  else
  {
    objc_msgSend(v2, "setText:", CFSTR("Error"));
    NSLog(CFSTR("error: %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  v4 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke_5;
  block[3] = &unk_1E58ABD10;
  v6 = *(id *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);

}

uint64_t __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hide");
}

id __51__PURootSettings__debugRowsForViewControllerStack___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pu_debugCurrentAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "detailedDebugDescriptionInLibrary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resourcesDebugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "metadataDebugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  PUParallaxLayerStackDebugViewController *v6;

  v3 = a2;
  v6 = objc_alloc_init(PUParallaxLayerStackDebugViewController);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugViewController loadPHAsset:](v6, "loadPHAsset:", v4);

  objc_msgSend(v3, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pushViewController:animated:", v6, 1);
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  PUWallpaperPosterEditDebugViewController *v4;
  void *v5;
  PUWallpaperPosterEditDebugViewController *v6;

  v3 = a2;
  v4 = [PUWallpaperPosterEditDebugViewController alloc];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUWallpaperPosterEditDebugViewController initWithAsset:posterType:](v4, "initWithAsset:posterType:", v5, 1);

  -[PUWallpaperPosterEditDebugViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 5);
  objc_msgSend(v3, "presentViewController:animated:completion:", v6, 1, 0);

}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  PUWallpaperPosterEditDebugViewController *v4;
  void *v5;
  void *v6;
  PUWallpaperPosterEditDebugViewController *v7;

  v3 = a2;
  v4 = [PUWallpaperPosterEditDebugViewController alloc];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUWallpaperPosterEditDebugViewController initWithPosterType:photoLibrary:](v4, "initWithPosterType:photoLibrary:", 101, v6);

  -[PUWallpaperPosterEditDebugViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 5);
  objc_msgSend(v3, "presentViewController:animated:completion:", v7, 1, 0);

}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  PUWallpaperPosterEditDebugViewController *v4;
  void *v5;
  void *v6;
  PUWallpaperPosterEditDebugViewController *v7;

  v3 = a2;
  v4 = [PUWallpaperPosterEditDebugViewController alloc];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUWallpaperPosterEditDebugViewController initWithPosterType:photoLibrary:](v4, "initWithPosterType:photoLibrary:", 102, v6);

  -[PUWallpaperPosterEditDebugViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 5);
  objc_msgSend(v3, "presentViewController:animated:completion:", v7, 1, 0);

}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  PUWallpaperPosterEditDebugViewController *v4;
  void *v5;
  void *v6;
  PUWallpaperPosterEditDebugViewController *v7;

  v3 = a2;
  v4 = [PUWallpaperPosterEditDebugViewController alloc];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUWallpaperPosterEditDebugViewController initWithPosterType:photoLibrary:](v4, "initWithPosterType:photoLibrary:", 103, v6);

  -[PUWallpaperPosterEditDebugViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 5);
  objc_msgSend(v3, "presentViewController:animated:completion:", v7, 1, 0);

}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  PUWallpaperPlaygroundViewController *v4;
  PUWallpaperPlaygroundViewController *v5;
  void *v6;
  PUWallpaperPlaygroundViewController *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = [PUWallpaperPlaygroundViewController alloc];
  v5 = v4;
  if (*(_QWORD *)(a1 + 32))
  {
    v8[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PUWallpaperPlaygroundViewController initWithAssets:](v5, "initWithAssets:", v6);

  }
  else
  {
    v7 = -[PUWallpaperPlaygroundViewController initWithAssets:](v4, "initWithAssets:", MEMORY[0x1E0C9AA60]);
  }
  -[PUWallpaperPlaygroundViewController presentPlaygroundWithPresentingViewController:](v7, "presentPlaygroundWithPresentingViewController:", v3);

}

__CFString *__51__PURootSettings__debugRowsForViewControllerStack___block_invoke_11(uint64_t a1)
{
  void *v1;
  void *v2;
  __CFString *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "adjustmentsDebugMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v13 = v1;
    v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    -[__CFString appendString:](v3, "appendString:", CFSTR("{"));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v2, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v2, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "debugDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%@ = %@,\n"), v9, v11);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

    -[__CFString appendString:](v3, "appendString:", CFSTR("}"));
    v1 = v13;
  }
  else if (objc_msgSend(v1, "hasAdjustments"))
  {
    v3 = CFSTR("<Unsupported Adjustments. Check console log for more info.>");
  }
  else
  {
    v3 = CFSTR("Asset is not adjusted");
  }

  return v3;
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D7BAD0]);
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_13;
    v8[3] = &unk_1E58A7700;
    v9 = v3;
    v7 = (id)objc_msgSend(v5, "requestAnalysisForAssets:options:contexts:resultHandler:", v6, 3, MEMORY[0x1E0C9AA60], v8);

  }
  else
  {
    (*((void (**)(id, const __CFString *))v3 + 2))(v3, CFSTR("No asset found."));
  }

}

id __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_426(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  PUTesterRootSettingsLoadIfNecessary(1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageManagerSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setSelectedAssetLocalIdentifier:", v5);
  return v3;
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_2_429(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  id v4;
  NSObject *v5;
  const __CFString *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_3_430;
    v8[3] = &unk_1E58ABD10;
    v9 = v1;
    v7 = 0;
    v3 = objc_msgSend(v2, "performChangesAndWait:error:", v8, &v7);
    v4 = v7;
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Reset Suggestion State success: %@", buf, 0xCu);
    }

  }
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_438(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assetsdClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "debugClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pruneAssets:resourceTypes:", v7, 0);

  }
}

id __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_2_439(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pu_debugCurrentViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_3_443(uint64_t a1)
{
  void *v1;
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "debugDetailedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_4_446(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v9;
  id location;

  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v7);
  objc_copyWeak(&v9, &location);
  PXIterateAsynchronously();
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return 1;
}

id __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_3_458(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "navigationItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "title");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
          objc_msgSend(v2, "appendFormat:", CFSTR("%@ (%@)"), v9, v11);
        else
          objc_msgSend(v2, "appendString:", v11);
        objc_msgSend(v2, "appendString:", CFSTR("\n"));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "appendString:", CFSTR("\nFor more details, use:\npo [UIViewController _allDescriptions]"));
  NSLog(CFSTR("%@"), v2);
  return v2;
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_5_447(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "debugDetailedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    PLOneUpGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    v7 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_448;
    block[3] = &unk_1E58ABD10;
    v9 = v3;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(v3, "stop");
  }

}

uint64_t __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_448(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "next");
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_3_430(uint64_t a1)
{
  uint64_t i;
  id v2;

  objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 4; ++i)
    objc_msgSend(v2, "setVariationSuggestionStates:forVariationType:", 0, i);

}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_13(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v3))
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (v4)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
      (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6);
    }
    else
    {
      PLUIGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v3;
        _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Unable to generate json data from supposedly valid object: %@", buf, 0xCu);
      }

      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v6);
    }

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

uint64_t __44__PURootSettings_dismissSettingsController___block_invoke(uint64_t a1)
{
  void *v2;
  CGFloat v3;
  CGRect v5;

  v2 = *(void **)(a1 + 32);
  v3 = -CGRectGetHeight(*(CGRect *)(a1 + 40));
  v5 = CGRectOffset(*(CGRect *)(a1 + 40), 0.0, v3);
  return objc_msgSend(v2, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

uint64_t __44__PURootSettings_dismissSettingsController___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "resignKeyWindow");
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeKeyWindow");

  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  return objc_msgSend(*(id *)(a1 + 48), "callOnViewDidDisappearBlock");
}

uint64_t __43__PURootSettings_presentSettingsController__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "presentSettingsController");
  return result;
}

void __43__PURootSettings_presentSettingsController__block_invoke_354(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (objc_msgSend(a2, "pu_debugIsTransient"))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3 - 1);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v8, "popToViewController:animated:", v9, 0);
      v8 = (void *)v9;
    }
    else
    {
      *(_QWORD *)(v7 + 40) = 0;
    }

    *a4 = 1;
  }
}

id __43__PURootSettings_presentSettingsController__block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, *(_QWORD *)(a1 + 32), sel_dismissSettingsController_);
}

id __43__PURootSettings_presentSettingsController__block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ellipsis.circle.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)objc_msgSend(v2, "initWithImage:style:target:action:", v3, 0, WeakRetained, sel_handleEllipsisBarButtonItem_);

  return v5;
}

void __43__PURootSettings_presentSettingsController__block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  +[PURootSettings _setDebugRows:](PURootSettings, "_setDebugRows:", 0);
  objc_msgSend(*(id *)(a1 + 32), "save");
  v2 = (id)testerRootSettings;
  objc_msgSend(v2, "save");

  PXSoftLinkedProtoRootSettingsLoadIfNecessary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "save");

  objc_msgSend((id)objc_opt_class(), "_photoKitSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "save");

}

uint64_t __43__PURootSettings_presentSettingsController__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __36__PURootSettings__presentTapToRadar__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);
}

void __72__PURootSettings_setupStatusBarInternalSettingsGestureOnInternalDevices__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  int out_token;
  _QWORD v17[4];
  id v18;
  id location;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBarManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_respondsToSelector();
  v8 = MEMORY[0x1E0C809B0];
  if ((v7 & 1) != 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __72__PURootSettings_setupStatusBarInternalSettingsGestureOnInternalDevices__block_invoke_2;
    v17[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v6, "setDebugMenuHandler:", v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", *(_QWORD *)(a1 + 32), sel_presentSettingsController);
    objc_msgSend(v9, "setNumberOfTapsRequired:", 2);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "statusBarWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addGestureRecognizer:", v9);

  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  out_token = 0;
  v12 = MEMORY[0x1E0C80D38];
  v13 = MEMORY[0x1E0C80D38];
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __72__PURootSettings_setupStatusBarInternalSettingsGestureOnInternalDevices__block_invoke_3;
  v14[3] = &unk_1E58A7588;
  objc_copyWeak(&v15, &location);
  notify_register_dispatch("ShowPhotosInternalSettings", &out_token, v12, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __72__PURootSettings_setupStatusBarInternalSettingsGestureOnInternalDevices__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentSettingsController");

}

void __72__PURootSettings_setupStatusBarInternalSettingsGestureOnInternalDevices__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentSettingsController");

}

uint64_t __42__PURootSettings_settingsControllerModule__block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteAllDiagnosticFiles");
}

void __42__PURootSettings_settingsControllerModule__block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  +[PUPhotosDiagnosticsAgent localDiagnosticsAgent](PUPhotosDiagnosticsAgent, "localDiagnosticsAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PURootSettings_settingsControllerModule__block_invoke_12;
  v5[3] = &unk_1E58A74E0;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "captureDescriptionOfStatisticsWithResultHandler:", v5);

}

uint64_t __42__PURootSettings_settingsControllerModule__block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __42__PURootSettings_settingsControllerModule__block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  +[PUPhotosDiagnosticsAgent localDiagnosticsAgent](PUPhotosDiagnosticsAgent, "localDiagnosticsAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PURootSettings_settingsControllerModule__block_invoke_10;
  v5[3] = &unk_1E58A74E0;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "captureDescriptionOfPhotoAnalysisWithResultHandler:", v5);

}

uint64_t __42__PURootSettings_settingsControllerModule__block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __42__PURootSettings_settingsControllerModule__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  +[PUPhotosDiagnosticsAgent localDiagnosticsAgent](PUPhotosDiagnosticsAgent, "localDiagnosticsAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PURootSettings_settingsControllerModule__block_invoke_8;
  v5[3] = &unk_1E58A74E0;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "captureDescriptionOfCloudPhotoLibraryWithResultHandler:", v5);

}

uint64_t __42__PURootSettings_settingsControllerModule__block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __42__PURootSettings_settingsControllerModule__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  +[PUPhotosDiagnosticsAgent localDiagnosticsAgent](PUPhotosDiagnosticsAgent, "localDiagnosticsAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PURootSettings_settingsControllerModule__block_invoke_6;
  v5[3] = &unk_1E58A74E0;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "captureDescriptionOfUIState:resultHandler:", 0, v5);

}

uint64_t __42__PURootSettings_settingsControllerModule__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __42__PURootSettings_settingsControllerModule__block_invoke_4()
{
  return PXSoftLinkedProtoRootSettingsLoadIfNecessary();
}

id __42__PURootSettings_settingsControllerModule__block_invoke_3()
{
  return PUTesterRootSettingsLoadIfNecessary(1);
}

uint64_t __42__PURootSettings_settingsControllerModule__block_invoke_2()
{
  objc_msgSend(MEMORY[0x1E0D7B828], "showPhototypesRootsSubscriptionAlert");
  return 1;
}

uint64_t __42__PURootSettings_settingsControllerModule__block_invoke()
{
  return PXSoftLinkedProtoTutorialsSettingsLoadIfNecessary();
}

@end

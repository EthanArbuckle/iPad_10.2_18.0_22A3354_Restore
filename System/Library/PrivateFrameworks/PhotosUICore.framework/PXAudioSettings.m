@implementation PXAudioSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAudioSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXAudioSettings setFlexReturnOnlyLocalSongs:](self, "setFlexReturnOnlyLocalSongs:", 0);
  -[PXAudioSettings setFlexSimulateDownloadFailure:](self, "setFlexSimulateDownloadFailure:", 0);
  -[PXAudioSettings setFlexSimulateAssetFetchFailure:](self, "setFlexSimulateAssetFetchFailure:", 0);
  -[PXAudioSettings setWorkaround80278485:](self, "setWorkaround80278485:", 1);
}

- (void)setWorkaround80278485:(BOOL)a3
{
  self->_workaround80278485 = a3;
}

- (void)setFlexSimulateDownloadFailure:(BOOL)a3
{
  self->_flexSimulateDownloadFailure = a3;
}

- (void)setFlexSimulateAssetFetchFailure:(BOOL)a3
{
  self->_flexSimulateAssetFetchFailure = a3;
}

- (void)setFlexReturnOnlyLocalSongs:(BOOL)a3
{
  self->_flexReturnOnlyLocalSongs = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)workaround80278485
{
  return self->_workaround80278485;
}

- (BOOL)flexReturnOnlyLocalSongs
{
  return self->_flexReturnOnlyLocalSongs;
}

- (BOOL)flexSimulateDownloadFailure
{
  return self->_flexSimulateDownloadFailure;
}

- (BOOL)flexSimulateAssetFetchFailure
{
  return self->_flexSimulateAssetFetchFailure;
}

+ (PXAudioSettings)sharedInstance
{
  if (sharedInstance_onceToken_197382 != -1)
    dispatch_once(&sharedInstance_onceToken_197382, &__block_literal_global_197383);
  return (PXAudioSettings *)(id)sharedInstance_sharedInstance_197384;
}

void __33__PXAudioSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_197384;
  sharedInstance_sharedInstance_197384 = v0;

}

+ (id)settingsControllerModule
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  _QWORD v34[5];
  _QWORD v35[4];
  void *v36;
  void *v37;
  _QWORD v38[5];

  v38[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D83078];
  v25 = (void *)MEMORY[0x1E0D83078];
  v4 = (void *)MEMORY[0x1E0D830A8];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_210536);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:action:", CFSTR("Reset Media Library Access"), v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v31, CFSTR("Permissions"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v30;
  v5 = (void *)MEMORY[0x1E0D83078];
  v6 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_workaround80278485);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Workaround 80278485"), v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:title:", v27, CFSTR("Workarounds"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v26;
  v7 = (void *)MEMORY[0x1E0D83078];
  v8 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_flexReturnOnlyLocalSongs);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:valueKeyPath:", CFSTR("Only Fetch Local Songs"), v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v23;
  v9 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_flexSimulateAssetFetchFailure);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:valueKeyPath:", CFSTR("Simulate Asset Fetch Failure"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v11;
  v12 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_flexSimulateDownloadFailure);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:valueKeyPath:", CFSTR("Simulate Download Failure"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v14;
  v15 = (void *)MEMORY[0x1E0D83010];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __47__PXAudioSettings_UI__settingsControllerModule__block_invoke_2;
  v34[3] = &__block_descriptor_40_e11_B24__0_8_16l;
  v34[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:action:", CFSTR("Purge All Local Flex Data"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:title:", v18, CFSTR("Flex Music"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "moduleWithTitle:contents:", CFSTR("Audio"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (void)purgeFlexDataFromModuleController:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[PXAlertController progressAlertControllerWithMessage:](PXAlertController, "progressAlertControllerWithMessage:", CFSTR("Purging Flex Data…"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__PXAudioSettings_UI__purgeFlexDataFromModuleController___block_invoke;
  v6[3] = &unk_1E5149198;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v3, "presentViewController:animated:completion:", v5, 1, v6);

}

uint64_t __57__PXAudioSettings_UI__purgeFlexDataFromModuleController___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "setProgress:animated:", 1, a2);
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __47__PXAudioSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "purgeFlexDataFromModuleController:");
  return 1;
}

uint64_t __47__PXAudioSettings_UI__settingsControllerModule__block_invoke()
{
  TCCAccessResetForBundleId();
  return 1;
}

@end

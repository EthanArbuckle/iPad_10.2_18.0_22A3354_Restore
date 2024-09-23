@implementation PHRootSettings

+ (id)sharedSettings
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PHRootSettings_sharedSettings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSettings_onceToken != -1)
    dispatch_once(&sharedSettings_onceToken, block);
  return (id)sharedSettings_sharedSettings;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  void *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Image Manager"), CFSTR("imageManagerSettings"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Resource Download Request"), CFSTR("resourceDownloadSettings"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v20, CFSTR("PhotoKit"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  v4 = (void *)MEMORY[0x1E0D83078];
  v5 = (void *)MEMORY[0x1E0D83010];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __42__PHRootSettings_settingsControllerModule__block_invoke;
  v23[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v23[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:action:", CFSTR("Rebuild Moments"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v8, CFSTR("Actions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v9;
  v10 = (void *)MEMORY[0x1E0D83078];
  v11 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rowWithTitle:action:", CFSTR("Restore All Defaults"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "moduleWithTitle:contents:", CFSTR("PhotoKit Settings"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (void)_rebuildMoments
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetsdClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v5 = objc_msgSend(v4, "rebuildMomentsDeletingExistingMoments:error:", 0, &v7);
  v6 = v7;

  if ((v5 & 1) == 0)
    NSLog(CFSTR("Synchronously rebuilding moments returned error: %@"), v6);

}

uint64_t __42__PHRootSettings_settingsControllerModule__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_rebuildMoments");
  return 1;
}

void __32__PHRootSettings_sharedSettings__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "createSharedSettings");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedSettings_sharedSettings;
  sharedSettings_sharedSettings = v1;

}

- (id)parentSettings
{
  return 0;
}

- (PHImageManagerSettings)imageManagerSettings
{
  return self->_imageManagerSettings;
}

- (PHResourceDownloadSettings)resourceDownloadSettings
{
  return self->_resourceDownloadSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceDownloadSettings, 0);
  objc_storeStrong((id *)&self->_imageManagerSettings, 0);
}

@end

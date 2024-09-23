@implementation SBSUIWallpaperService

+ (BOOL)setWallpaperImage:(id)a3 adjustedImage:(id)a4 thumbnailData:(id)a5 imageHashData:(id)a6 wallpaperOptions:(id)a7 forLocations:(id)a8 currentWallpaperMode:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  char v25;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  objc_msgSend(a1, "_setupAndActivateServiceClientConnection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_remoteTargetForServiceClientConnection:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "setWallpaperImage:adjustedImage:thumbnailData:imageHashData:wallpaperOptions:forLocations:currentWallpaperMode:", v22, v21, v20, v19, v18, v17, v16);

  objc_msgSend(v23, "invalidate");
  return v25;
}

+ (void)setProceduralWallpaperIdentifier:(id)a3 options:(id)a4 locations:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "_setupAndActivateServiceClientConnection");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_remoteTargetForServiceClientConnection:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProceduralWallpaperIdentifier:options:locations:", v10, v9, v8);

  objc_msgSend(v12, "invalidate");
}

+ (void)removeWallpaperVideo
{
  void *v3;
  id v4;

  objc_msgSend(a1, "_setupAndActivateServiceClientConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_remoteTargetForServiceClientConnection:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeWallpaperVideo");

  objc_msgSend(v4, "invalidate");
}

+ (BOOL)setWallpaperWithVideo:(id)a3 sandboxToken:(id)a4 cropRect:(id)a5 wallpaperMode:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a1, "_setupAndActivateServiceClientConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_remoteTargetForServiceClientConnection:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "setWallpaperWithVideo:sandboxToken:cropRect:wallpaperMode:", v13, v12, v11, v10);

  objc_msgSend(v14, "invalidate");
  return v16;
}

+ (void)restoreDefaultWallpaper
{
  void *v3;
  id v4;

  objc_msgSend(a1, "_setupAndActivateServiceClientConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_remoteTargetForServiceClientConnection:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "restoreDefaultWallpaper");

  objc_msgSend(v4, "invalidate");
}

+ (BOOL)setWallpaperColor:(id)a3 darkColor:(id)a4 forLocations:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "_setupAndActivateServiceClientConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_remoteTargetForServiceClientConnection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "setWallpaperColor:darkColor:forLocations:", v10, v9, v8);

  objc_msgSend(v11, "invalidate");
  return v13;
}

+ (BOOL)setWallpaperGradient:(id)a3 forLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_setupAndActivateServiceClientConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_remoteTargetForServiceClientConnection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "setWallpaperGradient:forLocations:", v7, v6);

  objc_msgSend(v8, "invalidate");
  return v10;
}

+ (id)getWallpaperOptionsForVariant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_setupAndActivateServiceClientConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_remoteTargetForServiceClientConnection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getWallpaperOptionsForVariant:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "invalidate");
  return v7;
}

+ (id)getWallpaperLegibilitySettingsForVariant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_setupAndActivateServiceClientConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_remoteTargetForServiceClientConnection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getWallpaperLegibilitySettingsForVariant:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "invalidate");
  return v7;
}

+ (id)_setupAndActivateServiceClientConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x1E0D23018];
  +[SBSUIWallpaperServiceInterfaceSpecification identifier](SBSUIWallpaperServiceInterfaceSpecification, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endpointForMachName:service:instance:", CFSTR("com.apple.paperboard.services"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D23010], "connectionWithEndpoint:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__SBSUIWallpaperService__setupAndActivateServiceClientConnection__block_invoke;
  v8[3] = &__block_descriptor_40_e42_v16__0___BSServiceConnectionConfiguring__8l;
  v8[4] = a1;
  objc_msgSend(v6, "configureConnection:", v8);
  objc_msgSend(v6, "activate");

  return v6;
}

void __65__SBSUIWallpaperService__setupAndActivateServiceClientConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a2;
  +[SBSUIWallpaperServiceInterfaceSpecification interface](SBSUIWallpaperServiceInterfaceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  +[SBSUIWallpaperServiceInterfaceSpecification serviceQuality](SBSUIWallpaperServiceInterfaceSpecification, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__SBSUIWallpaperService__setupAndActivateServiceClientConnection__block_invoke_2;
  v6[3] = &__block_descriptor_40_e29_v16__0__BSServiceConnection_8l;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v6);

}

void __65__SBSUIWallpaperService__setupAndActivateServiceClientConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  objc_class *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogWallpaper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = v4;
    v8 = 2114;
    v9 = v2;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Received invalidation for connection: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

+ (id)_remoteTargetForServiceClientConnection:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D87CD0];
  v4 = a3;
  objc_msgSend(v3, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTargetWithLaunchingAssertionAttributes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

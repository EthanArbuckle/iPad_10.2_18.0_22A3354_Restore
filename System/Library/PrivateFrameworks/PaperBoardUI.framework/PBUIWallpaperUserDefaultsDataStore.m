@implementation PBUIWallpaperUserDefaultsDataStore

- (PBUIWallpaperUserDefaultsDataStore)initWithUserdefaultsDomain:(id)a3
{
  id v5;
  PBUIWallpaperUserDefaultsDataStore *v6;
  PBUIWallpaperUserDefaultsDataStore *v7;
  PBUIWallpaperDefaults *v8;
  PBUIWallpaperDefaults *wallpaperDefaults;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PBUIWallpaperUserDefaultsDataStore;
  v6 = -[PBUIWallpaperUserDefaultsDataStore init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_defaultsDomain, a3);
    v8 = -[PBUIWallpaperDefaults initWithdefaultsDomain:]([PBUIWallpaperDefaults alloc], "initWithdefaultsDomain:", v5);
    wallpaperDefaults = v7->_wallpaperDefaults;
    v7->_wallpaperDefaults = v8;

  }
  return v7;
}

- (PBUIWallpaperUserDefaultsDataStore)init
{
  PBUIWallpaperDefaultsDomain *v3;
  PBUIWallpaperUserDefaultsDataStore *v4;

  v3 = objc_alloc_init(PBUIWallpaperDefaultsDomain);
  v4 = -[PBUIWallpaperUserDefaultsDataStore initWithUserdefaultsDomain:](self, "initWithUserdefaultsDomain:", v3);

  return v4;
}

- (id)wallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return 0;
}

- (BOOL)hasWallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return 0;
}

- (id)wallpaperThumbnailDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return 0;
}

- (id)wallpaperOriginalImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return 0;
}

- (BOOL)setWallpaperImage:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  return 0;
}

- (BOOL)setWallpaperOriginalImage:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  return 0;
}

- (BOOL)setWallpaperThumbnailData:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  return 0;
}

- (void)moveWallpaperImageDataTypes:(unint64_t)a3 fromVariant:(int64_t)a4 toVariant:(int64_t)a5
{
  void *v7;
  id v8;

  if ((a3 & 1) != 0)
  {
    -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageHashForVariant:wallpaperMode:", a4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v8, "setImageHash:forLocations:wallpaperMode:", 0, PBUIWallpaperLocationForVariant(a4), 0);
      objc_msgSend(v8, "setImageHash:forLocations:wallpaperMode:", v7, PBUIWallpaperLocationForVariant(a5), 0);
    }

  }
}

- (void)removeWallpaperImageDataTypes:(unint64_t)a3 forVariants:(int64_t)a4
{
  _QWORD v4[5];

  if ((a3 & 1) != 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __80__PBUIWallpaperUserDefaultsDataStore_removeWallpaperImageDataTypes_forVariants___block_invoke;
    v4[3] = &unk_1E6B94CB8;
    v4[4] = self;
    PBUIWallpaperEnumerateVariantsForLocations(a4, v4);
  }
}

void __80__PBUIWallpaperUserDefaultsDataStore_removeWallpaperImageDataTypes_forVariants___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (a2)
  {
    if (a2 != 1)
      return;
    objc_msgSend(*(id *)(a1 + 32), "wallpaperDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = &__block_literal_global_24;
    v5 = v2;
    v4 = 2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "wallpaperDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = &__block_literal_global_2_0;
    v5 = v2;
    v4 = 1;
  }
  objc_msgSend(v2, "updateDefaultsForLocations:updater:", v4, v3);

}

uint64_t __80__PBUIWallpaperUserDefaultsDataStore_removeWallpaperImageDataTypes_forVariants___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setImageHashData:", 0);
}

uint64_t __80__PBUIWallpaperUserDefaultsDataStore_removeWallpaperImageDataTypes_forVariants___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setImageHashData:", 0);
}

- (BOOL)supportsWallpaperImageHashDataStorage
{
  return 1;
}

- (BOOL)setWallpaperImageHashData:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImageHash:forLocations:wallpaperMode:", v8, a4, a5);

  return 1;
}

- (id)wallpaperImageHashDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v6;
  void *v7;

  if ((unint64_t)a3 > 1)
  {
    v7 = 0;
  }
  else
  {
    -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageHashForVariant:wallpaperMode:", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)removeWallpaperImageHashDataForVariants:(int64_t)a3
{
  id v4;

  -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateDefaultsForLocations:updater:", a3, &__block_literal_global_4_1);

}

uint64_t __78__PBUIWallpaperUserDefaultsDataStore_removeWallpaperImageHashDataForVariants___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setImageHashData:", 0);
}

- (id)unverifiedVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return 0;
}

- (id)verifiedVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return 0;
}

- (id)verifiedOriginalVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return 0;
}

- (BOOL)setVideoURL:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  return 0;
}

- (BOOL)setOriginalVideoURL:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  return 0;
}

- (id)proceduralWallpaperInfoForVariant:(int64_t)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == -1)
  {
    v7 = 0;
    v9 = 0;
    v10 = 0;
  }
  else
  {
    v6 = a3 == 1;
    objc_msgSend(v4, "proceduralIdentifierForVariant:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proceduralOptionsForVariant:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = 0;
    if (v7 && v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("kSBUIMagicWallpaperPresetOptionsKey"));
      objc_msgSend(v10, "setObject:forKey:", v7, CFSTR("kSBUIMagicWallpaperIdentifierKey"));
      BundlePathForWallpaperIdentifier(v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("kSBUIMagicWallpaperBundlePathKey"));
      }
      else
      {
        PBUILogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[PBUIWallpaperUserDefaultsDataStore proceduralWallpaperInfoForVariant:].cold.1((uint64_t)v7, v12, v13, v14, v15, v16, v17, v18);

      }
    }
  }

  return v10;
}

- (void)updateProceduralWallpaperDefaultsWithIdentifier:(id)a3 options:(id)a4 forVariant:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v8 = a4;
  -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!a5)
  {
    v11 = 1;
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    v11 = 2;
LABEL_5:
    objc_msgSend(v9, "setProceduralIdentifier:forLocations:", v12, v11);
    objc_msgSend(v10, "setProceduralOptions:forLocations:", v8, v11);
    objc_msgSend(v10, "setProceduralUserSet:forLocations:", v12 != 0, v11);
  }

}

- (BOOL)setProceduralWallpaperInfo:(id)a3 forVariants:(int64_t)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("kSBUIMagicWallpaperIdentifierKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("kSBUIMagicWallpaperPresetOptionsKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v4 & 1) != 0)
    -[PBUIWallpaperUserDefaultsDataStore updateProceduralWallpaperDefaultsWithIdentifier:options:forVariant:](self, "updateProceduralWallpaperDefaultsWithIdentifier:options:forVariant:", v7, v8, 0);
  if ((v4 & 2) != 0)
    -[PBUIWallpaperUserDefaultsDataStore updateProceduralWallpaperDefaultsWithIdentifier:options:forVariant:](self, "updateProceduralWallpaperDefaultsWithIdentifier:options:forVariant:", v7, v8, 1);

  return 1;
}

- (void)removeProceduralWallpaperForVariants:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__PBUIWallpaperUserDefaultsDataStore_removeProceduralWallpaperForVariants___block_invoke;
  v3[3] = &unk_1E6B94CB8;
  v3[4] = self;
  PBUIWallpaperEnumerateVariantsForLocations(a3, v3);
}

uint64_t __75__PBUIWallpaperUserDefaultsDataStore_removeProceduralWallpaperForVariants___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateProceduralWallpaperDefaultsWithIdentifier:options:forVariant:", 0, 0, a2);
}

- (id)wallpaperOptionsForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v6;
  void *v7;

  -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wallpaperOptionsForVariant:wallpaperMode:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)setWallpaperOptions:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWallpaperOptions:forLocations:wallpaperMode:", v8, a4, a5);

  return 1;
}

- (void)removeWallpaperOptionsForVariants:(int64_t)a3
{
  id v3;

  -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetDefaults");

}

- (id)wallpaperColorForVariant:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;

  -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 1)
  {
    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "wallpaperColorDataForVariant:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v7 = (void *)MEMORY[0x1E0CB3710];
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", v8, v6, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;

  if (!v9)
  {
    PBUILogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PBUIWallpaperUserDefaultsDataStore wallpaperColorForVariant:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

  }
LABEL_10:

  return v9;
}

- (id)wallpaperColorNameForVariant:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 1)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "wallpaperColorNameForVariant:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)setWallpaperColor:(id)a3 forVariants:(int64_t)a4
{
  char v4;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v4 = a4;
  v6 = a3;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (!v7)
  {
    PBUILogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PBUIWallpaperUserDefaultsDataStore setWallpaperColor:forVariants:].cold.1();

  }
  -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__PBUIWallpaperUserDefaultsDataStore_setWallpaperColor_forVariants___block_invoke;
  v14[3] = &unk_1E6B94C18;
  v15 = v10;
  v16 = v7;
  v11 = v7;
  v12 = v10;
  PBUIWallpaperEnumerateVariantsForLocations(v4, v14);

  return 1;
}

uint64_t __68__PBUIWallpaperUserDefaultsDataStore_setWallpaperColor_forVariants___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 != 1)
      return result;
    v2 = 2;
  }
  else
  {
    v2 = 1;
  }
  return objc_msgSend(*(id *)(result + 32), "setColorData:forLocations:", *(_QWORD *)(result + 40), v2);
}

- (BOOL)setWallpaperColorName:(id)a3 forVariants:(int64_t)a4
{
  char v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a4;
  v6 = a3;
  -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__PBUIWallpaperUserDefaultsDataStore_setWallpaperColorName_forVariants___block_invoke;
  v11[3] = &unk_1E6B94C18;
  v12 = v7;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  PBUIWallpaperEnumerateVariantsForLocations(v4, v11);

  return 1;
}

uint64_t __72__PBUIWallpaperUserDefaultsDataStore_setWallpaperColorName_forVariants___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 != 1)
      return result;
    v2 = 2;
  }
  else
  {
    v2 = 1;
  }
  return objc_msgSend(*(id *)(result + 32), "setColorName:forLocations:", *(_QWORD *)(result + 40), v2);
}

- (void)removeWallpaperColorForVariants:(int64_t)a3
{
  id v4;

  -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColorName:forLocations:", 0, a3);
  objc_msgSend(v4, "setColorData:forLocations:", 0, a3);

}

- (id)wallpaperGradientForVariant:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;

  -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 1)
  {
    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "wallpaperGradientDataForVariant:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v7 = (void *)MEMORY[0x1E0CB3710];
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", v8, v6, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;

  if (!v9)
  {
    PBUILogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PBUIWallpaperUserDefaultsDataStore wallpaperGradientForVariant:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

  }
LABEL_10:

  return v9;
}

- (BOOL)setWallpaperGradient:(id)a3 forVariants:(int64_t)a4
{
  char v4;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v4 = a4;
  v6 = a3;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (!v7)
  {
    PBUILogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PBUIWallpaperUserDefaultsDataStore setWallpaperGradient:forVariants:].cold.1();

  }
  -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__PBUIWallpaperUserDefaultsDataStore_setWallpaperGradient_forVariants___block_invoke;
  v14[3] = &unk_1E6B94C18;
  v15 = v10;
  v16 = v7;
  v11 = v7;
  v12 = v10;
  PBUIWallpaperEnumerateVariantsForLocations(v4, v14);

  return 1;
}

uint64_t __71__PBUIWallpaperUserDefaultsDataStore_setWallpaperGradient_forVariants___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 != 1)
      return result;
    v2 = 2;
  }
  else
  {
    v2 = 1;
  }
  return objc_msgSend(*(id *)(result + 32), "setGradientData:forLocations:", *(_QWORD *)(result + 40), v2);
}

- (void)removeWallpaperGradientForVariants:(int64_t)a3
{
  char v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  -[PBUIWallpaperUserDefaultsDataStore wallpaperDefaults](self, "wallpaperDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__PBUIWallpaperUserDefaultsDataStore_removeWallpaperGradientForVariants___block_invoke;
  v6[3] = &unk_1E6B94CB8;
  v7 = v4;
  v5 = v4;
  PBUIWallpaperEnumerateVariantsForLocations(v3, v6);

}

uint64_t __73__PBUIWallpaperUserDefaultsDataStore_removeWallpaperGradientForVariants___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 != 1)
      return result;
    v2 = 2;
  }
  else
  {
    v2 = 1;
  }
  return objc_msgSend(*(id *)(result + 32), "setGradientData:forLocations:", 0, v2);
}

- (NSString)description
{
  return (NSString *)-[PBUIWallpaperUserDefaultsDataStore descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperUserDefaultsDataStore descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperUserDefaultsDataStore defaultsDomain](self, "defaultsDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("userDefaults"));

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIWallpaperUserDefaultsDataStore succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (PBUIWallpaperDefaultsDomain)defaultsDomain
{
  return self->_defaultsDomain;
}

- (PBUIWallpaperDefaults)wallpaperDefaults
{
  return self->_wallpaperDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperDefaults, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
}

- (void)proceduralWallpaperInfoForVariant:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B71C0000, a2, a3, "No bundle path for wallpaper identifier: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)wallpaperColorForVariant:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B71C0000, a2, a3, "Error unarchiving color from user defaults: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)setWallpaperColor:forVariants:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B71C0000, v0, v1, "Error archiving wallpaper color '%@': %{public}@");
  OUTLINED_FUNCTION_9();
}

- (void)wallpaperGradientForVariant:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B71C0000, a2, a3, "Error unarchiving gradient from user defaults: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)setWallpaperGradient:forVariants:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B71C0000, v0, v1, "Error archiving wallpaper gradient '%@': %{public}@");
  OUTLINED_FUNCTION_9();
}

@end

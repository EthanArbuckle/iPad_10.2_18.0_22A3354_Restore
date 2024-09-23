@implementation PBUIWallpaperConfigurationManager

+ (void)initialize
{
  id v3;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1 && PBUIRegisterForWallpaperExternalChangeNotification___once != -1)
    dispatch_once(&PBUIRegisterForWallpaperExternalChangeNotification___once, &__block_literal_global_3);
}

- (PBUIWallpaperConfigurationManager)initWithWallpaperDataStores:(id)a3 wallpaperSize:(CGSize)a4 scale:(double)a5 sizeType:(int64_t)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  PBUIWallpaperConfigurationManager *v12;
  NSObject *v13;
  uint64_t v14;
  NSArray *dataStores;
  NSMutableDictionary *v16;
  NSMutableDictionary *wallpaperImageCache;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  _QWORD v22[4];
  id v23;
  objc_super v24;
  _BYTE location[12];
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  double v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;
  CGSize v33;

  height = a4.height;
  width = a4.width;
  v32 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PBUIWallpaperConfigurationManager;
  v12 = -[PBUIWallpaperConfigurationManager init](&v24, sel_init);
  if (v12)
  {
    PBUILogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v33.width = width;
      v33.height = height;
      NSStringFromCGSize(v33);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if ((unint64_t)a6 > 4)
        v21 = &stru_1E6B97EB0;
      else
        v21 = (const __CFString *)*((_QWORD *)&off_1E6B94DC0 + a6);
      *(_DWORD *)location = 138413058;
      *(_QWORD *)&location[4] = v11;
      v26 = 2112;
      v27 = v19;
      v28 = 2048;
      v29 = a5;
      v30 = 2112;
      v31 = v21;
      _os_log_debug_impl(&dword_1B71C0000, v13, OS_LOG_TYPE_DEBUG, "Initialize PBUIWallpaperConfigurationManager with data stores: %@, wallpaper size: %@, scale: %f, size type: %@", location, 0x2Au);

    }
    v14 = objc_msgSend(v11, "copy");
    dataStores = v12->_dataStores;
    v12->_dataStores = (NSArray *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    wallpaperImageCache = v12->_wallpaperImageCache;
    v12->_wallpaperImageCache = v16;

    v12->_wallpaperSize.width = width;
    v12->_wallpaperSize.height = height;
    v12->_wallpaperScale = a5;
    v12->_wallpaperMode = 0;
    v12->_wallpaperSizeType = a6;
    v12->_enableWallpaperDimming = 0;
    objc_initWeak((id *)location, v12);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __94__PBUIWallpaperConfigurationManager_initWithWallpaperDataStores_wallpaperSize_scale_sizeType___block_invoke;
    v22[3] = &unk_1E6B94C68;
    objc_copyWeak(&v23, (id *)location);
    v12->_externalNotificationToken = PBUIRegisterForExternalWallpaperChangeNotificationWithHandler(v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
  }

  return v12;
}

void __94__PBUIWallpaperConfigurationManager_initWithWallpaperDataStores_wallpaperSize_scale_sizeType___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((a3 & 1) == 0)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "clearCacheForVariants:memoryOnly:", 3, 1);
    WeakRetained = v5;
  }

}

- (PBUIWallpaperConfigurationManager)initWithWallpaperDataStores:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  PBUIWallpaperConfigurationManager *v13;

  v4 = (void *)MEMORY[0x1E0CEA950];
  v5 = a3;
  objc_msgSend(v4, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PBUICurrentDeviceWallpaperSizeType();
  objc_msgSend(v6, "_referenceBounds");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v6, "scale");
  v13 = -[PBUIWallpaperConfigurationManager initWithWallpaperDataStores:wallpaperSize:scale:sizeType:](self, "initWithWallpaperDataStores:wallpaperSize:scale:sizeType:", v5, v7, v9, v11, v12);

  return v13;
}

- (PBUIWallpaperConfigurationManager)init
{
  void *v3;
  int v4;
  PBUIWallpaperSharedDirectoryDataStore *v5;
  void *v6;
  PBUIWallpaperUserDefaultsDataStore *v7;
  PBUIWallpaperConfigurationManager *v8;
  _QWORD v10[2];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userMode") == 1)
  {

  }
  else
  {
    v4 = objc_msgSend(v3, "isEphemeralMultiUser");

    if (!v4)
    {
      v5 = objc_alloc_init(PBUIWallpaperDirectoryDataStore);
      v7 = objc_alloc_init(PBUIWallpaperUserDefaultsDataStore);
      v10[0] = v5;
      v10[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
  v5 = objc_alloc_init(PBUIWallpaperSharedDirectoryDataStore);
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  v8 = -[PBUIWallpaperConfigurationManager initWithWallpaperDataStores:](self, "initWithWallpaperDataStores:", v6);
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_externalNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperConfigurationManager;
  -[PBUIWallpaperConfigurationManager dealloc](&v3, sel_dealloc);
}

- (int64_t)parallaxDeviceType
{
  return (unint64_t)(-[PBUIWallpaperConfigurationManager wallpaperSizeType](self, "wallpaperSizeType") - 3) < 2;
}

- (CGSize)wallpaperSizeIncludingParallaxOverhang
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[PBUIWallpaperConfigurationManager wallpaperSize](self, "wallpaperSize");
  +[PBUIWallpaperParallaxSettings minimumWallpaperSizeForWallpaperSize:deviceType:](PBUIWallpaperParallaxSettings, "minimumWallpaperSizeForWallpaperSize:deviceType:", PBUICurrentParallaxDeviceType(), v2, v3);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)beginChangeBatch
{
  ++self->_batchChangeCount;
}

- (void)endChangeBatch
{
  unint64_t v2;

  v2 = self->_batchChangeCount - 1;
  self->_batchChangeCount = v2;
  if (!v2)
  {
    if (self->_batchNotifyVariants)
    {
      -[PBUIWallpaperConfigurationManager notifyDelegateOfChangesToVariants:](self, "notifyDelegateOfChangesToVariants:");
      self->_batchNotifyVariants = 0;
    }
  }
}

- (BOOL)isInChangeBatch
{
  return self->_batchChangeCount != 0;
}

- (void)delayNotifyingChangeForVariants:(int64_t)a3
{
  void *v6;

  if (!-[PBUIWallpaperConfigurationManager isInChangeBatch](self, "isInChangeBatch"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperConfigurationManager.m"), 242, CFSTR("Should only call this when in a change batch"));

  }
  self->_batchNotifyVariants |= a3;
}

- (void)clearDelayedChangeNotifications
{
  self->_batchNotifyVariants = 0;
}

- (BOOL)isVideoSupportedForVariant:(int64_t)a3
{
  void *v5;
  char v6;
  BOOL v7;

  -[PBUIWallpaperConfigurationManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "wallpaperConfigurationManager:isVideoSupportedForVariant:", self, a3);
  else
    v6 = -[PBUIWallpaperConfigurationManager isVideoSupportedByDefaultForVariant:](self, "isVideoSupportedByDefaultForVariant:", a3);
  v7 = v6;

  return v7;
}

- (BOOL)isVideoSupportedByDefaultForVariant:(int64_t)a3
{
  return a3 == 0;
}

- (id)wallpaperConfigurationForVariant:(int64_t)a3 includingValuesForTypes:(unint64_t)a4
{
  return -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:](self, "wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:", a3, a4, 0);
}

- (id)wallpaperConfigurationForVariant:(int64_t)a3 includingValuesForTypes:(unint64_t)a4 wallpaperMode:(int64_t)a5
{
  NSObject *v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  id v14;
  void *v15;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  int64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL4 v33;
  uint64_t v34;
  void *v35;
  int64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  PBUIWallpaperConfiguration *v48;
  NSMutableDictionary *wallpaperImageCache;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  PBUIWallpaperConfiguration *v62;
  PBUIWallpaperConfiguration *v64;
  __int128 v65;
  BOOL v66;
  int64_t v67;
  int v68;
  int64_t v69;
  id obj;
  void *v71;
  _BOOL4 v73;
  uint64_t v74;
  void *v75;
  unint64_t v76;
  PBUIWallpaperConfigurationManager *v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:].cold.3(a3, a4, (uint64_t)v8);

  v73 = -[PBUIWallpaperConfigurationManager isVideoSupportedForVariant:](self, "isVideoSupportedForVariant:", a3);
  if (a3 == 1)
    v9 = 0;
  else
    v9 = -1;
  v10 = a3 == 1
     && -[PBUIWallpaperConfigurationManager isVideoSupportedForVariant:](self, "isVideoSupportedForVariant:", 1);
  v76 = a5;
  v77 = self;
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
  if (!v11)
  {
    LOBYTE(v68) = 0;
    LOBYTE(v9) = 0;
    v42 = 0;
    v14 = 0;
    v23 = 0;
    v75 = 0;
    v15 = 0;
    v71 = 0;
    v43 = 0;
    v69 = -1;
    goto LABEL_74;
  }
  v13 = v11;
  v67 = v9;
  v68 = 0;
  LOBYTE(v9) = 0;
  v14 = 0;
  v15 = 0;
  v71 = 0;
  v74 = *(_QWORD *)v80;
  v75 = 0;
  v17 = a3 != 1 || !v10;
  v66 = v17;
  v69 = -1;
  *(_QWORD *)&v12 = 138543618;
  v65 = v12;
  do
  {
    v18 = 0;
    do
    {
      v19 = v14;
      if (*(_QWORD *)v80 != v74)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v18);
      objc_msgSend(v20, "proceduralWallpaperInfoForVariant:", a3, v65);
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        if (-[PBUIWallpaperConfigurationManager isProceduralWallpaperInfoValid:](v77, "isProceduralWallpaperInfoValid:", v21))
        {
          -[PBUIWallpaperConfigurationManager cleanedProceduralWallpaperInfo:](v77, "cleanedProceduralWallpaperInfo:", v22);
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = PBUIWallpaperLocationForVariant(a3);
          v46 = v20;
          v43 = (void *)v44;
          objc_msgSend(v46, "setProceduralWallpaperInfo:forVariants:", v44, v45);

          v42 = 0;
          v23 = 0;
          goto LABEL_74;
        }

      }
      v78 = v14;
      -[PBUIWallpaperConfigurationManager wallpaperColorForVariant:fromDataStore:colorName:](v77, "wallpaperColorForVariant:fromDataStore:colorName:", a3, v20, &v78);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v78;

      if (v23)
      {
        v42 = 0;
LABEL_72:
        v43 = 0;
        goto LABEL_74;
      }
      objc_msgSend(v20, "wallpaperGradientForVariant:", a3);
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v42 = (void *)v24;
        v23 = 0;
        goto LABEL_72;
      }
      if ((v9 & 1) != 0)
      {
        LOBYTE(v9) = 1;
        v25 = v76;
        goto LABEL_46;
      }
      v25 = v76;
      if ((a4 & 1) != 0)
      {
        objc_msgSend(v20, "wallpaperImageForVariant:wallpaperMode:", a3, v76);
        v26 = objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          LOBYTE(v9) = 1;
          v69 = a3;
          v71 = (void *)v26;
          goto LABEL_46;
        }
        PBUILogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
        {
          PBUIStringForWallpaperVariant(a3);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          PBUIStringForWallpaperMode(v76);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v65;
          v84 = v29;
          v85 = 2114;
          v86 = v30;
          _os_log_impl(&dword_1B71C0000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Cannot find image for variant: %{public}@ with wallpaper mode: %{public}@. Defaulting to PBUIWallpaperModeNone image.", buf, 0x16u);

        }
        objc_msgSend(v20, "wallpaperImageForVariant:wallpaperMode:", a3, 0);
        v31 = objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = v31 != 0;
        v68 |= v9;
        if (a3 == 1 && !v31)
        {
          objc_msgSend(v20, "wallpaperImageForVariant:wallpaperMode:", v67, v76);
          v32 = objc_claimAutoreleasedReturnValue();
          if (!v32)
          {
            objc_msgSend(v20, "wallpaperImageForVariant:wallpaperMode:", v67, 0);
            v32 = objc_claimAutoreleasedReturnValue();
            v68 |= v32 != 0;
          }
          v71 = (void *)v32;
          v28 = v67;
          LOBYTE(v9) = v32 != 0;
          goto LABEL_43;
        }
        v71 = (void *)v31;
        goto LABEL_45;
      }
      if ((objc_msgSend(v20, "hasWallpaperImageForVariant:wallpaperMode:", a3, v76) & 1) != 0)
      {
        LOBYTE(v9) = 1;
LABEL_45:
        v69 = a3;
        goto LABEL_46;
      }
      v27 = objc_msgSend(v20, "hasWallpaperImageForVariant:wallpaperMode:", a3, 0);
      LOBYTE(v9) = v27;
      v68 |= v27;
      if (a3 != 1 || (v27 & 1) != 0)
        goto LABEL_45;
      if ((objc_msgSend(v20, "hasWallpaperImageForVariant:wallpaperMode:", v67, v76) & 1) != 0)
      {
        v28 = v67;
        LOBYTE(v9) = 1;
LABEL_43:
        v69 = v28;
        goto LABEL_46;
      }
      LODWORD(v9) = objc_msgSend(v20, "hasWallpaperImageForVariant:wallpaperMode:", v67, 0);
      v68 |= v9;
      v69 = v67;
LABEL_46:
      if (v15)
        v33 = 0;
      else
        v33 = v73;
      if (v33)
      {
        objc_msgSend(v20, "verifiedVideoURLForVariant:wallpaperMode:", a3, v25);
        v34 = objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v15 = (void *)v34;
          v35 = v20;
          v36 = a3;
          goto LABEL_52;
        }
        if (!v66)
        {
          objc_msgSend(v20, "verifiedVideoURLForVariant:wallpaperMode:", v67, v25);
          v38 = objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            v15 = (void *)v38;
            v35 = v20;
            v36 = v67;
LABEL_52:
            v37 = v25;
LABEL_59:
            objc_msgSend(v35, "verifiedOriginalVideoURLForVariant:wallpaperMode:", v36, v37);
            v40 = objc_claimAutoreleasedReturnValue();

            v75 = (void *)v40;
            goto LABEL_60;
          }
        }
        objc_msgSend(v20, "verifiedVideoURLForVariant:wallpaperMode:", a3, 0);
        v39 = objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          v15 = (void *)v39;
          v35 = v20;
          v36 = a3;
LABEL_58:
          v37 = 0;
          goto LABEL_59;
        }
        if (v66)
        {
          v15 = 0;
        }
        else
        {
          objc_msgSend(v20, "verifiedVideoURLForVariant:wallpaperMode:", v67, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v35 = v20;
            v36 = v67;
            goto LABEL_58;
          }
        }
      }
LABEL_60:
      ++v18;
    }
    while (v13 != v18);
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
    v13 = v41;
    v42 = 0;
    v23 = 0;
    v43 = 0;
  }
  while (v41);
LABEL_74:

  PBUILogCommon();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v84 = v43;
    v85 = 2112;
    v86 = v15;
    v87 = 2112;
    v88 = v71;
    _os_log_debug_impl(&dword_1B71C0000, v47, OS_LOG_TYPE_DEBUG, "Procedural: %@, Video: %@, Static: %@", buf, 0x20u);
  }

  if (v43)
  {
    v48 = -[PBUIWallpaperConfiguration initWithVariant:type:]([PBUIWallpaperConfiguration alloc], "initWithVariant:type:", a3, 2);
    -[PBUIWallpaperConfiguration setProceduralWallpaperInfo:](v48, "setProceduralWallpaperInfo:", v43);
    goto LABEL_82;
  }
  if (v23)
  {
    v48 = -[PBUIWallpaperConfiguration initWithVariant:type:]([PBUIWallpaperConfiguration alloc], "initWithVariant:type:", a3, 4);
    -[PBUIWallpaperConfiguration setWallpaperColor:](v48, "setWallpaperColor:", v23);
    -[PBUIWallpaperConfiguration setWallpaperColorName:](v48, "setWallpaperColorName:", v14);
    goto LABEL_82;
  }
  if (v42)
  {
    v48 = -[PBUIWallpaperConfiguration initWithVariant:type:]([PBUIWallpaperConfiguration alloc], "initWithVariant:type:", a3, 5);
    -[PBUIWallpaperConfiguration setWallpaperGradient:](v48, "setWallpaperGradient:", v42);
    goto LABEL_82;
  }
  if (((v15 != 0) & v9) == 1)
  {
    v48 = -[PBUIWallpaperConfiguration initWithVariant:type:]([PBUIWallpaperConfiguration alloc], "initWithVariant:type:", a3, 3);
    -[PBUIWallpaperConfiguration setVideoURL:](v48, "setVideoURL:", v15);
    -[PBUIWallpaperConfiguration setOriginalVideoURL:](v48, "setOriginalVideoURL:", v75);
    v64 = v48;
    goto LABEL_113;
  }
  if ((v9 & 1) == 0)
  {
    v48 = 0;
LABEL_82:
    if (!v71)
      goto LABEL_85;
LABEL_83:
    if (v69 != -1)
    {
      wallpaperImageCache = v77->_wallpaperImageCache;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v69);
      v50 = v43;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](wallpaperImageCache, "setObject:forKey:", v71, v51);

      v43 = v50;
    }
    goto LABEL_85;
  }
  v64 = -[PBUIWallpaperConfiguration initWithVariant:type:]([PBUIWallpaperConfiguration alloc], "initWithVariant:type:", a3, 1);
  v48 = v64;
LABEL_113:
  -[PBUIWallpaperConfiguration setWallpaperImage:](v64, "setWallpaperImage:", v71);
  if (v71)
    goto LABEL_83;
LABEL_85:
  if (v48)
    goto LABEL_90;
  PBUILogCommon();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:].cold.2();

  -[PBUIWallpaperConfigurationManager fallbackWallpaperConfigurationForVarient:](v77, "fallbackWallpaperConfigurationForVarient:", a3);
  v48 = (PBUIWallpaperConfiguration *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
LABEL_90:
    if ((a4 & 0x10) != 0 && !v43)
    {
      if ((v68 & 1) != 0)
      {
        -[PBUIWallpaperConfigurationManager wallpaperOptionsForVariant:wallpaperMode:](v77, "wallpaperOptionsForVariant:wallpaperMode:", a3, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v53;
        if (v77->_enableWallpaperDimming)
        {
          objc_msgSend(v53, "setWallpaperMode:", v76);
          -[PBUIWallpaperConfiguration setNeedsWallpaperDimmingTreatment:](v48, "setNeedsWallpaperDimmingTreatment:", 1);
        }
      }
      else
      {
        -[PBUIWallpaperConfigurationManager wallpaperOptionsForVariant:wallpaperMode:](v77, "wallpaperOptionsForVariant:wallpaperMode:", a3, v76);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v76 == 3)
        -[PBUIWallpaperConfiguration setNeedsInactiveAppearanceTreatment:](v48, "setNeedsInactiveAppearanceTreatment:", 1);
      -[PBUIWallpaperConfiguration setWallpaperOptions:](v48, "setWallpaperOptions:", v54);

    }
    if ((a4 & 2) != 0 && !v43)
    {
      -[PBUIWallpaperConfiguration wallpaperOptions](v48, "wallpaperOptions");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperConfigurationManager wallpaperOriginalImageForVariant:wallpaperMode:](v77, "wallpaperOriginalImageForVariant:wallpaperMode:", a3, objc_msgSend(v55, "wallpaperMode"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      -[PBUIWallpaperConfiguration setWallpaperOriginalImage:](v48, "setWallpaperOriginalImage:", v56);
      v43 = 0;
    }
    if ((a4 & 4) != 0)
    {
      -[PBUIWallpaperConfigurationManager wallpaperThumbnailImageForFulfillingLookupForConfiguration:](v77, "wallpaperThumbnailImageForFulfillingLookupForConfiguration:", v48);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperConfiguration setWallpaperThumbnailImage:](v48, "setWallpaperThumbnailImage:", v57);

    }
    if ((a4 & 8) != 0)
    {
      -[PBUIWallpaperConfigurationManager wallpaperThumbnailImageDataForFulfillingLookupForConfiguration:](v77, "wallpaperThumbnailImageDataForFulfillingLookupForConfiguration:", v48);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperConfiguration setWallpaperThumbnailImageData:](v48, "setWallpaperThumbnailImageData:", v58);

    }
    -[PBUIWallpaperConfiguration wallpaperOptions](v48, "wallpaperOptions");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperConfigurationManager wallpaperImageHashDataForVariant:wallpaperMode:](v77, "wallpaperImageHashDataForVariant:wallpaperMode:", a3, objc_msgSend(v59, "wallpaperMode"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    -[PBUIWallpaperConfiguration setWallpaperImageHashData:](v48, "setWallpaperImageHashData:", v60);
  }
  PBUILogCommon();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:].cold.1((uint64_t)v48, a3, v61);

  v62 = v48;
  return v62;
}

- (id)lockScreenWallpaperConfigurationIncludingValuesForTypes:(unint64_t)a3
{
  return -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:](self, "wallpaperConfigurationForVariant:includingValuesForTypes:", 0, a3);
}

- (id)homeScreenWallpaperConfigurationIncludingValuesForTypes:(unint64_t)a3
{
  return -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:](self, "wallpaperConfigurationForVariant:includingValuesForTypes:", 1, a3);
}

- (id)wallpaperConfigurationForVariant:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
    v7 = 4;
  else
    v7 = 0;
  -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:](self, "wallpaperConfigurationForVariant:includingValuesForTypes:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PBUIWallpaperConfiguration)lockScreenWallpaperConfiguration
{
  return (PBUIWallpaperConfiguration *)-[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:](self, "wallpaperConfigurationForVariant:", 0);
}

- (PBUIWallpaperConfiguration)homeScreenWallpaperConfiguration
{
  return (PBUIWallpaperConfiguration *)-[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:](self, "wallpaperConfigurationForVariant:", 1);
}

- (id)fallbackWallpaperConfigurationForVarient:(int64_t)a3
{
  PBUIWallpaperConfiguration *v3;
  void *v4;

  v3 = -[PBUIWallpaperConfiguration initWithVariant:type:]([PBUIWallpaperConfiguration alloc], "initWithVariant:type:", a3, 4);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperConfiguration setWallpaperColor:](v3, "setWallpaperColor:", v4);

  return v3;
}

- (char)_providerForVariant:(int64_t)a3 lockConfig:(id)a4 homeConfig:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v33;
  void *v34;
  int v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  v11 = a3;
  if (a3 == 1)
  {
    v12 = objc_msgSend(v9, "wallpaperType");
    v13 = v12;
    if ((v12 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      v14 = 2;
      if (-[PBUIWallpaperConfigurationManager hasWallpaperImageForVariant:wallpaperMode:](self, "hasWallpaperImageForVariant:wallpaperMode:", 1, 2))
      {
        goto LABEL_24;
      }
      objc_msgSend(v10, "wallpaperOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");

      if (v17)
      {
        v18 = 2;
LABEL_23:

        v14 = v18;
LABEL_24:
        PBUILogCommon();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          PBUIStringForWallpaperVariant(1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          PBUIStringForPosterWallpaperMigrationProvider(v14);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 138543874;
          v36 = v26;
          v37 = 2114;
          v38 = v27;
          v39 = 2114;
          v40 = v10;
          v28 = "provider for variant %{public}@ is %{public}@ by looking at homescreen variant : %{public}@";
LABEL_34:
          _os_log_impl(&dword_1B71C0000, v21, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v35, 0x20u);

          goto LABEL_35;
        }
        goto LABEL_35;
      }
      v18 = 1;
      if (-[PBUIWallpaperConfigurationManager hasWallpaperImageForVariant:wallpaperMode:](self, "hasWallpaperImageForVariant:wallpaperMode:", 1, 0))
      {
        goto LABEL_23;
      }
      v11 = 0;
      if (v13 != objc_msgSend(v8, "wallpaperType"))
      {
        objc_msgSend(v10, "wallpaperImageHashData");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "wallpaperImageHashData");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          v11 = 1;
      }

    }
    else
    {
      if (v12 == 2)
      {
        v14 = 2;
        goto LABEL_24;
      }
      v11 = 1;
    }
    PBUILogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      PBUIStringForWallpaperVariant(1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543618;
      v36 = v20;
      v37 = 2114;
      v38 = v10;
      _os_log_impl(&dword_1B71C0000, v19, OS_LOG_TYPE_DEFAULT, "cannot determine provider for variant %{public}@ by looking at homescreen variant : %{public}@", (uint8_t *)&v35, 0x16u);

    }
  }
  if (v11)
  {
LABEL_13:
    PBUILogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[PBUIWallpaperConfigurationManager _providerForVariant:lockConfig:homeConfig:].cold.1(a3);
    LOBYTE(v14) = 0;
    goto LABEL_35;
  }
  v22 = objc_msgSend(v8, "wallpaperType");
  if ((v22 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    if (v22 == 2)
    {
      v14 = 2;
      goto LABEL_32;
    }
    goto LABEL_37;
  }
  v14 = 2;
  if (-[PBUIWallpaperConfigurationManager hasWallpaperImageForVariant:wallpaperMode:](self, "hasWallpaperImageForVariant:wallpaperMode:", 0, 2))
  {
    goto LABEL_32;
  }
  objc_msgSend(v8, "wallpaperOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "length");

  if (!v25)
  {
    if (-[PBUIWallpaperConfigurationManager hasWallpaperImageForVariant:wallpaperMode:](self, "hasWallpaperImageForVariant:wallpaperMode:", 0, 0))
    {
      v14 = 1;
      goto LABEL_31;
    }

LABEL_37:
    PBUILogCommon();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      PBUIStringForWallpaperVariant(a3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543618;
      v36 = v34;
      v37 = 2114;
      v38 = v8;
      _os_log_impl(&dword_1B71C0000, v33, OS_LOG_TYPE_DEFAULT, "cannot determine provider for variant %{public}@ by looking at homescreen variant : %{public}@", (uint8_t *)&v35, 0x16u);

    }
    goto LABEL_13;
  }
  v14 = 2;
LABEL_31:

LABEL_32:
  PBUILogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperVariant(a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForPosterWallpaperMigrationProvider(v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 138543874;
    v36 = v26;
    v37 = 2114;
    v38 = v27;
    v39 = 2114;
    v40 = v8;
    v28 = "provider for variant %{public}@ is %{public}@ by looking at lockscreen variant : %{public}@";
    goto LABEL_34;
  }
LABEL_35:

  return v14;
}

- (id)posterMigrationInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v23;

  -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:](self, "wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:", 0, 16, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:](self, "wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:", 1, 16, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PBUIWallpaperConfigurationManager _providerForVariant:lockConfig:homeConfig:](self, "_providerForVariant:lockConfig:homeConfig:", 0, v3, v4);
  v6 = -[PBUIWallpaperConfigurationManager _providerForVariant:lockConfig:homeConfig:](self, "_providerForVariant:lockConfig:homeConfig:", 1, v3, v4);
  v7 = v6;
  v8 = 0;
  if ((_DWORD)v5 && (_DWORD)v6)
  {
    if ((_DWORD)v5 != (_DWORD)v6)
    {
      v8 = 2 * ((_DWORD)v6 == 1);
      goto LABEL_25;
    }
    if ((_DWORD)v5 == 2)
    {
      v9 = objc_msgSend(v3, "wallpaperType");
      if (v9 != objc_msgSend(v4, "wallpaperType"))
      {
LABEL_20:
        v8 = 0;
        goto LABEL_25;
      }
      if (v9 == 2)
      {
        objc_msgSend(v3, "proceduralWallpaperIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "proceduralWallpaperIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((BSEqualStrings() & 1) != 0)
        {
          objc_msgSend(v3, "proceduralWallpaperInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "proceduralWallpaperInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (BSEqualDictionaries())
          {
            objc_msgSend(v3, "proceduralWallpaperOptions");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "proceduralWallpaperOptions");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = BSEqualDictionaries();

          }
          else
          {
            v8 = 0;
          }

          goto LABEL_25;
        }

        goto LABEL_20;
      }
      objc_msgSend(v3, "wallpaperOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "wallpaperOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = BSEqualObjects();

      if (v17)
      {
        objc_msgSend(v15, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "length");

        v8 = 1;
        if (!v19)
        {
          if (-[PBUIWallpaperConfigurationManager hasWallpaperImageForVariant:wallpaperMode:](self, "hasWallpaperImageForVariant:wallpaperMode:", 1, 0))
          {
            v8 = 2;
          }
          else
          {
            v8 = 1;
          }
        }
      }
      else
      {
        v8 = 2;
      }

    }
    else if (-[PBUIWallpaperConfigurationManager variantsShareWallpaperConfigurationForTypes:](self, "variantsShareWallpaperConfigurationForTypes:", 54))
    {
      v8 = 1;
    }
    else
    {
      v8 = 2;
    }
  }
LABEL_25:
  v20 = -[PBUIPosterWallpaperMigrationInfo _initWithPairingType:lockProvider:homeProvider:]([PBUIPosterWallpaperMigrationInfo alloc], "_initWithPairingType:lockProvider:homeProvider:", v8, v5, v7);
  PBUILogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    -[PBUIWallpaperConfigurationManager posterMigrationInfo].cold.1();

  return v20;
}

- (BOOL)hasWallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "hasWallpaperImageForVariant:wallpaperMode:", a3, a4) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)wallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  NSMutableDictionary *wallpaperImageCache;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  wallpaperImageCache = self->_wallpaperImageCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](wallpaperImageCache, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "wallpaperImageForVariant:wallpaperMode:", a3, a4);
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v9 = (void *)v15;

            v16 = self->_wallpaperImageCache;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v9, v10);
            goto LABEL_12;
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_12:

  }
  return v9;
}

- (id)wallpaperOriginalImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = -[PBUIWallpaperConfigurationManager variantsShareWallpaperConfigurationForTypes:](self, "variantsShareWallpaperConfigurationForTypes:", 54);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    v12 = a3 == 1 && v7;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "wallpaperOriginalImageForVariant:wallpaperMode:", a3, a4);
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          if (!v12)
            continue;
          if ((objc_msgSend(v14, "hasWallpaperImageForVariant:wallpaperMode:", 1, a4) & 1) != 0)
            continue;
          objc_msgSend(v14, "wallpaperOriginalImageForVariant:wallpaperMode:", 0, a4);
          v15 = objc_claimAutoreleasedReturnValue();
          if (!v15)
            continue;
        }
        v16 = (void *)v15;
        goto LABEL_16;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_16:

  return v16;
}

- (id)wallpaperThumbnailImageDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
      -[PBUIWallpaperConfigurationManager wallpaperThumbnailImageDataForVariant:wallpaperMode:inDataStore:](self, "wallpaperThumbnailImageDataForVariant:wallpaperMode:inDataStore:", a3, a4, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (a3 == 1 && !v13)
      {
        -[PBUIWallpaperConfigurationManager wallpaperThumbnailImageDataForVariant:wallpaperMode:inDataStore:](self, "wallpaperThumbnailImageDataForVariant:wallpaperMode:inDataStore:", 0, a4, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v14)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v14 = 0;
  }

  return v14;
}

- (id)wallpaperThumbnailImageDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4 inDataStore:(id)a5
{
  id v7;
  void *v8;

  v7 = a5;
  objc_msgSend(v7, "wallpaperThumbnailDataForVariant:wallpaperMode:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "wallpaperThumbnailDataForVariant:wallpaperMode:", a3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)wallpaperThumbnailImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v4;
  void *v5;

  -[PBUIWallpaperConfigurationManager wallpaperThumbnailImageDataForVariant:wallpaperMode:](self, "wallpaperThumbnailImageDataForVariant:wallpaperMode:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "_initWithData:preserveScale:", v4, 1);
  else
    v5 = 0;

  return v5;
}

- (id)wallpaperThumbnailImageForFulfillingLookupForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v4 = a3;
  switch(objc_msgSend(v4, "wallpaperType"))
  {
    case 1:
    case 3:
      -[PBUIWallpaperConfigurationManager wallpaperThumbnailImageForVariant:wallpaperMode:](self, "wallpaperThumbnailImageForVariant:wallpaperMode:", objc_msgSend(v4, "variant"), -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(v4, "proceduralWallpaperInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PBUIMagicWallpaperThumbnail(v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
      -[PBUIWallpaperConfigurationManager wallpaperScale](self, "wallpaperScale");
      v9 = v8;
      -[PBUIWallpaperConfigurationManager wallpaperSize](self, "wallpaperSize");
      v11 = v9 * v10;
      v13 = v9 * v12;
      -[PBUIWallpaperConfigurationManager thumbnailWidth](self, "thumbnailWidth");
      v15 = round(v14);
      v16 = round(v13 * (v14 / v11));
      objc_msgSend(v4, "wallpaperColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PBUIWallpaperImageWithFlatColor(v6, v15, v16, 1.0);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 5:
      -[PBUIWallpaperConfigurationManager wallpaperScale](self, "wallpaperScale");
      v18 = v17;
      -[PBUIWallpaperConfigurationManager wallpaperSize](self, "wallpaperSize");
      v20 = v18 * v19;
      v22 = v18 * v21;
      -[PBUIWallpaperConfigurationManager thumbnailWidth](self, "thumbnailWidth");
      v24 = round(v23);
      v25 = round(v22 * (v23 / v20));
      objc_msgSend(v4, "wallpaperGradient");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PBUIWallpaperImageWithGradient(v6, v24, v25, 1.0);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v5 = (void *)v7;

      break;
    default:
      v5 = 0;
      break;
  }

  return v5;
}

- (id)wallpaperThumbnailImageDataForFulfillingLookupForConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  UIImage *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "wallpaperType");
  v6 = 0;
  if (v5 <= 5)
  {
    if (((1 << v5) & 0x34) != 0)
    {
      -[PBUIWallpaperConfigurationManager wallpaperThumbnailImageForFulfillingLookupForConfiguration:](self, "wallpaperThumbnailImageForFulfillingLookupForConfiguration:", v4);
      v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIImagePNGRepresentation(v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (((1 << v5) & 0xA) != 0)
    {
      -[PBUIWallpaperConfigurationManager wallpaperThumbnailImageDataForVariant:wallpaperMode:](self, "wallpaperThumbnailImageDataForVariant:wallpaperMode:", objc_msgSend(v4, "variant"), -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6;
}

- (int64_t)effectiveSharedVariantForVariants:(int64_t)a3
{
  int64_t v3;

  v3 = -1;
  if ((a3 & 2) != 0)
    v3 = 1;
  if ((a3 & 1) != 0)
    return 0;
  else
    return v3;
}

- (BOOL)setWallpaperImage:(id)a3 wallpaperOptions:(id)a4 forVariants:(int64_t)a5
{
  return -[PBUIWallpaperConfigurationManager setWallpaperImage:adjustedImage:thumbnailData:imageHashData:wallpaperOptions:forVariants:wallpaperMode:](self, "setWallpaperImage:adjustedImage:thumbnailData:imageHashData:wallpaperOptions:forVariants:wallpaperMode:", a3, 0, 0, 0, a4, a5, 0);
}

- (BOOL)setWallpaperImage:(id)a3 adjustedImage:(id)a4 thumbnailData:(id)a5 imageHashData:(id)a6 wallpaperOptions:(id)a7 forVariants:(int64_t)a8 wallpaperMode:(int64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int64_t v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v34;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  -[PBUIWallpaperConfigurationManager wallpaperSize](self, "wallpaperSize");
  v21 = v20;
  v23 = v22;
  -[PBUIWallpaperConfigurationManager wallpaperScale](self, "wallpaperScale");
  v25 = v24;
  v26 = -[PBUIWallpaperConfigurationManager parallaxDeviceType](self, "parallaxDeviceType");
  objc_msgSend(v15, "scale");
  objc_msgSend(v19, "bestWallpaperSizeForWallpaperSize:wallpaperScale:deviceType:imageScale:", v26, v21, v23, v25, v27);
  if (!v16)
  {
    objc_msgSend(v19, "cropRect");
    objc_msgSend(v15, "pbui_cropImageWithRect:outputSize:");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
      v16 = v15;
  }
  objc_msgSend(v19, "zoomScale");
  v29 = v28;
  if ((objc_msgSend(v19, "supportsCropping") & 1) == 0 && fabs(v29 + -1.0) >= 2.22044605e-16)
  {
    objc_msgSend(v16, "pbui_scaleImage:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "pbui_imageHashData");
    v31 = objc_claimAutoreleasedReturnValue();

    v18 = (id)v31;
    v16 = v30;
  }
  LOBYTE(v34) = 0;
  v32 = -[PBUIWallpaperConfigurationManager setWallpaperImage:originalImage:thumbnailData:imageHashData:wallpaperOptions:forVariants:options:wallpaperMode:isMigrating:](self, "setWallpaperImage:originalImage:thumbnailData:imageHashData:wallpaperOptions:forVariants:options:wallpaperMode:isMigrating:", v16, v15, v17, v18, v19, a8, 1, a9, v34);

  return v32;
}

- (BOOL)setWallpaperImage:(id)a3 originalImage:(id)a4 forVariants:(int64_t)a5 options:(unint64_t)a6
{
  id v11;
  id v12;
  BOOL v13;
  void *v15;
  uint64_t v16;

  v11 = a3;
  v12 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperConfigurationManager.m"), 845, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image"));

  }
  LOBYTE(v16) = 0;
  v13 = -[PBUIWallpaperConfigurationManager setWallpaperImage:originalImage:thumbnailData:imageHashData:wallpaperOptions:forVariants:options:wallpaperMode:isMigrating:](self, "setWallpaperImage:originalImage:thumbnailData:imageHashData:wallpaperOptions:forVariants:options:wallpaperMode:isMigrating:", v11, v12, 0, 0, 0, a5, a6, 0, v16);

  return v13;
}

- (BOOL)setWallpaperImage:(id)a3 originalImage:(id)a4 thumbnailData:(id)a5 imageHashData:(id)a6 wallpaperOptions:(id)a7 forVariants:(int64_t)a8 options:(unint64_t)a9 wallpaperMode:(int64_t)a10 isMigrating:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t i;
  void *v39;
  BOOL v40;
  void *v41;
  PBUIWallpaperConfigurationManager *v42;
  BOOL v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  PBUIWallpaperConfigurationManager *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  int64_t v57;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperConfigurationManager.m"), 851, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image"));

  }
  PBUILogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperLocations(a8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v65 = v21;
    v66 = 2114;
    v67 = v23;
    _os_log_impl(&dword_1B71C0000, v22, OS_LOG_TYPE_DEFAULT, "Set wallpaper options: %{public}@ for variants: %{public}@", buf, 0x16u);

  }
  v24 = (void *)MEMORY[0x1BCCA57C8]();
  objc_msgSend(v17, "pbui_CGImageBackedImage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pbui_CGImageBackedImage");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a9 & 1) != 0)
  {
    -[PBUIWallpaperConfigurationManager normalizeImage:](self, "normalizeImage:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v26;
  }
  if (!objc_msgSend(v20, "length"))
  {
    objc_msgSend(v25, "pbui_imageHashData");
    v27 = objc_claimAutoreleasedReturnValue();

    v20 = (id)v27;
  }
  v54 = v20;
  if (!objc_msgSend(v19, "length"))
  {
    -[PBUIWallpaperConfigurationManager thumbnailDataForImage:](self, "thumbnailDataForImage:", v25);
    v28 = objc_claimAutoreleasedReturnValue();

    v19 = (id)v28;
  }
  v29 = -[PBUIWallpaperConfigurationManager effectiveSharedVariantForVariants:](self, "effectiveSharedVariantForVariants:", a8);
  v30 = objc_retainAutorelease(v25);
  if (objc_msgSend(v30, "CGImage"))
  {
    v50 = v17;
    v51 = v19;
    if (objc_msgSend(v21, "wallpaperStatus") == 1
      || objc_msgSend(v21, "wallpaperStatus") == 3
      || a11 && objc_msgSend(v21, "wallpaperMode") == a10)
    {
      -[PBUIWallpaperConfigurationManager wallpaperWillChangeForVariants:](self, "wallpaperWillChangeForVariants:", a8);
    }
    if (((v56 == 0) & (a9 >> 1)) != 0)
      v31 = -3;
    else
      v31 = -1;
    v59 = 0u;
    v60 = 0u;
    v55 = v31;
    if (-[PBUIWallpaperConfigurationManager variantsShareWallpaperConfigurationForTypes:](self, "variantsShareWallpaperConfigurationForTypes:", 54))
    {
      v32 = v31;
    }
    else
    {
      v32 = 0;
    }
    v52 = v32;
    v61 = 0uLL;
    v62 = 0uLL;
    -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    if (v34)
    {
      v35 = v34;
      v49 = self;
      v57 = a10;
      v36 = *(_QWORD *)v60;
      v37 = a8 & 3;
      while (2)
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v60 != v36)
            objc_enumerationMutation(v33);
          v39 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          if (a11)
          {
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "setWallpaperImage:forVariant:wallpaperMode:", v30, v29, a10) & 1) != 0)goto LABEL_40;
          }
          else
          {
            if (objc_msgSend(v21, "wallpaperStatus") == 1 || objc_msgSend(v21, "wallpaperStatus") == 2)
            {
              if (v37 == 3)
              {
                objc_msgSend(v39, "removeWallpaperImageDataTypes:forVariants:", v55, 2);
              }
              else if ((a8 & 1) != 0)
              {
                objc_msgSend(v39, "moveWallpaperImageDataTypes:fromVariant:toVariant:", v52, 0, 1);
              }
              objc_msgSend(v39, "removeWallpaperImageDataTypes:forVariants:", 1, a8);
            }
            if (objc_msgSend(v39, "setWallpaperImage:forVariant:wallpaperMode:", v30, v29, objc_msgSend(v21, "wallpaperMode")))
            {
LABEL_40:
              if (v56)
              {
                v17 = v50;
                v19 = v51;
                if (objc_msgSend(v21, "wallpaperStatus") == 1)
                {
                  if (a11)
                  {
LABEL_55:
                    objc_msgSend(v39, "setWallpaperOriginalImage:forVariant:wallpaperMode:", v56, v29, a10);
LABEL_56:
                    if (v19)
                      goto LABEL_57;
LABEL_68:
                    v43 = v37 == 3;
                    v42 = v49;
                    if (!v43 && !a11)
                    {
                      objc_msgSend(v39, "wallpaperThumbnailDataForVariant:wallpaperMode:", 0, 1);
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "wallpaperThumbnailDataForVariant:wallpaperMode:", 1, 1);
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "wallpaperThumbnailDataForVariant:wallpaperMode:", 0, 2);
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "wallpaperThumbnailDataForVariant:wallpaperMode:", 1, 2);
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v44, "isEqualToData:", v53)
                        && objc_msgSend(v45, "isEqualToData:", v46))
                      {
                        objc_msgSend(v39, "removeWallpaperImageDataTypes:forVariants:", -1, 2);
                      }

                      v19 = v51;
                    }
LABEL_74:

                    v41 = v54;
                    if (v21)
                      -[PBUIWallpaperConfigurationManager setWallpaperOptions:forVariants:wallpaperMode:](v42, "setWallpaperOptions:forVariants:wallpaperMode:", v21, a8, objc_msgSend(v21, "wallpaperMode"));
                    if (v54)
                    {
                      if (objc_msgSend(v21, "wallpaperStatus") == 1)
                      {
                        if (a11)
                          goto LABEL_85;
LABEL_82:
                        -[PBUIWallpaperConfigurationManager removeWallpaperImageHashDataForVariants:](v42, "removeWallpaperImageHashDataForVariants:", a8);
                      }
                      else if (objc_msgSend(v21, "wallpaperStatus") == 2 && !a11)
                      {
                        goto LABEL_82;
                      }
                      if (!a11)
                        v57 = objc_msgSend(v21, "wallpaperMode");
LABEL_85:
                      -[PBUIWallpaperConfigurationManager setWallpaperImageHashData:forVariants:wallpaperMode:](v42, "setWallpaperImageHashData:forVariants:wallpaperMode:", v54, a8, v57);
                    }
                    if (objc_msgSend(v21, "wallpaperStatus") == 1 || objc_msgSend(v21, "wallpaperStatus") == 2)
                      -[PBUIWallpaperConfigurationManager removeAllDataExceptForTypes:variants:variantsShareWallpaperConfiguration:](v42, "removeAllDataExceptForTypes:variants:variantsShareWallpaperConfiguration:", 10, a8, 0);
                    if (objc_msgSend(v21, "wallpaperStatus") == 1
                      || objc_msgSend(v21, "wallpaperStatus") == 3
                      || a11 && objc_msgSend(v21, "wallpaperMode") == a10)
                    {
                      v40 = 1;
                      -[PBUIWallpaperConfigurationManager wallpaperDidChangeForVariants:shouldNotify:](v42, "wallpaperDidChangeForVariants:shouldNotify:", a8, 1);
                    }
                    else
                    {
                      v40 = 1;
                    }
                    goto LABEL_94;
                  }
LABEL_53:
                  objc_msgSend(v39, "removeWallpaperImageDataTypes:forVariants:", 2, a8);
                }
                else if (objc_msgSend(v21, "wallpaperStatus") == 2 && !a11)
                {
                  goto LABEL_53;
                }
                if (a11)
                  goto LABEL_55;
                objc_msgSend(v39, "setWallpaperOriginalImage:forVariant:wallpaperMode:", v56, v29, objc_msgSend(v21, "wallpaperMode"));
                if (v51)
                  goto LABEL_57;
                goto LABEL_68;
              }
              v17 = v50;
              v19 = v51;
              if (((a9 >> 1) & 1) != 0)
                goto LABEL_56;
              objc_msgSend(v39, "removeWallpaperImageDataTypes:forVariants:", 2, PBUIWallpaperLocationForVariant(v29));
              if (!v51)
                goto LABEL_68;
LABEL_57:
              if (objc_msgSend(v21, "wallpaperStatus") == 1)
              {
                if (a11)
                {
LABEL_64:
                  v42 = v49;
                  -[PBUIWallpaperConfigurationManager setWallpaperThumbnailData:forVariant:wallpaperMode:](v49, "setWallpaperThumbnailData:forVariant:wallpaperMode:", v19, v29, a10);
                  goto LABEL_74;
                }
LABEL_62:
                -[PBUIWallpaperConfigurationManager removeWallpaperImageDataTypes:forVariants:](v49, "removeWallpaperImageDataTypes:forVariants:", 4, a8);
              }
              else if (objc_msgSend(v21, "wallpaperStatus") == 2 && !a11)
              {
                goto LABEL_62;
              }
              if (!a11)
              {
                -[PBUIWallpaperConfigurationManager setWallpaperThumbnailData:forVariant:wallpaperMode:](v49, "setWallpaperThumbnailData:forVariant:wallpaperMode:", v19, v29, objc_msgSend(v21, "wallpaperMode"));
                goto LABEL_68;
              }
              goto LABEL_64;
            }
          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
        if (v35)
          continue;
        break;
      }
    }

    v40 = 0;
    v17 = v50;
    v19 = v51;
    v41 = v54;
  }
  else
  {
    v40 = 0;
    v41 = v54;
  }
LABEL_94:

  objc_autoreleasePoolPop(v24);
  return v40;
}

- (id)normalizeImage:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CGImage *v11;
  double Height;
  double Width;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v22;
  CGFloat v23;
  CGImageRef v24;
  CGImage *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  NSObject *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;
  CGSize v47;
  CGSize v48;
  CGRect v49;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v34;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v9), "verifiedVideoURLForVariant:wallpaperMode:", 0, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            v27 = v4;

            v26 = v27;
            goto LABEL_21;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
        if (v7)
          continue;
        break;
      }
    }

    v4 = objc_retainAutorelease(v4);
    v11 = (CGImage *)-[NSObject CGImage](v4, "CGImage");
    Height = (double)CGImageGetHeight(v11);
    Width = (double)CGImageGetWidth(v11);
    -[PBUIWallpaperConfigurationManager wallpaperScale](self, "wallpaperScale");
    v15 = v14;
    -[PBUIWallpaperConfigurationManager wallpaperSize](self, "wallpaperSize");
    +[PBUIWallpaperParallaxSettings minimumWallpaperSizeForWallpaperSize:deviceType:](PBUIWallpaperParallaxSettings, "minimumWallpaperSizeForWallpaperSize:deviceType:", -[PBUIWallpaperConfigurationManager parallaxDeviceType](self, "parallaxDeviceType"), v16, v17);
    if (v19 > v18)
      v18 = v19;
    v20 = v15 * v18;
    if (v20 < Height && v20 < Width)
    {
      UIRectCenteredIntegralRect();
      v22 = v49.size.width;
      v23 = v49.size.height;
      v24 = CGImageCreateWithImageInRect(v11, v49);
      if (v24)
      {
        v25 = v24;
        v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", v24, 0, v15);

        CGImageRelease(v25);
        PBUILogCommon();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject size](v26, "size");
          NSStringFromCGSize(v47);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject scale](v26, "scale");
          v30 = v29;
          v48.width = v22;
          v48.height = v23;
          NSStringFromCGSize(v48);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v38 = v26;
          v39 = 2114;
          v40 = v28;
          v41 = 2048;
          v42 = v30;
          v43 = 2114;
          v44 = v31;
          _os_log_impl(&dword_1B71C0000, v27, OS_LOG_TYPE_DEFAULT, "<SpringBoardUI>: Modified wallpaper image: %{public}@ [size=%{public}@, scale=%f] - cgImageSize=%{public}@", buf, 0x2Au);

        }
LABEL_21:

        v4 = v26;
      }
    }
  }
  return v4;
}

- (id)thumbnailDataForImage:(id)a3
{
  void *v3;
  UIImage *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CEA638], "pbui_thumbnailImageForImage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pbui_CGImageBackedImage");
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    UIImageJPEGRepresentation(v4, 0.8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)thumbnailWidth
{
  unint64_t v2;
  double result;

  v2 = -[PBUIWallpaperConfigurationManager wallpaperSizeType](self, "wallpaperSizeType");
  result = 0.0;
  if (v2 <= 4)
    return dbl_1B723F9A8[v2];
  return result;
}

- (BOOL)setWallpaperThumbnailFromFullsizeImage:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  void *v8;
  BOOL v9;

  -[PBUIWallpaperConfigurationManager thumbnailDataForImage:](self, "thumbnailDataForImage:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = -[PBUIWallpaperConfigurationManager setWallpaperThumbnailData:forVariant:wallpaperMode:](self, "setWallpaperThumbnailData:forVariant:wallpaperMode:", v8, a4, a5);
  else
    v9 = 0;

  return v9;
}

- (BOOL)setWallpaperThumbnailData:(id)a3 forVariant:(int64_t)a4
{
  return -[PBUIWallpaperConfigurationManager setWallpaperThumbnailData:forVariant:wallpaperMode:](self, "setWallpaperThumbnailData:forVariant:wallpaperMode:", a3, a4, 0);
}

- (BOOL)setWallpaperThumbnailData:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "setWallpaperThumbnailData:forVariant:wallpaperMode:", v8, a4, a5) & 1) != 0)
        {
          v14 = 1;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)removeWallpaperImagesForVariants:(int64_t)a3
{
  -[PBUIWallpaperConfigurationManager removeWallpaperImagesForVariants:variantsShareWallpaperConfiguration:](self, "removeWallpaperImagesForVariants:variantsShareWallpaperConfiguration:", a3, -[PBUIWallpaperConfigurationManager variantsShareWallpaperConfiguration](self, "variantsShareWallpaperConfiguration"));
}

- (void)removeWallpaperImagesForVariants:(int64_t)a3 variantsShareWallpaperConfiguration:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  -[PBUIWallpaperConfigurationManager clearCacheForVariants:](self, "clearCacheForVariants:", 3);
  v16 = 0u;
  v17 = 0u;
  v7 = (a3 & 3) == 1 && v4;
  *((_QWORD *)&v14 + 1) = 0;
  v15 = 0uLL;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v7)
          objc_msgSend(v13, "moveWallpaperImageDataTypes:fromVariant:toVariant:", -1, 0, 1);
        else
          objc_msgSend(v13, "removeWallpaperImageDataTypes:forVariants:", -1, a3);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)removeWallpaperImageDataTypes:(unint64_t)a3 forVariants:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "removeWallpaperImageDataTypes:forVariants:", a3, a4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)wallpaperOptionsForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "wallpaperOptionsForVariant:wallpaperMode:", a3, a4);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)setWallpaperOptions:(id)a3 forVariants:(int64_t)a4
{
  return -[PBUIWallpaperConfigurationManager setWallpaperOptions:forVariants:wallpaperMode:](self, "setWallpaperOptions:forVariants:wallpaperMode:", a3, a4, 0);
}

- (BOOL)setWallpaperOptions:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a3, "copy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "setWallpaperOptions:forVariants:wallpaperMode:", v8, a4, a5) & 1) != 0)
        {
          v14 = 1;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)removeWallpaperOptionsForVariants:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "removeWallpaperOptionsForVariants:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)wallpaperImageHashDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "wallpaperImageHashDataForVariant:wallpaperMode:", a3, a4);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)shouldSetWallpaperImageHashData
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "supportsWallpaperImageHashDataStorage") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)setWallpaperImageHashData:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a3, "copy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "setWallpaperImageHashData:forVariants:wallpaperMode:", v8, a4, a5) & 1) != 0)
        {
          v14 = 1;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)removeWallpaperImageHashDataForVariants:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "removeWallpaperImageHashDataForVariants:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)variantsShareWallpaperConfiguration
{
  _BOOL8 v4;
  BOOL v5;

  if (-[PBUIWallpaperConfigurationManager isCachedVariantsShareWallpaperConfigurationValid](self, "isCachedVariantsShareWallpaperConfigurationValid"))
  {
    return -[PBUIWallpaperConfigurationManager cachedVariantsShareWallpaperConfiguration](self, "cachedVariantsShareWallpaperConfiguration");
  }
  v4 = -[PBUIWallpaperConfigurationManager variantsShareWallpaperConfigurationForTypes:](self, "variantsShareWallpaperConfigurationForTypes:", -1);
  v5 = v4;
  -[PBUIWallpaperConfigurationManager setCachedVariantsShareWallpaperConfiguration:](self, "setCachedVariantsShareWallpaperConfiguration:", v4);
  -[PBUIWallpaperConfigurationManager setCachedVariantsShareWallpaperConfigurationValid:](self, "setCachedVariantsShareWallpaperConfigurationValid:", 1);
  return v5;
}

- (BOOL)variantsShareWallpaperConfigurationForTypes:(unint64_t)a3
{
  return -[PBUIWallpaperConfigurationManager wallpaperTypeForSharedWallpaperConfigurationForTypes:](self, "wallpaperTypeForSharedWallpaperConfigurationForTypes:", a3) != 0;
}

- (int64_t)wallpaperTypeForSharedWallpaperConfigurationForTypes:(unint64_t)a3
{
  char v3;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  PBUIWallpaperConfigurationManager *v29;
  int v30;
  int v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  _BOOL4 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v3 = a3;
  v42 = *MEMORY[0x1E0C80C00];
  v5 = -[PBUIWallpaperConfigurationManager isVideoSupportedForVariant:](self, "isVideoSupportedForVariant:", 0);
  v6 = -[PBUIWallpaperConfigurationManager isVideoSupportedForVariant:](self, "isVideoSupportedForVariant:", 1);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v29 = self;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (!v8)
  {

    v10 = 0;
    LODWORD(v11) = 0;
    LODWORD(v12) = 0;
    v13 = 0;
    v33 = 0;
    v14 = 0;
LABEL_42:
    v27 = v12 & ~(_DWORD)v11 & 1;
    goto LABEL_51;
  }
  v9 = v8;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v34 = 0;
  v13 = 0;
  v32 = v7;
  v33 = 0;
  v14 = 0;
  v35 = 0;
  v36 = *(_QWORD *)v38;
  v30 = !v6;
  v31 = !v5;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v38 != v36)
        objc_enumerationMutation(v7);
      v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      if ((v3 & 4) == 0)
      {
LABEL_9:
        if ((v3 & 0x10) == 0)
          goto LABEL_18;
        goto LABEL_10;
      }
      if (v14)
      {
        if (v10)
          goto LABEL_9;
      }
      else
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "proceduralWallpaperInfoForVariant:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          goto LABEL_9;
      }
      objc_msgSend(v16, "proceduralWallpaperInfoForVariant:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v3 & 0x10) == 0)
        goto LABEL_18;
LABEL_10:
      if (v33)
      {
        if (!v13)
          goto LABEL_17;
      }
      else
      {
        -[PBUIWallpaperConfigurationManager wallpaperColorForVariant:fromDataStore:colorName:](v29, "wallpaperColorForVariant:fromDataStore:colorName:", 1, v16, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
LABEL_17:
          -[PBUIWallpaperConfigurationManager wallpaperColorForVariant:fromDataStore:colorName:](v29, "wallpaperColorForVariant:fromDataStore:colorName:", 0, v16, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
LABEL_18:
      if ((v3 & 2) != 0)
      {
        if (!(v11 & 1 | (v14 != 0)))
        {
          v11 = 1;
          if ((objc_msgSend(v16, "hasWallpaperImageForVariant:wallpaperMode:", 1, 0) & 1) == 0)
            v11 = objc_msgSend(v16, "hasWallpaperImageForVariant:wallpaperMode:", 1, 2);
        }
        if (!(v12 & 1 | (v10 != 0)))
        {
          if ((objc_msgSend(v16, "hasWallpaperImageForVariant:wallpaperMode:", 0, 0) & 1) == 0)
          {
            v12 = objc_msgSend(v16, "hasWallpaperImageForVariant:wallpaperMode:", 0, 2);
            if ((v3 & 8) == 0)
              continue;
            goto LABEL_26;
          }
          v12 = 1;
        }
      }
      if ((v3 & 8) == 0)
        continue;
LABEL_26:
      if (!((v34 | v31) & 1 | (v10 != 0)))
      {
        v17 = v12;
        v18 = v11;
        v19 = v13;
        objc_msgSend(v16, "verifiedVideoURLForVariant:wallpaperMode:", 0, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v34 = 1;
        }
        else
        {
          objc_msgSend(v16, "verifiedVideoURLForVariant:wallpaperMode:", 0, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v21 != 0;

        }
        v13 = v19;
        v11 = v18;
        v12 = v17;
        v7 = v32;
      }
      if (!((v35 | v30) & 1 | (v14 != 0)))
      {
        v22 = v12;
        v23 = v11;
        v24 = v13;
        v35 = 1;
        objc_msgSend(v16, "verifiedVideoURLForVariant:wallpaperMode:", 1, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          objc_msgSend(v16, "verifiedVideoURLForVariant:wallpaperMode:", 1, 2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v26 != 0;

        }
        v13 = v24;
        v11 = v23;
        v12 = v22;
        v7 = v32;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  }
  while (v9);

  if ((v10 != 0) != (v14 != 0))
    goto LABEL_40;
  if (!v10 || !v14)
  {
    if (v10 && !v14)
    {
      v27 = 2;
      goto LABEL_51;
    }
    if ((v13 != 0) != (v33 != 0))
      goto LABEL_40;
    if (v13 && v33)
    {
      if ((objc_msgSend(v33, "isEqual:", v13) & 1) == 0)
        goto LABEL_61;
    }
    else
    {
      if (!v13 || v33)
      {
LABEL_61:
        if (((v35 ^ v34) & 1) == 0)
          goto LABEL_42;
LABEL_40:
        v27 = 0;
        goto LABEL_51;
      }
      v33 = 0;
    }
    v27 = 4;
    goto LABEL_51;
  }
  if (objc_msgSend(v14, "isEqualToDictionary:", v10))
    v27 = 2;
  else
    v27 = 0;
LABEL_51:

  return v27;
}

- (void)restoreDefaultWallpaperForAllVariantsAndNotify:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;

  v3 = a3;
  PBUILogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PBUIWallpaperConfigurationManager restoreDefaultWallpaperForAllVariantsAndNotify:].cold.2();

  if (soft_PF_IS_PAD_DEVICE() && !soft_PUIFeatureEnabled(0))
  {
    -[PBUIWallpaperConfigurationManager wallpaperWillChangeForVariants:](self, "wallpaperWillChangeForVariants:", 3);
    -[PBUIWallpaperConfigurationManager beginChangeBatch](self, "beginChangeBatch");
    -[PBUIWallpaperConfigurationManager removeDataForTypes:variants:variantsShareWallpaperConfiguration:](self, "removeDataForTypes:variants:variantsShareWallpaperConfiguration:", -1, 3, 0);
    -[PBUIWallpaperConfigurationManager clearDelayedChangeNotifications](self, "clearDelayedChangeNotifications");
    -[PBUIWallpaperConfigurationManager endChangeBatch](self, "endChangeBatch");
    -[PBUIWallpaperConfigurationManager wallpaperDidChangeForVariants:shouldNotify:](self, "wallpaperDidChangeForVariants:shouldNotify:", 3, v3);
  }
  else
  {
    PBUILogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PBUIWallpaperConfigurationManager restoreDefaultWallpaperForAllVariantsAndNotify:].cold.1();

  }
}

- (BOOL)setWallpaperConfigurationFromDefaultWallpaperConfiguration:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5 name:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  PBUIWallpaperOptions *v16;
  void *v17;
  void *v18;
  void *v19;
  PBUIWallpaperDefaultsDomain *v20;
  PBUIWallpaperDefaults *v21;
  id v22;
  id v23;
  PBUIWallpaperDefaults *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  PBUIWallpaperDefaults *v44;
  id v45;
  id v46;

  v10 = a3;
  v11 = a6;
  switch(objc_msgSend(v10, "wallpaperType"))
  {
    case 1:
      objc_msgSend(v10, "staticImageURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13
        && (objc_msgSend(MEMORY[0x1E0CEA638], "imageWithContentsOfFile:", v13),
            (v14 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v15 = (void *)v14;
        v16 = objc_alloc_init(PBUIWallpaperOptions);
        -[PBUIWallpaperOptions setWallpaperMode:](v16, "setWallpaperMode:", a5);
        -[PBUIWallpaperOptions setName:](v16, "setName:", v11);
        LOBYTE(v40) = 0;
        LOBYTE(v17) = 1;
        -[PBUIWallpaperConfigurationManager setWallpaperImage:originalImage:thumbnailData:imageHashData:wallpaperOptions:forVariants:options:wallpaperMode:isMigrating:](self, "setWallpaperImage:originalImage:thumbnailData:imageHashData:wallpaperOptions:forVariants:options:wallpaperMode:isMigrating:", v15, v15, 0, 0, v16, a4, 1, 0, v40);

      }
      else
      {
        LOBYTE(v17) = 0;
      }

      break;
    case 2:
      objc_msgSend(v10, "proceduralWallpaperIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "proceduralWallpaperOptions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc_init(PBUIWallpaperDefaultsDomain);
      v21 = -[PBUIWallpaperDefaults initWithdefaultsDomain:]([PBUIWallpaperDefaults alloc], "initWithdefaultsDomain:", v20);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __127__PBUIWallpaperConfigurationManager_setWallpaperConfigurationFromDefaultWallpaperConfiguration_forVariants_wallpaperMode_name___block_invoke;
      v43[3] = &unk_1E6B94C90;
      v44 = v21;
      v45 = v18;
      v46 = v19;
      v22 = v19;
      v23 = v18;
      v24 = v21;
      PBUIWallpaperEnumerateVariantsForLocations(a4, v43);

      goto LABEL_6;
    case 3:
      objc_msgSend(v10, "staticImageURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "path");
      v26 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v26;
      if (v26)
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "imageWithContentsOfFile:", v26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          -[PBUIWallpaperConfigurationManager setWallpaperImage:originalImage:forVariants:options:](self, "setWallpaperImage:originalImage:forVariants:options:", v17, v17, a4, 1);

          LOBYTE(v17) = 1;
        }
      }
      else
      {
        LOBYTE(v17) = 0;
      }
      objc_msgSend(v10, "videoURL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *MEMORY[0x1E0C9D648];
      v32 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v33 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v34 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      if (v30)
        -[PBUIWallpaperConfigurationManager setVideoURL:forVariant:shoudCrop:relativeCropRect:wallpaperMode:](self, "setVideoURL:forVariant:shoudCrop:relativeCropRect:wallpaperMode:", v30, 0, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(v25, "lastPathComponent");
      v41 = v25;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringByDeletingPathExtension");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[PBUIWallpaperOptions optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:](PBUIWallpaperOptions, "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:", v36, 0, 1, 1, 0.0, 1.0, v31, v32, v33, v34, 0.0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "setWallpaperMode:", a5);
      -[PBUIWallpaperConfigurationManager setWallpaperOptions:forVariants:wallpaperMode:](self, "setWallpaperOptions:forVariants:wallpaperMode:", v37, a4, a5);

      break;
    case 4:
      objc_msgSend(v10, "wallpaperColorName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        -[PBUIWallpaperConfigurationManager setWallpaperColorName:forVariants:](self, "setWallpaperColorName:forVariants:", v27, a4);
        v28 = 1;
      }
      else
      {
        objc_msgSend(v10, "wallpaperColor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          -[PBUIWallpaperConfigurationManager setWallpaperColor:forVariants:](self, "setWallpaperColor:forVariants:", v38, a4);
          v28 = 1;
        }
        else
        {
          v28 = 0;
        }

      }
      LOBYTE(v17) = v28 != 0;
      break;
    case 5:
      objc_msgSend(v10, "wallpaperGradient");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v17) = v29 != 0;
      if (v29)
        -[PBUIWallpaperConfigurationManager setWallpaperGradient:forVariants:](self, "setWallpaperGradient:forVariants:", v29, a4);

      break;
    default:
LABEL_6:
      LOBYTE(v17) = 0;
      break;
  }

  return (char)v17;
}

uint64_t __127__PBUIWallpaperConfigurationManager_setWallpaperConfigurationFromDefaultWallpaperConfiguration_forVariants_wallpaperMode_name___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = result;
  if (a2 == 1)
  {
    v3 = 2;
  }
  else
  {
    if (a2)
      return result;
    v3 = 1;
  }
  objc_msgSend(*(id *)(result + 32), "setProceduralIdentifier:forLocations:", *(_QWORD *)(result + 40), v3);
  objc_msgSend(*(id *)(v2 + 32), "setProceduralOptions:forLocations:", *(_QWORD *)(v2 + 48), v3);
  return objc_msgSend(*(id *)(v2 + 32), "setProceduralUserSet:forLocations:", 0, v3);
}

- (void)clearCacheForVariants:(int64_t)a3
{
  -[PBUIWallpaperConfigurationManager clearCacheForVariants:memoryOnly:](self, "clearCacheForVariants:memoryOnly:", a3, 0);
}

- (void)clearCacheForVariants:(int64_t)a3 memoryOnly:(BOOL)a4
{
  char v5;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];

  v5 = a3;
  PBUILogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PBUIWallpaperConfigurationManager clearCacheForVariants:memoryOnly:].cold.1();

  if (!a4)
  {
    +[PBUIWallpaperCache wallpaperCache](PBUIWallpaperCache, "wallpaperCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeEverythingWithCompletion:", 0);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__PBUIWallpaperConfigurationManager_clearCacheForVariants_memoryOnly___block_invoke;
  v9[3] = &unk_1E6B94CB8;
  v9[4] = self;
  PBUIWallpaperEnumerateVariantsForLocations(v5, v9);
}

void __70__PBUIWallpaperConfigurationManager_clearCacheForVariants_memoryOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

- (unint64_t)numberOfCachedStaticImages
{
  return -[NSMutableDictionary count](self->_wallpaperImageCache, "count");
}

- (PBUIMagnifyMode)magnifyMode
{
  PBUIMagnifyMode *v2;

  v2 = self->_magnifyMode;
  if (!v2)
  {
    +[PBUIMagnifyMode currentMagnifyMode](PBUIMagnifyMode, "currentMagnifyMode");
    v2 = (PBUIMagnifyMode *)objc_claimAutoreleasedReturnValue();
    if (!v2)
      v2 = objc_alloc_init(PBUIMagnifyMode);
  }
  return v2;
}

- (void)performMigrationWithFailureHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  PBUIWallpaperDefaultsDomain *v10;
  void *v11;
  PBUIWallpaperLegacyDefaultsDomain *v12;
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
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;
  _BOOL4 v34;
  BOOL v35;
  _BOOL4 v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  PBUIWallpaperDefaults *v47;
  PBUIWallpaperDefaults *v48;
  PBUIWallpaperDefaultsDomain *v49;
  void *v50;
  void *v51;
  BOOL v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  BOOL v59;
  BOOL v60;
  PBUIWallpaperConfigurationManager *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  char v70;
  BOOL v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  PBUIWallpaperConfigurationManager *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  char v81;
  NSObject *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  NSObject *v88;
  char v89;
  NSObject *v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t j;
  void *v96;
  _BOOL4 v97;
  _BOOL4 v98;
  int v99;
  void *v100;
  PBUIWallpaperDefaultsDomain *v101;
  void *context;
  void *v103;
  PBUIWallpaperConfigurationManager *v104;
  void (**v105)(_QWORD);
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id obj;
  _BOOL4 obja;
  uint64_t v112;
  PBUIWallpaperDefaultsDomain *v113;
  uint64_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  if (!soft_PF_IS_PAD_DEVICE() || soft_PUIFeatureEnabled(0))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.springboard"));

    if (v7)
    {
      PBUILogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.1();
      goto LABEL_139;
    }
  }
  v103 = (void *)os_transaction_create();
  context = (void *)MEMORY[0x1BCCA57C8]();
  PBUILogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.15();

  v10 = objc_alloc_init(PBUIWallpaperDefaultsDomain);
  -[PBUIWallpaperDefaultsDomain lockScreenWallpapers](v10, "lockScreenWallpapers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(PBUIWallpaperLegacyDefaultsDomain);
    +[PBUIWallpaperDefaultsWrapper lockScreenWrapperForLegacyDefaults:](PBUIWallpaperDefaultsWrapper, "lockScreenWrapperForLegacyDefaults:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "wallpaperDefaultsDict");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0C99D80];
    PBUIStringForWallpaperMode(0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryWithObject:forKey:", v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[PBUIWallpaperDefaultsWrapper homeScreenWrapperForLegacyDefaults:](PBUIWallpaperDefaultsWrapper, "homeScreenWrapperForLegacyDefaults:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "wallpaperDefaultsDict");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0C99D80];
    PBUIStringForWallpaperMode(0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryWithObject:forKey:", v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[PBUIWallpaperDefaultsDomain setLockScreenWallpapers:](v10, "setLockScreenWallpapers:", v17);
    -[PBUIWallpaperDefaultsDomain setHomeScreenWallpapers:](v10, "setHomeScreenWallpapers:", v22);
    -[BSAbstractDefaultDomain resetAllDefaults](v12, "resetAllDefaults");

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBUIWallpaperDirectoryDataStore defaultDirectoryURL](PBUIWallpaperDirectoryDataStore, "defaultDirectoryURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "URLByAppendingPathComponent:isDirectory:", CFSTR("LockBackground.jpg"), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSHomeDirectory();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringByAppendingPathComponent:", CFSTR("Library/LockBackground.jpg"));
  v27 = objc_claimAutoreleasedReturnValue();

  v109 = v24;
  objc_msgSend(v24, "URLByAppendingPathComponent:isDirectory:", CFSTR("HomeBackground.jpg"), 0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v25;
  v100 = v23;
  if ((objc_msgSend(v25, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0
    || (objc_msgSend(v23, "fileExistsAtPath:", v27) & 1) != 0)
  {
    v28 = 1;
  }
  else
  {
    v28 = objc_msgSend(v106, "checkResourceIsReachableAndReturnError:", 0);
  }
  v99 = v28;
  v107 = (void *)v27;
  v101 = v10;
  v104 = self;
  v105 = v4;
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v124, 16);
  if (v29)
  {
    v30 = v29;
    LOBYTE(v31) = 0;
    LOBYTE(v32) = 0;
    LOBYTE(v33) = 0;
    LOBYTE(v34) = 0;
    v35 = 0;
    LOBYTE(v36) = 0;
    v112 = *(_QWORD *)v120;
    v114 = 0;
    while (1)
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v120 != v112)
          objc_enumerationMutation(obj);
        v38 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
        if ((v114 & 0x100000000) != 0)
          HIDWORD(v114) = 1;
        else
          HIDWORD(v114) = objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * i), "hasWallpaperImageForVariant:wallpaperMode:", 0, 0);
        if ((v114 & 1) != 0)
        {
          LODWORD(v114) = 1;
          if (!v36)
            goto LABEL_24;
        }
        else
        {
          LODWORD(v114) = objc_msgSend(v38, "hasWallpaperImageForVariant:wallpaperMode:", 1, 0);
          if (!v36)
          {
LABEL_24:
            objc_msgSend(v38, "proceduralWallpaperInfoForVariant:", 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v39 != 0;

            if (!v35)
              goto LABEL_25;
            goto LABEL_30;
          }
        }
        v36 = 1;
        if (!v35)
        {
LABEL_25:
          objc_msgSend(v38, "proceduralWallpaperInfoForVariant:", 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v40 != 0;

          if (v34)
            goto LABEL_31;
          goto LABEL_26;
        }
LABEL_30:
        v35 = 1;
        if (v34)
        {
LABEL_31:
          v34 = 1;
          if (v33)
            goto LABEL_39;
          goto LABEL_32;
        }
LABEL_26:
        objc_msgSend(v38, "wallpaperColorForVariant:", 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          v34 = 1;
        }
        else
        {
          objc_msgSend(v38, "wallpaperColorNameForVariant:", 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v46 != 0;

        }
        if (v33)
        {
LABEL_39:
          v33 = 1;
          if (!v32)
            goto LABEL_35;
          goto LABEL_40;
        }
LABEL_32:
        v33 = 1;
        objc_msgSend(v38, "wallpaperColorForVariant:", 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v42)
        {
          objc_msgSend(v38, "wallpaperColorNameForVariant:", 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v43 != 0;

        }
        if (!v32)
        {
LABEL_35:
          objc_msgSend(v38, "wallpaperGradientForVariant:", 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v44 != 0;

          if (!v31)
            goto LABEL_36;
          goto LABEL_41;
        }
LABEL_40:
        v32 = 1;
        if (!v31)
        {
LABEL_36:
          objc_msgSend(v38, "wallpaperGradientForVariant:", 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v45 != 0;

          continue;
        }
LABEL_41:
        v31 = 1;
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v124, 16);
      if (!v30)
        goto LABEL_46;
    }
  }
  v31 = 0;
  v32 = 0;
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v114 = 0;
LABEL_46:

  v113 = objc_alloc_init(PBUIWallpaperDefaultsDomain);
  v47 = -[PBUIWallpaperDefaults initWithdefaultsDomain:]([PBUIWallpaperDefaults alloc], "initWithdefaultsDomain:", v113);
  v48 = v47;
  if (v36 && v35)
  {
    v97 = 1;
    v98 = 1;
    v49 = v113;
  }
  else
  {
    if (v36)
    {
      v97 = 1;
    }
    else if (-[PBUIWallpaperDefaults proceduralUserSetForVariant:](v47, "proceduralUserSetForVariant:", 0))
    {
      -[PBUIWallpaperDefaults proceduralIdentifierForVariant:](v48, "proceduralIdentifierForVariant:", 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v50 != 0;

    }
    else
    {
      v97 = 0;
    }
    v49 = v113;
    if (v35)
    {
      v98 = 1;
    }
    else if (-[PBUIWallpaperDefaults proceduralUserSetForVariant:](v48, "proceduralUserSetForVariant:", 1))
    {
      -[PBUIWallpaperDefaults proceduralIdentifierForVariant:](v48, "proceduralIdentifierForVariant:", 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = v51 != 0;

    }
    else
    {
      v98 = 0;
    }
  }
  if (!v34 || !v33)
  {
    v4 = v105;
    if (v34)
    {
      obja = 1;
      v53 = v107;
      if (!v33)
      {
LABEL_63:
        -[PBUIWallpaperDefaults wallpaperColorDataForVariant:](v48, "wallpaperColorDataForVariant:", 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          -[PBUIWallpaperDefaults wallpaperColorNameForVariant:](v48, "wallpaperColorNameForVariant:", 1);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v55 != 0;

        }
        else
        {
          v52 = 0;
        }
        v58 = v99;

        goto LABEL_73;
      }
    }
    else
    {
      -[PBUIWallpaperDefaults wallpaperColorDataForVariant:](v48, "wallpaperColorDataForVariant:", 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (v56)
      {
        -[PBUIWallpaperDefaults wallpaperColorNameForVariant:](v48, "wallpaperColorNameForVariant:", 0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        obja = v57 != 0;

      }
      else
      {
        obja = 0;
      }
      v53 = v107;

      if (!v33)
        goto LABEL_63;
    }
    v52 = 1;
    goto LABEL_72;
  }
  v52 = 1;
  obja = 1;
  v4 = v105;
  v53 = v107;
LABEL_72:
  v58 = v99;
LABEL_73:
  if (v32 && v31)
  {
    v59 = 1;
    v60 = 1;
    v61 = v104;
  }
  else
  {
    if (v32)
    {
      v60 = 1;
    }
    else
    {
      -[PBUIWallpaperDefaults wallpaperGradientDataForVariant:](v48, "wallpaperGradientDataForVariant:", 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v62 != 0;

    }
    v61 = v104;
    if (v31)
    {
      v59 = 1;
    }
    else
    {
      -[PBUIWallpaperDefaults wallpaperGradientDataForVariant:](v48, "wallpaperGradientDataForVariant:", 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v63 != 0;

    }
  }
  PBUILogCommon();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.14();

  PBUILogCommon();
  v65 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
    -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.13();

  PBUILogCommon();
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.12();

  PBUILogCommon();
  v67 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
    -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.11();

  PBUILogCommon();
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.10();

  PBUILogCommon();
  v69 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.9();

  if ((v58 | HIDWORD(v114) ^ 1) == 1)
  {
    v70 = -[PBUIWallpaperDefaultsDomain legacyUsesUniqueHomeScreenWallpaper](v49, "legacyUsesUniqueHomeScreenWallpaper");
    v71 = v98 || v97 || obja || v52 || v60 || v59;
    v72 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v108, "path");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "imageWithContentsOfFile:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v74;
    if (v74)
    {
      v76 = v74;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithContentsOfFile:", v53);
      v76 = (id)objc_claimAutoreleasedReturnValue();

    }
    v81 = v70 | v71;

    PBUILogCommon();
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
      -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.8();

    PBUILogCommon();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
      -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.7();

    if ((v81 & 1) == 0)
    {
      if (v76)
      {
        PBUILogCommon();
        v91 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.6();

        v89 = -[PBUIWallpaperConfigurationManager setWallpaperImage:originalImage:forVariants:options:](v61, "setWallpaperImage:originalImage:forVariants:options:", v76, 0, 3, 1);
        if (!v4)
          goto LABEL_129;
        goto LABEL_126;
      }
      -[PBUIWallpaperConfigurationManager restoreDefaultWallpaperForAllVariantsAndNotify:](v61, "restoreDefaultWallpaperForAllVariantsAndNotify:", 0);
LABEL_129:
      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      v92 = objc_msgSend(&unk_1E6BC33A0, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
      v80 = v100;
      if (v92)
      {
        v93 = v92;
        v94 = *(_QWORD *)v116;
        do
        {
          for (j = 0; j != v93; ++j)
          {
            if (*(_QWORD *)v116 != v94)
              objc_enumerationMutation(&unk_1E6BC33A0);
            objc_msgSend(v109, "URLByAppendingPathComponent:isDirectory:", *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * j), 0);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "removeItemAtURL:error:", v96, 0);

          }
          v93 = objc_msgSend(&unk_1E6BC33A0, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
        }
        while (v93);
      }
      v53 = v107;
      objc_msgSend(v100, "removeItemAtPath:error:", v107, 0);
      v49 = v113;
      -[PBUIWallpaperDefaultsDomain clearLegacyDefaults](v113, "clearLegacyDefaults");

      goto LABEL_137;
    }
    v84 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v106, "path");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "imageWithContentsOfFile:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    PBUILogCommon();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
      -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.5();

    if (v76)
    {
      PBUILogCommon();
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
        -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.4();

      v89 = -[PBUIWallpaperConfigurationManager setWallpaperImage:originalImage:forVariants:options:](v61, "setWallpaperImage:originalImage:forVariants:options:", v76, 0, 1, 1);
      if (v86)
      {
LABEL_112:
        PBUILogCommon();
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
          -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.3();

        v89 &= -[PBUIWallpaperConfigurationManager setWallpaperImage:originalImage:forVariants:options:](v61, "setWallpaperImage:originalImage:forVariants:options:", v86, 0, 2, 1);
        goto LABEL_125;
      }
    }
    else
    {
      if (((v97 | HIDWORD(v114) | obja) & 1) == 0)
        -[PBUIWallpaperConfigurationManager restoreDefaultWallpaperForAllVariantsAndNotify:](v61, "restoreDefaultWallpaperForAllVariantsAndNotify:", 0);
      v89 = 1;
      if (v86)
        goto LABEL_112;
    }
    if (((v98 | v114 | obja) & 1) == 0)
      -[PBUIWallpaperConfigurationManager restoreDefaultWallpaperForAllVariantsAndNotify:](v61, "restoreDefaultWallpaperForAllVariantsAndNotify:", 0);
LABEL_125:

    if (v4)
    {
LABEL_126:
      if ((v89 & 1) == 0)
        v4[2](v4);
      goto LABEL_129;
    }
    goto LABEL_129;
  }
  if (-[PBUIWallpaperConfigurationManager variantsShareWallpaperConfigurationForTypes:](v61, "variantsShareWallpaperConfigurationForTypes:", 54))
  {
    v77 = v61;
    v78 = 0;
    v79 = 3;
  }
  else
  {
    -[PBUIWallpaperConfigurationManager migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:](v61, "migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:", 0, PBUIWallpaperLocationForVariant(0));
    v79 = PBUIWallpaperLocationForVariant(1);
    v77 = v61;
    v78 = 1;
  }
  -[PBUIWallpaperConfigurationManager migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:](v77, "migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:", v78, v79);
  v80 = v100;
  -[PBUIWallpaperConfigurationManager safeMigrateWallpaperImageIfNecessary](v61, "safeMigrateWallpaperImageIfNecessary");
LABEL_137:
  -[PBUIWallpaperConfigurationManager regenerateThumbnailsIfNecessary](v61, "regenerateThumbnailsIfNecessary");

  objc_autoreleasePoolPop(context);
  PBUILogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.2();
LABEL_139:

}

- (void)migrateWallpaperOptionsForImageIfNecessaryForVariant:(int64_t)a3 representingVariants:(int64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  NSObject *v28;
  void *v29;
  float v30;
  float v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  NSObject *v55;
  const __CFString *v56;
  double v57;
  uint64_t v58;
  CGFloat MidX;
  NSObject *v60;
  const __CFString *v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  NSObject *v77;
  __CFString *v78;
  NSObject *v79;
  __CFString *v80;
  NSObject *v81;
  __CFString *v82;
  _BOOL4 v83;
  double x;
  double y;
  double width;
  double height;
  NSObject *v88;
  __CFString *v89;
  NSObject *v90;
  NSObject *v91;
  void *v92;
  NSObject *v93;
  uint64_t v94;
  void *v95;
  double v96;
  os_log_t log;
  NSObject *loga;
  CGFloat v99;
  double v100;
  double v101;
  CGFloat v102;
  CGFloat v103;
  double rect;
  uint64_t rect_8;
  NSObject *rect_8b;
  void *rect_8a;
  uint64_t rect_16;
  int64_t rect_24;
  void *v110;
  CGAffineTransform v111;
  uint8_t buf[4];
  const __CFString *v113;
  __int16 v114;
  os_log_t v115;
  __int16 v116;
  void *v117;
  __int16 v118;
  uint64_t v119;
  __int16 v120;
  uint64_t v121;
  uint64_t v122;
  NSSize v123;
  CGPoint v124;
  CGPoint v125;
  CGSize v126;
  CGSize v127;
  CGSize v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;

  v122 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PBUIWallpaperConfigurationManager migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:].cold.6(a3, v7);

  -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:](self, "wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:", a3, 19, -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wallpaperOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wallpaperImage");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wallpaperOriginalImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "proceduralWallpaperInfo");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v9 && v11 && !v12)
  {
    v14 = PBUIWallpaperLocationForVariant(a3);
    if (!objc_msgSend(v9, "supportsCropping"))
    {
      -[PBUIWallpaperConfigurationManager magnifyMode](self, "magnifyMode");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "zoomFactor");
      v31 = v30;
      v32 = objc_msgSend(v9, "isMagnifyEnabled");
      if (!v29)
      {
        v24 = 0;
        goto LABEL_63;
      }
      v33 = v32;
      v110 = v29;
      v34 = v31;
      v35 = fabs(v34 + -1.0);
      if ((_DWORD)v32 == v35 >= 2.22044605e-16)
      {
        v24 = 0;
LABEL_62:
        v29 = v110;
LABEL_63:

        if (v10)
        {
          objc_msgSend(v8, "wallpaperImageHashData");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v92)
          {
            if (!-[PBUIWallpaperConfigurationManager shouldSetWallpaperImageHashData](self, "shouldSetWallpaperImageHashData"))goto LABEL_66;
            -[NSObject pbui_imageHashData](v10, "pbui_imageHashData");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            if (v92)
              -[PBUIWallpaperConfigurationManager setWallpaperImageHashData:forVariants:wallpaperMode:](self, "setWallpaperImageHashData:forVariants:wallpaperMode:", v92, a4, -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"));
          }

        }
LABEL_66:
        PBUILogCommon();
        v93 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
          -[PBUIWallpaperConfigurationManager migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:].cold.1();

        goto LABEL_69;
      }
      PBUILogCommon();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        -[PBUIWallpaperConfigurationManager migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:].cold.5(v35 >= 2.22044605e-16, v33, v36);

      objc_msgSend(v11, "pbui_resizedImageForCurrentMagnifyMode");
      v37 = objc_claimAutoreleasedReturnValue();
      LOBYTE(v94) = 1;
      if (!-[PBUIWallpaperConfigurationManager setWallpaperImage:originalImage:thumbnailData:imageHashData:wallpaperOptions:forVariants:options:wallpaperMode:isMigrating:](self, "setWallpaperImage:originalImage:thumbnailData:imageHashData:wallpaperOptions:forVariants:options:wallpaperMode:isMigrating:", v37, v11, 0, 0, 0, a4, 1, -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"), v94))
      {
        v24 = 0;
LABEL_61:

        goto LABEL_62;
      }
      v24 = (void *)objc_msgSend(v9, "copy", 2.22044605e-16);
      objc_msgSend(v24, "setMagnifyEnabled:", v35 >= 2.22044605e-16);
      objc_msgSend(v24, "setZoomScale:", 1.0 / v34);
      -[PBUIWallpaperConfigurationManager setWallpaperOptions:forVariants:wallpaperMode:](self, "setWallpaperOptions:forVariants:wallpaperMode:", v24, a4, -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"));
      v37 = v37;
      v28 = v37;
LABEL_60:

      v10 = v28;
      goto LABEL_61;
    }
    rect_24 = a4;
    objc_msgSend(v11, "size");
    v16 = v15;
    v18 = v17;
    objc_msgSend(v11, "scale");
    v20 = v19;
    PBUILogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B71C0000, v21, OS_LOG_TYPE_INFO, "//////////__migrateWallpaperOptionsForImageIfNecessary//////////", buf, 2u);
    }

    PBUILogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    rect_8 = v14;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v123.width = v16;
      v123.height = v18;
      NSStringFromSize(v123);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v113 = v23;
      v114 = 2048;
      v115 = *(os_log_t *)&v20;
      _os_log_impl(&dword_1B71C0000, v22, OS_LOG_TYPE_INFO, "originalImage size %{public}@ scale %g", buf, 0x16u);

    }
    -[PBUIWallpaperConfigurationManager migratedWallpaperOptionsForWallpaperOptions:originalImageSize:](self, "migratedWallpaperOptionsForWallpaperOptions:originalImageSize:", v9, v16, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "videoURL");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "originalVideoURL");
    rect_16 = objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperConfigurationManager wallpaperScale](self, "wallpaperScale");
    v27 = v26;
    v110 = (void *)v25;
    if ((objc_msgSend(v24, "isLooselyEqualToWallpaperOptions:", v9) & 1) != 0)
    {
      v28 = v10;
      a4 = rect_24;
      goto LABEL_58;
    }
    a4 = rect_24;
    if (v25 && !rect_16)
    {
      v28 = v10;
      goto LABEL_58;
    }
    v100 = v27;
    v101 = v20;
    PBUILogCommon();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      -[PBUIWallpaperConfigurationManager migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:].cold.4();

    objc_msgSend(v9, "cropRect");
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;
    objc_msgSend(v9, "parallaxFactor");
    v48 = v47;
    objc_msgSend(v9, "zoomScale");
    v50 = v49;
    objc_msgSend(v24, "cropRect");
    v103 = v52;
    rect = v51;
    v102 = v53;
    v99 = v54;
    PBUILogCommon();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      if (rect_8 == 2)
        v56 = CFSTR("Home");
      else
        v56 = CFSTR("Lock");
      v129.origin.x = v40;
      v129.origin.y = v42;
      v129.size.width = v44;
      v129.size.height = v46;
      NSStringFromCGRect(v129);
      log = (os_log_t)objc_claimAutoreleasedReturnValue();
      v130.origin.x = v40;
      v130.origin.y = v42;
      v130.size.width = v44;
      v130.size.height = v46;
      v96 = v18;
      v57 = v16;
      v58 = v48;
      MidX = CGRectGetMidX(v130);
      v131.origin.x = v40;
      v131.origin.y = v42;
      v131.size.width = v44;
      v131.size.height = v46;
      v124.y = CGRectGetMidY(v131);
      v124.x = MidX;
      NSStringFromCGPoint(v124);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v113 = v56;
      a4 = rect_24;
      v114 = 2114;
      v115 = log;
      v116 = 2114;
      v117 = v95;
      v118 = 2048;
      v119 = v50;
      v120 = 2048;
      v121 = v58;
      v16 = v57;
      v18 = v96;
      _os_log_impl(&dword_1B71C0000, v55, OS_LOG_TYPE_INFO, "%@ Old Crop: %{public}@ Center: %{public}@ Zoom: %g Parallax: %g", buf, 0x34u);

    }
    PBUILogCommon();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      if (rect_8 == 2)
        v61 = CFSTR("Home");
      else
        v61 = CFSTR("Lock");
      v62 = v103;
      v132.origin.x = rect;
      v132.origin.y = v103;
      v63 = v102;
      v132.size.width = v102;
      v64 = v99;
      v132.size.height = v99;
      NSStringFromCGRect(v132);
      rect_8b = objc_claimAutoreleasedReturnValue();
      v133.origin.x = rect;
      v133.origin.y = v103;
      v133.size.width = v102;
      v133.size.height = v99;
      v65 = CGRectGetMidX(v133);
      v134.origin.x = rect;
      v134.origin.y = v103;
      v134.size.width = v102;
      v134.size.height = v99;
      v125.y = CGRectGetMidY(v134);
      v125.x = v65;
      NSStringFromCGPoint(v125);
      loga = v60;
      v66 = v24;
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "zoomScale");
      v69 = v68;
      objc_msgSend(v66, "parallaxFactor");
      *(_DWORD *)buf = 138413314;
      v113 = v61;
      a4 = rect_24;
      v114 = 2114;
      v115 = rect_8b;
      v116 = 2114;
      v117 = v67;
      v118 = 2048;
      v119 = v69;
      v120 = 2048;
      v121 = v70;
      _os_log_impl(&dword_1B71C0000, loga, OS_LOG_TYPE_INFO, "%@ New Crop: %{public}@ Center: %{public}@ Zoom: %g Parallax: %g", buf, 0x34u);

      v24 = v66;
      v60 = loga;

    }
    else
    {
      v63 = v102;
      v62 = v103;
      v64 = v99;
    }

    -[PBUIWallpaperConfigurationManager setWallpaperOptions:forVariants:wallpaperMode:](self, "setWallpaperOptions:forVariants:wallpaperMode:", v24, a4, -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"));
    -[PBUIWallpaperConfigurationManager wallpaperSize](self, "wallpaperSize");
    objc_msgSend(v24, "bestWallpaperSizeForWallpaperSize:wallpaperScale:deviceType:imageScale:", -[PBUIWallpaperConfigurationManager parallaxDeviceType](self, "parallaxDeviceType"), v71, v72, v100, v101);
    v74 = v73;
    v76 = v75;
    objc_msgSend(v11, "pbui_cropImageWithRect:outputSize:", rect, v62, v63, v64, v73, v75);
    rect_8a = (void *)objc_claimAutoreleasedReturnValue();
    PBUILogCommon();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      v126.width = v16;
      v126.height = v18;
      NSStringFromCGSize(v126);
      v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v113 = v78;
      _os_log_impl(&dword_1B71C0000, v77, OS_LOG_TYPE_INFO, "originalImageSize: %{public}@", buf, 0xCu);

      a4 = rect_24;
    }

    PBUILogCommon();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      v127.width = v74;
      v127.height = v76;
      NSStringFromCGSize(v127);
      v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v113 = v80;
      _os_log_impl(&dword_1B71C0000, v79, OS_LOG_TYPE_INFO, "outputSize: %{public}@", buf, 0xCu);

      a4 = rect_24;
    }

    PBUILogCommon();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(rect_8a, "size");
      NSStringFromCGSize(v128);
      v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v113 = v82;
      _os_log_impl(&dword_1B71C0000, v81, OS_LOG_TYPE_INFO, "adjustedImageSize: %{public}@", buf, 0xCu);

      a4 = rect_24;
    }

    if (rect_8a)
    {
      v83 = -[PBUIWallpaperConfigurationManager setWallpaperImage:originalImage:forVariants:options:](self, "setWallpaperImage:originalImage:forVariants:options:", rect_8a, v11, a4, 0);
      v28 = rect_8a;

      if (v83)
      {
        if (rect_16)
        {
          CGAffineTransformMakeScale(&v111, 1.0 / v16, 1.0 / v18);
          v135.origin.x = rect;
          v135.origin.y = v62;
          v135.size.width = v63;
          v135.size.height = v64;
          v136 = CGRectApplyAffineTransform(v135, &v111);
          x = v136.origin.x;
          y = v136.origin.y;
          width = v136.size.width;
          height = v136.size.height;
          PBUILogCommon();
          v88 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
          {
            v137.origin.x = x;
            v137.origin.y = y;
            v137.size.width = width;
            v137.size.height = height;
            NSStringFromCGRect(v137);
            v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v113 = v89;
            _os_log_impl(&dword_1B71C0000, v88, OS_LOG_TYPE_INFO, "Re-cropping video to relative rect: %{public}@", buf, 0xCu);

          }
          PBUILogCommon();
          v90 = objc_claimAutoreleasedReturnValue();
          a4 = rect_24;
          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
            -[PBUIWallpaperConfigurationManager migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:].cold.3();

          -[PBUIWallpaperConfigurationManager setVideoURL:forVariant:shoudCrop:relativeCropRect:wallpaperMode:](self, "setVideoURL:forVariant:shoudCrop:relativeCropRect:wallpaperMode:", rect_16, a3, 0, 0, x, y, width, height);
        }
        else
        {
          a4 = rect_24;
        }
LABEL_57:

LABEL_58:
        PBUILogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        v37 = rect_16;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B71C0000, v10, OS_LOG_TYPE_INFO, "/////////////////////////", buf, 2u);
        }
        goto LABEL_60;
      }
      a4 = rect_24;
    }
    else
    {
      v28 = v10;
    }
    PBUILogCommon();
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      -[PBUIWallpaperConfigurationManager migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:].cold.2();

    -[PBUIWallpaperConfigurationManager setWallpaperOptions:forVariants:wallpaperMode:](self, "setWallpaperOptions:forVariants:wallpaperMode:", v9, a4, -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"));
    goto LABEL_57;
  }
LABEL_69:

}

- (id)migratedWallpaperOptionsForWallpaperOptions:(id)a3 originalImageSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v32;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_msgSend(v7, "cropRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "parallaxFactor");
  v17 = v16;
  objc_msgSend(v7, "zoomScale");
  v19 = v18;
  v20 = objc_msgSend(v7, "isPortrait");
  v32 = 0.0;
  -[PBUIWallpaperConfigurationManager cropRectForOldCropRect:portrait:zoomScale:oldParallaxFactor:forImageSize:newZoomScale:](self, "cropRectForOldCropRect:portrait:zoomScale:oldParallaxFactor:forImageSize:newZoomScale:", v20, &v32, v9, v11, v13, v15, v19, v17, width, height);
  v25 = v21;
  v26 = v22;
  v27 = v23;
  v28 = v24;
  if (v17 != 0.0)
  {
    -[PBUIWallpaperConfigurationManager parallaxFactorForCropRect:portrait:forImageSize:zoomScale:](self, "parallaxFactorForCropRect:portrait:forImageSize:zoomScale:", v20, v21, v22, v23, v24, width, height, v32);
    v17 = v29;
  }
  v30 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v30, "setParallaxFactor:", v17);
  objc_msgSend(v30, "setZoomScale:", v32);
  objc_msgSend(v30, "setCropRect:", v25, v26, v27, v28);

  return v30;
}

- (BOOL)safeMigrateWallpaperImageIfNecessaryForVariant:(int64_t)a3 representingVariants:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  void *v8;
  void *v9;
  uint64_t v11;

  -[PBUIWallpaperConfigurationManager wallpaperImageForVariant:wallpaperMode:](self, "wallpaperImageForVariant:wallpaperMode:", a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperConfigurationManager normalizeImage:](self, "normalizeImage:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v9)
  {
    LOBYTE(v11) = 1;
    -[PBUIWallpaperConfigurationManager setWallpaperImage:originalImage:thumbnailData:imageHashData:wallpaperOptions:forVariants:options:wallpaperMode:isMigrating:](self, "setWallpaperImage:originalImage:thumbnailData:imageHashData:wallpaperOptions:forVariants:options:wallpaperMode:isMigrating:", v9, 0, 0, 0, 0, a4, 2, a5, v11);
  }

  return v8 != v9;
}

- (void)safeMigrateWallpaperImageIfNecessary
{
  int64_t v3;
  PBUIWallpaperConfigurationManager *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (-[PBUIWallpaperConfigurationManager variantsShareWallpaperConfigurationForTypes:](self, "variantsShareWallpaperConfigurationForTypes:", 54))
  {
    v3 = -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode");
    v4 = self;
    v5 = 0;
    v6 = 3;
  }
  else
  {
    -[PBUIWallpaperConfigurationManager safeMigrateWallpaperImageIfNecessaryForVariant:representingVariants:wallpaperMode:](self, "safeMigrateWallpaperImageIfNecessaryForVariant:representingVariants:wallpaperMode:", 0, PBUIWallpaperLocationForVariant(0), -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"));
    v7 = PBUIWallpaperLocationForVariant(1);
    v3 = -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode");
    v4 = self;
    v5 = 1;
    v6 = v7;
  }
  -[PBUIWallpaperConfigurationManager safeMigrateWallpaperImageIfNecessaryForVariant:representingVariants:wallpaperMode:](v4, "safeMigrateWallpaperImageIfNecessaryForVariant:representingVariants:wallpaperMode:", v5, v6, v3);
}

- (void)regenerateThumbnailIfNecessaryForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PBUIWallpaperConfigurationManager wallpaperThumbnailImageForVariant:wallpaperMode:](self, "wallpaperThumbnailImageForVariant:wallpaperMode:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;
  -[PBUIWallpaperConfigurationManager wallpaperScale](self, "wallpaperScale");
  if (v9 != v10)
  {
    PBUILogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      PBUIStringForWallpaperVariant(a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scale");
      v14 = v13;
      -[PBUIWallpaperConfigurationManager wallpaperScale](self, "wallpaperScale");
      v17 = 138543874;
      v18 = v12;
      v19 = 2048;
      v20 = v14;
      v21 = 2048;
      v22 = v15;
      _os_log_impl(&dword_1B71C0000, v11, OS_LOG_TYPE_INFO, "Regenerating thumbnail for variant: %{public}@ (existing thumbnail scale: %f, expected scale: %f)", (uint8_t *)&v17, 0x20u);

    }
    -[PBUIWallpaperConfigurationManager wallpaperImageForVariant:wallpaperMode:](self, "wallpaperImageForVariant:wallpaperMode:", a3, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      -[PBUIWallpaperConfigurationManager setWallpaperThumbnailFromFullsizeImage:forVariant:wallpaperMode:](self, "setWallpaperThumbnailFromFullsizeImage:forVariant:wallpaperMode:", v16, a3, a4);

  }
}

- (void)regenerateThumbnailsIfNecessary
{
  -[PBUIWallpaperConfigurationManager regenerateThumbnailIfNecessaryForVariant:wallpaperMode:](self, "regenerateThumbnailIfNecessaryForVariant:wallpaperMode:", 0, -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"));
  if (!-[PBUIWallpaperConfigurationManager variantsShareWallpaperConfiguration](self, "variantsShareWallpaperConfiguration"))-[PBUIWallpaperConfigurationManager regenerateThumbnailIfNecessaryForVariant:wallpaperMode:](self, "regenerateThumbnailIfNecessaryForVariant:wallpaperMode:", 1, -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"));
}

- (void)regenerateStaticWallpaperThumbnailImages
{
  void *v3;
  id v4;

  -[PBUIWallpaperConfigurationManager wallpaperImageForVariant:wallpaperMode:](self, "wallpaperImageForVariant:wallpaperMode:", 0, -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[PBUIWallpaperConfigurationManager setWallpaperThumbnailFromFullsizeImage:forVariant:wallpaperMode:](self, "setWallpaperThumbnailFromFullsizeImage:forVariant:wallpaperMode:", v4, 0, -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"));
  if (!-[PBUIWallpaperConfigurationManager variantsShareWallpaperConfigurationForTypes:](self, "variantsShareWallpaperConfigurationForTypes:", 54))
  {
    -[PBUIWallpaperConfigurationManager wallpaperImageForVariant:wallpaperMode:](self, "wallpaperImageForVariant:wallpaperMode:", 1, -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      -[PBUIWallpaperConfigurationManager setWallpaperThumbnailFromFullsizeImage:forVariant:wallpaperMode:](self, "setWallpaperThumbnailFromFullsizeImage:forVariant:wallpaperMode:", v3, 1, -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"));

  }
}

- (id)videoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "verifiedVideoURLForVariant:wallpaperMode:", a3, a4);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)setVideoURL:(id)a3 forVariant:(int64_t)a4 shoudCrop:(BOOL)a5 relativeCropRect:(CGRect)a6 wallpaperMode:(int64_t)a7
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v12;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  dispatch_semaphore_t v24;
  void *v25;
  NSObject *v26;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD *v30;
  _QWORD v31[3];
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  -[PBUIWallpaperConfigurationManager wallpaperWillChangeForVariants:](self, "wallpaperWillChangeForVariants:", PBUIWallpaperLocationForVariant(a4));
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v20, "setOriginalVideoURL:forVariant:wallpaperMode:", v15, a4, a7))
        {
          if (v12)
          {
            objc_msgSend(v20, "verifiedOriginalVideoURLForVariant:wallpaperMode:", a4, a7);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "unverifiedVideoURLForVariant:wallpaperMode:", a4, a7);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = dispatch_semaphore_create(0);
            v31[0] = 0;
            v31[1] = v31;
            v31[2] = 0x2020000000;
            v32 = 0;
            objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v22);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __101__PBUIWallpaperConfigurationManager_setVideoURL_forVariant_shoudCrop_relativeCropRect_wallpaperMode___block_invoke;
            v28[3] = &unk_1E6B94CE0;
            v30 = v31;
            v26 = v24;
            v29 = v26;
            -[PBUIWallpaperConfigurationManager saveCroppedVideo:toURL:cropRect:completionHandler:](self, "saveCroppedVideo:toURL:cropRect:completionHandler:", v25, v23, v28, x, y, width, height);

            dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
            _Block_object_dispose(v31, 8);

            v21 = 1;
          }
          else
          {
            v21 = objc_msgSend(v20, "setVideoURL:forVariant:wallpaperMode:", v15, a4, a7);
          }
          goto LABEL_13;
        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v17)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_13:

  return v21;
}

intptr_t __101__PBUIWallpaperConfigurationManager_setVideoURL_forVariant_shoudCrop_relativeCropRect_wallpaperMode___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)saveCroppedVideo:(id)a3 toURL:(id)a4 cropRect:(CGRect)a5 completionHandler:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  CGFloat c;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  double v42;
  __int128 v43;
  float64x2_t v44;
  _QWORD v45[4];
  id v46;
  id v47;
  CMTime duration;
  CMTimeRange v49;
  CGAffineTransform v50;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  float64x2_t v59;
  float64x2_t v60;
  __int128 v61;
  void *v62;
  _QWORD v63[2];
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v63[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = *MEMORY[0x1E0C8A808];
  v16 = a4;
  objc_msgSend(v13, "tracksWithMediaType:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = 0u;
  v61 = 0u;
  v59 = 0u;
  if (v18)
    objc_msgSend(v18, "preferredTransform");
  objc_msgSend(v18, "naturalSize");
  v41 = v19;
  v42 = v20;
  v44 = vabsq_f64(vmlaq_n_f64(vmulq_n_f64(v60, v20), v59, *(double *)&v19));
  CGAffineTransformMakeScale(&v58, v44.f64[0], v44.f64[1]);
  v64.origin.x = x;
  v64.origin.y = y;
  v64.size.width = width;
  v64.size.height = height;
  v65 = CGRectApplyAffineTransform(v64, &v58);
  v21 = v65.origin.x;
  v22 = v65.origin.y;
  v23 = v65.size.width;
  v24 = v65.size.height;
  if (v44.f64[0] / v65.size.width >= v44.f64[1] / v65.size.height)
    v25 = v44.f64[0] / v65.size.width;
  else
    v25 = v44.f64[1] / v65.size.height;
  *(float64x2_t *)&v56.a = v59;
  *(float64x2_t *)&v56.c = v60;
  *(_OWORD *)&v56.tx = v61;
  memset(&v57, 0, sizeof(v57));
  -[PBUIWallpaperConfigurationManager _naturalPreferredTransform:forNaturalSize:](self, "_naturalPreferredTransform:forNaturalSize:", &v56, *(double *)&v41, v42, v41);
  v56 = v57;
  CGAffineTransformInvert(&v55, &v56);
  v66.origin.x = v21;
  v66.origin.y = v22;
  v66.size.width = v23;
  v66.size.height = v24;
  v67 = CGRectApplyAffineTransform(v66, &v55);
  v26 = v67.origin.x;
  v27 = v67.origin.y;
  v28 = v67.size.width;
  v29 = v67.size.height;
  v53 = v57;
  memset(&v56, 0, sizeof(v56));
  CGAffineTransformMakeTranslation(&v56, -v21, -v22);
  memset(&v54, 0, sizeof(v54));
  CGAffineTransformMakeScale(&v54, v25, v25);
  t1 = v57;
  t2 = v56;
  CGAffineTransformConcat(&v53, &t1, &t2);
  t2 = v53;
  v50 = v54;
  CGAffineTransformConcat(&t1, &t2, &v50);
  v53 = t1;
  objc_msgSend(MEMORY[0x1E0C8B298], "videoCompositionLayerInstructionWithAssetTrack:", v18);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&t1.a = *MEMORY[0x1E0CA2E68];
  v43 = *(_OWORD *)&t1.a;
  t1.c = *(CGFloat *)(MEMORY[0x1E0CA2E68] + 16);
  c = t1.c;
  objc_msgSend(v30, "setCropRectangle:atTime:", &t1, v26, v27, v28, v29);
  t1 = v53;
  *(_OWORD *)&t2.a = v43;
  t2.c = c;
  objc_msgSend(v30, "setTransform:atTime:", &t1, &t2);
  objc_msgSend(MEMORY[0x1E0C8B290], "videoCompositionInstruction");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v13, "duration");
  else
    memset(&duration, 0, sizeof(duration));
  *(_OWORD *)&t1.a = v43;
  t1.c = c;
  CMTimeRangeMake(&v49, (CMTime *)&t1, &duration);
  objc_msgSend(v32, "setTimeRange:", &v49);
  v63[0] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setLayerInstructions:", v33);

  objc_msgSend(MEMORY[0x1E0C8B288], "videoCompositionWithPropertiesOfAsset:", v13);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setRenderSize:", *(_OWORD *)&v44);
  v62 = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setInstructions:", v35);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "removeItemAtURL:error:", v16, 0);

  v37 = objc_alloc(MEMORY[0x1E0C8AFC0]);
  v38 = (void *)objc_msgSend(v37, "initWithAsset:presetName:", v13, *MEMORY[0x1E0C89E40]);
  objc_msgSend(v38, "setVideoComposition:", v34);
  objc_msgSend(v38, "setOutputURL:", v16);

  objc_msgSend(v38, "setOutputFileType:", *MEMORY[0x1E0C8A2E8]);
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __87__PBUIWallpaperConfigurationManager_saveCroppedVideo_toURL_cropRect_completionHandler___block_invoke;
  v45[3] = &unk_1E6B94D08;
  v46 = v38;
  v47 = v14;
  v39 = v14;
  v40 = v38;
  objc_msgSend(v40, "exportAsynchronouslyWithCompletionHandler:", v45);

}

void __87__PBUIWallpaperConfigurationManager_saveCroppedVideo_toURL_cropRect_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  uint64_t v4;

  v2 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 4)
  {
    PBUILogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __87__PBUIWallpaperConfigurationManager_saveCroppedVideo_toURL_cropRect_completionHandler___block_invoke_cold_1(v2);

  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, objc_msgSend(*v2, "status") == 3);
}

- (CGAffineTransform)_naturalPreferredTransform:(SEL)a3 forNaturalSize:(CGAffineTransform *)a4
{
  __int128 v6;
  double b;
  double a;
  double d;
  double c;
  BOOL v11;
  BOOL v13;
  BOOL v14;
  BOOL v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v19;

  v6 = *(_OWORD *)&a4->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&a4->a;
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&a4->tx;
  a = retstr->a;
  b = retstr->b;
  c = retstr->c;
  d = retstr->d;
  if (retstr->a == 1.0 && b == 0.0 && (c == 0.0 ? (v11 = d == 1.0) : (v11 = 0), v11))
  {
    retstr->tx = 0.0;
    retstr->ty = 0.0;
  }
  else
  {
    v13 = a == 0.0 && b == -1.0 && c == 1.0;
    if (v13 && d == 0.0)
    {
      retstr->tx = 0.0;
      retstr->ty = a5.width;
    }
    else if (a == -1.0 && b == 0.0 && (c == 0.0 ? (v14 = d == -1.0) : (v14 = 0), v14))
    {
      *(CGSize *)&retstr->tx = a5;
    }
    else
    {
      v16 = a == 0.0 && b == 1.0 && c == -1.0;
      if (v16 && d == 0.0)
      {
        retstr->tx = a5.height;
        retstr->ty = 0.0;
      }
      else
      {
        PBUILogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[PBUIWallpaperConfigurationManager _naturalPreferredTransform:forNaturalSize:].cold.1(retstr);

        v18 = MEMORY[0x1E0C9BAA8];
        v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&retstr->c = v19;
        *(_OWORD *)&retstr->tx = *(_OWORD *)(v18 + 32);
      }
    }
  }
  return self;
}

- (void)removeVideoForVariants:(int64_t)a3
{
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11[0] = v8;
        v11[1] = 3221225472;
        v11[2] = __60__PBUIWallpaperConfigurationManager_removeVideoForVariants___block_invoke;
        v11[3] = &unk_1E6B94CB8;
        v11[4] = v10;
        PBUIWallpaperEnumerateVariantsForLocations(v3, v11);
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

uint64_t __60__PBUIWallpaperConfigurationManager_removeVideoForVariants___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeVideoForVariant:", a2);
}

- (Class)proceduralWallpaperClassForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PBUIWallpaperConfigurationManager proceduralWallpaperProvider](self, "proceduralWallpaperProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "proceduralWallpaperClassForIdentifier:", v4);
  else
    PBUIMagicWallpaperClassForIdentifier(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v7;
}

- (BOOL)isProceduralWallpaperInfoValid:(id)a3
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("kSBUIMagicWallpaperIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[PBUIWallpaperConfigurationManager proceduralWallpaperClassForIdentifier:](self, "proceduralWallpaperClassForIdentifier:", v4) != 0;
  else
    v5 = 0;

  return v5;
}

- (id)cleanedProceduralWallpaperInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kSBUIMagicWallpaperPresetOptionsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kSBUIMagicWallpaperThumbnailNameKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(&unk_1E6BC3418, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kSBUIMagicWallpaperPresetOptionsKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("kSBUIMagicWallpaperThumbnailNameKey"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("kSBUIMagicWallpaperPresetOptionsKey"));

  }
  return v3;
}

- (id)proceduralWallpaperInfoForVariant:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    v11 = v8;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "proceduralWallpaperInfoForVariant:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if (-[PBUIWallpaperConfigurationManager isProceduralWallpaperInfoValid:](self, "isProceduralWallpaperInfoValid:", v8))
        {
          break;
        }
      }
      ++v10;
      v11 = v8;
      if (v7 == v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)setProceduralWallpaperIdentifier:(id)a3 options:(id)a4 forVariants:(int64_t)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[2];
  _QWORD v25[4];

  v25[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = -[PBUIWallpaperConfigurationManager variantsShareWallpaperConfigurationForTypes:](self, "variantsShareWallpaperConfigurationForTypes:", 54);
  -[PBUIWallpaperConfigurationManager wallpaperWillChangeForVariants:](self, "wallpaperWillChangeForVariants:", a5);
  v24[0] = CFSTR("kSBUIMagicWallpaperIdentifierKey");
  v24[1] = CFSTR("kSBUIMagicWallpaperPresetOptionsKey");
  v25[0] = v8;
  v25[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "setProceduralWallpaperInfo:forVariants:", v11, a5) & 1) != 0)
        {

          -[PBUIWallpaperConfigurationManager removeAllDataExceptForType:variants:variantsShareWallpaperConfiguration:](self, "removeAllDataExceptForType:variants:variantsShareWallpaperConfiguration:", 2, a5, v10);
          v17 = 1;
          -[PBUIWallpaperConfigurationManager wallpaperDidChangeForVariants:shouldNotify:](self, "wallpaperDidChangeForVariants:shouldNotify:", a5, 1);
          goto LABEL_11;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v14)
        continue;
      break;
    }
  }

  v17 = 0;
LABEL_11:

  return v17;
}

- (void)removeProceduralWallpaperForVariants:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__PBUIWallpaperConfigurationManager_removeProceduralWallpaperForVariants___block_invoke;
  v3[3] = &unk_1E6B94D30;
  v3[4] = self;
  v3[5] = a3;
  PBUIWallpaperEnumerateVariantsForLocations(a3, v3);
}

void __74__PBUIWallpaperConfigurationManager_removeProceduralWallpaperForVariants___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "dataStores", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeProceduralWallpaperForVariants:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)setWallpaperColor:(id)a3 forVariants:(int64_t)a4
{
  id v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PBUIWallpaperConfigurationManager variantsShareWallpaperConfigurationForTypes:](self, "variantsShareWallpaperConfigurationForTypes:", 54);
  -[PBUIWallpaperConfigurationManager wallpaperWillChangeForVariants:](self, "wallpaperWillChangeForVariants:", a4);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "setWallpaperColor:forVariants:", v6, a4) & 1) != 0)
        {

          -[PBUIWallpaperConfigurationManager removeAllDataExceptForType:variants:variantsShareWallpaperConfiguration:](self, "removeAllDataExceptForType:variants:variantsShareWallpaperConfiguration:", 4, a4, v7);
          v13 = 1;
          -[PBUIWallpaperConfigurationManager wallpaperDidChangeForVariants:shouldNotify:](self, "wallpaperDidChangeForVariants:shouldNotify:", a4, 1);
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }

  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)setWallpaperColorName:(id)a3 forVariants:(int64_t)a4
{
  id v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PBUIWallpaperConfigurationManager variantsShareWallpaperConfigurationForTypes:](self, "variantsShareWallpaperConfigurationForTypes:", 54);
  -[PBUIWallpaperConfigurationManager wallpaperWillChangeForVariants:](self, "wallpaperWillChangeForVariants:", a4);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "setWallpaperColorName:forVariants:", v6, a4) & 1) != 0)
        {

          -[PBUIWallpaperConfigurationManager removeAllDataExceptForType:variants:variantsShareWallpaperConfiguration:](self, "removeAllDataExceptForType:variants:variantsShareWallpaperConfiguration:", 4, a4, v7);
          v13 = 1;
          -[PBUIWallpaperConfigurationManager wallpaperDidChangeForVariants:shouldNotify:](self, "wallpaperDidChangeForVariants:shouldNotify:", a4, 1);
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }

  v13 = 0;
LABEL_11:

  return v13;
}

- (void)removeWallpaperColorForVariants:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__PBUIWallpaperConfigurationManager_removeWallpaperColorForVariants___block_invoke;
  v3[3] = &unk_1E6B94D30;
  v3[4] = self;
  v3[5] = a3;
  PBUIWallpaperEnumerateVariantsForLocations(a3, v3);
}

void __69__PBUIWallpaperConfigurationManager_removeWallpaperColorForVariants___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "dataStores", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeWallpaperColorForVariants:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)wallpaperColorForVariant:(int64_t)a3 fromDataStore:(id)a4 colorName:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;

  v7 = a4;
  objc_msgSend(v7, "wallpaperColorNameForVariant:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_8:
    objc_msgSend(v7, "wallpaperColorForVariant:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "pui_wallpaperColorForName:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    PBUILogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PBUIWallpaperConfigurationManager wallpaperColorForVariant:fromDataStore:colorName:].cold.1();

    goto LABEL_8;
  }
  v10 = (void *)v9;
  if (a5)
    *a5 = objc_retainAutorelease(v8);
LABEL_9:

  return v10;
}

- (BOOL)setWallpaperGradient:(id)a3 forVariants:(int64_t)a4
{
  id v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PBUIWallpaperConfigurationManager variantsShareWallpaperConfigurationForTypes:](self, "variantsShareWallpaperConfigurationForTypes:", 54);
  -[PBUIWallpaperConfigurationManager wallpaperWillChangeForVariants:](self, "wallpaperWillChangeForVariants:", a4);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "setWallpaperGradient:forVariants:", v6, a4) & 1) != 0)
        {

          -[PBUIWallpaperConfigurationManager removeAllDataExceptForType:variants:variantsShareWallpaperConfiguration:](self, "removeAllDataExceptForType:variants:variantsShareWallpaperConfiguration:", 5, a4, v7);
          v13 = 1;
          -[PBUIWallpaperConfigurationManager wallpaperDidChangeForVariants:shouldNotify:](self, "wallpaperDidChangeForVariants:shouldNotify:", a4, 1);
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }

  v13 = 0;
LABEL_11:

  return v13;
}

- (void)removeWallpaperGradientForVariants:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__PBUIWallpaperConfigurationManager_removeWallpaperGradientForVariants___block_invoke;
  v3[3] = &unk_1E6B94D30;
  v3[4] = self;
  v3[5] = a3;
  PBUIWallpaperEnumerateVariantsForLocations(a3, v3);
}

void __72__PBUIWallpaperConfigurationManager_removeWallpaperGradientForVariants___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "dataStores", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeWallpaperGradientForVariants:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)removeAllDataExceptForType:(int64_t)a3 variants:(int64_t)a4 variantsShareWallpaperConfiguration:(BOOL)a5
{
  -[PBUIWallpaperConfigurationManager removeDataForTypes:variants:variantsShareWallpaperConfiguration:](self, "removeDataForTypes:variants:variantsShareWallpaperConfiguration:", ~(1 << a3), a4, a5);
}

- (void)removeAllDataExceptForTypes:(unint64_t)a3 variants:(int64_t)a4 variantsShareWallpaperConfiguration:(BOOL)a5
{
  -[PBUIWallpaperConfigurationManager removeDataForTypes:variants:variantsShareWallpaperConfiguration:](self, "removeDataForTypes:variants:variantsShareWallpaperConfiguration:", ~a3, a4, a5);
}

- (void)removeDataForTypes:(unint64_t)a3 variants:(int64_t)a4 variantsShareWallpaperConfiguration:(BOOL)a5
{
  _BOOL8 v5;
  char v7;

  v5 = a5;
  v7 = a3;
  if ((a3 & 8) != 0)
  {
    -[PBUIWallpaperConfigurationManager removeVideoForVariants:](self, "removeVideoForVariants:", a4);
    if ((v7 & 2) == 0)
    {
LABEL_3:
      if ((v7 & 4) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  -[PBUIWallpaperConfigurationManager removeWallpaperImagesForVariants:variantsShareWallpaperConfiguration:](self, "removeWallpaperImagesForVariants:variantsShareWallpaperConfiguration:", a4, v5);
  -[PBUIWallpaperConfigurationManager removeWallpaperOptionsForVariants:](self, "removeWallpaperOptionsForVariants:", a4);
  -[PBUIWallpaperConfigurationManager removeWallpaperImageHashDataForVariants:](self, "removeWallpaperImageHashDataForVariants:", a4);
  if ((v7 & 4) == 0)
  {
LABEL_4:
    if ((v7 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  -[PBUIWallpaperConfigurationManager removeProceduralWallpaperForVariants:](self, "removeProceduralWallpaperForVariants:", a4);
  if ((v7 & 0x10) == 0)
  {
LABEL_5:
    if ((v7 & 0x20) == 0)
      return;
LABEL_11:
    -[PBUIWallpaperConfigurationManager removeWallpaperGradientForVariants:](self, "removeWallpaperGradientForVariants:", a4);
    return;
  }
LABEL_10:
  -[PBUIWallpaperConfigurationManager removeWallpaperColorForVariants:](self, "removeWallpaperColorForVariants:", a4);
  if ((v7 & 0x20) != 0)
    goto LABEL_11;
}

- (void)wallpaperWillChangeForVariants:(int64_t)a3
{
  -[PBUIWallpaperConfigurationManager setCachedVariantsShareWallpaperConfigurationValid:](self, "setCachedVariantsShareWallpaperConfigurationValid:", 0);
}

- (void)wallpaperDidChangeForVariants:(int64_t)a3 shouldNotify:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[PBUIWallpaperConfigurationManager setCachedVariantsShareWallpaperConfigurationValid:](self, "setCachedVariantsShareWallpaperConfigurationValid:", 0);
  -[PBUIWallpaperConfigurationManager clearCacheForVariants:](self, "clearCacheForVariants:", a3);
  if (v4)
  {
    if (-[PBUIWallpaperConfigurationManager isInChangeBatch](self, "isInChangeBatch"))
      -[PBUIWallpaperConfigurationManager delayNotifyingChangeForVariants:](self, "delayNotifyingChangeForVariants:", a3);
    else
      -[PBUIWallpaperConfigurationManager notifyDelegateOfChangesToVariants:](self, "notifyDelegateOfChangesToVariants:", a3);
  }
}

- (void)notifyDelegateOfChangesToVariants:(int64_t)a3
{
  id v5;

  -[PBUIWallpaperConfigurationManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaperConfigurationManager:didChangeWallpaperConfigurationForVariants:", self, a3);

}

- (id)getWallpaperLegibilitySettingsForVariant:(int64_t)a3
{
  void *v5;
  void *v6;

  -[PBUIWallpaperConfigurationManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "wallpaperConfigurationManager:legibilitySettingsForVariant:", self, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CGRect)cropRectForViewPort:(CGRect)a3 portrait:(BOOL)a4 zoomScale:(double)a5 parallaxFactor:(double)a6 forImageSize:(CGSize)a7 contentScaleFactor:(double)a8
{
  double height;
  double width;
  _BOOL8 v12;
  double v13;
  double v14;
  double y;
  double x;
  NSObject *v18;
  NSObject *v19;
  double v20;
  NSObject *v21;
  BOOL v22;
  double v23;
  double v24;
  NSObject *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  NSObject *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  NSObject *v43;
  NSObject *v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  NSObject *v53;
  double v54;
  NSObject *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGAffineTransform v62;
  uint8_t buf[4];
  double v64;
  uint64_t v65;
  CGSize v66;
  CGSize v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect result;

  height = a7.height;
  width = a7.width;
  v12 = a4;
  v13 = a3.size.height;
  v14 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v65 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B71C0000, v18, OS_LOG_TYPE_INFO, "//////////PBUIWallpaperCropRectForViewPort//////////", buf, 2u);
  }

  PBUILogCommon();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v68.origin.x = x;
    v68.origin.y = y;
    v68.size.width = v14;
    v68.size.height = v13;
    NSStringFromCGRect(v68);
    v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543362;
    v64 = v20;
    _os_log_impl(&dword_1B71C0000, v19, OS_LOG_TYPE_INFO, "viewPort: %{public}@", buf, 0xCu);

  }
  PBUILogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v64 = a5;
    _os_log_impl(&dword_1B71C0000, v21, OS_LOG_TYPE_INFO, "zoomScale: %g", buf, 0xCu);
  }

  if (a5 == 0.0
    || (width == *MEMORY[0x1E0C9D820] ? (v22 = height == *(double *)(MEMORY[0x1E0C9D820] + 8)) : (v22 = 0), v22))
  {
    v46 = *MEMORY[0x1E0C9D648];
    v48 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v50 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v52 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v23 = width * a5;
    v24 = height * a5;
    PBUILogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v66.width = v23;
      v66.height = v24;
      NSStringFromCGSize(v66);
      v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      v64 = v26;
      _os_log_impl(&dword_1B71C0000, v25, OS_LOG_TYPE_INFO, "scaledImageSize: %{public}@", buf, 0xCu);

    }
    v61 = v24;

    -[PBUIWallpaperConfigurationManager wallpaperSize](self, "wallpaperSize");
    v28 = v27;
    v30 = v29;
    v31 = -[PBUIWallpaperConfigurationManager parallaxDeviceType](self, "parallaxDeviceType");
    if (a6 == 0.0)
      v32 = 0.0;
    else
      v32 = 1.0;
    +[PBUIWallpaperParallaxSettings bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:](PBUIWallpaperParallaxSettings, "bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:", v31, v12, v28, v30, v32, *(_QWORD *)&v23);
    v34 = v33;
    v36 = v35;
    PBUILogCommon();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v67.width = v34;
      v67.height = v36;
      NSStringFromCGSize(v67);
      v38 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      v64 = v38;
      _os_log_impl(&dword_1B71C0000, v37, OS_LOG_TYPE_INFO, "bestSize: %{public}@", buf, 0xCu);

    }
    v39 = (v34 - v14) * 0.5;
    v40 = (v36 - v13) * 0.5;
    if (v39 >= x)
      v39 = x;
    if (v39 >= v60 - (x + v14))
      v39 = v60 - (x + v14);
    if (v40 >= y)
      v40 = y;
    if (v40 >= v61 - (y + v13))
      v40 = v61 - (y + v13);
    if (v39 >= 0.0)
      v41 = v39;
    else
      v41 = 0.0;
    if (v40 >= 0.0)
      v42 = v40;
    else
      v42 = 0.0;
    PBUILogCommon();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v64 = v41;
      _os_log_impl(&dword_1B71C0000, v43, OS_LOG_TYPE_INFO, "extraX: %g", buf, 0xCu);
    }

    PBUILogCommon();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v64 = v42;
      _os_log_impl(&dword_1B71C0000, v44, OS_LOG_TYPE_INFO, "extraY: %g", buf, 0xCu);
    }

    CGAffineTransformMakeScale(&v62, 1.0 / a8, 1.0 / a8);
    v69.origin.x = x - v41;
    v69.origin.y = y - v42;
    v69.size.width = v14 + v41 * 2.0;
    v69.size.height = v13 + v42 * 2.0;
    CGRectApplyAffineTransform(v69, &v62);
    UIRectCenteredRect();
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;
    PBUILogCommon();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      v70.origin.x = v46;
      v70.origin.y = v48;
      v70.size.width = v50;
      v70.size.height = v52;
      NSStringFromCGRect(v70);
      v54 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      v64 = v54;
      _os_log_impl(&dword_1B71C0000, v53, OS_LOG_TYPE_INFO, "PBUIWallpaperCropRectForViewPort: %{public}@", buf, 0xCu);

    }
    PBUILogCommon();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B71C0000, v55, OS_LOG_TYPE_INFO, "/////////////////////////", buf, 2u);
    }

  }
  v56 = v46;
  v57 = v48;
  v58 = v50;
  v59 = v52;
  result.size.height = v59;
  result.size.width = v58;
  result.origin.y = v57;
  result.origin.x = v56;
  return result;
}

- (CGRect)cropRectForOldCropRect:(CGRect)a3 portrait:(BOOL)a4 zoomScale:(double)a5 oldParallaxFactor:(double)a6 forImageSize:(CGSize)a7 newZoomScale:(double *)a8
{
  double height;
  double width;
  _BOOL8 v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat y;
  CGFloat x;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double MinX;
  double v24;
  double v25;
  double v26;
  double MinY;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect result;

  height = a7.height;
  width = a7.width;
  v12 = a4;
  v13 = a3.size.height;
  v14 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CGAffineTransformMakeScale(&v43, a5, a5);
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = v14;
  v44.size.height = v13;
  CGRectApplyAffineTransform(v44, &v43);
  -[PBUIWallpaperConfigurationManager wallpaperSize](self, "wallpaperSize");
  UIRectCenteredRect();
  -[PBUIWallpaperConfigurationManager cropRectForViewPort:portrait:zoomScale:parallaxFactor:forImageSize:contentScaleFactor:](self, "cropRectForViewPort:portrait:zoomScale:parallaxFactor:forImageSize:contentScaleFactor:", v12, 0x3FF0000000000000);
  v18 = v45.origin.x;
  v19 = v45.origin.y;
  v20 = v45.size.width;
  v21 = v45.size.height;
  v22 = width * a5;
  v40 = height * a5;
  MinX = CGRectGetMinX(v45);
  if (MinX <= -0.0)
    v24 = MinX;
  else
    v24 = -0.0;
  v46.origin.x = v18;
  v46.origin.y = v19;
  v46.size.width = v20;
  v46.size.height = v21;
  v25 = CGRectGetMaxX(v46) - v22;
  if (v25 < 0.0)
    v25 = 0.0;
  v26 = v25 - v24;
  v47.origin.x = v18;
  v47.origin.y = v19;
  v47.size.width = v20;
  v47.size.height = v21;
  MinY = CGRectGetMinY(v47);
  if (MinY <= -0.0)
    v28 = -MinY;
  else
    v28 = 0.0;
  v48.origin.x = v18;
  v48.origin.y = v19;
  v48.size.width = v20;
  v48.size.height = v21;
  v29 = CGRectGetMaxY(v48) - v40;
  if (v29 < 0.0)
    v29 = 0.0;
  v30 = (v28 + v29) / v21;
  if (v26 / v20 >= v30)
    v30 = v26 / v20;
  v31 = 1.0 - v30;
  CGAffineTransformMakeScale(&v42, v31, v31);
  v49.origin.x = v18;
  v49.origin.y = v19;
  v49.size.width = v20;
  v49.size.height = v21;
  CGRectApplyAffineTransform(v49, &v42);
  UIRectCenteredIntegralRect();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  CGAffineTransformMakeScale(&v41, 1.0 / a5, 1.0 / a5);
  v50.origin.x = v33;
  v50.origin.y = v35;
  v50.size.width = v37;
  v50.size.height = v39;
  result = CGRectApplyAffineTransform(v50, &v41);
  if (a8)
    *a8 = 1.0 / v31 * a5;
  return result;
}

- (double)parallaxFactorForCropRect:(CGRect)a3 portrait:(BOOL)a4 forImageSize:(CGSize)a5 zoomScale:(double)a6
{
  double width;
  CGFloat height;
  CGFloat v9;
  CGFloat y;
  CGFloat x;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  double v26;
  int64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  double v37;
  NSObject *v38;
  double v39;
  double v40;
  double v41;
  NSObject *v42;
  double v43;
  CGFloat v44;
  double v45;
  NSObject *v46;
  CGFloat v47;
  double v48;
  NSObject *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  NSObject *v54;
  double v55;
  double v56;
  double v57;
  NSObject *v58;
  double v59;
  double v60;
  NSObject *v61;
  NSObject *v62;
  double v64;
  CGFloat v65;
  double v66;
  double v67;
  double size;
  CGAffineTransform v69;
  uint8_t buf[4];
  double v71;
  uint64_t v72;
  CGSize v73;
  CGSize v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  size = a5.height;
  width = a5.width;
  height = a3.size.height;
  v9 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v72 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B71C0000, v13, OS_LOG_TYPE_INFO, "//////////PBUIWallpaperParallaxFactorForCropRect//////////", buf, 2u);
  }

  CGAffineTransformMakeScale(&v69, a6, a6);
  v75.origin.x = x;
  v75.origin.y = y;
  v75.size.width = v9;
  v75.size.height = height;
  CGRectApplyAffineTransform(v75, &v69);
  -[PBUIWallpaperConfigurationManager wallpaperSize](self, "wallpaperSize");
  v15 = v14;
  v17 = v16;
  UIRectCenteredRect();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v66 = v24;
  PBUILogCommon();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v73.width = width;
    v73.height = size;
    NSStringFromCGSize(v73);
    v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543362;
    v71 = v26;
    _os_log_impl(&dword_1B71C0000, v25, OS_LOG_TYPE_INFO, "imageSize %{public}@", buf, 0xCu);

  }
  v27 = -[PBUIWallpaperConfigurationManager parallaxDeviceType](self, "parallaxDeviceType");
  v65 = v23;
  if (v23 / width >= v66 / size)
    v28 = v23 / width;
  else
    v28 = v66 / size;
  +[PBUIWallpaperParallaxSettings minimumWallpaperSizeForWallpaperSize:deviceType:](PBUIWallpaperParallaxSettings, "minimumWallpaperSizeForWallpaperSize:deviceType:", v27, v15, v17);
  v30 = v29 / width;
  v32 = v31 / size;
  if (v30 >= v32)
    v33 = v30;
  else
    v33 = v32;
  PBUILogCommon();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v71 = a6;
    _os_log_impl(&dword_1B71C0000, v34, OS_LOG_TYPE_INFO, "zoomScale %g", buf, 0xCu);
  }

  PBUILogCommon();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v71 = v28;
    _os_log_impl(&dword_1B71C0000, v35, OS_LOG_TYPE_INFO, "minimumZoomScale %g", buf, 0xCu);
  }

  PBUILogCommon();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v71 = v33;
    _os_log_impl(&dword_1B71C0000, v36, OS_LOG_TYPE_INFO, "minimumZoomScaleForParallax %g", buf, 0xCu);
  }

  v37 = fmin(fmax((a6 - v28) / (v33 - v28), 0.0), 1.0);
  PBUILogCommon();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v71 = v37;
    _os_log_impl(&dword_1B71C0000, v38, OS_LOG_TYPE_INFO, "zoomFactor %g", buf, 0xCu);
  }
  v64 = v37;

  +[PBUIWallpaperParallaxSettings overhangSizeForDeviceType:](PBUIWallpaperParallaxSettings, "overhangSizeForDeviceType:", v27);
  v40 = v39;
  v67 = v41;
  PBUILogCommon();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v74.width = v40;
    v74.height = v67;
    NSStringFromCGSize(v74);
    v43 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543362;
    v71 = v43;
    _os_log_impl(&dword_1B71C0000, v42, OS_LOG_TYPE_INFO, "overhangSize %{public}@", buf, 0xCu);

  }
  v44 = v19;
  v45 = v19 / v40;
  PBUILogCommon();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v71 = v19 / v40;
    _os_log_impl(&dword_1B71C0000, v46, OS_LOG_TYPE_INFO, "minOffsetXFactor %g", buf, 0xCu);
  }

  v47 = v21;
  v48 = v21 / v67;
  PBUILogCommon();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v71 = v21 / v67;
    _os_log_impl(&dword_1B71C0000, v49, OS_LOG_TYPE_INFO, "minOffsetYFactor %g", buf, 0xCu);
  }
  v50 = width * a6;
  v51 = size * a6;

  if (v45 >= v48)
    v52 = v48;
  else
    v52 = v45;
  v53 = fmin(fmax(v52, 0.0), 1.0);
  PBUILogCommon();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v71 = v53;
    _os_log_impl(&dword_1B71C0000, v54, OS_LOG_TYPE_INFO, "minOffsetFactor %g", buf, 0xCu);
  }

  v76.origin.x = v44;
  v76.origin.y = v47;
  v76.size.width = v65;
  v76.size.height = v66;
  v55 = (v50 - CGRectGetMaxX(v76)) / v40;
  v77.origin.x = v44;
  v77.origin.y = v47;
  v77.size.width = v65;
  v77.size.height = v66;
  v56 = (v51 - CGRectGetMaxY(v77)) / v67;
  if (v55 < v56)
    v56 = v55;
  v57 = fmin(fmax(v56, 0.0), 1.0);
  PBUILogCommon();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v71 = v57;
    _os_log_impl(&dword_1B71C0000, v58, OS_LOG_TYPE_INFO, "maxOffsetFactor %g", buf, 0xCu);
  }

  v59 = v64;
  if (v64 > v53)
    v59 = v53;
  if (v59 <= v57)
    v60 = v59;
  else
    v60 = v57;
  PBUILogCommon();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v71 = v60;
    _os_log_impl(&dword_1B71C0000, v61, OS_LOG_TYPE_INFO, "result: %g", buf, 0xCu);
  }

  PBUILogCommon();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B71C0000, v62, OS_LOG_TYPE_INFO, "/////////////////////////", buf, 2u);
  }

  return v60;
}

- (void)getBestCropRect:(CGRect *)a3 zoomScale:(double *)a4 forImageSize:(CGSize)a5 portrait:(BOOL)a6 parallaxFactor:(double)a7
{
  _BOOL8 v8;
  double height;
  double width;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;

  v8 = a6;
  height = a5.height;
  width = a5.width;
  +[PBUIWallpaperParallaxSettings minimumZoomScaleForWallpaperSize:parallaxFactor:deviceType:](PBUIWallpaperParallaxSettings, "minimumZoomScaleForWallpaperSize:parallaxFactor:deviceType:", -[PBUIWallpaperConfigurationManager parallaxDeviceType](self, "parallaxDeviceType"), a5.width, a5.height, a7);
  v19 = v14;
  -[PBUIWallpaperConfigurationManager cropRectForOldCropRect:portrait:zoomScale:oldParallaxFactor:forImageSize:newZoomScale:](self, "cropRectForOldCropRect:portrait:zoomScale:oldParallaxFactor:forImageSize:newZoomScale:", v8, &v19, 0.0, 0.0, width, height, v14, a7, width, height);
  if (a3)
  {
    a3->origin.x = v15;
    a3->origin.y = v16;
    a3->size.width = v17;
    a3->size.height = v18;
  }
  if (a4)
    *a4 = v19;
}

- (NSString)description
{
  return (NSString *)-[PBUIWallpaperConfigurationManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperConfigurationManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v7;
  unint64_t v8;
  const __CFString *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperConfigurationManager dataStores](self, "dataStores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("dataStores"), 0);

  -[PBUIWallpaperConfigurationManager wallpaperSize](self, "wallpaperSize");
  v6 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("wallpaperSize"));
  -[PBUIWallpaperConfigurationManager wallpaperScale](self, "wallpaperScale");
  v7 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("wallpaperScale"));
  v8 = -[PBUIWallpaperConfigurationManager wallpaperSizeType](self, "wallpaperSizeType");
  if (v8 > 4)
    v9 = &stru_1E6B97EB0;
  else
    v9 = (const __CFString *)*((_QWORD *)&off_1E6B94DC0 + v8);
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("wallpaperSizeType"));
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIWallpaperConfigurationManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (NSArray)dataStores
{
  return self->_dataStores;
}

- (PBUIWallpaperConfigurationManagerDelegate)delegate
{
  return (PBUIWallpaperConfigurationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)wallpaperSize
{
  double width;
  double height;
  CGSize result;

  width = self->_wallpaperSize.width;
  height = self->_wallpaperSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)wallpaperScale
{
  return self->_wallpaperScale;
}

- (int64_t)wallpaperMode
{
  return self->_wallpaperMode;
}

- (void)setWallpaperMode:(int64_t)a3
{
  self->_wallpaperMode = a3;
}

- (BOOL)enableWallpaperDimming
{
  return self->_enableWallpaperDimming;
}

- (void)setEnableWallpaperDimming:(BOOL)a3
{
  self->_enableWallpaperDimming = a3;
}

- (int64_t)wallpaperSizeType
{
  return self->_wallpaperSizeType;
}

- (PBUIProceduralWallpaperProvider)proceduralWallpaperProvider
{
  return (PBUIProceduralWallpaperProvider *)objc_loadWeakRetained((id *)&self->_proceduralWallpaperProvider);
}

- (void)setProceduralWallpaperProvider:(id)a3
{
  objc_storeWeak((id *)&self->_proceduralWallpaperProvider, a3);
}

- (void)setMagnifyMode:(id)a3
{
  objc_storeStrong((id *)&self->_magnifyMode, a3);
}

- (BOOL)cachedVariantsShareWallpaperConfiguration
{
  return self->_cachedVariantsShareWallpaperConfiguration;
}

- (void)setCachedVariantsShareWallpaperConfiguration:(BOOL)a3
{
  self->_cachedVariantsShareWallpaperConfiguration = a3;
}

- (BOOL)isCachedVariantsShareWallpaperConfigurationValid
{
  return self->_cachedVariantsShareWallpaperConfigurationValid;
}

- (void)setCachedVariantsShareWallpaperConfigurationValid:(BOOL)a3
{
  self->_cachedVariantsShareWallpaperConfigurationValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magnifyMode, 0);
  objc_destroyWeak((id *)&self->_proceduralWallpaperProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataStores, 0);
  objc_storeStrong((id *)&self->_wallpaperImageCache, 0);
}

- (void)wallpaperConfigurationForVariant:(uint64_t)a1 includingValuesForTypes:(uint64_t)a2 wallpaperMode:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PBUIStringForWallpaperVariant(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_12(&dword_1B71C0000, a3, v6, "Constructed configuration %@ for variant %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_14();
}

- (void)wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_1B71C0000, v0, v1, "Constructing fallback configuration with black image", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)wallpaperConfigurationForVariant:(uint64_t)a1 includingValuesForTypes:(unint64_t)a2 wallpaperMode:(uint64_t)a3 .cold.3(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id v4;
  char v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v12 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  PBUIStringForWallpaperVariant(a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a2)
  {
    v5 = 0;
    do
    {
      if ((a2 & 1) != 0)
      {
        v6 = 1 << v5;
        v7 = &stru_1E6B97EB0;
        switch(1 << v5)
        {
          case 1:
            v7 = CFSTR("static image");
            break;
          case 2:
            v7 = CFSTR("original static image");
            break;
          case 3:
          case 5:
          case 6:
          case 7:
            break;
          case 4:
            v7 = CFSTR("thumbnail image");
            break;
          case 8:
            v7 = CFSTR("thumbnail image data");
            break;
          default:
            if (v6 == 32)
              v8 = CFSTR("procedural wallpaper instance");
            else
              v8 = &stru_1E6B97EB0;
            if (v6 == 16)
              v7 = CFSTR("wallpaper options");
            else
              v7 = v8;
            break;
        }
        objc_msgSend(v4, "addObject:", v7, v12);
      }
      ++v5;
      v9 = a2 >= 2;
      a2 >>= 1;
    }
    while (v9);
  }
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "), v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 138543618;
  v16 = v14;
  v17 = 2114;
  v18 = v10;
  OUTLINED_FUNCTION_12(&dword_1B71C0000, v13, v11, "Get wallpaper configuration for variant: %{public}@ (include: %{public}@)", (uint8_t *)&v15);

}

- (void)_providerForVariant:(uint64_t)a1 lockConfig:homeConfig:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  PBUIStringForWallpaperVariant(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1B71C0000, v2, v3, "failed to determine provider of variant %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_15();
}

- (void)posterMigrationInfo
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(&dword_1B71C0000, v0, v1, "migration info resolved to %{public}@", v2);
  OUTLINED_FUNCTION_9();
}

- (void)restoreDefaultWallpaperForAllVariantsAndNotify:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1B71C0000, v0, v1, "Hello NOT iPad, trying to restoreDefaultWallpaperForAllVariantsAndNotify? not today.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)restoreDefaultWallpaperForAllVariantsAndNotify:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_1B71C0000, v0, v1, "restoreDefaultWallpaperForAllVariantsAndNotify:%i", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)clearCacheForVariants:memoryOnly:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_1B71C0000, v0, v1, "Clear wallpaper cache (memory only: %{BOOL}u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)performMigrationWithFailureHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1B71C0000, v0, v1, "wallpaper migration will not run in SpringBoard with Autobahn enabled.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)performMigrationWithFailureHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_1B71C0000, v0, v1, "End wallpaper migration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)performMigrationWithFailureHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_1B71C0000, v0, v1, "Setting home image", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)performMigrationWithFailureHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_1B71C0000, v0, v1, "Setting lock image", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)performMigrationWithFailureHandler:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13(&dword_1B71C0000, v0, v1, "homeImage: %@", v2);
  OUTLINED_FUNCTION_9();
}

- (void)performMigrationWithFailureHandler:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_1B71C0000, v0, v1, "Setting shared image", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)performMigrationWithFailureHandler:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13(&dword_1B71C0000, v0, v1, "lockImage: %@", v2);
  OUTLINED_FUNCTION_9();
}

- (void)performMigrationWithFailureHandler:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_1B71C0000, v0, v1, "lockScreenAndHomeScreenShareWallpaper: %i", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)performMigrationWithFailureHandler:.cold.9()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1B71C0000, v0, v1, "Gradient Lock: %i, Home: %i", v2, v3);
  OUTLINED_FUNCTION_9();
}

- (void)performMigrationWithFailureHandler:.cold.10()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1B71C0000, v0, v1, "Color Lock: %i, Home: %i", v2, v3);
  OUTLINED_FUNCTION_9();
}

- (void)performMigrationWithFailureHandler:.cold.11()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1B71C0000, v0, v1, "Procedural Lock: %i, Home: %i", v2, v3);
  OUTLINED_FUNCTION_9();
}

- (void)performMigrationWithFailureHandler:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_1B71C0000, v0, v1, "Old wallpaper files exist: %i", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)performMigrationWithFailureHandler:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_1B71C0000, v0, v1, "Home wallpaper exists: %i", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)performMigrationWithFailureHandler:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_1B71C0000, v0, v1, "Lock wallpaper exists: %i", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)performMigrationWithFailureHandler:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1B71C0000, v0, v1, "Start wallpaper migration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_1B71C0000, v0, v1, "End migrating wallpaper options", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1B71C0000, v0, v1, "SpringBoard failed to migrate wallpaper settings -- reverting to previous settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1B71C0000, v0, v1, "MARKING shouldCrop AS NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:.cold.4()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_12(&dword_1B71C0000, v1, (uint64_t)v1, "Setting wallpaper image because options were different: old: %@, new: %@", v2);
  OUTLINED_FUNCTION_9();
}

- (void)migrateWallpaperOptionsForImageIfNecessaryForVariant:(NSObject *)a3 representingVariants:.cold.5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;

  LOWORD(v3) = 1024;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_4_0(&dword_1B71C0000, a2, a3, "Setting wallpaper image because magnify modes are different. In magnify mode: %u, wallpaper magnified: %u", 67109376, v3);
  OUTLINED_FUNCTION_9();
}

- (void)migrateWallpaperOptionsForImageIfNecessaryForVariant:(uint64_t)a1 representingVariants:(NSObject *)a2 .cold.6(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PBUIStringForWallpaperVariant(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13(&dword_1B71C0000, a2, v4, "Migrate wallpaper options for %{public}@", v5);

  OUTLINED_FUNCTION_15();
}

void __87__PBUIWallpaperConfigurationManager_saveCroppedVideo_toURL_cropRect_completionHandler___block_invoke_cold_1(id *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1B71C0000, v3, v4, "Failed with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_14();
}

- (void)_naturalPreferredTransform:(_OWORD *)a1 forNaturalSize:.cold.1(_OWORD *a1)
{
  __int128 v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGAffineTransform v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1[1];
  *(_OWORD *)&v9.a = *a1;
  *(_OWORD *)&v9.c = v1;
  *(_OWORD *)&v9.tx = a1[2];
  NSStringFromCGAffineTransform(&v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1B71C0000, v3, v4, "naturalPreferredTransform: unrecognized preferred transform (%@). The resulting video may be (part) black\n", v5, v6, v7, v8, LOBYTE(v9.a));

}

- (void)wallpaperColorForVariant:fromDataStore:colorName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(&dword_1B71C0000, v0, v1, "Error retrieving color from user defaults: unknown color name '%{public}@' specified.", v2);
  OUTLINED_FUNCTION_9();
}

@end

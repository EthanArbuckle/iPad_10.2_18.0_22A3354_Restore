@implementation PCAssetManager

+ (PCAssetManager)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (PCAssetManager *)(id)sharedInstance_shared;
}

void __32__PCAssetManager_sharedInstance__block_invoke()
{
  PCAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(PCAssetManager);
  v1 = (void *)sharedInstance_shared;
  sharedInstance_shared = (uint64_t)v0;

}

- (PCAssetManager)init
{
  PCAssetManager *v2;
  int *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *internalQueue;
  PCAssetManager *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PCAssetManager;
  v2 = -[PCAssetManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (int *)LogCategoryCreateEx();
    v2->_ucat = (LogCategory *)v3;
    if (*v3 <= 30 && (*v3 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4 = dispatch_queue_create("com.apple.ProximityControl.assetManager.queue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    -[PCAssetManager sfAssetManagerEnsureStarted](v2, "sfAssetManagerEnsureStarted");
    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PCAssetManager;
  -[PCAssetManager dealloc](&v4, sel_dealloc);
}

- (id)bundleForAssetType:(int64_t)a3
{
  void *v5;
  NSMutableDictionary *bundles;
  void *v7;
  void *v8;
  int var0;
  id v10;
  uint64_t v12;

  if ((unint64_t)(a3 - 1) >= 8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = *(&off_24CCF6838 + a3 - 1);
  }
  bundles = self->_bundles;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](bundles, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  var0 = self->_ucat->var0;
  if (v8)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v10 = v8;
  }
  else if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
    -[PCAssetManager prewarmBundleForAssetType:](self, "prewarmBundleForAssetType:", a3, v5);
  }
  else
  {
    -[PCAssetManager prewarmBundleForAssetType:](self, "prewarmBundleForAssetType:", a3, v12);
  }

  return v8;
}

- (id)alternateBundleForAssetType:(int64_t)a3
{
  void *v5;
  NSMutableDictionary *alternateBundles;
  void *v7;
  void *v8;
  int var0;
  id v10;
  uint64_t v12;

  if ((unint64_t)(a3 - 1) >= 8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = *(&off_24CCF6838 + a3 - 1);
  }
  alternateBundles = self->_alternateBundles;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](alternateBundles, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  var0 = self->_ucat->var0;
  if (v8)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v10 = v8;
  }
  else if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
    -[PCAssetManager prewarmAlternateBundleForAssetType:](self, "prewarmAlternateBundleForAssetType:", a3, v5);
  }
  else
  {
    -[PCAssetManager prewarmAlternateBundleForAssetType:](self, "prewarmAlternateBundleForAssetType:", a3, v12);
  }

  return v8;
}

- (id)imageForAssetType:(int64_t)a3
{
  void *v5;
  int var0;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v13;

  if ((unint64_t)(a3 - 1) >= 8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = *(&off_24CCF6838 + a3 - 1);
  }
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v13 = v5;
    LogPrintF();
  }
  -[PCAssetManager bundleForAssetType:](self, "bundleForAssetType:", a3, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PCAssetManager imageNameForAssetType:](self, "imageNameForAssetType:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:withConfiguration:", v8, v7, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_ucat->var0;
      if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    else
    {
      v11 = self->_ucat->var0;
      if (v11 <= 60 && (v11 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)prewarmBundleForAssetType:(int64_t)a3
{
  -[PCAssetManager prewarmBundleForAssetType:alternate:](self, "prewarmBundleForAssetType:alternate:", a3, 0);
}

- (void)prewarmAlternateBundleForAssetType:(int64_t)a3
{
  -[PCAssetManager prewarmBundleForAssetType:alternate:](self, "prewarmBundleForAssetType:alternate:", a3, 1);
}

- (void)prewarmBundleForAssetType:(int64_t)a3 alternate:(BOOL)a4
{
  _BOOL8 v4;
  int var0;
  void *v8;
  const __CFString *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  const __CFString *v14;
  id v15;

  v4 = a4;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    if ((unint64_t)(a3 - 1) >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = *(&off_24CCF6838 + a3 - 1);
    }
    v9 = CFSTR("NO");
    if (v4)
      v9 = CFSTR("YES");
    v13 = v8;
    v14 = v9;
    LogPrintF();

  }
  -[PCAssetManager assetRequestConfiguration:alternate:](self, "assetRequestConfiguration:alternate:", a3, v4, v13, v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[PCAssetManager assetQueryForAssetType:alternate:](self, "assetQueryForAssetType:alternate:", a3, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[PCAssetManager initiateQuery:config:](self, "initiateQuery:config:", v10, v15);
    }
    else
    {
      v12 = self->_ucat->var0;
      if (v12 <= 60 && (v12 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }

  }
  else
  {
    v11 = self->_ucat->var0;
    if (v11 <= 60 && (v11 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }

}

- (id)assetQueryForAssetType:(int64_t)a3
{
  return -[PCAssetManager assetQueryForAssetType:alternate:](self, "assetQueryForAssetType:alternate:", a3, 0);
}

- (id)alternateAssetQueryForAssetType:(int64_t)a3
{
  return -[PCAssetManager assetQueryForAssetType:alternate:](self, "assetQueryForAssetType:alternate:", a3, 1);
}

- (id)assetQueryForAssetType:(int64_t)a3 alternate:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  int var0;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;
  void *v15;

  v4 = a4;
  if ((unint64_t)(a3 - 1) >= 8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = *(&off_24CCF6838 + a3 - 1);
  }
  v8 = -[PCAssetManager colorCodeForAssetType:](self, "colorCodeForAssetType:", a3);
  if ((_DWORD)v8 == *MEMORY[0x24BE90280])
  {
    var0 = self->_ucat->var0;
    if (var0 > 60 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_23;
    goto LABEL_14;
  }
  v10 = v8;
  v11 = -[PCAssetManager productVersionForAssetType:](self, "productVersionForAssetType:", a3);
  v12 = self->_ucat->var0;
  if (!(_DWORD)v11)
  {
    if (v12 > 60 || v12 == -1 && !_LogCategory_Initialize())
      goto LABEL_23;
LABEL_14:
    LogPrintF();
LABEL_23:
    v15 = 0;
    goto LABEL_24;
  }
  if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v13 = objc_alloc(MEMORY[0x24BE90118]);
  if (v4)
    v14 = objc_msgSend(v13, "initWithHomePodColor:version:", v10, v11);
  else
    v14 = objc_msgSend(v13, "initWithSingleHomePodColor:version:", v10, v11);
  v15 = (void *)v14;
LABEL_24:

  return v15;
}

- (id)assetRequestConfiguration:(int64_t)a3 alternate:(BOOL)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11[2];
  _QWORD v12[4];
  id v13[2];
  BOOL v14;
  id location;

  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x24BE90120]);
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__PCAssetManager_assetRequestConfiguration_alternate___block_invoke;
  v12[3] = &unk_24CCF67F0;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  v14 = a4;
  v8 = (void *)objc_msgSend(v6, "initWithQueryResultHandler:", v12);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __54__PCAssetManager_assetRequestConfiguration_alternate___block_invoke_2;
  v10[3] = &unk_24CCF6818;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  objc_msgSend(v8, "setDownloadCompletionHandler:", v10);
  objc_destroyWeak(v11);
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  return v8;
}

void __54__PCAssetManager_assetRequestConfiguration_alternate___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id to;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v12 = objc_loadWeakRetained(&to);
  objc_msgSend(v12, "handleQueryResult:assetType:productType:isFallback:error:isAlternateBundle:", v9, *(_QWORD *)(a1 + 40), v10, a4, v11, *(unsigned __int8 *)(a1 + 48));

  objc_destroyWeak(&to);
}

void __54__PCAssetManager_assetRequestConfiguration_alternate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id to;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v7 = objc_loadWeakRetained(&to);
  objc_msgSend(v7, "handleDownloadCompletion:assetType:error:", v5, *(_QWORD *)(a1 + 40), v6);

  objc_destroyWeak(&to);
}

- (unsigned)colorCodeForAssetType:(int64_t)a3
{
  unsigned __int8 v3;

  v3 = *MEMORY[0x24BE90280];
  if ((unint64_t)(a3 - 1) < 8)
    return 0x2102010807090201uLL >> (8 * (a3 - 1));
  return v3;
}

- (void)handleDownloadCompletion:(id)a3 assetType:(int64_t)a4 error:(id)a5
{
  id v8;
  int var0;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    if ((unint64_t)(a4 - 1) >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = *(&off_24CCF6838 + a4 - 1);
    }
    LogPrintF();

  }
}

- (void)initiateQuery:(id)a3 config:(id)a4
{
  id v6;
  int var0;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v8 = v10;
    v9 = v6;
    LogPrintF();
  }
  -[PCAssetManager sfAssetManagerEnsureStarted](self, "sfAssetManagerEnsureStarted", v8, v9);
  -[SFDeviceAssetManager getAssetBundleForDeviceQuery:withRequestConfiguration:](self->_sfAssetManager, "getAssetBundleForDeviceQuery:withRequestConfiguration:", v10, v6);

}

- (void)handleQueryResult:(id)a3 assetType:(int64_t)a4 productType:(id)a5 isFallback:(BOOL)a6 error:(id)a7 isAlternateBundle:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v10;
  id v14;
  id v15;
  int var0;
  void *v17;
  const char *v18;
  NSMutableDictionary *alternateBundles;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  int v22;
  void *v23;
  int v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *bundles;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  const char *v33;
  id v34;
  id v35;

  v8 = a8;
  v10 = a6;
  v35 = a3;
  v14 = a5;
  v15 = a7;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    if ((unint64_t)(a4 - 1) >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = *(&off_24CCF6838 + a4 - 1);
    }
    v18 = "no";
    if (v10)
      v18 = "yes";
    v33 = v18;
    v34 = v15;
    v30 = v17;
    v31 = v35;
    v32 = v14;
    LogPrintF();

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (!v35 || v15)
  {
    v22 = self->_ucat->var0;
    if (v22 <= 60 && (v22 != -1 || _LogCategory_Initialize()))
    {
      if ((unint64_t)(a4 - 1) >= 8)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), a4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = *(&off_24CCF6838 + a4 - 1);
      }
      LogPrintF();
LABEL_31:

    }
  }
  else
  {
    if (a4)
    {
      if (v8)
      {
        alternateBundles = self->_alternateBundles;
        if (!alternateBundles)
        {
          v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
          v21 = self->_alternateBundles;
          self->_alternateBundles = v20;

          alternateBundles = self->_alternateBundles;
        }
      }
      else
      {
        alternateBundles = self->_bundles;
        if (!alternateBundles)
        {
          v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
          bundles = self->_bundles;
          self->_bundles = v25;

          alternateBundles = self->_bundles;
        }
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4, v30, v31, v32, v33, v34);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](alternateBundles, "setObject:forKeyedSubscript:", v35, v27);

      v28 = (void *)MEMORY[0x24BDD16D0];
      v29 = (id)kPCAssetManagerNotificationNameQueryDidComplete;
      objc_msgSend(v28, "defaultCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "postNotificationName:object:", v29, 0);

      goto LABEL_31;
    }
    v24 = self->_ucat->var0;
    if (v24 <= 60 && (v24 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }

}

- (id)imageNameForAssetType:(int64_t)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  id v8;
  int var0;
  void *v10;
  void *v11;

  v5 = (id)*MEMORY[0x24BE90250];
  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v7 == 2)
  {
    v8 = (id)*MEMORY[0x24BE90248];

    v5 = v8;
  }
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    if ((unint64_t)(a3 - 1) >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = *(&off_24CCF6838 + a3 - 1);
    }
    if (v7 >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = *(&off_24CCF6878 + v7);
    }
    LogPrintF();

  }
  return v5;
}

- (unsigned)productVersionForAssetType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return 0;
  else
    return dword_211B1F330[a3 - 1];
}

- (void)sfAssetManagerEnsureStarted
{
  int var0;
  SFDeviceAssetManager *v4;
  SFDeviceAssetManager *sfAssetManager;

  if (!self->_sfAssetManager)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4 = (SFDeviceAssetManager *)objc_alloc_init(MEMORY[0x24BE90110]);
    sfAssetManager = self->_sfAssetManager;
    self->_sfAssetManager = v4;

    -[SFDeviceAssetManager setDispatchQueue:](self->_sfAssetManager, "setDispatchQueue:", self->_internalQueue);
    -[SFDeviceAssetManager activate](self->_sfAssetManager, "activate");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfAssetManager, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_alternateBundles, 0);
  objc_storeStrong((id *)&self->_bundles, 0);
}

@end

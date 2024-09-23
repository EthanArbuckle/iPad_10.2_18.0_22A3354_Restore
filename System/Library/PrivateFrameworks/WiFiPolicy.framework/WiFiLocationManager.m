@implementation WiFiLocationManager

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  WiFiLocationManager *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  int v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17AC818]();
  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (-[WiFiLocationManager locationManagerState](self, "locationManagerState") != 3
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v10 = "available";
    if (!v9)
      v10 = "not available";
    v28 = 136315394;
    v29 = "-[WiFiLocationManager locationManager:didUpdateLocations:]";
    v30 = 2080;
    v31 = v10;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: updated location %s", (uint8_t *)&v28, 0x16u);
  }
  if (v9)
  {
    objc_msgSend(v9, "timestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiLocationManager latestLocation](self, "latestLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v13);
    v15 = v14;

    -[WiFiLocationManager latestLocation](self, "latestLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "horizontalAccuracy");
    v18 = v17;
    objc_msgSend(v9, "horizontalAccuracy");
    v20 = v19;

    if (v15 >= 30.0 || v18 - v20 > -100.0)
    {
      -[WiFiLocationManager setLatestLocation:](self, "setLatestLocation:", v9);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "postNotificationName:object:", CFSTR("com.apple.wifid.locationUpdateNotification"), v9);

      v22 = self;
      objc_sync_enter(v22);
      if (-[WiFiLocationManager locationManagerState](v22, "locationManagerState") != 3)
      {
        -[WiFiLocationManager latestLocation](v22, "latestLocation");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiLocationManager invokeClientsCallbackType:withLocation:withError:](v22, "invokeClientsCallbackType:withLocation:withError:", 1, v23, 0);

        -[WiFiLocationManager delegate](v22, "delegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_opt_respondsToSelector();

        if ((v25 & 1) != 0)
        {
          -[WiFiLocationManager delegate](v22, "delegate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[WiFiLocationManager latestLocation](v22, "latestLocation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "didUpdateLocations:", v27);

        }
        -[WiFiLocationManager cancelLocationRequestTimeOut](v22, "cancelLocationRequestTimeOut");
        -[WiFiLocationManager requestLeechedAccuracyLocationUpdate](v22, "requestLeechedAccuracyLocationUpdate");
      }
      objc_sync_exit(v22);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Ignoring new location, keeping existing one", (uint8_t *)&v28, 2u);
    }
  }

  objc_autoreleasePoolPop(v8);
}

- (CLLocation)latestLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 24, 1);
}

- (int)locationManagerState
{
  return self->_locationManagerState;
}

- (void)setLatestLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unsigned)isAuthorized
{
  return self->_isAuthorized;
}

+ (unsigned)isLocationValid:(id)a3 uptoSeconds:(double)a4 isHighAccuracy:(unsigned __int8)a5
{
  double v6;
  id v7;
  unsigned __int8 v8;

  v6 = dbl_1CC50ED40[a5 == 0];
  v7 = a3;
  v8 = objc_msgSend((id)objc_opt_class(), "isLocationValid:uptoSeconds:requiredAccuracy:", v7, a4, v6);

  return v8;
}

+ (unsigned)isLocationValid:(id)a3 uptoSeconds:(double)a4 requiredAccuracy:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v15;
  unsigned __int8 v16;
  const char *v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)MEMORY[0x1D17AC818]();
  if (v7)
  {
    objc_msgSend(v7, "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "timeIntervalSinceNow");
      if (v11 > 0.0)
      {
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "(locationAge <=0)", ", "/Library/Caches/com.apple.xbs/Sources/WiFiPolicy/frameworks/Sources/WiFiLocationServices/WiFiLocationManager.m", 657, 0);
        v35 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v35)
          +[WiFiLocationManager isLocationValid:uptoSeconds:requiredAccuracy:].cold.3(v35, v36, v37, v38, v39, v40, v41, v42);
      }
      else
      {
        v12 = -v11;
        objc_msgSend(v7, "clientLocation");
        if (v12 < a4 || (int)0.0 == -1 || v12 < 0.0)
        {
          objc_msgSend(v7, "horizontalAccuracy");
          if (v15 <= a5)
          {
            v16 = 1;
            v17 = "YES";
            goto LABEL_17;
          }
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "date", ", "/Library/Caches/com.apple.xbs/Sources/WiFiPolicy/frameworks/Sources/WiFiLocationServices/WiFiLocationManager.m", 653, 0);
      v27 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v27)
        +[WiFiLocationManager isLocationValid:uptoSeconds:requiredAccuracy:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    v16 = 0;
    v17 = "NO";
LABEL_17:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v44 = v17;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "isLocationValid: %s", buf, 0xCu);
    }

    goto LABEL_20;
  }
  v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v18)
    +[WiFiLocationManager isLocationValid:uptoSeconds:requiredAccuracy:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
  v16 = 0;
LABEL_20:
  objc_autoreleasePoolPop(v8);

  return v16;
}

+ (id)sharedWiFiLocationManager
{
  if (sharedWiFiLocationManager_onceToken != -1)
    dispatch_once(&sharedWiFiLocationManager_onceToken, &__block_literal_global_12);
  return (id)sharedWiFiLocationManager_sharedWiFiLocationManager;
}

void __48__WiFiLocationManager_sharedWiFiLocationManager__block_invoke()
{
  WiFiLocationManager *v0;
  void *v1;

  if (objc_opt_class())
  {
    v0 = objc_alloc_init(WiFiLocationManager);
    v1 = (void *)sharedWiFiLocationManager_sharedWiFiLocationManager;
    sharedWiFiLocationManager_sharedWiFiLocationManager = (uint64_t)v0;

  }
}

- (WiFiLocationManager)init
{
  WiFiLocationManager *v2;
  WiFiLocationManager *v3;
  id v4;
  id v5;
  dispatch_queue_t v6;
  NSObject *v7;
  _QWORD block[4];
  WiFiLocationManager *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WiFiLocationManager;
  v2 = -[WiFiLocationManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WiFiLocationManager setIsAuthorized:](v2, "setIsAuthorized:", 0);
    -[WiFiLocationManager setLocationManagerState:](v3, "setLocationManagerState:", 5);
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[WiFiLocationManager setClientsDataArray:](v3, "setClientsDataArray:", v4);

    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[WiFiLocationManager setVisitClientsDataArray:](v3, "setVisitClientsDataArray:", v5);

    v6 = dispatch_queue_create("com.apple.wifi.location-manager", 0);
    -[WiFiLocationManager setQueue:](v3, "setQueue:", v6);

    -[WiFiLocationManager queue](v3, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__WiFiLocationManager_init__block_invoke;
    block[3] = &unk_1E881C8E8;
    v10 = v3;
    dispatch_async(v7, block);

  }
  return v3;
}

uint64_t __27__WiFiLocationManager_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createCoreLocationObjects");
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  -[WiFiLocationManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__WiFiLocationManager_dealloc__block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = self;
  dispatch_async(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)WiFiLocationManager;
  -[WiFiLocationManager dealloc](&v4, sel_dealloc);
}

uint64_t __30__WiFiLocationManager_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "destroyCoreLocationObjects");
}

- (void)registerCallbackFunctionPtr:(void *)a3 withContext:(void *)a4
{
  void *v7;
  void *v8;
  WiFiLocationManager *v9;
  void *v10;
  _QWORD v11[2];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1D17AC818](self, a2);
  v11[0] = a4;
  v11[1] = a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v11, "{?=^v^?}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[WiFiLocationManager registerCallbackFunctionPtr:withContext:]";
    v14 = 2048;
    v15 = a3;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Adding client: %p", buf, 0x16u);
  }
  v9 = self;
  objc_sync_enter(v9);
  -[WiFiLocationManager clientsDataArray](v9, "clientsDataArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v8);

  objc_sync_exit(v9);
  objc_autoreleasePoolPop(v7);
}

- (void)registerVisitCallbackFunctionPtr:(void *)a3 withContext:(void *)a4
{
  void *v7;
  void *v8;
  WiFiLocationManager *v9;
  void *v10;
  _QWORD v11[2];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1D17AC818](self, a2);
  v11[0] = a4;
  v11[1] = a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v11, "{?=^v^?}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[WiFiLocationManager registerVisitCallbackFunctionPtr:withContext:]";
    v14 = 2048;
    v15 = a3;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Adding client: %p", buf, 0x16u);
  }
  v9 = self;
  objc_sync_enter(v9);
  -[WiFiLocationManager visitClientsDataArray](v9, "visitClientsDataArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v8);

  objc_sync_exit(v9);
  objc_autoreleasePoolPop(v7);
}

- (void)invokeClientsCallbackType:(int)a3 withLocation:(id)a4 withError:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  WiFiLocationManager *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  _BYTE buf[22];
  __int16 v27;
  void *v28;
  uint64_t v29;

  v6 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1D17AC818]();
  v11 = self;
  objc_sync_enter(v11);
  v12 = MEMORY[0x1E0C81028];
  v13 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    +[WiFiLocationManager getStringOfCallbackType:](WiFiLocationManager, "getStringOfCallbackType:", v6);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[WiFiLocationManager invokeClientsCallbackType:withLocation:withError:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    v27 = 2112;
    v28 = v15;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: callbackType: %@, error: %@", buf, 0x20u);

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[WiFiLocationManager clientsDataArray](v11, "clientsDataArray", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(v20, "getValue:", buf);
        if (*(_QWORD *)&buf[8])
          (*(void (**)(uint64_t, _QWORD, id, id))&buf[8])(v6, *(_QWORD *)buf, v8, v9);
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v17);
  }

  objc_sync_exit(v11);
  objc_autoreleasePoolPop(v10);

}

- (void)requestLowAccuracyLocationUpdate
{
  OUTLINED_FUNCTION_12(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "Error: not authorized", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __55__WiFiLocationManager_requestLowAccuracyLocationUpdate__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v1, "locationManagerState"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCLLocationUpdateParams:", v2);

}

- (void)requestHighAccuracyLocationUpdate
{
  void *v3;
  WiFiLocationManager *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  NSObject *v21;
  _QWORD block[5];
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17AC818](self, a2);
  v4 = self;
  objc_sync_enter(v4);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[WiFiLocationManager requestHighAccuracyLocationUpdate]";
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if (-[WiFiLocationManager isAuthorized](v4, "isAuthorized"))
  {
    if (-[WiFiLocationManager locationManagerState](v4, "locationManagerState") == 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Already querying high accuracy location", buf, 2u);
      }
    }
    else
    {
      -[WiFiLocationManager setLocationManagerState:](v4, "setLocationManagerState:", 2);
      -[WiFiLocationManager queue](v4, "queue");
      v21 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__WiFiLocationManager_requestHighAccuracyLocationUpdate__block_invoke;
      block[3] = &unk_1E881C8E8;
      block[4] = v4;
      dispatch_async(v21, block);

    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Location services are not authorized."), &stru_1E881F240, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ios.wifi"), 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v10)
      -[WiFiLocationManager requestLowAccuracyLocationUpdate].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    -[WiFiLocationManager invokeClientsCallbackType:withLocation:withError:](v4, "invokeClientsCallbackType:withLocation:withError:", 2, 0, v9);
    -[WiFiLocationManager delegate](v4, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      -[WiFiLocationManager delegate](v4, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "didFailWithError:", v9);

    }
  }
  objc_sync_exit(v4);

  objc_autoreleasePoolPop(v3);
}

void __56__WiFiLocationManager_requestHighAccuracyLocationUpdate__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v1, "locationManagerState"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCLLocationUpdateParams:", v2);

}

- (void)requestLeechedAccuracyLocationUpdate
{
  void *v3;
  WiFiLocationManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  _QWORD block[5];
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17AC818](self, a2);
  v4 = self;
  objc_sync_enter(v4);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[WiFiLocationManager requestLeechedAccuracyLocationUpdate]";
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if (-[WiFiLocationManager isAuthorized](v4, "isAuthorized"))
  {
    -[WiFiLocationManager setLocationManagerState:](v4, "setLocationManagerState:", 3);
    -[WiFiLocationManager queue](v4, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__WiFiLocationManager_requestLeechedAccuracyLocationUpdate__block_invoke;
    block[3] = &unk_1E881C8E8;
    block[4] = v4;
    dispatch_async(v5, block);

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Location services are not authorized."), &stru_1E881F240, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ios.wifi"), 1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v11)
      -[WiFiLocationManager requestLowAccuracyLocationUpdate].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    -[WiFiLocationManager invokeClientsCallbackType:withLocation:withError:](v4, "invokeClientsCallbackType:withLocation:withError:", 2, 0, v10);
    -[WiFiLocationManager delegate](v4, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[WiFiLocationManager delegate](v4, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "didFailWithError:", v10);

    }
  }
  objc_sync_exit(v4);

  objc_autoreleasePoolPop(v3);
}

void __59__WiFiLocationManager_requestLeechedAccuracyLocationUpdate__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v1, "locationManagerState"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCLLocationUpdateParams:", v2);

}

- (void)stopQueryingLocation
{
  void *v3;
  WiFiLocationManager *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17AC818](self, a2);
  v4 = self;
  objc_sync_enter(v4);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[WiFiLocationManager stopQueryingLocation]";
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  -[WiFiLocationManager setLocationManagerState:](v4, "setLocationManagerState:", 0);
  -[WiFiLocationManager queue](v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__WiFiLocationManager_stopQueryingLocation__block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = v4;
  dispatch_async(v5, block);

  objc_sync_exit(v4);
  objc_autoreleasePoolPop(v3);
}

void __43__WiFiLocationManager_stopQueryingLocation__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v1, "locationManagerState"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCLLocationUpdateParams:", v2);

}

- (void)setShouldMonitorVisits:(unsigned __int8)a3
{
  int v3;
  void *v5;
  WiFiLocationManager *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17AC818](self, a2);
  v6 = self;
  objc_sync_enter(v6);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[WiFiLocationManager setShouldMonitorVisits:]";
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s shouldMonitorVisits: %d", buf, 0x12u);
  }
  v6->_shouldMonitorVisits = v3;
  -[WiFiLocationManager queue](v6, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__WiFiLocationManager_setShouldMonitorVisits___block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = v6;
  dispatch_async(v7, block);

  objc_sync_exit(v6);
  objc_autoreleasePoolPop(v5);
}

void __46__WiFiLocationManager_setShouldMonitorVisits___block_invoke(uint64_t a1)
{
  unsigned __int8 *v1;
  int v2;
  void *v3;
  id v4;

  v1 = *(unsigned __int8 **)(a1 + 32);
  v2 = v1[8];
  objc_msgSend(v1, "clLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    objc_msgSend(v3, "startMonitoringVisits");
  else
    objc_msgSend(v3, "stopMonitoringVisits");

}

- (void)createCoreLocationObjects
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17AC818](self, a2);
  v4 = objc_alloc(MEMORY[0x1E0C9E3C0]);
  -[WiFiLocationManager queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/PrivateFrameworks/MobileWiFi.framework"), self, v5);
  -[WiFiLocationManager setClLocationManager:](self, "setClLocationManager:", v6);

  -[WiFiLocationManager setIsAuthorized:](self, "setIsAuthorized:", objc_msgSend(MEMORY[0x1E0C9E3C0], "authorizationStatusForBundlePath:", CFSTR("/System/Library/PrivateFrameworks/MobileWiFi.framework"))- 3 < 2);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[WiFiLocationManager isAuthorized](self, "isAuthorized");
    v8 = "is";
    if (!v7)
      v8 = "is not";
    v9 = 136315394;
    v10 = "-[WiFiLocationManager createCoreLocationObjects]";
    v11 = 2080;
    v12 = v8;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: WiFi %s authorized for location", (uint8_t *)&v9, 0x16u);
  }
  if (-[WiFiLocationManager isAuthorized](self, "isAuthorized"))
    -[WiFiLocationManager requestLeechedAccuracyLocationUpdate](self, "requestLeechedAccuracyLocationUpdate");
  objc_autoreleasePoolPop(v3);
}

- (void)destroyCoreLocationObjects
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1D17AC818](self, a2);
  -[WiFiLocationManager clLocationManager](self, "clLocationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopUpdatingLocation");

  -[WiFiLocationManager setQueue:](self, "setQueue:", 0);
  -[WiFiLocationManager setClLocationManager:](self, "setClLocationManager:", 0);
  objc_autoreleasePoolPop(v3);
}

- (void)setCLLocationUpdateParams:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17AC818]();
  v6 = objc_msgSend(v4, "intValue");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    +[WiFiLocationManager getStringOfState:](WiFiLocationManager, "getStringOfState:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315394;
    v19 = "-[WiFiLocationManager setCLLocationUpdateParams:]";
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: state <%@>", (uint8_t *)&v18, 0x16u);

  }
  switch((int)v6)
  {
    case 0:
      -[WiFiLocationManager clLocationManager](self, "clLocationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stopUpdatingLocation");
      goto LABEL_9;
    case 1:
      -[WiFiLocationManager clLocationManager](self, "clLocationManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stopUpdatingLocation");

      v10 = (double *)MEMORY[0x1E0C9E4B0];
      goto LABEL_7;
    case 2:
      -[WiFiLocationManager clLocationManager](self, "clLocationManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stopUpdatingLocation");

      v10 = (double *)MEMORY[0x1E0C9E4A0];
LABEL_7:
      v12 = *v10;
      -[WiFiLocationManager clLocationManager](self, "clLocationManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDesiredAccuracy:", v12);

      -[WiFiLocationManager clLocationManager](self, "clLocationManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "startUpdatingLocation");

      -[WiFiLocationManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_locationRequestDidTimeOut, 0, 60.0);
      break;
    case 3:
      -[WiFiLocationManager clLocationManager](self, "clLocationManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stopUpdatingLocation");

      v16 = *MEMORY[0x1E0C9E4C0];
      -[WiFiLocationManager clLocationManager](self, "clLocationManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDesiredAccuracy:", v16);

      -[WiFiLocationManager clLocationManager](self, "clLocationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startUpdatingLocation");
LABEL_9:

      break;
    default:
      break;
  }
  objc_autoreleasePoolPop(v5);

}

- (void)locationRequestDidTimeOut
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17AC818](self, a2);
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Location request timed out."), &stru_1E881F240, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ios.wifi"), 60, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiLocationManager invokeClientsCallbackType:withLocation:withError:](self, "invokeClientsCallbackType:withLocation:withError:", 2, 0, v8);
  -[WiFiLocationManager delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WiFiLocationManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didFailWithError:", v8);

  }
  -[WiFiLocationManager setLocationManagerState:](self, "setLocationManagerState:", 3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[WiFiLocationManager locationManagerState](self, "locationManagerState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiLocationManager setCLLocationUpdateParams:](self, "setCLLocationUpdateParams:", v11);

  objc_autoreleasePoolPop(v3);
}

- (void)cancelLocationRequestTimeOut
{
  void *v3;

  v3 = (void *)MEMORY[0x1D17AC818](self, a2);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_locationRequestDidTimeOut, 0);
  objc_autoreleasePoolPop(v3);
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17AC818]();
  -[WiFiLocationManager setIsAuthorized:](self, "setIsAuthorized:", (a4 - 3) < 2);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v19 = a4;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "didChangeAuthorizationStatus: Notify registered clients of authorization status change, new status: %d", buf, 8u);
  }
  if (-[WiFiLocationManager isAuthorized](self, "isAuthorized"))
  {
    -[WiFiLocationManager requestLeechedAccuracyLocationUpdate](self, "requestLeechedAccuracyLocationUpdate");
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", *MEMORY[0x1E0CB2D50]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Location services are not authorized."), &stru_1E881F240, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi"), 1, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[WiFiLocationManager invokeClientsCallbackType:withLocation:withError:](self, "invokeClientsCallbackType:withLocation:withError:", 3, 0, v8);
  -[WiFiLocationManager delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[WiFiLocationManager delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didChangeAuthorizationStatus");

  }
  objc_autoreleasePoolPop(v7);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17AC818]();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[WiFiLocationManager locationManager:didFailWithError:].cold.1(v7);
  if (-[WiFiLocationManager locationManagerState](self, "locationManagerState") != 3)
  {
    -[WiFiLocationManager invokeClientsCallbackType:withLocation:withError:](self, "invokeClientsCallbackType:withLocation:withError:", 2, 0, v7);
    -[WiFiLocationManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[WiFiLocationManager delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "didFailWithError:", v7);

    }
    -[WiFiLocationManager cancelLocationRequestTimeOut](self, "cancelLocationRequestTimeOut");
    -[WiFiLocationManager requestLeechedAccuracyLocationUpdate](self, "requestLeechedAccuracyLocationUpdate");
  }
  objc_autoreleasePoolPop(v8);

}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WiFiLocationManager *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[24];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17AC818]();
  v9 = self;
  objc_sync_enter(v9);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[WiFiLocationManager locationManager:didVisit:]";
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if (-[WiFiLocationManager shouldMonitorVisits](v9, "shouldMonitorVisits"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[WiFiLocationManager visitClientsDataArray](v9, "visitClientsDataArray", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
          *(_OWORD *)buf = 0uLL;
          objc_msgSend(v14, "getValue:", buf);
          if (*(_QWORD *)&buf[8])
            (*(void (**)(_QWORD, id))&buf[8])(*(_QWORD *)buf, v7);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }

    -[WiFiLocationManager delegate](v9, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[WiFiLocationManager delegate](v9, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "didUpdateVisits:", v7);

    }
  }
  objc_sync_exit(v9);

  objc_autoreleasePoolPop(v8);
}

+ (void)logLocation:(id)a3 addPrefixString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;
  int v10;
  id v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1D17AC818]();
  if (v5)
  {
    v8 = objc_msgSend(v5, "type") - 1;
    if (v8 > 9)
      v9 = CFSTR("unknown");
    else
      v9 = off_1E881E468[v8];
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@: source=%@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[WiFiLocationManager logLocation:addPrefixString:].cold.1((uint64_t)v6);
  }
  objc_autoreleasePoolPop(v7);

}

+ (id)getStringOfCallbackType:(int)a3
{
  void *v4;
  const __CFString *v5;

  v4 = (void *)MEMORY[0x1D17AC818](a1, a2);
  if ((a3 - 1) > 2)
    v5 = CFSTR("Unknown");
  else
    v5 = off_1E881E4B8[a3 - 1];
  objc_autoreleasePoolPop(v4);
  return (id)v5;
}

+ (id)getStringOfState:(int)a3
{
  void *v4;
  const __CFString *v5;

  v4 = (void *)MEMORY[0x1D17AC818](a1, a2);
  if (a3 > 4)
    v5 = CFSTR("Unknown");
  else
    v5 = off_1E881E4D0[a3];
  objc_autoreleasePoolPop(v4);
  return (id)v5;
}

- (unsigned)shouldMonitorVisits
{
  return self->_shouldMonitorVisits;
}

- (WiFiLocationManagerDelegate)delegate
{
  return (WiFiLocationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setIsAuthorized:(unsigned __int8)a3
{
  self->_isAuthorized = a3;
}

- (CLLocationManager)clLocationManager
{
  return self->_clLocationManager;
}

- (void)setClLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_clLocationManager, a3);
}

- (NSMutableArray)clientsDataArray
{
  return self->_clientsDataArray;
}

- (void)setClientsDataArray:(id)a3
{
  objc_storeStrong((id *)&self->_clientsDataArray, a3);
}

- (NSMutableArray)visitClientsDataArray
{
  return self->_visitClientsDataArray;
}

- (void)setVisitClientsDataArray:(id)a3
{
  objc_storeStrong((id *)&self->_visitClientsDataArray, a3);
}

- (void)setLocationManagerState:(int)a3
{
  self->_locationManagerState = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_visitClientsDataArray, 0);
  objc_storeStrong((id *)&self->_clientsDataArray, 0);
  objc_storeStrong((id *)&self->_clLocationManager, 0);
  objc_storeStrong((id *)&self->_latestLocation, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)locationManager:(void *)a1 didFailWithError:.cold.1(void *a1)
{
  void *v1;
  int v2;
  const char *v3;
  __int16 v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 136315394;
  v3 = "-[WiFiLocationManager locationManager:didFailWithError:]";
  v4 = 2112;
  v5 = v1;
  _os_log_error_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: error: %@", (uint8_t *)&v2, 0x16u);

}

+ (void)logLocation:(uint64_t)a1 addPrefixString:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@: Error: location is nil", (uint8_t *)&v1, 0xCu);
}

+ (void)isLocationValid:(uint64_t)a3 uptoSeconds:(uint64_t)a4 requiredAccuracy:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "Error: location is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

+ (void)isLocationValid:(uint64_t)a3 uptoSeconds:(uint64_t)a4 requiredAccuracy:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "Error: location timestamp is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

+ (void)isLocationValid:(uint64_t)a3 uptoSeconds:(uint64_t)a4 requiredAccuracy:(uint64_t)a5 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "Error: locationAge is invalid", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end

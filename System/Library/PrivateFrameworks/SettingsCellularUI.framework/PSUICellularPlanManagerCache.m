@implementation PSUICellularPlanManagerCache

+ (PSUICellularPlanManagerCache)sharedInstance
{
  if (qword_253E970C0 != -1)
    dispatch_once(&qword_253E970C0, &__block_literal_global_20);
  return (PSUICellularPlanManagerCache *)(id)_MergedGlobals_71;
}

- (BOOL)isCellularDisabled
{
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  return !self->_isAnyLocalFlowTypeSupported
      && !-[NSArray count](self->_planItems, "count")
      && -[NSArray count](self->_danglingPlanItems, "count") == 0;
}

void __46__PSUICellularPlanManagerCache_sharedInstance__block_invoke()
{
  PSUICellularPlanManagerCache *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = [PSUICellularPlanManagerCache alloc];
  v1 = objc_alloc(MEMORY[0x24BDC2810]);
  objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("plan_manager_cache"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "initWithQueue:", v5);
  v3 = -[PSUICellularPlanManagerCache initWithCTClient:](v0, "initWithCTClient:", v2);
  v4 = (void *)_MergedGlobals_71;
  _MergedGlobals_71 = v3;

}

- (PSUICellularPlanManagerCache)initWithCTClient:(id)a3
{
  id v5;
  PSUICellularPlanManagerCache *v6;
  PSUICellularPlanManagerCache *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PSUICellularPlanManagerCache;
  v6 = -[PSUICellularPlanManagerCache init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coreTelephonyClient, a3);
    -[CoreTelephonyClient setDelegate:](v7->_coreTelephonyClient, "setDelegate:", v7);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__planInfoDidChange, *MEMORY[0x24BE158B8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, sel__carrierInfoDidChange, *MEMORY[0x24BE158A8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__mcSettingsDidChange, *MEMORY[0x24BE63740], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__mcSettingsDidChange, *MEMORY[0x24BE63B78], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__planInfoDidChange, *MEMORY[0x24BE158E0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel__fetchPlanItemsIfNeeded, *MEMORY[0x24BE158D8], 0);

  }
  return v7;
}

- (void)_fetchPlanItemsIfNeeded
{
  CTCellularPlanItem *selectedPlanItem;
  CTCellularPlanItem **p_selectedPlanItem;
  NSArray *planItems;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  NSObject *v9;
  NSArray *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  NSArray *danglingPlanItems;
  NSObject *v16;
  NSArray *v17;
  void *v18;
  NSArray *v19;
  const char *v20;
  NSArray *plansPendingTransfer;
  NSObject *v22;
  NSObject *v23;
  NSArray *v24;
  void *v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  NSArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  uint64_t v45;
  void *v46;
  NSArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  uint64_t v54;
  _BOOL4 isWebUIFlowSupported;
  void *v56;
  void *v57;
  BOOL v58;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  char *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  uint8_t buf[4];
  const char *v82;
  __int16 v83;
  const __CFString *v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  if (!self->_cacheIsValid)
  {
    p_selectedPlanItem = &self->_selectedPlanItem;
    selectedPlanItem = self->_selectedPlanItem;
    self->_selectedPlanItem = 0;

    planItems = self->_planItems;
    self->_planItems = 0;

    self->_hasSubscriptions = 0;
    self->_shouldShowOldUI = 1;
    *(_DWORD *)&self->_isWebUIFlowSupported = 0;
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "planItemsShouldUpdate:", 0);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_planItems;
    self->_planItems = v7;

    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_planItems;
      *(_DWORD *)buf = 138412290;
      v82 = (const char *)v10;
      _os_log_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEFAULT, "fetched cellular plan items: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if ((v12 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "danglingPlanItemsShouldUpdate:", 0);
      v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
      danglingPlanItems = self->_danglingPlanItems;
      self->_danglingPlanItems = v14;

      -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_danglingPlanItems;
        *(_DWORD *)buf = 138412290;
        v82 = (const char *)v17;
        _os_log_impl(&dword_2161C6000, v16, OS_LOG_TYPE_DEFAULT, "fetched dangling plan items: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0;
    objc_msgSend(v18, "getPlansPendingTransfer:", &v80);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v20 = (const char *)v80;
    plansPendingTransfer = self->_plansPendingTransfer;
    self->_plansPendingTransfer = v19;

    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v20)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v82 = v20;
        _os_log_error_impl(&dword_2161C6000, v23, OS_LOG_TYPE_ERROR, "unable to fetch plans pending transfer with error: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_plansPendingTransfer;
      *(_DWORD *)buf = 138412290;
      v82 = (const char *)v24;
      _os_log_impl(&dword_2161C6000, v23, OS_LOG_TYPE_DEFAULT, "fetched plans pending transfer: %@", buf, 0xCu);
    }
    v63 = (char *)v20;

    v25 = (void *)objc_opt_new();
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v26 = self->_plansPendingTransfer;
    v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v77 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i);
          +[PSUICellularPlanUniversalReference referenceFromCellularPlanPendingTransfer:](PSUICellularPlanUniversalReference, "referenceFromCellularPlanPendingTransfer:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKey:", v31, v32);

        }
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
      }
      while (v28);
    }

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v33 = self->_danglingPlanItems;
    v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v73;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v73 != v36)
            objc_enumerationMutation(v33);
          v38 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j);
          +[PSUICellularPlanUniversalReference referenceFromDanglingPlanItem:](PSUICellularPlanUniversalReference, "referenceFromDanglingPlanItem:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKey:", v38, v39);

        }
        v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
      }
      while (v35);
    }

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v40 = self->_planItems;
    v41 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v69;
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v69 != v43)
            objc_enumerationMutation(v40);
          v45 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k);
          +[PSUICellularPlanUniversalReference referenceFromPlanItem:](PSUICellularPlanUniversalReference, "referenceFromPlanItem:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKey:", v45, v46);

        }
        v42 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
      }
      while (v42);
    }

    objc_storeStrong((id *)&self->_referenceMap, v25);
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v47 = self->_planItems;
    v48 = -[NSArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v65;
      do
      {
        for (m = 0; m != v49; ++m)
        {
          if (*(_QWORD *)v65 != v50)
            objc_enumerationMutation(v47);
          v52 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * m);
          if (objc_msgSend(v52, "isSelected"))
            objc_storeStrong((id *)p_selectedPlanItem, v52);
          if (objc_msgSend(v52, "isBackedByCellularPlan"))
            self->_hasSubscriptions = 1;
        }
        v49 = -[NSArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
      }
      while (v49);
    }

    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "getSupportedFlowTypes");

    self->_shouldShowOldUI = (v54 & 0x8000) == 0;
    isWebUIFlowSupported = v54 & 1;
    self->_isWebUIFlowSupported = v54 & 1;
    self->_isActivationCodeFlowSupported = (v54 & 2) != 0;
    if (v54 == 2)
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v56, "sf_isChinaRegionCellularDevice") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        self->_isSingleActivationCodeFlowSupported = objc_msgSend(v57, "sf_isiPad");

      }
      else
      {
        self->_isSingleActivationCodeFlowSupported = 0;
      }

      isWebUIFlowSupported = self->_isWebUIFlowSupported;
    }
    else
    {
      self->_isSingleActivationCodeFlowSupported = 0;
    }
    self->_isCarrierItemFlowSupported = (v54 & 0x20) != 0;
    if (isWebUIFlowSupported)
      v58 = 1;
    else
      v58 = self->_isActivationCodeFlowSupported || (v54 & 0x20) != 0;
    self->_isAnyLocalFlowTypeSupported = v58;
    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v82 = (const char *)v54;
      _os_log_impl(&dword_2161C6000, v60, OS_LOG_TYPE_DEFAULT, "supported flows: 0x%lx", buf, 0xCu);
    }

    self->_isMultipleDataPlanSupportAvailable = (v54 & 0xFFFFFFFFFFFF7FFFLL) != 0;
    self->_cacheIsValid = 1;
    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v82 = "-[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded]";
      v83 = 2112;
      v84 = CFSTR("PSUICellularPlanChanged");
      _os_log_impl(&dword_2161C6000, v61, OS_LOG_TYPE_DEFAULT, "%s posting notification %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "postNotificationName:object:userInfo:", CFSTR("PSUICellularPlanChanged"), 0, 0);

  }
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("PlanManagerCache"));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSUICellularPlanManagerCache;
  -[PSUICellularPlanManagerCache dealloc](&v4, sel_dealloc);
}

- (void)_mcSettingsDidChange
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Querying due to MCEffectiveSettingsChangedNotification or MCProfileListChangedNotification", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__PSUICellularPlanManagerCache__mcSettingsDidChange__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __52__PSUICellularPlanManagerCache__mcSettingsDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_planInfoDidChange");
}

- (void)_planInfoDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Querying due to CTCellularPlanInfoDidChangeNotification", v4, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&planCacheLock);
  -[PSUICellularPlanManagerCache _invalidatePlanItemsCache](self, "_invalidatePlanItemsCache");
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  os_unfair_lock_unlock((os_unfair_lock_t)&planCacheLock);
}

- (void)_invalidatePlanItemsCache
{
  CTCellularPlanItem *selectedPlanItem;
  NSArray *planItems;
  NSArray *danglingPlanItems;
  NSArray *plansPendingTransfer;
  NSDictionary *referenceMap;
  CTDisplayPlanList *cachedRemotePlans;

  self->_cacheIsValid = 0;
  selectedPlanItem = self->_selectedPlanItem;
  self->_selectedPlanItem = 0;

  planItems = self->_planItems;
  self->_planItems = 0;

  danglingPlanItems = self->_danglingPlanItems;
  self->_danglingPlanItems = 0;

  plansPendingTransfer = self->_plansPendingTransfer;
  self->_plansPendingTransfer = 0;

  referenceMap = self->_referenceMap;
  self->_referenceMap = 0;

  cachedRemotePlans = self->_cachedRemotePlans;
  self->_cachedRemotePlans = 0;

  self->_remoteListFetchCompleted = 0;
}

- (void)_carrierInfoDidChange
{
  NSObject *v3;
  NSArray *cachedCarrierItems;
  id v5;
  uint8_t v6[16];

  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Querying due to CTCarrierInfoDidChangeNotification", v6, 2u);
  }

  cachedCarrierItems = self->_cachedCarrierItems;
  self->_cachedCarrierItems = 0;

  self->_carrierListFetchInProgress = 0;
  v5 = -[PSUICellularPlanManagerCache carrierItems](self, "carrierItems");
}

- (BOOL)shouldShowAddPlan
{
  return self->_isAnyLocalFlowTypeSupported;
}

- (NSArray)planItems
{
  NSObject *v3;
  NSUInteger v4;
  int v6;
  NSUInteger v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSArray count](self->_planItems, "count");
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%lu plan items exist", (uint8_t *)&v6, 0xCu);
  }

  return self->_planItems;
}

- (NSArray)embeddedPlanItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PSUICellularPlanManagerCache planItems](self, "planItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "type") == 2 || objc_msgSend(v9, "type") == 3)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)danglingPlanItems
{
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  return self->_danglingPlanItems;
}

- (NSArray)plansPendingTransfer
{
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  return self->_plansPendingTransfer;
}

- (id)planFromReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  -[NSDictionary objectForKey:](self->_referenceMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForKey:](self->_referenceMap, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v10;
      v15 = 2114;
      v16 = v12;
      _os_log_error_impl(&dword_2161C6000, v7, OS_LOG_TYPE_ERROR, "The referenced plan is an object of the class %@, expected an object of the class %{public}@", (uint8_t *)&v13, 0x16u);

    }
    v6 = 0;
  }

  return v6;
}

- (id)danglingPlanFromReference:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  -[NSDictionary objectForKey:](self->_referenceMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v10;
    v15 = 2114;
    v16 = v12;
    _os_log_error_impl(&dword_2161C6000, v6, OS_LOG_TYPE_ERROR, "The referenced plan is an object of the class %@, expected an object of the class %{public}@", (uint8_t *)&v13, 0x16u);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    -[NSDictionary objectForKey:](self->_referenceMap, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)planPendingTransferFromReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  -[NSDictionary objectForKey:](self->_referenceMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForKey:](self->_referenceMap, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v10;
      v15 = 2114;
      v16 = v12;
      _os_log_error_impl(&dword_2161C6000, v7, OS_LOG_TYPE_ERROR, "The referenced plan is an object of the class %@, expected an object of the class %{public}@", (uint8_t *)&v13, 0x16u);

    }
    v6 = 0;
  }

  return v6;
}

- (id)planFromReferenceSafe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  -[NSDictionary objectForKey:](self->_referenceMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForKey:](self->_referenceMap, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v10;
      v15 = 2114;
      v16 = v12;
      _os_log_error_impl(&dword_2161C6000, v7, OS_LOG_TYPE_ERROR, "The referenced plan is an object of the class %@, expected an object of the class %{public}@", (uint8_t *)&v13, 0x16u);

    }
    v6 = 0;
  }

  return v6;
}

- (CTCellularPlanItem)selectedPlanItem
{
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  return self->_selectedPlanItem;
}

- (void)setSelectedPlanItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Can't activate nil plan", buf, 2u);
    }
    goto LABEL_14;
  }
  if ((objc_msgSend(v4, "isSelected") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didSelectPlanItem:isEnable:", v5, 1);
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v7;
        _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Failed to select the plan: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didSelectPlanForData:", v5);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v10;
        _os_log_impl(&dword_2161C6000, v11, OS_LOG_TYPE_DEFAULT, "Failed to make plan active data plan: %@", buf, 0xCu);
      }

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__PSUICellularPlanManagerCache_setSelectedPlanItem___block_invoke;
    block[3] = &unk_24D501660;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

LABEL_14:
  }

}

uint64_t __52__PSUICellularPlanManagerCache_setSelectedPlanItem___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidatePlanItemsCache");
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPlanItemsIfNeeded");
}

- (void)setSelectedPlanItemForData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Can't set nil plan for data", buf, 2u);
    }
    goto LABEL_10;
  }
  if ((objc_msgSend(v4, "isActiveDataPlan") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didSelectPlanForData:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v7;
        _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Failed to make plan active data plan: %@", buf, 0xCu);
      }

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__PSUICellularPlanManagerCache_setSelectedPlanItemForData___block_invoke;
    block[3] = &unk_24D501660;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
LABEL_10:

  }
}

uint64_t __59__PSUICellularPlanManagerCache_setSelectedPlanItemForData___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidatePlanItemsCache");
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPlanItemsIfNeeded");
}

- (void)didSelectDanglingPlan:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Selected dangling plan item: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolveSimLabel:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v4;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Failed to resolve SIM label for plan: %@ with error:%@", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (BOOL)isMultipleDataPlanSupportAvailable
{
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isMultipleDataPlanSupportAvailable)
      v4 = CFSTR("is");
    else
      v4 = CFSTR("is not");
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Multiple data plan support %@ available", (uint8_t *)&v6, 0xCu);
  }

  return self->_isMultipleDataPlanSupportAvailable;
}

- (BOOL)hasSubscriptions
{
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_hasSubscriptions)
      v4 = CFSTR("Some plan item is backed by a cellular plan");
    else
      v4 = CFSTR("No plan item is backed by a cellular plan");
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }

  return self->_hasSubscriptions;
}

- (BOOL)shouldShowAccountSetup
{
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  return !-[NSArray count](self->_planItems, "count") && self->_isMultipleDataPlanSupportAvailable;
}

- (BOOL)isSelectedPlanActivating
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanManagerCache selectedPlanItem](self, "selectedPlanItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isBackedByCellularPlan"))
  {
    objc_msgSend(v3, "plan");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "status") == 2;

  }
  else
  {
    v5 = 0;
  }
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("is not");
    if (v5)
      v7 = CFSTR("is");
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "Selected plan item %@ activating", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (BOOL)isAnyPlanActivating
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const __CFString *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PSUICellularPlanManagerCache planItems](self, "planItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v7, "isBackedByCellularPlan"))
        {
          objc_msgSend(v7, "plan");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "status");

          if (v9 == 2)
          {
            LODWORD(v4) = 1;
            goto LABEL_12;
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("No plan is activating");
    if ((_DWORD)v4)
      v11 = CFSTR("Some plan is activating");
    *(_DWORD *)buf = 138412290;
    v18 = v11;
    _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  return v4;
}

- (BOOL)shouldShowPlanSelector
{
  void *v3;
  BOOL v4;

  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  if (!self->_isMultipleDataPlanSupportAvailable || !self->_hasSubscriptions)
    return 0;
  -[PSUICellularPlanManagerCache selectedPlanItem](self, "selectedPlanItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)shouldShowOldUI
{
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("YES");
    if (!self->_shouldShowOldUI)
      v4 = CFSTR("NO");
    v6 = 136315394;
    v7 = "-[PSUICellularPlanManagerCache shouldShowOldUI]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  return self->_shouldShowOldUI;
}

- (BOOL)shouldShowNewUI
{
  return !-[PSUICellularPlanManagerCache shouldShowOldUI](self, "shouldShowOldUI");
}

- (BOOL)isAnyLocalFlowTypeSupported
{
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("YES");
    if (!self->_isAnyLocalFlowTypeSupported)
      v4 = CFSTR("NO");
    v6 = 136315394;
    v7 = "-[PSUICellularPlanManagerCache isAnyLocalFlowTypeSupported]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  return self->_isAnyLocalFlowTypeSupported;
}

- (BOOL)isWebUIFlowSupported
{
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("YES");
    if (!self->_isWebUIFlowSupported)
      v4 = CFSTR("NO");
    v6 = 136315394;
    v7 = "-[PSUICellularPlanManagerCache isWebUIFlowSupported]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  return self->_isWebUIFlowSupported;
}

- (BOOL)isActivationCodeFlowSupported
{
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("YES");
    if (!self->_isActivationCodeFlowSupported)
      v4 = CFSTR("NO");
    v6 = 136315394;
    v7 = "-[PSUICellularPlanManagerCache isActivationCodeFlowSupported]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  return self->_isActivationCodeFlowSupported;
}

- (BOOL)isSingleActivationCodeFlowSupported
{
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("YES");
    if (!self->_isSingleActivationCodeFlowSupported)
      v4 = CFSTR("NO");
    v6 = 136315394;
    v7 = "-[PSUICellularPlanManagerCache isSingleActivationCodeFlowSupported]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  return self->_isSingleActivationCodeFlowSupported;
}

- (BOOL)isCarrierItemFlowSupported
{
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded](self, "_fetchPlanItemsIfNeeded");
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("YES");
    if (!self->_isCarrierItemFlowSupported)
      v4 = CFSTR("NO");
    v6 = 136315394;
    v7 = "-[PSUICellularPlanManagerCache isCarrierItemFlowSupported]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  return self->_isCarrierItemFlowSupported;
}

- (CTDisplayPlanList)pendingInstallPlans
{
  NSObject *v3;
  CTDisplayPlanList *cachedPendingInstallPlans;
  CoreTelephonyClient *coreTelephonyClient;
  _QWORD v7[5];
  id v8;
  _BYTE buf[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[PSUICellularPlanManagerCache pendingInstallPlans]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  cachedPendingInstallPlans = self->_cachedPendingInstallPlans;
  if (!cachedPendingInstallPlans)
  {
    if (self->_pendingInstallPlanFetchInProgress)
      return (CTDisplayPlanList *)0;
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    self->_pendingInstallPlanFetchInProgress = 1;
    coreTelephonyClient = self->_coreTelephonyClient;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__PSUICellularPlanManagerCache_pendingInstallPlans__block_invoke;
    v7[3] = &unk_24D502660;
    objc_copyWeak(&v8, (id *)buf);
    v7[4] = self;
    -[CoreTelephonyClient plansPendingInstallWithCompletion:](coreTelephonyClient, "plansPendingInstallWithCompletion:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
    cachedPendingInstallPlans = self->_cachedPendingInstallPlans;
  }
  return cachedPendingInstallPlans;
}

void __51__PSUICellularPlanManagerCache_pendingInstallPlans__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD block[5];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setPendingInstallPlanFetchInProgress:", 0);

  if (!v5 || v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_2161C6000, v11, OS_LOG_TYPE_DEFAULT, "Failed to fetch pending install items with error: %@", buf, 0xCu);
    }

    v8 = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = v8;
    v10 = 0;
  }
  else
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = v8;
    v10 = v5;
  }
  objc_msgSend(v8, "setCachedPendingInstallPlans:", v10);

  v12 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v12, "cachedPendingInstallPlans");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__PSUICellularPlanManagerCache_pendingInstallPlans__block_invoke_74;
    block[3] = &unk_24D501660;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __51__PSUICellularPlanManagerCache_pendingInstallPlans__block_invoke_74(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315394;
    v4 = "-[PSUICellularPlanManagerCache pendingInstallPlans]_block_invoke";
    v5 = 2112;
    v6 = CFSTR("PSUICellularPlanChanged");
    _os_log_impl(&dword_2161C6000, v1, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v3, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("PSUICellularPlanChanged"), 0, 0);

}

- (CTDisplayPlanList)remotePlans
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v8;
  CoreTelephonyClient *coreTelephonyClient;
  _QWORD v10[5];
  id v11;
  id location;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[PSUICellularPlanManagerCache remotePlans]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (self->_remoteListFetchCompleted || self->_remoteListFetchInProgress)
  {
    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[CTDisplayPlanList plans](self->_cachedRemotePlans, "plans");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134217984;
      v14 = (const char *)v6;
      _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "%lu remote items exist", buf, 0xCu);

    }
  }
  else if (self->_isCarrierItemFlowSupported)
  {
    location = 0;
    objc_initWeak(&location, self);
    self->_remoteListFetchInProgress = 1;
    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[PSUICellularPlanManagerCache remotePlans]";
      _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s fetching add on plans", buf, 0xCu);
    }

    coreTelephonyClient = self->_coreTelephonyClient;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __43__PSUICellularPlanManagerCache_remotePlans__block_invoke;
    v10[3] = &unk_24D502688;
    objc_copyWeak(&v11, &location);
    v10[4] = self;
    -[CoreTelephonyClient getRemoteDevices:](coreTelephonyClient, "getRemoteDevices:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return self->_cachedRemotePlans;
}

void __43__PSUICellularPlanManagerCache_remotePlans__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  id v19;
  id *v20;
  id v21;
  NSObject *v22;
  id v23;
  int v24;
  id v25;
  void *v26;
  char v27;
  void *v28;
  id v29;
  void *v30;
  id *location;
  id v32;
  void *v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD block[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v32 = a3;
  location = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setRemoteListFetchInProgress:", 0);

  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v33 = v5;
  objc_msgSend(v5, "devices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v36)
  {
    v35 = *(_QWORD *)v44;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v44 != v35)
          objc_enumerationMutation(obj);
        v37 = v8;
        v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 32), "getLogger");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "deviceID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v49 = v11;
          _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "Remote device => %@", buf, 0xCu);

        }
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v9, "remoteDisplayPlans");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v40 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              objc_msgSend(*(id *)(a1 + 32), "getLogger");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v49 = v17;
                _os_log_impl(&dword_2161C6000, v18, OS_LOG_TYPE_DEFAULT, "Remote device plan => %@", buf, 0xCu);
              }

              objc_msgSend(v7, "addObject:", v17);
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v14);
        }

        v8 = v37 + 1;
      }
      while (v37 + 1 != v36);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v36);
  }

  if (v32 || !v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v22 = objc_claimAutoreleasedReturnValue();
    v20 = (id *)(a1 + 40);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v32;
      _os_log_impl(&dword_2161C6000, v22, OS_LOG_TYPE_DEFAULT, "Failed to fetch addon items with error: %@", buf, 0xCu);
    }

    v19 = objc_loadWeakRetained(location);
    objc_msgSend(v19, "setCachedRemotePlans:", 0);
  }
  else
  {
    v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDC2738]), "initWithDisplayPlans:", v7);
    v20 = (id *)(a1 + 40);
    v21 = objc_loadWeakRetained(location);
    objc_msgSend(v21, "setCachedRemotePlans:", v19);

  }
  v23 = objc_loadWeakRetained(v20);
  objc_msgSend(v23, "setRemoteListFetchCompleted:", 1);

  v24 = _os_feature_enabled_impl();
  v25 = objc_loadWeakRetained(v20);
  v26 = v25;
  if (v24)
  {
    v27 = objc_msgSend(v25, "remoteListFetchCompleted");

    if ((v27 & 1) == 0)
      goto LABEL_31;
  }
  else
  {
    objc_msgSend(v25, "cachedCarrierItems");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {

    }
    else
    {
      v29 = objc_loadWeakRetained(v20);
      objc_msgSend(v29, "cachedRemotePlans");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        goto LABEL_31;
    }
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__PSUICellularPlanManagerCache_remotePlans__block_invoke_79;
  block[3] = &unk_24D501660;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
LABEL_31:

}

void __43__PSUICellularPlanManagerCache_remotePlans__block_invoke_79(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315394;
    v4 = "-[PSUICellularPlanManagerCache remotePlans]_block_invoke";
    v5 = 2112;
    v6 = CFSTR("PSUICellularPlanChanged");
    _os_log_impl(&dword_2161C6000, v1, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v3, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("PSUICellularPlanChanged"), 0, 0);

}

- (NSArray)carrierItems
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSUInteger v6;
  _QWORD v8[5];
  id v9;
  id location;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!self->_cachedCarrierItems && !self->_carrierListFetchInProgress && self->_isCarrierItemFlowSupported)
  {
    location = 0;
    objc_initWeak(&location, self);
    self->_carrierListFetchInProgress = 1;
    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[PSUICellularPlanManagerCache carrierItems]";
      _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s fetching carrier items", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__PSUICellularPlanManagerCache_carrierItems__block_invoke;
    v8[3] = &unk_24D5026B0;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    objc_msgSend(v4, "carrierItemsShouldUpdate:completion:", 0, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[NSArray count](self->_cachedCarrierItems, "count");
    *(_DWORD *)buf = 134217984;
    v12 = (const char *)v6;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%lu carrier items exist", buf, 0xCu);
  }

  return self->_cachedCarrierItems;
}

void __44__PSUICellularPlanManagerCache_carrierItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  int v13;
  _QWORD block[5];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCarrierListFetchInProgress:", 0);

  if (!v5 || v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_error_impl(&dword_2161C6000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch carrier items with error: %@", buf, 0xCu);
    }

    v8 = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = v8;
    v10 = (id)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = v8;
    v10 = v5;
  }
  objc_msgSend(v8, "setCachedCarrierItems:", v10);

  v12 = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = objc_msgSend(v12, "remoteListFetchCompleted");

  if (v13)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__PSUICellularPlanManagerCache_carrierItems__block_invoke_81;
    block[3] = &unk_24D501660;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __44__PSUICellularPlanManagerCache_carrierItems__block_invoke_81(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315394;
    v4 = "-[PSUICellularPlanManagerCache carrierItems]_block_invoke";
    v5 = 2112;
    v6 = CFSTR("PSUICellularPlanChanged");
    _os_log_impl(&dword_2161C6000, v1, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v3, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("PSUICellularPlanChanged"), 0, 0);

}

- (void)clearCachedCarrierItemsAndRemotePlans
{
  NSArray *cachedCarrierItems;
  CTDisplayPlanList *cachedRemotePlans;

  cachedCarrierItems = self->_cachedCarrierItems;
  self->_cachedCarrierItems = 0;

  cachedRemotePlans = self->_cachedRemotePlans;
  self->_cachedRemotePlans = 0;

  self->_remoteListFetchCompleted = 0;
}

- (id)predefinedLabels
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPredefinedLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || !objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15918]), "initWithLabel:", CFSTR("Primary"));
    v12[0] = v4;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15918]), "initWithLabel:", CFSTR("Secondary"));
    v12[1] = v5;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15918]), "initWithLabel:", CFSTR("Personal"));
    v12[2] = v6;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15918]), "initWithLabel:", CFSTR("Business"));
    v12[3] = v7;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15918]), "initWithLabel:", CFSTR("Travel"));
    v12[4] = v8;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15918]), "initWithLabel:", CFSTR("Cellular Data"));
    v12[5] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 6);
    v10 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v10;
  }
  return v3;
}

- (void)setLabel:(id)a3 forPlan:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Setting label: %@ for plan item: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLabelForPlan:label:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v10;
      _os_log_error_impl(&dword_2161C6000, v11, OS_LOG_TYPE_ERROR, "Failed to set label for plan: %@ with error: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  else
  {
    -[PSUICellularPlanManagerCache _invalidatePlanItemsCache](self, "_invalidatePlanItemsCache");
  }

}

- (id)subscriptionContextForPlanItem:(id)a3 cachedSubscriptionContexts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  id v21;
  id v23;
  PSUICellularPlanManagerCache *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subscriptionContexts");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getSubscriptionContextUUIDforPlan:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v23 = v6;
    v24 = self;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = v7;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v16, "uuid", v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "UUIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v10, "isEqualToString:", v18);

          if (v19)
          {
            -[PSUICellularPlanManagerCache getLogger](v24, "getLogger");
            v20 = objc_claimAutoreleasedReturnValue();
            v6 = v23;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v31 = v23;
              v32 = 2112;
              v33 = v16;
              _os_log_impl(&dword_2161C6000, v20, OS_LOG_TYPE_DEFAULT, "plan item: %@, context: %@", buf, 0x16u);
            }

            v21 = v16;
            goto LABEL_21;
          }
        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v13)
          continue;
        break;
      }
    }

    -[PSUICellularPlanManagerCache getLogger](v24, "getLogger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 0;
      v6 = v23;
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138412546;
    v6 = v23;
    v31 = v23;
    v32 = 2112;
    v33 = 0;
    goto LABEL_19;
  }
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v6;
    v32 = 2112;
    v33 = 0;
LABEL_19:
    _os_log_impl(&dword_2161C6000, v11, OS_LOG_TYPE_DEFAULT, "plan item: %@, context: %@", buf, 0x16u);
  }
  v21 = 0;
LABEL_21:

  return v21;
}

- (void)didEnablePlanItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didEnablePlanItems:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_2161C6000, v7, OS_LOG_TYPE_ERROR, "Enabling plans: %@, error: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (BOOL)isUsingBootstrapDataService
{
  CoreTelephonyClient *coreTelephonyClient;
  void *v4;
  id v5;
  NSObject *v6;
  char v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  coreTelephonyClient = self->_coreTelephonyClient;
  v9 = 0;
  -[CoreTelephonyClient usingBootstrapDataService:](coreTelephonyClient, "usingBootstrapDataService:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5)
  {
    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_2161C6000, v6, OS_LOG_TYPE_ERROR, "usingBootstrapDataService failed:%@", buf, 0xCu);
    }

  }
  v7 = objc_msgSend(v4, "BOOLValue");

  return v7;
}

- (BOOL)isBootstrapRecommended
{
  CoreTelephonyClient *coreTelephonyClient;
  void *v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  coreTelephonyClient = self->_coreTelephonyClient;
  v9 = 0;
  -[CoreTelephonyClient getBootstrapState:](coreTelephonyClient, "getBootstrapState:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5)
  {
    -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_2161C6000, v6, OS_LOG_TYPE_ERROR, "isBootstrapRecommended failed:%@", buf, 0xCu);
    }

    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v4, "bootstrapStatus") == 2;
  }

  return v7;
}

- (BOOL)isCarrierItemBeingFetched
{
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_carrierListFetchInProgress)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "_carrierListFetchInProgress: %@", (uint8_t *)&v6, 0xCu);
  }

  return self->_carrierListFetchInProgress;
}

- (void)plansDidUpdate:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[PSUICellularPlanManagerCache getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "CTDisplayPlanList: %@", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(v5, "plans");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8
    && (objc_msgSend(v5, "plans"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isPendingInstallPlan"),
        v10,
        v9,
        (v11 & 1) == 0))
  {
    objc_msgSend(v5, "plans");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isAddOnPurchasablePlan");

    if (!v15)
      goto LABEL_7;
    v12 = 80;
  }
  else
  {
    v12 = 88;
  }
  objc_storeStrong((id *)((char *)&self->super.isa + v12), a3);
LABEL_7:
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_98);

}

void __47__PSUICellularPlanManagerCache_plansDidUpdate___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:", CFSTR("PSUICellularPlanChanged"), 0, 0);

}

- (BOOL)remoteListFetchCompleted
{
  return self->_remoteListFetchCompleted;
}

- (void)setRemoteListFetchCompleted:(BOOL)a3
{
  self->_remoteListFetchCompleted = a3;
}

- (NSArray)cachedCarrierItems
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCachedCarrierItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CTDisplayPlanList)cachedRemotePlans
{
  return (CTDisplayPlanList *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCachedRemotePlans:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CTDisplayPlanList)cachedPendingInstallPlans
{
  return (CTDisplayPlanList *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCachedPendingInstallPlans:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)carrierListFetchInProgress
{
  return self->_carrierListFetchInProgress;
}

- (void)setCarrierListFetchInProgress:(BOOL)a3
{
  self->_carrierListFetchInProgress = a3;
}

- (BOOL)remoteListFetchInProgress
{
  return self->_remoteListFetchInProgress;
}

- (void)setRemoteListFetchInProgress:(BOOL)a3
{
  self->_remoteListFetchInProgress = a3;
}

- (BOOL)pendingInstallPlanFetchInProgress
{
  return self->_pendingInstallPlanFetchInProgress;
}

- (void)setPendingInstallPlanFetchInProgress:(BOOL)a3
{
  self->_pendingInstallPlanFetchInProgress = a3;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_cachedPendingInstallPlans, 0);
  objc_storeStrong((id *)&self->_cachedRemotePlans, 0);
  objc_storeStrong((id *)&self->_cachedCarrierItems, 0);
  objc_storeStrong((id *)&self->_selectedPlanItem, 0);
  objc_storeStrong((id *)&self->_referenceMap, 0);
  objc_storeStrong((id *)&self->_plansPendingTransfer, 0);
  objc_storeStrong((id *)&self->_danglingPlanItems, 0);
  objc_storeStrong((id *)&self->_planItems, 0);
}

@end

@implementation REElementDataSourceController

- (REElementDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setState:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (self->_state != a3)
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __42__REElementDataSourceController_setState___block_invoke;
    v6[3] = &unk_24CF8AD38;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(queue, v6);
    self->_state = a3;
  }
}

- (void)setAllowsLocationUse:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__REElementDataSourceController_setAllowsLocationUse___block_invoke;
  v4[3] = &unk_24CF8B678;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (REElementDataSourceController)initWithRelevanceEngine:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  REElementDataSourceController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[REElementDataSourceController _initWithRelevanceEngine:dataSourceClass:dataSource:](self, "_initWithRelevanceEngine:dataSourceClass:dataSource:", v7, objc_opt_class(), v6);

  return v8;
}

- (id)_initWithRelevanceEngine:(id)a3 dataSourceClass:(Class)a4 dataSource:(id)a5
{
  id v8;
  REElementDataSourceController *v9;
  REElementDataSourceController *v10;
  uint64_t v11;
  NSMutableArray *enqueuedBlocks;
  void *v13;
  uint64_t v14;
  NSMutableSet *dataSourceElements;
  uint64_t v16;
  NSMutableDictionary *dataSourceElementIdentifierMap;
  uint64_t v18;
  NSMutableDictionary *dataSourceElementSectionMap;
  uint64_t v20;
  NSMutableArray *updates;
  dispatch_qos_class_t v22;
  void *v23;
  void *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *queue;
  NSObject *v27;
  NSObject *v28;
  int v29;
  OS_dispatch_queue *v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  REUpNextScheduler *updateScheduler;
  OS_dispatch_queue *v35;
  double v36;
  uint64_t v37;
  REUpNextScheduler *reloadScheduler;
  NSObject *v39;
  NSString *loggingHeader;
  void *v41;
  void *v42;
  void *v43;
  REElementDataSource *v44;
  REElementDataSource *dataSource;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  NSSet *supportedSections;
  void *v54;
  void *v55;
  uint64_t v56;
  RERelevanceProviderEnvironment *providerEnvironment;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  RERelevanceProviderEnvironment *v64;
  REContentRelevanceProvider *v65;
  uint64_t v66;
  NSArray *contentAttributes;
  void *v68;
  void *v69;
  void *v71;
  NSObject *attr;
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  dispatch_qos_class_t v80;
  _QWORD v81[4];
  id v82;
  id location;
  objc_super v84;
  uint8_t buf[4];
  NSString *v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v74 = a5;
  v84.receiver = self;
  v84.super_class = (Class)REElementDataSourceController;
  v9 = -[REElementDataSourceController init](&v84, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_state = 1;
    v9->_isPerformingReload = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    enqueuedBlocks = v10->_enqueuedBlocks;
    v10->_enqueuedBlocks = (NSMutableArray *)v11;

    *(_WORD *)&v10->_willUnload = 0;
    v10->_wantsReloadWhilePaused = 0;
    objc_storeWeak((id *)&v10->_relevanceEngine, v8);
    objc_msgSend(v8, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_disableAutomaticContentManagement = objc_msgSend(v13, "disableAutomaticContentManagement");

    objc_storeStrong((id *)&v10->_dataSourceClass, a4);
    -[REElementDataSourceController _loadLoggingHeader](v10, "_loadLoggingHeader");
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    dataSourceElements = v10->_dataSourceElements;
    v10->_dataSourceElements = (NSMutableSet *)v14;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    dataSourceElementIdentifierMap = v10->_dataSourceElementIdentifierMap;
    v10->_dataSourceElementIdentifierMap = (NSMutableDictionary *)v16;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    dataSourceElementSectionMap = v10->_dataSourceElementSectionMap;
    v10->_dataSourceElementSectionMap = (NSMutableDictionary *)v18;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    updates = v10->_updates;
    v10->_updates = (NSMutableArray *)v20;

    v10->_contentMode = -[objc_class elementContentMode](a4, "elementContentMode");
    v22 = -[REElementDataSourceController _defaultDataSourceQOS](v10, "_defaultDataSourceQOS");
    v23 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromClass(a4);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("com.apple.relevanceengine.%@Controller"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_queue_attr_make_with_qos_class(0, v22, 0);
    attr = objc_claimAutoreleasedReturnValue();
    v73 = objc_retainAutorelease(v24);
    v25 = dispatch_queue_create((const char *)objc_msgSend(v73, "UTF8String"), attr);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v25;

    if ((-[objc_class wantsPrivateQueue](a4, "wantsPrivateQueue") & 1) == 0)
    {
      if (_initWithRelevanceEngine_dataSourceClass_dataSource__onceToken != -1)
        dispatch_once(&_initWithRelevanceEngine_dataSourceClass_dataSource__onceToken, &__block_literal_global_10);
      v27 = v10->_queue;
      objc_msgSend((id)_initWithRelevanceEngine_dataSourceClass_dataSource__QueuePool, "nextAvailableQueue");
      v28 = objc_claimAutoreleasedReturnValue();
      dispatch_set_target_queue(v27, v28);

    }
    v29 = objc_msgSend(v8, "wantsImmutableContent");
    objc_initWeak(&location, v10);
    v30 = v10->_queue;
    if (v29)
      v31 = 0.0;
    else
      v31 = 0.1;
    v32 = MEMORY[0x24BDAC760];
    v81[0] = MEMORY[0x24BDAC760];
    v81[1] = 3221225472;
    v81[2] = __85__REElementDataSourceController__initWithRelevanceEngine_dataSourceClass_dataSource___block_invoke_2;
    v81[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v82, &location);
    +[REUpNextScheduler schedulerWithQueue:delay:updateBlock:](REUpNextScheduler, "schedulerWithQueue:delay:updateBlock:", v30, v81, v31);
    v33 = objc_claimAutoreleasedReturnValue();
    updateScheduler = v10->_updateScheduler;
    v10->_updateScheduler = (REUpNextScheduler *)v33;

    v35 = v10->_queue;
    if (v29)
      v36 = 0.0;
    else
      v36 = 0.05;
    v78[0] = v32;
    v78[1] = 3221225472;
    v78[2] = __85__REElementDataSourceController__initWithRelevanceEngine_dataSourceClass_dataSource___block_invoke_3;
    v78[3] = &unk_24CF8B5D8;
    objc_copyWeak(&v79, &location);
    v80 = v22;
    +[REUpNextScheduler schedulerWithQueue:delay:updateBlock:](REUpNextScheduler, "schedulerWithQueue:delay:updateBlock:", v35, v78, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    reloadScheduler = v10->_reloadScheduler;
    v10->_reloadScheduler = (REUpNextScheduler *)v37;

    if (-[objc_class wantsReloadForSignificantTimeChange](a4, "wantsReloadForSignificantTimeChange"))
    {
      RELogForDomain(2);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        loggingHeader = v10->_loggingHeader;
        *(_DWORD *)buf = 138412290;
        v86 = loggingHeader;
        _os_log_impl(&dword_2132F7000, v39, OS_LOG_TYPE_DEFAULT, "%@ wantsReloadForSignificantTimeChange", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      RESignificantTimeChangeNotification();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObserver:selector:name:object:", v10, sel__handleSignifiantTimeChange_, v42, 0);

    }
    v10->_hasDataAvailable = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObserver:selector:name:object:", v10, sel__handleDeviceLockStateChange_, CFSTR("REDeviceLockStateChangedNotification"), 0);

    if (v74)
      v44 = (REElementDataSource *)v74;
    else
      v44 = (REElementDataSource *)objc_opt_new();
    dataSource = v10->_dataSource;
    v10->_dataSource = v44;

    -[REElementDataSource setDelegate:](v10->_dataSource, "setDelegate:", v10);
    -[REElementDataSource setUnlockedSinceBoot:](v10->_dataSource, "setUnlockedSinceBoot:", REDeviceUnlockedSinceBoot());
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)MEMORY[0x24BDBCF20];
    -[REElementDataSource supportedSections](v10->_dataSource, "supportedSections");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setWithArray:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v75[0] = v32;
    v75[1] = 3221225472;
    v75[2] = __85__REElementDataSourceController__initWithRelevanceEngine_dataSourceClass_dataSource___block_invoke_48;
    v75[3] = &unk_24CF8B600;
    v50 = v49;
    v76 = v50;
    v51 = v46;
    v77 = v51;
    objc_msgSend(v8, "enumerateSectionDescriptorsWithOptions:includeHistoric:usingBlock:", 0, 0, v75);
    v52 = objc_msgSend(v51, "copy");
    supportedSections = v10->_supportedSections;
    v10->_supportedSections = (NSSet *)v52;

    objc_msgSend(v8, "coordinator");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "elementRelevanceEngine");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "relevanceProviderEnvironment");
    v56 = objc_claimAutoreleasedReturnValue();
    providerEnvironment = v10->_providerEnvironment;
    v10->_providerEnvironment = (RERelevanceProviderEnvironment *)v56;

    v64 = v10->_providerEnvironment;
    if (!v64)
    {
      RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Provider environment should't be nil"), v58, v59, v60, v61, v62, v63, (uint64_t)v71);
      v64 = v10->_providerEnvironment;
    }
    v65 = -[REContentRelevanceProvider initWithContent:]([REContentRelevanceProvider alloc], "initWithContent:", &stru_24CF92178);
    v10->_supportsContentRelevance = -[RERelevanceProviderEnvironment isSupportedRelevanceProvider:](v64, "isSupportedRelevanceProvider:", v65);

    -[objc_class contentAttributes](a4, "contentAttributes");
    v66 = objc_claimAutoreleasedReturnValue();
    contentAttributes = v10->_contentAttributes;
    v10->_contentAttributes = (NSArray *)v66;

    if (!-[NSArray count](v10->_contentAttributes, "count"))
      v10->_supportsContentRelevance = 0;
    objc_msgSend(v8, "logger");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "addLoggable:", v10);

    objc_msgSend(v8, "logger");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addLoggable:", v10->_dataSource);

    objc_destroyWeak(&v79);
    objc_destroyWeak(&v82);
    objc_destroyWeak(&location);

  }
  return v10;
}

- (unsigned)_defaultDataSourceQOS
{
  if (-[objc_class drivenByUserInteraction](self->_dataSourceClass, "drivenByUserInteraction"))
    return 25;
  else
    return 17;
}

- (void)_loadLoggingHeader
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *loggingHeader;
  id v8;

  NSStringFromClass(self->_dataSourceClass);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("RE"), &stru_24CF92178, 0, 0, objc_msgSend(v8, "length"));
  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("NTK"), &stru_24CF92178, 1, 0, objc_msgSend(v8, "length"));
  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("UpNext"), &stru_24CF92178, 1, 0, objc_msgSend(v8, "length"));
  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("DataSource"), &stru_24CF92178, 1, 0, objc_msgSend(v8, "length"));
  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("Watch"), &stru_24CF92178, 1, 0, objc_msgSend(v8, "length"));
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v8, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("[DSC: %@]"), v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  loggingHeader = self->_loggingHeader;
  self->_loggingHeader = v6;

}

uint64_t __54__REElementDataSourceController_setAllowsLocationUse___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 145) != v2)
  {
    *(_BYTE *)(v1 + 145) = v2;
    return objc_msgSend(*(id *)(result + 32), "_queue_updateDataSourceLocationUse");
  }
  return result;
}

- (REElementDataSourceController)initWithRelevanceEngine:(id)a3 dataSourceClass:(Class)a4
{
  return (REElementDataSourceController *)-[REElementDataSourceController _initWithRelevanceEngine:dataSourceClass:dataSource:](self, "_initWithRelevanceEngine:dataSourceClass:dataSource:", a3, a4, 0);
}

void __85__REElementDataSourceController__initWithRelevanceEngine_dataSourceClass_dataSource___block_invoke()
{
  REDispatchQueuePool *v0;
  void *v1;

  v0 = -[REDispatchQueuePool initWithQueueCount:prefix:]([REDispatchQueuePool alloc], "initWithQueueCount:prefix:", 2, CFSTR("com.apple.RelevanceEngine.DataSourceController"));
  v1 = (void *)_initWithRelevanceEngine_dataSourceClass_dataSource__QueuePool;
  _initWithRelevanceEngine_dataSourceClass_dataSource__QueuePool = (uint64_t)v0;

}

void __85__REElementDataSourceController__initWithRelevanceEngine_dataSourceClass_dataSource___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_performUpdates");

}

void __85__REElementDataSourceController__initWithRelevanceEngine_dataSourceClass_dataSource___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_reloadWithQOS:qosOffset:forceReload:completion:", *(unsigned int *)(a1 + 40), 0, 0, 0);

}

void __85__REElementDataSourceController__initWithRelevanceEngine_dataSourceClass_dataSource___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (void)dealloc
{
  RERelevanceEngine **p_relevanceEngine;
  id WeakRetained;
  void *v5;
  REElementDataSource *dataSource;
  void *v7;
  id v8;
  void *v9;
  objc_super v10;

  p_relevanceEngine = &self->_relevanceEngine;
  WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  objc_msgSend(WeakRetained, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeLoggable:", self->_dataSource);

  dataSource = self->_dataSource;
  self->_dataSource = 0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  v8 = objc_loadWeakRetained((id *)p_relevanceEngine);
  objc_msgSend(v8, "logger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeLoggable:", self);

  v10.receiver = self;
  v10.super_class = (Class)REElementDataSourceController;
  -[REElementDataSourceController dealloc](&v10, sel_dealloc);
}

- (void)_handleDeviceLockStateChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__REElementDataSourceController__handleDeviceLockStateChange___block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__REElementDataSourceController__handleDeviceLockStateChange___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t result;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = REDeviceUnlockedSinceBoot();
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "hasUnlockedSinceBoot");
  if (v2 != (_DWORD)result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setUnlockedSinceBoot:", v2);
    result = objc_msgSend((id)objc_opt_class(), "wantsReloadForFirstDeviceUnlock");
    if ((_DWORD)result)
    {
      RELogForDomain(2);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v8 = 138412290;
        v9 = v5;
        _os_log_impl(&dword_2132F7000, v4, OS_LOG_TYPE_DEFAULT, "%@ reloading for device unlock after reboot", (uint8_t *)&v8, 0xCu);
      }

      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isRunning"))
      {
        RELogForDomain(2);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v8 = 138412290;
          v9 = v7;
          _os_log_impl(&dword_2132F7000, v6, OS_LOG_TYPE_DEFAULT, "%@ reinitializing data source", (uint8_t *)&v8, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "pause");
        objc_msgSend(*(id *)(a1 + 32), "resume");
      }
      return objc_msgSend(*(id *)(a1 + 32), "invalidateElements");
    }
  }
  return result;
}

- (id)_elementsByRemovingInvalidElements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  void *v14;
  REElementDataSourceController *v15;
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __68__REElementDataSourceController__elementsByRemovingInvalidElements___block_invoke;
    v14 = &unk_24CF8B628;
    v15 = self;
    v7 = v6;
    v16 = v7;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v11);
    if (objc_msgSend(v7, "count", v11, v12, v13, v14, v15))
    {
      v8 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v8, "removeObjectsAtIndexes:", v7);
      v9 = (id)objc_msgSend(v8, "copy");

    }
    else
    {
      v9 = (id)objc_msgSend(v5, "copy");
    }

  }
  else
  {
    v9 = v5;
  }

  return v9;
}

uint64_t __68__REElementDataSourceController__elementsByRemovingInvalidElements___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_validElement:", a2);
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  return result;
}

- (id)_shallowCopiedElements:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "shallowCopy", (_QWORD)v14);
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v12;
}

- (void)_namespaceElementIdentifier:(id)a3 section:(id)a4
{
  id v6;
  REIdentifier *v7;
  void *v8;
  void *v9;
  REIdentifier *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = [REIdentifier alloc];
  -[REElementDataSourceController bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[REIdentifier initWithDataSource:section:identifier:](v7, "initWithDataSource:section:identifier:", v8, v6, v9);

  objc_msgSend(v16, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[REElementDataSourceController bundleIdentifier](self, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBundleIdentifier:", v12);

  }
  objc_msgSend(v16, "applicationBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[REElementDataSourceController applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v16, "setApplicationBundleIdentifier:", v14);
    }
    else
    {
      objc_msgSend(v16, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setApplicationBundleIdentifier:", v15);

    }
  }
  objc_msgSend(v16, "_updateIdentifier:", v10);
  objc_msgSend(v16, "_updateNamespacedIdentifier:", v10);

}

- (BOOL)_validElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  BOOL v23;
  int isKindOfClass;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "relevanceProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v40, "count");
  objc_msgSend(v4, "relevanceProviders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 != v9)
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Duplicate relevance providers in %@"), v10, v11, v12, v13, v14, v15, (uint64_t)v4);
    v31 = 0;
    goto LABEL_20;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v4, "relevanceProviders");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v17)
  {
    v31 = 1;
    goto LABEL_19;
  }
  v18 = 0;
  v19 = *(_QWORD *)v42;
  while (2)
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v42 != v19)
        objc_enumerationMutation(v16);
      v21 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_18;
      objc_msgSend(v4, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22 == 0;

      if (v23)
        goto LABEL_18;
      if (!-[RERelevanceProviderEnvironment isSupportedRelevanceProvider:](self->_providerEnvironment, "isSupportedRelevanceProvider:", v21))
      {
        NSStringFromClass(self->_dataSourceClass);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Relevance Engine (from data source %@) isn't configured to handle the relevance provider: %@"), v33, v34, v35, v36, v37, v38, (uint64_t)v32);

LABEL_18:
        v31 = 0;
        goto LABEL_19;
      }
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & v18 & 1) != 0)
      {
        RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Element cannot be added to multiple groups: %@"), v25, v26, v27, v28, v29, v30, (uint64_t)v4);
        goto LABEL_18;
      }
      v18 |= isKindOfClass;
    }
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    v31 = 1;
    if (v17)
      continue;
    break;
  }
LABEL_19:

LABEL_20:
  return v31;
}

- (BOOL)_supportsContentRelevanceProviderForElement:(id)a3
{
  id v4;
  void *v5;
  unint64_t contentMode;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_supportsContentRelevance)
  {
    contentMode = self->_contentMode;
    if (contentMode == 2)
    {
      v16 = 0u;
      v17 = 0u;
      v15 = 0u;
      objc_msgSend(v4, "relevanceProviders", 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v8);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v7 = 0;
              goto LABEL_15;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v10)
            continue;
          break;
        }
      }
      v7 = 1;
LABEL_15:

    }
    else
    {
      v7 = contentMode == 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_updateRelevanceProvidersForElement:(id)a3
{
  id v4;
  void *v5;
  NSArray *contentAttributes;
  id v7;
  REContentRelevanceProvider *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  if (!-[REElementDataSourceController _supportsContentRelevanceProviderForElement:](self, "_supportsContentRelevanceProviderForElement:", v4))goto LABEL_5;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  contentAttributes = self->_contentAttributes;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__REElementDataSourceController__updateRelevanceProvidersForElement___block_invoke;
  v14[3] = &unk_24CF8B650;
  v7 = v5;
  v15 = v7;
  REEnumerateContentAttributesOfElement(contentAttributes, v4, v14);
  v8 = -[REContentRelevanceProvider initWithContent:]([REContentRelevanceProvider alloc], "initWithContent:", v7);
  -[REContentRelevanceProvider keywords](v8, "keywords");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(v4, "relevanceProviders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObject:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (id)objc_msgSend(v4, "copyElementWithUpdatedRelevanceProviders:", v12);
  }

  if (!v10)
LABEL_5:
    v9 = v4;

  return v9;
}

uint64_t __69__REElementDataSourceController__updateRelevanceProvidersForElement___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
}

- (void)_addElementIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Wrong type of identifier being used"), v4, v5, v6, v7, v8, v9, v10);
  -[NSMutableSet addObject:](self->_dataSourceElements, "addObject:", v11);

}

- (void)_removeElementIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Wrong type of identifier being used"), v4, v5, v6, v7, v8, v9, v10);
  -[NSMutableSet removeObject:](self->_dataSourceElements, "removeObject:", v11);

}

- (BOOL)_containsElementIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Wrong type of identifier being used"), v5, v6, v7, v8, v9, v10, v13);
  v11 = -[NSMutableSet containsObject:](self->_dataSourceElements, "containsObject:", v4);

  return v11;
}

- (id)_allDataSourceElements
{
  return self->_dataSourceElements;
}

- (void)_setSection:(id)a3 forElementWithIdentifier:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Wrong type of identifier being used"), v7, v8, v9, v10, v11, v12, v13);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataSourceElementSectionMap, "setObject:forKeyedSubscript:", v14, v6);

}

- (id)_sectionForElementWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Wrong type of identifier being used"), v5, v6, v7, v8, v9, v10, v13);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSourceElementSectionMap, "objectForKeyedSubscript:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_storeElement:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Wrong type of identifier being used"), v5, v6, v7, v8, v9, v10, v11);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataSourceElementIdentifierMap, "setObject:forKeyedSubscript:", v12, v4);

}

- (void)_removeElementForIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Wrong type of identifier being used"), v4, v5, v6, v7, v8, v9, v10);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataSourceElementIdentifierMap, "setObject:forKeyedSubscript:", 0, v11);

}

- (id)_elementForIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Wrong type of identifier being used"), v5, v6, v7, v8, v9, v10, v13);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSourceElementIdentifierMap, "objectForKeyedSubscript:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_dataSourceIdentifierFromIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v13;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "identifier");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Wrong type of identifier being used"), v4, v5, v6, v7, v8, v9, v13);
    v10 = v3;
  }
  v11 = v10;

  return v11;
}

- (BOOL)_isWhitelisted
{
  id WeakRetained;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  char v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  objc_msgSend(WeakRetained, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "whitelistedDataSourceClassNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "containsObject:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)resume
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __39__REElementDataSourceController_resume__block_invoke;
  v2[3] = &unk_24CF8AAF0;
  v2[4] = self;
  -[REElementDataSourceController _performOrEnqueueUpdateBlock:](self, "_performOrEnqueueUpdateBlock:", v2);
}

void __39__REElementDataSourceController_resume__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject *v2;

  v1 = (id *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 32), "_isWhitelisted") & 1) != 0)
  {
    objc_msgSend(*v1, "_queue_resume");
  }
  else
  {
    RELogForDomain(2);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __39__REElementDataSourceController_resume__block_invoke_cold_1();

  }
}

- (void)_queue_resume
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_2132F7000, v0, v1, "%@ did open data source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processPendingUpdatesWhilePause:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__REElementDataSourceController_processPendingUpdatesWhilePause___block_invoke;
  v6[3] = &unk_24CF8AA78;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[REElementDataSourceController _performOrEnqueueUpdateBlock:](self, "_performOrEnqueueUpdateBlock:", v6);

}

uint64_t __65__REElementDataSourceController_processPendingUpdatesWhilePause___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_processPendingUpdatesWhilePause:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_processPendingUpdatesWhilePause:(id)a3
{
  id v4;
  void *v5;
  NSArray *sectionsToReloadWhilePaused;
  NSArray *v7;
  id v8;

  v4 = a3;
  v5 = v4;
  sectionsToReloadWhilePaused = self->_sectionsToReloadWhilePaused;
  if (sectionsToReloadWhilePaused)
  {
    v8 = v4;
    -[REElementDataSourceController _queue_invalidateSections:completion:](self, "_queue_invalidateSections:completion:", sectionsToReloadWhilePaused, v4);
    v7 = self->_sectionsToReloadWhilePaused;
    self->_sectionsToReloadWhilePaused = 0;

LABEL_5:
    v5 = v8;
    goto LABEL_6;
  }
  if (v4)
  {
    v8 = v4;
    (*((void (**)(id))v4 + 2))(v4);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)pause
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __38__REElementDataSourceController_pause__block_invoke;
  v2[3] = &unk_24CF8AAF0;
  v2[4] = self;
  -[REElementDataSourceController _performOrEnqueueUpdateBlock:](self, "_performOrEnqueueUpdateBlock:", v2);
}

void __38__REElementDataSourceController_pause__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject *v2;

  v1 = (id *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 32), "_isWhitelisted") & 1) != 0)
  {
    objc_msgSend(*v1, "_queue_pause");
  }
  else
  {
    RELogForDomain(2);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __38__REElementDataSourceController_pause__block_invoke_cold_1();

  }
}

- (void)pauseIfNeeded
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __46__REElementDataSourceController_pauseIfNeeded__block_invoke;
  v2[3] = &unk_24CF8AAF0;
  v2[4] = self;
  -[REElementDataSourceController _performOrEnqueueUpdateBlock:](self, "_performOrEnqueueUpdateBlock:", v2);
}

uint64_t __46__REElementDataSourceController_pauseIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isWhitelisted");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_queue_pause");
  return result;
}

- (void)_queue_pause
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_2132F7000, v0, v1, "%@ did close data source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__REElementDataSourceController__queue_pause__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  RELogForDomain(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_2132F7000, v2, OS_LOG_TYPE_INFO, "%@ finished purging content because content management is disabled", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_queue_updateDataSourceLocationUse
{
  _BOOL4 allowsLocationUse;
  REElementDataSource *dataSource;
  uint64_t v5;

  allowsLocationUse = self->_allowsLocationUse;
  dataSource = self->_dataSource;
  if (!allowsLocationUse)
  {
    if (!-[REElementDataSource allowsLocationUse](dataSource, "allowsLocationUse"))
      return;
    v5 = 0;
    goto LABEL_6;
  }
  v5 = -[REElementDataSource isRunning](dataSource, "isRunning");
  if ((_DWORD)v5 != -[REElementDataSource allowsLocationUse](self->_dataSource, "allowsLocationUse"))
LABEL_6:
    -[REElementDataSource setAllowsLocationUse:](self->_dataSource, "setAllowsLocationUse:", v5);
}

- (void)prepareToUnload
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__REElementDataSourceController_prepareToUnload__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __48__REElementDataSourceController_prepareToUnload__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "performImmediately");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "performImmediately");
}

- (BOOL)hasLoadedData
{
  return self->_hasDataAvailable;
}

- (void)invalidateAndReloadWithCompletion:(id)a3
{
  id v4;
  int v5;
  char v6;
  NSObject *queue;
  id v8;
  dispatch_block_t v9;
  _QWORD block[5];
  id v11;
  char v12;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "wantsAutomaticFetching");
  v6 = v5;
  if (v5)
    -[REElementDataSource beginFetchingData](self->_dataSource, "beginFetchingData");
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__REElementDataSourceController_invalidateAndReloadWithCompletion___block_invoke;
  block[3] = &unk_24CF8B6C8;
  block[4] = self;
  v11 = v4;
  v12 = v6;
  v8 = v4;
  v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, -1, block);
  dispatch_async(queue, v9);

}

void __67__REElementDataSourceController_invalidateAndReloadWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;
  char v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__REElementDataSourceController_invalidateAndReloadWithCompletion___block_invoke_2;
  v4[3] = &unk_24CF8B6A0;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v6 = *(_BYTE *)(a1 + 48);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_queue_reloadWithQOS:qosOffset:forceReload:completion:", 25, 0xFFFFFFFFLL, 1, v4);

}

uint64_t __67__REElementDataSourceController_invalidateAndReloadWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    result = (*(uint64_t (**)(void))(result + 16))();
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "finishFetchingData");
  return result;
}

- (void)invalidateElementsInSections:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__REElementDataSourceController_invalidateElementsInSections_completion___block_invoke;
  block[3] = &unk_24CF8AA00;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __73__REElementDataSourceController_invalidateElementsInSections_completion___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isRunning");
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_invalidateSections:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    RELogForDomain(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v14 = 138543618;
      v15 = v6;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_2132F7000, v4, OS_LOG_TYPE_INFO, "%{public}@ Asked to invalidate elements in section %@.", (uint8_t *)&v14, 0x16u);
    }

  }
  else
  {
    v7 = *(void **)(v3 + 80);
    v8 = *(void **)(a1 + 40);
    if (v7)
    {
      objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 80);
      *(_QWORD *)(v10 + 80) = v9;
    }
    else
    {
      v12 = v8;
      v11 = *(void **)(v3 + 80);
      *(_QWORD *)(v3 + 80) = v12;
    }

    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
      (*(void (**)(void))(v13 + 16))();
  }
}

- (id)elementOperationQueue
{
  return self->_queue;
}

- (void)invalidateElements
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__REElementDataSourceController_invalidateElements__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __51__REElementDataSourceController_invalidateElements__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isRunning");
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(v3 + 64), "schedule");
    RELogForDomain(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_2132F7000, v4, OS_LOG_TYPE_INFO, "%{public}@ Asked to invalidate elements.", (uint8_t *)&v6, 0xCu);
    }

  }
  else
  {
    *(_BYTE *)(v3 + 72) = 1;
  }
}

- (void)invalidateElementsInSection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[REElementDataSourceController invalidateElementsInSections:completion:](self, "invalidateElementsInSections:completion:", v6, 0, v7, v8);
}

- (void)addElements:(id)a3 toSectionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  REElementDataSourceController *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!-[NSSet containsObject:](self->_supportedSections, "containsObject:", v7))
  {
    RELogForDomain(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[REElementDataSourceController addElements:toSectionWithIdentifier:].cold.1((uint64_t)v7, v9);
    goto LABEL_14;
  }
  -[REElementDataSourceController _elementsByRemovingInvalidElements:](self, "_elementsByRemovingInvalidElements:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          -[REElementDataSourceController _updateRelevanceProvidersForElement:](self, "_updateRelevanceProvidersForElement:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v12);
    }

    v16 = -[NSObject copy](v9, "copy");
    -[REElementDataSourceController _shallowCopiedElements:](self, "_shallowCopiedElements:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __69__REElementDataSourceController_addElements_toSectionWithIdentifier___block_invoke;
    v19[3] = &unk_24CF8B6F0;
    v20 = v17;
    v21 = self;
    v22 = v7;
    v6 = v10;
    v23 = v6;
    v18 = v17;
    -[REElementDataSourceController _performOrEnqueueUpdateBlock:](self, "_performOrEnqueueUpdateBlock:", v19);

LABEL_14:
    v8 = v6;
  }

}

void __69__REElementDataSourceController_addElements_toSectionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 40), "_containsElementIdentifier:", v10))
        {
          objc_msgSend(v2, "addObject:", v10);
        }
        else
        {
          objc_msgSend(v3, "addObject:", v9);
          objc_msgSend(*(id *)(a1 + 40), "_addElementIdentifier:", v10);
          objc_msgSend(*(id *)(a1 + 40), "_setSection:forElementWithIdentifier:", *(_QWORD *)(a1 + 48), v10);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v2, "count"))
  {
    RELogForDomain(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __69__REElementDataSourceController_addElements_toSectionWithIdentifier___block_invoke_cold_1(v2);

  }
  if (objc_msgSend(v3, "count"))
  {
    v28 = v3;
    v29 = v2;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = v3;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          objc_msgSend(*(id *)(a1 + 40), "_storeElement:", v17, v28, v29);
          objc_msgSend(*(id *)(a1 + 40), "_namespaceElementIdentifier:section:", v17, *(_QWORD *)(a1 + 48));
          RELogForDomain(2);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            objc_msgSend(v17, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 138413058;
            v39 = v21;
            v40 = 2112;
            v41 = v22;
            v42 = 2112;
            v43 = v23;
            v44 = 2112;
            v45 = v17;
            _os_log_debug_impl(&dword_2132F7000, v18, OS_LOG_TYPE_DEBUG, "%@ added element %@ in section %@\n%@", buf, 0x2Au);

          }
          v19 = *(void **)(a1 + 40);
          +[REElementDataSourceUpdate insertElement:inSection:](REElementDataSourceUpdate, "insertElement:inSection:", v17, *(_QWORD *)(a1 + 48));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "_queue_scheduleUpdate:", v20);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
      }
      while (v14);
    }

    v3 = v28;
    v2 = v29;
  }
  RELogForDomain(2);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    REElementsLoggableString(*(void **)(a1 + 56));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v39 = v25;
    v40 = 2112;
    v41 = v26;
    v42 = 2112;
    v43 = v27;
    _os_log_impl(&dword_2132F7000, v24, OS_LOG_TYPE_DEFAULT, "%@ adding elements %@ to section %@", buf, 0x20u);

  }
}

- (void)reloadElement:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  NSObject *v16;
  REElementDataSourceController *v17;

  v4 = a3;
  if (!v4)
  {
    RELogForDomain(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[REElementDataSourceController reloadElement:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    v5 = 0;
    goto LABEL_7;
  }
  v5 = v4;
  if (-[REElementDataSourceController _validElement:](self, "_validElement:", v4))
  {
    -[REElementDataSourceController _updateRelevanceProvidersForElement:](self, "_updateRelevanceProvidersForElement:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __47__REElementDataSourceController_reloadElement___block_invoke;
    v15[3] = &unk_24CF8AB18;
    v5 = v6;
    v16 = v5;
    v17 = self;
    -[REElementDataSourceController _performOrEnqueueUpdateBlock:](self, "_performOrEnqueueUpdateBlock:", v15);
    v7 = v16;
LABEL_7:

  }
}

void __47__REElementDataSourceController_reloadElement___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_sectionForElementWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "_containsElementIdentifier:", v2))
  {
    objc_msgSend(*(id *)(a1 + 40), "_elementForIdentifier:", v2);
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject relevanceProviders](v4, "relevanceProviders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "relevanceProviders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToArray:", v6);

    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      -[NSObject relevanceProviders](v4, "relevanceProviders");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "copyElementWithUpdatedRelevanceProviders:", v9);

      objc_msgSend(*(id *)(a1 + 40), "_storeElement:", v10);
      objc_msgSend(*(id *)(a1 + 40), "_namespaceElementIdentifier:section:", v10, v3);
      v11 = *(void **)(a1 + 40);
      +[REElementDataSourceUpdate reloadElement:inSection:](REElementDataSourceUpdate, "reloadElement:inSection:", v10, v3);
    }
    else
    {
      v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "shallowCopy");
      objc_msgSend(*(id *)(a1 + 40), "_storeElement:", v10);
      objc_msgSend(*(id *)(a1 + 40), "_namespaceElementIdentifier:section:", v10, v3);
      v12 = *(void **)(a1 + 40);
      +[REElementDataSourceUpdate removeElement:inSection:](REElementDataSourceUpdate, "removeElement:inSection:", v4, v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_queue_scheduleUpdate:", v13);

      v11 = *(void **)(a1 + 40);
      +[REElementDataSourceUpdate insertElement:inSection:](REElementDataSourceUpdate, "insertElement:inSection:", v10, v3);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_queue_scheduleUpdate:", v14);

    RELogForDomain(2);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v20 = 138413058;
      v21 = v19;
      v22 = 2112;
      v23 = v2;
      v24 = 2112;
      v25 = v3;
      v26 = 2112;
      v27 = v18;
      _os_log_debug_impl(&dword_2132F7000, v15, OS_LOG_TYPE_DEBUG, "%@ updated element %@ in section %@\n%@", (uint8_t *)&v20, 0x2Au);
    }

  }
  else
  {
    RELogForDomain(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __47__REElementDataSourceController_reloadElement___block_invoke_cold_1();
  }

  RELogForDomain(2);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v20 = 138412546;
    v21 = v17;
    v22 = 2112;
    v23 = v2;
    _os_log_impl(&dword_2132F7000, v16, OS_LOG_TYPE_DEFAULT, "%@ updating element %@\n", (uint8_t *)&v20, 0x16u);
  }

}

- (void)refreshElement:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  NSObject *v19;
  REElementDataSourceController *v20;

  v4 = a3;
  if (!v4)
  {
    RELogForDomain(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[REElementDataSourceController refreshElement:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    v5 = 0;
    goto LABEL_7;
  }
  v5 = v4;
  if (-[REElementDataSourceController _validElement:](self, "_validElement:", v4))
  {
    -[REElementDataSourceController _updateRelevanceProvidersForElement:](self, "_updateRelevanceProvidersForElement:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __48__REElementDataSourceController_refreshElement___block_invoke;
    v18 = &unk_24CF8AB18;
    v5 = v6;
    v19 = v5;
    v20 = self;
    -[REElementDataSourceController _performOrEnqueueUpdateBlock:](self, "_performOrEnqueueUpdateBlock:", &v15);
    -[REUpNextScheduler performImmediately](self->_reloadScheduler, "performImmediately", v15, v16, v17, v18);
    v7 = v19;
LABEL_7:

  }
}

void __48__REElementDataSourceController_refreshElement___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_sectionForElementWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "_containsElementIdentifier:", v2))
  {
    objc_msgSend(*(id *)(a1 + 40), "_elementForIdentifier:", v2);
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject relevanceProviders](v4, "relevanceProviders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "relevanceProviders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToArray:", v6);

    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Don't refresh with new relevance providers, did you mean to use reloadElement?"), 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v18);
    }
    v8 = *(void **)(a1 + 32);
    -[NSObject relevanceProviders](v4, "relevanceProviders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "copyElementWithUpdatedRelevanceProviders:", v9);

    objc_msgSend(*(id *)(a1 + 40), "_storeElement:", v10);
    objc_msgSend(*(id *)(a1 + 40), "_namespaceElementIdentifier:section:", v10, v3);
    v11 = *(void **)(a1 + 40);
    +[REElementDataSourceUpdate refreshElement:inSection:](REElementDataSourceUpdate, "refreshElement:inSection:", v10, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_queue_scheduleUpdate:", v12);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "performImmediately");
    RELogForDomain(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = 138413058;
      v20 = v17;
      v21 = 2112;
      v22 = v2;
      v23 = 2112;
      v24 = v3;
      v25 = 2112;
      v26 = v16;
      _os_log_debug_impl(&dword_2132F7000, v13, OS_LOG_TYPE_DEBUG, "%@ refreshed element %@ in section %@\n%@", (uint8_t *)&v19, 0x2Au);
    }

  }
  else
  {
    RELogForDomain(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__REElementDataSourceController_refreshElement___block_invoke_cold_1();
  }

  RELogForDomain(2);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = 138412546;
    v20 = v15;
    v21 = 2112;
    v22 = v2;
    _os_log_impl(&dword_2132F7000, v14, OS_LOG_TYPE_DEFAULT, "%@ refreshing element %@", (uint8_t *)&v19, 0x16u);
  }

}

- (void)removeElementsWithIds:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  REElementDataSourceController *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __55__REElementDataSourceController_removeElementsWithIds___block_invoke;
    v6[3] = &unk_24CF8AB18;
    v7 = v5;
    v8 = self;
    -[REElementDataSourceController _performOrEnqueueUpdateBlock:](self, "_performOrEnqueueUpdateBlock:", v6);

  }
}

void __55__REElementDataSourceController_removeElementsWithIds___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_allDataSourceElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isSubsetOfSet:", v3);

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_msgSend(v2, "mutableCopy");
    objc_msgSend(*(id *)(a1 + 40), "_allDataSourceElements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minusSet:", v6);

    v7 = (void *)objc_msgSend(v2, "mutableCopy");
    objc_msgSend(v7, "minusSet:", v5);
    RELogForDomain(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __55__REElementDataSourceController_removeElementsWithIds___block_invoke_cold_1(v5);

    v2 = v7;
  }
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v44 = v2;
    v10 = v2;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v59 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "_elementForIdentifier:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v9, "addObject:", v16);
            RELogForDomain(2);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              *(_DWORD *)buf = 138412802;
              v66 = v18;
              v67 = 2112;
              v68 = v15;
              v69 = 2112;
              v70 = v16;
              _os_log_debug_impl(&dword_2132F7000, v17, OS_LOG_TYPE_DEBUG, "%@ removed element %@\n%@", buf, 0x20u);
            }

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
      }
      while (v12);
    }

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v19 = v10;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v55 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(a1 + 40), "_removeElementIdentifier:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j));
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      }
      while (v21);
    }

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v9;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v51;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v51 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
          v29 = *(void **)(a1 + 40);
          objc_msgSend(v28, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "_dataSourceIdentifierFromIdentifier:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 40), "_sectionForElementWithIdentifier:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = *(void **)(a1 + 40);
          +[REElementDataSourceUpdate removeElement:inSection:](REElementDataSourceUpdate, "removeElement:inSection:", v28, v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "_queue_scheduleUpdate:", v34);

        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
      }
      while (v25);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v35 = v19;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v47;
      do
      {
        for (m = 0; m != v37; ++m)
        {
          if (*(_QWORD *)v47 != v38)
            objc_enumerationMutation(v35);
          v40 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * m);
          objc_msgSend(*(id *)(a1 + 40), "_removeElementForIdentifier:", v40);
          objc_msgSend(*(id *)(a1 + 40), "_setSection:forElementWithIdentifier:", 0, v40);
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
      }
      while (v37);
    }

    v2 = v44;
  }
  RELogForDomain(2);
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    REElementsIdsLoggableString(*(void **)(a1 + 32));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v66 = v42;
    v67 = 2112;
    v68 = v43;
    _os_log_impl(&dword_2132F7000, v41, OS_LOG_TYPE_DEFAULT, "%@ removing elements %@", buf, 0x16u);

  }
}

- (void)_performOrEnqueueUpdateBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__REElementDataSourceController__performOrEnqueueUpdateBlock___block_invoke;
  v7[3] = &unk_24CF8AA78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __62__REElementDataSourceController__performOrEnqueueUpdateBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 144))
  {
    if (*(_BYTE *)(v1 + 104))
    {
      v2 = *(void **)(v1 + 112);
      v3 = (id)MEMORY[0x2199B2434](*(_QWORD *)(a1 + 40));
      objc_msgSend(v2, "addObject:", v3);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
}

- (void)_queue_reloadWithQOS:(unsigned int)a3 qosOffset:(int)a4 forceReload:(BOOL)a5 completion:(id)a6
{
  -[REElementDataSourceController _queue_reloadWithQOS:qosOffset:forceReload:sections:completion:](self, "_queue_reloadWithQOS:qosOffset:forceReload:sections:completion:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, self->_supportedSections, a6);
}

- (void)_queue_reloadWithQOS:(unsigned int)a3 qosOffset:(int)a4 forceReload:(BOOL)a5 sections:(id)a6 completion:(id)a7
{
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v8 = a5;
  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __96__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_sections_completion___block_invoke;
  v14[3] = &unk_24CF8B718;
  v14[4] = self;
  v15 = v12;
  v13 = v12;
  -[REElementDataSourceController _queue_reloadWithQOS:qosOffset:forceReload:operations:completion:](self, "_queue_reloadWithQOS:qosOffset:forceReload:operations:completion:", v10, v9, v8, v14, a7);

}

uint64_t __96__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_sections_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_performContentInvalidateWithElement:expectation:sections:", a2, a3, *(_QWORD *)(a1 + 40));
}

- (void)_queue_invalidateSections:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = -[REElementDataSourceController _defaultDataSourceQOS](self, "_defaultDataSourceQOS");
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "intersectSet:", self->_supportedSections);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__REElementDataSourceController__queue_invalidateSections_completion___block_invoke;
  v11[3] = &unk_24CF8AA78;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  -[REElementDataSourceController _queue_reloadWithQOS:qosOffset:forceReload:sections:completion:](self, "_queue_reloadWithQOS:qosOffset:forceReload:sections:completion:", v8, 0, 0, v9, v11);

}

void __70__REElementDataSourceController__queue_invalidateSections_completion___block_invoke(uint64_t a1)
{
  int v2;
  void (**v3)(_QWORD);

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "performImmediately");
  v3 = *(void (***)(_QWORD))(a1 + 40);
  if (v3)
  {
    if (v2)
      v3[2](*(_QWORD *)(a1 + 40));
    else
      dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40), v3);
  }
}

- (void)_queue_purgeContentWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  -[REElementDataSourceController _queue_reloadWithQOS:qosOffset:forceReload:operations:completion:](self, "_queue_reloadWithQOS:qosOffset:forceReload:operations:completion:", -[REElementDataSourceController _defaultDataSourceQOS](self, "_defaultDataSourceQOS"), 0, 0, &__block_literal_global_79_0, v4);

}

- (void)_queue_reloadWithQOS:(unsigned int)a3 qosOffset:(int)a4 forceReload:(BOOL)a5 operations:(id)a6 completion:(id)a7
{
  void (**v12)(id, void *, REExpectation *);
  void (**v13)(_QWORD);
  void (**v14)(_QWORD);
  NSObject *v15;
  NSString *loggingHeader;
  NSMutableArray *enqueuedBlocks;
  void *v18;
  NSObject *v19;
  NSString *v20;
  int v21;
  char v22;
  NSObject *v23;
  NSString *v24;
  REExpectation *v25;
  void *v26;
  id v27;
  void (**v28)(_QWORD);
  OS_dispatch_queue *queue;
  dispatch_block_t v30;
  _QWORD v31[5];
  id v32;
  void (**v33)(_QWORD);
  __int128 *p_buf;
  unsigned int v35;
  int v36;
  char v37;
  _QWORD v38[4];
  id v39;
  __int128 buf;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v12 = (void (**)(id, void *, REExpectation *))a6;
  v13 = (void (**)(_QWORD))a7;
  v14 = v13;
  if (self->_willUnload)
  {
    if (v13)
      v13[2](v13);
  }
  else if (-[REElementDataSource isRunning](self->_dataSource, "isRunning"))
  {
    if (self->_isPerformingReload)
    {
      RELogForDomain(2);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        loggingHeader = self->_loggingHeader;
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = loggingHeader;
        _os_log_impl(&dword_2132F7000, v15, OS_LOG_TYPE_DEFAULT, "%@ Already performing a reload. Postponing the reload", (uint8_t *)&buf, 0xCu);
      }

      objc_initWeak((id *)&buf, self->_reloadScheduler);
      enqueuedBlocks = self->_enqueuedBlocks;
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke;
      v38[3] = &unk_24CF8AAC8;
      objc_copyWeak(&v39, (id *)&buf);
      v18 = (void *)MEMORY[0x2199B2434](v38);
      -[NSMutableArray addObject:](enqueuedBlocks, "addObject:", v18);

      if (v14)
        v14[2](v14);
      objc_destroyWeak(&v39);
      objc_destroyWeak((id *)&buf);
    }
    else
    {
      v21 = objc_msgSend((id)objc_opt_class(), "wantsAutomaticFetching");
      v22 = v21;
      self->_isPerformingReload = 1;
      if (v21)
        -[REElementDataSource beginFetchingData](self->_dataSource, "beginFetchingData");
      RELogForDomain(2);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = self->_loggingHeader;
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v24;
        _os_log_impl(&dword_2132F7000, v23, OS_LOG_TYPE_DEFAULT, "%@ request elements", (uint8_t *)&buf, 0xCu);
      }

      v25 = objc_alloc_init(REExpectation);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        v12[2](v12, v26, v25);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v41 = 0x2020000000;
      v42 = a5;
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_81;
      v31[3] = &unk_24CF8B7F8;
      v31[4] = self;
      v27 = v26;
      v37 = v22;
      v32 = v27;
      p_buf = &buf;
      v35 = a3;
      v36 = a4;
      v33 = v14;
      v28 = (void (**)(_QWORD))MEMORY[0x2199B2434](v31);
      if (-[REExpectation outstandingOperations](v25, "outstandingOperations"))
      {
        queue = self->_queue;
        v30 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, a4, v28);
        -[REExpectation notifyOperationsCompleteOnQueue:block:](v25, "notifyOperationsCompleteOnQueue:block:", queue, v30);

      }
      else
      {
        *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) = 1;
        v28[2](v28);
      }

      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    RELogForDomain(2);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = self->_loggingHeader;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v20;
      _os_log_impl(&dword_2132F7000, v19, OS_LOG_TYPE_DEFAULT, "%@ Trying to reload while paused. Postponing the reload", (uint8_t *)&buf, 0xCu);
    }

    self->_wantsReloadWhilePaused = 1;
    if (v14)
      v14[2](v14);
  }

}

void __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "schedule");

}

void __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_81(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  NSObject *v43;
  dispatch_qos_class_t v44;
  int v45;
  dispatch_block_t v46;
  id v47;
  void *v48;
  void *v49;
  _QWORD block[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[4];
  id v59;
  uint64_t v60;
  _QWORD v61[5];
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  id v68;
  uint64_t v69;
  _QWORD v70[5];
  uint8_t v71[128];
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v1 = a1;
  v79 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
  v2 = *(id **)(v1 + 32);
  objc_msgSend(v2[2], "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_groupElements:bySections:", v3, *(_QWORD *)(*(_QWORD *)(v1 + 32) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 24), "removeAllObjects");
  v5 = MEMORY[0x24BDAC760];
  v70[0] = MEMORY[0x24BDAC760];
  v70[1] = 3221225472;
  v70[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_2;
  v70[3] = &unk_24CF8B780;
  v6 = *(void **)(v1 + 40);
  v70[4] = *(_QWORD *)(v1 + 32);
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v70);
  v7 = *(id **)(v1 + 32);
  objc_msgSend(v7[2], "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_groupElements:bySections:", v8, *(_QWORD *)(*(_QWORD *)(v1 + 32) + 24));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") || objc_msgSend(v4, "count"))
  {
    v48 = v9;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v67[0] = v5;
    v67[1] = 3221225472;
    v67[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_83;
    v67[3] = &unk_24CF8B7A8;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(v1 + 32);
    v47 = v10;
    v68 = v10;
    v69 = v11;
    v49 = v4;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v67);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    objc_msgSend(*(id *)(v1 + 32), "allElements");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v64 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

          RELogForDomain(2);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v21 = v1;
            v22 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 8);
            objc_msgSend(v18, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v73 = v22;
            v1 = v21;
            v74 = 2112;
            v75 = v23;
            v76 = 2112;
            v77 = v18;
            _os_log_debug_impl(&dword_2132F7000, v20, OS_LOG_TYPE_DEBUG, "%@ removed element %@\n%@", buf, 0x20u);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
      }
      while (v15);
    }

    RELogForDomain(2);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 8);
      REElementsIdsLoggableString(v12);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v73 = v25;
      v74 = 2112;
      v75 = v26;
      _os_log_impl(&dword_2132F7000, v24, OS_LOG_TYPE_DEFAULT, "%@ removing elements due to reload %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "removeAllObjects");
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)(v1 + 40), "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_85;
    v61[3] = &unk_24CF8B7D0;
    v28 = *(void **)(v1 + 40);
    v61[4] = *(_QWORD *)(v1 + 32);
    v29 = v27;
    v62 = v29;
    objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v61);
    RELogForDomain(2);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 8);
      REElementsIdsLoggableString(v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v73 = v31;
      v74 = 2112;
      v75 = v32;
      _os_log_impl(&dword_2132F7000, v30, OS_LOG_TYPE_DEFAULT, "%@ inserting elements due to reload %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v5;
    v58[1] = 3221225472;
    v58[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_86;
    v58[3] = &unk_24CF8B7A8;
    v34 = *(_QWORD *)(v1 + 32);
    v59 = v33;
    v60 = v34;
    v35 = v33;
    v9 = v48;
    objc_msgSend(v48, "enumerateKeysAndObjectsUsingBlock:", v58);
    v57[0] = v5;
    v57[1] = 3221225472;
    v57[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_2_87;
    v57[3] = &unk_24CF8B780;
    v57[4] = *(_QWORD *)(v1 + 32);
    objc_msgSend(v47, "enumerateKeysAndObjectsUsingBlock:", v57);
    v56[0] = v5;
    v56[1] = 3221225472;
    v56[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_3;
    v56[3] = &unk_24CF8B780;
    v56[4] = *(_QWORD *)(v1 + 32);
    objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v56);

    v4 = v49;
  }
  if (*(_BYTE *)(v1 + 72))
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 176), "finishFetchingData");
  *(_BYTE *)(*(_QWORD *)(v1 + 32) + 104) = 0;
  v36 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 112), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 112), "removeAllObjects");
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v37 = v36;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v53 != v40)
          objc_enumerationMutation(v37);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j) + 16))();
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
    }
    while (v39);
  }

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24)
    && (objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 56), "performImmediately") & 1) == 0)
  {
    v43 = *(NSObject **)(*(_QWORD *)(v1 + 32) + 40);
    v44 = *(_DWORD *)(v1 + 64);
    v45 = *(_DWORD *)(v1 + 68);
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_4;
    block[3] = &unk_24CF8B1B0;
    v51 = *(id *)(v1 + 48);
    v46 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v44, v45, block);
    dispatch_async(v43, v46);

  }
  else
  {
    v42 = *(_QWORD *)(v1 + 48);
    if (v42)
      (*(void (**)(void))(v42 + 16))();
  }

}

void __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_addElementIdentifier:", v12);
        objc_msgSend(*(id *)(a1 + 32), "_setSection:forElementWithIdentifier:", v5, v12);
        objc_msgSend(v11, "finalizeContent");

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v8);
  }
  RELogForDomain(2);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    REElementsLoggableString(v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v21 = v14;
    v22 = 2112;
    v23 = v15;
    v24 = 2112;
    v25 = v5;
    _os_log_impl(&dword_2132F7000, v13, OS_LOG_TYPE_DEFAULT, "%@ received elements %@ for section %@", buf, 0x20u);

  }
}

void __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_83(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "_queue_elementsForIds:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

void __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_85(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v20;
    *(_QWORD *)&v7 = 138413058;
    v17 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_storeElement:", v11, v17);
        v12 = *(void **)(a1 + 40);
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

        objc_msgSend(*(id *)(a1 + 32), "_namespaceElementIdentifier:section:", v11, v5);
        RELogForDomain(2);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          objc_msgSend(v11, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v17;
          v24 = v15;
          v25 = 2112;
          v26 = v16;
          v27 = 2112;
          v28 = v11;
          v29 = 2112;
          v30 = v5;
          _os_log_impl(&dword_2132F7000, v14, OS_LOG_TYPE_DEFAULT, "%@ added element %@ to section %@\n%@", buf, 0x2Au);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v8);
  }

}

void __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_86(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "_queue_elementsForIds:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

void __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_2_87(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(a1 + 32);
        +[REElementDataSourceUpdate removeElement:inSection:](REElementDataSourceUpdate, "removeElement:inSection:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_queue_scheduleUpdate:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

void __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(a1 + 32);
        +[REElementDataSourceUpdate insertElement:inSection:](REElementDataSourceUpdate, "insertElement:inSection:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_queue_scheduleUpdate:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

uint64_t __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_queue_performContentInvalidateWithElement:(id)a3 expectation:(id)a4 sections:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  REBlockSentinel *v12;
  id v13;
  REBlockSentinel *v14;
  void *v15;
  void *v16;
  OS_dispatch_queue *queue;
  id v18;
  void *v19;
  REBlockSentinel *v20;
  id v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  id v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  REBlockSentinel *v31;
  id v32;
  id v33;
  _QWORD *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[5];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  int v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v8 = a4;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2810000000;
  v43[3] = &unk_2133F94DA;
  v44 = 0;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = a5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v9)
  {
    v25 = *(_QWORD *)v40;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v40 != v25)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v10);
        objc_msgSend(v8, "beginOperation");
        v12 = [REBlockSentinel alloc];
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __97__REElementDataSourceController__queue_performContentInvalidateWithElement_expectation_sections___block_invoke;
        v37[3] = &unk_24CF8AB18;
        v37[4] = self;
        v13 = v8;
        v38 = v13;
        v14 = -[REBlockSentinel initWithFailureBlock:](v12, "initWithFailureBlock:", v37);
        NSStringFromClass(self->_dataSourceClass);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v13;
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 300.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        queue = self->_queue;
        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __97__REElementDataSourceController__queue_performContentInvalidateWithElement_expectation_sections___block_invoke_2;
        v35[3] = &unk_24CF8B820;
        v18 = v15;
        v36 = v18;
        +[REUpNextTimer timerWithFireDate:queue:block:](REUpNextTimer, "timerWithFireDate:queue:block:", v16, queue, v35);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __97__REElementDataSourceController__queue_performContentInvalidateWithElement_expectation_sections___block_invoke_3;
        v28[3] = &unk_24CF8B870;
        v28[4] = self;
        v34 = v43;
        v29 = v26;
        v30 = v11;
        v20 = v14;
        v31 = v20;
        v21 = v19;
        v32 = v21;
        v33 = v27;
        v22 = (void *)MEMORY[0x2199B2434](v28);
        -[REElementDataSourceController dataSource](self, "dataSource");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "getElementsInSection:withHandler:", v11, v22);

        ++v10;
      }
      while (v9 != v10);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v9);
  }

  _Block_object_dispose(v43, 8);
}

uint64_t __97__REElementDataSourceController__queue_performContentInvalidateWithElement_expectation_sections___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)*MEMORY[0x24BDBCA98];
  NSStringFromSelector(sel_getElementsInSection_withHandler_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  RERaiseInternalException(v2, CFSTR("%@ handler of data source %@ was never called"), v4, v5, v6, v7, v8, v9, (uint64_t)v3);

  return objc_msgSend(*(id *)(a1 + 40), "endOperation");
}

void __97__REElementDataSourceController__queue_performContentInvalidateWithElement_expectation_sections___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (objc_msgSend(a2, "isValid"))
  {
    v2 = (void *)*MEMORY[0x24BDBCA98];
    NSStringFromSelector(sel_getElementsInSection_withHandler_);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    RERaiseInternalException(v2, CFSTR("%@ handler of data source %@ timed out"), v3, v4, v5, v6, v7, v8, (uint64_t)v9);

  }
}

void __97__REElementDataSourceController__queue_performContentInvalidateWithElement_expectation_sections___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v3 = a2;
  v10[0] = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v10[2] = __97__REElementDataSourceController__queue_performContentInvalidateWithElement_expectation_sections___block_invoke_4;
  v10[3] = &unk_24CF8B848;
  v18 = *(_QWORD *)(a1 + 80);
  v10[1] = 3221225472;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(void **)(a1 + 56);
  v11 = v6;
  v12 = v7;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v8;
  v15 = *(id *)(a1 + 64);
  v16 = v3;
  v17 = *(id *)(a1 + 72);
  v9 = v3;
  dispatch_async(v5, v10);

}

void __97__REElementDataSourceController__queue_performContentInvalidateWithElement_expectation_sections___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32));
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)*MEMORY[0x24BDD1118];
    NSStringFromSelector(sel_getElementsInSection_withHandler_);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    RERaiseInternalException(v3, CFSTR("%@ handler of data source %@ cannot be called multiple times"), v4, v5, v6, v7, v8, v9, (uint64_t)v24);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "complete");
    objc_msgSend(*(id *)(a1 + 64), "invalidate");
    objc_msgSend(*(id *)(a1 + 48), "_elementsByRemovingInvalidElements:", *(_QWORD *)(a1 + 72));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = (void *)MEMORY[0x24BDBD1A8];
    if (v10)
      v12 = (void *)v10;
    v13 = v12;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(a1 + 48), "_updateRelevanceProvidersForElement:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v19));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v17);
    }

    v21 = *(void **)(a1 + 48);
    v22 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v21, "_shallowCopiedElements:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v23, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 80), "endOperation");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32));

  }
}

- (id)_groupElements:(id)a3 bySections:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    v12 = (void *)*MEMORY[0x24BDBCAB0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, v21);

          }
          objc_msgSend(v7, "objectForKeyedSubscript:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v14);

        }
        else
        {
          RERaiseInternalException(v12, CFSTR("Cannot find section for element %@.\n%@"), v15, v16, v17, v18, v19, v20, v14);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

  v25 = (void *)objc_msgSend(v7, "copy");
  return v25;
}

- (void)_queue_scheduleUpdate:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableArray addObject:](self->_updates, "addObject:", v4);
  -[REUpNextScheduler schedule](self->_updateScheduler, "schedule");
  RELogForDomain(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[REElementDataSourceController _queue_scheduleUpdate:].cold.1((uint64_t)self, v4, v5);

}

- (void)_queue_performUpdates
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  REElementDataSourceController *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!self->_willUnload)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = self->_updates;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v9, "section");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v10);

          }
          objc_msgSend(v3, "objectForKeyedSubscript:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v9);

        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v6);
    }

    -[NSMutableArray removeAllObjects](self->_updates, "removeAllObjects");
    -[REElementDataSource beginFetchingData](self->_dataSource, "beginFetchingData");
    -[REElementDataSourceController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __54__REElementDataSourceController__queue_performUpdates__block_invoke;
    v16[3] = &unk_24CF8AB18;
    v17 = v3;
    v18 = self;
    v15 = v3;
    objc_msgSend(v14, "elementDataSourceController:performBatchUpdates:", self, v16);

  }
}

uint64_t __54__REElementDataSourceController__queue_performUpdates__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__REElementDataSourceController__queue_performUpdates__block_invoke_2;
  v4[3] = &unk_24CF8B898;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "finishFetchingData");
}

uint64_t __54__REElementDataSourceController__queue_performUpdates__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_processUpdates:forSection:", a3, a2);
}

- (void)_queue_processUpdates:(id)a3 forSection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v33 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v9 = (void *)v7;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v45;
    v36 = v8;
    v37 = v6;
    v35 = v10;
LABEL_3:
    v14 = 0;
    while (2)
    {
      if (*(_QWORD *)v45 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v14);
      switch(objc_msgSend(v15, "type"))
      {
        case 0:
          objc_msgSend(v15, "element");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = v6;
          if (!v18)
          {
            objc_msgSend(v38, "objectForKeyedSubscript:", v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = v8;
            if (v20)
            {
              objc_msgSend(v38, "removeObjectForKey:", v17);
              v19 = v8;
            }
          }
          goto LABEL_19;
        case 1:
          objc_msgSend(v15, "element");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeObjectForKey:", v17);
          objc_msgSend(v38, "removeObjectForKey:", v17);
          objc_msgSend(v6, "objectForKeyedSubscript:", v17);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(v6, "removeObjectForKey:", v17);
            goto LABEL_20;
          }
          v19 = v9;
          goto LABEL_19;
        case 2:
          objc_msgSend(v15, "element");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v16 = v16;
            v22 = v9;
            objc_msgSend(v9, "objectForKeyedSubscript:", v17);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "relevanceProviders");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "relevanceProviders");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v24, "isEqualToArray:", v25);

            v27 = v16;
            if (v26)
            {
              objc_msgSend(v23, "relevanceProviders");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)objc_msgSend(v16, "copyElementWithUpdatedRelevanceProviders:", v28);

            }
            v9 = v22;
            objc_msgSend(v22, "removeObjectForKey:", v17);
            v8 = v36;
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v27, v17);

            v6 = v37;
            v10 = v35;
          }
          else
          {
            v19 = v6;
LABEL_19:
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, v17);
          }
LABEL_20:

LABEL_21:
          if (v12 != ++v14)
            continue;
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          if (!v12)
            goto LABEL_23;
          goto LABEL_3;
        case 4:
          objc_msgSend(v15, "element");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v38;
          goto LABEL_19;
        default:
          goto LABEL_21;
      }
    }
  }
LABEL_23:

  v30 = v9;
  v31 = MEMORY[0x24BDAC760];
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __66__REElementDataSourceController__queue_processUpdates_forSection___block_invoke;
  v43[3] = &unk_24CF8B8C0;
  v43[4] = self;
  objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v43);
  v41[0] = v31;
  v41[1] = 3221225472;
  v41[2] = __66__REElementDataSourceController__queue_processUpdates_forSection___block_invoke_2;
  v41[3] = &unk_24CF8B8E8;
  v41[4] = self;
  v42 = v33;
  v32 = v33;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v41);
  v40[0] = v31;
  v40[1] = 3221225472;
  v40[2] = __66__REElementDataSourceController__queue_processUpdates_forSection___block_invoke_3;
  v40[3] = &unk_24CF8B8C0;
  v40[4] = self;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v40);
  v39[0] = v31;
  v39[1] = 3221225472;
  v39[2] = __66__REElementDataSourceController__queue_processUpdates_forSection___block_invoke_4;
  v39[3] = &unk_24CF8B8C0;
  v39[4] = self;
  objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v39);

}

void __66__REElementDataSourceController__queue_processUpdates_forSection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elementDataSourceController:didRemoveElement:", *(_QWORD *)(a1 + 32), v5);

}

void __66__REElementDataSourceController__queue_processUpdates_forSection___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elementDataSourceController:didAddElement:toSection:", *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 40));

}

void __66__REElementDataSourceController__queue_processUpdates_forSection___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elementDataSourceController:didReloadElement:", *(_QWORD *)(a1 + 32), v5);

}

void __66__REElementDataSourceController__queue_processUpdates_forSection___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elementDataSourceController:didRefreshElement:", *(_QWORD *)(a1 + 32), v5);

}

void __42__REElementDataSourceController_setState___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;

  v2 = (id *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 32), "_isWhitelisted") & 1) == 0 && !*(_QWORD *)(a1 + 40))
    objc_msgSend(*v2, "_queue_resume");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setState:", *(_QWORD *)(a1 + 40));
  RELogForDomain(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __42__REElementDataSourceController_setState___block_invoke_cold_1();

}

- (void)elementWillBecomeVisible:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__REElementDataSourceController_elementWillBecomeVisible___block_invoke;
  v7[3] = &unk_24CF8AB18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __58__REElementDataSourceController_elementWillBecomeVisible___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dataSourceIdentifierFromIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "elementWithIdentifierWillBecomeVisible:", v4);
  RELogForDomain(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2132F7000, v5, OS_LOG_TYPE_DEFAULT, "%@ will become visible: %@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)elementDidBecomeHidden:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__REElementDataSourceController_elementDidBecomeHidden___block_invoke;
  v7[3] = &unk_24CF8AB18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __56__REElementDataSourceController_elementDidBecomeHidden___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  v1 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dataSourceIdentifierFromIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)v1 + 176), "elementWithIdentifierDidBecomeHidden:", v4);
  RELogForDomain(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __56__REElementDataSourceController_elementDidBecomeHidden___block_invoke_cold_1();

}

- (BOOL)hasElementWithId:(id)a3 inSection:(unint64_t)a4
{
  return 0;
}

- (BOOL)hasElementWithId:(id)a3 inSectionWithIdentifier:(id)a4
{
  NSObject *queue;
  id v7;
  id v8;
  void *v9;

  queue = self->_queue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  -[REElementDataSourceController _sectionForElementWithIdentifier:](self, "_sectionForElementWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(v9, "isEqualToString:", v7);
  return (char)v8;
}

- (void)fetchElementWithIdentifierVisible:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__REElementDataSourceController_fetchElementWithIdentifierVisible_withHandler___block_invoke;
    block[3] = &unk_24CF8AA00;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(queue, block);

  }
}

void __79__REElementDataSourceController_fetchElementWithIdentifierVisible_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_elementForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
  objc_msgSend(WeakRetained, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "observerQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v7 = MEMORY[0x24BDAC9B8];
    v8 = MEMORY[0x24BDAC9B8];
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__REElementDataSourceController_fetchElementWithIdentifierVisible_withHandler___block_invoke_2;
  block[3] = &unk_24CF8AA00;
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v2;
  v12 = *(id *)(a1 + 48);
  v9 = v2;
  dispatch_async(v7, block);

}

uint64_t __79__REElementDataSourceController_fetchElementWithIdentifierVisible_withHandler___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 192));
  objc_msgSend(WeakRetained, "elementDataSourceController:isElementVisible:", a1[4], a1[5]);

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)_queue_elementsForIds:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[REElementDataSourceController _elementForIdentifier:](self, "_elementForIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (NSArray)allElements
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allValues](self->_dataSourceElementIdentifierMap, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)-[objc_class bundleIdentifier](self->_dataSourceClass, "bundleIdentifier");
}

- (NSString)applicationBundleIdentifier
{
  return (NSString *)-[objc_class applicationBundleIdentifier](self->_dataSourceClass, "applicationBundleIdentifier");
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p> %@"), objc_opt_class(), self, self->_dataSourceClass);
}

- (Class)dataSourceClass
{
  return self->_dataSourceClass;
}

- (unint64_t)state
{
  return self->_state;
}

- (REElementDataSourceControllerDelegate)delegate
{
  return (REElementDataSourceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceClass, 0);
  objc_storeStrong((id *)&self->_contentAttributes, 0);
  objc_destroyWeak((id *)&self->_relevanceEngine);
  objc_storeStrong((id *)&self->_providerEnvironment, 0);
  objc_storeStrong((id *)&self->_supportedSections, 0);
  objc_storeStrong((id *)&self->_enqueuedBlocks, 0);
  objc_storeStrong((id *)&self->_sectionsToReloadWhilePaused, 0);
  objc_storeStrong((id *)&self->_reloadScheduler, 0);
  objc_storeStrong((id *)&self->_updateScheduler, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataSourceElementIdentifierMap, 0);
  objc_storeStrong((id *)&self->_dataSourceElementSectionMap, 0);
  objc_storeStrong((id *)&self->_dataSourceElements, 0);
  objc_storeStrong((id *)&self->_loggingHeader, 0);
}

- (NSString)name
{
  void *v2;
  void *v3;

  NSStringFromClass(self->_dataSourceClass);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("Controller"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)supportedSections
{
  return -[NSSet allObjects](self->_supportedSections, "allObjects");
}

- (BOOL)allowsLocationUse
{
  return self->_allowsLocationUse;
}

- (BOOL)hasDataAvailable
{
  return self->_hasDataAvailable;
}

- (unint64_t)updateCount
{
  return -[NSMutableArray count](self->_updates, "count");
}

- (NSArray)allProvidedElements
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allValues](self->_dataSourceElementIdentifierMap, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

void __39__REElementDataSourceController_resume__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_2132F7000, v0, v1, "%@ SKIPPING open data source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __38__REElementDataSourceController_pause__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_2132F7000, v0, v1, "%@ SKIPPING close data source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addElements:(uint64_t)a1 toSectionWithIdentifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "Trying to add element to unsupported section %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __69__REElementDataSourceController_addElements_toSectionWithIdentifier___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  REElementsIdsLoggableString(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_2132F7000, v2, v3, "Trying to add already existing elements with ids %@", v4, v5, v6, v7, 2u);

}

- (void)reloadElement:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2132F7000, a1, a3, "Trying to reload nil element", a5, a6, a7, a8, 0);
}

void __47__REElementDataSourceController_reloadElement___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_2132F7000, v0, v1, "Trying to update nonexistant element with id %@ in section %@");
  OUTLINED_FUNCTION_3();
}

- (void)refreshElement:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2132F7000, a1, a3, "Trying to refresh nil element", a5, a6, a7, a8, 0);
}

void __48__REElementDataSourceController_refreshElement___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_2132F7000, v0, v1, "Trying to refresh nonexistant element with id %@ in section %@");
  OUTLINED_FUNCTION_3();
}

void __55__REElementDataSourceController_removeElementsWithIds___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "allObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  REElementsIdsLoggableString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_2132F7000, v3, v4, "Trying to remove nonexistant elements with ids %@", v5, v6, v7, v8, 2u);

}

- (void)_queue_scheduleUpdate:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 8);
  REStringForUpdateType(objc_msgSend(a2, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "element");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "section");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138413058;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  v13 = 2112;
  v14 = v7;
  v15 = 2048;
  v16 = v8;
  _os_log_debug_impl(&dword_2132F7000, a3, OS_LOG_TYPE_DEBUG, "%@ scheduled update %@ of element %@ in section %lu", (uint8_t *)&v9, 0x2Au);

}

void __42__REElementDataSourceController_setState___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0(&dword_2132F7000, v0, v1, "%@ setting state: %ld");
  OUTLINED_FUNCTION_3();
}

void __56__REElementDataSourceController_elementDidBecomeHidden___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0(&dword_2132F7000, v0, v1, "%@ did become hidden: %@");
  OUTLINED_FUNCTION_3();
}

@end

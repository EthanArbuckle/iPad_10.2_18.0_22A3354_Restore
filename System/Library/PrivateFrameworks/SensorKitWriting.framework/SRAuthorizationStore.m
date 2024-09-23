@implementation SRAuthorizationStore

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    SRLogAuthorizationStore = (uint64_t)os_log_create("com.apple.SensorKit", "AuthorizationStore");
}

- (SRAuthorizationStore)initWithSensors:(id)a3
{
  SRTCCStorePassThrough *v5;
  SRAuthorizationStore *v6;
  SRAuthorizationStore *v7;
  void *v8;
  SEL v9;
  void *v10;
  SEL v11;
  NSObject *v12;
  void *v13;
  NSSet *sensors;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  SRAuthorizationStore *v30;
  void *v31;
  objc_super v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  _QWORD block[18];

  block[16] = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(SRTCCStorePassThrough);
  if (self)
  {
    v32.receiver = self;
    v32.super_class = (Class)SRAuthorizationStore;
    v6 = -[SRAuthorizationStore init](&v32, sel_init);
    if (v6)
    {
      v7 = v6;
      v6->_tccStore = (SRTCCStore *)v5;
      v7->_sensors = (NSSet *)a3;
      v8 = (void *)objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      objc_setProperty_nonatomic(v7, v9, v8, 16);
      v10 = (void *)objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      objc_setProperty_nonatomic(v7, v11, v10, 24);
      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7->_updateQueue = (OS_dispatch_queue *)dispatch_queue_create("SRAuthorizationStore.updateQueue", v12);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[NSSet count](v7->_sensors, "count"));
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[NSSet count](v7->_sensors, "count"));
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v30 = v7;
      sensors = v7->_sensors;
      v15 = -[NSSet countByEnumeratingWithState:objects:count:](sensors, "countByEnumeratingWithState:objects:count:", &v33, block, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v34 != v17)
              objc_enumerationMutation(sensors);
            v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            v20 = (void *)MEMORY[0x2495465E0]();
            v21 = +[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:", v19);
            if (v21)
            {
              v22 = v21;
              v23 = objc_msgSend(v21, "authorizationService");
              v24 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", v23);
              if (!v24)
              {
                v25 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, v23);

                v24 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", v23);
              }
              objc_msgSend(v24, "addObject:", objc_msgSend(v22, "name"));
              v26 = objc_msgSend(v22, "writerAuthorizationService");
              if (v26)
                objc_msgSend(v31, "setObject:forKeyedSubscript:", objc_msgSend(v22, "name"), v26);
            }
            else
            {
              v27 = SRLogAuthorizationStore;
              if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543362;
                v38 = v19;
                _os_log_fault_impl(&dword_245CD7000, v27, OS_LOG_TYPE_FAULT, "No sensor description found for %{public}@", buf, 0xCu);
              }
            }
            objc_autoreleasePoolPop(v20);
          }
          v16 = -[NSSet countByEnumeratingWithState:objects:count:](sensors, "countByEnumeratingWithState:objects:count:", &v33, block, 16);
        }
        while (v16);
      }
      self = v30;
      -[SRAuthorizationStore setReaderAuthorizationGroups:](v30, "setReaderAuthorizationGroups:", v13);

      -[SRAuthorizationStore setWriterAuthorizationGroups:](v30, "setWriterAuthorizationGroups:", v31);
      -[SRAuthorizationStore listenForAuthorizationUpdates:](v30, "listenForAuthorizationUpdates:", 1);
      v28 = -[SRAuthorizationStore updateQueue](v30, "updateQueue");
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __51__SRAuthorizationStore_startUpdatingAuthorizations__block_invoke;
      block[3] = &unk_2516F2118;
      block[4] = v30;
      dispatch_sync(v28, block);
    }
    else
    {
      self = 0;
    }
  }

  return self;
}

+ (id)sharedAuthorizationStoreForSensors:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SRAuthorizationStore_sharedAuthorizationStoreForSensors___block_invoke;
  block[3] = &unk_2516F2118;
  block[4] = a3;
  if (qword_25751A038 != -1)
    dispatch_once(&qword_25751A038, block);
  return (id)_MergedGlobals_1;
}

SRAuthorizationStore *__59__SRAuthorizationStore_sharedAuthorizationStoreForSensors___block_invoke(uint64_t a1)
{
  SRAuthorizationStore *result;

  result = -[SRAuthorizationStore initWithSensors:]([SRAuthorizationStore alloc], "initWithSensors:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1 = (uint64_t)result;
  return result;
}

+ (SRAuthorizationStore)allSensorsStore
{
  id v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SRAuthorizationStore *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v3 = (void *)MEMORY[0x2495465E0]();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (_QWORD *)+[SRSensorsCache defaultCache]();
  v5 = -[SRSensorsCache allSensorDescriptions](v4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "name", (_QWORD)v12));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  objc_autoreleasePoolPop(v3);
  v10 = -[SRAuthorizationStore initWithSensors:]([SRAuthorizationStore alloc], "initWithSensors:", v2);

  return v10;
}

- (void)dealloc
{
  SEL v3;
  SEL v4;
  SEL v5;
  objc_super v6;

  -[SRAuthorizationStore setReaderAuthorizationValues:](self, "setReaderAuthorizationValues:", 0);
  -[SRAuthorizationStore setWriterAuthorizationValues:](self, "setWriterAuthorizationValues:", 0);
  -[SRAuthorizationStore setReaderLastModifiedAuthorizationTimes:](self, "setReaderLastModifiedAuthorizationTimes:", 0);
  -[SRAuthorizationStore setUpdateQueue:](self, "setUpdateQueue:", 0);
  objc_setProperty_nonatomic(self, v3, 0, 16);
  objc_setProperty_nonatomic(self, v4, 0, 24);
  -[SRAuthorizationStore listenForAuthorizationUpdates:](self, "listenForAuthorizationUpdates:", 0);
  objc_setProperty_nonatomic(self, v5, 0, 32);
  -[SRAuthorizationStore setReaderAuthorizationGroups:](self, "setReaderAuthorizationGroups:", 0);
  -[SRAuthorizationStore setWriterAuthorizationGroups:](self, "setWriterAuthorizationGroups:", 0);
  v6.receiver = self;
  v6.super_class = (Class)SRAuthorizationStore;
  -[SRAuthorizationStore dealloc](&v6, sel_dealloc);
}

- (void)listenForAuthorizationUpdates:(BOOL)a3
{
  int *p_notifyToken;
  int notifyToken;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  OS_dispatch_queue *v10;
  uint32_t v11;
  NSObject *v12;
  NSHashTable *readerAuthorizationDelegates;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSHashTable *writerAuthorizationDelegates;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD handler[4];
  id v34;
  id buf[2];
  _BYTE v36[128];
  uint8_t v37[128];
  uint8_t v38[4];
  uint32_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  p_notifyToken = &self->_notifyToken;
  notifyToken = self->_notifyToken;
  v7 = SRLogAuthorizationStore;
  v8 = os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_INFO);
  if (a3)
  {
    if (notifyToken)
    {
      if (!v8)
        return;
      LOWORD(buf[0]) = 0;
      v9 = "Asked to listen for TCC updates but we're already listening";
LABEL_36:
      _os_log_impl(&dword_245CD7000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)buf, 2u);
      return;
    }
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_245CD7000, v7, OS_LOG_TYPE_INFO, "Registering for TCC updates", (uint8_t *)buf, 2u);
    }
    objc_initWeak(buf, self);
    v10 = -[SRAuthorizationStore updateQueue](self, "updateQueue");
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __54__SRAuthorizationStore_listenForAuthorizationUpdates___block_invoke;
    handler[3] = &unk_2516F2190;
    objc_copyWeak(&v34, buf);
    v11 = notify_register_dispatch("com.apple.tcc.access.changed", p_notifyToken, (dispatch_queue_t)v10, handler);
    if (v11)
    {
      v12 = SRLogAuthorizationStore;
      if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v38 = 67240192;
        v39 = v11;
        _os_log_fault_impl(&dword_245CD7000, v12, OS_LOG_TYPE_FAULT, "Failed to register for TCC notifications.  Got status %{public}d", v38, 8u);
      }
      -[SRAuthorizationStore setReaderAuthorizationValues:](self, "setReaderAuthorizationValues:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionary"));
      -[SRAuthorizationStore setReaderLastModifiedAuthorizationTimes:](self, "setReaderLastModifiedAuthorizationTimes:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionary"));
      -[SRAuthorizationStore setWriterAuthorizationValues:](self, "setWriterAuthorizationValues:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionary"));
      readerAuthorizationDelegates = self->_readerAuthorizationDelegates;
      objc_sync_enter(readerAuthorizationDelegates);
      v14 = (void *)-[NSHashTable copy](self->_readerAuthorizationDelegates, "copy");
      objc_sync_exit(readerAuthorizationDelegates);
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v30 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v18, "authorizationStore:didDetermineInitialAuthorizationValues:", self, -[SRAuthorizationStore readerAuthorizationValues](self, "readerAuthorizationValues"));
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v15);
      }

      writerAuthorizationDelegates = self->_writerAuthorizationDelegates;
      objc_sync_enter(writerAuthorizationDelegates);
      v20 = (void *)-[NSHashTable copy](self->_writerAuthorizationDelegates, "copy");
      objc_sync_exit(writerAuthorizationDelegates);
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v26 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v24, "authorizationStore:didDetermineInitialAuthorizationValues:", self, -[SRAuthorizationStore writerAuthorizationValues](self, "writerAuthorizationValues"));
          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
        }
        while (v21);
      }

    }
    objc_destroyWeak(&v34);
    objc_destroyWeak(buf);
  }
  else
  {
    if (!notifyToken)
    {
      if (!v8)
        return;
      LOWORD(buf[0]) = 0;
      v9 = "Asked to stop listen for TCC updates but we are already not listening";
      goto LABEL_36;
    }
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_245CD7000, v7, OS_LOG_TYPE_INFO, "Unregistering for TCC updates", (uint8_t *)buf, 2u);
      notifyToken = *p_notifyToken;
    }
    notify_cancel(notifyToken);
    *p_notifyToken = 0;
  }
}

void __54__SRAuthorizationStore_listenForAuthorizationUpdates___block_invoke(uint64_t a1)
{
  id *Weak;

  Weak = (id *)objc_loadWeak((id *)(a1 + 32));
  -[SRAuthorizationStore updateAuthorizations](Weak);
}

- (void)updateAuthorizations
{
  NSObject *v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  uint64_t v25;
  uint64_t m;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  void *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  id *v35;
  uint64_t ii;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t jj;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  char *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t kk;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  const char *v61;
  uint32_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  NSObject *v78;
  BOOL v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t mm;
  uint64_t v84;
  uint64_t v85;
  uint64_t nn;
  void *v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *context;
  void *contexta;
  uint64_t v101;
  void *v102;
  id v103;
  id v104;
  id v105;
  id obj;
  char *obja;
  id objb;
  id v109;
  id v110;
  id v111;
  char *v112;
  id v113;
  os_activity_scope_state_s state;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _QWORD v132[2];
  uint64_t (*v133)(uint64_t, uint64_t);
  void *v134;
  void *v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  uint8_t v148[32];
  __int128 v149;
  __int128 v150;
  uint8_t v151[4];
  uint64_t v152;
  __int16 v153;
  int v154;
  __int16 v155;
  id v156;
  uint8_t v157[32];
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  uint8_t v164[128];
  uint8_t buf[136];
  uint64_t v166;

  v166 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return;
  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(a1, "updateQueue"));
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v1 = _os_activity_create(&dword_245CD7000, "Retrieving fresh authorizations from TCC", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v1, &state);
  v2 = SRLogAuthorizationStore;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_245CD7000, v2, OS_LOG_TYPE_INFO, "Retrieving fresh authorizations from TCC", buf, 2u);
  }
  v97 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v132[0] = MEMORY[0x24BDAC760];
  v132[1] = 3221225472;
  v133 = __64__SRAuthorizationStore_readerAuthorizationInformationForSensors__block_invoke;
  v134 = &unk_2516F23C8;
  v135 = v97;
  v3 = (void *)objc_msgSend(a1, "readerAuthorizationGroups");
  v158 = 0u;
  v159 = 0u;
  memset(v157, 0, sizeof(v157));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v157, buf, 16);
  if (v4)
  {
    v5 = **(_QWORD **)&v157[16];
    v6 = MEMORY[0x24BDBD1C0];
    v7 = MEMORY[0x24BDBD1C8];
    v91 = **(_QWORD **)&v157[16];
    v93 = v3;
    do
    {
      v101 = 0;
      v95 = v4;
      do
      {
        if (**(_QWORD **)&v157[16] != v5)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*(_QWORD *)&v157[8] + 8 * v101);
        context = (void *)MEMORY[0x2495465E0]();
        obj = (id)objc_msgSend(a1[4], "bundleIdentifiersForService:", v8);
        v9 = objc_msgSend(a1[4], "bundleIdentifiersDisabledForService:", v8);
        v103 = (id)v9;
        if (obj)
          v10 = v9 == 0;
        else
          v10 = 1;
        if (v10)
        {
          v11 = SRLogAuthorizationStore;
          if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v151 = 138543362;
            v152 = v8;
            _os_log_impl(&dword_245CD7000, v11, OS_LOG_TYPE_INFO, "Could not retrieve authorization information for TCC service %{public}@", v151, 0xCu);
          }
        }
        v12 = objc_msgSend(a1[4], "isOverriddenForService:", v8);
        v13 = SRLogAuthorizationStore;
        if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v151 = 138543874;
          v152 = v8;
          v153 = 1026;
          v154 = v12;
          v155 = 2114;
          v156 = obj;
          _os_log_impl(&dword_245CD7000, v13, OS_LOG_TYPE_DEFAULT, "Authorized Bundle Ids for %{public}@, overridden %{public, BOOL}d, %{public}@", v151, 0x1Cu);
          v13 = SRLogAuthorizationStore;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v151 = 138543874;
          v152 = v8;
          v153 = 1026;
          v154 = v12;
          v155 = 2114;
          v156 = v103;
          _os_log_impl(&dword_245CD7000, v13, OS_LOG_TYPE_DEFAULT, "Deauthorized Bundle Ids for %{public}@, overridden %{public, BOOL}d, %{public}@", v151, 0x1Cu);
        }
        v14 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", v8);
        v149 = 0u;
        v150 = 0u;
        memset(v148, 0, sizeof(v148));
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v148, v164, 16);
        if (v15)
        {
          v16 = **(_QWORD **)&v148[16];
          if (v12)
            v17 = v7;
          else
            v17 = v6;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (**(_QWORD **)&v148[16] != v16)
                objc_enumerationMutation(v14);
              objc_msgSend((id)v133((uint64_t)v132, (uint64_t)CFSTR("com.apple.sensorkit.dummy-bundle-id")), "setObject:forKeyedSubscript:", v17, *(_QWORD *)(*(_QWORD *)&v148[8] + 8 * i));
            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v148, v164, 16);
          }
          while (v15);
        }
        v130 = 0u;
        v131 = 0u;
        v128 = 0u;
        v129 = 0u;
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, &v160, 16);
        if (v19)
        {
          v109 = *(id *)v129;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(id *)v129 != v109)
                objc_enumerationMutation(obj);
              v21 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * j);
              v124 = 0u;
              v125 = 0u;
              v126 = 0u;
              v127 = 0u;
              v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v124, &v144, 16);
              if (v22)
              {
                v23 = *(_QWORD *)v125;
                do
                {
                  for (k = 0; k != v22; ++k)
                  {
                    if (*(_QWORD *)v125 != v23)
                      objc_enumerationMutation(v14);
                    objc_msgSend((id)v133((uint64_t)v132, v21), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * k));
                  }
                  v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v124, &v144, 16);
                }
                while (v22);
              }
            }
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, &v160, 16);
          }
          while (v19);
        }
        v122 = 0u;
        v123 = 0u;
        v120 = 0u;
        v121 = 0u;
        v25 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v120, &v140, 16);
        if (v25)
        {
          v110 = *(id *)v121;
          do
          {
            for (m = 0; m != v25; ++m)
            {
              if (*(id *)v121 != v110)
                objc_enumerationMutation(v103);
              v27 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * m);
              v116 = 0u;
              v117 = 0u;
              v118 = 0u;
              v119 = 0u;
              v28 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v116, &v136, 16);
              if (v28)
              {
                v29 = *(_QWORD *)v117;
                do
                {
                  for (n = 0; n != v28; ++n)
                  {
                    if (*(_QWORD *)v117 != v29)
                      objc_enumerationMutation(v14);
                    objc_msgSend((id)v133((uint64_t)v132, v27), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * n));
                  }
                  v28 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v116, &v136, 16);
                }
                while (v28);
              }
            }
            v25 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v120, &v140, 16);
          }
          while (v25);
        }
        objc_autoreleasePoolPop(context);
        v3 = v93;
        ++v101;
        v5 = v91;
      }
      while (v101 != v95);
      v4 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", v157, buf, 16);
    }
    while (v4);
  }
  v88 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", objc_msgSend(a1, "readerAuthorizationValues"));
  objc_msgSend(a1, "setReaderAuthorizationValues:", v97);
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  v163 = 0u;
  v31 = (void *)objc_msgSend(a1, "readerAuthorizationValues");
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v160, buf, 16);
  if (v32)
  {
    v111 = v31;
    v33 = 0;
    v34 = *(_QWORD *)v161;
    v35 = a1;
    do
    {
      for (ii = 0; ii != v32; ++ii)
      {
        if (*(_QWORD *)v161 != v34)
          objc_enumerationMutation(v111);
        v37 = *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * ii);
        v144 = 0u;
        v145 = 0u;
        v146 = 0u;
        v147 = 0u;
        v38 = (void *)objc_msgSend((id)objc_msgSend(v35, "readerAuthorizationValues"), "objectForKeyedSubscript:", v37);
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v144, v164, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v145;
          while (2)
          {
            for (jj = 0; jj != v39; ++jj)
            {
              if (*(_QWORD *)v145 != v40)
                objc_enumerationMutation(v38);
              if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "readerAuthorizationValues"), "objectForKeyedSubscript:", v37), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * jj)), "BOOLValue") & 1) != 0)
              {
                v33 = 1;
                goto LABEL_74;
              }
            }
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v144, v164, 16);
            if (v39)
              continue;
            break;
          }
LABEL_74:
          v35 = a1;
        }
      }
      v32 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v160, buf, 16);
    }
    while (v32);
  }
  else
  {
    v33 = 0;
    v35 = a1;
  }
  objc_msgSend(v35, "setSensorKitActive:", v33 & 1);
  v42 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v146 = 0u;
  v147 = 0u;
  v144 = 0u;
  v145 = 0u;
  v43 = (void *)objc_msgSend(a1, "readerAuthorizationValues");
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v144, buf, 16);
  if (!v44)
    goto LABEL_111;
  v92 = *(_QWORD *)v145;
  v89 = v43;
  do
  {
    v96 = 0;
    v90 = v44;
    do
    {
      if (*(_QWORD *)v145 != v92)
        objc_enumerationMutation(v89);
      v45 = *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * v96);
      v94 = (void *)MEMORY[0x2495465E0]();
      v46 = (void *)objc_msgSend(a1[4], "informationForBundleId:", v45);
      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v140, v164, 16);
      if (v47)
      {
        v104 = *(id *)v141;
        v102 = v46;
        do
        {
          obja = (char *)v47;
          v48 = 0;
          do
          {
            if (*(id *)v141 != v104)
              objc_enumerationMutation(v46);
            v49 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * (_QWORD)v48);
            v50 = objc_msgSend(v49, "objectForKeyedSubscript:", *MEMORY[0x24BEB3828]);
            v112 = v48;
            if (!v50)
            {
              v59 = SRLogAuthorizationStore;
              if (!os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_ERROR))
                goto LABEL_104;
              *(_DWORD *)v157 = 138543362;
              *(_QWORD *)&v157[4] = v49;
              v60 = v59;
              v61 = "Couldn't find a TCC service in the TCC access dictionary %{public}@";
              v62 = 12;
LABEL_107:
              _os_log_error_impl(&dword_245CD7000, v60, OS_LOG_TYPE_ERROR, v61, v157, v62);
              goto LABEL_104;
            }
            v51 = (void *)objc_msgSend(v49, "objectForKeyedSubscript:", *MEMORY[0x24BEB3820]);
            if (!v51)
            {
              v63 = SRLogAuthorizationStore;
              if (!os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_ERROR))
                goto LABEL_104;
              *(_DWORD *)v157 = 138543618;
              *(_QWORD *)&v157[4] = v45;
              *(_WORD *)&v157[12] = 2114;
              *(_QWORD *)&v157[14] = v50;
              v60 = v63;
              v61 = "No last modified date for authorization of bundle %{public}@, service: %{public}@";
              v62 = 22;
              goto LABEL_107;
            }
            if (!objc_msgSend(v42, "objectForKeyedSubscript:", v45))
            {
              v52 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              objc_msgSend(v42, "setObject:forKeyedSubscript:", v52, v45);

            }
            v138 = 0u;
            v139 = 0u;
            v136 = 0u;
            v137 = 0u;
            v53 = (void *)objc_msgSend((id)objc_msgSend(a1, "readerAuthorizationGroups"), "objectForKeyedSubscript:", v50);
            v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v136, &v160, 16);
            if (v54)
            {
              v55 = *(_QWORD *)v137;
              do
              {
                for (kk = 0; kk != v54; ++kk)
                {
                  if (*(_QWORD *)v137 != v55)
                    objc_enumerationMutation(v53);
                  v57 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * kk);
                  v58 = (void *)MEMORY[0x24BDD16E0];
                  objc_msgSend(v51, "timeIntervalSinceReferenceDate");
                  objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", v45), "setObject:forKeyedSubscript:", objc_msgSend(v58, "numberWithDouble:"), v57);
                }
                v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v136, &v160, 16);
              }
              while (v54);
            }
LABEL_104:
            v48 = v112 + 1;
            v46 = v102;
          }
          while (v112 + 1 != obja);
          v47 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v140, v164, 16);
        }
        while (v47);
      }
      objc_autoreleasePoolPop(v94);
      ++v96;
    }
    while (v96 != v90);
    v44 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v144, buf, 16);
  }
  while (v44);
LABEL_111:
  objc_msgSend(a1, "setReaderLastModifiedAuthorizationTimes:", v42);

  v64 = a1[2];
  objc_sync_enter(v64);
  v65 = (void *)objc_msgSend(a1[2], "copy");
  objc_sync_exit(v64);
  -[SRAuthorizationStore updateToNewAuthorizations:fromOldAuthorizations:delegates:]((uint64_t)a1, v97, v88, v65);

  v66 = a1[3];
  objc_sync_enter(v66);
  contexta = (void *)objc_msgSend(a1[3], "copy");
  objc_sync_exit(v66);
  v67 = objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  *(_QWORD *)v157 = MEMORY[0x24BDAC760];
  *(_QWORD *)&v157[8] = 3221225472;
  *(_QWORD *)&v157[16] = __64__SRAuthorizationStore_writerAuthorizationInformationForSensors__block_invoke;
  *(_QWORD *)&v157[24] = &unk_2516F23C8;
  *(_QWORD *)&v158 = v67;
  v68 = (void *)objc_msgSend(a1, "writerAuthorizationGroups");
  v146 = 0u;
  v147 = 0u;
  v144 = 0u;
  v145 = 0u;
  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v144, buf, 16);
  v98 = (void *)v67;
  if (v69)
  {
    v105 = *(id *)v145;
    v70 = MEMORY[0x24BDBD1C0];
    v71 = MEMORY[0x24BDBD1C8];
    v113 = v68;
    do
    {
      v72 = 0;
      objb = (id)v69;
      do
      {
        if (*(id *)v145 != v105)
          objc_enumerationMutation(v113);
        v73 = *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * (_QWORD)v72);
        v74 = (void *)MEMORY[0x2495465E0]();
        v75 = (void *)objc_msgSend(a1[4], "bundleIdentifiersForService:", v73);
        v76 = objc_msgSend(a1[4], "bundleIdentifiersDisabledForService:", v73);
        v77 = (void *)v76;
        v78 = SRLogAuthorizationStore;
        if (v75)
          v79 = v76 == 0;
        else
          v79 = 1;
        if (v79 && os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v148 = 138543362;
          *(_QWORD *)&v148[4] = v73;
          _os_log_impl(&dword_245CD7000, v78, OS_LOG_TYPE_INFO, "Could not retrieve authorization information for TCC service %{public}@", v148, 0xCu);
          v78 = SRLogAuthorizationStore;
        }
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v148 = 138543618;
          *(_QWORD *)&v148[4] = v73;
          *(_WORD *)&v148[12] = 2114;
          *(_QWORD *)&v148[14] = v75;
          _os_log_impl(&dword_245CD7000, v78, OS_LOG_TYPE_DEFAULT, "Authorized Bundle Ids for %{public}@, %{public}@", v148, 0x16u);
          v78 = SRLogAuthorizationStore;
        }
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v148 = 138543618;
          *(_QWORD *)&v148[4] = v73;
          *(_WORD *)&v148[12] = 2114;
          *(_QWORD *)&v148[14] = v77;
          _os_log_impl(&dword_245CD7000, v78, OS_LOG_TYPE_DEFAULT, "Deauthorized Bundle Ids for %{public}@, %{public}@", v148, 0x16u);
        }
        v80 = objc_msgSend(v113, "objectForKeyedSubscript:", v73);
        v142 = 0u;
        v143 = 0u;
        v140 = 0u;
        v141 = 0u;
        v81 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v140, v164, 16);
        if (v81)
        {
          v82 = *(_QWORD *)v141;
          do
          {
            for (mm = 0; mm != v81; ++mm)
            {
              if (*(_QWORD *)v141 != v82)
                objc_enumerationMutation(v75);
              objc_msgSend((id)(*(uint64_t (**)(uint64_t, uint64_t))&v157[16])((uint64_t)v157, *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * mm)), "setObject:forKeyedSubscript:", v71, v80);
            }
            v81 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v140, v164, 16);
          }
          while (v81);
        }
        v138 = 0u;
        v139 = 0u;
        v136 = 0u;
        v137 = 0u;
        v84 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v136, &v160, 16);
        if (v84)
        {
          v85 = *(_QWORD *)v137;
          do
          {
            for (nn = 0; nn != v84; ++nn)
            {
              if (*(_QWORD *)v137 != v85)
                objc_enumerationMutation(v77);
              objc_msgSend((id)(*(uint64_t (**)(uint64_t, uint64_t))&v157[16])((uint64_t)v157, *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * nn)), "setObject:forKeyedSubscript:", v70, v80);
            }
            v84 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v136, &v160, 16);
          }
          while (v84);
        }
        objc_autoreleasePoolPop(v74);
        v72 = (char *)v72 + 1;
      }
      while (v72 != objb);
      v69 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v144, buf, 16);
    }
    while (v69);
  }
  v87 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", objc_msgSend(a1, "writerAuthorizationValues"));
  objc_msgSend(a1, "setWriterAuthorizationValues:", v98);
  -[SRAuthorizationStore updateToNewAuthorizations:fromOldAuthorizations:delegates:]((uint64_t)a1, v98, v87, contexta);

  os_activity_scope_leave(&state);
}

void __51__SRAuthorizationStore_startUpdatingAuthorizations__block_invoke(uint64_t a1)
{
  -[SRAuthorizationStore updateAuthorizations](*(id **)(a1 + 32));
}

- (uint64_t)updateToNewAuthorizations:(void *)a3 fromOldAuthorizations:(void *)a4 delegates:
{
  void *v6;
  void *v7;
  uint64_t result;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  id obj;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v47;
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
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  id v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v6 = a3;
    v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", objc_msgSend(a3, "allKeys"));
    objc_msgSend(v7, "unionSet:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", objc_msgSend(a2, "allKeys")));
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v7;
    result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
    v45 = result;
    if (result)
    {
      v41 = *(_QWORD *)v61;
      *(_QWORD *)&v9 = 138543618;
      v39 = v9;
      v43 = a2;
      v44 = a4;
      v42 = v6;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v61 != v41)
            objc_enumerationMutation(obj);
          v47 = v10;
          v11 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v10);
          v12 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", v11, v39);
          v13 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", v11);
          v14 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v57;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v57 != v17)
                  objc_enumerationMutation(v13);
                v19 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
                v20 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", v19);
                v21 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", v19);
                if (objc_msgSend(v20, "BOOLValue") && !objc_msgSend(v21, "BOOLValue")
                  || v20 && (objc_msgSend(v20, "BOOLValue") & 1) == 0 && !v21)
                {
                  objc_msgSend(v14, "addObject:", v19);
                }
              }
              v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
            }
            while (v16);
          }
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v22 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v53;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v53 != v24)
                  objc_enumerationMutation(v12);
                v26 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
                v27 = objc_msgSend(v13, "objectForKeyedSubscript:", v26);
                if (v27)
                {
                  v28 = (void *)v27;
                  if ((objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", v26), "BOOLValue") & 1) == 0)
                  {
                    if (objc_msgSend(v12, "objectForKeyedSubscript:", v26))
                      continue;
                  }
                  if ((objc_msgSend(v28, "BOOLValue") & 1) != 0)
                    continue;
                }
                objc_msgSend(v14, "addObject:", v26);
              }
              v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
            }
            while (v23);
          }
          a2 = v43;
          if (objc_msgSend(v14, "count"))
          {
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            v29 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v48, v72, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v49;
              do
              {
                for (k = 0; k != v30; ++k)
                {
                  if (*(_QWORD *)v49 != v31)
                    objc_enumerationMutation(v44);
                  v33 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    objc_msgSend(v33, "authorizationStore:didUpdateAuthorizationsForBundleId:sensors:", a1, v11, v14);
                }
                v30 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v48, v72, 16);
              }
              while (v30);
            }
            v34 = SRLogAuthorizationStore;
            if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v39;
              v69 = v11;
              v70 = 2114;
              v71 = v14;
              _os_log_impl(&dword_245CD7000, v34, OS_LOG_TYPE_DEFAULT, "Authorization Changed for bundle id %{public}@ for sensors %{public}@", buf, 0x16u);
            }
          }

          v10 = v47 + 1;
          v6 = v42;
        }
        while (v47 + 1 != v45);
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
        v45 = result;
      }
      while (result);
    }
  }
  else
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    result = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    if (result)
    {
      v35 = result;
      v36 = *(_QWORD *)v65;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v65 != v36)
            objc_enumerationMutation(a4);
          v38 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v37);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v38, "authorizationStore:didDetermineInitialAuthorizationValues:", a1, a2);
          ++v37;
        }
        while (v35 != v37);
        result = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
        v35 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)addReaderAuthorizationDelegate:(id)a3
{
  NSHashTable *readerAuthorizationDelegates;
  NSHashTable *v6;

  if (self)
  {
    readerAuthorizationDelegates = self->_readerAuthorizationDelegates;
    objc_sync_enter(readerAuthorizationDelegates);
    v6 = self->_readerAuthorizationDelegates;
  }
  else
  {
    objc_sync_enter(0);
    readerAuthorizationDelegates = 0;
    v6 = 0;
  }
  -[NSHashTable addObject:](v6, "addObject:", a3);
  if (-[SRAuthorizationStore readerAuthorizationValues](self, "readerAuthorizationValues")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "authorizationStore:didDetermineInitialAuthorizationValues:", self, -[SRAuthorizationStore readerAuthorizationValues](self, "readerAuthorizationValues"));
  }
  objc_sync_exit(readerAuthorizationDelegates);
}

- (void)removeReaderAuthorizationDelegate:(id)a3
{
  NSHashTable *readerAuthorizationDelegates;
  NSHashTable *v6;

  if (self)
  {
    readerAuthorizationDelegates = self->_readerAuthorizationDelegates;
    objc_sync_enter(readerAuthorizationDelegates);
    v6 = self->_readerAuthorizationDelegates;
  }
  else
  {
    objc_sync_enter(0);
    readerAuthorizationDelegates = 0;
    v6 = 0;
  }
  -[NSHashTable removeObject:](v6, "removeObject:", a3);
  objc_sync_exit(readerAuthorizationDelegates);
}

- (void)addWriterAuthorizationDelegate:(id)a3
{
  NSHashTable *writerAuthorizationDelegates;
  NSHashTable *v6;

  if (self)
  {
    writerAuthorizationDelegates = self->_writerAuthorizationDelegates;
    objc_sync_enter(writerAuthorizationDelegates);
    v6 = self->_writerAuthorizationDelegates;
  }
  else
  {
    objc_sync_enter(0);
    writerAuthorizationDelegates = 0;
    v6 = 0;
  }
  -[NSHashTable addObject:](v6, "addObject:", a3);
  if (-[SRAuthorizationStore writerAuthorizationValues](self, "writerAuthorizationValues")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "authorizationStore:didDetermineInitialAuthorizationValues:", self, -[SRAuthorizationStore writerAuthorizationValues](self, "writerAuthorizationValues"));
  }
  objc_sync_exit(writerAuthorizationDelegates);
}

- (void)removeWriterAuthorizationDelegate:(id)a3
{
  NSHashTable *writerAuthorizationDelegates;
  NSHashTable *v6;

  if (self)
  {
    writerAuthorizationDelegates = self->_writerAuthorizationDelegates;
    objc_sync_enter(writerAuthorizationDelegates);
    v6 = self->_writerAuthorizationDelegates;
  }
  else
  {
    objc_sync_enter(0);
    writerAuthorizationDelegates = 0;
    v6 = 0;
  }
  -[NSHashTable removeObject:](v6, "removeObject:", a3);
  objc_sync_exit(writerAuthorizationDelegates);
}

- (BOOL)sensorHasReaderAuthorization:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[SRAuthorizationStore readerAuthorizationBundleIdValues](self, "readerAuthorizationBundleIdValues", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (-[SRAuthorizationStore sensorHasReaderAuthorization:forBundleId:](self, "sensorHasReaderAuthorization:forBundleId:", a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9)))
        {
          LOBYTE(v6) = 1;
          return v6;
        }
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  return v6;
}

- (BOOL)sensorHasReaderAuthorization:(id)a3 forBundleId:(id)a4
{
  return objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[SRAuthorizationStore readerAuthorizationValues](self, "readerAuthorizationValues"), "objectForKeyedSubscript:", a4), "objectForKeyedSubscript:", a3), "BOOLValue");
}

- (uint64_t)updateOverrideOnAuthorizationChangeForService:(int)a3 withPendingValue:(uint64_t)a4 forBundleId:
{
  uint64_t result;
  uint64_t v6;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  id *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  result = 0;
  v35 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v6 = a2;
    if (a2)
    {
      if (a3)
      {
        return objc_msgSend(a1[4], "setOverride:forService:", 1, a2);
      }
      else
      {
        v21 = a1;
        v8 = (void *)objc_msgSend(a1, "readerAuthorizationBundleIdValues");
        v9 = +[SRSensorDescription sensorDescriptionsForAuthorizationService:](SRSensorDescription, "sensorDescriptionsForAuthorizationService:", v6);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (!v10)
          return objc_msgSend(v21[4], "setOverride:forService:", 0, v6);
        v11 = v10;
        v20 = v6;
        v22 = 0;
        v12 = *(_QWORD *)v30;
        v23 = *(_QWORD *)v30;
        do
        {
          v13 = 0;
          v24 = v11;
          do
          {
            if (*(_QWORD *)v30 != v12)
              objc_enumerationMutation(v8);
            v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
            if ((objc_msgSend(v14, "isEqualToString:", a4) & 1) == 0)
            {
              v27 = 0u;
              v28 = 0u;
              v25 = 0u;
              v26 = 0u;
              v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              if (v15)
              {
                v16 = v15;
                v17 = a4;
                v18 = *(_QWORD *)v26;
                while (2)
                {
                  for (i = 0; i != v16; ++i)
                  {
                    if (*(_QWORD *)v26 != v18)
                      objc_enumerationMutation(v9);
                    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v14), "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "name")), "BOOLValue") & 1) != 0)
                    {
                      v22 = 1;
                      goto LABEL_21;
                    }
                  }
                  v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
                  if (v16)
                    continue;
                  break;
                }
LABEL_21:
                a4 = v17;
                v12 = v23;
                v11 = v24;
              }
            }
            ++v13;
          }
          while (v13 != v11);
          v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v11);
        v6 = v20;
        if ((v22 & 1) != 0)
          return 1;
        else
          return objc_msgSend(v21[4], "setOverride:forService:", 0, v6);
      }
    }
  }
  return result;
}

- (void)resetAllAuthorizationsForBundleId:(id)a3
{
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = -[NSDictionary objectForKeyedSubscript:](-[SRAuthorizationStore readerAuthorizationValues](self, "readerAuthorizationValues"), "objectForKeyedSubscript:", a3);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v17;
    *(_QWORD *)&v6 = 138412546;
    v14 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x2495465E0]();
        v12 = objc_msgSend(+[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:", v10), "authorizationService");
        v13 = SRLogAuthorizationStore;
        if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v14;
          v21 = a3;
          v22 = 2112;
          v23 = v12;
          _os_log_impl(&dword_245CD7000, v13, OS_LOG_TYPE_DEFAULT, "reset reader authorization for bundle %@ service %@", buf, 0x16u);
        }
        -[SRTCCStore resetService:forBundleId:](self->_tccStore, "resetService:forBundleId:", v12, a3, v14);
        -[SRAuthorizationStore updateOverrideOnAuthorizationChangeForService:withPendingValue:forBundleId:]((id *)&self->super.isa, v12, 0, (uint64_t)a3);
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v7);
  }
}

- (void)resetAllAuthorizations
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  uint8_t v15[128];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__SRAuthorizationStore_resetAllAuthorizations__block_invoke;
  v14[3] = &unk_2516F2340;
  v14[4] = v3;
  __46__SRAuthorizationStore_resetAllAuthorizations__block_invoke((uint64_t)v14, -[SRAuthorizationStore readerAuthorizationBundleIdValues](self, "readerAuthorizationBundleIdValues"), (uint64_t)&__block_literal_global_3);
  __46__SRAuthorizationStore_resetAllAuthorizations__block_invoke((uint64_t)v14, -[SRAuthorizationStore writerAuthorizationValues](self, "writerAuthorizationValues"), (uint64_t)&__block_literal_global_24);
  v4 = SRLogAuthorizationStore;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl(&dword_245CD7000, v4, OS_LOG_TYPE_DEFAULT, "reset authorization for services %@", buf, 0xCu);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[SRTCCStore resetService:](self->_tccStore, "resetService:", v9);
        -[SRTCCStore setOverride:forService:](self->_tccStore, "setOverride:forService:", 0, v9);
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }
}

uint64_t __46__SRAuthorizationStore_resetAllAuthorizations__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  v17 = result;
  if (result)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(a2);
        v7 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v6);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", v7);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v20;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v20 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
              v14 = (void *)MEMORY[0x2495465E0]();
              v15 = +[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:", v13);
              if (v15)
                objc_msgSend(*(id *)(a1 + 32), "addObject:", (*(uint64_t (**)(uint64_t, id))(a3 + 16))(a3, v15));
              objc_autoreleasePoolPop(v14);
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v10);
        }
        ++v6;
      }
      while (v6 != v17);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v17 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __46__SRAuthorizationStore_resetAllAuthorizations__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "authorizationService");
}

uint64_t __46__SRAuthorizationStore_resetAllAuthorizations__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writerAuthorizationService");
}

- (void)resetAuthorizationForService:(id)a3 bundleId:(id)a4
{
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = SRLogAuthorizationStore;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = a3;
    v10 = 2114;
    v11 = a4;
    _os_log_impl(&dword_245CD7000, v7, OS_LOG_TYPE_DEFAULT, "Reset authorization for service %@ and bundle id: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  -[SRTCCStore resetService:forBundleId:](self->_tccStore, "resetService:forBundleId:", a3, a4);
  -[SRAuthorizationStore updateOverrideOnAuthorizationChangeForService:withPendingValue:forBundleId:]((id *)&self->super.isa, (uint64_t)a3, 0, (uint64_t)a4);
}

- (BOOL)setAuthorizationForBundleId:(id)a3 service:(id)a4 value:(BOOL)a5
{
  return -[SRAuthorizationStore setAuthorizationForBundleId:service:value:setOverride:](self, "setAuthorizationForBundleId:service:value:setOverride:", a3, a4, a5, 1);
}

- (BOOL)setAuthorizationForBundleId:(id)a3 service:(id)a4 value:(BOOL)a5 setOverride:(BOOL)a6
{
  _BOOL8 v7;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v7 = a5;
  v17 = *MEMORY[0x24BDAC8D0];
  v11 = objc_msgSend(a3, "length");
  if (v11)
  {
    v11 = objc_msgSend(a4, "length");
    if (v11)
    {
      if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.private.SensorKit._compositeBundle")))
      {
        v12 = SRLogAuthorizationStore;
        LODWORD(v11) = os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_FAULT);
        if ((_DWORD)v11)
        {
          v15 = 138543362;
          v16 = CFSTR("com.apple.private.SensorKit._compositeBundle");
          _os_log_fault_impl(&dword_245CD7000, v12, OS_LOG_TYPE_FAULT, "Setting authorization for %{public}@ is not allowed", (uint8_t *)&v15, 0xCu);
          LOBYTE(v11) = 0;
        }
      }
      else
      {
        v13 = -[SRTCCStore setValue:forService:bundleId:](self->_tccStore, "setValue:forService:bundleId:", v7, a4, a3);
        LOBYTE(v11) = !a6 & v13;
        if (a6 && v13)
          LOBYTE(v11) = -[SRAuthorizationStore updateOverrideOnAuthorizationChangeForService:withPendingValue:forBundleId:]((id *)&self->super.isa, (uint64_t)a4, v7, (uint64_t)a3);
      }
    }
  }
  return v11;
}

uint64_t __64__SRAuthorizationStore_readerAuthorizationInformationForSensors__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  if (!v4)
  {
    v4 = objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, a2);
  }
  return v4;
}

uint64_t __64__SRAuthorizationStore_writerAuthorizationInformationForSensors__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  if (!v4)
  {
    v4 = objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, a2);
  }
  return v4;
}

- (id)readerAuthorizationBundleIdValues
{
  NSDictionary *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = -[SRAuthorizationStore readerAuthorizationValues](self, "readerAuthorizationValues");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSDictionary count](v2, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.sensorkit.dummy-bundle-id")) & 1) == 0)
          objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", v8), v8);
      }
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
}

- (BOOL)checkAccessForService:(id)a3 auditToken:(id *)a4
{
  SRTCCStore *tccStore;
  __int128 v5;
  _OWORD v7[2];

  tccStore = self->_tccStore;
  v5 = *(_OWORD *)&a4->var0[4];
  v7[0] = *(_OWORD *)a4->var0;
  v7[1] = v5;
  return -[SRTCCStore checkAccessForService:auditToken:](tccStore, "checkAccessForService:auditToken:", a3, v7);
}

- (NSDictionary)readerAuthorizationValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReaderAuthorizationValues:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSDictionary)readerLastModifiedAuthorizationTimes
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setReaderLastModifiedAuthorizationTimes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSDictionary)writerAuthorizationValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setWriterAuthorizationValues:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (BOOL)sensorKitActive
{
  return self->_sensorKitActive;
}

- (void)setSensorKitActive:(BOOL)a3
{
  self->_sensorKitActive = a3;
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSDictionary)readerAuthorizationGroups
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setReaderAuthorizationGroups:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSDictionary)writerAuthorizationGroups
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setWriterAuthorizationGroups:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

@end

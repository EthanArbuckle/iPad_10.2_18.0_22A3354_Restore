@implementation PRBTGroupLocalizer

- (PRBTGroupLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5 isUT:(BOOL)a6
{
  return -[PRBTGroupLocalizer initWithDelegate:queue:id:isUT:withAnalytics:](self, "initWithDelegate:queue:id:isUT:withAnalytics:", a3, a4, a5, a6, 1);
}

- (PRBTGroupLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5 isUT:(BOOL)a6 withAnalytics:(BOOL)a7
{
  id v11;
  id v12;
  PRBTGroupLocalizer *v13;
  PRBTGroupLocalizer *v14;
  dispatch_queue_t v15;
  os_log_t v16;
  OS_os_log *logger;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  PRBTLocalizer *v30;
  void *v31;
  PRBTLocalizer *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  id obj;
  _BOOL4 v50;
  _BOOL4 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  uint8_t buf[4];
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v50 = a6;
  v51 = a7;
  v60 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v46 = v12;
  v47 = a5;
  v45 = v11;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRBTGroupLocalizer.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    if (v46)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRBTGroupLocalizer.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

LABEL_3:
  v56.receiver = self;
  v56.super_class = (Class)PRBTGroupLocalizer;
  v13 = -[PRBTGroupLocalizer init](&v56, sel_init);
  v14 = v13;
  if (v13)
  {
    -[PRBTGroupLocalizer setDelegate:](v13, "setDelegate:", v11);
    -[PRBTGroupLocalizer setDelegateQueue:](v14, "setDelegateQueue:", v46);
    v15 = dispatch_queue_create("com.apple.findmy.btgroupranging", 0);
    -[PRBTGroupLocalizer setProximityQueue:](v14, "setProximityQueue:", v15);

    v16 = os_log_create("com.apple.proximity", "btgrouplocalizer");
    logger = v14->_logger;
    v14->_logger = (OS_os_log *)v16;

    v48 = objc_msgSend(v47, "count");
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v48);
    -[PRBTGroupLocalizer setLocalizerArray:](v14, "setLocalizerArray:", v18);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v48);
    -[PRBTGroupLocalizer setLocalizerShouldRangeArray:](v14, "setLocalizerShouldRangeArray:", v19);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v48);
    -[PRBTGroupLocalizer setLocalizerStateArray:](v14, "setLocalizerStateArray:", v20);

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v48);
    -[PRBTGroupLocalizer setUuidIndexMap:](v14, "setUuidIndexMap:", v21);

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = v47;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    if (v22)
    {
      v23 = 0;
      v24 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v53 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          v27 = v14->_logger;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v26, "UUIDString");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v58 = v28;
            _os_log_impl(&dword_2230E5000, v27, OS_LOG_TYPE_DEFAULT, "BTGroupLocalizer adding item %@ to the map", buf, 0xCu);

          }
          -[PRBTGroupLocalizer localizerArray](v14, "localizerArray");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = [PRBTLocalizer alloc];
          -[PRBTGroupLocalizer proximityQueue](v14, "proximityQueue");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[PRBTLocalizer initWithDelegate:queue:id:isUT:productUUID:withAnalytics:](v30, "initWithDelegate:queue:id:isUT:productUUID:withAnalytics:", v14, v31, v26, v50, 0, v51);
          objc_msgSend(v29, "addObject:", v32);

          -[PRBTGroupLocalizer localizerShouldRangeArray](v14, "localizerShouldRangeArray");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v34);

          -[PRBTGroupLocalizer localizerStateArray](v14, "localizerStateArray");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v36);

          -[PRBTGroupLocalizer uuidIndexMap](v14, "uuidIndexMap");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v23 + i);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKey:", v38, v26);

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
        v23 = (v23 + i);
      }
      while (v22);
    }

    if (v48)
    {
      for (j = 0; j != v48; ++j)
      {
        -[PRBTGroupLocalizer localizerArray](v14, "localizerArray");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectAtIndexedSubscript:", j);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "configure");

      }
    }
  }

  return v14;
}

- (PRBTGroupLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5
{
  return -[PRBTGroupLocalizer initWithDelegate:queue:id:withAnalytics:](self, "initWithDelegate:queue:id:withAnalytics:", a3, a4, a5, 1);
}

- (PRBTGroupLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5 withAnalytics:(BOOL)a6
{
  id v10;
  id v11;
  PRBTGroupLocalizer *v12;
  PRBTGroupLocalizer *v13;
  dispatch_queue_t v14;
  os_log_t v15;
  OS_os_log *logger;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  _BOOL4 v28;
  id v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  PRBTLocalizer *v37;
  void *v38;
  PRBTLocalizer *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  id obj;
  uint64_t v57;
  _BOOL4 v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  const char *v70;
  _BYTE v71[128];
  uint64_t v72;

  v58 = a6;
  v72 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v53 = v11;
  v54 = a5;
  v52 = v10;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRBTGroupLocalizer.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    if (v53)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRBTGroupLocalizer.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

LABEL_3:
  v64.receiver = self;
  v64.super_class = (Class)PRBTGroupLocalizer;
  v12 = -[PRBTGroupLocalizer init](&v64, sel_init);
  v13 = v12;
  if (v12)
  {
    -[PRBTGroupLocalizer setDelegate:](v12, "setDelegate:", v10);
    -[PRBTGroupLocalizer setDelegateQueue:](v13, "setDelegateQueue:", v53);
    v14 = dispatch_queue_create("com.apple.findmy.btgroupranging", 0);
    -[PRBTGroupLocalizer setProximityQueue:](v13, "setProximityQueue:", v14);

    v15 = os_log_create("com.apple.proximity", "btgrouplocalizer");
    logger = v13->_logger;
    v13->_logger = (OS_os_log *)v15;

    v55 = objc_msgSend(v54, "count");
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v55);
    -[PRBTGroupLocalizer setLocalizerArray:](v13, "setLocalizerArray:", v17);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v55);
    -[PRBTGroupLocalizer setLocalizerShouldRangeArray:](v13, "setLocalizerShouldRangeArray:", v18);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v55);
    -[PRBTGroupLocalizer setLocalizerStateArray:](v13, "setLocalizerStateArray:", v19);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v55);
    -[PRBTGroupLocalizer setUuidIndexMap:](v13, "setUuidIndexMap:", v20);

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v54;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
    if (v21)
    {
      v59 = 0;
      v57 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v61 != v57)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v23, "uuid");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "productUUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v23, "isOwned");
          v27 = v13->_logger;
          v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
          if (v25)
          {
            if (v28)
            {
              objc_msgSend(v24, "UUIDString");
              v29 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "UUIDString");
              v30 = objc_claimAutoreleasedReturnValue();
              v31 = (void *)v30;
              *(_DWORD *)buf = 138412802;
              v32 = "true";
              if (v26)
                v32 = "false";
              v66 = (uint64_t)v29;
              v67 = 2112;
              v68 = v30;
              v69 = 2080;
              v70 = v32;
              _os_log_impl(&dword_2230E5000, v27, OS_LOG_TYPE_DEFAULT, "BTGroupLocalizer adding item %@ to the map with productUUID %@, isUT: %s", buf, 0x20u);

            }
          }
          else if (v28)
          {
            objc_msgSend(v24, "UUIDString");
            v33 = objc_claimAutoreleasedReturnValue();
            v34 = (void *)v33;
            *(_DWORD *)buf = 138412546;
            v35 = "true";
            if (v26)
              v35 = "false";
            v66 = v33;
            v67 = 2080;
            v68 = (uint64_t)v35;
            _os_log_impl(&dword_2230E5000, v27, OS_LOG_TYPE_DEFAULT, "BTGroupLocalizer adding item %@ to the map with no productUUID, isUT: %s", buf, 0x16u);

          }
          -[PRBTGroupLocalizer localizerArray](v13, "localizerArray");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = [PRBTLocalizer alloc];
          -[PRBTGroupLocalizer proximityQueue](v13, "proximityQueue");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = -[PRBTLocalizer initWithDelegate:queue:id:isUT:productUUID:withAnalytics:](v37, "initWithDelegate:queue:id:isUT:productUUID:withAnalytics:", v13, v38, v24, v26 ^ 1u, v25, v58);
          objc_msgSend(v36, "addObject:", v39);

          -[PRBTGroupLocalizer localizerShouldRangeArray](v13, "localizerShouldRangeArray");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v41);

          -[PRBTGroupLocalizer localizerStateArray](v13, "localizerStateArray");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v43);

          -[PRBTGroupLocalizer uuidIndexMap](v13, "uuidIndexMap");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v59 + i);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKey:", v45, v24);

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
        v59 = (v59 + i);
      }
      while (v21);
    }

    if (v55)
    {
      for (j = 0; j != v55; ++j)
      {
        -[PRBTGroupLocalizer localizerArray](v13, "localizerArray");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectAtIndexedSubscript:", j);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "configure");

      }
    }
  }

  return v13;
}

- (void)didFailWithError:(id)a3 onItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id WeakRetained;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[PRBTGroupLocalizer delegateQueue](self, "delegateQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PRBTGroupLocalizer delegateQueue](self, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = MEMORY[0x24BDAC9B8];
    v10 = MEMORY[0x24BDAC9B8];
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__PRBTGroupLocalizer_didFailWithError_onItem___block_invoke;
    block[3] = &unk_24EC11930;
    v13 = WeakRetained;
    v14 = v6;
    v15 = v7;
    dispatch_async(v9, block);

  }
}

uint64_t __46__PRBTGroupLocalizer_didFailWithError_onItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didFailWithError:onItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)updateDelegateWithSelector:(SEL)a3 object:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  SEL v12;

  v6 = a4;
  -[PRBTGroupLocalizer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PRBTGroupLocalizer delegateQueue](self, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__PRBTGroupLocalizer_updateDelegateWithSelector_object___block_invoke;
    block[3] = &unk_24EC113D8;
    v10 = v7;
    v12 = a3;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __56__PRBTGroupLocalizer_updateDelegateWithSelector_object___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)willIntegrateBTRSSI:(id)a3
{
  -[PRBTGroupLocalizer updateDelegateWithSelector:object:](self, "updateDelegateWithSelector:object:", sel_willIntegrateBTRSSI_, a3);
}

- (void)didUpdateBTProximity:(id)a3
{
  -[PRBTGroupLocalizer updateDelegateWithSelector:object:](self, "updateDelegateWithSelector:object:", sel_didUpdateBTProximity_, a3);
}

- (void)btLocalizerChangedState:(unint64_t)a3 onItem:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[PRBTGroupLocalizer proximityQueue](self, "proximityQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__PRBTGroupLocalizer_btLocalizerChangedState_onItem___block_invoke;
  v9[3] = &unk_24EC113B0;
  objc_copyWeak(v11, &location);
  v10 = v6;
  v11[1] = (id)a3;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __53__PRBTGroupLocalizer_btLocalizerChangedState_onItem___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  char v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  char v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  id v43;
  id v44;
  uint64_t v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  char v49;
  NSObject *v50;
  id v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = (id *)objc_loadWeakRetained(v2);
    objc_msgSend(v4, "uuidIndexMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    objc_msgSend(v4, "localizerStateArray");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    objc_msgSend(v4, "localizerShouldRangeArray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v4, "localizerArray");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    switch(*(_QWORD *)(a1 + 48))
    {
      case 0:
        v16 = v4[1];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "UUIDString");
          v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 136315138;
          v61 = objc_msgSend(v17, "UTF8String");
          _os_log_impl(&dword_2230E5000, v16, OS_LOG_TYPE_DEFAULT, "%s: Localizer is connecting", buf, 0xCu);

        }
        goto LABEL_41;
      case 1:
        v18 = v4[1];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "UUIDString");
          v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 136315138;
          v61 = objc_msgSend(v19, "UTF8String");
          _os_log_impl(&dword_2230E5000, v18, OS_LOG_TYPE_DEFAULT, "%s: Localizer is configured and ready to start ranging", buf, 0xCu);

        }
        if (v13)
        {
          v20 = v4[1];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "UUIDString");
            v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v22 = objc_msgSend(v21, "UTF8String");
            *(_DWORD *)buf = 136315138;
            v61 = v22;
            _os_log_impl(&dword_2230E5000, v20, OS_LOG_TYPE_DEFAULT, "%s: Device asked to start ranging", buf, 0xCu);

          }
          v59 = 0;
          v23 = objc_msgSend(v15, "start:", &v59);
          v16 = v59;
          if ((v23 & 1) == 0)
          {
            v24 = v4[1];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 32), "UUIDString");
              v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v26 = objc_msgSend(v25, "UTF8String");
              -[NSObject localizedDescription](v16, "localizedDescription");
              v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v28 = objc_msgSend(v27, "UTF8String");
              *(_DWORD *)buf = 136315394;
              v61 = v26;
              v62 = 2080;
              v63 = v28;
              _os_log_impl(&dword_2230E5000, v24, OS_LOG_TYPE_DEFAULT, "%s: Failed to start ranging with error: %s", buf, 0x16u);

            }
          }
          goto LABEL_41;
        }
        if ((v10 - 3) <= 1)
          objc_msgSend(v4, "informDelegateRangingStopped:withError:", *(_QWORD *)(a1 + 32), 0);
        break;
      case 2:
        v29 = v4[1];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "UUIDString");
          v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 136315138;
          v61 = objc_msgSend(v30, "UTF8String");
          _os_log_impl(&dword_2230E5000, v29, OS_LOG_TYPE_DEFAULT, "%s: Localizer is attempting to start ranging", buf, 0xCu);

        }
        if ((v13 & 1) != 0)
          break;
        v31 = v4[1];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "UUIDString");
          v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v33 = objc_msgSend(v32, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v61 = v33;
          _os_log_impl(&dword_2230E5000, v31, OS_LOG_TYPE_DEFAULT, "%s: Localizer should not be attempting to range - asked to stop ranging", buf, 0xCu);

        }
        v58 = 0;
        v34 = objc_msgSend(v15, "stop:", &v58);
        v16 = v58;
        if ((v34 & 1) == 0)
        {
          v35 = v4[1];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "UUIDString");
            v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v37 = objc_msgSend(v36, "UTF8String");
            -[NSObject localizedDescription](v16, "localizedDescription");
            v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v39 = objc_msgSend(v38, "UTF8String");
            *(_DWORD *)buf = 136315394;
            v61 = v37;
            v62 = 2080;
            v63 = v39;
            _os_log_impl(&dword_2230E5000, v35, OS_LOG_TYPE_DEFAULT, "%s: Failed to stop ranging with error: %s", buf, 0x16u);

          }
        }
        goto LABEL_41;
      case 3:
        v40 = v4[1];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "UUIDString");
          v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 136315138;
          v61 = objc_msgSend(v41, "UTF8String");
          _os_log_impl(&dword_2230E5000, v40, OS_LOG_TYPE_DEFAULT, "%s: Localizer is ranging", buf, 0xCu);

        }
        if (v13)
        {
          if ((v10 - 1) <= 1)
            objc_msgSend(v4, "informDelegateRangingStarted:withError:", *(_QWORD *)(a1 + 32), 0);
        }
        else
        {
          v46 = v4[1];
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "UUIDString");
            v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v48 = objc_msgSend(v47, "UTF8String");
            *(_DWORD *)buf = 136315138;
            v61 = v48;
            _os_log_impl(&dword_2230E5000, v46, OS_LOG_TYPE_DEFAULT, "%s: Localizer should not be ranging - asked to stop ranging", buf, 0xCu);

          }
          v57 = 0;
          v49 = objc_msgSend(v15, "stop:", &v57);
          v16 = v57;
          if ((v49 & 1) == 0)
          {
            v50 = v4[1];
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 32), "UUIDString");
              v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v52 = objc_msgSend(v51, "UTF8String");
              -[NSObject localizedDescription](v16, "localizedDescription");
              v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v54 = objc_msgSend(v53, "UTF8String");
              *(_DWORD *)buf = 136315394;
              v61 = v52;
              v62 = 2080;
              v63 = v54;
              _os_log_impl(&dword_2230E5000, v50, OS_LOG_TYPE_DEFAULT, "%s: Failed to stop ranging with error: %s", buf, 0x16u);

            }
          }
LABEL_41:

        }
        break;
      case 4:
        v42 = v4[1];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "UUIDString");
          v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 136315138;
          v61 = objc_msgSend(v43, "UTF8String");
          _os_log_impl(&dword_2230E5000, v42, OS_LOG_TYPE_DEFAULT, "%s: Localizer is attempting to stop ranging", buf, 0xCu);

        }
        if (!v13)
          break;
        v16 = v4[1];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "UUIDString");
          v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v45 = objc_msgSend(v44, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v61 = v45;
          _os_log_impl(&dword_2230E5000, v16, OS_LOG_TYPE_DEFAULT, "%s: Localizer should not be attempting to stop - wait until stop is complete and localizer is back to configured to ask to start again", buf, 0xCu);

        }
        goto LABEL_41;
      default:
        break;
    }
    objc_msgSend(v4, "localizerStateArray");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "replaceObjectAtIndex:withObject:", v7, v56);

  }
}

- (void)informDelegateRangingStarted:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id WeakRetained;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[PRBTGroupLocalizer delegateQueue](self, "delegateQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PRBTGroupLocalizer delegateQueue](self, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = MEMORY[0x24BDAC9B8];
    v10 = MEMORY[0x24BDAC9B8];
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__PRBTGroupLocalizer_informDelegateRangingStarted_withError___block_invoke;
    block[3] = &unk_24EC11930;
    v13 = WeakRetained;
    v14 = v6;
    v15 = v7;
    dispatch_async(v9, block);

  }
}

uint64_t __61__PRBTGroupLocalizer_informDelegateRangingStarted_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didStartRangingOn:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)informDelegateRangingStopped:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id WeakRetained;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[PRBTGroupLocalizer delegateQueue](self, "delegateQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PRBTGroupLocalizer delegateQueue](self, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = MEMORY[0x24BDAC9B8];
    v10 = MEMORY[0x24BDAC9B8];
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__PRBTGroupLocalizer_informDelegateRangingStopped_withError___block_invoke;
    block[3] = &unk_24EC11930;
    v13 = WeakRetained;
    v14 = v6;
    v15 = v7;
    dispatch_async(v9, block);

  }
}

uint64_t __61__PRBTGroupLocalizer_informDelegateRangingStopped_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didStopRangingOn:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)startRangingOn:(id)a3 withError:(id *)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  -[PRBTGroupLocalizer proximityQueue](self, "proximityQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__PRBTGroupLocalizer_startRangingOn_withError___block_invoke;
  block[3] = &unk_24EC11400;
  objc_copyWeak(&v11, &location);
  v10 = v5;
  v7 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return 1;
}

void __47__PRBTGroupLocalizer_startRangingOn_withError___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = (id *)objc_loadWeakRetained(v2);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = *(id *)(a1 + 32);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v38;
      *(_QWORD *)&v6 = 136315394;
      v34 = v6;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v38 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v4, "uuidIndexMap", v34);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "intValue");

          objc_msgSend(v4, "localizerShouldRangeArray");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v12;
          objc_msgSend(v13, "replaceObjectAtIndex:withObject:", v12, v14);

          v16 = v4[1];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v9, "UUIDString");
            v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v18 = objc_msgSend(v17, "UTF8String");
            *(_DWORD *)buf = 136315138;
            v42 = v18;
            _os_log_impl(&dword_2230E5000, v16, OS_LOG_TYPE_DEFAULT, "%s: Device should range updated to YES", buf, 0xCu);

          }
          objc_msgSend(v4, "localizerStateArray");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "intValue") == 1;

          if (v21)
          {
            v22 = v4[1];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v9, "UUIDString");
              v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v24 = objc_msgSend(v23, "UTF8String");
              *(_DWORD *)buf = 136315138;
              v42 = v24;
              _os_log_impl(&dword_2230E5000, v22, OS_LOG_TYPE_DEFAULT, "%s: Device asked to start ranging", buf, 0xCu);

            }
            objc_msgSend(v4, "localizerArray");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectAtIndexedSubscript:", v15);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = 0;
            v27 = objc_msgSend(v26, "start:", &v36);
            v28 = v36;

            if ((v27 & 1) == 0)
            {
              v29 = v4[1];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v9, "UUIDString");
                v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v31 = objc_msgSend(v30, "UTF8String");
                objc_msgSend(v28, "localizedDescription");
                v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v33 = objc_msgSend(v32, "UTF8String");
                *(_DWORD *)buf = v34;
                v42 = v31;
                v43 = 2080;
                v44 = v33;
                _os_log_impl(&dword_2230E5000, v29, OS_LOG_TYPE_DEFAULT, "%s: Failed to start ranging with error: %s", buf, 0x16u);

              }
            }

          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v5);
    }

  }
}

- (BOOL)stopRangingOn:(id)a3 withError:(id *)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  -[PRBTGroupLocalizer proximityQueue](self, "proximityQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__PRBTGroupLocalizer_stopRangingOn_withError___block_invoke;
  block[3] = &unk_24EC11400;
  objc_copyWeak(&v11, &location);
  v10 = v5;
  v7 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return 1;
}

void __46__PRBTGroupLocalizer_stopRangingOn_withError___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = (id *)objc_loadWeakRetained(v2);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = *(id *)(a1 + 32);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v38;
      *(_QWORD *)&v6 = 136315394;
      v34 = v6;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v38 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v4, "uuidIndexMap", v34);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "intValue");

          objc_msgSend(v4, "localizerShouldRangeArray");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v12;
          objc_msgSend(v13, "replaceObjectAtIndex:withObject:", v12, v14);

          v16 = v4[1];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v9, "UUIDString");
            v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v18 = objc_msgSend(v17, "UTF8String");
            *(_DWORD *)buf = 136315138;
            v42 = v18;
            _os_log_impl(&dword_2230E5000, v16, OS_LOG_TYPE_DEFAULT, "%s: Device should range updated to NO", buf, 0xCu);

          }
          objc_msgSend(v4, "localizerStateArray");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "intValue");

          if ((v21 & 0xFFFFFFFE) == 2)
          {
            v22 = v4[1];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v9, "UUIDString");
              v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v24 = objc_msgSend(v23, "UTF8String");
              *(_DWORD *)buf = 136315138;
              v42 = v24;
              _os_log_impl(&dword_2230E5000, v22, OS_LOG_TYPE_DEFAULT, "%s: Device asked to stop ranging", buf, 0xCu);

            }
            objc_msgSend(v4, "localizerArray");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectAtIndexedSubscript:", v15);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = 0;
            v27 = objc_msgSend(v26, "stop:", &v36);
            v28 = v36;

            if ((v27 & 1) == 0)
            {
              v29 = v4[1];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v9, "UUIDString");
                v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v31 = objc_msgSend(v30, "UTF8String");
                objc_msgSend(v28, "localizedDescription");
                v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v33 = objc_msgSend(v32, "UTF8String");
                *(_DWORD *)buf = v34;
                v42 = v31;
                v43 = 2080;
                v44 = v33;
                _os_log_impl(&dword_2230E5000, v29, OS_LOG_TYPE_DEFAULT, "%s: Failed to stop ranging with error: %s", buf, 0x16u);

              }
            }

          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v5);
    }

  }
}

- (BOOL)restartRangingOn:(id)a3 withError:(id *)a4
{
  return 1;
}

- (void)dealloc
{
  NSObject *logger;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  OS_os_log *v20;
  _BOOL4 v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  OS_os_log *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  id obj;
  objc_super v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "Destructing PRBTGroupLocalizer", buf, 2u);
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[PRBTGroupLocalizer uuidIndexMap](self, "uuidIndexMap");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v39;
    *(_QWORD *)&v5 = 136315394;
    v34 = v5;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v39 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[PRBTGroupLocalizer uuidIndexMap](self, "uuidIndexMap", v34);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "intValue");

        -[PRBTGroupLocalizer localizerShouldRangeArray](self, "localizerShouldRangeArray");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v11;
        objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        -[PRBTGroupLocalizer localizerStateArray](self, "localizerStateArray");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "intValue");

        if ((v18 & 0xFFFFFFFE) == 2)
          v19 = v15;
        else
          v19 = 0;
        v20 = self->_logger;
        v21 = os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT);
        if (v19 == 1)
        {
          if (v21)
          {
            objc_msgSend(v8, "UUIDString");
            v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v23 = objc_msgSend(v22, "UTF8String");
            *(_DWORD *)buf = 136315138;
            v43 = v23;
            _os_log_impl(&dword_2230E5000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "%s: Device is still ranging - Stop is sent", buf, 0xCu);

          }
          -[PRBTGroupLocalizer localizerArray](self, "localizerArray");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", v13);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 0;
          v26 = objc_msgSend(v25, "stop:", &v37);
          v20 = (OS_os_log *)v37;

          if ((v26 & 1) == 0)
          {
            v27 = self->_logger;
            if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v8, "UUIDString");
              v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v29 = objc_msgSend(v28, "UTF8String");
              -[OS_os_log localizedDescription](v20, "localizedDescription");
              v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v31 = objc_msgSend(v30, "UTF8String");
              *(_DWORD *)buf = v34;
              v43 = v29;
              v44 = 2080;
              v45 = v31;
              _os_log_impl(&dword_2230E5000, (os_log_t)v27, OS_LOG_TYPE_DEFAULT, "%s: Failed to stop ranging with error: %s", buf, 0x16u);

            }
          }
        }
        else if (v21)
        {
          objc_msgSend(v8, "UUIDString");
          v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v33 = objc_msgSend(v32, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v43 = v33;
          _os_log_impl(&dword_2230E5000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "%s: Device is not ranging", buf, 0xCu);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v4);
  }

  v36.receiver = self;
  v36.super_class = (Class)PRBTGroupLocalizer;
  -[PRBTGroupLocalizer dealloc](&v36, sel_dealloc);
}

- (PRBTGroupLocalizerDelegate)delegate
{
  return (PRBTGroupLocalizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)proximityQueue
{
  return self->_proximityQueue;
}

- (void)setProximityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_proximityQueue, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (NSMutableArray)localizerArray
{
  return self->_localizerArray;
}

- (void)setLocalizerArray:(id)a3
{
  objc_storeStrong((id *)&self->_localizerArray, a3);
}

- (NSMutableArray)localizerShouldRangeArray
{
  return self->_localizerShouldRangeArray;
}

- (void)setLocalizerShouldRangeArray:(id)a3
{
  objc_storeStrong((id *)&self->_localizerShouldRangeArray, a3);
}

- (NSMutableArray)localizerStateArray
{
  return self->_localizerStateArray;
}

- (void)setLocalizerStateArray:(id)a3
{
  objc_storeStrong((id *)&self->_localizerStateArray, a3);
}

- (NSMutableDictionary)uuidIndexMap
{
  return self->_uuidIndexMap;
}

- (void)setUuidIndexMap:(id)a3
{
  objc_storeStrong((id *)&self->_uuidIndexMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidIndexMap, 0);
  objc_storeStrong((id *)&self->_localizerStateArray, 0);
  objc_storeStrong((id *)&self->_localizerShouldRangeArray, 0);
  objc_storeStrong((id *)&self->_localizerArray, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_proximityQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end

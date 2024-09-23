@implementation TSTransferCloudFlowModel

- (void)arePlansAvailable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__TSTransferCloudFlowModel_arePlansAvailable___block_invoke;
  v6[3] = &unk_24DEF2980;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v6[4] = self;
  v7 = v5;
  -[TSTransferCloudFlowModel requestPlansWithCompletion:](self, "requestPlansWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __46__TSTransferCloudFlowModel_arePlansAvailable___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(void);
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    _TSLogDomain();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __46__TSTransferCloudFlowModel_arePlansAvailable___block_invoke_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_10;
  }
  v4 = *(void **)(a1 + 32);
  objc_msgSend(WeakRetained, "carrierSetupItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterCarrierSetupItems:", v5);

  objc_msgSend(v3, "transferItems");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v3, "transferItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
      goto LABEL_16;
  }
  objc_msgSend(v3, "carrierSetupItems");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v3, "carrierSetupItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "plans");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v3, "carrierSetupItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "plans");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17)
      {
LABEL_16:
        v26 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
        goto LABEL_17;
      }
    }
    else
    {

    }
  }
  objc_msgSend(v3, "crossPlatformTransferItems");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v18 = v27;
    objc_msgSend(v3, "crossPlatformTransferItems");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "plans");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)v29;
      objc_msgSend(v3, "crossPlatformTransferItems");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "plans");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

      if (v33)
        goto LABEL_16;
      goto LABEL_11;
    }

LABEL_10:
  }
LABEL_11:
  v26 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_17:
  v26();

}

- (void)requestPlansWithCompletion:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_group *v6;
  OS_dispatch_group *queryGroup;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x220765A70](v4);
  v6 = (OS_dispatch_group *)dispatch_group_create();
  queryGroup = self->_queryGroup;
  self->_queryGroup = v6;

  v8 = +[TSUtilities isWifiAvailable](TSUtilities, "isWifiAvailable");
  dispatch_group_enter((dispatch_group_t)self->_queryGroup);
  v9 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke;
  v22[3] = &unk_24DEF29F8;
  objc_copyWeak(&v23, &location);
  -[TSTransferCloudFlowModel requestCrossPlatformTransferPlanListWithCompletion:](self, "requestCrossPlatformTransferPlanListWithCompletion:", v22);
  objc_destroyWeak(&v23);
  if (v8)
  {
    dispatch_group_enter((dispatch_group_t)self->_queryGroup);
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "aa_primaryAppleAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v20[0] = v9;
      v20[1] = 3221225472;
      v20[2] = __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_17;
      v20[3] = &unk_24DEF29F8;
      objc_copyWeak(&v21, &location);
      -[TSTransferCloudFlowModel requestTransferPlans:](self, "requestTransferPlans:", v20);
      objc_destroyWeak(&v21);
    }
    else
    {
      _TSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[TSTransferCloudFlowModel requestPlansWithCompletion:]";
        _os_log_impl(&dword_21B647000, v13, OS_LOG_TYPE_DEFAULT, "Device not sign in to the iCloud @%s", buf, 0xCu);
      }

      dispatch_group_leave((dispatch_group_t)self->_queryGroup);
    }
    if (!+[TSUtilities isPad](TSUtilities, "isPad"))
    {
      dispatch_group_enter((dispatch_group_t)self->_queryGroup);
      v18[0] = v9;
      v18[1] = 3221225472;
      v18[2] = __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_18;
      v18[3] = &unk_24DEF29F8;
      objc_copyWeak(&v19, &location);
      -[TSTransferCloudFlowModel requestCarrierSetups:](self, "requestCarrierSetups:", v18);
      objc_destroyWeak(&v19);
    }
  }
  else
  {
    _TSLogDomain();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[TSTransferCloudFlowModel requestPlansWithCompletion:]";
      _os_log_impl(&dword_21B647000, v12, OS_LOG_TYPE_DEFAULT, "WiFi is required to query transfer plans and carrier setup items @%s", buf, 0xCu);
    }

  }
  v14 = self->_queryGroup;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_19;
  block[3] = &unk_24DEF2CE8;
  v17 = v5;
  v15 = v5;
  dispatch_group_notify(v14, MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&location);
}

void __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_leave(WeakRetained[1]);
  }
  else
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

void __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_17(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_leave(WeakRetained[1]);
  }
  else
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

void __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_18(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_leave(WeakRetained[1]);
  }
  else
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

uint64_t __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestTransferPlans:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *transferItems;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id location;

  v4 = a3;
  if (v4)
  {
    if (!self->_transferItems)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      transferItems = self->_transferItems;
      self->_transferItems = v5;

    }
    objc_initWeak(&location, self);
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke;
    v16[3] = &unk_24DEF3960;
    objc_copyWeak(&v18, &location);
    v16[4] = self;
    v17 = v4;
    objc_msgSend(v7, "bootstrapPlanTransferUsingMessageSession:completion:", 0, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    _TSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[TSTransferCloudFlowModel requestTransferPlans:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

void __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v3)
    {
      +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke_22;
      v8[3] = &unk_24DEF3468;
      objc_copyWeak(&v10, (id *)(a1 + 48));
      v7 = *(id *)(a1 + 40);
      v8[4] = *(_QWORD *)(a1 + 32);
      v9 = v7;
      objc_msgSend(v6, "transferPlanListWithCompletion:", v8);

      objc_destroyWeak(&v10);
      goto LABEL_8;
    }
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_8:

}

void __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke_22(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char **v23;
  uint64_t v24;
  char *v25;
  void *v26;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    _TSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke_22_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_7;
  }
  if (v7)
  {
    _TSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke_22_cold_2();
LABEL_7:

    goto LABEL_8;
  }
  if (v6)
  {
    if (!+[TSUtilities isPad](TSUtilities, "isPad"))
    {
      +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "deviceSupportsHydra");

      if ((v18 & 1) == 0)
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v6, "devices", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v29;
          v23 = &selRef_updateViewConstraints;
          while (2)
          {
            v24 = 0;
            v25 = v23[26];
            do
            {
              if (*(_QWORD *)v29 != v22)
                objc_enumerationMutation(v19);
              v26 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v24);
              if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v26, "performSelector:", v25))
              {
                _TSLogDomain();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v33 = "-[TSTransferCloudFlowModel requestTransferPlans:]_block_invoke";
                  _os_log_impl(&dword_21B647000, v27, OS_LOG_TYPE_DEFAULT, "remote has dual eSIM config @%s", buf, 0xCu);
                }

                objc_msgSend(*(id *)(a1 + 32), "setIsDualeSIMCapablityLoss:", 1);
                goto LABEL_25;
              }
              ++v24;
            }
            while (v21 != v24);
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
            v23 = &selRef_updateViewConstraints;
            if (v21)
              continue;
            break;
          }
        }
LABEL_25:

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "filterTransferPlans:", v6);
  }
LABEL_8:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)filterTransferPlans:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  NSObject *v16;
  void *v17;
  unint64_t v18;
  char *v20;
  NSMutableArray *transferItems;
  void *v22;
  NSObject *p_super;
  BOOL v24;
  NSObject *v25;
  uint64_t v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  uint64_t v38;
  NSObject *v39;
  id v40;
  id obj;
  id obja;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  NSMutableArray *v51;
  id v52;
  NSMutableArray *v53;
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
  uint8_t v66[128];
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  const char *v72;
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  uint8_t v77[4];
  uint64_t v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableArray removeAllObjects](self->_transferItems, "removeAllObjects");
  if (!v4)
  {
    _TSLogDomain();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v68 = "-[TSTransferCloudFlowModel filterTransferPlans:]";
      _os_log_impl(&dword_21B647000, p_super, OS_LOG_TYPE_DEFAULT, "no remote plans @%s", buf, 0xCu);
    }
    goto LABEL_77;
  }
  v51 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v40 = v4;
  objc_msgSend(v4, "devices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v80, 16);
  if (v45)
  {
    v43 = *(_QWORD *)v63;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v63 != v43)
          objc_enumerationMutation(obj);
        v47 = v5;
        v6 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v5);
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v52 = v6;
        objc_msgSend(v6, "remoteDisplayPlans");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v58, v79, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v59 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
              if (objc_msgSend(v12, "isNotEligibleActivationPolicyMismatchPlan"))
                -[TSTransferCloudFlowModel setIsActivationPolicyMismatch:](self, "setIsActivationPolicyMismatch:", 1);
              objc_msgSend(v12, "plan");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (v13)
              {
                objc_msgSend(v12, "plan");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) == 0)
                {
                  _TSLogDomain();
                  v16 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                    goto LABEL_30;
                  objc_msgSend(v12, "plan");
                  v20 = (char *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v68 = v20;
                  v69 = 2080;
                  v70 = "-[TSTransferCloudFlowModel filterTransferPlans:]";
                  _os_log_error_impl(&dword_21B647000, v16, OS_LOG_TYPE_ERROR, "[E]%@ is not a CTRemotePlan @%s", buf, 0x16u);
                  goto LABEL_29;
                }
                objc_msgSend(v12, "plan");
                v16 = objc_claimAutoreleasedReturnValue();
                -[NSObject transferAttributes](v16, "transferAttributes");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "transferCapability");

                if (v18 > 6 || ((1 << v18) & 0x68) == 0)
                {
                  if ((objc_msgSend(v12, "isPhysical") & 1) != 0)
                  {
                    v73[0] = CFSTR("planItem");
                    v73[1] = CFSTR("deviceInfo");
                    v74[0] = v12;
                    v74[1] = v52;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
                    v20 = (char *)objc_claimAutoreleasedReturnValue();
                    transferItems = v51;
                  }
                  else
                  {
                    v75[0] = CFSTR("planItem");
                    v75[1] = CFSTR("deviceInfo");
                    v76[0] = v12;
                    v76[1] = v52;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
                    v20 = (char *)objc_claimAutoreleasedReturnValue();
                    transferItems = self->_transferItems;
                  }
                  -[NSMutableArray addObject:](transferItems, "addObject:", v20);
LABEL_29:

                }
              }
              else
              {
                _TSLogDomain();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                  -[TSTransferCloudFlowModel filterTransferPlans:].cold.2(v77, &v78, v16);
              }
LABEL_30:

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v58, v79, 16);
          }
          while (v9);
        }

        v5 = v47 + 1;
      }
      while (v47 + 1 != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v80, 16);
    }
    while (v45);
  }

  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "deviceSupportsHydra") & 1) != 0)
  {

LABEL_39:
    -[NSMutableArray addObjectsFromArray:](self->_transferItems, "addObjectsFromArray:", v51);
    goto LABEL_40;
  }
  v24 = +[TSUtilities isPad](TSUtilities, "isPad");

  if (v24)
    goto LABEL_39;
LABEL_40:
  _TSLogDomain();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = -[NSMutableArray count](self->_transferItems, "count");
    v27 = self->_transferItems;
    *(_DWORD *)buf = 134218498;
    v68 = (const char *)v26;
    v69 = 2112;
    v70 = (const char *)v27;
    v71 = 2080;
    v72 = "-[TSTransferCloudFlowModel filterTransferPlans:]";
    _os_log_impl(&dword_21B647000, v25, OS_LOG_TYPE_DEFAULT, "transfer plans [%lu] : %@ @%s", buf, 0x20u);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v53 = self->_transferItems;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
  if (!v28)
    goto LABEL_73;
  v29 = v28;
  v30 = *(_QWORD *)v55;
  do
  {
    v31 = 0;
    do
    {
      if (*(_QWORD *)v55 != v30)
        objc_enumerationMutation(v53);
      objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v31), "objectForKeyedSubscript:", CFSTR("planItem"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "plan");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "transferAttributes");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v34, "transferCapability"))
        goto LABEL_52;
      objc_msgSend(v33, "transferAttributes");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v35, "transferCapability") == 1)
        goto LABEL_51;
      objc_msgSend(v33, "transferAttributes");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "transferCapability") == 12)
      {

LABEL_51:
LABEL_52:

        goto LABEL_53;
      }
      objc_msgSend(v33, "transferAttributes");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v50, "transferCapability") == 9)
      {
        v37 = 0;
      }
      else
      {
        objc_msgSend(v33, "transferAttributes");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v49, "transferCapability") == 7)
        {
          v37 = 0;
        }
        else
        {
          objc_msgSend(v33, "transferAttributes");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v48, "transferCapability") == 11)
          {
            v37 = 0;
          }
          else
          {
            objc_msgSend(v33, "transferAttributes");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v46, "transferCapability") == 8)
            {
              v37 = 0;
            }
            else
            {
              objc_msgSend(v33, "transferAttributes");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v44, "transferCapability") == 13)
              {
                v37 = 0;
              }
              else
              {
                objc_msgSend(v33, "transferAttributes");
                obja = (id)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(obja, "transferCapability") != 14;

              }
            }

          }
        }

      }
      if (v37)
      {

        goto LABEL_76;
      }
LABEL_53:

      ++v31;
    }
    while (v29 != v31);
    v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    v29 = v38;
  }
  while (v38);
LABEL_73:

  _TSLogDomain();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    -[TSTransferCloudFlowModel filterTransferPlans:].cold.1(v39);

  -[NSMutableArray removeAllObjects](self->_transferItems, "removeAllObjects");
LABEL_76:
  v4 = v40;
  p_super = &v51->super.super;
LABEL_77:

}

- (void)requestCarrierSetups:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __49__TSTransferCloudFlowModel_requestCarrierSetups___block_invoke;
    v14[3] = &unk_24DEF3508;
    objc_copyWeak(&v16, &location);
    v14[4] = self;
    v15 = v4;
    objc_msgSend(v5, "getCarrierSetupWithCompletion:", v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[TSTransferCloudFlowModel requestCarrierSetups:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

void __49__TSTransferCloudFlowModel_requestCarrierSetups___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id *WeakRetained;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v4;
      v12 = 2080;
      v13 = "-[TSTransferCloudFlowModel requestCarrierSetups:]_block_invoke";
      _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "Carrier setup %@ @%s", buf, 0x16u);
    }

    objc_storeStrong(WeakRetained + 4, a2);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __49__TSTransferCloudFlowModel_requestCarrierSetups___block_invoke_27;
    v8[3] = &unk_24DEF2CE8;
    v7 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v7, "getWebsheetInfo:completion:", v4, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __49__TSTransferCloudFlowModel_requestCarrierSetups___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)filterCarrierSetupItems:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "plans");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if (+[TSFlowHelper hasTransferablePlanWithSameCarrierName:transferablePlans:inBuddy:matchingSODACarrierWebsheetTransferPlanIndex:](TSFlowHelper, "hasTransferablePlanWithSameCarrierName:transferablePlans:inBuddy:matchingSODACarrierWebsheetTransferPlanIndex:", v6, self->_transferItems, 1, v9))
      {
        -[TSTransferCloudFlowModel clearCarrierSetupItemsCache](self, "clearCarrierSetupItemsCache");
      }
      else
      {
        objc_storeStrong((id *)&self->_carrierSetupItems, a3);
      }
      +[TSFlowHelper getAccountMemberTransferablePlanWithSameCarrierName:transferablePlans:](TSFlowHelper, "getAccountMemberTransferablePlanWithSameCarrierName:transferablePlans:", v6, self->_transferItems);
      v10 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v10;
      +[TSFlowHelper sortIndexesInDescending:](TSFlowHelper, "sortIndexesInDescending:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v21 != v14)
              objc_enumerationMutation(v11);
            v16 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "unsignedIntegerValue");
            _TSLogDomain();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              -[NSMutableArray objectAtIndex:](self->_transferItems, "objectAtIndex:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v25 = v18;
              v26 = 2080;
              v27 = "-[TSTransferCloudFlowModel filterCarrierSetupItems:]";
              _os_log_impl(&dword_21B647000, v17, OS_LOG_TYPE_DEFAULT, "Transferrable plan %@ will be removed from the list @%s", buf, 0x16u);

            }
            -[NSMutableArray removeObjectAtIndex:](self->_transferItems, "removeObjectAtIndex:", v16);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        }
        while (v13);
      }
      if (-[NSMutableArray count](self->_transferItems, "count"))
        -[TSTransferCloudFlowModel clearCarrierSetupItemsCache](self, "clearCarrierSetupItemsCache");

    }
  }

}

- (void)getWebsheetInfo:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[4];
  void (**v26)(_QWORD);
  id v27;
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6)
  {
    objc_initWeak(location, self);
    -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (unint64_t)objc_msgSend(v8, "count") > 1;

    if (v9)
    {
      _TSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[TSTransferCloudFlowModel getWebsheetInfo:completion:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    }
    -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count") == 0;

    if (!v19)
    {
      +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "plan");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __55__TSTransferCloudFlowModel_getWebsheetInfo_completion___block_invoke;
      v25[3] = &unk_24DEF3530;
      objc_copyWeak(&v27, location);
      v26 = v7;
      objc_msgSend(v20, "getWebsheetInfoForPlan:inBuddy:completion:", v23, 1, v25);

      objc_destroyWeak(&v27);
    }
    objc_destroyWeak(location);
  }
  else
  {
    _TSLogDomain();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[TSTransferCloudFlowModel getWebsheetInfo:completion:]";
      _os_log_impl(&dword_21B647000, v24, OS_LOG_TYPE_DEFAULT, "No carrier setup items @%s", (uint8_t *)location, 0xCu);
    }

    v7[2](v7);
  }

}

void __55__TSTransferCloudFlowModel_getWebsheetInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a2;
  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 6, a2);
    objc_storeStrong(v9 + 7, a3);
  }
  else
  {
    _TSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __55__TSTransferCloudFlowModel_getWebsheetInfo_completion___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)shouldShowCarrierSetupPane
{
  return self->_websheetUrl && self->_postdata != 0;
}

- (void)requestCrossPlatformTransferPlanListWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x220765A70](v4);
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getCoreTelephonyClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __79__TSTransferCloudFlowModel_requestCrossPlatformTransferPlanListWithCompletion___block_invoke;
    v17[3] = &unk_24DEF34B8;
    objc_copyWeak(&v19, &location);
    v8 = v5;
    v18 = v8;
    objc_msgSend(v7, "plansPendingCrossPlatformTransferWithCompletion:", v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    _TSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[TSTransferCloudFlowModel requestCrossPlatformTransferPlanListWithCompletion:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
}

void __79__TSTransferCloudFlowModel_requestCrossPlatformTransferPlanListWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  id v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      _TSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __79__TSTransferCloudFlowModel_requestCrossPlatformTransferPlanListWithCompletion___block_invoke_cold_2();

    }
    _TSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412546;
      v20 = v5;
      v21 = 2080;
      v22 = "-[TSTransferCloudFlowModel requestCrossPlatformTransferPlanListWithCompletion:]_block_invoke";
      _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "Cross platform transfer items %@ @%s", (uint8_t *)&v19, 0x16u);
    }

    v10 = v5;
    v11 = WeakRetained[5];
    WeakRetained[5] = v10;
  }
  else
  {
    _TSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __79__TSTransferCloudFlowModel_requestCrossPlatformTransferPlanListWithCompletion___block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearCarrierSetupItemsCache
{
  NSObject *v3;
  CTDisplayPlanList *carrierSetupItems;
  NSString *websheetUrl;
  NSDictionary *postdata;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[TSTransferCloudFlowModel clearCarrierSetupItemsCache]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "Clear carrier setup items cache @%s", (uint8_t *)&v7, 0xCu);
  }

  carrierSetupItems = self->_carrierSetupItems;
  self->_carrierSetupItems = 0;

  websheetUrl = self->_websheetUrl;
  self->_websheetUrl = 0;

  postdata = self->_postdata;
  self->_postdata = 0;

}

- (NSMutableArray)transferItems
{
  return self->_transferItems;
}

- (void)setTransferItems:(id)a3
{
  objc_storeStrong((id *)&self->_transferItems, a3);
}

- (CTDisplayPlanList)carrierSetupItems
{
  return self->_carrierSetupItems;
}

- (void)setCarrierSetupItems:(id)a3
{
  objc_storeStrong((id *)&self->_carrierSetupItems, a3);
}

- (CTDisplayPlanList)crossPlatformTransferItems
{
  return self->_crossPlatformTransferItems;
}

- (void)setCrossPlatformTransferItems:(id)a3
{
  objc_storeStrong((id *)&self->_crossPlatformTransferItems, a3);
}

- (BOOL)isActivationPolicyMismatch
{
  return self->_isActivationPolicyMismatch;
}

- (void)setIsActivationPolicyMismatch:(BOOL)a3
{
  self->_isActivationPolicyMismatch = a3;
}

- (BOOL)isDualeSIMCapablityLoss
{
  return self->_isDualeSIMCapablityLoss;
}

- (void)setIsDualeSIMCapablityLoss:(BOOL)a3
{
  self->_isDualeSIMCapablityLoss = a3;
}

- (NSString)websheetUrl
{
  return self->_websheetUrl;
}

- (void)setWebsheetUrl:(id)a3
{
  objc_storeStrong((id *)&self->_websheetUrl, a3);
}

- (NSDictionary)postdata
{
  return self->_postdata;
}

- (void)setPostdata:(id)a3
{
  objc_storeStrong((id *)&self->_postdata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postdata, 0);
  objc_storeStrong((id *)&self->_websheetUrl, 0);
  objc_storeStrong((id *)&self->_crossPlatformTransferItems, 0);
  objc_storeStrong((id *)&self->_carrierSetupItems, 0);
  objc_storeStrong((id *)&self->_transferItems, 0);
  objc_storeStrong((id *)&self->_queryGroup, 0);
}

void __46__TSTransferCloudFlowModel_arePlansAvailable___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self doesnt exist @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Invalid self @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)requestTransferPlans:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Invalid completion @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]query bootstrap transfer plan error: %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke_22_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self doesnt exist @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke_22_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]error: %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)filterTransferPlans:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[TSTransferCloudFlowModel filterTransferPlans:]";
  _os_log_debug_impl(&dword_21B647000, log, OS_LOG_TYPE_DEBUG, "[Db] no eligible plan to transfer in buddy @%s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)filterTransferPlans:(os_log_t)log .cold.2(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[TSTransferCloudFlowModel filterTransferPlans:]";
  _os_log_error_impl(&dword_21B647000, log, OS_LOG_TYPE_ERROR, "[E]invalid CTRemotePlan @%s", buf, 0xCu);
}

- (void)requestCarrierSetups:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Invalid completion @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)getWebsheetInfo:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Wrong number of carrier setup items on server @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __55__TSTransferCloudFlowModel_getWebsheetInfo_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self doesnt exist @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)requestCrossPlatformTransferPlanListWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Invalid completion @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __79__TSTransferCloudFlowModel_requestCrossPlatformTransferPlanListWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self doesnt exist @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __79__TSTransferCloudFlowModel_requestCrossPlatformTransferPlanListWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]%@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end

@implementation TSTransferFlowModel

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_11);
  return (id)sharedInstance_sModel;
}

void __37__TSTransferFlowModel_sharedInstance__block_invoke()
{
  TSTransferFlowModel *v0;
  void *v1;

  v0 = objc_alloc_init(TSTransferFlowModel);
  v1 = (void *)sharedInstance_sModel;
  sharedInstance_sModel = (uint64_t)v0;

}

- (TSTransferFlowModel)initWithIsStandaloneProximityTransfer:(BOOL)a3 transferBackPlan:(id)a4
{
  id v7;
  TSTransferFlowModel *v8;
  TSTransferFlowModel *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TSTransferFlowModel;
  v8 = -[TSTransferFlowModel init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_isStandaloneProximityTransfer = a3;
    objc_storeStrong(&v8->_transferBackPlan, a4);
  }

  return v9;
}

- (void)arePlansAvailable:(id)a3 transferablePlanOnSource:(BOOL)a4 bootstrapOnly:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id requestCompletion;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;
  id location;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = v11;
  if (v10)
    self->_isProximityFlow = 1;
  v13 = (void *)MEMORY[0x220765A70](v11);
  requestCompletion = self->_requestCompletion;
  self->_requestCompletion = v13;

  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __91__TSTransferFlowModel_arePlansAvailable_transferablePlanOnSource_bootstrapOnly_completion___block_invoke;
  v16[3] = &unk_24DEF3898;
  objc_copyWeak(&v18, &location);
  v15 = v12;
  v19 = v7;
  v16[4] = self;
  v17 = v15;
  -[TSTransferFlowModel requestPlans:transferablePlanOnSource:bootstrapOnly:completion:](self, "requestPlans:transferablePlanOnSource:bootstrapOnly:completion:", v10, v8, v7, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __91__TSTransferFlowModel_arePlansAvailable_transferablePlanOnSource_bootstrapOnly_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _BYTE *WeakRetained;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  void (*v21)(void);
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  int v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      _TSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v31 = 136315138;
        v32 = "-[TSTransferFlowModel arePlansAvailable:transferablePlanOnSource:bootstrapOnly:completion:]_block_invoke";
        _os_log_impl(&dword_21B647000, v11, OS_LOG_TYPE_DEFAULT, "Clear pending install plans & transfer plans flag @%s", (uint8_t *)&v31, 0xCu);
      }

      WeakRetained[8] = 0;
      WeakRetained[18] = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "filterCarrierSetupItems:", v9);
    if (v7 && objc_msgSend(v7, "count"))
      goto LABEL_14;
    if (v8)
    {
      objc_msgSend(v8, "plans");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v8, "plans");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15)
          goto LABEL_14;
      }
    }
    if (!v9)
      goto LABEL_18;
    objc_msgSend(v9, "plans");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_18;
    v17 = (void *)v16;
    objc_msgSend(v9, "plans");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
LABEL_14:
      objc_msgSend(WeakRetained, "requestCompletion");
      v20 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v21 = (void (*)(void))v20[2];
    }
    else
    {
LABEL_18:
      objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "getSupportedFlowTypes");

      objc_msgSend(WeakRetained, "requestCompletion");
      v20 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v21 = (void (*)(void))v20[2];
    }
    v21();

  }
  else
  {
    _TSLogDomain();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __91__TSTransferFlowModel_arePlansAvailable_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)bootstrap:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  if (!self->_isBootstrapTriggerred)
  {
    self->_isBootstrapTriggerred = 1;
    v5 = a4;
    v6 = a3;
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bootstrapPlanTransferUsingMessageSession:completion:", v6, v5);

  }
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
  id transferBackPlan;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  char *v21;
  NSObject *v22;
  NSMutableArray *transferItems;
  char *v24;
  void *v25;
  NSObject *p_super;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  NSMutableArray *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  BOOL v52;
  uint64_t v53;
  NSObject *v54;
  BOOL v55;
  id v56;
  id obj;
  id obja;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  int v65[2];
  NSMutableArray *v66;
  NSMutableArray *v67;
  void *v68;
  uint64_t v69;
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
  __int128 v80;
  __int128 v81;
  uint8_t v82[128];
  uint8_t buf[4];
  const char *v84;
  __int16 v85;
  const char *v86;
  __int16 v87;
  const char *v88;
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  uint8_t v93[4];
  uint64_t v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableArray removeAllObjects](self->_transferItems, "removeAllObjects");
  if (!v4)
  {
    _TSLogDomain();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v84 = "-[TSTransferFlowModel filterTransferPlans:]";
      _os_log_impl(&dword_21B647000, p_super, OS_LOG_TYPE_DEFAULT, "no remote plans @%s", buf, 0xCu);
    }
    goto LABEL_86;
  }
  v67 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v56 = v4;
  objc_msgSend(v4, "devices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
  if (v61)
  {
    v59 = *(_QWORD *)v79;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v79 != v59)
          objc_enumerationMutation(obj);
        v63 = v5;
        v6 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v5);
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        v68 = v6;
        objc_msgSend(v6, "remoteDisplayPlans");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v75;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v75 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
              if (objc_msgSend(v12, "isNotEligibleActivationPolicyMismatchPlan"))
                -[TSTransferFlowModel setIsActivationPolicyMismatch:](self, "setIsActivationPolicyMismatch:", 1);
              objc_msgSend(v12, "plan");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (v13)
              {
                objc_msgSend(v12, "plan");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) != 0)
                {
                  transferBackPlan = self->_transferBackPlan;
                  if (transferBackPlan)
                  {
                    objc_msgSend(transferBackPlan, "phoneNumber");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "phoneNumber");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    v19 = objc_msgSend(v17, "isEqualToPhoneNumber:", v18);

                    if (!v19)
                      continue;
                    _TSLogDomain();
                    v20 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(self->_transferBackPlan, "phoneNumber");
                      v21 = (char *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v84 = v21;
                      v85 = 2080;
                      v86 = "-[TSTransferFlowModel filterTransferPlans:]";
                      _os_log_impl(&dword_21B647000, v20, OS_LOG_TYPE_DEFAULT, "find plan with same phone number : %@ @%s", buf, 0x16u);

                    }
                  }
                  if ((objc_msgSend(v12, "isPhysical") & 1) != 0)
                  {
                    v89[0] = CFSTR("planItem");
                    v89[1] = CFSTR("deviceInfo");
                    v90[0] = v12;
                    v90[1] = v68;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
                    v22 = objc_claimAutoreleasedReturnValue();
                    transferItems = v67;
                  }
                  else
                  {
                    v91[0] = CFSTR("planItem");
                    v91[1] = CFSTR("deviceInfo");
                    v92[0] = v12;
                    v92[1] = v68;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v92, v91, 2);
                    v22 = objc_claimAutoreleasedReturnValue();
                    transferItems = self->_transferItems;
                  }
                  -[NSMutableArray addObject:](transferItems, "addObject:", v22);
                }
                else
                {
                  _TSLogDomain();
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v12, "plan");
                    v24 = (char *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v84 = v24;
                    v85 = 2080;
                    v86 = "-[TSTransferFlowModel filterTransferPlans:]";
                    _os_log_error_impl(&dword_21B647000, v22, OS_LOG_TYPE_ERROR, "[E]%@ is not a CTRemotePlan @%s", buf, 0x16u);

                  }
                }
              }
              else
              {
                _TSLogDomain();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  -[TSTransferFlowModel filterTransferPlans:].cold.2(v93, &v94, v22);
              }

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
          }
          while (v9);
        }

        v5 = v63 + 1;
      }
      while (v63 + 1 != v61);
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
    }
    while (v61);
  }

  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "deviceSupportsHydra") & 1) != 0 || +[TSUtilities isPad](TSUtilities, "isPad"))
  {

    p_super = &v67->super.super;
  }
  else
  {
    v55 = +[TSUtilities inBuddy](TSUtilities, "inBuddy");

    p_super = &v67->super.super;
    if (v55)
      goto LABEL_38;
  }
  v27 = (void *)-[NSMutableArray copy](self->_transferItems, "copy");
  -[NSMutableArray removeAllObjects](self->_transferItems, "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](self->_transferItems, "addObjectsFromArray:", p_super);
  -[NSMutableArray addObjectsFromArray:](self->_transferItems, "addObjectsFromArray:", v27);

LABEL_38:
  _TSLogDomain();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = -[NSMutableArray count](self->_transferItems, "count");
    v30 = self->_transferItems;
    *(_DWORD *)buf = 134218498;
    v84 = (const char *)v29;
    v85 = 2112;
    v86 = (const char *)v30;
    v87 = 2080;
    v88 = "-[TSTransferFlowModel filterTransferPlans:]";
    _os_log_impl(&dword_21B647000, v28, OS_LOG_TYPE_DEFAULT, "transfer plans [%lu] : %@ @%s", buf, 0x20u);
  }

  if (-[NSMutableArray count](self->_transferItems, "count") == 1)
  {
    -[NSMutableArray objectAtIndex:](self->_transferItems, "objectAtIndex:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("planItem"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "plan");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "transferAttributes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "transferCapability");

    if (v35 <= 6 && ((1 << v35) & 0x68) != 0)
      self->_showTransferredPane = 1;

    if (v35 <= 6 && ((1 << v35) & 0x68) != 0)
    {
      v4 = v56;
      goto LABEL_86;
    }
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v36 = self->_transferItems;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v71;
    v69 = *(_QWORD *)v71;
    v66 = v36;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v71 != v39)
          objc_enumerationMutation(v36);
        objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v40), "objectForKeyedSubscript:", CFSTR("planItem"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "plan");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "transferAttributes");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v43, "transferCapability"))
          goto LABEL_67;
        objc_msgSend(v42, "transferAttributes");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v44, "transferCapability") == 1)
          goto LABEL_66;
        objc_msgSend(v42, "transferAttributes");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v45, "transferCapability") == 12)
          goto LABEL_65;
        objc_msgSend(v42, "transferAttributes");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v46, "transferCapability") == 9)
          goto LABEL_64;
        objc_msgSend(v42, "transferAttributes");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "transferCapability") == 7)
          goto LABEL_63;
        *(_QWORD *)v65 = v38;
        objc_msgSend(v42, "transferAttributes");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v48, "transferCapability") == 11)
          goto LABEL_62;
        v64 = v48;
        objc_msgSend(v42, "transferAttributes");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v49, "transferCapability") == 8)
          goto LABEL_61;
        v62 = v49;
        objc_msgSend(v42, "transferAttributes");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v50, "transferCapability") == 13)
        {

          v49 = v62;
LABEL_61:

          v48 = v64;
LABEL_62:

          v38 = *(_QWORD *)v65;
LABEL_63:

LABEL_64:
LABEL_65:

          v36 = v66;
          v39 = v69;
LABEL_66:

LABEL_67:
          goto LABEL_68;
        }
        objc_msgSend(v42, "transferAttributes");
        obja = (id)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(obja, "transferCapability");

        v38 = *(_QWORD *)v65;
        v36 = v66;
        v39 = v69;
        if (v60 != 14)
          goto LABEL_84;
LABEL_68:
        objc_msgSend(v42, "transferAttributes");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v51, "transferCapability") == 8)
        {
          v52 = +[TSUtilities inBuddy](TSUtilities, "inBuddy");

          if (!v52)
            goto LABEL_84;
        }
        else
        {

        }
        if (self->_isStandaloneProximityTransfer && objc_msgSend(v41, "isTransferIneligiblePlan"))
        {
LABEL_84:

          goto LABEL_85;
        }

        ++v40;
      }
      while (v38 != v40);
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
      v38 = v53;
    }
    while (v53);
  }

  _TSLogDomain();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    -[TSTransferFlowModel filterTransferPlans:].cold.1(v54);

  -[NSMutableArray removeAllObjects](self->_transferItems, "removeAllObjects");
LABEL_85:
  v4 = v56;
  p_super = &v67->super.super;
LABEL_86:

}

- (BOOL)shouldShowTransferredPane
{
  void *v2;
  BOOL v3;

  if (!self->_showTransferredPane)
    return 0;
  -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (void)requestTransferPlans:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *transferItems;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_areTransferPlansReady)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    if (!self->_transferItems)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      transferItems = self->_transferItems;
      self->_transferItems = v6;

    }
    objc_initWeak(&location, self);
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __44__TSTransferFlowModel_requestTransferPlans___block_invoke;
    v9[3] = &unk_24DEF3468;
    objc_copyWeak(&v11, &location);
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v8, "transferPlanListWithCompletion:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __44__TSTransferFlowModel_requestTransferPlans___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  NSObject *v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char **v24;
  uint64_t v25;
  char *v26;
  void *v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const char *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v7)
    {
      _TSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __44__TSTransferFlowModel_requestTransferPlans___block_invoke_cold_2((uint64_t)v7, v9);

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = objc_msgSend(v7, "code") == 61;
    }
    else if (v6)
    {
      if (!+[TSUtilities isPad](TSUtilities, "isPad"))
      {
        +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "deviceSupportsHydra");

        if ((v19 & 1) == 0)
        {
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          objc_msgSend(v6, "devices", 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v30;
            v24 = &selRef_updateViewConstraints;
            while (2)
            {
              v25 = 0;
              v26 = v24[26];
              do
              {
                if (*(_QWORD *)v30 != v23)
                  objc_enumerationMutation(v20);
                v27 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v25);
                if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v27, "performSelector:", v26))
                {
                  _TSLogDomain();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v34 = "-[TSTransferFlowModel requestTransferPlans:]_block_invoke";
                    _os_log_impl(&dword_21B647000, v28, OS_LOG_TYPE_DEFAULT, "remote has dual eSIM config @%s", buf, 0xCu);
                  }

                  objc_msgSend(*(id *)(a1 + 32), "setIsDualeSIMCapablityLoss:", 1);
                  goto LABEL_25;
                }
                ++v25;
              }
              while (v22 != v25);
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
              v24 = &selRef_updateViewConstraints;
              if (v22)
                continue;
              break;
            }
          }
LABEL_25:

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "filterTransferPlans:", v6);
    }
  }
  else
  {
    _TSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __44__TSTransferFlowModel_requestTransferPlans___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)requestPendingInstallPlans:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_hasPendingInstallPlansQueried)
    goto LABEL_4;
  if (self->_isStandaloneProximityTransfer)
  {
    self->_hasPendingInstallPlansQueried = 1;
LABEL_4:
    (*((void (**)(id))v4 + 2))(v4);
    goto LABEL_5;
  }
  objc_initWeak(&location, self);
  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[TSTransferFlowModel requestPendingInstallPlans:]";
    _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "_requestPendingInstallItems @%s", buf, 0xCu);
  }

  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__TSTransferFlowModel_requestPendingInstallPlans___block_invoke;
  v8[3] = &unk_24DEF34E0;
  objc_copyWeak(&v10, &location);
  v9 = v5;
  objc_msgSend(v7, "pendingInstallItemsWithCompletion:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
LABEL_5:

}

void __50__TSTransferFlowModel_requestPendingInstallPlans___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id *WeakRetained;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = v4;
      v9 = 2080;
      v10 = "-[TSTransferFlowModel requestPendingInstallPlans:]_block_invoke";
      _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "pending plans: %@ @%s", (uint8_t *)&v7, 0x16u);
    }

    objc_storeStrong(WeakRetained + 4, a2);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)filterCarrierSetupItems:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (self->_areTransferPlansReady)
    {
      objc_msgSend(v5, "plans");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        if (+[TSFlowHelper hasTransferablePlanWithSameCarrierName:transferablePlans:inBuddy:matchingSODACarrierWebsheetTransferPlanIndex:](TSFlowHelper, "hasTransferablePlanWithSameCarrierName:transferablePlans:inBuddy:matchingSODACarrierWebsheetTransferPlanIndex:", v6, self->_transferItems, 1, v9))
        {
          -[TSTransferFlowModel clearCarrierSetupItemsCache](self, "clearCarrierSetupItemsCache");
        }
        else
        {
          objc_storeStrong((id *)&self->_carrierSetupItems, a3);
          v18 = v9;
          +[TSFlowHelper sortIndexesInDescending:](TSFlowHelper, "sortIndexesInDescending:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v20;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v20 != v13)
                  objc_enumerationMutation(v10);
                v15 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "unsignedIntegerValue");
                _TSLogDomain();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  -[NSMutableArray objectAtIndex:](self->_transferItems, "objectAtIndex:", v15);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v24 = v17;
                  v25 = 2080;
                  v26 = "-[TSTransferFlowModel filterCarrierSetupItems:]";
                  _os_log_impl(&dword_21B647000, v16, OS_LOG_TYPE_DEFAULT, "Transferrable plan %@ will be removed from the list @%s", buf, 0x16u);

                }
                -[NSMutableArray removeObjectAtIndex:](self->_transferItems, "removeObjectAtIndex:", v15);
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v12);
          }
          if (-[NSMutableArray count](self->_transferItems, "count"))
            -[TSTransferFlowModel clearCarrierSetupItemsCache](self, "clearCarrierSetupItemsCache");

          v9 = v18;
        }

      }
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
        -[TSTransferFlowModel getWebsheetInfo:completion:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

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
      v25[2] = __50__TSTransferFlowModel_getWebsheetInfo_completion___block_invoke;
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
      *(id *)((char *)location + 4) = "-[TSTransferFlowModel getWebsheetInfo:completion:]";
      _os_log_impl(&dword_21B647000, v24, OS_LOG_TYPE_DEFAULT, "No carrier setup items @%s", (uint8_t *)location, 0xCu);
    }

    v7[2](v7);
  }

}

void __50__TSTransferFlowModel_getWebsheetInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
      __50__TSTransferFlowModel_getWebsheetInfo_completion___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)shouldShowCarrierSetupPane
{
  return (+[TSUtilities isOnBootstrap](TSUtilities, "isOnBootstrap")
       || self->_isStandaloneProximityTransfer)
      && self->_websheetUrl
      && self->_postdata != 0;
}

- (void)requestCarrierSetups:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_hasCarrierSetupItemsQueried)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    objc_initWeak(&location, self);
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__TSTransferFlowModel_requestCarrierSetups___block_invoke;
    v7[3] = &unk_24DEF3508;
    objc_copyWeak(&v9, &location);
    v7[4] = self;
    v8 = v5;
    objc_msgSend(v6, "getCarrierSetupWithCompletion:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __44__TSTransferFlowModel_requestCarrierSetups___block_invoke(uint64_t a1, void *a2)
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
      v13 = "-[TSTransferFlowModel requestCarrierSetups:]_block_invoke";
      _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "Carrier setup %@ @%s", buf, 0x16u);
    }

    objc_storeStrong(WeakRetained + 5, a2);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__TSTransferFlowModel_requestCarrierSetups___block_invoke_31;
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

uint64_t __44__TSTransferFlowModel_requestCarrierSetups___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)arePlansRequested
{
  return self->_areTransferPlansReady && self->_hasPendingInstallPlansQueried && self->_hasCarrierSetupItemsQueried;
}

- (void)clearCache
{
  self->_areTransferPlansReady = 0;
  *(_WORD *)&self->_isBootstrapTriggerred = 0;
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
    v8 = "-[TSTransferFlowModel clearCarrierSetupItemsCache]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "Clear carrier setup items cache @%s", (uint8_t *)&v7, 0xCu);
  }

  carrierSetupItems = self->_carrierSetupItems;
  self->_carrierSetupItems = 0;

  websheetUrl = self->_websheetUrl;
  self->_websheetUrl = 0;

  postdata = self->_postdata;
  self->_postdata = 0;

}

- (void)forceRecheckTransferableAndPendingInstallPlans
{
  self->_areTransferPlansReady = 0;
  self->_hasPendingInstallPlansQueried = 0;
  self->_hasCarrierSetupItemsQueried = 0;
}

- (void)requestPlans:(id)a3 transferablePlanOnSource:(BOOL)a4 bootstrapOnly:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  void (**v11)(id, NSMutableArray *, CTDisplayPlanList *, CTDisplayPlanList *);
  void *v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *transferItems;
  NSObject *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  BOOL v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[5];
  _QWORD v34[5];
  id v35;
  id location;
  uint8_t buf[4];
  const char *v38;
  uint64_t v39;

  v8 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (void (**)(id, NSMutableArray *, CTDisplayPlanList *, CTDisplayPlanList *))a6;
  if (-[TSTransferFlowModel arePlansRequested](self, "arePlansRequested"))
  {
    v11[2](v11, self->_transferItems, self->_pendingInstallItems, self->_carrierSetupItems);
  }
  else
  {
    objc_initWeak(&location, self);
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy_;
    v34[4] = __Block_byref_object_dispose_;
    v12 = (void *)MEMORY[0x220765A70](v11);
    v13 = MEMORY[0x24BDAC760];
    v35 = v12;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke;
    v33[3] = &unk_24DEF38C0;
    v33[4] = v34;
    v14 = (void *)MEMORY[0x220765A70](v33);
    if (!self->_transferItems)
    {
      v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      transferItems = self->_transferItems;
      self->_transferItems = v15;

    }
    if (self->_isProximityFlow && v8 && !self->_areTransferPlansReady)
    {
      if (self->_isBootstrapComplete)
      {
        v30[0] = v13;
        v30[1] = 3221225472;
        v30[2] = __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_2;
        v30[3] = &unk_24DEF2F90;
        objc_copyWeak(&v32, &location);
        v31 = v14;
        -[TSTransferFlowModel requestTransferPlans:](self, "requestTransferPlans:", v30);

        objc_destroyWeak(&v32);
      }
      else
      {
        v26[0] = v13;
        v26[1] = 3221225472;
        v26[2] = __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_3;
        v26[3] = &unk_24DEF38E8;
        objc_copyWeak(&v28, &location);
        v19 = v14;
        v29 = a5;
        v26[4] = self;
        v27 = v19;
        -[TSTransferFlowModel bootstrap:completion:](self, "bootstrap:completion:", v10, v26);

        objc_destroyWeak(&v28);
      }
    }
    else
    {
      self->_areTransferPlansReady = 1;
    }
    if (self->_hasCarrierSetupItemsQueried || +[TSUtilities isPad](TSUtilities, "isPad"))
    {
      _TSLogDomain();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v38 = "-[TSTransferFlowModel requestPlans:transferablePlanOnSource:bootstrapOnly:completion:]";
        _os_log_impl(&dword_21B647000, v17, OS_LOG_TYPE_DEFAULT, "Skip querying SODA plans on iPad! @%s", buf, 0xCu);
      }

      self->_hasCarrierSetupItemsQueried = 1;
    }
    else
    {
      v23[0] = v13;
      v23[1] = 3221225472;
      v23[2] = __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_5;
      v23[3] = &unk_24DEF2F90;
      objc_copyWeak(&v25, &location);
      v24 = v14;
      -[TSTransferFlowModel requestCarrierSetups:](self, "requestCarrierSetups:", v23);

      objc_destroyWeak(&v25);
    }
    if (a5)
    {
      _TSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v38 = "-[TSTransferFlowModel requestPlans:transferablePlanOnSource:bootstrapOnly:completion:]";
        _os_log_impl(&dword_21B647000, v18, OS_LOG_TYPE_DEFAULT, "Skip querying pending install plans! @%s", buf, 0xCu);
      }

      self->_hasPendingInstallPlansQueried = 1;
      if (-[TSTransferFlowModel arePlansRequested](self, "arePlansRequested"))
        v11[2](v11, self->_transferItems, self->_pendingInstallItems, self->_carrierSetupItems);
    }
    else
    {
      v20[0] = v13;
      v20[1] = 3221225472;
      v20[2] = __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_33;
      v20[3] = &unk_24DEF2F90;
      objc_copyWeak(&v22, &location);
      v21 = v14;
      -[TSTransferFlowModel requestPendingInstallPlans:](self, "requestPendingInstallPlans:", v20);

      objc_destroyWeak(&v22);
    }

    _Block_object_dispose(v34, 8);
    objc_destroyWeak(&location);
  }

}

void __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

void __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[18] = 1;
    if (objc_msgSend(WeakRetained, "arePlansRequested"))
    {
      v3 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "transferItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pendingInstallItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "carrierSetupItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, void *))(v3 + 16))(v3, v4, v5, v6);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3 || *(_BYTE *)(a1 + 56))
    {
      WeakRetained[18] = 1;
      WeakRetained[10] = 1;
      if (objc_msgSend(WeakRetained, "arePlansRequested"))
      {
        v6 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v5, "transferItems");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "pendingInstallItems");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "carrierSetupItems");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *, void *))(v6 + 16))(v6, v7, v8, v9);

      }
    }
    else
    {
      WeakRetained[10] = 1;
      v10 = *(void **)(a1 + 32);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_4;
      v11[3] = &unk_24DEF2F90;
      objc_copyWeak(&v13, (id *)(a1 + 48));
      v12 = *(id *)(a1 + 40);
      objc_msgSend(v10, "requestTransferPlans:", v11);

      objc_destroyWeak(&v13);
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_4(uint64_t a1)
{
  _BYTE *WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[18] = 1;
    if (objc_msgSend(WeakRetained, "arePlansRequested"))
    {
      v3 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "transferItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pendingInstallItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "carrierSetupItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, void *))(v3 + 16))(v3, v4, v5, v6);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_5(uint64_t a1)
{
  _BYTE *WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[12] = 1;
    if (objc_msgSend(WeakRetained, "arePlansRequested"))
    {
      v3 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "transferItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pendingInstallItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "carrierSetupItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, void *))(v3 + 16))(v3, v4, v5, v6);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_33(uint64_t a1)
{
  _BYTE *WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[8] = 1;
    if (objc_msgSend(WeakRetained, "arePlansRequested"))
    {
      v3 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "transferItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pendingInstallItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "carrierSetupItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, void *))(v3 + 16))(v3, v4, v5, v6);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (NSMutableArray)transferItems
{
  return self->_transferItems;
}

- (void)setTransferItems:(id)a3
{
  objc_storeStrong((id *)&self->_transferItems, a3);
}

- (CTDisplayPlanList)pendingInstallItems
{
  return self->_pendingInstallItems;
}

- (void)setPendingInstallItems:(id)a3
{
  objc_storeStrong((id *)&self->_pendingInstallItems, a3);
}

- (CTDisplayPlanList)carrierSetupItems
{
  return self->_carrierSetupItems;
}

- (void)setCarrierSetupItems:(id)a3
{
  objc_storeStrong((id *)&self->_carrierSetupItems, a3);
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

- (BOOL)isStandaloneProximityTransfer
{
  return self->_isStandaloneProximityTransfer;
}

- (void)setIsStandaloneProximityTransfer:(BOOL)a3
{
  self->_isStandaloneProximityTransfer = a3;
}

- (BOOL)showTransferredPane
{
  return self->_showTransferredPane;
}

- (void)setShowTransferredPane:(BOOL)a3
{
  self->_showTransferredPane = a3;
}

- (BOOL)isTransferNotSupportedFromiPhone
{
  return self->_isTransferNotSupportedFromiPhone;
}

- (void)setIsTransferNotSupportedFromiPhone:(BOOL)a3
{
  self->_isTransferNotSupportedFromiPhone = a3;
}

- (BOOL)areTransferPlansReady
{
  return self->_areTransferPlansReady;
}

- (void)setAreTransferPlansReady:(BOOL)a3
{
  self->_areTransferPlansReady = a3;
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

- (id)transferBackPlan
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setTransferBackPlan:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (id)requestCompletion
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setRequestCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestCompletion, 0);
  objc_storeStrong(&self->_transferBackPlan, 0);
  objc_storeStrong((id *)&self->_postdata, 0);
  objc_storeStrong((id *)&self->_websheetUrl, 0);
  objc_storeStrong((id *)&self->_carrierSetupItems, 0);
  objc_storeStrong((id *)&self->_pendingInstallItems, 0);
  objc_storeStrong((id *)&self->_transferItems, 0);
}

void __91__TSTransferFlowModel_arePlansAvailable_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self doesnt exist @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)filterTransferPlans:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[TSTransferFlowModel filterTransferPlans:]";
  _os_log_debug_impl(&dword_21B647000, log, OS_LOG_TYPE_DEBUG, "[Db] no eligible plan to transfer in buddy @%s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)filterTransferPlans:(os_log_t)log .cold.2(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[TSTransferFlowModel filterTransferPlans:]";
  _os_log_error_impl(&dword_21B647000, log, OS_LOG_TYPE_ERROR, "[E]invalid CTRemotePlan @%s", buf, 0xCu);
}

void __44__TSTransferFlowModel_requestTransferPlans___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self doesnt exist @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __44__TSTransferFlowModel_requestTransferPlans___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2080;
  v5 = "-[TSTransferFlowModel requestTransferPlans:]_block_invoke";
  _os_log_error_impl(&dword_21B647000, a2, OS_LOG_TYPE_ERROR, "[E]error: %@ @%s", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)getWebsheetInfo:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Wrong number of carrier setup items on server @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __50__TSTransferFlowModel_getWebsheetInfo_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self doesnt exist @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end

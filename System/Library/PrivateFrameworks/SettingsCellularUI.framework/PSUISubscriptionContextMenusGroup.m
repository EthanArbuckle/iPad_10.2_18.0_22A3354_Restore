@implementation PSUISubscriptionContextMenusGroup

- (PSUISubscriptionContextMenusGroup)initWithFactory:(id)a3
{
  id v4;
  PSUISubscriptionContextMenusGroup *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PSSpecifier *parentSpecifier;
  uint64_t v10;
  PSUICallingSubgroup *callingSubgroup;
  uint64_t v12;
  PSUICarrierSpaceGroup *carrierSpaceSubgroup;
  uint64_t v14;
  PSUINetworkSelectionSubgroup *networkSelectionSubgroup;
  uint64_t v16;
  PSUIMyNumberSubgroup *myNumberSubgroup;
  uint64_t v18;
  PSUINetworkSettingsSubgroup *networkSettingsSubgroup;
  uint64_t v20;
  PSUISIMSubgroup *simSubgroup;
  uint64_t v22;
  PSUICoreTelephonyCallCache *callCache;
  uint64_t v24;
  PSSimStatusCache *simStatusCache;
  uint64_t v26;
  PSUICoreTelephonyCarrierBundleCache *carrierBundleCache;
  uint64_t v28;
  PSUICoreTelephonyDataCache *dataCache;
  uint64_t v30;
  PSUICellularPlanManagerCache *planManagerCache;
  uint64_t v32;
  CTCellularPlanManager *cellularPlanManager;
  void *v34;
  uint64_t v35;
  PSUIDataModeSubgroup *dataModeSubgroup;
  void *v37;
  uint64_t v38;
  PSUIRoamingSpecifiersSubgroup *roamingSpecifiersSubgroup;
  uint64_t v40;
  PSUIDevicePasscodeState *passcodeStatusCache;
  uint64_t v42;
  PSUICoreTelephonyCapabilitiesCache *capabilitiesCache;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PSUISubscriptionContextMenusGroup;
  v5 = -[PSUISubscriptionContextMenusGroup init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "hostController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_listController, v6);

    objc_msgSend(v4, "groupSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_groupSpecifier, v7);

    objc_msgSend(v4, "parentSpecifier");
    v8 = objc_claimAutoreleasedReturnValue();
    parentSpecifier = v5->_parentSpecifier;
    v5->_parentSpecifier = (PSSpecifier *)v8;

    v5->_popViewControllerOnFinished = objc_msgSend(v4, "shouldPopViewControllerOnPlanRemoval");
    objc_msgSend(v4, "createCallingSubgroup");
    v10 = objc_claimAutoreleasedReturnValue();
    callingSubgroup = v5->_callingSubgroup;
    v5->_callingSubgroup = (PSUICallingSubgroup *)v10;

    objc_msgSend(v4, "createCarrierSpaceSubgroup");
    v12 = objc_claimAutoreleasedReturnValue();
    carrierSpaceSubgroup = v5->_carrierSpaceSubgroup;
    v5->_carrierSpaceSubgroup = (PSUICarrierSpaceGroup *)v12;

    objc_msgSend(v4, "createNetworkSelectionSubgroup");
    v14 = objc_claimAutoreleasedReturnValue();
    networkSelectionSubgroup = v5->_networkSelectionSubgroup;
    v5->_networkSelectionSubgroup = (PSUINetworkSelectionSubgroup *)v14;

    objc_msgSend(v4, "createMyNumberSubgroup");
    v16 = objc_claimAutoreleasedReturnValue();
    myNumberSubgroup = v5->_myNumberSubgroup;
    v5->_myNumberSubgroup = (PSUIMyNumberSubgroup *)v16;

    objc_msgSend(v4, "createNetworkSettingsSubgroup");
    v18 = objc_claimAutoreleasedReturnValue();
    networkSettingsSubgroup = v5->_networkSettingsSubgroup;
    v5->_networkSettingsSubgroup = (PSUINetworkSettingsSubgroup *)v18;

    objc_msgSend(v4, "createSimSubgroup");
    v20 = objc_claimAutoreleasedReturnValue();
    simSubgroup = v5->_simSubgroup;
    v5->_simSubgroup = (PSUISIMSubgroup *)v20;

    objc_msgSend(v4, "createCallCache");
    v22 = objc_claimAutoreleasedReturnValue();
    callCache = v5->_callCache;
    v5->_callCache = (PSUICoreTelephonyCallCache *)v22;

    objc_msgSend(v4, "createSimStatusCache");
    v24 = objc_claimAutoreleasedReturnValue();
    simStatusCache = v5->_simStatusCache;
    v5->_simStatusCache = (PSSimStatusCache *)v24;

    objc_msgSend(v4, "createCarrierBundleCache");
    v26 = objc_claimAutoreleasedReturnValue();
    carrierBundleCache = v5->_carrierBundleCache;
    v5->_carrierBundleCache = (PSUICoreTelephonyCarrierBundleCache *)v26;

    objc_msgSend(v4, "createDataCache");
    v28 = objc_claimAutoreleasedReturnValue();
    dataCache = v5->_dataCache;
    v5->_dataCache = (PSUICoreTelephonyDataCache *)v28;

    objc_msgSend(v4, "createCellularPlanManagerCache");
    v30 = objc_claimAutoreleasedReturnValue();
    planManagerCache = v5->_planManagerCache;
    v5->_planManagerCache = (PSUICellularPlanManagerCache *)v30;

    objc_msgSend(v4, "createCellularPlanManager");
    v32 = objc_claimAutoreleasedReturnValue();
    cellularPlanManager = v5->_cellularPlanManager;
    v5->_cellularPlanManager = (CTCellularPlanManager *)v32;

    -[PSSpecifier propertyForKey:](v5->_parentSpecifier, "propertyForKey:", *MEMORY[0x24BE75CE8]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createDataModeSubgroupWithContext:", v34);
    v35 = objc_claimAutoreleasedReturnValue();
    dataModeSubgroup = v5->_dataModeSubgroup;
    v5->_dataModeSubgroup = (PSUIDataModeSubgroup *)v35;

    objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createRoamingSpecifiersSubgroupWithServiceDescriptor:", v37);
    v38 = objc_claimAutoreleasedReturnValue();
    roamingSpecifiersSubgroup = v5->_roamingSpecifiersSubgroup;
    v5->_roamingSpecifiersSubgroup = (PSUIRoamingSpecifiersSubgroup *)v38;

    objc_msgSend(v4, "createPasscodeStatusCache");
    v40 = objc_claimAutoreleasedReturnValue();
    passcodeStatusCache = v5->_passcodeStatusCache;
    v5->_passcodeStatusCache = (PSUIDevicePasscodeState *)v40;

    objc_msgSend(v4, "createCapabilitiesCache");
    v42 = objc_claimAutoreleasedReturnValue();
    capabilitiesCache = v5->_capabilitiesCache;
    v5->_capabilitiesCache = (PSUICoreTelephonyCapabilitiesCache *)v42;

  }
  return v5;
}

- (PSUISubscriptionContextMenusGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer called"), CFSTR("Unsupported initializer called"), 0));
}

- (void)viewWillAppear
{
  -[PSUICallingSubgroup viewWillAppear](self->_callingSubgroup, "viewWillAppear");
}

- (id)specifiers
{
  void *WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  PSUICellularPlanLabelSpecifier *v16;
  char v17;
  void *v18;
  int v19;
  PSUITurnOnThisLineSpecifier *v20;
  CTCellularPlanManager *v21;
  PSUICellularPlanManagerCache *v22;
  PSUICoreTelephonyCallCache *v23;
  id v24;
  PSUITurnOnThisLineSpecifier *v25;
  void *v26;
  CTCellularPlanManager *v27;
  PSUICellularPlanManagerCache *v28;
  PSUICoreTelephonyCallCache *v29;
  id v30;
  uint64_t v31;
  PSUITurnOnThisLineSpecifier *v32;
  CTCellularPlanManager *cellularPlanManager;
  PSUICellularPlanManagerCache *planManagerCache;
  PSUICoreTelephonyCallCache *callCache;
  PSUITurnOnThisLineSpecifier *v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  PSUITurnOffCellularSpecifier *v45;
  PSUICoreTelephonyCallCache *v46;
  id v47;
  PSUITurnOffCellularSpecifier *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  id v66;
  void *v67;
  char v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  PSUIRemoveCellularPlanSpecifier *v75;
  void *v76;
  void *v77;
  int v78;
  BOOL v79;
  PSUIRemoveCellularPlanSpecifier *v80;
  CTCellularPlanManager *v81;
  PSUICellularPlanManagerCache *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  unsigned __int8 v94;
  _BOOL4 popViewControllerOnFinished;
  BOOL v96;
  void *v97;
  int v98;
  _BOOL4 v99;
  _BOOL4 v100;
  _BOOL4 v101;
  int v102;
  void *v103;
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  void *v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v92 = *MEMORY[0x24BE75958];
  -[PSSpecifier propertyForKey:](self->_parentSpecifier, "propertyForKey:");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularPlanManagerCache planFromReferenceSafe:](self->_planManagerCache, "planFromReferenceSafe:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = *MEMORY[0x24BE75CE8];
  -[PSSpecifier propertyForKey:](self->_parentSpecifier, "propertyForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUISubscriptionContextMenusGroup getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v105 = v4;
    v106 = 2112;
    v107 = v5;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "menus: plan item: %@, context: %@", buf, 0x16u);
  }

  v101 = -[PSUISubscriptionContextMenusGroup planManagerCacheHasMoreThanOnePlanItem](self, "planManagerCacheHasMoreThanOnePlanItem");
  v7 = -[PSSimStatusCache isDualSimCapable](self->_simStatusCache, "isDualSimCapable");
  v96 = -[PSUICoreTelephonyDataCache isAirplaneModeEnabled](self->_dataCache, "isAirplaneModeEnabled");
  v100 = -[PSUIDevicePasscodeState isPasscodeSet](self->_passcodeStatusCache, "isPasscodeSet");
  +[PSUICoreTelephonyCapabilitiesCache sharedInstance](PSUICoreTelephonyCapabilitiesCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canSetTurnOffCellular:", v5);

  if (v9)
  {
    +[PSUICoreTelephonyCapabilitiesCache sharedInstance](PSUICoreTelephonyCapabilitiesCache, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v10, "getTurnOffCellular:", v5);

  }
  else
  {
    v94 = 0;
  }
  +[PSUICoreTelephonyCapabilitiesCache sharedInstance](PSUICoreTelephonyCapabilitiesCache, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v11, "canSetNetworkSlicing:", v5);

  if (v7)
  {
    if (v4)
    {
      objc_msgSend(v4, "carrierName");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v5)
        goto LABEL_12;
      -[PSUICoreTelephonyCarrierBundleCache carrierName:](self->_carrierBundleCache, "carrierName:", v5);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v12;
    WeakRetained = objc_loadWeakRetained((id *)&self->_groupSpecifier);
    objc_msgSend(WeakRetained, "setName:", v13);

  }
LABEL_12:
  v14 = (void *)objc_opt_new();
  if (v4)
    v15 = v7;
  else
    v15 = 0;
  v102 = v7;
  if (v15 != 1)
    goto LABEL_30;
  if (v101)
  {
    v16 = -[PSUICellularPlanLabelSpecifier initWithPlanUniversalReference:planManagerCache:]([PSUICellularPlanLabelSpecifier alloc], "initWithPlanUniversalReference:planManagerCache:", v103, self->_planManagerCache);
    objc_msgSend(v14, "addObject:", v16);
    WeakRetained = objc_loadWeakRetained((id *)&self->_groupSpecifier);
    objc_msgSend(WeakRetained, "setName:", &stru_24D5028C8);

  }
  v17 = objc_msgSend(v4, "isCheckingCellularConnectivity");
  if ((v17 & 1) == 0)
  {
    objc_msgSend(v4, "plan");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(WeakRetained, "status") != 14)
    {

      goto LABEL_26;
    }
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "sf_isiPhone");

  if ((v17 & 1) == 0)
  {

    if ((v19 & 1) != 0)
      goto LABEL_24;
LABEL_26:
    if (!objc_msgSend(v4, "isSelectable"))
      goto LABEL_30;
    v32 = [PSUITurnOnThisLineSpecifier alloc];
    planManagerCache = self->_planManagerCache;
    cellularPlanManager = self->_cellularPlanManager;
    callCache = self->_callCache;
    v24 = objc_loadWeakRetained((id *)&self->_listController);
    v25 = v32;
    v26 = v103;
    v27 = cellularPlanManager;
    v28 = planManagerCache;
    v29 = callCache;
    v30 = v24;
    v31 = 0;
    goto LABEL_28;
  }
  if (!v19)
    goto LABEL_26;
LABEL_24:
  v20 = [PSUITurnOnThisLineSpecifier alloc];
  v22 = self->_planManagerCache;
  v21 = self->_cellularPlanManager;
  v23 = self->_callCache;
  v24 = objc_loadWeakRetained((id *)&self->_listController);
  v25 = v20;
  v26 = v103;
  v27 = v21;
  v28 = v22;
  v29 = v23;
  v30 = v24;
  v31 = 1;
LABEL_28:
  v36 = -[PSUITurnOnThisLineSpecifier initWithPlanUniversalReference:cellularPlanManager:planManagerCache:callCache:hostController:isActivating:](v25, "initWithPlanUniversalReference:cellularPlanManager:planManagerCache:callCache:hostController:isActivating:", v26, v27, v28, v29, v30, v31);

  v7 = v102;
  if (v36)
  {
    objc_msgSend(v14, "addObject:", v36);

  }
LABEL_30:
  if (!v5)
    goto LABEL_75;
  if (!v4 || objc_msgSend(v4, "isSelected"))
  {
    v37 = v7 & v101;
    v91 = v7 & v101 ^ 1;
    if ((v91 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SPACER_GROUP"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "carrierName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setName:", v39);

      objc_msgSend(v14, "addObject:", v38);
    }
    -[PSUICarrierSpaceGroup specifierForID:](self->_carrierSpaceSubgroup, "specifierForID:", 0x24D5054C8);
    v40 = objc_claimAutoreleasedReturnValue();
    if (v40)
      objc_msgSend(v14, "addObject:", v40);
    v90 = (void *)v40;
    if (((v96 | v94) & 1) == 0)
    {
      -[PSUINetworkSelectionSubgroup specifiers](self->_networkSelectionSubgroup, "specifiers");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObjectsFromArray:", v41);

    }
    if (v7)
    {
      -[PSUICellularPlanManagerCache planItems](self->_planManagerCache, "planItems");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");

      if (v43 >= 2)
      {
        -[PSUIMyNumberSubgroup specifiers](self->_myNumberSubgroup, "specifiers");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObjectsFromArray:", v44);

      }
    }
    if (v9)
    {
      v45 = [PSUITurnOffCellularSpecifier alloc];
      v46 = self->_callCache;
      v47 = objc_loadWeakRetained((id *)&self->_listController);
      v48 = -[PSUITurnOffCellularSpecifier initWithContext:callCache:hostController:](v45, "initWithContext:callCache:hostController:", v5, v46, v47);

      objc_msgSend(v14, "addObject:", v48);
    }
    -[PSUICallingSubgroup specifiers](self->_callingSubgroup, "specifiers");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v49);

    if (v98)
    {
      v50 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("NETWORK_SLICING"), &stru_24D5028C8, CFSTR("Cellular"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v52, self, 0, sel_networkSlicingDetailText_, objc_opt_class(), 2, 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v53, "setIdentifier:", CFSTR("NETWORK_SLICING"));
      if (-[PSUICoreTelephonyCallCache isAnyCallActive](self->_callCache, "isAnyCallActive"))
        v54 = MEMORY[0x24BDBD1C0];
      else
        v54 = MEMORY[0x24BDBD1C8];
      objc_msgSend(v53, "setProperty:forKey:", v54, *MEMORY[0x24BE75A18]);
      objc_msgSend(v53, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      objc_msgSend(v53, "setProperty:forKey:", v5, v93);
      objc_msgSend(v14, "addObject:", v53);

    }
    if (((v96 | v94) & 1) == 0)
    {
      -[PSUINetworkSettingsSubgroup specifiers](self->_networkSettingsSubgroup, "specifiers");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObjectsFromArray:", v55);

    }
    -[PSUIDataModeSubgroup specifiers](self->_dataModeSubgroup, "specifiers");
    v56 = objc_claimAutoreleasedReturnValue();
    v99 = -[PSUIDataModeSubgroup shouldShowLinkCell](self->_dataModeSubgroup, "shouldShowLinkCell");
    if ((v37 & v99) == 1)
    {
      objc_msgSend(v14, "addObjectsFromArray:", v56);
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SeparatingGroupSpecifier"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v57);

    }
    if (v37)
    {
      -[PSUIRoamingSpecifiersSubgroup specifiers](self->_roamingSpecifiersSubgroup, "specifiers");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObjectsFromArray:", v58);

    }
    if (-[PSUICoreTelephonyDataCache isCellularUsageStatisticsEnabled](self->_dataCache, "isCellularUsageStatisticsEnabled"))
    {
      -[PSUICarrierSpaceGroup specifierForID:](self->_carrierSpaceSubgroup, "specifierForID:", 0x24D5054E8);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59)
        objc_msgSend(v14, "addObject:", v59);

    }
    -[PSUICarrierSpaceGroup specifierForID:](self->_carrierSpaceSubgroup, "specifierForID:", 0x24D505508);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
      objc_msgSend(v14, "addObject:", v60);
    -[PSUISIMSubgroup specifiers](self->_simSubgroup, "specifiers");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v61);

    v7 = v102;
    if ((objc_msgSend(v4, "isLocalTransferToeSIMSupported") & v100) != 1)
      goto LABEL_66;
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v62, "isActivationCodeFlowSupported"))
    {
      +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "isSingleActivationCodeFlowSupported");

      v7 = v102;
      if ((v64 & 1) != 0)
      {
LABEL_66:
        if ((_os_feature_enabled_impl() & 1) != 0)
          v68 = 0;
        else
          v68 = _os_feature_enabled_impl() ^ 1;
        v69 = (void *)v56;
        if ((objc_msgSend(v4, "supportedTransferOption") & 2) != 0 && (v68 & 1) == 0)
        {
          v70 = objc_loadWeakRetained((id *)&self->_listController);
          objc_msgSend(v4, "iccid");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "carrierName");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          +[PSUIGenerateTransferQRCodeSpecifier specifierWithHostController:iccid:carrierName:](PSUIGenerateTransferQRCodeSpecifier, "specifierWithHostController:iccid:carrierName:", v70, v71, v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          v69 = (void *)v56;
          objc_msgSend(v14, "addObject:", v73);

          v7 = v102;
        }
        if (((v91 | v99) & 1) == 0)
          objc_msgSend(v14, "addObjectsFromArray:", v69);

LABEL_75:
        if (!v4)
          goto LABEL_91;
        goto LABEL_76;
      }
      objc_msgSend(v4, "phoneNumber");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "carrierName");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_loadWeakRetained((id *)&self->_listController);
      popViewControllerOnFinished = self->_popViewControllerOnFinished;
      objc_msgSend(v4, "iccid");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSUIConvertToESIMSpecifier specifierWithPhoneNumber:carrierName:hostController:isViewControllerPopNeeded:iccid:](PSUIConvertToESIMSpecifier, "specifierWithPhoneNumber:carrierName:hostController:isViewControllerPopNeeded:iccid:", v97, v65, v66, popViewControllerOnFinished, v67);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v102;
      objc_msgSend(v14, "addObject:", v62);
    }

    goto LABEL_66;
  }
LABEL_76:
  if (objc_msgSend(v4, "type") == 2)
  {
    objc_msgSend(v4, "plan");
    v74 = objc_claimAutoreleasedReturnValue();
    if (!v74)
      goto LABEL_81;
    v75 = (PSUIRemoveCellularPlanSpecifier *)v74;
    objc_msgSend(v4, "plan");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v76, "isDeleteNotAllowed"))
    {

LABEL_90:
      goto LABEL_91;
    }
    objc_msgSend(v4, "plan");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "status");

    v79 = v78 == 14;
    v7 = v102;
    if (!v79)
    {
LABEL_81:
      if (v7)
      {
        v80 = [PSUIRemoveCellularPlanSpecifier alloc];
        v82 = self->_planManagerCache;
        v81 = self->_cellularPlanManager;
        v83 = objc_loadWeakRetained((id *)&self->_listController);
        v75 = -[PSUIRemoveCellularPlanSpecifier initWithPlanUniversalReference:cellularPlanManager:planManagerCache:hostController:popViewControllerOnPlanDeletion:](v80, "initWithPlanUniversalReference:cellularPlanManager:planManagerCache:hostController:popViewControllerOnPlanDeletion:", v103, v81, v82, v83, self->_popViewControllerOnFinished);

        if (!v101)
        {
          -[PSUIRemoveCellularPlanSpecifier alignLeft](v75, "alignLeft");
          goto LABEL_89;
        }
        v84 = (void *)MEMORY[0x24BE75590];
      }
      else
      {
        v85 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "localizedStringForKey:value:table:", CFSTR("DELETE_ESIM"), &stru_24D5028C8, CFSTR("Cellular"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v87, self, 0, 0, 0, 13, 0);
        v75 = (PSUIRemoveCellularPlanSpecifier *)objc_claimAutoreleasedReturnValue();

        -[PSUIRemoveCellularPlanSpecifier setButtonAction:](v75, "setButtonAction:", sel_deleteDataPlanTapped_);
        -[PSUIRemoveCellularPlanSpecifier setProperty:forKey:](v75, "setProperty:forKey:", v103, v92);
        -[PSUIRemoveCellularPlanSpecifier setProperty:forKey:](v75, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
        -[PSUIRemoveCellularPlanSpecifier setProperty:forKey:](v75, "setProperty:forKey:", &unk_24D51C350, *MEMORY[0x24BE75860]);
        if (!objc_msgSend(v14, "count") || !objc_msgSend(v4, "isSelected"))
          goto LABEL_89;
        v84 = (void *)MEMORY[0x24BE75590];
      }
      objc_msgSend(v84, "groupSpecifierWithID:", CFSTR("BOTTOM_SPACER_GROUP"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v88);

LABEL_89:
      objc_msgSend(v14, "addObject:", v75);
      goto LABEL_90;
    }
  }
LABEL_91:

  return v14;
}

- (BOOL)planManagerCacheHasMoreThanOnePlanItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[PSUICellularPlanManagerCache planItems](self->_planManagerCache, "planItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[PSUICellularPlanManagerCache danglingPlanItems](self->_planManagerCache, "danglingPlanItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;
  -[PSUICellularPlanManagerCache plansPendingTransfer](self->_planManagerCache, "plansPendingTransfer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = (unint64_t)(v6 + objc_msgSend(v7, "count")) > 1;

  return v6;
}

- (id)networkSlicingDetailText:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  -[PSSpecifier propertyForKey:](self->_parentSpecifier, "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICoreTelephonyCapabilitiesCache sharedInstance](PSUICoreTelephonyCapabilitiesCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getNetworkSlicing:", v3);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = CFSTR("NETWORK_SLICING_ON");
  else
    v8 = CFSTR("NETWORK_SLICING_OFF");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24D5028C8, CFSTR("Cellular"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)deleteDataPlanTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id WeakRetained;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id location[2];

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75958]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "planFromReference:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v22 = v5;
    v8 = (void *)MEMORY[0x24BEBD3B0];
    +[SettingsCellularUtils removePlanConfirmationTitle:](SettingsCellularUtils, "removePlanConfirmationTitle:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SettingsCellularUtils removePlanConfirmationMessage:](SettingsCellularUtils, "removePlanConfirmationMessage:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    location[0] = 0;
    objc_initWeak(location, self);
    v12 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("REMOVE"), &stru_24D5028C8, CFSTR("Cellular"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __58__PSUISubscriptionContextMenusGroup_deleteDataPlanTapped___block_invoke;
    v25[3] = &unk_24D501B30;
    objc_copyWeak(&v28, location);
    v25[4] = self;
    v15 = v7;
    v26 = v15;
    v27 = v4;
    objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 2, v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject addAction:](v11, "addAction:", v16);
    v17 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D5028C8, CFSTR("Cellular"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __58__PSUISubscriptionContextMenusGroup_deleteDataPlanTapped___block_invoke_2;
    v23[3] = &unk_24D501B58;
    v23[4] = self;
    v24 = v15;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject addAction:](v11, "addAction:", v20);
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v11, 1, 0);

    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
    v5 = v22;
  }
  else
  {
    -[PSUISubscriptionContextMenusGroup getLogger](self, "getLogger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_2161C6000, v11, OS_LOG_TYPE_DEFAULT, "planItem is null!", (uint8_t *)location, 2u);
    }
  }

}

void __58__PSUISubscriptionContextMenusGroup_deleteDataPlanTapped___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Confirmed delete plan: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 48), "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__PSUISubscriptionContextMenusGroup_deleteDataPlanTapped___block_invoke_49;
  v10[3] = &unk_24D501B08;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = WeakRetained;
  objc_msgSend(v5, "didDeletePlanItem:completion:", v6, v10);

}

void __58__PSUISubscriptionContextMenusGroup_deleteDataPlanTapped___block_invoke_49(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Failed to delete plan item:%@ with error:%@", buf, 0x16u);
    }

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58__PSUISubscriptionContextMenusGroup_deleteDataPlanTapped___block_invoke_50;
      block[3] = &unk_24D501660;
      block[4] = v7;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }

}

void __58__PSUISubscriptionContextMenusGroup_deleteDataPlanTapped___block_invoke_50(uint64_t a1)
{
  void *v1;
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "popViewControllerAnimated:", 1);

}

void __58__PSUISubscriptionContextMenusGroup_deleteDataPlanTapped___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_2161C6000, v2, OS_LOG_TYPE_DEFAULT, "Cancelled delete plan: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("SubscriptionContextMenusGroup"));
}

- (PSSpecifier)parentSpecifier
{
  return self->_parentSpecifier;
}

- (void)setParentSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentSpecifier, a3);
}

- (PSSpecifier)groupSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_groupSpecifier);
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_groupSpecifier, a3);
}

- (PSListController)listController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (void)setListController:(id)a3
{
  objc_storeWeak((id *)&self->_listController, a3);
}

- (BOOL)popViewControllerOnFinished
{
  return self->_popViewControllerOnFinished;
}

- (void)setPopViewControllerOnFinished:(BOOL)a3
{
  self->_popViewControllerOnFinished = a3;
}

- (PSUICallingSubgroup)callingSubgroup
{
  return self->_callingSubgroup;
}

- (void)setCallingSubgroup:(id)a3
{
  objc_storeStrong((id *)&self->_callingSubgroup, a3);
}

- (PSUICarrierSpaceGroup)carrierSpaceSubgroup
{
  return self->_carrierSpaceSubgroup;
}

- (void)setCarrierSpaceSubgroup:(id)a3
{
  objc_storeStrong((id *)&self->_carrierSpaceSubgroup, a3);
}

- (PSUINetworkSelectionSubgroup)networkSelectionSubgroup
{
  return self->_networkSelectionSubgroup;
}

- (void)setNetworkSelectionSubgroup:(id)a3
{
  objc_storeStrong((id *)&self->_networkSelectionSubgroup, a3);
}

- (PSUIMyNumberSubgroup)myNumberSubgroup
{
  return self->_myNumberSubgroup;
}

- (void)setMyNumberSubgroup:(id)a3
{
  objc_storeStrong((id *)&self->_myNumberSubgroup, a3);
}

- (PSUINetworkSettingsSubgroup)networkSettingsSubgroup
{
  return self->_networkSettingsSubgroup;
}

- (void)setNetworkSettingsSubgroup:(id)a3
{
  objc_storeStrong((id *)&self->_networkSettingsSubgroup, a3);
}

- (PSUISIMSubgroup)simSubgroup
{
  return self->_simSubgroup;
}

- (void)setSimSubgroup:(id)a3
{
  objc_storeStrong((id *)&self->_simSubgroup, a3);
}

- (PSUIDataModeSubgroup)dataModeSubgroup
{
  return self->_dataModeSubgroup;
}

- (void)setDataModeSubgroup:(id)a3
{
  objc_storeStrong((id *)&self->_dataModeSubgroup, a3);
}

- (PSUICoreTelephonyCallCache)callCache
{
  return self->_callCache;
}

- (void)setCallCache:(id)a3
{
  objc_storeStrong((id *)&self->_callCache, a3);
}

- (PSSimStatusCache)simStatusCache
{
  return self->_simStatusCache;
}

- (void)setSimStatusCache:(id)a3
{
  objc_storeStrong((id *)&self->_simStatusCache, a3);
}

- (PSUICoreTelephonyCarrierBundleCache)carrierBundleCache
{
  return self->_carrierBundleCache;
}

- (void)setCarrierBundleCache:(id)a3
{
  objc_storeStrong((id *)&self->_carrierBundleCache, a3);
}

- (PSUICoreTelephonyDataCache)dataCache
{
  return self->_dataCache;
}

- (void)setDataCache:(id)a3
{
  objc_storeStrong((id *)&self->_dataCache, a3);
}

- (PSUICellularPlanManagerCache)planManagerCache
{
  return self->_planManagerCache;
}

- (void)setPlanManagerCache:(id)a3
{
  objc_storeStrong((id *)&self->_planManagerCache, a3);
}

- (CTCellularPlanManager)cellularPlanManager
{
  return self->_cellularPlanManager;
}

- (void)setCellularPlanManager:(id)a3
{
  objc_storeStrong((id *)&self->_cellularPlanManager, a3);
}

- (PSUIRoamingSpecifiersSubgroup)roamingSpecifiersSubgroup
{
  return self->_roamingSpecifiersSubgroup;
}

- (void)setRoamingSpecifiersSubgroup:(id)a3
{
  objc_storeStrong((id *)&self->_roamingSpecifiersSubgroup, a3);
}

- (PSUIDevicePasscodeState)passcodeStatusCache
{
  return self->_passcodeStatusCache;
}

- (void)setPasscodeStatusCache:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeStatusCache, a3);
}

- (PSUICoreTelephonyCapabilitiesCache)capabilitiesCache
{
  return self->_capabilitiesCache;
}

- (void)setCapabilitiesCache:(id)a3
{
  objc_storeStrong((id *)&self->_capabilitiesCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilitiesCache, 0);
  objc_storeStrong((id *)&self->_passcodeStatusCache, 0);
  objc_storeStrong((id *)&self->_roamingSpecifiersSubgroup, 0);
  objc_storeStrong((id *)&self->_cellularPlanManager, 0);
  objc_storeStrong((id *)&self->_planManagerCache, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_storeStrong((id *)&self->_carrierBundleCache, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_storeStrong((id *)&self->_callCache, 0);
  objc_storeStrong((id *)&self->_dataModeSubgroup, 0);
  objc_storeStrong((id *)&self->_simSubgroup, 0);
  objc_storeStrong((id *)&self->_networkSettingsSubgroup, 0);
  objc_storeStrong((id *)&self->_myNumberSubgroup, 0);
  objc_storeStrong((id *)&self->_networkSelectionSubgroup, 0);
  objc_storeStrong((id *)&self->_carrierSpaceSubgroup, 0);
  objc_storeStrong((id *)&self->_callingSubgroup, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_storeStrong((id *)&self->_parentSpecifier, 0);
}

@end

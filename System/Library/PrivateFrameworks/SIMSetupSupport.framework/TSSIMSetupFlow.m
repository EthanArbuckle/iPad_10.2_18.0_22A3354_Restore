@implementation TSSIMSetupFlow

- (void)setTopViewController:(id)a3
{
  id v4;
  id WeakRetained;
  UIViewController *v6;
  UIViewController *firstViewControllerInstance;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_2551938A0))
    objc_msgSend(v4, "setDelegate:", self);
  objc_storeWeak((id *)&self->_topViewController, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  if (WeakRetained)
  {

  }
  else if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    v6 = (UIViewController *)v4;
    firstViewControllerInstance = self->_firstViewControllerInstance;
    self->_firstViewControllerInstance = v6;
    goto LABEL_8;
  }
  firstViewControllerInstance = self->_firstViewControllerInstance;
  self->_firstViewControllerInstance = 0;
LABEL_8:

  _TSLogDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v4;
    v16 = 2080;
    v17 = "-[TSSIMSetupFlow setTopViewController:]";
    _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "inject back button action for : %@ @%s", (uint8_t *)&v14, 0x16u);
  }

  v9 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("BACK"), &stru_24DEF4290, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithTitle:style:target:action:", v11, 0, self, sel_restartWith_);
  objc_msgSend(v4, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackBarButtonItem:", v12);

}

- (TSSetupFlowItem)topViewController
{
  return (TSSetupFlowItem *)objc_loadWeakRetained((id *)&self->_topViewController);
}

+ (void)needsToRun:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

+ (void)needsToRunUsingMessageSession:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

+ (void)needsToRunUsingMessageSession:(id)a3 transferablePlanOnSource:(BOOL)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

+ (id)initWithOptions:(id)a3
{
  return +[TSSIMSetupFlow flowWithOptions:](TSSIMSetupFlow, "flowWithOptions:", a3);
}

+ (id)createTSRemotePlanWebsheetContext:(id)a3
{
  id v3;
  TSRemotePlanWebsheetContext *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = objc_alloc_init(TSRemotePlanWebsheetContext);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CarrierNameKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSRemotePlanWebsheetContext setCarrierName:](v4, "setCarrierName:", v5);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SubscriptionContextKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSRemotePlanWebsheetContext setSubscriptionContext:](v4, "setSubscriptionContext:", v6);

  objc_msgSend(v3, "valueForKey:", CFSTR("FlowTypeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSRemotePlanWebsheetContext setFlowType:](v4, "setFlowType:", objc_msgSend(v7, "intValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Iccid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Iccid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSRemotePlanWebsheetContext setIccid:](v4, "setIccid:", v9);

  }
  else
  {
    -[TSRemotePlanWebsheetContext setIccid:](v4, "setIccid:", &stru_24DEF4290);
  }

  -[TSRemotePlanWebsheetContext setUseLiveID:](v4, "setUseLiveID:", 0);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WebsheetURLKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSRemotePlanWebsheetContext setUrl:](v4, "setUrl:", v10);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WebsheetPostdataKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSRemotePlanWebsheetContext setPostdata:](v4, "setPostdata:", v11);

  objc_msgSend(v3, "valueForKey:", CFSTR("LiveIdEnabledKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    -[TSRemotePlanWebsheetContext setUseLiveID:](v4, "setUseLiveID:", objc_msgSend(v12, "BOOLValue"));

  return v4;
}

+ (id)flowWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (+[TSUtilities hasCellularBaseband](TSUtilities, "hasCellularBaseband"))
  {
    +[TSSIMSetupFlow _flowWithOptions:](TSSIMSetupFlow, "_flowWithOptions:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "valueForKey:", CFSTR("FlowTypeKey"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFlowType:", (int)objc_msgSend(v5, "intValue"));

    }
  }
  else
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "+[TSSIMSetupFlow flowWithOptions:]";
      _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "no cellular support!!! @%s", (uint8_t *)&v8, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

+ (id)_flowWithOptions:(id)a3
{
  char *v4;
  NSObject *v5;
  void *v6;
  int v7;
  TSTransferFlow *v8;
  TSRemotePlanSignUpFlow *v9;
  void *v10;
  TSUserResponseFlow *v11;
  id v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  TSWebsheetSignupFlow *v16;
  void *v17;
  TSManagedDeviceInstallFlow *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  TSOnDeviceConversionFlow *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  TSCarrierSignupFlow *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __objc2_class *v61;
  TSQRCodeScanFlow *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i;
  uint64_t v72;
  int v73;
  void *v74;
  char v75;
  TSWebsheetSignupFlow *v76;
  id v77;
  void *v78;
  TSSetupAssistantSIMSetupFlow *v79;
  void *v80;
  uint64_t v81;
  TSSIMSetupPublicApiInstallFlow *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  const char *v88;
  id v89;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  char v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  TSWebsheetSignupFlow *v106;
  void *v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint8_t v113[128];
  uint8_t buf[4];
  const char *v115;
  __int16 v116;
  const char *v117;
  uint64_t v118;

  v118 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v115 = v4;
    v116 = 2080;
    v117 = "+[TSSIMSetupFlow _flowWithOptions:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "%@ @%s", buf, 0x16u);
  }

  objc_msgSend(v4, "valueForKey:", CFSTR("FlowTypeKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  v8 = 0;
  switch(v7)
  {
    case 1:
      objc_msgSend(v4, "valueForKey:", CFSTR("ConfirmationCodeRequiredKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = objc_msgSend(v10, "BOOLValue");
      else
        v13 = 0;
      v11 = -[TSUserResponseFlow initWithConfirmationCodeRequired:]([TSUserResponseFlow alloc], "initWithConfirmationCodeRequired:", v13);
      goto LABEL_102;
    case 2:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Plan"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v16 = [TSWebsheetSignupFlow alloc];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Plan"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[TSWebsheetSignupFlow initWithPlan:](v16, "initWithPlan:", v17);
LABEL_86:
        v8 = (TSTransferFlow *)v18;

        goto LABEL_104;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Iccid"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v75 = objc_opt_isKindOfClass();

      if ((v75 & 1) != 0)
      {
        v76 = [TSWebsheetSignupFlow alloc];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Iccid"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[TSWebsheetSignupFlow initWithIccid:](v76, "initWithIccid:", v17);
        goto LABEL_86;
      }
      objc_msgSend(v4, "valueForKey:", CFSTR("WebsheetURLKey"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v101 = objc_opt_isKindOfClass();

      if ((v101 & 1) == 0)
      {
        v8 = 0;
        goto LABEL_104;
      }
      objc_msgSend(v4, "valueForKey:", CFSTR("RequestTypeKey"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v102;
      if (v102)
        v103 = objc_msgSend(v102, "unsignedIntegerValue");
      else
        v103 = 0;
      objc_msgSend(v4, "valueForKey:", CFSTR("SkipIntroPaneForWebsheetFlow"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v104;
      if (v104)
        v105 = objc_msgSend(v104, "BOOLValue");
      else
        v105 = 0;
      v106 = [TSWebsheetSignupFlow alloc];
      objc_msgSend(v4, "valueForKey:", CFSTR("WebsheetURLKey"));
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "valueForKey:", CFSTR("WebsheetPostdataKey"));
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[TSWebsheetSignupFlow initWithRequestType:skipIntroPaneForWebsheetFlow:websheetURL:postdata:](v106, "initWithRequestType:skipIntroPaneForWebsheetFlow:websheetURL:postdata:", v103, v105, v107, v108);

      goto LABEL_80;
    case 3:
      objc_msgSend(v4, "valueForKey:", CFSTR("RequireSetupKey-DEBUG"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = objc_msgSend(v10, "BOOLValue");
      else
        v19 = 0;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TransferBackPlan"));
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v77 = (id)objc_claimAutoreleasedReturnValue();

      if (v27 == v77)
      {

        v27 = 0;
      }
      v28 = -[TSActivationFlowWithSimSetupFlow initRequireSetup:transferBackPlan:]([TSActivationFlowWithSimSetupFlow alloc], "initRequireSetup:transferBackPlan:", v19, v27);
      goto LABEL_79;
    case 4:
      objc_msgSend(v4, "valueForKey:", CFSTR("RequireSetupKey-DEBUG"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = objc_msgSend(v10, "BOOLValue") ^ 1;
      else
        v20 = 1;
      objc_msgSend(v4, "valueForKey:", CFSTR("SetupNewIccidKey"));
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "valueForKey:", CFSTR("ForceDualSIMSetup"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = -[TSSetupAssistantSIMSetupFlow initWithIccid:showAddPlan:forceDualSIMSetup:allowDismiss:]([TSSetupAssistantSIMSetupFlow alloc], "initWithIccid:showAddPlan:forceDualSIMSetup:allowDismiss:", v27, v20, v78 != 0, 1);
      goto LABEL_116;
    case 5:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MessageSessionKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HasTransferablePlan"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "BOOLValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsStandaloneProximityTransfer"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "BOOLValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TransferBackPlan"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25 == v26)
      {

        v25 = 0;
      }
      v8 = -[TSTransferFlow initWithSession:hasTransferablePlan:isStandaloneProximityTransfer:transferBackPlan:]([TSTransferFlow alloc], "initWithSession:hasTransferablePlan:isStandaloneProximityTransfer:transferBackPlan:", v10, v22, v24, v25);

      goto LABEL_103;
    case 6:
    case 14:
    case 15:
      goto LABEL_104;
    case 7:
    case 8:
      v9 = [TSRemotePlanSignUpFlow alloc];
      objc_msgSend(a1, "createTSRemotePlanWebsheetContext:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[TSRemotePlanSignUpFlow initWithRemotePlanWebsheetContext:](v9, "initWithRemotePlanWebsheetContext:", v10);
      goto LABEL_102;
    case 9:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CarrierNameKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PhoneNumberKey"));
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v28 = -[TSOnDeviceConversionFlow initWithPhoneNumber:carrierName:]([TSOnDeviceConversionFlow alloc], "initWithPhoneNumber:carrierName:", v27, v10);
      goto LABEL_79;
    case 10:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExternalizedContextKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PlanDescriptorKey"));
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LocalConversionOngoing"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "BOOLValue");

      v28 = -[TSAuthFlow initWithExternalizedContext:descriptor:isLocalConvertFlow:]([TSAuthFlow alloc], "initWithExternalizedContext:descriptor:isLocalConvertFlow:", v10, v27, v30);
      goto LABEL_79;
    case 11:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Iccid"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[TSTransferQRCodeFlow initWithIccid:]([TSTransferQRCodeFlow alloc], "initWithIccid:", v10);
      goto LABEL_102;
    case 12:
      objc_msgSend(v4, "valueForKey:", CFSTR("WaitForServiceKey"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v32 = objc_msgSend(v31, "BOOLValue");
      else
        v32 = 0;
      objc_msgSend(v4, "valueForKey:", CFSTR("FallbackToActivationCodeKey"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v81 = objc_msgSend(v80, "BOOLValue");
      else
        v81 = 0;
      objc_msgSend(v4, "valueForKey:", CFSTR("IgnoreTransportKey"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v86 = objc_msgSend(v17, "BOOLValue");
      else
        v86 = 0;
      v18 = -[TSManagedDeviceInstallFlow initWith:fallbackToActivationCode:ignoreTransport:]([TSManagedDeviceInstallFlow alloc], "initWith:fallbackToActivationCode:ignoreTransport:", v32, v81, v86);
      goto LABEL_86;
    case 13:
      objc_msgSend(v4, "valueForKey:", CFSTR("ProximitySetupStateKey"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v33;
      if (v33)
        v34 = objc_msgSend(v33, "unsignedIntegerValue");
      else
        v34 = 0;
      v11 = -[TSTransferCloudFlow initWithProximitySetupState:]([TSTransferCloudFlow alloc], "initWithProximitySetupState:", v34);
      goto LABEL_102;
    case 16:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SkipActivatingPane"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "BOOLValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DelayStartActivatingTimer"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DelayStartActivatingTimer"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (int)objc_msgSend(v38, "intValue");

      }
      else
      {
        v39 = 1;
      }

      objc_msgSend(v4, "valueForKey:", CFSTR("PlanSetupTypeKey"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      if (v91)
      {
        objc_msgSend(v4, "valueForKey:", CFSTR("PlanSetupTypeKey"));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = (int)objc_msgSend(v92, "intValue");

      }
      else
      {
        v93 = 2;
      }

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TransferBackPlan"));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      if (v94 == v95)
      {

        v94 = 0;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CarrierNameKey"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      if (v96 == v97)
      {

        v96 = 0;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MaybeShowConfirmationCodePaneKey"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v98, "BOOLValue");

      v8 = -[TSCellularPlanActivatingFlow initWithSkipActivatingPane:timerType:transferBackPlan:setupType:carrierName:maybeShowConfirmationCodePane:]([TSCellularPlanActivatingFlow alloc], "initWithSkipActivatingPane:timerType:transferBackPlan:setupType:carrierName:maybeShowConfirmationCodePane:", v36, v39, v94, v93, v96, v99);
      goto LABEL_104;
    case 17:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HostViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = [TSCarrierSignupFlow alloc];
      if (v10)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Plan"));
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = -[TSCarrierSignupFlow initWithPlan:queriableFirstViewController:hostViewController:](v40, "initWithPlan:queriableFirstViewController:hostViewController:", v27, 1, v10);
      }
      else
      {
        objc_msgSend(v4, "valueForKey:", CFSTR("Plan"));
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = -[TSCarrierSignupFlow initWithPlan:](v40, "initWithPlan:", v27);
      }
      goto LABEL_79;
    case 18:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CarrierNameKey"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v41;
      if (!v41 || !objc_msgSend(v41, "length"))
      {
        _TSLogDomain();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          +[TSSIMSetupFlow _flowWithOptions:].cold.1(v42, v43, v44, v45, v46, v47, v48, v49);

      }
      objc_msgSend(v4, "valueForKey:", CFSTR("RequireSetupKey-DEBUG"));
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v50 = objc_msgSend(v27, "BOOLValue");
      else
        v50 = 0;
      v82 = [TSSIMSetupPublicApiInstallFlow alloc];
      v83 = v10;
      v84 = v50;
      v85 = 0;
      goto LABEL_78;
    case 19:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CarrierNameKey"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v51;
      if (!v51 || !objc_msgSend(v51, "length"))
      {
        _TSLogDomain();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          +[TSSIMSetupFlow _flowWithOptions:].cold.2(v52, v53, v54, v55, v56, v57, v58, v59);

      }
      objc_msgSend(v4, "valueForKey:", CFSTR("RequireSetupKey-DEBUG"));
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v60 = objc_msgSend(v27, "BOOLValue");
      else
        v60 = 0;
      v82 = [TSSIMSetupPublicApiInstallFlow alloc];
      v83 = v10;
      v84 = v60;
      v85 = 1;
LABEL_78:
      v28 = -[TSSIMSetupPublicApiInstallFlow initWithAppName:requireSetup:skipGeneralInstallConsent:](v82, "initWithAppName:requireSetup:skipGeneralInstallConsent:", v83, v84, v85);
      goto LABEL_79;
    case 20:
      v61 = TSIDSTransferFlow;
      goto LABEL_46;
    case 21:
      v61 = TSRecommendedCarrierAppsFlow;
LABEL_46:
      v62 = (TSQRCodeScanFlow *)objc_alloc_init(v61);
      goto LABEL_48;
    case 22:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsFirstViewKey"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "BOOLValue");

      v62 = -[TSQRCodeScanFlow initWithBackButton:]([TSQRCodeScanFlow alloc], "initWithBackButton:", v64 ^ 1u);
LABEL_48:
      v8 = (TSTransferFlow *)v62;
      goto LABEL_104;
    case 23:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TravelOptionsKey"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v65, "mutableCopy");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TravelOptionsKey"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "allKeys");
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v27 = v67;
      v68 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v109, v113, 16);
      if (v68)
      {
        v69 = v68;
        v70 = *(_QWORD *)v110;
        do
        {
          for (i = 0; i != v69; ++i)
          {
            if (*(_QWORD *)v110 != v70)
              objc_enumerationMutation(v27);
            v72 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * i);
            if ((objc_msgSend(&unk_24DF23488, "containsObject:", v72, (_QWORD)v109) & 1) == 0)
              objc_msgSend(v10, "removeObjectForKey:", v72);
          }
          v69 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v109, v113, 16);
        }
        while (v69);
      }

      v28 = -[TSTravelEducationFlow initWithOptions:]([TSTravelEducationFlow alloc], "initWithOptions:", v10);
      goto LABEL_79;
    default:
      if (v7 != 10002)
      {
        if (v7 != 10003)
          goto LABEL_104;
        v12 = objc_alloc(MEMORY[0x24BDD1540]);
        v10 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", *MEMORY[0x24BE158B0], 46, 0);
        v11 = -[TSActivationPolicyMismatchFlow initWithPlanItemError:]([TSActivationPolicyMismatchFlow alloc], "initWithPlanItemError:", v10);
LABEL_102:
        v8 = (TSTransferFlow *)v11;
        goto LABEL_103;
      }
      objc_msgSend(v4, "valueForKey:", CFSTR("IsClientKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v73 = objc_msgSend(v10, "BOOLValue");
      else
        v73 = 0;
      _TSLogDomain();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        v88 = "no";
        if (v73)
          v88 = "yes";
        *(_DWORD *)buf = 136315394;
        v115 = v88;
        v116 = 2080;
        v117 = "+[TSSIMSetupFlow _flowWithOptions:]";
        _os_log_impl(&dword_21B647000, v87, OS_LOG_TYPE_DEFAULT, "client ? %s @%s", buf, 0x16u);
      }

      if (!v73)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TransferBackPlan"));
        v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v89 = (id)objc_claimAutoreleasedReturnValue();

        if (v27 == v89)
        {

          v27 = 0;
        }
        v28 = -[TSProximityTargetTransferFlow initWithTransferBackPlan:]([TSProximityTargetTransferFlow alloc], "initWithTransferBackPlan:", v27);
        goto LABEL_79;
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("ResumeTransferProxCardKey"));
      v27 = (id)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v27, "BOOLValue"))
          {
            v28 = -[TSProximitySourceTransferFlow initForResumption]([TSProximitySourceTransferFlow alloc], "initForResumption");
LABEL_79:
            v8 = (TSTransferFlow *)v28;
            goto LABEL_80;
          }
        }
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PeerDeviceKey"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = -[TSProximitySourceTransferFlow initWithPeerDevice:]([TSProximitySourceTransferFlow alloc], "initWithPeerDevice:", v78);
LABEL_116:
      v8 = (TSTransferFlow *)v79;

LABEL_80:
LABEL_103:

LABEL_104:
      return v8;
  }
}

+ (id)initWithSetupFlowWithIccid:(id)a3 showAddPlan:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  TSSetupAssistantSIMSetupFlow *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "+[TSSIMSetupFlow initWithSetupFlowWithIccid:showAddPlan:]";
    v11 = 2080;
    v12 = "+[TSSIMSetupFlow initWithSetupFlowWithIccid:showAddPlan:]";
    _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "%s @%s", (uint8_t *)&v9, 0x16u);
  }

  v7 = -[TSSetupAssistantSIMSetupFlow initWithIccid:showAddPlan:forceDualSIMSetup:allowDismiss:]([TSSetupAssistantSIMSetupFlow alloc], "initWithIccid:showAddPlan:forceDualSIMSetup:allowDismiss:", v5, v4, 0, 1);
  return v7;
}

+ (id)initWithSetupFlowWithIccid:(id)a3 showAddPlan:(BOOL)a4 forceDualSIMSetup:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  NSObject *v8;
  TSSetupAssistantSIMSetupFlow *v9;
  int v11;
  const char *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v5 = a5;
  v6 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  _TSLogDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315906;
    v12 = "+[TSSIMSetupFlow initWithSetupFlowWithIccid:showAddPlan:forceDualSIMSetup:]";
    v13 = 1024;
    v14 = v6;
    v15 = 1024;
    v16 = v5;
    v17 = 2080;
    v18 = "+[TSSIMSetupFlow initWithSetupFlowWithIccid:showAddPlan:forceDualSIMSetup:]";
    _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "%s showAddPlan: %d forceDualSIMSetup: %d @%s", (uint8_t *)&v11, 0x22u);
  }

  v9 = -[TSSetupAssistantSIMSetupFlow initWithIccid:showAddPlan:forceDualSIMSetup:allowDismiss:]([TSSetupAssistantSIMSetupFlow alloc], "initWithIccid:showAddPlan:forceDualSIMSetup:allowDismiss:", v7, v6, v5, 1);
  return v9;
}

+ (id)initActivationCodeRequireSetup:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "+[TSSIMSetupFlow initActivationCodeRequireSetup:]";
    v8 = 2080;
    v9 = "+[TSSIMSetupFlow initActivationCodeRequireSetup:]";
    _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "%s @%s", (uint8_t *)&v6, 0x16u);
  }

  return -[TSActivationFlowWithSimSetupFlow initRequireSetup:transferBackPlan:]([TSActivationFlowWithSimSetupFlow alloc], "initRequireSetup:transferBackPlan:", v3, 0);
}

+ (id)initWithActivationCodeOnlyFlow
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "+[TSSIMSetupFlow initWithActivationCodeOnlyFlow]";
    v6 = 2080;
    v7 = "+[TSSIMSetupFlow initWithActivationCodeOnlyFlow]";
    _os_log_impl(&dword_21B647000, v2, OS_LOG_TYPE_DEFAULT, "%s @%s", (uint8_t *)&v4, 0x16u);
  }

  return -[TSActivationFlowWithSimSetupFlow initRequireSetup:transferBackPlan:]([TSActivationFlowWithSimSetupFlow alloc], "initRequireSetup:transferBackPlan:", 0, 0);
}

- (TSSIMSetupFlow)init
{
  TSSIMSetupFlow *v2;
  TSSIMSetupFlow *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  NSMutableDictionary *backOptions;
  void *v8;
  void *v9;
  objc_super v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)TSSIMSetupFlow;
  v2 = -[TSSIMSetupFlow init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isFlowFinished = 0;
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(MEMORY[0x24BEBD788], "_useCustomBackButtonAction");
      *(_DWORD *)buf = 67109378;
      v13 = v5;
      v14 = 2080;
      v15 = "-[TSSIMSetupFlow init]";
      _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "use custom button action : %d @%s", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x24BEBD788], "_setUseCustomBackButtonAction:", 1);
    v6 = objc_opt_new();
    backOptions = v3->_backOptions;
    v3->_backOptions = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel_appForegrounded, *MEMORY[0x24BEBE008], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, sel_appBackgrounded, *MEMORY[0x24BEBDF98], 0);

  }
  return v3;
}

- (BOOL)isBootstrapAssertionRequired
{
  return 1;
}

- (id)firstViewController
{
  return 0;
}

- (void)firstViewController:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)showFirstViewControllerWithHostController:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (id)rootViewController
{
  UINavigationController **p_navigationController;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  TSSIMSetupFlow *v13;
  NSObject *v14;
  int v16;
  void *v17;
  __int16 v18;
  TSSIMSetupFlow *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  p_navigationController = &self->_navigationController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);

  if (!WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_topViewController);
    objc_msgSend(v5, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_loadWeakRetained((id *)&self->_topViewController);
    v8 = v7;
    if (!v6)
      return v8;
    objc_msgSend(v7, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_navigationController, v9);

  }
  v10 = objc_loadWeakRetained((id *)p_navigationController);
  objc_msgSend(v10, "viewControllers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    v12 = 0;
    while (1)
    {
      objc_msgSend(v11, "objectAtIndex:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "conformsToProtocol:", &unk_2551938A0))
      {
        objc_msgSend(v8, "delegate");
        v13 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue();

        if (v13 == self)
          break;
      }

      if (++v12 >= (unint64_t)objc_msgSend(v11, "count"))
        goto LABEL_9;
    }
    _TSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412802;
      v17 = v8;
      v18 = 2112;
      v19 = self;
      v20 = 2080;
      v21 = "-[TSSIMSetupFlow rootViewController]";
      _os_log_impl(&dword_21B647000, v14, OS_LOG_TYPE_DEFAULT, "root view controller %@ for flow %@ @%s", (uint8_t *)&v16, 0x20u);
    }

  }
  else
  {
LABEL_9:
    v8 = 0;
  }

  return v8;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!self->_isFlowFinished)
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[TSSIMSetupFlow presentationControllerDidDismiss:]";
      _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "user swipe down to dismiss flow. quit @%s", (uint8_t *)&v5, 0xCu);
    }

    -[TSSIMSetupFlow userDidTapCancel](self, "userDidTapCancel");
  }
}

- (id)nextViewControllerFrom:(id)a3
{
  return 0;
}

- (void)restartWith:(id)a3
{
  UINavigationController **p_navigationController;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  unint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  id v28;
  NSObject *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  p_navigationController = &self->_navigationController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);

  if (!WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_topViewController);
    objc_msgSend(v6, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_navigationController, v7);

  }
  v8 = objc_loadWeakRetained((id *)p_navigationController);
  objc_msgSend(v8, "topViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[TSSIMSetupFlow _needCustomizeBackAction:](self, "_needCustomizeBackAction:", v9))
  {
    -[TSSIMSetupFlow _startOver:](self, "_startOver:", v9);
  }
  else
  {
    v10 = objc_loadWeakRetained((id *)p_navigationController);
    objc_msgSend(v10, "viewControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12 < 2)
    {
      v17 = 0;
    }
    else
    {
      v13 = objc_loadWeakRetained((id *)p_navigationController);
      objc_msgSend(v13, "viewControllers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_loadWeakRetained((id *)p_navigationController);
      objc_msgSend(v15, "viewControllers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v16, "count") - 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = objc_loadWeakRetained((id *)p_navigationController);
        objc_msgSend(v18, "viewControllers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        if (v20 < 3)
        {
          v25 = 0;
        }
        else
        {
          v21 = objc_loadWeakRetained((id *)p_navigationController);
          objc_msgSend(v21, "viewControllers");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_loadWeakRetained((id *)p_navigationController);
          objc_msgSend(v23, "viewControllers");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndex:", objc_msgSend(v24, "count") - 3);
          v25 = objc_claimAutoreleasedReturnValue();

          v17 = v21;
        }

        v17 = (void *)v25;
      }
    }
    _TSLogDomain();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138412802;
      v31 = v9;
      v32 = 2112;
      v33 = v17;
      v34 = 2080;
      v35 = "-[TSSIMSetupFlow restartWith:]";
      _os_log_impl(&dword_21B647000, v26, OS_LOG_TYPE_DEFAULT, "normal back from : %@ -> %@ @%s", (uint8_t *)&v30, 0x20u);
    }

    if (v17)
    {
      v27 = objc_loadWeakRetained((id *)p_navigationController);
      v28 = (id)objc_msgSend(v27, "popToViewController:animated:", v17, 1);

      if (objc_msgSend(v17, "conformsToProtocol:", &unk_2551938A0))
      {
        objc_storeWeak((id *)&self->_topViewController, v17);
      }
      else
      {
        _TSLogDomain();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[TSSIMSetupFlow restartWith:].cold.1();

      }
    }
    else
    {
      -[TSSIMSetupFlow _notifyFlowCompletion:](self, "_notifyFlowCompletion:", 1);
    }

  }
}

- (BOOL)_needCustomizeBackAction:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v12;
  _BYTE v13[18];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v12 = 136315138;
      *(_QWORD *)v13 = "-[TSSIMSetupFlow _needCustomizeBackAction:]";
      v7 = "[I] self is nil @%s";
      v8 = v5;
      v9 = OS_LOG_TYPE_INFO;
      v10 = 12;
LABEL_13:
      _os_log_impl(&dword_21B647000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
LABEL_14:
    LOBYTE(v6) = 0;
    goto LABEL_15;
  }
  if (self->_isFlowFinished)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      *(_QWORD *)v13 = "-[TSSIMSetupFlow _needCustomizeBackAction:]";
      _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "back tapped after flow end. @%s", (uint8_t *)&v12, 0xCu);
    }
    LOBYTE(v6) = 1;
    goto LABEL_15;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      *(_QWORD *)v13 = v4;
      *(_WORD *)&v13[8] = 2080;
      *(_QWORD *)&v13[10] = "-[TSSIMSetupFlow _needCustomizeBackAction:]";
      v7 = "%@ doesnot require customized back @%s";
      v8 = v5;
      v9 = OS_LOG_TYPE_DEFAULT;
      v10 = 22;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v6 = objc_msgSend(v4, "isStartOverRequiredOnBackButtonTapped");
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 67109378;
    *(_DWORD *)v13 = v6;
    *(_WORD *)&v13[4] = 2080;
    *(_QWORD *)&v13[6] = "-[TSSIMSetupFlow _needCustomizeBackAction:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "is start over required : %d @%s", (uint8_t *)&v12, 0x12u);
  }
LABEL_15:

  return v6;
}

- (BOOL)_startOver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v11[5];
  id v12;
  id v13;
  id location;
  uint8_t buf[4];
  TSSIMSetupFlow *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TSSIMSetupFlow waitForResponse:](self, "waitForResponse:", v4);
  -[TSSIMSetupFlow parentFlow](self, "parentFlow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TSSIMSetupFlow parentFlow](self, "parentFlow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_startOver:", v4);

  }
  else
  {
    objc_initWeak(&location, self);
    _TSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v16 = self;
      v17 = 2112;
      v18 = v4;
      v19 = 2080;
      v20 = "-[TSSIMSetupFlow _startOver:]";
      _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "check start over vc for root flow : %@, vc : %@ @%s", buf, 0x20u);
    }

    dispatch_get_global_queue(2, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __29__TSSIMSetupFlow__startOver___block_invoke;
    v11[3] = &unk_24DEF2E78;
    v11[4] = self;
    objc_copyWeak(&v13, &location);
    v12 = v4;
    dispatch_async(v9, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    v7 = 1;
  }

  return v7;
}

void __29__TSSIMSetupFlow__startOver___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__TSSIMSetupFlow__startOver___block_invoke_2;
  v5[3] = &unk_24DEF2EF0;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "startOverWithFirstViewController:", v5);

  objc_destroyWeak(&v8);
}

void __29__TSSIMSetupFlow__startOver___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__TSSIMSetupFlow__startOver___block_invoke_3;
  v5[3] = &unk_24DEF2EC8;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = *(_QWORD *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v9);
}

void __29__TSSIMSetupFlow__startOver___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "receivedResponseWithVC:", *(_QWORD *)(a1 + 32));

  if (*(_QWORD *)(a1 + 40))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_loadWeakRetained(v2);
      objc_msgSend(*(id *)(a1 + 40), "subFlow");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setParentFlow:", v4);

    }
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "_pushStartOverViewController:from:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[TSSIMSetupFlow _startOver:]_block_invoke";
      _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "assert in purchase with startOver @%s", (uint8_t *)&v11, 0xCu);
    }

    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assertUserInPurchaseFlowStartOver:caller:", 1, *(_QWORD *)(a1 + 48));
  }
  else
  {
    _TSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (char *)objc_loadWeakRetained(v2);
      v11 = 138412546;
      v12 = v10;
      v13 = 2080;
      v14 = "-[TSSIMSetupFlow _startOver:]_block_invoke_3";
      _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "cannot start over, pop all views for flow : %@ @%s", (uint8_t *)&v11, 0x16u);

    }
    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "_popAllSIMSetupFlowViewControllers:", *(_QWORD *)(a1 + 32));
  }

}

- (void)_popAllSIMSetupFlowViewControllers:(id)a3
{
  char *v4;
  void *v5;
  UINavigationController **p_navigationController;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *WeakRetained;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  int v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  -[TSSIMSetupFlow rootViewController](self, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _TSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[TSSIMSetupFlow _popAllSIMSetupFlowViewControllers:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
    v20 = (id)objc_msgSend(WeakRetained, "popViewControllerAnimated:", 1);
    goto LABEL_13;
  }
  p_navigationController = &self->_navigationController;
  v7 = objc_loadWeakRetained((id *)&self->_navigationController);
  objc_msgSend(v7, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v5);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL && v9)
  {
    v21 = objc_loadWeakRetained((id *)&self->_navigationController);
    objc_msgSend(v21, "viewControllers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndex:", v9 - 1);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    _TSLogDomain();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138412802;
      v27 = v4;
      v28 = 2112;
      v29 = WeakRetained;
      v30 = 2080;
      v31 = "-[TSSIMSetupFlow _popAllSIMSetupFlowViewControllers:]";
      _os_log_impl(&dword_21B647000, v23, OS_LOG_TYPE_DEFAULT, "pop all. from %@ to %@ @%s", (uint8_t *)&v26, 0x20u);
    }

    v24 = objc_loadWeakRetained((id *)p_navigationController);
    v25 = (id)objc_msgSend(v24, "popToViewController:animated:", WeakRetained, 1);

LABEL_13:
    goto LABEL_14;
  }
  _TSLogDomain();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 136315138;
    v27 = "-[TSSIMSetupFlow _popAllSIMSetupFlowViewControllers:]";
    _os_log_impl(&dword_21B647000, v10, OS_LOG_TYPE_DEFAULT, "no previous view controller, cancel SS flow @%s", (uint8_t *)&v26, 0xCu);
  }

  -[TSSIMSetupFlow userDidTapCancel](self, "userDidTapCancel");
LABEL_14:

}

- (void)_pushStartOverViewController:(id)a3 from:(id)a4
{
  char *v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  char *v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  int v27;
  id v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a3;
  v7 = a4;
  _TSLogDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412802;
    v28 = v7;
    v29 = 2112;
    v30 = v6;
    v31 = 2080;
    v32 = "-[TSSIMSetupFlow _pushStartOverViewController:from:]";
    _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "start over - back from %@ to %@ @%s", (uint8_t *)&v27, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  objc_msgSend(WeakRetained, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[TSSIMSetupFlow rootViewController](self, "rootViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = objc_msgSend(v11, "indexOfObject:", v12);
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_9;
    _TSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[TSSIMSetupFlow _pushStartOverViewController:from:].cold.1(v14);

  }
  v13 = 0;
LABEL_9:
  _TSLogDomain();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412546;
    v28 = v11;
    v29 = 2080;
    v30 = "-[TSSIMSetupFlow _pushStartOverViewController:from:]";
    _os_log_impl(&dword_21B647000, v15, OS_LOG_TYPE_DEFAULT, "before shrink. view controllers : %@ @%s", (uint8_t *)&v27, 0x16u);
  }

  objc_msgSend(v11, "insertObject:atIndex:", v6, v13);
  _TSLogDomain();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412546;
    v28 = v11;
    v29 = 2080;
    v30 = "-[TSSIMSetupFlow _pushStartOverViewController:from:]";
    _os_log_impl(&dword_21B647000, v16, OS_LOG_TYPE_DEFAULT, "after insert: vcs:%@ @%s", (uint8_t *)&v27, 0x16u);
  }

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "takeScreenShot:", v7);
    v17 = objc_loadWeakRetained((id *)&self->_navigationController);
    objc_msgSend(v17, "setViewControllers:animated:", v11, 0);

    v18 = objc_loadWeakRetained((id *)&self->_navigationController);
    v19 = v18;
    v20 = v6;
    v21 = 0;
  }
  else
  {
    v22 = objc_loadWeakRetained((id *)&self->_navigationController);
    objc_msgSend(v22, "setViewControllers:animated:", v11, 0);

    v18 = objc_loadWeakRetained((id *)&self->_navigationController);
    v19 = v18;
    v20 = v6;
    v21 = 1;
  }
  v23 = (id)objc_msgSend(v18, "popToViewController:animated:", v20, v21);

  _TSLogDomain();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_loadWeakRetained((id *)&self->_navigationController);
    objc_msgSend(v25, "viewControllers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412546;
    v28 = v26;
    v29 = 2080;
    v30 = "-[TSSIMSetupFlow _pushStartOverViewController:from:]";
    _os_log_impl(&dword_21B647000, v24, OS_LOG_TYPE_DEFAULT, "after pop to new root. view controllers : %@ @%s", (uint8_t *)&v27, 0x16u);

  }
  -[TSSIMSetupFlow setIsFlowFinished:](self, "setIsFlowFinished:", 0);
  -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v6);

}

- (void)startOverWithFirstViewController:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;

  v4 = (void (**)(id, _QWORD))a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[TSSIMSetupFlow startOverWithFirstViewController:].cold.1((uint64_t)self, v5);

  v4[2](v4, 0);
}

- (void)navigateToNextPaneFrom:(id)a3 navigationController:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  UIViewController *firstViewControllerInstance;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  TSSIMSetupFlow *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);

    if (!WeakRetained)
    {
      objc_storeWeak((id *)&self->_navigationController, v7);
      firstViewControllerInstance = self->_firstViewControllerInstance;
      self->_firstViewControllerInstance = 0;

    }
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__TSSIMSetupFlow_navigateToNextPaneFrom_navigationController___block_invoke;
  block[3] = &unk_24DEF2D88;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __62__TSSIMSetupFlow_navigateToNextPaneFrom_navigationController___block_invoke(id *a1)
{
  uint64_t *v2;
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  _BOOL8 v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  NSObject *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a1[4];
  v2 = (uint64_t *)(a1 + 4);
  objc_msgSend(a1[5], "dismissingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __62__TSSIMSetupFlow_navigateToNextPaneFrom_navigationController___block_invoke_cold_1(v2, v5, v17);
  }
  else
  {
    objc_msgSend(a1[5], "setDismissingViewController:", a1[4]);
    objc_msgSend(a1[5], "nextViewControllerFrom:", a1[4]);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setNextViewController:", v5);
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      v8 = v7;
      v9 = (void *)objc_opt_class();
      v10 = v9;
      v11 = objc_opt_class();
      v12 = a1[5];
      *(_DWORD *)buf = 138413570;
      v30 = v7;
      v31 = 2112;
      v32 = v9;
      v33 = 2048;
      v34 = (const char *)v5;
      v35 = 2112;
      v36 = v11;
      v37 = 2048;
      v38 = v12;
      v39 = 2080;
      v40 = "-[TSSIMSetupFlow navigateToNextPaneFrom:navigationController:]_block_invoke";
      _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "current view: %@ next view: %@<%p>, flow: %@<%p> @%s", buf, 0x3Eu);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = a1[5];
      v14 = v5;
      -[NSObject subFlow](v14, "subFlow");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setParentFlow:", v13);

    }
    if (v5)
    {
      if (-[NSObject conformsToProtocol:](v5, "conformsToProtocol:", &unk_2551938A0))
        -[NSObject setDelegate:](v5, "setDelegate:", a1[5]);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(a1[5], "waitForResponse:", *v2);
        v16 = (objc_opt_respondsToSelector() & 1) != 0
           && objc_msgSend((id)*v2, "performSelector:", sel_userInteractionEnabled) != 0;
        objc_msgSend(a1[6], "topViewController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setUserInteractionEnabled:", v16);

        objc_initWeak((id *)buf, a1[5]);
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __62__TSSIMSetupFlow_navigateToNextPaneFrom_navigationController___block_invoke_141;
        v24[3] = &unk_24DEF2F18;
        objc_copyWeak(&v28, (id *)buf);
        v5 = v5;
        v25 = v5;
        v26 = a1[4];
        v27 = a1[6];
        -[NSObject prepare:](v5, "prepare:", v24);

        objc_destroyWeak(&v28);
        objc_destroyWeak((id *)buf);
      }
      else if ((objc_msgSend(a1[5], "isMemberOfClass:", objc_opt_class()) & 1) == 0)
      {
        objc_msgSend(a1[6], "pushViewController:animated:", v5, 1);
        _TSLogDomain();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(a1[5], "topViewController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v30 = v5;
          v31 = 2112;
          v32 = v19;
          v33 = 2080;
          v34 = "-[TSSIMSetupFlow navigateToNextPaneFrom:navigationController:]_block_invoke";
          _os_log_impl(&dword_21B647000, v18, OS_LOG_TYPE_DEFAULT, "push %@ onto %@ @%s", buf, 0x20u);

        }
        v21 = a1[5];
        v20 = a1 + 5;
        objc_msgSend(v21, "setTopViewController:", v5);
        objc_msgSend(*v20, "setDismissingViewController:", 0);
        objc_msgSend(*v20, "setNextViewController:", 0);
      }
    }
    else
    {
      objc_msgSend(a1[5], "_notifyFlowCompletion:", 2);
    }
  }

}

void __62__TSSIMSetupFlow_navigateToNextPaneFrom_navigationController___block_invoke_141(uint64_t a1, int a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "nextViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    v12 = objc_loadWeakRetained(v4);
    objc_msgSend(v12, "receivedResponseWithVC:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 48), "topViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUserInteractionEnabled:", 1);

    if (a2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = *(void **)(a1 + 48);
        v16 = *(id *)(a1 + 32);
        objc_msgSend(v15, "visibleViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "takeScreenShot:", v17);

        objc_msgSend(*(id *)(a1 + 48), "pushViewController:animated:", v16, 0);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);
      }
      _TSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(void **)(a1 + 32);
        v20 = objc_loadWeakRetained(v4);
        objc_msgSend(v20, "topViewController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v28 = v19;
        v29 = 2112;
        v30 = v21;
        v31 = 2080;
        v32 = "-[TSSIMSetupFlow navigateToNextPaneFrom:navigationController:]_block_invoke";
        _os_log_impl(&dword_21B647000, v18, OS_LOG_TYPE_DEFAULT, "push %@ onto %@ @%s", buf, 0x20u);

      }
      v22 = *(_QWORD *)(a1 + 32);
      v23 = objc_loadWeakRetained(v4);
      objc_msgSend(v23, "setTopViewController:", v22);

      v24 = objc_loadWeakRetained(v4);
      objc_msgSend(v24, "setDismissingViewController:", 0);

      v25 = objc_loadWeakRetained(v4);
      objc_msgSend(v25, "setNextViewController:", 0);

    }
    else
    {
      v26 = objc_loadWeakRetained(v4);
      objc_msgSend(v26, "navigateToNextPaneFrom:navigationController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

    }
  }
  else
  {
    _TSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_loadWeakRetained(v4);
      objc_msgSend(v9, "nextViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v28 = v10;
      v29 = 2112;
      v30 = v11;
      v31 = 2080;
      v32 = "-[TSSIMSetupFlow navigateToNextPaneFrom:navigationController:]_block_invoke";
      _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "next vc mismatch. expect:%@, real:%@ @%s", buf, 0x20u);

    }
  }
}

- (void)_maybeClearSubFlow
{
  void *v3;
  char isKindOfClass;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[TSSIMSetupFlow nextViewController](self, "nextViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[TSSIMSetupFlow _maybeClearSubFlow]";
      _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "clear nextVC @%s", (uint8_t *)&v10, 0xCu);
    }

    -[TSSIMSetupFlow nextViewController](self, "nextViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subFlow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(v6, "subFlow");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "performSelector:", sel_cancelFlow);

    }
    objc_msgSend(v6, "setSubFlow:", 0);
    -[TSSIMSetupFlow setNextViewController:](self, "setNextViewController:", 0);

  }
}

- (void)_notifyFlowCompletion:(unint64_t)a3
{
  UIViewController *firstViewControllerInstance;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;

  self->_isFlowFinished = 1;
  firstViewControllerInstance = self->_firstViewControllerInstance;
  self->_firstViewControllerInstance = 0;

  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[TSSIMSetupFlow _notifyFlowCompletion:].cold.2();

  -[TSSIMSetupFlow setDismissingViewController:](self, "setDismissingViewController:", 0);
  -[NSMutableDictionary removeAllObjects](self->_backOptions, "removeAllObjects");
  -[TSSIMSetupFlow delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    _TSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[TSSIMSetupFlow _notifyFlowCompletion:].cold.1();

  }
  -[TSSIMSetupFlow delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  -[TSSIMSetupFlow delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 1) != 0)
    objc_msgSend(v11, "simSetupFlowCompleted:", a3);
  else
    objc_msgSend(v11, "simSetupFlowCompleted");

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentFlow);
  if (!WeakRetained)
  {
    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deassertUserInPurchaseFlowWithForce:caller:", 1, self);

  }
}

- (void)viewControllerDidComplete:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TSSIMSetupFlow navigateToNextPaneFrom:navigationController:](self, "navigateToNextPaneFrom:navigationController:", v4, v5);

}

- (void)userDidTapCancel
{
  TSSetupFlowItem **p_topViewController;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  p_topViewController = &self->_topViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_topViewController);
  objc_msgSend(WeakRetained, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)p_topViewController);
    objc_msgSend(v6, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __34__TSSIMSetupFlow_userDidTapCancel__block_invoke;
    v8[3] = &unk_24DEF29A8;
    v8[4] = self;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);

  }
  else
  {
    -[TSSIMSetupFlow _maybeClearSubFlow](self, "_maybeClearSubFlow");
    -[TSSIMSetupFlow _notifyFlowCompletion:](self, "_notifyFlowCompletion:", 1);
  }
}

uint64_t __34__TSSIMSetupFlow_userDidTapCancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userDidTapCancel");
}

- (void)waitForResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  ViewControllerBackOption *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0 || !objc_msgSend(v15, "performSelector:", sel_customizeSpinner))
  {
    +[TSNavigationBarSpinnerManager sharedManager](TSNavigationBarSpinnerManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startSpinnerInNavigationItem:withIdentifier:", v5, CFSTR("waiting"));

  }
  objc_msgSend(v15, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  v7 = objc_alloc_init(ViewControllerBackOption);
  objc_msgSend(v15, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hidesBackButton");

  if (v9)
  {
    -[ViewControllerBackOption setHidesBackButton:](v7, "setHidesBackButton:", 1);
    objc_msgSend(v15, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leftBarButtonItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ViewControllerBackOption setLeftBarButtonItems:](v7, "setLeftBarButtonItems:", v11);

    objc_msgSend(v15, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLeftBarButtonItem:animated:", 0, 0);
  }
  else
  {
    -[ViewControllerBackOption setHidesBackButton:](v7, "setHidesBackButton:", 0);
    objc_msgSend(v15, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidesBackButton:", 1);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_backOptions, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backOptions, "setObject:forKeyedSubscript:", v7, v13);

}

- (void)receivedResponse
{
  id v2;

  +[TSNavigationBarSpinnerManager sharedManager](TSNavigationBarSpinnerManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopSpinnerForIdentifier:", CFSTR("waiting"));

}

- (void)receivedResponseWithVC:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_backOptions, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_backOptions, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if ((objc_msgSend(v6, "hidesBackButton") & 1) == 0)
      {
        objc_msgSend(v13, "navigationItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setHidesBackButton:", 0);
        goto LABEL_7;
      }
      objc_msgSend(v7, "leftBarButtonItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v13, "navigationItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "leftBarButtonItems");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setLeftBarButtonItems:animated:", v10, 0);

LABEL_7:
      }
    }
    -[NSMutableDictionary removeObjectForKey:](self->_backOptions, "removeObjectForKey:", v4);

  }
  objc_msgSend(v13, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserInteractionEnabled:", 1);

  +[TSNavigationBarSpinnerManager sharedManager](TSNavigationBarSpinnerManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stopSpinnerForIdentifier:", CFSTR("waiting"));

}

- (void)attemptFailed
{
  -[TSSIMSetupFlow _maybeClearSubFlow](self, "_maybeClearSubFlow");
  -[TSSIMSetupFlow _notifyFlowCompletion:](self, "_notifyFlowCompletion:", 3);
}

- (void)cancelNextPane
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[TSSIMSetupFlow cancelNextPane]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "cancel next pane @%s", (uint8_t *)&v7, 0xCu);
  }

  -[TSSIMSetupFlow setDismissingViewController:](self, "setDismissingViewController:", 0);
  -[TSSIMSetupFlow nextViewController](self, "nextViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[TSSIMSetupFlow _maybeClearSubFlow](self, "_maybeClearSubFlow");
  -[TSSIMSetupFlow setNextViewController:](self, "setNextViewController:", 0);
  -[TSSIMSetupFlow topViewController](self, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 1);

}

- (void)maybeRegisterDismissHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TSSIMSetupFlow *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  TSSIMSetupFlow *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentFlow);

    if (!WeakRetained)
    {
      objc_msgSend(v4, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        _TSLogDomain();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[TSSIMSetupFlow maybeRegisterDismissHandler:].cold.1(v13, v17, v18, v19, v20, v21, v22, v23);
        goto LABEL_14;
      }
      objc_msgSend(v4, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        _TSLogDomain();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "navigationController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "presentationController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138412802;
          v28 = v26;
          v29 = 2112;
          v30 = self;
          v31 = 2080;
          v32 = "-[TSSIMSetupFlow maybeRegisterDismissHandler:]";
          _os_log_impl(&dword_21B647000, v24, OS_LOG_TYPE_DEFAULT, "register UIAdaptivePresentationControllerDelegate for %@. self = %@ @%s", (uint8_t *)&v27, 0x20u);

        }
        objc_msgSend(v4, "navigationController");
        v13 = objc_claimAutoreleasedReturnValue();
        -[NSObject presentationController](v13, "presentationController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setDelegate:", self);
        goto LABEL_13;
      }
      objc_msgSend(v4, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegate");
      v12 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue();

      if (v12 != self)
      {
        _TSLogDomain();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
LABEL_14:

          goto LABEL_15;
        }
        objc_msgSend(v4, "navigationController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "presentationController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412802;
        v28 = v16;
        v29 = 2112;
        v30 = self;
        v31 = 2080;
        v32 = "-[TSSIMSetupFlow maybeRegisterDismissHandler:]";
        _os_log_impl(&dword_21B647000, v13, OS_LOG_TYPE_DEFAULT, "UIAdaptivePresentationControllerDelegate:%@ is not self:%@ @%s", (uint8_t *)&v27, 0x20u);

LABEL_13:
        goto LABEL_14;
      }
    }
  }
LABEL_15:

}

- (void)appForegrounded
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (-[TSSIMSetupFlow isBootstrapAssertionRequired](self, "isBootstrapAssertionRequired"))
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 136315138;
      v6 = "-[TSSIMSetupFlow appForegrounded]";
      _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_INFO, "[I] app in foreground, assert bootstrap @%s", (uint8_t *)&v5, 0xCu);
    }

    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertUserInPurchaseFlowStartOver:caller:", 0, self);

  }
}

- (void)appBackgrounded
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (-[TSSIMSetupFlow isBootstrapAssertionRequired](self, "isBootstrapAssertionRequired"))
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 136315138;
      v6 = "-[TSSIMSetupFlow appBackgrounded]";
      _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_INFO, "[I] app in background, deassert bootstrap @%s", (uint8_t *)&v5, 0xCu);
    }

    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deassertUserInPurchaseFlowWithForce:caller:", 1, self);

  }
}

- (void)showLoadFailureAlert:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  TSSIMSetupFlow *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__TSSIMSetupFlow_showLoadFailureAlert_error___block_invoke;
  block[3] = &unk_24DEF2D88;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __45__TSSIMSetupFlow_showLoadFailureAlert_error___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v2 = *(void **)(a1 + 32);
  if (v2 && objc_msgSend(v2, "code") == 67)
  {
    v3 = +[TSUtilities isGreenTeaCapable](TSUtilities, "isGreenTeaCapable");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      v6 = CFSTR("NOT_CONNECTED_TO_WLAN");
    else
      v6 = CFSTR("NOT_CONNECTED_TO_WIFI");
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24DEF4290, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = +[TSUtilities isGreenTeaCapable](TSUtilities, "isGreenTeaCapable");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
      v11 = CFSTR("TURN_ON_WLAN_TO_PURCHASE_PLAN");
    else
      v11 = CFSTR("TURN_ON_WIFI_TO_PURCHASE_PLAN");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Connection Failed"), &stru_24DEF4290, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("The connection to the server was lost.  Please try again later.");
  }
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24DEF4290, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v7, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ERROR_OK"), &stru_24DEF4290, CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __45__TSSIMSetupFlow_showLoadFailureAlert_error___block_invoke_2;
  v19[3] = &unk_24DEF2F40;
  v19[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v18);

  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v14, 1, 0);
}

uint64_t __45__TSSIMSetupFlow_showLoadFailureAlert_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyFlowCompletion:", 3);
}

- (id)getRootFlow
{
  TSSIMSetupFlow *v2;
  void *v3;
  TSSIMSetupFlow *v4;
  void *v5;
  NSObject *v6;

  v2 = self;
  -[TSSIMSetupFlow parentFlow](v2, "parentFlow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      -[TSSIMSetupFlow parentFlow](v2, "parentFlow");
      v4 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue();

      -[TSSIMSetupFlow parentFlow](v4, "parentFlow");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[TSSIMSetupFlow getRootFlow].cold.1();

  return v4;
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  v3 = a3;
  -[TSSIMSetupFlow getRootFlow](self, "getRootFlow");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_2551BF050);

  if (v5)
    objc_msgSend(v7, "delegate");
  else
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdleTimerDisabled:", v3);

}

- (TSSIMSetupDelegate)delegate
{
  return (TSSIMSetupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TSSIMSetupFlow)parentFlow
{
  return (TSSIMSetupFlow *)objc_loadWeakRetained((id *)&self->_parentFlow);
}

- (void)setParentFlow:(id)a3
{
  objc_storeWeak((id *)&self->_parentFlow, a3);
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (UIViewController)dismissingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_dismissingViewController);
}

- (void)setDismissingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_dismissingViewController, a3);
}

- (TSSetupFlowItem)nextViewController
{
  return (TSSetupFlowItem *)objc_loadWeakRetained((id *)&self->_nextViewController);
}

- (void)setNextViewController:(id)a3
{
  objc_storeWeak((id *)&self->_nextViewController, a3);
}

- (UIViewController)firstViewControllerInstance
{
  return (UIViewController *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFirstViewControllerInstance:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)isFlowFinished
{
  return self->_isFlowFinished;
}

- (void)setIsFlowFinished:(BOOL)a3
{
  self->_isFlowFinished = a3;
}

- (NSMutableDictionary)backOptions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBackOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unint64_t)flowType
{
  return self->_flowType;
}

- (void)setFlowType:(unint64_t)a3
{
  self->_flowType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backOptions, 0);
  objc_storeStrong((id *)&self->_firstViewControllerInstance, 0);
  objc_destroyWeak((id *)&self->_nextViewController);
  objc_destroyWeak((id *)&self->_dismissingViewController);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_destroyWeak((id *)&self->_parentFlow);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_topViewController);
}

+ (void)_flowWithOptions:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Missing app name @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_flowWithOptions:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Missing carrier name for follow up @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)restartWith:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v3 = "-[TSSIMSetupFlow restartWith:]";
  OUTLINED_FUNCTION_2_0(&dword_21B647000, v0, v1, "[E]back to non SIMSetupFlow ViewController : %@ @%s", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_popAllSIMSetupFlowViewControllers:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]cannot find viewcontroller from current flow, simply pop current view controller @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_pushStartOverViewController:(os_log_t)log from:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[TSSIMSetupFlow _pushStartOverViewController:from:]";
  _os_log_fault_impl(&dword_21B647000, log, OS_LOG_TYPE_FAULT, "[F]cannot found old root view controller index @%s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)startOverWithFirstViewController:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[14];
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  v5 = "-[TSSIMSetupFlow startOverWithFirstViewController:]";
  OUTLINED_FUNCTION_2_0(&dword_21B647000, a2, v3, "[E]%@ doesnot support start over @%s", v4);
}

void __62__TSSIMSetupFlow_navigateToNextPaneFrom_navigationController___block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2080;
  v7 = "-[TSSIMSetupFlow navigateToNextPaneFrom:navigationController:]_block_invoke";
  OUTLINED_FUNCTION_2_0(&dword_21B647000, a2, a3, "[E]already dismissed %@. IGNORE!! @%s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

- (void)_notifyFlowCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v3 = "-[TSSIMSetupFlow _notifyFlowCompletion:]";
  OUTLINED_FUNCTION_2_0(&dword_21B647000, v0, v1, "[E]invalid delegate for the flow : %@ @%s", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_notifyFlowCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_21B647000, v0, v1, "[Db] flow %@ finished @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)maybeRegisterDismissHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]cannot register dismiss handler in premature state @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)getRootFlow
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_21B647000, v0, v1, "[Db] Root flow : %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end

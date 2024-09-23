@implementation TSCellularPlanActivatingFlow

- (TSCellularPlanActivatingFlow)initWithSkipActivatingPane:(BOOL)a3 timerType:(int64_t)a4 transferBackPlan:(id)a5 setupType:(unint64_t)a6 carrierName:(id)a7 maybeShowConfirmationCodePane:(BOOL)a8
{
  id v15;
  id v16;
  TSCellularPlanActivatingFlow *v17;
  TSCellularPlanActivatingFlow *v18;
  uint64_t v19;
  UIBarButtonItem *cancelButton;
  void *v21;
  id v22;
  uint64_t v23;
  CoreTelephonyClient *client;
  void *v25;
  objc_super v27;

  v15 = a5;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)TSCellularPlanActivatingFlow;
  v17 = -[TSSIMSetupFlow init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_backgroundTask = *MEMORY[0x24BEBE030];
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v17, sel_userDidTapCancel);
    cancelButton = v18->_cancelButton;
    v18->_cancelButton = (UIBarButtonItem *)v19;

    v18->_currentActivatingState = 0;
    v18->_skipActivatingPane = a3;
    v18->_shouldShowCompletePaneOnTimeout = 0;
    v18->_planActiveOnSource = 1;
    v18->_transferState = 0;
    objc_storeStrong(&v18->_transferBackOldItem, a5);
    v18->_termsAndConditionsShown = 0;
    v18->_oneTimePasscodePaneShown = 0;
    v18->_maybeShowConfirmationCodePane = a8;
    v18->_showConfirmationCodePane = 0;
    +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegate:", v18);

    v22 = objc_alloc(MEMORY[0x24BDC2810]);
    v23 = objc_msgSend(v22, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    client = v18->_client;
    v18->_client = (CoreTelephonyClient *)v23;

    -[CoreTelephonyClient setDelegate:](v18->_client, "setDelegate:", v18);
    -[TSCellularPlanActivatingFlow startTimer:](v18, "startTimer:", a4);
    v18->_startTime = CFAbsoluteTimeGetCurrent();
    v18->_planSetupType = a6;
    objc_storeStrong((id *)&v18->_planName, a7);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v18, sel__onTransferError_, CFSTR("transfer.failed"), 0);

  }
  return v18;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[TSCellularPlanActivatingFlow _stopTimerWithBackgroundTaskState:](self, "_stopTimerWithBackgroundTaskState:", 0);
  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetDelegate:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)TSCellularPlanActivatingFlow;
  -[TSCellularPlanActivatingFlow dealloc](&v5, sel_dealloc);
}

- (void)cancelFlow
{
  -[TSCellularPlanActivatingFlow _stopTimerWithBackgroundTaskState:](self, "_stopTimerWithBackgroundTaskState:", 0);
}

- (id)firstViewController
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[TSCellularPlanActivatingFlow firstViewController].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (void)firstViewController:(id)a3
{
  void (**v4)(id, TSCellularSetupActivatingViewController *);
  NSObject *v5;
  void *v6;
  id firstViewControllerCallback;
  TSCellularSetupActivatingViewController *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, TSCellularSetupActivatingViewController *))a3;
  if (v4)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      if (self->_skipActivatingPane)
      {
        _TSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 136315138;
          v14 = "-[TSCellularPlanActivatingFlow firstViewController:]";
          _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "cache firstViewController callback @%s", (uint8_t *)&v13, 0xCu);
        }

        v6 = (void *)MEMORY[0x220765A70](v4);
        firstViewControllerCallback = self->_firstViewControllerCallback;
        self->_firstViewControllerCallback = v6;

        +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
        v8 = (TSCellularSetupActivatingViewController *)objc_claimAutoreleasedReturnValue();
        -[TSCellularSetupActivatingViewController planItems](v8, "planItems");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSCellularPlanActivatingFlow planItemsUpdated:planListError:](self, "planItemsUpdated:planListError:", v9, 0);
      }
      else
      {
        v8 = objc_alloc_init(TSCellularSetupActivatingViewController);
        _TSLogDomain();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138412546;
          v14 = (const char *)v8;
          v15 = 2080;
          v16 = "-[TSCellularPlanActivatingFlow firstViewController:]";
          _os_log_impl(&dword_21B647000, v11, OS_LOG_TYPE_DEFAULT, "first view controller : %@ @%s", (uint8_t *)&v13, 0x16u);
        }

        -[TSCellularSetupActivatingViewController setDelegate:](v8, "setDelegate:", self);
        -[TSCellularPlanActivatingFlow setTopViewController:](self, "setTopViewController:", v8);
        v4[2](v4, v8);
        +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "planItems");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSCellularPlanActivatingFlow planItemsUpdated:planListError:](self, "planItemsUpdated:planListError:", v12, 0);

      }
    }
    else
    {
      _TSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315138;
        v14 = "-[TSCellularPlanActivatingFlow firstViewController:]";
        _os_log_impl(&dword_21B647000, v10, OS_LOG_TYPE_DEFAULT, "SIMSetupSupport/ProvisioningCompletion is disabled @%s", (uint8_t *)&v13, 0xCu);
      }

      v4[2](v4, 0);
    }
  }

}

- (id)nextViewControllerFrom:(id)a3
{
  id v4;
  uint64_t v5;
  TSMidOperationFailureViewController *v6;
  TSCellularPlanUserConsentViewController *v7;
  void *v8;
  NSObject *v9;
  unint64_t currentActivatingState;
  int v12;
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_19;
      objc_msgSend(v4, "confirmationCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _TSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412546;
        v13 = v8;
        v14 = 2080;
        v15 = "-[TSCellularPlanActivatingFlow nextViewControllerFrom:]";
        _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "confirmationCode:%@ @%s", (uint8_t *)&v12, 0x16u);
      }

      v7 = -[TSCellularPlanUserConsentViewController initWithConfirmationCode:consentType:requireAdditionalConsent:confirmationCode:acceptButtonTapped:]([TSCellularPlanUserConsentViewController alloc], "initWithConfirmationCode:consentType:requireAdditionalConsent:confirmationCode:acceptButtonTapped:", self->_planName, 4, 0, v8, 1);
      if (!v7)
        goto LABEL_19;
      goto LABEL_20;
    }
  }
  -[TSCellularPlanActivatingFlow _stopTimerWithBackgroundTaskState:](self, "_stopTimerWithBackgroundTaskState:", 0);
  v5 = 168;
  if (self->_transferError)
    goto LABEL_4;
  if (self->_showConfirmationCodePane)
  {
    v7 = -[TSCellularPlanConfirmationCodeViewController initAsMidOperationWithCarrierName:]([TSCellularPlanConfirmationCodeViewController alloc], "initAsMidOperationWithCarrierName:", self->_planName);
    self->_showConfirmationCodePane = 0;
    if (!v7)
      goto LABEL_19;
    goto LABEL_20;
  }
  v5 = 160;
  if (self->_planInstallError)
  {
LABEL_4:
    v6 = -[TSMidOperationFailureViewController initWithPlanItemError:updatePlanItem:withBackButton:forCarrier:withCarrierErrorCode:]([TSMidOperationFailureViewController alloc], "initWithPlanItemError:updatePlanItem:withBackButton:forCarrier:withCarrierErrorCode:", *(Class *)((char *)&self->super.super.isa + v5), self->_updatePlanItem, +[TSUtilities inBuddy](TSUtilities, "inBuddy"), self->_carrierName, self->_carrierErrorCode);
  }
  else
  {
    currentActivatingState = self->_currentActivatingState;
    if (currentActivatingState == 2)
    {
      v6 = -[TSCellularSetupTimeoutFailureViewController initWithTimeoutReason:]([TSCellularSetupTimeoutFailureViewController alloc], "initWithTimeoutReason:", self->_timeoutReason);
    }
    else
    {
      if (currentActivatingState != 1)
      {
LABEL_19:
        -[TSCellularPlanActivatingFlow _stopBackgroundTask](self, "_stopBackgroundTask");
        v7 = 0;
        goto LABEL_20;
      }
      v6 = -[TSCellularSetupCompleteViewController initWithPhoneNumber:planName:planActiveOnSource:]([TSCellularSetupCompleteViewController alloc], "initWithPhoneNumber:planName:planActiveOnSource:", self->_phoneNumber, self->_planName, self->_planActiveOnSource);
    }
  }
  v7 = (TSCellularPlanUserConsentViewController *)v6;
  if (!v6)
    goto LABEL_19;
LABEL_20:

  return v7;
}

- (void)setTopViewController:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[TSCellularPlanActivatingFlow _submitCellularPlanSetupDetails](self, "_submitCellularPlanSetupDetails");
  }
  v5.receiver = self;
  v5.super_class = (Class)TSCellularPlanActivatingFlow;
  -[TSSIMSetupFlow setTopViewController:](&v5, sel_setTopViewController_, v4);

}

- (void)planItemsUpdated:(id)a3 planListError:(id)a4
{
  char *v6;
  char *v7;
  NSError **p_planInstallError;
  NSObject *v9;
  NSError *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSString *v21;
  NSString *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSString *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  NSString *v41;
  void *v42;
  _BOOL4 v43;
  NSObject *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  NSString *v48;
  void *v49;
  BOOL v50;
  NSString *v51;
  char *v52;
  NSString *v53;
  NSString *planName;
  void *v55;
  BOOL v56;
  NSString *v57;
  NSString *installingPlanIdentifier;
  NSObject *v59;
  NSString *v60;
  char *v61;
  NSString *v62;
  void *v63;
  void *v64;
  NSString *v65;
  NSString *phoneNumber;
  NSString *v67;
  NSString *v68;
  NSObject *v69;
  NSString *v70;
  NSNumber *waitForPhoneNumber;
  void *v72;
  char *v73;
  NSObject *v74;
  void *v75;
  NSString *v76;
  NSString *subscriptionContextUUID;
  NSObject *v78;
  NSObject *v79;
  __int128 v80;
  id obj;
  id v82;
  _QWORD v83[5];
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint8_t v93[4];
  uint64_t v94;
  const __CFString *v95;
  const __CFString *v96;
  uint8_t v97[4];
  uint64_t v98;
  const __CFString *v99;
  const __CFString *v100;
  uint8_t buf[4];
  const char *v102;
  __int16 v103;
  const char *v104;
  __int16 v105;
  const char *v106;
  __int16 v107;
  const char *v108;
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v82 = a3;
  v6 = (char *)a4;
  v7 = v6;
  p_planInstallError = &self->_planInstallError;
  if (self->_planInstallError)
  {
    _TSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *p_planInstallError;
      *(_DWORD *)buf = 138412802;
      v102 = (const char *)v10;
      v103 = 2112;
      v104 = v7;
      v105 = 2080;
      v106 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
      _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "received error already : %@, new error: %@ @%s", buf, 0x20u);
    }
LABEL_4:

    goto LABEL_5;
  }
  if (!v6)
  {
    if (!v82)
    {
      _TSLogDomain();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[TSCellularPlanActivatingFlow planItemsUpdated:planListError:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);

      goto LABEL_5;
    }
    if (self->_currentActivatingState == 1)
    {
      _TSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v102 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
        _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "Already activated - early return @%s", buf, 0xCu);
      }
      goto LABEL_4;
    }
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    obj = v82;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v109, 16);
    if (!v32)
      goto LABEL_71;
    v34 = *(_QWORD *)v86;
    *(_QWORD *)&v33 = 138412802;
    v80 = v33;
LABEL_40:
    v35 = 0;
    while (1)
    {
      if (*(_QWORD *)v86 != v34)
        objc_enumerationMutation(obj);
      v36 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v35);
      if (objc_msgSend(v36, "isInstalling", v80))
      {
        if (!-[NSString length](self->_planName, "length"))
        {
          objc_msgSend(v36, "carrierName");
          v53 = (NSString *)objc_claimAutoreleasedReturnValue();
          planName = self->_planName;
          self->_planName = v53;

        }
        objc_msgSend(v36, "iccid");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "length") == 0;

        if (!v56)
        {
          objc_msgSend(v36, "iccid");
          v57 = (NSString *)objc_claimAutoreleasedReturnValue();
          installingPlanIdentifier = self->_installingPlanIdentifier;
          self->_installingPlanIdentifier = v57;

        }
        objc_storeStrong((id *)&self->_updatePlanItem, v36);
        _TSLogDomain();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          v60 = self->_installingPlanIdentifier;
          -[CTCellularPlanItem phoneNumber](self->_updatePlanItem, "phoneNumber");
          v61 = (char *)objc_claimAutoreleasedReturnValue();
          v62 = self->_planName;
          *(_DWORD *)buf = 138413058;
          v102 = (const char *)v60;
          v103 = 2112;
          v104 = v61;
          v105 = 2112;
          v106 = (const char *)v62;
          v107 = 2080;
          v108 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
          _os_log_impl(&dword_21B647000, v59, OS_LOG_TYPE_DEFAULT, "installing -> plan iccid:%@, phone number:%@, carrier name:%@ @%s", buf, 0x2Au);

        }
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = CFSTR("InstallStateKey");
        v100 = CFSTR("Install");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "postNotificationName:object:userInfo:", CFSTR("esim.install.state.changed"), 0, v64);

        goto LABEL_71;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = self->_installingPlanIdentifier;
        objc_msgSend(v36, "iccid");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v37) = -[NSString isEqualToString:](v37, "isEqualToString:", v38);

        if ((_DWORD)v37)
          -[TSCellularPlanActivatingFlow _maybeDeleteTransferBackItem:](self, "_maybeDeleteTransferBackItem:", obj);
      }
      objc_msgSend(v36, "plan");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "status") == 14;

      if (v40)
      {
        v41 = self->_installingPlanIdentifier;
        if (!v41)
        {
          _TSLogDomain();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            -[TSCellularPlanActivatingFlow planItemsUpdated:planListError:].cold.2(v97, &v98, v44);
          goto LABEL_60;
        }
        objc_msgSend(v36, "iccid");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[NSString isEqualToString:](v41, "isEqualToString:", v42);

        if (v43)
        {
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v44 = objc_claimAutoreleasedReturnValue();
          v95 = CFSTR("InstallStateKey");
          v96 = CFSTR("PostInstall");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject postNotificationName:object:userInfo:](v44, "postNotificationName:object:userInfo:", CFSTR("esim.install.state.changed"), 0, v45);

LABEL_60:
        }
      }
      else
      {
        objc_msgSend(v36, "plan");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "status") == 0;

        if (v47)
        {
          v48 = self->_installingPlanIdentifier;
          if (v48)
          {
            objc_msgSend(v36, "iccid");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = -[NSString isEqualToString:](v48, "isEqualToString:", v49);

            if (v50)
            {
              if (!+[TSUtilities isPad](TSUtilities, "isPad"))
              {
                objc_msgSend(v36, "phoneNumber");
                v65 = (NSString *)objc_claimAutoreleasedReturnValue();
                phoneNumber = self->_phoneNumber;
                self->_phoneNumber = v65;

              }
              if (!-[NSString length](self->_planName, "length"))
              {
                objc_msgSend(v36, "carrierName");
                v67 = (NSString *)objc_claimAutoreleasedReturnValue();
                v68 = self->_planName;
                self->_planName = v67;

                _TSLogDomain();
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                {
                  v70 = self->_planName;
                  *(_DWORD *)buf = 138412546;
                  v102 = (const char *)v70;
                  v103 = 2080;
                  v104 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
                  _os_log_impl(&dword_21B647000, v69, OS_LOG_TYPE_DEFAULT, "%@ plan installed. @%s", buf, 0x16u);
                }

              }
              self->_shouldShowCompletePaneOnTimeout = 1;
              if ((objc_msgSend(v36, "isSelected") & 1) != 0)
              {
                waitForPhoneNumber = self->_waitForPhoneNumber;
                if (waitForPhoneNumber && -[NSNumber BOOLValue](waitForPhoneNumber, "BOOLValue"))
                {
                  if (-[NSString length](self->_phoneNumber, "length"))
                  {
                    self->_currentActivatingState = 1;
                    -[TSCellularPlanActivatingFlow _maybeMoveToNextViewController](self, "_maybeMoveToNextViewController");
                  }
                }
                else
                {
                  if (self->_subscriptionContextUUID)
                    goto LABEL_99;
                  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "getSubscriptionContextUUIDforPlan:", v36);
                  v76 = (NSString *)objc_claimAutoreleasedReturnValue();
                  subscriptionContextUUID = self->_subscriptionContextUUID;
                  self->_subscriptionContextUUID = v76;

                  if (self->_subscriptionContextUUID)
                  {
LABEL_99:
                    if (!self->_waitForPhoneNumber)
                    {
                      objc_initWeak((id *)buf, self);
                      v83[0] = MEMORY[0x24BDAC760];
                      v83[1] = 3221225472;
                      v83[2] = __63__TSCellularPlanActivatingFlow_planItemsUpdated_planListError___block_invoke;
                      v83[3] = &unk_24DEF2930;
                      objc_copyWeak(&v84, (id *)buf);
                      v83[4] = self;
                      -[TSCellularPlanActivatingFlow _shouldWaitUntilPhoneNumberBeReady:](self, "_shouldWaitUntilPhoneNumberBeReady:", v83);
                      objc_destroyWeak(&v84);
                      objc_destroyWeak((id *)buf);
                    }
                  }
                  else
                  {
                    _TSLogDomain();
                    v79 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      v102 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
                      _os_log_impl(&dword_21B647000, v79, OS_LOG_TYPE_DEFAULT, "Subscription context UUID is not ready @%s", buf, 0xCu);
                    }

                  }
                }
              }
              else if (self->_transferBackOldItem)
              {
                objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "didSelectPlanItem:isEnable:", v36, 1);
                v73 = (char *)objc_claimAutoreleasedReturnValue();

                _TSLogDomain();
                v74 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v102 = v73;
                  v103 = 2080;
                  v104 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
                  _os_log_impl(&dword_21B647000, v74, OS_LOG_TYPE_DEFAULT, "transfer back, enable the item. error:%@ @%s", buf, 0x16u);
                }

              }
              else
              {
                _TSLogDomain();
                v78 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v102 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
                  _os_log_impl(&dword_21B647000, v78, OS_LOG_TYPE_DEFAULT, "SIM is not enabled - early return @%s", buf, 0xCu);
                }

                self->_currentActivatingState = 1;
                self->_planActiveOnSource = 0;
                -[TSCellularPlanActivatingFlow _maybeMoveToNextViewController](self, "_maybeMoveToNextViewController");
              }
              goto LABEL_71;
            }
            _TSLogDomain();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              v51 = self->_installingPlanIdentifier;
              objc_msgSend(v36, "iccid");
              v52 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v80;
              v102 = (const char *)v51;
              v103 = 2112;
              v104 = v52;
              v105 = 2080;
              v106 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
              _os_log_debug_impl(&dword_21B647000, v44, OS_LOG_TYPE_DEBUG, "[Db] active plan is not the provisioning plan. expect:%@, actual:%@ @%s", buf, 0x20u);

            }
          }
          else
          {
            _TSLogDomain();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              -[TSCellularPlanActivatingFlow planItemsUpdated:planListError:].cold.2(v93, &v94, v44);
          }
          goto LABEL_60;
        }
      }
      if (v32 == ++v35)
      {
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v109, 16);
        if (v32)
          goto LABEL_40;
LABEL_71:

        goto LABEL_5;
      }
    }
  }
  objc_msgSend(v6, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BE158B0];
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE158B0]))
  {
    v13 = objc_msgSend(v7, "code");

    if (v13 == 47)
      goto LABEL_5;
  }
  else
  {

  }
  if (self->_maybeShowConfirmationCodePane)
  {
    objc_msgSend(v7, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToString:", v12) & 1) != 0)
    {
      v15 = objc_msgSend(v7, "code");

      if (v15 == 19)
      {
        if (objc_msgSend(v82, "count"))
        {
          v91 = 0u;
          v92 = 0u;
          v89 = 0u;
          v90 = 0u;
          v16 = v82;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v89, v110, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v90;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v90 != v18)
                  objc_enumerationMutation(v16);
                v20 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
                if (objc_msgSend(v20, "isInstalling") && !-[NSString length](self->_planName, "length"))
                {
                  objc_msgSend(v20, "carrierName");
                  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v22 = self->_planName;
                  self->_planName = v21;

                }
              }
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v89, v110, 16);
            }
            while (v17);
          }

          self->_showConfirmationCodePane = 1;
          -[TSCellularPlanActivatingFlow _maybeMoveToNextViewController](self, "_maybeMoveToNextViewController");
        }
        goto LABEL_5;
      }
    }
    else
    {

    }
  }
  objc_storeStrong((id *)&self->_planInstallError, a4);
  _TSLogDomain();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    -[TSCellularPlanActivatingFlow planItemsUpdated:planListError:].cold.4((uint64_t)v7, v23);

  -[TSCellularPlanActivatingFlow _maybeMoveToNextViewController](self, "_maybeMoveToNextViewController");
LABEL_5:

}

void __63__TSCellularPlanActivatingFlow_planItemsUpdated_planListError___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[13] != 1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)*((_QWORD *)v5 + 28);
      *((_QWORD *)v5 + 28) = v14;

      if ((a2 & 1) != 0)
      {
        if (!objc_msgSend(*((id *)v5 + 19), "length"))
          goto LABEL_17;
        _TSLogDomain();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 136315138;
          v21 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]_block_invoke";
          _os_log_impl(&dword_21B647000, v16, OS_LOG_TYPE_DEFAULT, "Phone number is already available @%s", (uint8_t *)&v20, 0xCu);
        }

        *((_QWORD *)v5 + 13) = 1;
        v17 = *(void **)(a1 + 32);
      }
      else
      {
        _TSLogDomain();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 136315138;
          v21 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]_block_invoke";
          _os_log_impl(&dword_21B647000, v18, OS_LOG_TYPE_DEFAULT, "Skip waiting for phone number to be ready @%s", (uint8_t *)&v20, 0xCu);
        }

        v19 = (void *)*((_QWORD *)v5 + 19);
        *((_QWORD *)v5 + 19) = &stru_24DEF4290;

        *((_QWORD *)v5 + 13) = 1;
        v17 = v5;
      }
      objc_msgSend(v17, "_maybeMoveToNextViewController");
      goto LABEL_17;
    }
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315138;
      v21 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]_block_invoke";
      _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "Already activated and return @%s", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __63__TSCellularPlanActivatingFlow_planItemsUpdated_planListError___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

LABEL_17:
}

- (void)transferEventUpdate:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  NSError *planInstallError;
  uint64_t transferState;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSError *v12;
  NSError *failureWebsheetError;
  NSObject *v14;
  NSError *v15;
  int64_t v16;
  int64_t v17;
  NSError *transferError;
  NSString *v19;
  NSString *sourceIccid;
  id WeakRetained;
  NSObject *v22;
  TSCellularPlanActivatingFlow *v23;
  uint64_t v24;
  void *v25;
  int v26;
  NSError *v27;
  NSError *v28;
  NSObject *v29;
  NSError *v30;
  NSString *v31;
  NSString *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  int v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v38 = 138412546;
    v39 = v4;
    v40 = 2080;
    v41 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "transfer event : %@ @%s", (uint8_t *)&v38, 0x16u);
  }

  if (self->_failureWebsheetError)
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v38 = 136315138;
      v39 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
      _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "already launch failure url, ignore @%s", (uint8_t *)&v38, 0xCu);
    }
    goto LABEL_43;
  }
  planInstallError = self->_planInstallError;
  self->_planInstallError = 0;

  self->_transferState = 0;
  objc_msgSend(v4, "objectForKey:", CFSTR("TransferState"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    transferState = -[NSObject integerValue](v6, "integerValue");
    self->_transferState = transferState;
  }
  else
  {
    transferState = self->_transferState;
  }
  _TSLogDomain();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (transferState == 3)
  {
    if (v10)
    {
      v38 = 136315138;
      v39 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
      _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "transfer state launch websheet @%s", (uint8_t *)&v38, 0xCu);
    }

    objc_msgSend(v4, "objectForKey:", CFSTR("TransferErrorCode"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
      {
        objc_msgSend(MEMORY[0x24BE158F0], "errorForCode:", (int)-[NSObject intValue](v11, "intValue"));
        v12 = (NSError *)objc_claimAutoreleasedReturnValue();
        failureWebsheetError = self->_failureWebsheetError;
        self->_failureWebsheetError = v12;

        _TSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = self->_failureWebsheetError;
          v38 = 138412546;
          v39 = (const char *)v15;
          v40 = 2080;
          v41 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
          _os_log_impl(&dword_21B647000, v14, OS_LOG_TYPE_DEFAULT, "transfer abort, require to launch websheet : %@ @%s", (uint8_t *)&v38, 0x16u);
        }
LABEL_41:

      }
    }
    goto LABEL_42;
  }
  if (v10)
  {
    v16 = self->_transferState;
    v38 = 134218242;
    v39 = (const char *)v16;
    v40 = 2080;
    v41 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
    _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "transfer state : %ld @%s", (uint8_t *)&v38, 0x16u);
  }

  v17 = self->_transferState;
  switch(v17)
  {
    case 4:
      if (self->_transferError)
      {
        _TSLogDomain();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          transferError = self->_transferError;
          v38 = 138412546;
          v39 = (const char *)transferError;
          v40 = 2080;
          v41 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
          _os_log_impl(&dword_21B647000, v11, OS_LOG_TYPE_DEFAULT, "Already received transfer error: [%@]. Ignoring this event @%s", (uint8_t *)&v38, 0x16u);
        }
LABEL_42:

        goto LABEL_43;
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("TransferErrorCode"));
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BE158F0], "errorForCode:", (int)-[NSObject intValue](v11, "intValue"));
          v27 = (NSError *)objc_claimAutoreleasedReturnValue();
          v28 = self->_transferError;
          self->_transferError = v27;

          _TSLogDomain();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = self->_transferError;
            v38 = 138412546;
            v39 = (const char *)v30;
            v40 = 2080;
            v41 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
            _os_log_impl(&dword_21B647000, v29, OS_LOG_TYPE_DEFAULT, "Received transfer error: %@ @%s", (uint8_t *)&v38, 0x16u);
          }

          if (-[TSCellularPlanActivatingFlow shouldOfferFallbackOptionOnError:](self, "shouldOfferFallbackOptionOnError:", self->_transferError))
          {
            -[TSCellularPlanActivatingFlow offerFallbackOption](self, "offerFallbackOption");
            goto LABEL_42;
          }
        }
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("CarrierName"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong((id *)&self->_carrierName, v35);
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("CarrierErrorCode"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v36, "length"))
            objc_storeStrong((id *)&self->_carrierErrorCode, v36);
        }
      }

      v17 = self->_transferState;
LABEL_52:
      if ((unint64_t)(v17 - 1) <= 1)
      {
        -[TSCellularPlanActivatingFlow startTimer:](self, "startTimer:", 1);
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v37 = objc_claimAutoreleasedReturnValue();
        -[NSObject postNotificationName:object:userInfo:](v37, "postNotificationName:object:userInfo:", CFSTR("transfer.consent.on.source"), 0, 0);
        goto LABEL_54;
      }
      if (-[NSError code](self->_transferError, "code") == 45)
      {
        if (!self->_termsAndConditionsShown && !self->_oneTimePasscodePaneShown)
        {
          -[TSCellularPlanActivatingFlow userDidTapCancel](self, "userDidTapCancel");
          goto LABEL_43;
        }
        _TSLogDomain();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = 136315138;
          v39 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
          _os_log_impl(&dword_21B647000, v37, OS_LOG_TYPE_DEFAULT, "cancel event already handled @%s", (uint8_t *)&v38, 0xCu);
        }
LABEL_54:

        goto LABEL_43;
      }
      if (self->_transferError && self->_firstViewControllerCallback)
        -[TSCellularPlanActivatingFlow _maybeMoveToNextViewController](self, "_maybeMoveToNextViewController");
LABEL_43:

      return;
    case 5:
      objc_msgSend(v4, "objectForKey:", CFSTR("Iccid"));
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      sourceIccid = self->_sourceIccid;
      self->_sourceIccid = v19;

      objc_msgSend(v4, "objectForKey:", CFSTR("TCMainTextKey"));
      v11 = objc_claimAutoreleasedReturnValue();
      -[TSCellularPlanActivatingFlow _displayTermsAndConditionsViewController:](self, "_displayTermsAndConditionsViewController:", v11);
      goto LABEL_42;
    case 6:
      WeakRetained = objc_loadWeakRetained((id *)&self->_oneTimeCodeViewController);

      if (!WeakRetained)
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("Iccid"));
        v31 = (NSString *)objc_claimAutoreleasedReturnValue();
        v32 = self->_sourceIccid;
        self->_sourceIccid = v31;

        objc_msgSend(v4, "objectForKey:", CFSTR("CarrierName"));
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", CFSTR("PhoneNumberKey"));
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", CFSTR("UsePinKey"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "BOOLValue");

        -[TSCellularPlanActivatingFlow _displayOneTimeCodeViewController:carrierName:usePin:](self, "_displayOneTimeCodeViewController:carrierName:usePin:", v14, v11, v34);
        goto LABEL_41;
      }
      _TSLogDomain();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v38 = 136315138;
        v39 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
        _os_log_impl(&dword_21B647000, v22, OS_LOG_TYPE_DEFAULT, "OneTimeViewController active. Updating OTP state. @%s", (uint8_t *)&v38, 0xCu);
      }

      v23 = self;
      v24 = 0;
LABEL_33:
      -[TSCellularPlanActivatingFlow _handleOtpStatusUpdate:](v23, "_handleOtpStatusUpdate:", v24);
      goto LABEL_43;
    case 7:
      objc_msgSend(v4, "objectForKey:", CFSTR("OtpStateKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "BOOLValue");

      if (v26)
        v24 = 2;
      else
        v24 = 1;
      v23 = self;
      goto LABEL_33;
    default:
      goto LABEL_52;
  }
}

- (BOOL)_startedByFollowup
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDBD298]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(CFSTR("SIMSetupUIService"), "isEqualToString:", v4);
  return (char)v2;
}

- (BOOL)_isAppInBackground
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "applicationState") != 0;

  return v3;
}

- (void)launchWebsheet:(id)a3 completion:(id)a4
{
  char *v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  char *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSDictionary *v19;
  NSDictionary *websheetOptions;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[5];
  void (**v32)(id, _QWORD);
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a3;
  v7 = (void (**)(id, _QWORD))a4;
  _TSLogDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v35 = v6;
    v36 = 2080;
    v37 = "-[TSCellularPlanActivatingFlow launchWebsheet:completion:]";
    _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "handle CoreTelephonyClient launchwebsheet request:%@ @%s", buf, 0x16u);
  }

  v9 = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
  _TSLogDomain();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[TSCellularPlanActivatingFlow launchWebsheet:completion:]";
      _os_log_impl(&dword_21B647000, v10, OS_LOG_TYPE_DEFAULT, "Not launching websheet in buddy @%s", buf, 0xCu);
    }

    v7[2](v7, 0);
    goto LABEL_24;
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "infoDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDBD298]);
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "applicationState");
    *(_DWORD *)buf = 138412802;
    v35 = v14;
    v36 = 2048;
    v37 = (const char *)v16;
    v38 = 2080;
    v39 = "-[TSCellularPlanActivatingFlow launchWebsheet:completion:]";
    _os_log_impl(&dword_21B647000, v10, OS_LOG_TYPE_DEFAULT, "App name is %@ status is %ld @%s", buf, 0x20u);

  }
  if (-[TSCellularPlanActivatingFlow _startedByFollowup](self, "_startedByFollowup"))
  {
    if (+[TSUtilities isDeviceLocked](TSUtilities, "isDeviceLocked"))
    {
      _TSLogDomain();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[TSCellularPlanActivatingFlow launchWebsheet:completion:]";
        _os_log_impl(&dword_21B647000, v17, OS_LOG_TYPE_DEFAULT, "screen is locked, skip in-line launch websheet @%s", buf, 0xCu);
      }
LABEL_13:

      v7[2](v7, 0);
      goto LABEL_24;
    }
  }
  else if (-[TSCellularPlanActivatingFlow _isAppInBackground](self, "_isAppInBackground"))
  {
    _TSLogDomain();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[TSCellularPlanActivatingFlow launchWebsheet:completion:]";
      _os_log_impl(&dword_21B647000, v17, OS_LOG_TYPE_DEFAULT, "app is not in forground. skip in-line launch websheet @%s", buf, 0xCu);
    }
    goto LABEL_13;
  }
  v18 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SkipIntroPaneForWebsheetFlow"));
  v19 = (NSDictionary *)objc_msgSend(v18, "copy");
  websheetOptions = self->_websheetOptions;
  self->_websheetOptions = v19;

  -[TSSIMSetupFlow navigationController](self, "navigationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 == 0;

  if (v22)
  {
    _TSLogDomain();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[TSCellularPlanActivatingFlow launchWebsheet:completion:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

    v7[2](v7, 0);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __58__TSCellularPlanActivatingFlow_launchWebsheet_completion___block_invoke;
    v31[3] = &unk_24DEF2980;
    objc_copyWeak(&v33, (id *)buf);
    v31[4] = self;
    v32 = v7;
    -[TSCellularPlanActivatingFlow _maybeDismissAlert:](self, "_maybeDismissAlert:", v31);

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }

LABEL_24:
}

void __58__TSCellularPlanActivatingFlow_launchWebsheet_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "websheetOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSSIMSetupFlow flowWithOptions:](TSSIMSetupFlow, "flowWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "setWebsheetFlow:", v5);

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "websheetFlow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setParentFlow:", v7);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "websheetFlow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", v9);

  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "websheetFlow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __58__TSCellularPlanActivatingFlow_launchWebsheet_completion___block_invoke_2;
  v14[3] = &unk_24DEF2958;
  objc_copyWeak(&v16, v2);
  v13 = *(id *)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v13;
  objc_msgSend(v12, "firstViewController:", v14);

  objc_destroyWeak(&v16);
}

void __58__TSCellularPlanActivatingFlow_launchWebsheet_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(void);
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  int v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _TSLogDomain();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v9, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "topViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412802;
      v27 = v3;
      v28 = 2112;
      v29 = v11;
      v30 = 2080;
      v31 = "-[TSCellularPlanActivatingFlow launchWebsheet:completion:]_block_invoke";
      _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "present : %@ on cur : %@ @%s", (uint8_t *)&v26, 0x20u);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v12, "setWebsheetRootViewController:", v3);
    }
    else
    {
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v3);
      objc_msgSend(v12, "setModalPresentationStyle:", 2);
      v21 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v21, "setWebsheetRootViewController:", v12);

    }
    objc_msgSend(*(id *)(a1 + 32), "_stopTimerWithBackgroundTaskState:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v22, "addObserver:selector:name:object:", v23, sel__onESIMInstallFromWebSheetFlowStart, CFSTR("transfer.websheet.install.started"), 0);

    v24 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v24, "websheetRootViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v25, 1, 0);

    v20 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__TSCellularPlanActivatingFlow_launchWebsheet_completion___block_invoke_2_cold_1(v8, v13, v14, v15, v16, v17, v18, v19);

    v20 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v20();

}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  _BOOL4 eSIMInstallFromWebsheetFlowStarted;
  _QWORD v8[6];
  uint8_t buf[4];
  _BOOL4 v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("transfer.websheet.install.started"), 0);

  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    eSIMInstallFromWebsheetFlowStarted = self->_eSIMInstallFromWebsheetFlowStarted;
    *(_DWORD *)buf = 67109378;
    v10 = eSIMInstallFromWebsheetFlowStarted;
    v11 = 2080;
    v12 = "-[TSCellularPlanActivatingFlow simSetupFlowCompleted:]";
    _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "simSetupFlowCompleted, has received notification? %d @%s", buf, 0x12u);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__TSCellularPlanActivatingFlow_simSetupFlowCompleted___block_invoke;
  v8[3] = &unk_24DEF29D0;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);
}

uint64_t __54__TSCellularPlanActivatingFlow_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "websheetFlow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v9 = v3;
    v10 = 2048;
    v11 = v4;
    v12 = 2080;
    v13 = "-[TSCellularPlanActivatingFlow simSetupFlowCompleted:]_block_invoke";
    _os_log_impl(&dword_21B647000, v2, OS_LOG_TYPE_DEFAULT, "websheet flow %@ completed with type:%ld @%s", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setWebsheetFlow:", 0);
  objc_msgSend(*(id *)(a1 + 32), "websheetRootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__TSCellularPlanActivatingFlow_simSetupFlowCompleted___block_invoke_61;
  v7[3] = &unk_24DEF29A8;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v7);

  return objc_msgSend(*(id *)(a1 + 32), "setWebsheetRootViewController:", 0);
}

void __54__TSCellularPlanActivatingFlow_simSetupFlowCompleted___block_invoke_61(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  v2 = objc_msgSend(*(id *)(a1 + 32), "eSIMInstallFromWebsheetFlowStarted");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "setESIMInstallFromWebsheetFlowStarted:", 0);
    objc_msgSend(*(id *)(a1 + 32), "startTimer:", 1);
    if (objc_msgSend(*(id *)(a1 + 32), "currentActivatingState") == 1)
      objc_msgSend(*(id *)(a1 + 32), "_maybeMoveToNextViewController");
  }
  else
  {
    objc_msgSend(v3, "firstViewControllerCallback");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "firstViewControllerCallback");
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v5[2](v5, 0);

      objc_msgSend(*(id *)(a1 + 32), "setFirstViewControllerCallback:", 0);
    }
  }
}

- (void)startTimer:(int64_t)a3
{
  double v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSTimer *v10;
  NSTimer *activatingTimer;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  double v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = 180.0;
  if (a3)
  {
    if (a3 == 2)
      return;
    if (a3 == 1)
    {
      v5 = 2;
      v4 = 120.0;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }
  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v15 = v4;
    v16 = 2080;
    v17 = "-[TSCellularPlanActivatingFlow startTimer:]";
    _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "start timer: %f @%s", buf, 0x16u);
  }

  self->_timeoutReason = 0;
  -[NSTimer invalidate](self->_activatingTimer, "invalidate");
  v7 = (void *)MEMORY[0x24BDBCF40];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5, CFSTR("timeoutReason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleActivatingExpiry, v9, 0, v4);
  v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  activatingTimer = self->_activatingTimer;
  self->_activatingTimer = v10;

  -[TSCellularPlanActivatingFlow _startBackgroundTask](self, "_startBackgroundTask");
}

- (void)_onESIMInstallFromWebSheetFlowStart
{
  -[TSCellularPlanActivatingFlow setESIMInstallFromWebsheetFlowStarted:](self, "setESIMInstallFromWebsheetFlowStarted:", 1);
}

- (void)_onTransferError:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSError *v14;
  NSError *transferError;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "object");
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = v4;
    v18 = 2080;
    v19 = "-[TSCellularPlanActivatingFlow _onTransferError:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "transfer failed : %@ @%s", (uint8_t *)&v16, 0x16u);
  }

  if (self->_transferError)
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[TSCellularPlanActivatingFlow _onTransferError:]";
      v7 = "transfer error already set, ignore @%s";
LABEL_9:
      _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v16, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (self->_failureWebsheetError)
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[TSCellularPlanActivatingFlow _onTransferError:]";
      v7 = "ignore the error, launch error Websheet instead @%s";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  -[TSSIMSetupFlow navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visibleViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[TSSIMSetupFlow navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "visibleViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v4, "code");

      if (v13 == 4097)
        goto LABEL_17;
    }
    else
    {

    }
LABEL_19:
    v14 = v4;
    goto LABEL_20;
  }
  v10 = objc_msgSend(v4, "code");

  if (v10 != 4097)
    goto LABEL_19;
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE158B0], 4097, 0);
  v14 = (NSError *)objc_claimAutoreleasedReturnValue();
LABEL_20:
  transferError = self->_transferError;
  self->_transferError = v14;

  if (self->_transferError && self->_firstViewControllerCallback)
    -[TSCellularPlanActivatingFlow _maybeMoveToNextViewController](self, "_maybeMoveToNextViewController");
LABEL_11:

}

- (void)setDefaultNavigationItems:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  id v10;

  v10 = a3;
  if (+[TSUtilities isPad](TSUtilities, "isPad"))
  {
    v4 = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
    objc_msgSend(v10, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      objc_msgSend(v5, "setHidesBackButton:animated:", 1, 0);
    else
      objc_msgSend(v5, "setRightBarButtonItem:", self->_cancelButton);
    goto LABEL_7;
  }
  objc_msgSend(v10, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidesBackButton:animated:", 1, 0);

  v8 = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
  v9 = v10;
  if (!v8)
  {
    objc_msgSend(v10, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLeftBarButtonItem:", self->_cancelButton);
LABEL_7:

    v9 = v10;
  }

}

- (void)_maybeMoveToNextViewController
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[TSCellularPlanActivatingFlow websheetFlow](self, "websheetFlow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __62__TSCellularPlanActivatingFlow__maybeMoveToNextViewController__block_invoke;
    v4[3] = &unk_24DEF29F8;
    objc_copyWeak(&v5, &location);
    -[TSCellularPlanActivatingFlow _maybeDismissAlert:](self, "_maybeDismissAlert:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __62__TSCellularPlanActivatingFlow__maybeMoveToNextViewController__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  void *v9;
  char isKindOfClass;
  id v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  id v17;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "firstViewControllerCallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_loadWeakRetained(v1);
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "_firstViewController");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "firstViewControllerCallback");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v17);

    v8 = objc_loadWeakRetained(v1);
    objc_msgSend(v8, "setFirstViewControllerCallback:", 0);
LABEL_7:

    return;
  }
  objc_msgSend(v4, "topViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v11 = objc_loadWeakRetained(v1);
    objc_msgSend(v11, "topViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewControllerDidComplete:", v12);

  }
  v13 = objc_loadWeakRetained(v1);
  objc_msgSend(v13, "topViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) != 0)
  {
    v8 = objc_loadWeakRetained(v1);
    objc_msgSend(v8, "topViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewControllerDidComplete:", v16);

    v17 = v8;
    goto LABEL_7;
  }
}

- (id)_firstViewController
{
  TSCellularSetupTimeoutFailureViewController *v3;
  unint64_t currentActivatingState;
  TSCellularSetupTimeoutFailureViewController *v5;
  TSMidOperationFailureViewController *v6;
  NSError *transferError;
  CTCellularPlanItem *updatePlanItem;
  _BOOL8 v9;
  NSString *carrierName;
  NSString *carrierErrorCode;
  TSMidOperationFailureViewController *v12;
  NSError *planInstallError;
  CTCellularPlanItem *v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[TSCellularPlanActivatingFlow _stopTimerWithBackgroundTaskState:](self, "_stopTimerWithBackgroundTaskState:", 0);
  if (self->_showConfirmationCodePane)
  {
    v3 = -[TSCellularPlanConfirmationCodeViewController initAsMidOperationWithCarrierName:]([TSCellularPlanConfirmationCodeViewController alloc], "initAsMidOperationWithCarrierName:", self->_planName);
    self->_showConfirmationCodePane = 0;
    goto LABEL_13;
  }
  currentActivatingState = self->_currentActivatingState;
  if (currentActivatingState == 2)
  {
    v5 = -[TSCellularSetupTimeoutFailureViewController initWithTimeoutReason:]([TSCellularSetupTimeoutFailureViewController alloc], "initWithTimeoutReason:", self->_timeoutReason);
    goto LABEL_12;
  }
  if (currentActivatingState == 1)
  {
    v5 = -[TSCellularSetupCompleteViewController initWithPhoneNumber:planName:planActiveOnSource:]([TSCellularSetupCompleteViewController alloc], "initWithPhoneNumber:planName:planActiveOnSource:", self->_phoneNumber, self->_planName, self->_planActiveOnSource);
LABEL_12:
    v3 = v5;
    goto LABEL_13;
  }
  if (self->_transferError)
  {
    v6 = [TSMidOperationFailureViewController alloc];
    transferError = self->_transferError;
    updatePlanItem = self->_updatePlanItem;
    v9 = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
    carrierName = self->_carrierName;
    carrierErrorCode = self->_carrierErrorCode;
    v12 = v6;
    planInstallError = transferError;
    v14 = updatePlanItem;
LABEL_11:
    v5 = -[TSMidOperationFailureViewController initWithPlanItemError:updatePlanItem:withBackButton:forCarrier:withCarrierErrorCode:](v12, "initWithPlanItemError:updatePlanItem:withBackButton:forCarrier:withCarrierErrorCode:", planInstallError, v14, v9, carrierName, carrierErrorCode);
    goto LABEL_12;
  }
  if (self->_planInstallError)
  {
    v12 = [TSMidOperationFailureViewController alloc];
    planInstallError = self->_planInstallError;
    v14 = self->_updatePlanItem;
    carrierName = self->_carrierName;
    carrierErrorCode = self->_carrierErrorCode;
    v9 = 0;
    goto LABEL_11;
  }
  v3 = 0;
LABEL_13:
  _TSLogDomain();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412546;
    v18 = objc_opt_class();
    v19 = 2080;
    v20 = "-[TSCellularPlanActivatingFlow _firstViewController]";
    _os_log_impl(&dword_21B647000, v15, OS_LOG_TYPE_DEFAULT, "first view controller : %@ @%s", (uint8_t *)&v17, 0x16u);
  }

  -[TSCellularSetupTimeoutFailureViewController setDelegate:](v3, "setDelegate:", self);
  -[TSCellularPlanActivatingFlow setTopViewController:](self, "setTopViewController:", v3);
  return v3;
}

- (void)_handleActivatingExpiry
{
  NSTimer *activatingTimer;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  _BOOL4 shouldShowCompletePaneOnTimeout;
  NSObject *v9;
  _BOOL4 v10;
  unint64_t v11;
  int v12;
  _DWORD v13[7];

  *(_QWORD *)&v13[5] = *MEMORY[0x24BDAC8D0];
  activatingTimer = self->_activatingTimer;
  if (activatingTimer)
  {
    -[NSTimer userInfo](activatingTimer, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("timeoutReason"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_timeoutReason = objc_msgSend(v5, "integerValue");

  }
  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_timeoutReason == 1)
      v7 = 180;
    else
      v7 = 120;
    v12 = 67109378;
    v13[0] = v7;
    LOWORD(v13[1]) = 2080;
    *(_QWORD *)((char *)&v13[1] + 2) = "-[TSCellularPlanActivatingFlow _handleActivatingExpiry]";
    _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "handle %ds activating timer expired @%s", (uint8_t *)&v12, 0x12u);
  }

  shouldShowCompletePaneOnTimeout = self->_shouldShowCompletePaneOnTimeout;
  _TSLogDomain();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (shouldShowCompletePaneOnTimeout)
  {
    if (v10)
    {
      v12 = 136315138;
      *(_QWORD *)v13 = "-[TSCellularPlanActivatingFlow _handleActivatingExpiry]";
      _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "activation complete @%s", (uint8_t *)&v12, 0xCu);
    }
    v11 = 1;
  }
  else
  {
    if (v10)
    {
      v12 = 136315138;
      *(_QWORD *)v13 = "-[TSCellularPlanActivatingFlow _handleActivatingExpiry]";
      _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "activation timed out @%s", (uint8_t *)&v12, 0xCu);
    }
    v11 = 2;
  }

  self->_currentActivatingState = v11;
  -[TSCellularPlanActivatingFlow _stopBackgroundTask](self, "_stopBackgroundTask");
  -[TSCellularPlanActivatingFlow _maybeMoveToNextViewController](self, "_maybeMoveToNextViewController");
}

- (void)_startBackgroundTask
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  if (self->_backgroundTask == *MEMORY[0x24BEBE030])
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x24BDAC760];
    v5 = 3221225472;
    v6 = __52__TSCellularPlanActivatingFlow__startBackgroundTask__block_invoke;
    v7 = &unk_24DEF29F8;
    objc_copyWeak(&v8, &location);
    self->_backgroundTask = objc_msgSend(v3, "beginBackgroundTaskWithExpirationHandler:", &v4);

    -[TSSIMSetupFlow setIdleTimerDisabled:](self, "setIdleTimerDisabled:", 1, v4, v5, v6, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __52__TSCellularPlanActivatingFlow__startBackgroundTask__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[TSCellularPlanActivatingFlow _startBackgroundTask]_block_invoke";
    _os_log_impl(&dword_21B647000, v2, OS_LOG_TYPE_DEFAULT, "background task expired @%s", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stopBackgroundTask");

}

- (void)_stopBackgroundTask
{
  unint64_t v3;
  void *v4;

  v3 = *MEMORY[0x24BEBE030];
  if (self->_backgroundTask != *MEMORY[0x24BEBE030])
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endBackgroundTask:", self->_backgroundTask);

    self->_backgroundTask = v3;
  }
  -[TSSIMSetupFlow setIdleTimerDisabled:](self, "setIdleTimerDisabled:", 0);
}

- (void)_stopTimerWithBackgroundTaskState:(BOOL)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSTimer *activatingTimer;

  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[TSCellularPlanActivatingFlow _stopTimerWithBackgroundTaskState:].cold.1(v5, v6, v7);

  if (!a3)
    -[TSCellularPlanActivatingFlow _stopBackgroundTask](self, "_stopBackgroundTask");
  -[NSTimer invalidate](self->_activatingTimer, "invalidate");
  activatingTimer = self->_activatingTimer;
  self->_activatingTimer = 0;

}

- (BOOL)shouldOfferFallbackOptionOnError:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = !+[TSUtilities isPad](TSUtilities, "isPad") && objc_msgSend(v3, "code") == 50;

  return v4;
}

- (void)_maybeDismissAlert:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a3;
  -[TSSIMSetupFlow navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TSSIMSetupFlow navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, v10);

  }
  else
  {
    v10[2]();
  }

}

- (void)offerFallbackOption
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__TSCellularPlanActivatingFlow_offerFallbackOption__block_invoke;
  v3[3] = &unk_24DEF2A70;
  v3[4] = self;
  objc_copyWeak(&v4, &location);
  -[TSCellularPlanActivatingFlow _maybeDismissAlert:](self, "_maybeDismissAlert:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __51__TSCellularPlanActivatingFlow_offerFallbackOption__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FALLBACK_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FALLBACK_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v17, v16, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DEF4290, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __51__TSCellularPlanActivatingFlow_offerFallbackOption__block_invoke_2;
  v22[3] = &unk_24DEF2A20;
  objc_copyWeak(&v23, (id *)(a1 + 40));
  objc_msgSend(v5, "actionWithTitle:style:handler:", v7, 1, v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v9);

  v10 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_24DEF4290, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __51__TSCellularPlanActivatingFlow_offerFallbackOption__block_invoke_3;
  v20[3] = &unk_24DEF2A20;
  objc_copyWeak(&v21, (id *)(a1 + 40));
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v13);

  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __51__TSCellularPlanActivatingFlow_offerFallbackOption__block_invoke_4;
  block[3] = &unk_24DEF2A48;
  block[4] = *(_QWORD *)(a1 + 32);
  v14 = v4;
  v19 = v14;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  _TSLogDomain();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[TSCellularPlanActivatingFlow offerFallbackOption]_block_invoke";
    _os_log_impl(&dword_21B647000, v15, OS_LOG_TYPE_DEFAULT, "stop timer when alert for ids error is shown @%s", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_stopTimerWithBackgroundTaskState:", 0);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);

}

void __51__TSCellularPlanActivatingFlow_offerFallbackOption__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "simSetupFlowCompleted:", 1);

}

void __51__TSCellularPlanActivatingFlow_offerFallbackOption__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "redirectToBTFlow");

}

void __51__TSCellularPlanActivatingFlow_offerFallbackOption__block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)redirectToBTFlow
{
  void *v3;
  char isKindOfClass;
  void (**firstViewControllerCallback)(id, _QWORD);
  id v6;
  id v7;

  -[TSSIMSetupFlow delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[TSSIMSetupFlow delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsOfferFallbackFlow:", 1);
    firstViewControllerCallback = (void (**)(id, _QWORD))self->_firstViewControllerCallback;
    if (firstViewControllerCallback)
    {
      firstViewControllerCallback[2](firstViewControllerCallback, 0);
      v6 = self->_firstViewControllerCallback;
      self->_firstViewControllerCallback = 0;

    }
  }
}

- (void)_shouldWaitUntilPhoneNumberBeReady:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__TSCellularPlanActivatingFlow__shouldWaitUntilPhoneNumberBeReady___block_invoke;
  v7[3] = &unk_24DEF2A98;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "getSubscriptionInfo:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __67__TSCellularPlanActivatingFlow__shouldWaitUntilPhoneNumberBeReady___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  const __CFString *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  const char *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v27 = a1;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v3, "subscriptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v10, "uuid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "UUIDString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", *((_QWORD *)WeakRetained + 27));

          if (v13)
          {
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2700]), "initWithBundleType:", 1);
            v15 = (void *)objc_msgSend(*((id *)WeakRetained + 17), "copyCarrierBundleValue:keyHierarchy:bundleType:error:", v10, &unk_24DF23470, v14, 0);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v16 = objc_msgSend(v15, "BOOLValue");
            else
              v16 = 0;
            _TSLogDomain();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              v26 = CFSTR("NO");
              if (v16)
                v26 = CFSTR("YES");
              *(_DWORD *)buf = 138412546;
              v33 = v26;
              v34 = 2080;
              v35 = "-[TSCellularPlanActivatingFlow _shouldWaitUntilPhoneNumberBeReady:]_block_invoke";
              _os_log_impl(&dword_21B647000, v25, OS_LOG_TYPE_DEFAULT, "Wait until phone number to be ready: %@ @%s", buf, 0x16u);
            }

            (*(void (**)(void))(*(_QWORD *)(v27 + 32) + 16))();
            goto LABEL_22;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_22:

  }
  else
  {
    _TSLogDomain();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __67__TSCellularPlanActivatingFlow__shouldWaitUntilPhoneNumberBeReady___block_invoke_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_maybeDeleteTransferBackItem:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
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
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v20;
    *(_QWORD *)&v6 = 138412546;
    v18 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v10, "transferredStatus", v18))
        {
          if ((objc_msgSend(v10, "isInstalling") & 1) == 0)
          {
            objc_msgSend(v10, "plan");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "status");

            if (!v12)
            {
              objc_msgSend(self->_transferBackOldItem, "iccid");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "iccid");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v13, "isEqualToPhoneNumber:", v14);

              if (v15)
              {
                _TSLogDomain();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v18;
                  v24 = v10;
                  v25 = 2080;
                  v26 = "-[TSCellularPlanActivatingFlow _maybeDeleteTransferBackItem:]";
                  _os_log_impl(&dword_21B647000, v16, OS_LOG_TYPE_DEFAULT, "remove transfer back item : %@ @%s", buf, 0x16u);
                }

                objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "didDeletePlanItem:completion:", v10, &__block_literal_global_0);

              }
            }
          }
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v7);
  }

}

void __61__TSCellularPlanActivatingFlow__maybeDeleteTransferBackItem___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109634;
    v6[1] = a2;
    v7 = 2112;
    v8 = v4;
    v9 = 2080;
    v10 = "-[TSCellularPlanActivatingFlow _maybeDeleteTransferBackItem:]_block_invoke";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "remote item : %d, error : %@ @%s", (uint8_t *)v6, 0x1Cu);
  }

}

- (void)_submitCellularPlanSetupDetails
{
  double Current;
  uint64_t v4;
  double v5;
  NSObject *v6;
  unint64_t planSetupType;
  void *v8;
  void *v9;
  unint64_t currentActivatingState;
  int v11;
  unint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  Current = CFAbsoluteTimeGetCurrent();
  if (*(_OWORD *)&self->_planInstallError == 0)
  {
    currentActivatingState = self->_currentActivatingState;
    if (currentActivatingState == 1)
      v4 = 1;
    else
      v4 = 2 * (currentActivatingState == 2);
  }
  else
  {
    v4 = 3;
  }
  v5 = Current - self->_startTime;
  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    planSetupType = self->_planSetupType;
    v11 = 134218754;
    v12 = planSetupType;
    v13 = 2048;
    v14 = v4;
    v15 = 2048;
    v16 = v5;
    v17 = 2080;
    v18 = "-[TSCellularPlanActivatingFlow _submitCellularPlanSetupDetails]";
    _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "Time to complete activating for plan type %tu with result %tu : %f  @%s", (uint8_t *)&v11, 0x2Au);
  }

  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2790]), "initWithInBuddy:carrierName:setupType:setupResult:duration:", +[TSUtilities inBuddy](TSUtilities, "inBuddy"), self->_planName, self->_planSetupType, v4, (unint64_t)v5);
  objc_msgSend(v8, "submitPlanSetupDetails:", v9);

}

- (void)_displayTermsAndConditionsViewController:(id)a3
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
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  -[TSSIMSetupFlow navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __73__TSCellularPlanActivatingFlow__displayTermsAndConditionsViewController___block_invoke;
    v14[3] = &unk_24DEF2B00;
    objc_copyWeak(&v16, &location);
    v15 = v4;
    -[TSCellularPlanActivatingFlow _maybeDismissAlert:](self, "_maybeDismissAlert:", v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[TSCellularPlanActivatingFlow _displayTermsAndConditionsViewController:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

void __73__TSCellularPlanActivatingFlow__displayTermsAndConditionsViewController___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  TSTermsAndConditionsViewController *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [TSTermsAndConditionsViewController alloc];
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "sourceIccid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TSTermsAndConditionsViewController initWithSourceIccid:mainText:](v6, "initWithSourceIccid:mainText:", v8, *(_QWORD *)(a1 + 32));

    v10 = objc_loadWeakRetained(v2);
    objc_msgSend(v10, "setTermsAndConditionsViewController:", v9);

    v11 = objc_loadWeakRetained(v2);
    objc_msgSend(v11, "termsAndConditionsViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", v11);

    v13 = objc_loadWeakRetained(v2);
    objc_msgSend(v13, "setTermsAndConditionsShown:", 1);

    _TSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_loadWeakRetained(v2);
      objc_msgSend(v15, "termsAndConditionsViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_loadWeakRetained(v2);
      objc_msgSend(v17, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "topViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412802;
      v30 = v16;
      v31 = 2112;
      v32 = v19;
      v33 = 2080;
      v34 = "-[TSCellularPlanActivatingFlow _displayTermsAndConditionsViewController:]_block_invoke";
      _os_log_impl(&dword_21B647000, v14, OS_LOG_TYPE_DEFAULT, "present : %@ on cur : %@ @%s", (uint8_t *)&v29, 0x20u);

    }
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v9);
    objc_msgSend(v20, "setModalPresentationStyle:", 2);
    v21 = objc_loadWeakRetained(v2);
    objc_msgSend(v21, "_stopTimerWithBackgroundTaskState:", 1);

    objc_msgSend(v5, "presentViewController:animated:completion:", v20, 1, 0);
  }
  else
  {
    _TSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __73__TSCellularPlanActivatingFlow__displayTermsAndConditionsViewController___block_invoke_cold_1(v9, v22, v23, v24, v25, v26, v27, v28);
  }

}

- (void)_displayOneTimeCodeViewController:(id)a3 carrierName:(id)a4 usePin:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  BOOL v23;
  id location;

  v8 = a3;
  v9 = a4;
  -[TSSIMSetupFlow navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __85__TSCellularPlanActivatingFlow__displayOneTimeCodeViewController_carrierName_usePin___block_invoke;
    v19[3] = &unk_24DEF2B28;
    objc_copyWeak(&v22, &location);
    v20 = v8;
    v21 = v9;
    v23 = a5;
    -[TSCellularPlanActivatingFlow _maybeDismissAlert:](self, "_maybeDismissAlert:", v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    _TSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[TSCellularPlanActivatingFlow _displayOneTimeCodeViewController:carrierName:usePin:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
}

void __85__TSCellularPlanActivatingFlow__displayOneTimeCodeViewController_carrierName_usePin___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  TSTransferOneTimeCodeViewController *v6;
  id v7;
  void *v8;
  TSTransferOneTimeCodeViewController *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  TSTransferOneTimeCodeViewController *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  TSTransferOneTimeCodeViewController *v27;
  id v28;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [TSTransferOneTimeCodeViewController alloc];
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "sourceIccid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TSTransferOneTimeCodeViewController initWithSourceIccid:phoneNumber:carrierName:usePin:](v6, "initWithSourceIccid:phoneNumber:carrierName:usePin:", v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

    v10 = objc_loadWeakRetained(v2);
    objc_msgSend(v10, "setOneTimeCodeViewController:", v9);

    v11 = objc_loadWeakRetained(v2);
    objc_msgSend(v11, "oneTimeCodeViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", v11);

    v13 = objc_loadWeakRetained(v2);
    objc_msgSend(v13, "setOneTimePasscodePaneShown:", 1);

    v14 = objc_loadWeakRetained(v2);
    objc_msgSend(v14, "_stopTimerWithBackgroundTaskState:", 1);

    v15 = objc_loadWeakRetained(v2);
    objc_msgSend(v15, "oneTimeCodeViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTopViewController:", v16);

    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __85__TSCellularPlanActivatingFlow__displayOneTimeCodeViewController_carrierName_usePin___block_invoke_97;
    v26[3] = &unk_24DEF2B00;
    objc_copyWeak(&v28, v2);
    v27 = v9;
    v17 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v26);

    objc_destroyWeak(&v28);
  }
  else
  {
    _TSLogDomain();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __85__TSCellularPlanActivatingFlow__displayOneTimeCodeViewController_carrierName_usePin___block_invoke_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);

  }
}

void __85__TSCellularPlanActivatingFlow__displayOneTimeCodeViewController_carrierName_usePin___block_invoke_97(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "oneTimeCodeViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v5, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v4;
    v12 = 2112;
    v13 = v7;
    v14 = 2080;
    v15 = "-[TSCellularPlanActivatingFlow _displayOneTimeCodeViewController:carrierName:usePin:]_block_invoke";
    _os_log_impl(&dword_21B647000, v2, OS_LOG_TYPE_DEFAULT, "push : %@ on : %@ @%s", (uint8_t *)&v10, 0x20u);

  }
  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v8, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);

}

- (void)_handleOtpStatusUpdate:(int64_t)a3
{
  TSTransferOneTimeCodeViewController **p_oneTimeCodeViewController;
  id WeakRetained;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  p_oneTimeCodeViewController = &self->_oneTimeCodeViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_oneTimeCodeViewController);

  if (WeakRetained)
  {
    if (a3 != 2)
      -[TSCellularPlanActivatingFlow _stopTimerWithBackgroundTaskState:](self, "_stopTimerWithBackgroundTaskState:", 1);
    v8 = objc_loadWeakRetained((id *)p_oneTimeCodeViewController);
    objc_msgSend(v8, "updateOtpState:", a3);

  }
  else
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[TSCellularPlanActivatingFlow _handleOtpStatusUpdate:]";
      _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "OneTimeCodeViewController nil @%s", buf, 0xCu);
    }

  }
}

- (void)userDidTapCancel
{
  TSTransferOneTimeCodeViewController **p_oneTimeCodeViewController;
  id WeakRetained;
  id v5;
  objc_super v6;

  p_oneTimeCodeViewController = &self->_oneTimeCodeViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_oneTimeCodeViewController);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_oneTimeCodeViewController);
    objc_msgSend(v5, "disableButtonsAndHideSpinnerText");

  }
  objc_storeWeak((id *)&self->_termsAndConditionsViewController, 0);
  objc_storeWeak((id *)p_oneTimeCodeViewController, 0);
  v6.receiver = self;
  v6.super_class = (Class)TSCellularPlanActivatingFlow;
  -[TSSIMSetupFlow userDidTapCancel](&v6, sel_userDidTapCancel);
}

- (NSDictionary)websheetOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setWebsheetOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (unint64_t)currentActivatingState
{
  return self->_currentActivatingState;
}

- (void)setCurrentActivatingState:(unint64_t)a3
{
  self->_currentActivatingState = a3;
}

- (BOOL)eSIMInstallFromWebsheetFlowStarted
{
  return self->_eSIMInstallFromWebsheetFlowStarted;
}

- (void)setESIMInstallFromWebsheetFlowStarted:(BOOL)a3
{
  self->_eSIMInstallFromWebsheetFlowStarted = a3;
}

- (BOOL)skipActivatingPane
{
  return self->_skipActivatingPane;
}

- (void)setSkipActivatingPane:(BOOL)a3
{
  self->_skipActivatingPane = a3;
}

- (BOOL)shouldShowCompletePaneOnTimeout
{
  return self->_shouldShowCompletePaneOnTimeout;
}

- (void)setShouldShowCompletePaneOnTimeout:(BOOL)a3
{
  self->_shouldShowCompletePaneOnTimeout = a3;
}

- (BOOL)planActiveOnSource
{
  return self->_planActiveOnSource;
}

- (void)setPlanActiveOnSource:(BOOL)a3
{
  self->_planActiveOnSource = a3;
}

- (BOOL)maybeShowConfirmationCodePane
{
  return self->_maybeShowConfirmationCodePane;
}

- (void)setMaybeShowConfirmationCodePane:(BOOL)a3
{
  self->_maybeShowConfirmationCodePane = a3;
}

- (BOOL)showConfirmationCodePane
{
  return self->_showConfirmationCodePane;
}

- (void)setShowConfirmationCodePane:(BOOL)a3
{
  self->_showConfirmationCodePane = a3;
}

- (CTCellularPlanItem)updatePlanItem
{
  return (CTCellularPlanItem *)objc_getProperty(self, a2, 112, 1);
}

- (void)setUpdatePlanItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSTimer)activatingTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setActivatingTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (unint64_t)backgroundTask
{
  return self->_backgroundTask;
}

- (void)setBackgroundTask:(unint64_t)a3
{
  self->_backgroundTask = a3;
}

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 136, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)planName
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPlanName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSError)planInstallError
{
  return (NSError *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPlanInstallError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSError)transferError
{
  return (NSError *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTransferError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSError)failureWebsheetError
{
  return (NSError *)objc_getProperty(self, a2, 176, 1);
}

- (void)setFailureWebsheetError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSString)carrierName
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCarrierName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSString)carrierErrorCode
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCarrierErrorCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (UIBarButtonItem)cancelButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 200, 1);
}

- (void)setCancelButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSString)installingPlanIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setInstallingPlanIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSString)subscriptionContextUUID
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSubscriptionContextUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSNumber)waitForPhoneNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setWaitForPhoneNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (id)firstViewControllerCallback
{
  return objc_getProperty(self, a2, 232, 1);
}

- (void)setFirstViewControllerCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (int64_t)transferState
{
  return self->_transferState;
}

- (void)setTransferState:(int64_t)a3
{
  self->_transferState = a3;
}

- (TSSIMSetupFlow)websheetFlow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 248, 1);
}

- (void)setWebsheetFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (UINavigationController)websheetRootViewController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_websheetRootViewController);
}

- (void)setWebsheetRootViewController:(id)a3
{
  objc_storeWeak((id *)&self->_websheetRootViewController, a3);
}

- (TSTermsAndConditionsViewController)termsAndConditionsViewController
{
  return (TSTermsAndConditionsViewController *)objc_loadWeakRetained((id *)&self->_termsAndConditionsViewController);
}

- (void)setTermsAndConditionsViewController:(id)a3
{
  objc_storeWeak((id *)&self->_termsAndConditionsViewController, a3);
}

- (TSTransferOneTimeCodeViewController)oneTimeCodeViewController
{
  return (TSTransferOneTimeCodeViewController *)objc_loadWeakRetained((id *)&self->_oneTimeCodeViewController);
}

- (void)setOneTimeCodeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_oneTimeCodeViewController, a3);
}

- (BOOL)termsAndConditionsShown
{
  return self->_termsAndConditionsShown;
}

- (void)setTermsAndConditionsShown:(BOOL)a3
{
  self->_termsAndConditionsShown = a3;
}

- (BOOL)oneTimePasscodePaneShown
{
  return self->_oneTimePasscodePaneShown;
}

- (void)setOneTimePasscodePaneShown:(BOOL)a3
{
  self->_oneTimePasscodePaneShown = a3;
}

- (NSString)sourceIccid
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setSourceIccid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (id)transferBackOldItem
{
  return objc_getProperty(self, a2, 288, 1);
}

- (void)setTransferBackOldItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (unint64_t)planSetupType
{
  return self->_planSetupType;
}

- (void)setPlanSetupType:(unint64_t)a3
{
  self->_planSetupType = a3;
}

- (int64_t)timeoutReason
{
  return self->_timeoutReason;
}

- (void)setTimeoutReason:(int64_t)a3
{
  self->_timeoutReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transferBackOldItem, 0);
  objc_storeStrong((id *)&self->_sourceIccid, 0);
  objc_destroyWeak((id *)&self->_oneTimeCodeViewController);
  objc_destroyWeak((id *)&self->_termsAndConditionsViewController);
  objc_destroyWeak((id *)&self->_websheetRootViewController);
  objc_storeStrong((id *)&self->_websheetFlow, 0);
  objc_storeStrong(&self->_firstViewControllerCallback, 0);
  objc_storeStrong((id *)&self->_waitForPhoneNumber, 0);
  objc_storeStrong((id *)&self->_subscriptionContextUUID, 0);
  objc_storeStrong((id *)&self->_installingPlanIdentifier, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_carrierErrorCode, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_failureWebsheetError, 0);
  objc_storeStrong((id *)&self->_transferError, 0);
  objc_storeStrong((id *)&self->_planInstallError, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_planName, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_activatingTimer, 0);
  objc_storeStrong((id *)&self->_updatePlanItem, 0);
  objc_storeStrong((id *)&self->_websheetOptions, 0);
}

- (void)firstViewController
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid invocation. call async SPI instead @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)planItemsUpdated:(uint64_t)a3 planListError:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]empty plan items @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)planItemsUpdated:(NSObject *)a3 planListError:.cold.2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
  OUTLINED_FUNCTION_2(&dword_21B647000, a3, (uint64_t)a3, "[Db] wait provisioning plan @%s", a1);
}

- (void)planItemsUpdated:(uint64_t)a1 planListError:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
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
  v5 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
  _os_log_error_impl(&dword_21B647000, a2, OS_LOG_TYPE_ERROR, "[E]provisioning error:%@ @%s", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __63__TSCellularPlanActivatingFlow_planItemsUpdated_planListError___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self doesnt exist @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)launchWebsheet:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid navigation controller @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __58__TSCellularPlanActivatingFlow_launchWebsheet_completion___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid topview controller @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_stopTimerWithBackgroundTaskState:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[TSCellularPlanActivatingFlow _stopTimerWithBackgroundTaskState:]";
  OUTLINED_FUNCTION_2(&dword_21B647000, a1, a3, "[Db] stop timer @%s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void __67__TSCellularPlanActivatingFlow__shouldWaitUntilPhoneNumberBeReady___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self doesnt exist @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_displayTermsAndConditionsViewController:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid navigationController @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __73__TSCellularPlanActivatingFlow__displayTermsAndConditionsViewController___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid topview controller @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_displayOneTimeCodeViewController:(uint64_t)a3 carrierName:(uint64_t)a4 usePin:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid navigationController @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __85__TSCellularPlanActivatingFlow__displayOneTimeCodeViewController_carrierName_usePin___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid topview controller @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end

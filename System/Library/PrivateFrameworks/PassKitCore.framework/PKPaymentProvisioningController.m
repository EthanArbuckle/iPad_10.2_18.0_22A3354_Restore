@implementation PKPaymentProvisioningController

- (PKPaymentProvisioningController)initWithWebService:(id)a3
{
  id v4;
  PKPaymentService *v5;
  PKPaymentProvisioningController *v6;

  v4 = a3;
  v5 = -[PKPaymentService initWithDelegate:]([PKPaymentService alloc], "initWithDelegate:", self);
  v6 = -[PKPaymentProvisioningController initWithWebService:localPaymentService:](self, "initWithWebService:localPaymentService:", v4, v5);

  return v6;
}

- (PKPaymentProvisioningController)initWithWebService:(id)a3 localPaymentService:(id)a4
{
  id v7;
  id v8;
  PKPaymentProvisioningController *v9;
  PKPaymentProvisioningController *v10;
  NSObject *v11;
  PKPaymentWebService *v12;
  PKPaymentWebService *webService;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  PKProvisioningUtility *v18;
  void *v19;
  PKProvisioningUtility *v20;
  PKPaymentWebService *v21;
  uint64_t v22;
  PKProvisioningUtility *utility;
  NSMutableSet *v24;
  NSMutableSet *tasks;
  NSMutableArray *v26;
  NSMutableArray *associatedCredentials;
  NSMutableOrderedSet *v28;
  NSMutableOrderedSet *provisionedPasses;
  PKPaymentProvisioningControllerCredentialQueue *v30;
  PKPaymentProvisioningControllerCredentialQueue *credentialProvisioningQueue;
  uint64_t v32;
  NSHashTable *delegates;
  PKPaymentSetupProductModel *v34;
  PKPaymentSetupProductModel *paymentSetupProductModel;
  dispatch_queue_t v36;
  OS_dispatch_queue *updateQueue;
  NSMutableSet *v38;
  NSMutableSet *analyticsFeaturesToReport;
  NSMutableArray *v40;
  NSMutableArray *preflighUpdateHandlers;
  uint64_t v42;
  PKAccountService *accountService;
  PKPaymentCloudStoreZoneCreationManager *v44;
  PKPaymentCloudStoreZoneCreationManager *zoneCreationManager;
  PKSecureElementProvisioningState *v46;
  PKSecureElementProvisioningState *provisioningState;
  NSMutableArray *v48;
  NSMutableArray *pendingProvisionings;
  objc_super v51;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v51.receiver = self;
    v51.super_class = (Class)PKPaymentProvisioningController;
    v9 = -[PKPaymentProvisioningController init](&v51, sel_init);
    v10 = v9;
    if (v9)
    {
      v9->_delegatesLock._os_unfair_lock_opaque = 0;
      if (PKPaymentSetupUseXPCProxyTargetDevice())
      {
        PKLogFacilityTypeGetObject(6uLL);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupUseXPCProxyTargetDevice() enabled. PKPaymentProvisioningController is using a wrapped web service for provisioning.", buf, 2u);
        }

        v12 = +[PKPaymentWebServiceProxyTargetDeviceDebugHelper webServiceWithProxiedTargetDevice:](PKPaymentWebServiceProxyTargetDeviceDebugHelper, "webServiceWithProxiedTargetDevice:", v7);
        webService = v10->_webService;
        v10->_webService = v12;

        v10->_proxyTargetDeviceWebServiceInUse = 1;
      }
      else
      {
        objc_storeStrong((id *)&v10->_webService, a3);
      }
      -[PKPaymentWebService addDelegate:](v10->_webService, "addDelegate:", v10);
      -[PKWebService resetWebServiceSessionMarker](v10->_webService, "resetWebServiceSessionMarker");
      -[PKPaymentWebService targetDevice](v10->_webService, "targetDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "deviceName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Apple Watch"));

      if (v17 && (PKRunningInPassd() & 1) == 0)
      {
        v20 = [PKProvisioningUtility alloc];
        v21 = v10->_webService;
        +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[PKProvisioningUtility initWithDestinationWebService:managingWebService:](v20, "initWithDestinationWebService:managingWebService:", v21, v19);
        utility = v10->_utility;
        v10->_utility = (PKProvisioningUtility *)v22;

      }
      else
      {
        v18 = -[PKProvisioningUtility initWithDestinationWebService:managingWebService:]([PKProvisioningUtility alloc], "initWithDestinationWebService:managingWebService:", v10->_webService, v10->_webService);
        v19 = v10->_utility;
        v10->_utility = v18;
      }

      -[PKProvisioningUtility setDataProvider:](v10->_utility, "setDataProvider:", v10);
      -[PKPaymentProvisioningController _setState:notify:](v10, "_setState:notify:", -[PKPaymentProvisioningController _defaultResetState](v10, "_defaultResetState"), 0);
      v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      tasks = v10->_tasks;
      v10->_tasks = v24;

      v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      associatedCredentials = v10->_associatedCredentials;
      v10->_associatedCredentials = v26;

      v28 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
      provisionedPasses = v10->_provisionedPasses;
      v10->_provisionedPasses = v28;

      v30 = objc_alloc_init(PKPaymentProvisioningControllerCredentialQueue);
      credentialProvisioningQueue = v10->_credentialProvisioningQueue;
      v10->_credentialProvisioningQueue = v30;

      objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
      v32 = objc_claimAutoreleasedReturnValue();
      delegates = v10->_delegates;
      v10->_delegates = (NSHashTable *)v32;

      v34 = objc_alloc_init(PKPaymentSetupProductModel);
      paymentSetupProductModel = v10->_paymentSetupProductModel;
      v10->_paymentSetupProductModel = v34;

      objc_storeStrong((id *)&v10->_paymentService, a4);
      -[PKPaymentService setDelegate:](v10->_paymentService, "setDelegate:", v10);
      v36 = dispatch_queue_create("com.apple.passkit.updateRecentsAndKeychainWithContactInformation", 0);
      updateQueue = v10->_updateQueue;
      v10->_updateQueue = (OS_dispatch_queue *)v36;

      v38 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      analyticsFeaturesToReport = v10->_analyticsFeaturesToReport;
      v10->_analyticsFeaturesToReport = v38;

      v40 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      preflighUpdateHandlers = v10->_preflighUpdateHandlers;
      v10->_preflighUpdateHandlers = v40;

      +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
      v42 = objc_claimAutoreleasedReturnValue();
      accountService = v10->_accountService;
      v10->_accountService = (PKAccountService *)v42;

      v44 = -[PKPaymentCloudStoreZoneCreationManager initWithWebService:]([PKPaymentCloudStoreZoneCreationManager alloc], "initWithWebService:", v10->_webService);
      zoneCreationManager = v10->_zoneCreationManager;
      v10->_zoneCreationManager = v44;

      -[PKAccountService registerObserver:](v10->_accountService, "registerObserver:", v10);
      v46 = objc_alloc_init(PKSecureElementProvisioningState);
      provisioningState = v10->_provisioningState;
      v10->_provisioningState = v46;

      v48 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      pendingProvisionings = v10->_pendingProvisionings;
      v10->_pendingProvisionings = v48;

      -[PKPaymentProvisioningController _beginReportingIfNecessary](v10, "_beginReportingIfNecessary");
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Error: No webservice for provisioning controller returning nil", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (PKPaymentProvisioningController)initWithWebService:(id)a3 paymentSetupRequest:(id)a4
{
  id v6;
  PKPaymentProvisioningController *v7;
  PKPaymentProvisioningController *v8;
  PKSecureElementProvisioningState *provisioningState;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSSet *v14;
  NSSet *requiredTransitNetworkIdentifiers;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  NSSet *v23;
  void *v24;
  uint64_t v25;
  NSSet *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSSet *allowedFeatureIdentifiers;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[PKPaymentProvisioningController initWithWebService:](self, "initWithWebService:", a3);
  v8 = v7;
  if (v7)
  {
    provisioningState = v7->_provisioningState;
    objc_msgSend(v6, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "referrerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementProvisioningState setReferrerIdentifier:](provisioningState, "setReferrerIdentifier:", v11);

    objc_msgSend(v6, "paymentSetupFeatures");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v33 = v6;
      objc_storeStrong((id *)&v8->_paymentSetupFeatures, v12);
      v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v14 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
      requiredTransitNetworkIdentifiers = v8->_requiredTransitNetworkIdentifiers;
      v8->_requiredTransitNetworkIdentifiers = v14;

      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v32 = v12;
      v16 = v12;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v35 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            v22 = objc_msgSend(v21, "type", v32);
            if (v22 == 3)
            {
              v23 = v8->_requiredTransitNetworkIdentifiers;
              objc_msgSend(v21, "identifiers");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSSet setByAddingObjectsFromSet:](v23, "setByAddingObjectsFromSet:", v24);
              v25 = objc_claimAutoreleasedReturnValue();
              v26 = v8->_requiredTransitNetworkIdentifiers;
              v8->_requiredTransitNetworkIdentifiers = (NSSet *)v25;

            }
            if (v22 == 2)
              v27 = 4;
            else
              v27 = 2 * (v22 == 1);
            if (v27)
            {
              PKFeatureIdentifierToString(v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v28);

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v18);
      }

      v29 = objc_msgSend(v13, "copy");
      allowedFeatureIdentifiers = v8->_allowedFeatureIdentifiers;
      v8->_allowedFeatureIdentifiers = (NSSet *)v29;

      v12 = v32;
      v6 = v33;
    }

  }
  return v8;
}

- (BOOL)isWatchSupportedForProduct:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSArray *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_paymentSetupFeatures;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v8, "identifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v4, "supportedTransitNetworkIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setWithArray:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v9, "intersectsSet:", v12);

        if (v13 && (objc_msgSend(v8, "supportedDevices") & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          LOBYTE(v5) = 1;
          goto LABEL_12;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  return v5;
}

- (void)dealloc
{
  PKPaymentWebService *webService;
  NSObject *locationTimer;
  objc_super v5;

  if (self->_provisioningUserInterfaceIsVisible)
    -[PKPaymentProvisioningController noteProvisioningUserInterfaceDidDisappear](self, "noteProvisioningUserInterfaceDidDisappear");
  -[NSTimer invalidate](self->_descriptionTimer, "invalidate");
  -[PKPaymentWebService removeDelegate:](self->_webService, "removeDelegate:", self);
  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  if (self->_proxyTargetDeviceWebServiceInUse)
  {
    -[PKWebService invalidate](self->_webService, "invalidate");
    webService = self->_webService;
    self->_webService = 0;

  }
  locationTimer = self->_locationTimer;
  if (locationTimer)
    dispatch_source_cancel(locationTimer);
  -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", 0);
  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  -[PKPaymentProvisioningController _endSessionIfNecessary](self, "_endSessionIfNecessary");
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningController;
  -[PKPaymentProvisioningController dealloc](&v5, sel_dealloc);
}

- (void)_endSessionIfNecessary
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_featuresDidBeginReporting;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        +[PKAnalyticsReporter subjectToReportDashboardAnalyticsForFeature:](PKAnalyticsReporter, "subjectToReportDashboardAnalyticsForFeature:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "integerValue", (_QWORD)v8));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          +[PKAnalyticsReporter endSubjectReporting:](PKAnalyticsReporter, "endSubjectReporting:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_beginReportingIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSSet *featuresDidBeginReporting;
  PKPaymentProvisioningController *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", self->_featuresDidBeginReporting);
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = v5;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = self;
  v7 = self->_analyticsFeaturesToReport;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = PKFeatureIdentifierFromString(*(void **)(*((_QWORD *)&v19 + 1) + 8 * i));
        +[PKAnalyticsReporter subjectToReportDashboardAnalyticsForFeature:](PKAnalyticsReporter, "subjectToReportDashboardAnalyticsForFeature:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          +[PKAnalyticsReporter reporterForSubject:](PKAnalyticsReporter, "reporterForSubject:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v15);

            +[PKAnalyticsReporter beginSubjectReporting:](PKAnalyticsReporter, "beginSubjectReporting:", v13);
          }
        }

      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v16 = objc_msgSend(v6, "copy");
  featuresDidBeginReporting = v18->_featuresDidBeginReporting;
  v18->_featuresDidBeginReporting = (NSSet *)v16;

}

- (int64_t)_defaultResetState
{
  return 0;
}

- (void)reset
{
  -[PKPaymentProvisioningController resetForNewProvisioning](self, "resetForNewProvisioning");
  -[PKPaymentProvisioningControllerCredentialQueue setCredentialsToProvision:](self->_credentialProvisioningQueue, "setCredentialsToProvision:", 0);
}

- (void)resetForNewProvisioning
{
  -[PKPaymentProvisioningController resetForNewProvisioningForce:](self, "resetForNewProvisioningForce:", 0);
}

- (void)resetForNewProvisioningForce:(BOOL)a3
{
  _BOOL4 v3;
  int64_t state;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  PKSecureElementProvisioningState *v12;
  PKSecureElementProvisioningState *provisioningState;
  NSArray *moreInfoItems;
  PKPaymentCredential *currentCredential;
  PKAddPaymentPassRequestConfiguration *currentAddPaymentPassRequestConfiguration;
  NSSet *automaticExpressModes;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state != -[PKPaymentProvisioningController _defaultResetState](self, "_defaultResetState") || v3)
  {
    v7 = -[PKPaymentProvisioningController _defaultResetState](self, "_defaultResetState");
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      PKPaymentProvisioningControllerStateToString(self->_state);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKPaymentProvisioningControllerStateToString(v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Provisioning Controller Reset (from: %@ to: %@)", (uint8_t *)&v18, 0x16u);

    }
    -[PKPaymentProvisioningController _setState:notify:](self, "_setState:notify:", v7, 1);
    -[PKSecureElementProvisioningState referrerIdentifier](self->_provisioningState, "referrerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(PKSecureElementProvisioningState);
    provisioningState = self->_provisioningState;
    self->_provisioningState = v12;

    -[PKSecureElementProvisioningState setReferrerIdentifier:](self->_provisioningState, "setReferrerIdentifier:", v11);
    -[NSMutableOrderedSet removeAllObjects](self->_provisionedPasses, "removeAllObjects");
    moreInfoItems = self->_moreInfoItems;
    self->_moreInfoItems = 0;

    currentCredential = self->_currentCredential;
    self->_currentCredential = 0;

    currentAddPaymentPassRequestConfiguration = self->_currentAddPaymentPassRequestConfiguration;
    self->_currentAddPaymentPassRequestConfiguration = 0;

    automaticExpressModes = self->_automaticExpressModes;
    self->_automaticExpressModes = 0;

    self->_AMPEnrollmentAvailable = 0;
    -[PKWebService resetWebServiceSessionMarker](self->_webService, "resetWebServiceSessionMarker");

  }
}

- (void)_setState:(int64_t)a3 notify:(BOOL)a4
{
  id v5;

  if (self->_state != a3)
  {
    self->_state = a3;
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:", CFSTR("PKPaymentProvisioningControllerStateDidChangeNotification"), self);

    }
  }
}

- (void)validatePreconditions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKPaymentWebService *webService;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    PKTimeProfileBegin(0, CFSTR("validate"));
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    webService = self->_webService;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__PKPaymentProvisioningController_validatePreconditions___block_invoke;
    v10[3] = &unk_1E2ABDAE0;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v6, "paymentWebService:validateAddPreconditionsWithCompletion:", webService, v10);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "No target device for preconditions, bailing out", buf, 2u);
    }

    if (v4)
    {
      -[PKPaymentProvisioningController displayableErrorForError:](self, "displayableErrorForError:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);

    }
  }

}

void __57__PKPaymentProvisioningController_validatePreconditions___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  char v13;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PKPaymentProvisioningController_validatePreconditions___block_invoke_2;
  v9[3] = &unk_1E2ABE210;
  v13 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __57__PKPaymentProvisioningController_validatePreconditions___block_invoke_2(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v2 = CFSTR("YES");
  if (!*(_BYTE *)(a1 + 56))
    v2 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PKPaymentProvisioningController: Validate Preconditions result was %@ error %@"), v2, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(6uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKTimeProfileEnd(v4, CFSTR("validate"), v3);

  if (*(_BYTE *)(a1 + 56))
  {
    PKTimeProfileBegin(0, CFSTR("configure"));
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(a1 + 48);
    v8 = *(_QWORD *)(v6 + 344);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__PKPaymentProvisioningController_validatePreconditions___block_invoke_3;
    v11[3] = &unk_1E2ABEB88;
    v11[4] = v6;
    v12 = v7;
    +[PKPaymentRegistrationUtilities configureWebServiceIfNecessary:completion:](PKPaymentRegistrationUtilities, "configureWebServiceIfNecessary:completion:", v8, v11);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      if (*(_QWORD *)(a1 + 32))
      {
        (*(void (**)(_QWORD, _QWORD))(v9 + 16))(*(_QWORD *)(a1 + 48), 0);
      }
      else
      {
        PKDisplayableErrorForCommonType(0, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

      }
    }
  }

}

void __57__PKPaymentProvisioningController_validatePreconditions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKTimeProfileEnd(v4, CFSTR("configure"), CFSTR("PKPaymentProvisioningController: Configure Web Service"));

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "registrationSetupSupportedInRegion") & 1) != 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__PKPaymentProvisioningController_validatePreconditions___block_invoke_4;
    v9[3] = &unk_1E2ABE148;
    v6 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performDeviceCheckInIfNeeded:", v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "displayableErrorForError:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
  }

}

uint64_t __57__PKPaymentProvisioningController_validatePreconditions___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)registerDevice:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PKPaymentProvisioningController_registerDevice___block_invoke;
  v6[3] = &unk_1E2ABE148;
  v7 = v4;
  v5 = v4;
  -[PKPaymentProvisioningController _registerDevice:](self, "_registerDevice:", v6);

}

uint64_t __50__PKPaymentProvisioningController_registerDevice___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_registerDevice:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[5];
  id v18;

  v4 = a3;
  PKTimeProfileBegin(0, CFSTR("register"));
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKPaymentProvisioningController__registerDevice___block_invoke;
  aBlock[3] = &unk_1E2ABDFB8;
  v6 = v4;
  aBlock[4] = self;
  v18 = v6;
  v7 = _Block_copy(aBlock);
  if (-[PKPaymentWebService _needsRegistrationShouldCheckSecureElementOwnership:](self->_webService, "_needsRegistrationShouldCheckSecureElementOwnership:", 1))
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15[0] = v5;
      v15[1] = 3221225472;
      v15[2] = __51__PKPaymentProvisioningController__registerDevice___block_invoke_2;
      v15[3] = &unk_1E2ACFCF8;
      v9 = &v16;
      v16 = v7;
      objc_msgSend(v8, "performDeviceRegistrationReturningContextForReason:brokerURL:completion:", CFSTR("ProvisoningController"), 0, v15);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __51__PKPaymentProvisioningController__registerDevice___block_invoke_4;
      v13[3] = &unk_1E2AC2800;
      v9 = &v14;
      v14 = v7;
      objc_msgSend(v8, "performDeviceRegistrationForReason:brokerURL:completion:", CFSTR("ProvisoningController"), 0, v13);
    }
    else
    {
      +[PKDeviceRegistrationService sharedInstance](PKDeviceRegistrationService, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      v11[1] = 3221225472;
      v11[2] = __51__PKPaymentProvisioningController__registerDevice___block_invoke_6;
      v11[3] = &unk_1E2ACFCF8;
      v9 = &v12;
      v12 = v7;
      objc_msgSend(v10, "performDeviceRegistrationReturningContextForReason:brokerURL:actionType:completion:", CFSTR("ProvisoningController"), 0, 1, v11);

    }
  }
  else
  {
    (*((void (**)(void *, uint64_t, _QWORD, _QWORD))v7 + 2))(v7, 16, 0, 0);
  }

}

void __51__PKPaymentProvisioningController__registerDevice___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = PKTimeProfileEnd(v8, CFSTR("register"), CFSTR("PKPaymentProvisioningController: Register"));

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
  {
    if ((a2 & 0x10) == 0 || v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "displayableErrorForError:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

    }
    else
    {
      if (v12)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "updateContextAndNotifyIfNeeded:");
        v10 = *(_QWORD *)(a1 + 40);
      }
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v10 + 16))(v10, 1, 0);
    }
  }

}

void __51__PKPaymentProvisioningController__registerDevice___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__PKPaymentProvisioningController__registerDevice___block_invoke_3;
  v11[3] = &unk_1E2ABDF90;
  v14 = *(id *)(a1 + 32);
  v15 = a2;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __51__PKPaymentProvisioningController__registerDevice___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[7], a1[4], a1[5]);
}

void __51__PKPaymentProvisioningController__registerDevice___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PKPaymentProvisioningController__registerDevice___block_invoke_5;
  block[3] = &unk_1E2ABDBD0;
  v9 = *(id *)(a1 + 32);
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __51__PKPaymentProvisioningController__registerDevice___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], 0, a1[4]);
}

void __51__PKPaymentProvisioningController__registerDevice___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__PKPaymentProvisioningController__registerDevice___block_invoke_7;
  v11[3] = &unk_1E2ABDF90;
  v14 = *(id *)(a1 + 32);
  v15 = a2;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __51__PKPaymentProvisioningController__registerDevice___block_invoke_7(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[7], a1[4], a1[5]);
}

- (void)validatePreconditionsAndRegister:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PKPaymentProvisioningController_validatePreconditionsAndRegister___block_invoke;
  v6[3] = &unk_1E2ABDF68;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PKPaymentProvisioningController validatePreconditions:](self, "validatePreconditions:", v6);

}

void __68__PKPaymentProvisioningController_validatePreconditionsAndRegister___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__PKPaymentProvisioningController_validatePreconditionsAndRegister___block_invoke_2;
    v8[3] = &unk_1E2ABE148;
    v6 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v6, "registerDevice:", v8);

  }
}

uint64_t __68__PKPaymentProvisioningController_validatePreconditionsAndRegister___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)preflightWithCompletion:(id)a3
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = -[PKPaymentProvisioningController _hasSetupConfiguration](self, "_hasSetupConfiguration");
  if (v4)
    v5 = 493;
  else
    v5 = 495;
  if (v4)
    v6 = 493;
  else
    v6 = 263;
  -[PKPaymentProvisioningController preflightWithRequirements:completionRequirements:completion:](self, "preflightWithRequirements:completionRequirements:completion:", v5, v6, v7);

}

- (void)preflightWithRequirements:(unint64_t)a3 completionRequirements:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD v15[3];
  char v16;

  v8 = a5;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__PKPaymentProvisioningController_preflightWithRequirements_completionRequirements_completion___block_invoke;
  v10[3] = &unk_1E2ACFFC8;
  v12 = v15;
  v13 = a3;
  v10[4] = self;
  v14 = a4;
  v9 = v8;
  v11 = v9;
  -[PKPaymentProvisioningController preflightWithRequirements:update:](self, "preflightWithRequirements:update:", a3, v10);

  _Block_object_dispose(v15, 8);
}

void __95__PKPaymentProvisioningController_preflightWithRequirements_completionRequirements_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;

  v5 = a3;
  v6 = v5;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v7 = a1[4];
    v10 = v5;
    if (*(_QWORD *)(v7 + 336) == 1
      || (v8 = objc_msgSend(*(id *)(v7 + 344), "paymentSetupSupportedInRegion", v5), v6 = v10, v8 == 2))
    {
      v9 = a1 + 7;
      if (v6)
        goto LABEL_8;
    }
    else
    {
      v9 = a1 + 8;
      if (v10)
      {
LABEL_8:
        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
        (*(void (**)(void))(a1[5] + 16))();
        v6 = v10;
        goto LABEL_9;
      }
    }
    if ((*v9 & a2) == *v9)
      goto LABEL_8;
  }
LABEL_9:

}

- (void)preflightWithRequirements:(unint64_t)a3 update:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  NSObject *v11;
  id v12;
  unint64_t v13;

  v6 = a4;
  v7 = MEMORY[0x1E0C80D38];
  v8 = MEMORY[0x1E0C80D38];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke;
  v10[3] = &unk_1E2ABDF90;
  v12 = v6;
  v13 = a3;
  v10[4] = self;
  v11 = v7;
  v9 = v6;
  dispatch_async(v7, v10);

}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (**v14)(void *, uint64_t);
  PKAsyncUnaryOperationComposer *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  BOOL v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int (**v27)(void *, uint64_t);
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  unsigned int (**v38)(void *, uint64_t);
  __int128 *v39;
  _QWORD v40[4];
  id v41;
  uint64_t v42;
  __int128 *v43;
  uint64_t v44;
  _QWORD v45[4];
  id v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  __int128 *p_buf;
  _QWORD v52[4];
  id v53;
  uint64_t v54;
  _QWORD aBlock[6];
  __int128 buf;
  uint64_t v57;
  char v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if ((v2 & ~*(_QWORD *)(v3 + 368)) != 0)
    {
      v7 = *(void **)(a1 + 48);
      if (v7)
      {
        v8 = *(void **)(v3 + 216);
        v9 = (void *)objc_msgSend(v7, "copy");
        v10 = _Block_copy(v9);
        objc_msgSend(v8, "addObject:", v10);

        v3 = *(_QWORD *)(a1 + 32);
      }
      if (*(_BYTE *)(v3 + 224))
      {
        PKLogFacilityTypeGetObject(6uLL);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController already preflighting", (uint8_t *)&buf, 2u);
        }

      }
      else
      {
        v12 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_171;
        aBlock[3] = &unk_1E2ACFFF0;
        v13 = *(_QWORD *)(a1 + 56);
        aBlock[4] = v3;
        aBlock[5] = v13;
        v14 = (unsigned int (**)(void *, uint64_t))_Block_copy(aBlock);
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 224) = 1;
        PKTimeProfileBegin(0, CFSTR("preflight"));
        v15 = objc_alloc_init(PKAsyncUnaryOperationComposer);
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v57 = 0x2020000000;
        v58 = 0;
        if (v14[2](v14, 256))
        {
          if (PKLocationServicesEnabled())
          {
            v52[0] = v12;
            v52[1] = 3221225472;
            v52[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_2;
            v52[3] = &unk_1E2AD0018;
            v16 = *(void **)(a1 + 32);
            v17 = *(id *)(a1 + 40);
            v18 = *(_QWORD *)(a1 + 32);
            v53 = v17;
            v54 = v18;
            objc_msgSend(v16, "_startLocationSearchWithTimeout:completion:", v52, 3.0);

          }
          objc_msgSend(*(id *)(a1 + 32), "_updatePreflightRequirement:displayableError:", 256, 0);
        }
        if (v14[2](v14, 1))
        {
          v48[0] = v12;
          v48[1] = 3221225472;
          v48[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_3;
          v48[3] = &unk_1E2AC71C0;
          v19 = *(id *)(a1 + 40);
          v20 = *(_QWORD *)(a1 + 32);
          v49 = v19;
          v50 = v20;
          p_buf = &buf;
          -[PKAsyncUnaryOperationComposer addOperation:](v15, "addOperation:", v48);

        }
        else
        {
          v21 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "paymentSetupSupportedInRegion") == 1;
          *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) = v21;
        }
        if (v14[2](v14, 4))
        {
          v45[0] = v12;
          v45[1] = 3221225472;
          v45[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_6;
          v45[3] = &unk_1E2AC8040;
          v22 = *(id *)(a1 + 40);
          v23 = *(_QWORD *)(a1 + 32);
          v46 = v22;
          v47 = v23;
          -[PKAsyncUnaryOperationComposer addOperation:](v15, "addOperation:", v45);

        }
        if (v14[2](v14, 2))
        {
          v40[0] = v12;
          v40[1] = 3221225472;
          v40[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_8;
          v40[3] = &unk_1E2AD0128;
          v24 = *(id *)(a1 + 40);
          v25 = *(_QWORD *)(a1 + 32);
          v41 = v24;
          v42 = v25;
          v26 = *(_QWORD *)(a1 + 56);
          v43 = &buf;
          v44 = v26;
          -[PKAsyncUnaryOperationComposer addOperation:](v15, "addOperation:", v40);

        }
        v35[0] = v12;
        v35[1] = 3221225472;
        v35[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_187;
        v35[3] = &unk_1E2AD0218;
        v36 = *(id *)(a1 + 40);
        v27 = v14;
        v37 = *(_QWORD *)(a1 + 32);
        v38 = v27;
        v39 = &buf;
        -[PKAsyncUnaryOperationComposer addOperation:](v15, "addOperation:", v35);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v12;
        v32[1] = 3221225472;
        v32[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_10;
        v32[3] = &unk_1E2AD0240;
        v29 = *(id *)(a1 + 40);
        v30 = *(_QWORD *)(a1 + 32);
        v33 = v29;
        v34 = v30;
        v31 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v15, "evaluateWithInput:completion:", v28, v32);

        _Block_object_dispose(&buf, 8);
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v2;
        _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController has already been preflighted with requirements result: %lu", (uint8_t *)&buf, 0xCu);
      }

      v5 = *(_QWORD *)(a1 + 48);
      if (v5)
LABEL_6:
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368), 0);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController cannot preflight with no requirements", (uint8_t *)&buf, 2u);
    }

    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      goto LABEL_6;
  }
}

BOOL __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_171(uint64_t a1, uint64_t a2)
{
  return (a2 & ~*(_QWORD *)(a1 + 40)) == 0 && (a2 & ~*(_QWORD *)(*(_QWORD *)(a1 + 32) + 368)) != 0;
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 504), a2);
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_3(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[4];
  NSObject *v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  _QWORD *v37;
  _QWORD v38[4];
  NSObject *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD v42[4];
  _QWORD v43[4];
  _QWORD v44[5];
  id v45;
  _QWORD v46[3];
  char v47;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v47 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__38;
  v44[4] = __Block_byref_object_dispose__38;
  v45 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v11 = (void *)a1[5];
  v12 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_177;
  v38[3] = &unk_1E2AD0040;
  v40 = v46;
  v41 = v44;
  v13 = v10;
  v39 = v13;
  objc_msgSend(v11, "validatePreconditions:", v38);
  PKTimeProfileBegin(0, CFSTR("under_13"));
  dispatch_group_enter(v13);
  objc_msgSend(*(id *)(a1[5] + 344), "targetDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v12;
  v34[1] = 3221225472;
  v34[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_3_182;
  v34[3] = &unk_1E2AD0088;
  v36 = &__block_literal_global_119;
  v37 = v42;
  v15 = v13;
  v35 = v15;
  objc_msgSend(v14, "familyMembersWithCompletion:", v34);
  v16 = a1[5];
  if (*(_BYTE *)(v16 + 296))
  {
    dispatch_group_enter(v15);
    v17 = *(void **)(a1[5] + 8);
    v30[0] = v12;
    v30[1] = 3221225472;
    v30[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_4;
    v30[3] = &unk_1E2AD0088;
    v32 = &__block_literal_global_119;
    v33 = v43;
    v31 = v15;
    objc_msgSend(v17, "familyMembersWithCompletion:", v30);

    v16 = a1[5];
  }
  v18 = a1[4];
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_5;
  v22[3] = &unk_1E2AD00B0;
  v19 = a1[6];
  v26 = v43;
  v27 = v19;
  v28 = v44;
  v29 = v46;
  v24 = v9;
  v25 = v42;
  v22[4] = v16;
  v23 = v8;
  v20 = v8;
  v21 = v9;
  dispatch_group_notify(v15, v18, v22);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v44, 8);

  _Block_object_dispose(v46, 8);
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_177(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_2_178(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = a2;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 1;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
      if (objc_msgSend(v8, "isMe", (_QWORD)v10))
      {
        if ((objc_msgSend(v8, "isChildAccount") & 1) != 0)
          break;
      }
      if (v4 == ++v7)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v6 = 2;
  }

  return v6;
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_3_182(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_4(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  PKLogFacilityTypeGetObject(6uLL);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKTimeProfileEnd(v2, CFSTR("under_13"), CFSTR("PKPaymentProvisioningController: iCloud Family Check"));

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 296))
    v5 = *(_QWORD *)(a1 + 64);
  else
    v5 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(v4 + 336) = *(_QWORD *)(*(_QWORD *)(v5 + 8) + 24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "paymentSetupSupportedInRegion") == 1;
  objc_msgSend(*(id *)(a1 + 32), "_updatePreflightRequirement:displayableError:", 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_7;
  v13[3] = &unk_1E2AD00D8;
  v8 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v14 = v9;
  v15 = v10;
  v16 = v6;
  v17 = v7;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v8, "registerDevice:", v13);

}

uint64_t __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 40), "_updatePreflightRequirement:displayableError:", 4, a3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, id, _QWORD);
  _QWORD *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  void (**v15)(id, id, _QWORD);
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD **)(a1 + 40);
  if (v8[42] == 1 || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "_updatePreflightRequirement:displayableError:", 2, 0);
    v7[2](v7, v6, 0);
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_9;
    v11[3] = &unk_1E2AD0100;
    v9 = *(id *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 40);
    v12 = v9;
    v13 = v10;
    v15 = v7;
    v14 = v6;
    objc_msgSend(v8, "cachedPaymentSetupProductModelWithCompletion:", v11);

  }
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3 && (*(_BYTE *)(a1 + 64) & 2) != 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = (id)objc_opt_class();
      v9 = 2112;
      v10 = v3;
      v6 = v8;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "%@ was not able to load cached products skipping preflight update. Non critical error: %@", (uint8_t *)&v7, 0x16u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_updatePreflightRequirement:displayableError:", 2, v3);
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), 0, v4);

}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_187(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD v33[5];
  NSObject *v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  NSObject *v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  NSObject *v42;
  _QWORD *v43;
  _QWORD v44[4];
  id v45;
  uint64_t v46;
  NSObject *v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD v50[5];
  id v51;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = dispatch_group_create();
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__38;
  v50[4] = __Block_byref_object_dispose__38;
  v51 = 0;
  v11 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    dispatch_group_enter(v10);
    v44[0] = v12;
    v44[1] = 3221225472;
    v44[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_2_188;
    v44[3] = &unk_1E2AD01A0;
    v13 = *(void **)(a1 + 40);
    v14 = *(id *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v45 = v14;
    v46 = v15;
    v16 = *(_QWORD *)(a1 + 56);
    v48 = v50;
    v49 = v16;
    v47 = v10;
    objc_msgSend(v13, "retrieveAllAvailableCredentials:", v44);

  }
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) != 0
    || (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
  {
    v17 = *(_QWORD **)(a1 + 40);
    if (v17[42] == 1 || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(v17, "_updatePreflightRequirement:displayableError:", 10, 0);
    }
    else
    {
      dispatch_group_enter(v10);
      v39[0] = v12;
      v39[1] = 3221225472;
      v39[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_5_193;
      v39[3] = &unk_1E2AD01C8;
      v18 = *(void **)(a1 + 40);
      v19 = *(id *)(a1 + 32);
      v43 = v50;
      v20 = *(_QWORD *)(a1 + 40);
      v40 = v19;
      v41 = v20;
      v42 = v10;
      objc_msgSend(v18, "updatePaymentSetupProductModelWithCompletionHandler:", v39);

    }
  }
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
  {
    v21 = *(_QWORD **)(a1 + 40);
    if (v21[42] == 1 || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(v21, "_updatePreflightRequirement:displayableError:", 64, 0);
    }
    else
    {
      dispatch_group_enter(v10);
      v35[0] = v12;
      v35[1] = 3221225472;
      v35[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_6_194;
      v35[3] = &unk_1E2ABE0F8;
      v22 = *(void **)(a1 + 40);
      v23 = *(id *)(a1 + 32);
      v24 = *(_QWORD *)(a1 + 40);
      v36 = v23;
      v37 = v24;
      v38 = v10;
      objc_msgSend(v22, "_updatePaymentSetupProductModelExtensionsWithCompletion:", v35);

    }
  }
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
  {
    if ((PKDisableDynamicSEAllocation() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_updatePreflightRequirement:displayableError:", 128, 0);
    }
    else
    {
      PKTimeProfileBegin(0, CFSTR("secure_element_snapshot"));
      dispatch_group_enter(v10);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 344), "targetDevice");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v12;
      v33[1] = 3221225472;
      v33[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_7_197;
      v33[3] = &unk_1E2AD01F0;
      v33[4] = *(_QWORD *)(a1 + 40);
      v34 = v10;
      objc_msgSend(v25, "currentSecureElementSnapshot:", v33);

    }
  }
  v26 = *(NSObject **)(a1 + 32);
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_9_200;
  block[3] = &unk_1E2AC5928;
  v31 = v9;
  v32 = v50;
  v30 = v8;
  v27 = v8;
  v28 = v9;
  dispatch_group_notify(v10, v26, block);

  _Block_object_dispose(v50, 8);
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_2_188(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v6 = a4;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "_doesDisplayableErrorConstitutePreflightFailure:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeAllObjects");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_3_189;
  v15[3] = &unk_1E2AD0178;
  v10 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v16 = v11;
  v17 = v12;
  v19 = *(_QWORD *)(a1 + 64);
  v14 = *(_OWORD *)(a1 + 48);
  v13 = (id)v14;
  v18 = v14;
  objc_msgSend(v10, "_associateCredentials:withCompletionHandler:", v6, v15);

}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_3_189(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_4_190;
  v7[3] = &unk_1E2AD0150;
  v2 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v11 = *(_QWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 48);
  v5 = (id)v6;
  v10 = v6;
  objc_msgSend(v2, "_updateAllAssoicatedCredentialsMetadataWithCompletion:", v7);

}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_4_190(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "count"))
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 336) == 1)
    {
      v2 = 5;
LABEL_7:
      PKDisplayableErrorForCommonType(v2, 0);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;

      goto LABEL_8;
    }
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v2 = 4;
      goto LABEL_7;
    }
  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 40), "_updatePreflightRequirement:displayableError:", 32, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_5_193(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_doesDisplayableErrorConstitutePreflightFailure:");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  objc_msgSend(*(id *)(a1 + 40), "_updatePreflightRequirement:displayableError:", 10, v2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_6_194(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "_updatePreflightRequirement:displayableError:", 64, 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_7_197(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_8_198;
  block[3] = &unk_1E2ABE0F8;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_8_198(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 392), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updatePreflightRequirement:displayableError:", 128, 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_9_200(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, BOOL))(a1[5] + 16))(a1[5], a1[4], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0);
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_10(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "removeAllObjects");
  PKLogFacilityTypeGetObject(6uLL);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKTimeProfileEnd(v2, CFSTR("preflight"), CFSTR("PKPaymentProvisioningController: Preflight Total"));

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 224) = 0;
}

- (void)_updatePreflightRequirement:(unint64_t)a3 displayableError:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PKPaymentProvisioningController *v13;
  id v14;
  unint64_t v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v8 = (void *)-[NSMutableArray copy](self->_preflighUpdateHandlers, "copy");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__PKPaymentProvisioningController__updatePreflightRequirement_displayableError___block_invoke;
  v11[3] = &unk_1E2AD0268;
  v12 = v6;
  v13 = self;
  v14 = v8;
  v15 = a3;
  v9 = v8;
  v10 = v6;
  dispatch_async(v7, v11);

}

uint64_t __80__PKPaymentProvisioningController__updatePreflightRequirement_displayableError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v2;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Error: PKPaymentProvisioningController Preflight encountered: %@", buf, 0xCu);
    }

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 368) |= *(_QWORD *)(a1 + 56);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *(id *)(a1 + 48);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_preflightRequirementsUpdated:displayableError:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 368), *(_QWORD *)(a1 + 32), (_QWORD)v10);
}

- (id)_doesDisplayableErrorConstitutePreflightFailure:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(v6, "code") == -1009)
      v7 = v4;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)performDeviceCheckInIfNeeded:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Requesting device check in", buf, 2u);
    }

    PKTimeProfileBegin(0, CFSTR("check_in"));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__PKPaymentProvisioningController_performDeviceCheckInIfNeeded___block_invoke;
    v9[3] = &unk_1E2ABE148;
    v10 = v4;
    objc_msgSend(v5, "performDeviceCheckInWithCompletion:", v9);

  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Target Device does not support check in", buf, 2u);
    }

    if (v4)
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __64__PKPaymentProvisioningController_performDeviceCheckInIfNeeded___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  char v14;

  v5 = a3;
  v6 = CFSTR("NO");
  if (a2)
    v6 = CFSTR("YES");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PKPaymentProvisioningController: Device check in success: %@ error: %@"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PKTimeProfileEnd(0, CFSTR("check_in"), v7);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKPaymentProvisioningController_performDeviceCheckInIfNeeded___block_invoke_2;
  block[3] = &unk_1E2ABDAB8;
  v9 = *(id *)(a1 + 32);
  v14 = a2;
  v12 = v5;
  v13 = v9;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __64__PKPaymentProvisioningController_performDeviceCheckInIfNeeded___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)retrieveRemoteCredentials:(id)a3
{
  id v4;
  PKPaymentRemoteCredentialsRequest *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  PKPaymentRemoteCredentialsRequest *v12;
  PKPaymentWebService *webService;
  uint64_t v14;
  NSMutableSet *tasks;
  void *v16;
  _QWORD v17[5];
  PKPaymentRemoteCredentialsRequest *v18;
  uint8_t *v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD block[4];
  id v25;
  id v26;
  _QWORD v27[4];
  PKPaymentRemoteCredentialsRequest *v28;

  v4 = a3;
  v5 = objc_alloc_init(PKPaymentRemoteCredentialsRequest);
  if (PKShowFakeRemoteCredentials())
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Delivering fake cards on file as requested by toggle", buf, 2u);
    }

    +[PKPaymentCredential fakeRemoteCredentials](PKPaymentCredential, "fakeRemoteCredentials");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke;
    v27[3] = &unk_1E2AD0290;
    v28 = v5;
    objc_msgSend(v7, "pk_objectsPassingTest:", v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_2;
    block[3] = &unk_1E2ABDA18;
    v10 = v4;
    v25 = v9;
    v26 = v10;
    v11 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v12 = v28;
  }
  else
  {
    *(_QWORD *)buf = 0;
    v21 = buf;
    v22 = 0x2020000000;
    v23 = 0;
    webService = self->_webService;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_3;
    v17[3] = &unk_1E2AD0358;
    v17[4] = self;
    v18 = (PKPaymentRemoteCredentialsRequest *)v4;
    v19 = buf;
    v14 = -[PKPaymentWebService remotePaymentCredentialsForRequest:completion:](webService, "remotePaymentCredentialsForRequest:completion:", v5, v17);
    *((_QWORD *)v21 + 3) = v14;
    tasks = self->_tasks;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](tasks, "addObject:", v16);

    _Block_object_dispose(buf, 8);
    v12 = v18;
  }

}

BOOL __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "credentialType"))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "credentialType");
    v5 = v4 == objc_msgSend(v3, "credentialType");
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

void __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v1 + 16))(v1, 1, 0, v2);

}

void __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a3;
  v8 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_4;
  v13[3] = &unk_1E2AD0330;
  v19 = a2;
  v9 = a1[4];
  v10 = (void *)a1[5];
  v14 = v8;
  v15 = v9;
  v16 = v7;
  v17 = v10;
  v18 = a1[6];
  v11 = v7;
  v12 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

void __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  PKAsyncUnaryOperationComposer *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  _QWORD *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 72);
  v27 = a1;
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    {

      v3 = v27;
LABEL_9:
      objc_msgSend(*(id *)(v3 + 40), "displayableErrorForError:", *(_QWORD *)(v3 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v27;
      v8 = *(_QWORD *)(v27 + 56);
      if (v8)
        (*(void (**)(uint64_t, _QWORD, void *, _QWORD))(v8 + 16))(v8, 0, v6, 0);

      goto LABEL_22;
    }
    a1 = v27;
  }
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PKWebServiceErrorDomain")))
  {
    v3 = v27;
    v5 = objc_msgSend(*(id *)(v27 + 32), "code");

    if (!v2)
    if (v5 == 1)
      goto LABEL_9;
  }
  else
  {

    v3 = v27;
    if (!v2)

  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(v3 + 40) + 344), "targetDevice");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  objc_msgSend(*(id *)(*(_QWORD *)(v3 + 40) + 344), "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "credentialTypesRequiringMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(*(id *)(v27 + 48), "credentials");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v38;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v17);
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_5;
        v31[3] = &unk_1E2AD02E0;
        v31[4] = v18;
        v19 = v13;
        v36 = v41;
        v20 = *(_QWORD *)(v27 + 40);
        v32 = v19;
        v33 = v20;
        v34 = v26;
        v35 = v9;
        -[PKAsyncUnaryOperationComposer addOperation:](v10, "addOperation:", v31);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_220;
  v28[3] = &unk_1E2AD0308;
  v22 = v9;
  v29 = v22;
  v30 = *(id *)(v27 + 56);
  v23 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v10, "evaluateWithInput:completion:", v21, v28);

  _Block_object_dispose(v41, 8);
  v7 = v27;
LABEL_22:
  v24 = *(void **)(*(_QWORD *)(v7 + 40) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 64) + 8) + 24), v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeObject:", v25);

}

void __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, id, _QWORD);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  const char *v23;
  const __CFString *v24;
  const __CFString *v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  id v29;
  void (**v30)(id, id, _QWORD);
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "pk_stringWithInteger:", objc_msgSend(*(id *)(a1 + 32), "credentialType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setRequiresMetadata:", objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8));
  objc_msgSend(*(id *)(a1 + 32), "setRank:", (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))++);
  v9 = objc_msgSend(*(id *)(a1 + 32), "credentialType");
  if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 296))
  {
    v10 = v9;
    if (objc_msgSend(*(id *)(a1 + 32), "cardType") != 2
      && objc_msgSend(*(id *)(a1 + 32), "cardType") != 3
      && (unint64_t)(v10 - 127) >= 2
      && v10 != 135)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(const __CFString **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v32 = v22;
        v23 = "Provisioning for alt account, remote credential was not supported type: %@";
LABEL_25:
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
        goto LABEL_26;
      }
      goto LABEL_26;
    }
  }
  PKLogFacilityTypeGetObject(6uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 296))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v32 = v12;
    v33 = 2112;
    v34 = v13;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Provisioning for alt account %@, remote credential supported: %@", buf, 0x16u);
  }

  if (!PKShouldDisplayRemoteCredentialWithStatus(*(void **)(a1 + 32)))
    goto LABEL_27;
  objc_msgSend(*(id *)(a1 + 32), "fidoProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(*(id *)(a1 + 64), "addObject:", *(_QWORD *)(a1 + 32));
LABEL_27:
    v7[2](v7, v6, 0);
    goto LABEL_28;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "credentialType") == 130
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(*(id *)(a1 + 56), "areUnifiedAccessPassesSupported") & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(const __CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v32 = v25;
      v23 = "Credential is Unified Access yet Target device doesn't support unified access. Credential: %@";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(const __CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v32 = v24;
      v23 = "Remote credential requires FIDO key check, but target device doesn't support that. Credential: %@";
      goto LABEL_25;
    }
LABEL_26:

    goto LABEL_27;
  }
  objc_msgSend(*(id *)(a1 + 32), "fidoProfile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(a1 + 56);
  objc_msgSend(v15, "relyingPartyIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accountHash");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "keyHash");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_218;
  v26[3] = &unk_1E2AD02B8;
  v20 = *(id *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 32);
  v27 = v20;
  v28 = v21;
  v30 = v7;
  v29 = v6;
  objc_msgSend(v16, "checkFidoKeyPresenceForRelyingParty:relyingPartyAccountHash:fidoKeyHash:completion:", v17, v18, v19, v26);

LABEL_28:
}

uint64_t __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_218(uint64_t a1, int a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_220(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_2_221;
  v2[3] = &unk_1E2ABE058;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

void __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_2_221(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Credentials retrieved: %@", (uint8_t *)&v6, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    (*(void (**)(uint64_t, uint64_t, _QWORD, void *))(v4 + 16))(v4, 1, 0, v5);

  }
}

- (id)_supportedFeatureIdentifierStrings
{
  _BOOL4 v3;
  NSSet *supportedFeatureIdentifierStrings;
  void *v6;
  void *v7;
  NSSet *v8;
  NSObject *v9;
  NSSet *allowedFeatureIdentifiers;
  NSSet *v11;
  NSSet *v12;
  int v13;
  NSSet *v14;
  __int16 v15;
  NSSet *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = +[PKWalletVisibility isWalletRestricted](PKWalletVisibility, "isWalletRestricted");
  supportedFeatureIdentifierStrings = self->_supportedFeatureIdentifierStrings;
  if (v3)
  {
    self->_supportedFeatureIdentifierStrings = 0;

    return 0;
  }
  if (!-[NSSet count](supportedFeatureIdentifierStrings, "count"))
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "supportedFeatureIdentifiersWithPaymentWebService:", self->_webService);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (NSSet *)objc_msgSend(v7, "mutableCopy");

      PKLogFacilityTypeGetObject(0xDuLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v8;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Target device supports features: %@", (uint8_t *)&v13, 0xCu);
      }

      if (!v8 || !self->_allowedFeatureIdentifiers)
        goto LABEL_15;
      -[NSSet intersectSet:](v8, "intersectSet:");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        allowedFeatureIdentifiers = self->_allowedFeatureIdentifiers;
        v13 = 138412546;
        v14 = allowedFeatureIdentifiers;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Allowed features: %@ resulted in filtered features to show: %@", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0xDuLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Target device does not implement supportedFeatureIdentifiersWithPaymentWebService:", (uint8_t *)&v13, 2u);
      }
      v8 = 0;
    }

LABEL_15:
    v11 = self->_supportedFeatureIdentifierStrings;
    self->_supportedFeatureIdentifierStrings = v8;
    v12 = v8;

    -[NSMutableSet removeAllObjects](self->_analyticsFeaturesToReport, "removeAllObjects");
    -[NSMutableSet unionSet:](self->_analyticsFeaturesToReport, "unionSet:", self->_supportedFeatureIdentifierStrings);

    -[PKPaymentProvisioningController _beginReportingIfNecessary](self, "_beginReportingIfNecessary");
  }
  return self->_supportedFeatureIdentifierStrings;
}

- (id)_supportedFeatureIdentifierStringsForAccountProvisioning
{
  _BOOL4 v3;
  NSSet *supportedFeatureIdentifierStringsForAccountProvisioning;
  void *v6;
  void *v7;
  NSSet *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSSet *allowedFeatureIdentifiers;
  NSSet *v13;
  int v14;
  NSSet *v15;
  __int16 v16;
  NSSet *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = +[PKWalletVisibility isWalletRestricted](PKWalletVisibility, "isWalletRestricted");
  supportedFeatureIdentifierStringsForAccountProvisioning = self->_supportedFeatureIdentifierStringsForAccountProvisioning;
  if (v3)
  {
    self->_supportedFeatureIdentifierStringsForAccountProvisioning = 0;

    return 0;
  }
  else
  {
    if (!-[NSSet count](supportedFeatureIdentifierStringsForAccountProvisioning, "count"))
    {
      -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService:", self->_webService);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (NSSet *)objc_msgSend(v7, "mutableCopy");

        PKLogFacilityTypeGetObject(0xDuLL);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 138412290;
          v15 = v8;
          _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Target device supports account provisioning features: %@", (uint8_t *)&v14, 0xCu);
        }
      }
      else
      {
        PKLogFacilityTypeGetObject(0xDuLL);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Target device does not implement supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService: Falling back to more restrictive _supportedFeatureIdentifierStrings.", (uint8_t *)&v14, 2u);
        }

        -[PKPaymentProvisioningController _supportedFeatureIdentifierStrings](self, "_supportedFeatureIdentifierStrings");
        v9 = objc_claimAutoreleasedReturnValue();
        v8 = -[NSObject mutableCopy](v9, "mutableCopy");
      }

      if (v8 && self->_allowedFeatureIdentifiers)
      {
        -[NSSet intersectSet:](v8, "intersectSet:");
        PKLogFacilityTypeGetObject(0xDuLL);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          allowedFeatureIdentifiers = self->_allowedFeatureIdentifiers;
          v14 = 138412546;
          v15 = allowedFeatureIdentifiers;
          v16 = 2112;
          v17 = v8;
          _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Allowed features: %@ resulted in filtered features to show: %@", (uint8_t *)&v14, 0x16u);
        }

      }
      v13 = self->_supportedFeatureIdentifierStringsForAccountProvisioning;
      self->_supportedFeatureIdentifierStringsForAccountProvisioning = v8;

    }
    return self->_supportedFeatureIdentifierStringsForAccountProvisioning;
  }
}

- (void)setAllowedFeatureIdentifiers:(id)a3
{
  NSSet *supportedFeatureIdentifierStrings;
  NSSet *supportedFeatureIdentifierStringsForAccountProvisioning;
  NSSet *v7;

  v7 = (NSSet *)a3;
  if (self->_allowedFeatureIdentifiers != v7)
  {
    objc_storeStrong((id *)&self->_allowedFeatureIdentifiers, a3);
    supportedFeatureIdentifierStrings = self->_supportedFeatureIdentifierStrings;
    self->_supportedFeatureIdentifierStrings = 0;

    supportedFeatureIdentifierStringsForAccountProvisioning = self->_supportedFeatureIdentifierStringsForAccountProvisioning;
    self->_supportedFeatureIdentifierStringsForAccountProvisioning = 0;

    -[NSMutableSet removeAllObjects](self->_analyticsFeaturesToReport, "removeAllObjects");
    -[NSMutableSet unionSet:](self->_analyticsFeaturesToReport, "unionSet:", v7);
    -[PKPaymentProvisioningController _beginReportingIfNecessary](self, "_beginReportingIfNecessary");
  }

}

- (void)retrieveAccountCredentials:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__PKPaymentProvisioningController_retrieveAccountCredentials___block_invoke;
    v8[3] = &unk_1E2ABDE28;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v5, "updatedAccountsForProvisioningWithCompletion:", v8);

  }
  else
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Target device does not implement updatedAccountsForProvisioningWithCompletion", v7, 2u);
    }

    if (v4)
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __62__PKPaymentProvisioningController_retrieveAccountCredentials___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKPaymentProvisioningController_retrieveAccountCredentials___block_invoke_2;
  block[3] = &unk_1E2ABE030;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __62__PKPaymentProvisioningController_retrieveAccountCredentials___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  PKAccountCredential *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_supportedFeatureIdentifierStringsForAccountProvisioning");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = a1;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        v10 = objc_msgSend(v9, "feature");
        PKFeatureIdentifierToString(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v2, "containsObject:", v11) & 1) != 0)
        {
          v12 = 0;
          if (v10 <= 5)
          {
            if (((1 << v10) & 0x36) != 0)
              goto LABEL_9;
            if (v10 == 3)
            {
              objc_msgSend(v9, "payLaterDetails");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v14, "hasProvisionedPass"))
              {

                goto LABEL_20;
              }
              v15 = objc_msgSend(*(id *)(v18 + 32), "hasPayLaterPass");

              if ((v15 & 1) != 0)
LABEL_20:
                v12 = 0;
              else
LABEL_9:
                v12 = -[PKAccountCredential initWithAccount:]([PKAccountCredential alloc], "initWithAccount:", v9);
            }
          }
          objc_msgSend(v3, "safelyAddObject:", v12);
          goto LABEL_13;
        }
        PKLogFacilityTypeGetObject(0xDuLL);
        v12 = (PKAccountCredential *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "accountIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v24 = v13;
          _os_log_impl(&dword_18FC92000, &v12->super.super, OS_LOG_TYPE_DEFAULT, "Account :%{public}@ not supported by device", buf, 0xCu);

        }
LABEL_13:

        ++v8;
      }
      while (v6 != v8);
      v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      v6 = v16;
    }
    while (v16);
  }

  v17 = *(_QWORD *)(v18 + 48);
  if (v17)
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v3);

}

- (id)_fetchOrCreateProductsForIdentifier:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  PKPaymentSetupProduct *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[PKPaymentSetupProductModel productsForFeatureIdentifier:](self->_paymentSetupProductModel, "productsForFeatureIdentifier:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (a3 == 4 || v6)
  {
    v10 = v5;
  }
  else
  {
    v7 = -[PKPaymentSetupProduct initWithFeatureIdentifier:]([PKPaymentSetupProduct alloc], "initWithFeatureIdentifier:", a3);
    -[PKPaymentProvisioningController _accountsForFeatureIdentifier:](self, "_accountsForFeatureIdentifier:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupProduct setAccounts:](v7, "setAccounts:", v8);
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentProvisioningController _filterPaymentSetupProducts:](self, "_filterPaymentSetupProducts:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
      -[PKPaymentSetupProductModel updatePaymentSetupProducts:](self->_paymentSetupProductModel, "updatePaymentSetupProducts:", v10);

  }
  return v10;
}

- (void)_setupFeatureApplications:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  PKPaymentProvisioningController *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v26 = self;
  -[PKPaymentProvisioningController _supportedFeatureIdentifierStrings](self, "_supportedFeatureIdentifierStrings");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v27)
  {
    v25 = *(_QWORD *)v45;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v45 != v25)
          objc_enumerationMutation(obj);
        v28 = v4;
        v5 = PKFeatureIdentifierFromString(*(void **)(*((_QWORD *)&v44 + 1) + 8 * v4));
        -[PKPaymentProvisioningController _fetchOrCreateProductsForIdentifier:](v26, "_fetchOrCreateProductsForIdentifier:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v29 = v6;
        v32 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
        if (v32)
        {
          v31 = *(_QWORD *)v41;
          do
          {
            v7 = 0;
            do
            {
              if (*(_QWORD *)v41 != v31)
                objc_enumerationMutation(v29);
              v33 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v7);
              v34 = v7;
              v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v36 = 0u;
              v37 = 0u;
              v38 = 0u;
              v39 = 0u;
              v8 = v30;
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
              if (v9)
              {
                v10 = v9;
                v11 = *(_QWORD *)v37;
                do
                {
                  for (i = 0; i != v10; ++i)
                  {
                    if (*(_QWORD *)v37 != v11)
                      objc_enumerationMutation(v8);
                    v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                    if (v5 != objc_msgSend(v13, "feature"))
                    {
                      PKLogFacilityTypeGetObject(0xDuLL);
                      v15 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v13, "applicationIdentifier");
                        v20 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543362;
                        v49 = v20;
                        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Application :%{public}@ not supported by device", buf, 0xCu);

                      }
                      goto LABEL_26;
                    }
                    v14 = objc_msgSend(v13, "applicationState");
                    PKLogFacilityTypeGetObject(0xDuLL);
                    v15 = objc_claimAutoreleasedReturnValue();
                    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
                    if (v14 > 0x10 || ((0x101F0u >> v14) & 1) == 0)
                    {
                      if (v16)
                      {
                        objc_msgSend(v13, "applicationIdentifier");
                        v18 = (void *)objc_claimAutoreleasedReturnValue();
                        PKFeatureApplicationStateToString(objc_msgSend(v13, "applicationState"));
                        v19 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543618;
                        v49 = v18;
                        v50 = 2114;
                        v51 = v19;
                        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Application: %{public}@ in state: %{public}@ not being offered", buf, 0x16u);

                      }
LABEL_26:

                      continue;
                    }
                    if (v16)
                    {
                      objc_msgSend(v13, "applicationIdentifier");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      PKFeatureApplicationStateToString(objc_msgSend(v13, "applicationState"));
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v49 = v21;
                      v50 = 2114;
                      v51 = v22;
                      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Application: %{public}@ in state: %{public}@ is being offered", buf, 0x16u);

                    }
                    objc_msgSend(v35, "addObject:", v13);
                  }
                  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
                }
                while (v10);
              }

              v23 = (void *)objc_msgSend(v35, "copy");
              objc_msgSend(v33, "setFeatureApplications:", v23);

              v7 = v34 + 1;
            }
            while (v34 + 1 != v32);
            v32 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
          }
          while (v32);
        }

        v4 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v27);
  }

}

- (void)_setupAccounts
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _BOOL4 preventsFeatureApplications;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[PKPaymentProvisioningController _supportedFeatureIdentifierStrings](self, "_supportedFeatureIdentifierStrings");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v33;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(obj);
        v21 = v3;
        v4 = PKFeatureIdentifierFromString(*(void **)(*((_QWORD *)&v32 + 1) + 8 * v3));
        -[PKPaymentProvisioningController _fetchOrCreateProductsForIdentifier:](self, "_fetchOrCreateProductsForIdentifier:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v22 = v5;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v6)
        {
          v7 = v6;
          v23 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v29 != v23)
                objc_enumerationMutation(v22);
              v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              -[PKPaymentProvisioningController _accountsForFeatureIdentifier:](self, "_accountsForFeatureIdentifier:", v4);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              preventsFeatureApplications = self->_preventsFeatureApplications;
              v24 = 0u;
              v25 = 0u;
              v26 = 0u;
              v27 = 0u;
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
              LOBYTE(v13) = preventsFeatureApplications;
              if (v12)
              {
                v14 = v12;
                v15 = *(_QWORD *)v25;
                do
                {
                  for (j = 0; j != v14; ++j)
                  {
                    if (*(_QWORD *)v25 != v15)
                      objc_enumerationMutation(v10);
                    if (!((v4 != 2) | v13 & 1))
                    {
                      v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
                      if (objc_msgSend(v17, "accessLevel") == 1)
                        v13 = objc_msgSend(v17, "isCoOwner") ^ 1;
                      else
                        LOBYTE(v13) = 0;
                    }
                  }
                  v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
                }
                while (v14);
              }
              objc_msgSend(v9, "setPreventsFeatureApplication:", v13 & 1);

            }
            v7 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          }
          while (v7);
        }

        v3 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v20);
  }

}

- (id)_accountsForFeatureIdentifier:(unint64_t)a3
{
  NSArray *accounts;
  _QWORD v5[5];

  accounts = self->_accounts;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PKPaymentProvisioningController__accountsForFeatureIdentifier___block_invoke;
  v5[3] = &__block_descriptor_40_e26_B32__0__PKAccount_8Q16_B24l;
  v5[4] = a3;
  -[NSArray pk_objectsPassingTest:](accounts, "pk_objectsPassingTest:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __65__PKPaymentProvisioningController__accountsForFeatureIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "feature") == *(_QWORD *)(a1 + 32))
  {
    v4 = objc_msgSend(v3, "state");
    if (v4 <= 5)
      v5 = (0xFu >> v4) & 1;
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_featureApplicationInValidStateToPresent:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "applicationState");
  return (v3 < 0x11) & (0x101F0u >> v3);
}

- (void)_updatePaymentSetupProductModelWithAvailability:(unint64_t)a3 activeConfigurations:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  id obj;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[16];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PKPaymentSetupProductModel setupProductsOfType:](self->_paymentSetupProductModel, "setupProductsOfType:", 10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v56 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "setProvisioningStatus:", 0);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v9);
  }
  if (a3 == 1)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v37 = v6;
    obj = v6;
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    if (!v41)
      goto LABEL_48;
    v39 = *(_QWORD *)v51;
    v13 = CFSTR("country");
    v40 = v7;
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v51 != v39)
          objc_enumerationMutation(obj);
        v42 = v14;
        v15 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v14);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v16 = v7;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v47;
          v44 = v16;
          do
          {
            v20 = 0;
            v45 = v18;
            do
            {
              if (*(_QWORD *)v47 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v20);
              objc_msgSend(v21, "clientInfo", v37);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v15, "target") == 1)
              {
                objc_msgSend(v15, "country");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectForKey:", v13);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = v23;
                v26 = v24;
                v27 = v26;
                if (v25 == v26)
                {

                }
                else
                {
                  if (!v25 || !v26)
                  {

LABEL_36:
LABEL_41:
                    v18 = v45;
                    goto LABEL_44;
                  }
                  v28 = objc_msgSend(v25, "caseInsensitiveCompare:", v26);

                  if (v28)
                    goto LABEL_36;
                }
                v29 = v13;
                objc_msgSend(v15, "state");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectForKey:", CFSTR("administrativeArea"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = v30;
                v33 = v31;
                if (v32 == v33)
                {

                  v13 = v29;
                  v16 = v44;
                  v18 = v45;
                }
                else
                {
                  v34 = v33;
                  if (!v32 || !v33)
                  {

                    v13 = v29;
                    v16 = v44;
                    goto LABEL_41;
                  }
                  v43 = objc_msgSend(v32, "caseInsensitiveCompare:", v33);

                  v13 = v29;
                  v16 = v44;
                  v18 = v45;
                  if (v43)
                    goto LABEL_44;
                }
                v35 = objc_msgSend(v15, "status");
                if (v35 > 0xC)
                  v36 = 0;
                else
                  v36 = qword_190455398[v35];
                objc_msgSend(v21, "setProvisioningStatus:", v36);
              }
LABEL_44:

              ++v20;
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
          }
          while (v18);
        }

        v14 = v42 + 1;
        v7 = v40;
      }
      while (v42 + 1 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      if (!v41)
      {
LABEL_48:

        v6 = v37;
        goto LABEL_49;
      }
    }
  }
  if (a3 == 2)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Proofing unavailable, removing identity products.", buf, 2u);
    }

    -[PKPaymentSetupProductModel removePaymentSetupProducts:](self->_paymentSetupProductModel, "removePaymentSetupProducts:", v7);
  }
LABEL_49:

}

- (void)retrieveAllAvailableCredentials:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSSet *allowedFeatureIdentifiers;
  void *v12;
  NSUInteger v13;
  unint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[5];
  NSObject *v35;
  _QWORD v36[4];
  int v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[3];
  char v41;
  _QWORD v42[5];
  id v43;

  v4 = a3;
  if (!v4)
    goto LABEL_14;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__38;
  v42[4] = __Block_byref_object_dispose__38;
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__38;
  v38[4] = __Block_byref_object_dispose__38;
  v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2810000000;
  v36[3] = "";
  v37 = 0;
  v5 = dispatch_group_create();
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  v8 = MEMORY[0x1E0C809B0];
  if ((v7 & 1) != 0)
  {
    dispatch_group_enter(v5);
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v8;
    v34[1] = 3221225472;
    v34[2] = __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke;
    v34[3] = &unk_1E2AC61B8;
    v34[4] = self;
    v35 = v5;
    objc_msgSend(v9, "retrievePendingProvisioningsWithType:completion:", 0, v34);

  }
  dispatch_group_enter(v5);
  PKTimeProfileBegin(0, CFSTR("acccount_creds"));
  v30[0] = v8;
  v30[1] = 3221225472;
  v30[2] = __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke_2;
  v30[3] = &unk_1E2AD03A0;
  v32 = v36;
  v33 = v42;
  v10 = v5;
  v31 = v10;
  -[PKPaymentProvisioningController retrieveAccountCredentials:](self, "retrieveAccountCredentials:", v30);
  allowedFeatureIdentifiers = self->_allowedFeatureIdentifiers;
  PKFeatureIdentifierToString(2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSSet containsObject:](allowedFeatureIdentifiers, "containsObject:", v12))
  {

    goto LABEL_8;
  }
  v13 = -[NSSet count](self->_allowedFeatureIdentifiers, "count");

  if (v13 > 1)
  {
LABEL_8:
    dispatch_group_enter(v10);
    PKTimeProfileBegin(0, CFSTR("remote_creds"));
    v24[0] = v8;
    v24[1] = 3221225472;
    v24[2] = __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke_3;
    v24[3] = &unk_1E2AD03C8;
    v26 = v36;
    v27 = v40;
    v28 = v38;
    v29 = v42;
    v25 = v10;
    -[PKPaymentProvisioningController retrieveRemoteCredentials:](self, "retrieveRemoteCredentials:", v24);

  }
  v14 = -[PKPaymentWebService paymentSetupSupportedInRegion](self->_webService, "paymentSetupSupportedInRegion");
  if (_os_feature_enabled_impl() && PKSafariCredentialProvisioningConsented() == 1 && v14 == 1)
  {
    dispatch_group_enter(v10);
    PKTimeProfileBegin(0, CFSTR("safari_creds"));
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke_4;
    v20[3] = &unk_1E2AD03F0;
    v22 = v36;
    v23 = v42;
    v21 = v10;
    +[PKSafariCredentialsUtilities retrieveSafariCredentials:](PKSafariCredentialsUtilities, "retrieveSafariCredentials:", v20);

  }
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke_5;
  v15[3] = &unk_1E2AD0418;
  v16 = v4;
  v17 = v40;
  v18 = v38;
  v19 = v42;
  dispatch_group_notify(v10, MEMORY[0x1E0C80D38], v15);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

LABEL_14:
}

void __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v3 = objc_msgSend(a2, "mutableCopy");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 288);
    *(_QWORD *)(v4 + 288) = v3;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke_2(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  v4 = a2;
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v4);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  PKLogFacilityTypeGetObject(6uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKTimeProfileEnd(v5, CFSTR("acccount_creds"), CFSTR("PKPaymentProvisioningController: Account credentials"));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  os_unfair_lock_s *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v7 = a3;
  v8 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  v9 = a4;
  os_unfair_lock_lock(v8);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v14 = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObjectsFromArray:", v9);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  PKLogFacilityTypeGetObject(6uLL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = PKTimeProfileEnd(v12, CFSTR("remote_creds"), CFSTR("PKPaymentProvisioningController: Remote credentials"));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  os_unfair_lock_s *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  v6 = a4;
  os_unfair_lock_lock(v5);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v6);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  PKLogFacilityTypeGetObject(6uLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PKTimeProfileEnd(v7, CFSTR("safari_creds"), CFSTR("PKPaymentProvisioningController: Safari credentials"));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke_5(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = a1[4];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
  v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v4 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "copy");
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3, v4);

}

- (void)_updateAllAssoicatedCredentialsMetadataWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD);
  id obj;
  NSObject *group;
  _QWORD block[4];
  void (**v27)(_QWORD);
  _QWORD v28[4];
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[16];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  if (PKShowFakeRemoteCredentials())
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Skipping card on file metadata request because using fake credentials", buf, 2u);
    }

    goto LABEL_25;
  }
  if (!-[NSMutableArray count](self->_associatedCredentials, "count"))
  {
LABEL_25:
    if (v4)
      v4[2](v4);
    goto LABEL_27;
  }
  v23 = v4;
  v6 = MEMORY[0x1E0C80D38];
  group = dispatch_group_create();
  -[PKPaymentWebService context](self->_webService, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "credentialTypesRequiringMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(obj);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "integerValue");
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v15 = self->_associatedCredentials;
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v31;
          while (2)
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v31 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "remoteCredential");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v20;
              if (v20 && objc_msgSend(v20, "credentialType") == v14)
              {

                dispatch_group_enter(group);
                v15 = objc_alloc_init(PKPaymentRemoteCredentialsRequest);
                -[NSMutableArray setIncludeMetadata:](v15, "setIncludeMetadata:", 1);
                -[NSMutableArray setExcludeDeviceInfo:](v15, "setExcludeDeviceInfo:", 1);
                -[NSMutableArray setCredentialType:](v15, "setCredentialType:", v14);
                -[NSMutableArray setTimeoutOverride:](v15, "setTimeoutOverride:", 10.0);
                v28[0] = MEMORY[0x1E0C809B0];
                v28[1] = 3221225472;
                v28[2] = __89__PKPaymentProvisioningController__updateAllAssoicatedCredentialsMetadataWithCompletion___block_invoke;
                v28[3] = &unk_1E2AD0440;
                v29 = group;
                -[PKPaymentProvisioningController updateRemoteCredentials:withCompletionHandler:](self, "updateRemoteCredentials:withCompletionHandler:", v15, v28);

                goto LABEL_22;
              }

            }
            v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
            if (v17)
              continue;
            break;
          }
        }
LABEL_22:

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v11);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PKPaymentProvisioningController__updateAllAssoicatedCredentialsMetadataWithCompletion___block_invoke_2;
  block[3] = &unk_1E2ABD9A0;
  v4 = v23;
  v27 = v23;
  v22 = (void *)MEMORY[0x1E0C80D38];
  dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

LABEL_27:
}

void __89__PKPaymentProvisioningController__updateAllAssoicatedCredentialsMetadataWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __89__PKPaymentProvisioningController__updateAllAssoicatedCredentialsMetadataWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateRemoteCredentials:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  PKPaymentWebService *webService;
  id v9;
  id v10;
  uint64_t v11;
  NSMutableSet *tasks;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, void *, void *);
  void *v17;
  id v18;
  PKPaymentProvisioningController *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  PKTimeProfileBegin(0, CFSTR("update_creds"));
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  webService = self->_webService;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __81__PKPaymentProvisioningController_updateRemoteCredentials_withCompletionHandler___block_invoke;
  v17 = &unk_1E2AD04B8;
  v9 = v6;
  v18 = v9;
  v19 = self;
  v10 = v7;
  v20 = v10;
  v21 = &v22;
  v11 = -[PKPaymentWebService remotePaymentCredentialsUpdateForRequest:completion:](webService, "remotePaymentCredentialsUpdateForRequest:completion:", v9, &v14);
  v23[3] = v11;
  tasks = self->_tasks;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11, v14, v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](tasks, "addObject:", v13);

  _Block_object_dispose(&v22, 8);
}

void __81__PKPaymentProvisioningController_updateRemoteCredentials_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v7 = a3;
  v8 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PKPaymentProvisioningController_updateRemoteCredentials_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E2AD0490;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(a1 + 48);
  v15 = v9;
  v16 = v10;
  v21 = a2;
  v17 = v8;
  v18 = v7;
  v19 = v11;
  v20 = *(_QWORD *)(a1 + 56);
  v12 = v7;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __81__PKPaymentProvisioningController_updateRemoteCredentials_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  PKPaymentRemoteCredential *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  _QWORD v59[5];
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
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
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v1 = a1;
  v82 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "credentialType");
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(v1 + 32), "productIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v51 = v1;
  v4 = *(id *)(*(_QWORD *)(v1 + 40) + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
  v56 = v3;
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v75;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v75 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * v8), "remoteCredential");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v1 = (uint64_t)v9;
        if (v9)
        {
          v10 = objc_msgSend(v9, "credentialType");
          v11 = v10 == v2 || v10 == 0;
          v12 = v11;
          if (v12 != 1 || v53 == 0)
          {
            if (!v12)
              goto LABEL_20;
LABEL_19:
            objc_msgSend(v3, "addObject:", v1);
            goto LABEL_20;
          }
          objc_msgSend((id)v1, "productIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v53);

          v3 = v56;
          if ((v15 & 1) != 0)
            goto LABEL_19;
        }
LABEL_20:

        ++v8;
      }
      while (v6 != v8);
      v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
      v6 = v16;
    }
    while (v16);
  }

  v17 = v51;
  v18 = *(_QWORD *)(v51 + 80);
  if (!v18)
  {
    objc_msgSend(*(id *)(v51 + 48), "domain");
    v1 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v1, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    {

LABEL_33:
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v21 = v3;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v71;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v71 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "remoteCredential");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setRequiresMetadata:", 0);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
        }
        while (v23);
      }

      objc_msgSend(*(id *)(v51 + 40), "displayableErrorForError:", *(_QWORD *)(v51 + 48));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(v51 + 64) + 16))();
      v3 = v56;
      goto LABEL_68;
    }
  }
  objc_msgSend(*(id *)(v51 + 48), "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEqualToString:", CFSTR("PKWebServiceErrorDomain")))
  {
    v20 = objc_msgSend(*(id *)(v51 + 48), "code");

    if (!v18)
    v11 = v20 == 1;
    v3 = v56;
    if (v11)
      goto LABEL_33;
  }
  else
  {

    if (!v18)
  }
  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v55 = objc_msgSend(*(id *)(*(_QWORD *)(v51 + 40) + 40), "count");
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  objc_msgSend(*(id *)(v51 + 56), "credentials");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
  if (v54)
  {
    v52 = *(_QWORD *)v67;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v67 != v52)
          objc_enumerationMutation(obj);
        v58 = v28;
        v29 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v28);
        objc_msgSend(v29, "PKURLForKey:", CFSTR("passURL"), v48);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "PKStringForKey:", CFSTR("identifier"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v32 = v3;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v63;
          v57 = v29;
LABEL_50:
          v36 = 0;
          while (1)
          {
            if (*(_QWORD *)v63 != v35)
              objc_enumerationMutation(v32);
            v37 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v36);
            objc_msgSend(v37, "passURL");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v30, "isEqual:", v38))
              break;
            objc_msgSend(v37, "identifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v31, "isEqual:", v39);

            if ((v40 & 1) != 0)
              goto LABEL_59;
            if (v34 == ++v36)
            {
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
              v3 = v56;
              v29 = v57;
              v17 = v51;
              if (v34)
                goto LABEL_50;
              goto LABEL_57;
            }
          }

LABEL_59:
          v29 = v57;
          objc_msgSend(v37, "updateWithDictionary:", v57);
          v41 = v37;

          v3 = v56;
          v17 = v51;
          if (!v41)
            goto LABEL_62;
          if (PKShouldDisplayRemoteCredentialWithStatus(v41))
          {
            objc_msgSend(v32, "removeObjectIdenticalTo:", v41);
            objc_msgSend(v48, "addObject:", v41);
          }
        }
        else
        {
LABEL_57:

LABEL_62:
          v41 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", v29);
          if (PKShouldDisplayRemoteCredentialWithStatus(v41))
            objc_msgSend(v49, "addObject:", v41);
          -[PKPaymentRemoteCredential setRequiresMetadata:](v41, "setRequiresMetadata:", 0);
          -[PKPaymentRemoteCredential setRank:](v41, "setRank:", v55++);
        }
        -[PKPaymentRemoteCredential setRequiresMetadata:](v41, "setRequiresMetadata:", objc_msgSend(*(id *)(v17 + 32), "includeMetadata") ^ 1);

        v28 = v58 + 1;
      }
      while (v58 + 1 != v54);
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    }
    while (v54);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(v17 + 40) + 40), "removeObjectsInArray:", v3);
  v42 = *(void **)(v17 + 40);
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __81__PKPaymentProvisioningController_updateRemoteCredentials_withCompletionHandler___block_invoke_3;
  v59[3] = &unk_1E2AD0468;
  v59[4] = v42;
  v43 = *(id *)(v17 + 64);
  v60 = v48;
  v61 = v43;
  v44 = v48;
  v45 = v42;
  v27 = v49;
  objc_msgSend(v45, "_associateCredentials:withCompletionHandler:", v49, v59);

LABEL_68:
  v46 = *(void **)(*(_QWORD *)(v17 + 40) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v17 + 72) + 8) + 24));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "removeObject:", v47);

}

void __81__PKPaymentProvisioningController_updateRemoteCredentials_withCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_metadataUpdatedOnCredentials");
  PKLogFacilityTypeGetObject(6uLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = PKTimeProfileEnd(v8, CFSTR("update_creds"), CFSTR("PKPaymentProvisioningController: Remote Credentials Update"));

  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
  {
    if (!v7 && (_DWORD)a2)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v12);
      v10 = *(_QWORD *)(a1 + 48);
    }
    v11 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    (*(void (**)(uint64_t, uint64_t, id, void *))(v10 + 16))(v10, a2, v7, v11);

  }
}

- (void)associateCredentials:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__PKPaymentProvisioningController_associateCredentials_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E2AD04E0;
  v9 = v6;
  v7 = v6;
  -[PKPaymentProvisioningController _associateCredentials:withCompletionHandler:](self, "_associateCredentials:withCompletionHandler:", a3, v8);

}

uint64_t __78__PKPaymentProvisioningController_associateCredentials_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (void)_associateCredentials:(id)a3 withCompletionHandler:(id)a4
{
  NSObject *v6;
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id obj;
  void *v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  _QWORD *v30;
  uint8_t *v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  void *v35;
  PKPaymentProvisioningController *v36;
  NSObject *v37;
  _QWORD *v38;
  uint8_t *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD v50[4];
  uint8_t v51[4];
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v22 = a4;
  PKTimeProfileBegin(0, CFSTR("associate_creds"));
  if (!PKPreferenceBOOLforKey(CFSTR("PKHideMyCardsOnFileKey")))
  {
    v7 = MEMORY[0x1E0C80D38];
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x2020000000;
    v50[3] = 0;
    *(_QWORD *)buf = 0;
    v45 = buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__38;
    v48 = __Block_byref_object_dispose__38;
    v49 = 0;
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = -[PKPaymentProvisioningController _hasSetupConfiguration](self, "_hasSetupConfiguration");
    -[NSMutableArray pk_arrayBySafelyApplyingBlock:](self->_associatedCredentials, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_261);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = dispatch_group_create();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v21;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
    if (!v10)
      goto LABEL_22;
    v11 = *(_QWORD *)v41;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (!v8
          || -[PKPaymentProvisioningController _credentialIsValidForSetupConfiguration:](self, "_credentialIsValidForSetupConfiguration:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i)))
        {
          objc_msgSend(v13, "remoteCredential", v21);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "serialNumber");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {

            goto LABEL_15;
          }
          objc_msgSend(v13, "localPassCredential");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "serialNumber");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
LABEL_15:
            if (objc_msgSend(v25, "containsObject:", v15))
            {
              PKLogFacilityTypeGetObject(6uLL);
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v51 = 138412546;
                v52 = v13;
                v53 = 2112;
                v54 = v15;
                _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController: Skipping association of credential because one with a matching serial number is already associated. Skipped: %@, Serial: %@", v51, 0x16u);
              }
              goto LABEL_19;
            }
          }
          dispatch_group_enter(v9);
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke_262;
          v32[3] = &unk_1E2AD0598;
          v18 = MEMORY[0x1E0C80D38];
          v19 = MEMORY[0x1E0C80D38];
          v33 = v18;
          v34 = v23;
          v35 = v13;
          v36 = self;
          v38 = v50;
          v39 = buf;
          v37 = v9;
          -[PKPaymentProvisioningController _associateCredential:withCompletionHandler:](self, "_associateCredential:withCompletionHandler:", v13, v32);

          v17 = v33;
LABEL_19:

          continue;
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
      if (!v10)
      {
LABEL_22:

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke_4;
        block[3] = &unk_1E2AD05C0;
        block[4] = self;
        v27 = v23;
        v29 = v22;
        v28 = obj;
        v30 = v50;
        v31 = buf;
        v20 = v23;
        dispatch_group_notify(v9, MEMORY[0x1E0C80D38], block);

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(v50, 8);

        goto LABEL_23;
      }
    }
  }
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "WARNING: Hiding cards on file", buf, 2u);
  }

  (*((void (**)(id, uint64_t, _QWORD, _QWORD))v22 + 2))(v22, 1, 0, 0);
LABEL_23:

}

id __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "remoteCredential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "localPassCredential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serialNumber");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

void __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke_262(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  __int128 v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E2AD0570;
  v16 = a2;
  v6 = *(NSObject **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v9 = *(_OWORD *)(a1 + 64);
  v12 = *(_OWORD *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 80);
  v13 = v5;
  v7 = (id)v9;
  v14 = v9;
  v8 = v5;
  dispatch_async(v6, block);

}

void __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  void *v5;

  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "_updateCredentialWithPaymentPass:completion:", MEMORY[0x1E0C809B0], 3221225472, __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke_3, &unk_1E2AD0548, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  }
  else
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v5 = *(void **)(v2 + 40);
    v3 = (id *)(v2 + 40);
    v4 = v5;
    if (!v5)
      v4 = *(void **)(a1 + 56);
    objc_storeStrong(v3, v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCredentialWithPaymentPassAssets:completion:", *(_QWORD *)(a1 + 40), 0);
}

void __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  PKLogFacilityTypeGetObject(6uLL);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKTimeProfileEnd(v2, CFSTR("associate_creds"), CFSTR("PKPaymentProvisioningController: Associate credentials"));

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 48), "count");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (BOOL)_hasSetupConfiguration
{
  NSUInteger v3;

  if (-[NSArray count](self->_allowedPaymentNetworks, "count")
    || -[NSSet count](self->_allowedFeatureIdentifiers, "count")
    || -[NSSet count](self->_allowedProductIdentifiers, "count")
    || -[NSSet count](self->_requiredTransitNetworkIdentifiers, "count")
    || (v3 = -[NSArray count](self->_allowedCardTypes, "count")) != 0)
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)_credentialIsValidForSetupConfiguration:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *allowedCardTypes;
  void *v13;
  _BOOL4 v14;

  v4 = a3;
  if (-[NSArray count](self->_allowedPaymentNetworks, "count"))
  {
    PKPaymentNetworkNameForPaymentCredentialType(objc_msgSend(v4, "credentialType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSArray containsObject:](self->_allowedPaymentNetworks, "containsObject:", v5);

    if (!v6)
      goto LABEL_12;
  }
  if (-[NSSet count](self->_allowedFeatureIdentifiers, "count"))
  {
    if (!objc_msgSend(v4, "isAccountCredential"))
      goto LABEL_12;
    objc_msgSend(v4, "accountCredential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKFeatureIdentifierToString(objc_msgSend(v8, "feature"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v8) = -[NSSet containsObject:](self->_allowedFeatureIdentifiers, "containsObject:", v9);
    if (!(_DWORD)v8)
      goto LABEL_12;
  }
  if (-[NSSet count](self->_allowedProductIdentifiers, "count")
    && objc_msgSend(v4, "isRemoteCredential")
    && (objc_msgSend(v4, "remoteCredential"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "productIdentifier"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        LODWORD(v10) = -[NSSet containsObject:](self->_allowedProductIdentifiers, "containsObject:", v11),
        v11,
        !(_DWORD)v10))
  {
LABEL_12:
    LOBYTE(v14) = 0;
  }
  else if (!-[NSArray count](self->_allowedCardTypes, "count")
         || (allowedCardTypes = self->_allowedCardTypes,
             objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "cardType")),
             v13 = (void *)objc_claimAutoreleasedReturnValue(),
             v14 = -[NSArray containsObject:](allowedCardTypes, "containsObject:", v13),
             v13,
             v14))
  {
    LOBYTE(v14) = 1;
  }

  return v14;
}

- (void)_associateCredential:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  void (**v12)(id, uint64_t, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (v7)
  {
    if ((PKShowFakeRemoteCredentials() & 1) != 0
      || (objc_msgSend(v6, "isAccountCredential") & 1) != 0
      || (objc_msgSend(v6, "isPeerPaymentCredential") & 1) != 0
      || (objc_msgSend(v6, "isShareableCredential") & 1) != 0
      || (objc_msgSend(v6, "isLocalAppletSubcredentialPassCredential") & 1) != 0
      || (objc_msgSend(v6, "isHomeKeyCredential") & 1) != 0
      || objc_msgSend(v6, "isRemoteCredential")
      && (objc_msgSend(v6, "remoteCredential"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "status"),
          v8,
          v9 != 2))
    {
      v7[2](v7, 1, 0);
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __78__PKPaymentProvisioningController__associateCredential_withCompletionHandler___block_invoke;
      v10[3] = &unk_1E2ACB900;
      v10[4] = self;
      v11 = v6;
      v12 = v7;
      -[PKPaymentProvisioningController _queryRequirementsForCredential:completion:](self, "_queryRequirementsForCredential:completion:", v11, v10);

    }
  }

}

void __78__PKPaymentProvisioningController__associateCredential_withCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v7 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__PKPaymentProvisioningController__associateCredential_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E2ABDAE0;
    v11 = v6;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "_queryEligibilityForCredential:completion:", v11, v10);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController: failed to associate credential %@, returning error: %@ from requirements", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __78__PKPaymentProvisioningController__associateCredential_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController: failed to associate credential %@, returning error: %@ from eligibility", (uint8_t *)&v7, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_updateCredentialWithPaymentPass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  PKPaymentWebService *webService;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isRemoteCredential"))
  {
    objc_msgSend(v6, "remoteCredential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "passURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "paymentPass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (!objc_msgSend(v6, "isAccountCredential"))
  {
    if (objc_msgSend(v6, "isLocalPassCredential"))
    {
      objc_msgSend(v6, "localPassCredential");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "paymentPass");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v6, "isLocalAppletSubcredentialPassCredential"))
        goto LABEL_23;
      objc_msgSend(v6, "localAppletSubcredentialPassCredential");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "paymentPass");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v16;
    v9 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v6, "accountCredential");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "passDetailsResponse");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "type");
  if (v13 == 2)
  {
    objc_msgSend(v12, "passURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(v11, "payLaterDetails");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "associatedPassURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      goto LABEL_15;
    }
    v15 = v17;
    v14 = v15;
  }
  else
  {
    if (v13 != 1)
    {
      v9 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v11, "creditDetails");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "associatedPassURL");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v15;
LABEL_15:

LABEL_17:
  objc_msgSend(v8, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  if (!v10)
  {
    if (v9)
    {
      objc_initWeak(location, self);
      webService = self->_webService;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __79__PKPaymentProvisioningController__updateCredentialWithPaymentPass_completion___block_invoke;
      v23[3] = &unk_1E2AD0610;
      objc_copyWeak(&v26, location);
      v24 = v6;
      v25 = v7;
      -[PKPaymentWebService passAtURL:completion:](webService, "passAtURL:completion:", v9, v23);

      objc_destroyWeak(&v26);
      objc_destroyWeak(location);
LABEL_31:
      v10 = 0;
      goto LABEL_32;
    }
LABEL_23:
    objc_msgSend(v6, "remoteCredential");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (!v19 || objc_msgSend(v19, "status") != 2)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v6;
        _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Error: Unable to locate pass or a pass URL when attempting to update credential: %@", (uint8_t *)location, 0xCu);
      }

    }
    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);

    v9 = 0;
    goto LABEL_31;
  }
  if (v7)
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
LABEL_32:

}

void __79__PKPaymentProvisioningController__updateCredentialWithPaymentPass_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11[2];

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKPaymentProvisioningController__updateCredentialWithPaymentPass_completion___block_invoke_2;
  block[3] = &unk_1E2AD05E8;
  objc_copyWeak(v11, a1 + 6);
  v11[1] = a2;
  v8 = v5;
  v9 = a1[4];
  v10 = a1[5];
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v11);
}

void __79__PKPaymentProvisioningController__updateCredentialWithPaymentPass_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 64) == 1 && *(_QWORD *)(a1 + 32))
  {
    v10 = WeakRetained;
    v4 = objc_msgSend(*(id *)(a1 + 40), "isRemoteCredential");
    v5 = *(void **)(a1 + 40);
    if (v4)
    {
      objc_msgSend(v5, "remoteCredential");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = objc_msgSend(v5, "isAccountCredential");
      v3 = v10;
      if (!v7)
        goto LABEL_9;
      objc_msgSend(*(id *)(a1 + 40), "accountCredential");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v6;
    objc_msgSend(v6, "setPaymentPass:", *(_QWORD *)(a1 + 32));

    v3 = v10;
  }
LABEL_9:
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
  {
    v11 = v3;
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, *(_QWORD *)(a1 + 32));
    v3 = v11;
  }

}

- (void)_updateCredentialWithPaymentPassAssets:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "isRemoteCredential"))
  {
    objc_msgSend(v6, "remoteCredential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isAccountCredential"))
  {
    objc_msgSend(v6, "accountCredential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isLocalPassCredential"))
  {
    objc_msgSend(v6, "localPassCredential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isLocalAppletSubcredentialPassCredential"))
      goto LABEL_13;
    objc_msgSend(v6, "localAppletSubcredentialPassCredential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v8, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "secureElementIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "remoteAssetsDownloadedForSEIDs:", v12);

    if (v13)
    {
      if (v7)
        v7[2](v7);
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __85__PKPaymentProvisioningController__updateCredentialWithPaymentPassAssets_completion___block_invoke;
      v14[3] = &unk_1E2ABD9A0;
      v15 = v7;
      -[PKPaymentProvisioningController _downloadRemoteAssetsForPaymentPass:paymentCredential:completion:](self, "_downloadRemoteAssetsForPaymentPass:paymentCredential:completion:", v10, v6, v14);

    }
    goto LABEL_17;
  }
LABEL_13:
  if (v7)
    v7[2](v7);
LABEL_17:

}

void __85__PKPaymentProvisioningController__updateCredentialWithPaymentPassAssets_completion___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKPaymentProvisioningController__updateCredentialWithPaymentPassAssets_completion___block_invoke_2;
  block[3] = &unk_1E2ABD9A0;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __85__PKPaymentProvisioningController__updateCredentialWithPaymentPassAssets_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_downloadRemoteAssetsForPaymentPass:(id)a3 paymentCredential:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "secureElementIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKDownloadRemoteAssetConfiguration configurationWithSEIDs:](PKDownloadRemoteAssetConfiguration, "configurationWithSEIDs:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIgnoreRequiredAssetDownloadFailures:", 1);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __100__PKPaymentProvisioningController__downloadRemoteAssetsForPaymentPass_paymentCredential_completion___block_invoke;
  v16[3] = &unk_1E2AD0638;
  objc_copyWeak(&v19, &location);
  v14 = v9;
  v17 = v14;
  v15 = v10;
  v18 = v15;
  objc_msgSend(v8, "downloadRemoteAssetsWithConfiguration:completion:", v13, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __100__PKPaymentProvisioningController__downloadRemoteAssetsForPaymentPass_paymentCredential_completion___block_invoke(uint64_t a1, int a2, void *a3, float a4)
{
  id v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  _DWORD v12[2];
  __int16 v13;
  double v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109634;
    v12[1] = a2;
    v13 = 2048;
    v14 = a4;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Download of remote assets called completion handler with finished=%i progress=%f error=%@", (uint8_t *)v12, 0x1Cu);
  }

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v10 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "_informDelegatesOfPaymentPassUpdateOnCredential:", *(_QWORD *)(a1 + 32));
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(void))(v11 + 16))();

  }
}

- (void)_informDelegatesOfPaymentPassUpdateOnCredential:(id)a3
{
  id v4;
  os_unfair_lock_s *p_delegatesLock;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  -[NSHashTable allObjects](self->_delegates, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_delegatesLock);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__PKPaymentProvisioningController__informDelegatesOfPaymentPassUpdateOnCredential___block_invoke;
  v9[3] = &unk_1E2ABE0D0;
  v10 = v6;
  v11 = v4;
  v7 = v4;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __83__PKPaymentProvisioningController__informDelegatesOfPaymentPassUpdateOnCredential___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "paymentPassUpdatedOnCredential:", *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_metadataUpdatedOnCredentials
{
  os_unfair_lock_s *p_delegatesLock;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;

  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  -[NSHashTable allObjects](self->_delegates, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_delegatesLock);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKPaymentProvisioningController__metadataUpdatedOnCredentials__block_invoke;
  block[3] = &unk_1E2ABE120;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __64__PKPaymentProvisioningController__metadataUpdatedOnCredentials__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "metadataUpdatedOnCredentials", (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)_preflightRequirementsUpdated:(unint64_t)a3 displayableError:(id)a4
{
  id v6;
  os_unfair_lock_s *p_delegatesLock;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  unint64_t v14;

  v6 = a4;
  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  -[NSHashTable allObjects](self->_delegates, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_delegatesLock);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKPaymentProvisioningController__preflightRequirementsUpdated_displayableError___block_invoke;
  block[3] = &unk_1E2AC5810;
  v13 = v6;
  v14 = a3;
  v12 = v8;
  v9 = v6;
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __82__PKPaymentProvisioningController__preflightRequirementsUpdated_displayableError___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "preflightRequirementsUpdated:displayableError:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_informDelegatesOfAccountsUpdated
{
  os_unfair_lock_s *p_delegatesLock;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPaymentProvisioningController *v8;

  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  -[NSHashTable allObjects](self->_delegates, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_delegatesLock);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PKPaymentProvisioningController__informDelegatesOfAccountsUpdated__block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __68__PKPaymentProvisioningController__informDelegatesOfAccountsUpdated__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "provisioningControllerUpdatedAccounts:", *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)cachedPaymentSetupProductModelWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  PKPaymentAvailableProductsRequest *v12;
  PKPaymentWebService *webService;
  void *v14;
  void *v15;
  char v16;
  PKPaymentBrowseableBankAppsRequest *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD block[5];
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  char v29;
  _QWORD v30[5];
  NSObject *v31;
  _QWORD v32[4];
  NSObject *v33;
  _QWORD *v34;
  _QWORD v35[4];
  NSObject *v36;
  _QWORD *v37;
  _QWORD v38[4];
  NSObject *v39;
  _QWORD *v40;
  _QWORD v41[4];
  id v42;
  _QWORD aBlock[4];
  NSObject *v44;
  _QWORD *v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[5];
  id v55;

  v4 = a3;
  v5 = MEMORY[0x1E0C80D38];
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__38;
  v54[4] = __Block_byref_object_dispose__38;
  v55 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__38;
  v52[4] = __Block_byref_object_dispose__38;
  v53 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__38;
  v50[4] = __Block_byref_object_dispose__38;
  v51 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__38;
  v48[4] = __Block_byref_object_dispose__38;
  v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__38;
  v46[4] = __Block_byref_object_dispose__38;
  v47 = 0;
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  objc_msgSend(v6, "deviceRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  PKTimeProfileBegin(0, CFSTR("cached_products"));
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2AD0660;
  v45 = v46;
  v10 = v8;
  v44 = v10;
  v11 = _Block_copy(aBlock);
  v12 = objc_alloc_init(PKPaymentAvailableProductsRequest);
  -[PKWebServiceRequest setCachePolicyOverride:](v12, "setCachePolicyOverride:", 3);
  if (self->_isProvisioningForAltAccount)
    -[PKPaymentAvailableProductsRequest setContext:](v12, "setContext:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "productsWithRequest:completion:", v12, v11);
  }
  else
  {
    webService = self->_webService;
    v41[0] = v9;
    v41[1] = 3221225472;
    v41[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_2;
    v41[3] = &unk_1E2AD0688;
    v42 = v11;
    -[PKPaymentWebService availableProductsWithRequest:completion:](webService, "availableProductsWithRequest:completion:", v12, v41);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_group_enter(v10);
    PKTimeProfileBegin(0, CFSTR("cached_features"));
    v38[0] = v9;
    v38[1] = 3221225472;
    v38[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_3;
    v38[3] = &unk_1E2AC35A8;
    v40 = v52;
    v39 = v10;
    objc_msgSend(v6, "cachedFeatureApplicationsForProvisioningWithCompletion:", v38);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_group_enter(v10);
    PKTimeProfileBegin(0, CFSTR("cached_accounts"));
    v35[0] = v9;
    v35[1] = 3221225472;
    v35[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_4;
    v35[3] = &unk_1E2AC35A8;
    v37 = v50;
    v36 = v10;
    objc_msgSend(v6, "accountsWithCompletion:", v35);

  }
  -[PKPaymentWebService context](self->_webService, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "browseProvisioningBankAppsEnabledForRegion:", v7);

  if (!PKPaymentSetupMergeProductsPartnersAPIEnabled() && ((v16 & 1) != 0 || PKForceBrowseBankPartners()))
  {
    dispatch_group_enter(v10);
    PKTimeProfileBegin(0, CFSTR("cached_browse_banks"));
    v17 = -[PKPaymentBrowseableBankAppsRequest initWithRegion:]([PKPaymentBrowseableBankAppsRequest alloc], "initWithRegion:", v7);
    -[PKWebServiceRequest setCachePolicyOverride:](v17, "setCachePolicyOverride:", 3);
    v32[0] = v9;
    v32[1] = 3221225472;
    v32[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_5;
    v32[3] = &unk_1E2AD06B0;
    v34 = v48;
    v33 = v10;
    -[PKPaymentProvisioningController _browsableBanksWithRequest:completion:](self, "_browsableBanksWithRequest:completion:", v17, v32);

  }
  dispatch_group_enter(v10);
  v30[0] = v9;
  v30[1] = 3221225472;
  v30[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_6;
  v30[3] = &unk_1E2AD06D8;
  v30[4] = self;
  v18 = v10;
  v31 = v18;
  -[PKPaymentProvisioningController _retrievePendingCarKeys:](self, "_retrievePendingCarKeys:", v30);
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_7;
  block[3] = &unk_1E2AD0728;
  v24 = v52;
  v25 = v50;
  v26 = v48;
  v27 = v46;
  block[4] = self;
  v23 = v21;
  v29 = v16;
  v28 = v54;
  v19 = v21;
  v20 = (void *)MEMORY[0x1E0C80D38];
  dispatch_group_notify(v18, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(v52, 8);

  _Block_object_dispose(v54, 8);
}

void __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKTimeProfileEnd(v4, CFSTR("cached_products"), CFSTR("PKPaymentProvisioningController: Cached Products"));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKTimeProfileEnd(v4, CFSTR("cached_features"), CFSTR("PKPaymentProvisioningController: Cached Feature Applications"));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKTimeProfileEnd(v4, CFSTR("cached_accounts"), CFSTR("PKPaymentProvisioningController: Cached Accounts"));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_5(uint64_t a1, int a2, id obj)
{
  void *v5;
  id v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v7 = obj;
  PKLogFacilityTypeGetObject(6uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKTimeProfileEnd(v5, CFSTR("cached_browse_banks"), CFSTR("PKPaymentProvisioningController: Cached Browse Banks"));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 280), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_7(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint8_t v21[16];
  _QWORD v22[5];
  _QWORD v23[4];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupFeatureApplications:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 241) = 1;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 32), "_setupAccounts");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 240) = 1;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v2 = *(_QWORD **)(a1 + 32);
    v3 = (void *)v2[53];
    objc_msgSend(v2, "_filterPaymentSetupProducts:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updatePaymentSetupProducts:", v4);

  }
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v5)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
    objc_msgSend(v5, "JSONObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_8;
    v23[3] = &unk_1E2AD0700;
    v24 = *(_QWORD *)(a1 + 32);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_9;
    v22[3] = &unk_1E2AD0700;
    v22[4] = v24;
    objc_msgSend(v6, "updateWithPaymentSetupProductsResponse:productsFilter:sectionsFilter:", v7, v23, v22);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Not updating _paymentSetupProductModel since the available products are nil _availableProductsResponse", v21, 2u);
    }

  }
  v9 = *(_QWORD **)(a1 + 32);
  if (v9[35])
  {
    v10 = (void *)v9[53];
    v25[0] = v9[35];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_filterPaymentSetupProducts:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updatePaymentSetupProducts:", v12);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "addCarKeyCategory");
  }
  if (*(_QWORD *)(a1 + 40))
  {
    if (PKPaymentSetupMergeProductsPartnersAPIEnabled()
      || !*(_BYTE *)(a1 + 88)
      || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "allSections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "allSetupProducts");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15)
        {
LABEL_27:
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          return;
        }
      }
      else
      {

      }
      PKLogFacilityTypeGetObject(6uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        v17 = "Products required but not found in the cache";
LABEL_24:
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, v17, v21, 2u);
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        v17 = "Browse banks required but not found in the cache";
        goto LABEL_24;
      }
    }

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
    {
      PKDisplayableErrorForCommonType(0, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

    }
    goto LABEL_27;
  }
}

uint64_t __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_filterPaymentSetupProducts:", a2);
}

uint64_t __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_filteredPaymentSetupProductSections:", a2);
}

- (void)updatePaymentSetupProductModelWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  PKPaymentAvailableProductsRequest *v13;
  PKPaymentAvailableProductsRequest *v14;
  PKPaymentWebService *webService;
  void *v16;
  PKPaymentWebService *v17;
  void *v18;
  void *v19;
  char v20;
  PKPaymentBrowseableBankAppsRequest *v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[4];
  NSObject *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD v39[4];
  NSObject *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD v43[4];
  NSObject *v44;
  _QWORD *v45;
  _QWORD v46[4];
  NSObject *v47;
  _QWORD *v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  char v53;
  _QWORD aBlock[5];
  NSObject *v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD v59[5];
  id v60;
  _QWORD v61[5];
  id v62;
  _QWORD v63[4];
  _QWORD v64[5];
  id v65;
  _QWORD v66[5];
  id v67;
  _QWORD v68[5];
  id v69;
  _QWORD v70[5];
  id v71;
  _QWORD v72[3];
  char v73;

  v4 = a3;
  v5 = MEMORY[0x1E0C80D38];
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x2020000000;
  v73 = 1;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3032000000;
  v70[3] = __Block_byref_object_copy__38;
  v70[4] = __Block_byref_object_dispose__38;
  v71 = 0;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy__38;
  v68[4] = __Block_byref_object_dispose__38;
  v69 = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__38;
  v66[4] = __Block_byref_object_dispose__38;
  v67 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy__38;
  v64[4] = __Block_byref_object_dispose__38;
  v65 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v63[3] = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = __Block_byref_object_copy__38;
  v61[4] = __Block_byref_object_dispose__38;
  v62 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__38;
  v59[4] = __Block_byref_object_dispose__38;
  v60 = 0;
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_group_create();
  PKTimeProfileBegin(0, CFSTR("products"));
  dispatch_group_enter(v8);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E2AD0750;
  v56 = v72;
  v57 = v70;
  aBlock[4] = self;
  v58 = v59;
  v9 = v8;
  v55 = v9;
  v10 = _Block_copy(aBlock);
  -[PKPaymentWebService supportedRegionFeatureOfType:didFailOSVersionRequirements:](self->_webService, "supportedRegionFeatureOfType:didFailOSVersionRequirements:", 14, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (self->_fetchProductsFromStaticDataSource && v11)
  {
    v53 = 0;
    objc_msgSend(v11, "createProductsRequestWithIsFetchBlocked:", &v53);
    v13 = (PKPaymentAvailableProductsRequest *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v53 || !v13)
    {
      (*((void (**)(void *, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
      goto LABEL_13;
    }
    -[PKWebServiceRequest addDiagnosticReason:](v13, "addDiagnosticReason:", CFSTR("Provisioning"));
    webService = self->_webService;
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_2;
    v51[3] = &unk_1E2AD0688;
    v52 = v10;
    -[PKPaymentWebService availableCommonProductsWithRequest:completion:](webService, "availableCommonProductsWithRequest:completion:", v14, v51);
    v16 = v52;
  }
  else
  {
    v14 = objc_alloc_init(PKPaymentAvailableProductsRequest);
    -[PKWebServiceRequest addDiagnosticReason:](v14, "addDiagnosticReason:", CFSTR("Provisioning"));
    if (self->_isProvisioningForAltAccount)
      -[PKPaymentAvailableProductsRequest setContext:](v14, "setContext:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "productsWithRequest:completion:", v14, v10);
      goto LABEL_13;
    }
    v17 = self->_webService;
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_3;
    v49[3] = &unk_1E2AD0688;
    v50 = v10;
    -[PKPaymentWebService availableProductsWithRequest:completion:](v17, "availableProductsWithRequest:completion:", v14, v49);
    v16 = v50;
  }

LABEL_13:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (self->_preflightedApplications)
    {
      objc_msgSend(v6, "featureApplicationsForProvisioningWithCompletion:", 0);
    }
    else
    {
      dispatch_group_enter(v9);
      PKTimeProfileBegin(0, CFSTR("features"));
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_4;
      v46[3] = &unk_1E2AC35A8;
      v48 = v68;
      v47 = v9;
      objc_msgSend(v6, "featureApplicationsForProvisioningWithCompletion:", v46);

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (self->_preflightedAccounts)
    {
      objc_msgSend(v6, "updatedAccountsForProvisioningWithCompletion:", 0);
    }
    else
    {
      dispatch_group_enter(v9);
      PKTimeProfileBegin(0, CFSTR("accounts"));
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_5;
      v43[3] = &unk_1E2AD0778;
      v45 = v66;
      v44 = v9;
      objc_msgSend(v6, "updatedAccountsForProvisioningWithCompletion:", v43);

    }
  }
  if (_os_feature_enabled_impl())
  {
    dispatch_group_enter(v9);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_6;
    v39[3] = &unk_1E2AD07A0;
    v41 = v63;
    v42 = v61;
    v40 = v9;
    -[PKPaymentProvisioningController _identityConfigurationWithCompletion:](self, "_identityConfigurationWithCompletion:", v39);

  }
  -[PKPaymentWebService context](self->_webService, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "browseProvisioningBankAppsEnabledForRegion:", v7);

  if (!PKPaymentSetupMergeProductsPartnersAPIEnabled() && ((v20 & 1) != 0 || PKForceBrowseBankPartners()))
  {
    dispatch_group_enter(v9);
    PKTimeProfileBegin(0, CFSTR("browse_banks"));
    v21 = -[PKPaymentBrowseableBankAppsRequest initWithRegion:]([PKPaymentBrowseableBankAppsRequest alloc], "initWithRegion:", v7);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_7;
    v34[3] = &unk_1E2AD07C8;
    v36 = v72;
    v37 = v64;
    v38 = v70;
    v35 = v9;
    -[PKPaymentProvisioningController _browsableBanksWithRequest:completion:](self, "_browsableBanksWithRequest:completion:", v21, v34);

  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_8;
  v24[3] = &unk_1E2AD0818;
  v26 = v68;
  v27 = v66;
  v28 = v64;
  v29 = v59;
  v30 = v63;
  v31 = v61;
  v24[4] = self;
  v25 = v4;
  v32 = v72;
  v33 = v70;
  v22 = v4;
  v23 = (void *)MEMORY[0x1E0C80D38];
  dispatch_group_notify(v9, MEMORY[0x1E0C80D38], v24);

  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v61, 8);

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v64, 8);

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(v68, 8);

  _Block_object_dispose(v70, 8);
  _Block_object_dispose(v72, 8);

}

void __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;

  v18 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v5)
    v8 = 1;
  else
    v8 = *(_BYTE *)(v7 + 24) == 0;
  v9 = !v8;
  *(_BYTE *)(v7 + 24) = v9;
  if (v5)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    if (!v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "displayableErrorForError:", v5);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v13 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;
      goto LABEL_13;
    }
    v12 = v11;
  }
  else
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = v18;
  }
  v13 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v12;
LABEL_13:

  PKLogFacilityTypeGetObject(6uLL);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = PKTimeProfileEnd(v16, CFSTR("products"), CFSTR("PKPaymentProvisioningController: Products"));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKTimeProfileEnd(v4, CFSTR("features"), CFSTR("PKPaymentProvisioningController: Feature Applications"));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "arrayByAddingObjectsFromArray:");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  PKLogFacilityTypeGetObject(6uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PKTimeProfileEnd(v6, CFSTR("accounts"), CFSTR("PKPaymentProvisioningController: Accounts"));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_6(uint64_t a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_7(uint64_t a1, char a2, id obj, void *a4)
{
  uint64_t v7;
  char v8;
  id v9;
  id v10;
  uint64_t v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = a2;
  else
    v8 = 0;
  *(_BYTE *)(v7 + 24) = v8;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v9 = obj;
  v10 = a4;
  v17 = v10;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v11 + 40);
  v12 = (id *)(v11 + 40);
  v13 = v14;
  if (v14)
    v10 = v13;
  objc_storeStrong(v12, v10);
  PKLogFacilityTypeGetObject(6uLL);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = PKTimeProfileEnd(v15, CFSTR("browse_banks"), CFSTR("PKPaymentProvisioningController: Browse Banks"));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_8(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint8_t v16[8];
  _QWORD v17[4];
  id v18;
  _QWORD aBlock[4];
  id v20;
  id location;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupFeatureApplications:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 241) = 1;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 240) = 1;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "count"))
    objc_msgSend(*(id *)(a1 + 32), "_setupAccounts");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v2 = *(_QWORD **)(a1 + 32);
    v3 = (void *)v2[53];
    objc_msgSend(v2, "_filterPaymentSetupProducts:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updatePaymentSetupProducts:", v4);

  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_9;
  aBlock[3] = &unk_1E2AD07F0;
  objc_copyWeak(&v20, &location);
  v6 = _Block_copy(aBlock);
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v7)
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
    objc_msgSend(v7, "JSONObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_10;
    v17[3] = &unk_1E2AD07F0;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v8, "updateWithPaymentSetupProductsResponse:productsFilter:sectionsFilter:", v9, v17, v6);

    objc_destroyWeak(&v18);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Adding manual entry section because _availableProductsResponse is nil", v16, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "addManualEntrySection:", v6);
  }
  if (_os_feature_enabled_impl())
    objc_msgSend(*(id *)(a1 + 32), "_updatePaymentSetupProductModelWithAvailability:activeConfigurations:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  v11 = *(_QWORD **)(a1 + 32);
  if (v11[35])
  {
    v12 = (void *)v11[53];
    v22[0] = v11[35];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_filterPaymentSetupProducts:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updatePaymentSetupProducts:", v14);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "addCarKeyCategory");
  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v15 + 16))(v15, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

id __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_9(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_filteredPaymentSetupProductSections:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_filterPaymentSetupProducts:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_identityConfigurationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  CIDVUIProofingFlowManager *v15;
  CIDVUIProofingFlowManager *identityProofingManager;
  NSObject *v17;
  CIDVUIProofingFlowManager *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  uint8_t buf[8];
  _QWORD handler[4];
  id v26;
  _QWORD aBlock[4];
  NSObject *v28;
  id v29;
  uint64_t *v30;
  _QWORD *v31;
  _QWORD v32[3];
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  dispatch_source_t v39;

  v4 = a3;
  v5 = MEMORY[0x1E0C80D38];
  v6 = MEMORY[0x1E0C80D38];
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__38;
  v38 = __Block_byref_object_dispose__38;
  v39 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v5);
  v7 = v35[5];
  v8 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  PKTimeProfileBegin(0, CFSTR("identity"));
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPaymentProvisioningController__identityConfigurationWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2AD0840;
  v10 = v5;
  v28 = v5;
  v30 = &v34;
  v31 = v32;
  v11 = v4;
  v29 = v11;
  v12 = _Block_copy(aBlock);
  v13 = v35[5];
  handler[0] = v9;
  handler[1] = 3221225472;
  handler[2] = __72__PKPaymentProvisioningController__identityConfigurationWithCompletion___block_invoke_2;
  handler[3] = &unk_1E2ABD9A0;
  v14 = v12;
  v26 = v14;
  dispatch_source_set_event_handler(v13, handler);
  dispatch_resume((dispatch_object_t)v35[5]);
  if (!self->_identityProofingManager)
  {
    v15 = (CIDVUIProofingFlowManager *)objc_msgSend(objc_alloc((Class)getCIDVUIProofingFlowManagerClass[0]()), "initWithDelegate:", self);
    identityProofingManager = self->_identityProofingManager;
    self->_identityProofingManager = v15;

  }
  PKLogFacilityTypeGetObject(6uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Requesting proofingFlowAvailabilityWithCompletionHandler", buf, 2u);
  }

  v18 = self->_identityProofingManager;
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __72__PKPaymentProvisioningController__identityConfigurationWithCompletion___block_invoke_330;
  v21[3] = &unk_1E2ACB1B8;
  v19 = v5;
  v22 = v5;
  v20 = v14;
  v23 = v20;
  -[CIDVUIProofingFlowManager proofingFlowAvailability:](v18, "proofingFlowAvailability:", v21);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);

}

void __72__PKPaymentProvisioningController__identityConfigurationWithCompletion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v5 = *(NSObject **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v5)
  {
    dispatch_source_cancel(v5);
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  v8 = *(_QWORD *)(a1[7] + 8);
  if (!*(_BYTE *)(v8 + 24))
  {
    *(_BYTE *)(v8 + 24) = 1;
    PKLogFacilityTypeGetObject(6uLL);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = PKTimeProfileEnd(v9, CFSTR("identity"), CFSTR("PKPaymentProvisioningController: Identity"));

    v11 = a1[5];
    if (v11)
      (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v12);
  }

}

uint64_t __72__PKPaymentProvisioningController__identityConfigurationWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Timeout occured for proofingFlowAvailabilityWithCompletionHandler", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__PKPaymentProvisioningController__identityConfigurationWithCompletion___block_invoke_330(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v7 = a3;
  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__PKPaymentProvisioningController__identityConfigurationWithCompletion___block_invoke_2_331;
  v12[3] = &unk_1E2AD0868;
  v13 = v8;
  v9 = *(NSObject **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v16 = a2;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

uint64_t __72__PKPaymentProvisioningController__identityConfigurationWithCompletion___block_invoke_2_331(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Proofing availability could not complete with error %@", (uint8_t *)&v5, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_applyIdentityConfiguration:(unint64_t)a3 activeConfigurations:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__PKPaymentProvisioningController__applyIdentityConfiguration_activeConfigurations_completion___block_invoke;
  v12[3] = &unk_1E2ABE080;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a3;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __95__PKPaymentProvisioningController__applyIdentityConfiguration_activeConfigurations_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_updatePaymentSetupProductModelWithAvailability:activeConfigurations:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 88));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "provisioningControllerUpdatedProducts:", *(_QWORD *)(a1 + 32), (_QWORD)v10);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

- (void)_updatePaymentSetupProductModelExtensionsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  PKTimeProfileBegin(0, CFSTR("provisioning_extensions"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91__PKPaymentProvisioningController__updatePaymentSetupProductModelExtensionsWithCompletion___block_invoke;
  v6[3] = &unk_1E2ABDE50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PKPaymentProvisioningController provisioningExtensionProductsWithCompletionHandler:](self, "provisioningExtensionProductsWithCompletionHandler:", v6);

}

void __91__PKPaymentProvisioningController__updatePaymentSetupProductModelExtensionsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_filterPaymentSetupProducts:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "updatePaymentSetupProducts:");
  PKLogFacilityTypeGetObject(6uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKTimeProfileEnd(v3, CFSTR("provisioning_extensions"), CFSTR("PKPaymentProvisioningController: Provisioning Extensions"));

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

- (void)_browsableBanksWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  PKPaymentWebService *webService;
  _QWORD v12[5];
  void (**v13)(id, uint64_t, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, uint64_t, void *, _QWORD))a4;
  if (PKMockBrowseBankPartners())
  {
    -[PKPaymentProvisioningController _mockBrowseBanksResponse](self, "_mockBrowseBanksResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v8, "browseableBankApps");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 1, v10, 0);

    }
  }
  else
  {
    webService = self->_webService;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__PKPaymentProvisioningController__browsableBanksWithRequest_completion___block_invoke;
    v12[3] = &unk_1E2AD08B8;
    v12[4] = self;
    v13 = v7;
    -[PKPaymentWebService browseableBankAppsWithRequest:completion:](webService, "browseableBankAppsWithRequest:completion:", v6, v12);

  }
}

void __73__PKPaymentProvisioningController__browsableBanksWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;

  v7 = a3;
  v8 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PKPaymentProvisioningController__browsableBanksWithRequest_completion___block_invoke_2;
  block[3] = &unk_1E2AD0890;
  v18 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v14 = v8;
  v15 = v9;
  v16 = v7;
  v17 = v10;
  v11 = v7;
  v12 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __73__PKPaymentProvisioningController__browsableBanksWithRequest_completion___block_invoke_2(uint64_t a1)
{
  BOOL v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 64) == 1 && *(_QWORD *)(a1 + 32) == 0;
  v3 = v2;
  if (v2)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "displayableErrorForError:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
  {
    v7 = v4;
    objc_msgSend(*(id *)(a1 + 48), "browseableBankApps");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *, void *))(v5 + 16))(v5, v3, v6, v7);

    v4 = v7;
  }

}

- (void)_retrievePendingCarKeys:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__PKPaymentProvisioningController__retrievePendingCarKeys___block_invoke;
    v6[3] = &unk_1E2ABDE50;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "retrievePendingProvisioningsWithType:completion:", CFSTR("CarKey"), v6);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __59__PKPaymentProvisioningController__retrievePendingCarKeys___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKPaymentSetupProduct *v4;
  PKPaymentSetupProductConfiguration *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  PKCarKeyTerminalPairingCredential *v19;
  void *v20;
  PKCarKeyTerminalPairingCredential *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  PKPaymentSetupProductConfiguration *v27;
  uint64_t v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v28 = a1;
    v4 = objc_alloc_init(PKPaymentSetupProduct);
    v5 = objc_alloc_init(PKPaymentSetupProductConfiguration);
    -[PKPaymentSetupProductConfiguration setType:](v5, "setType:", 11);
    -[PKPaymentSetupProductConfiguration setProductIdentifier:](v5, "setProductIdentifier:", CFSTR("carKey"));
    -[PKPaymentSetupProductConfiguration setState:](v5, "setState:", 1);
    v27 = v5;
    -[PKPaymentSetupProduct setConfiguration:](v4, "setConfiguration:", v5);
    PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_CARKEY"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupProduct setDisplayName:](v4, "setDisplayName:", v6);

    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v29 = v3;
    obj = v3;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v12, "configuration");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setReferralSource:", 5);
          objc_msgSend(v12, "createdAt");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          PKMediumDateString(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "vehicleName");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v16)
            v18 = (void *)v16;
          else
            v18 = v15;
          objc_msgSend(v13, "setLocalizedDescription:", v18);

          v19 = [PKCarKeyTerminalPairingCredential alloc];
          -[PKPaymentSetupProduct productIdentifier](v4, "productIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[PKCarKeyTerminalPairingCredential initWithConfiguration:productIdentifier:](v19, "initWithConfiguration:productIdentifier:", v13, v20);

          objc_msgSend(v7, "addObject:", v21);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v9);
    }

    v22 = *(_QWORD *)(v28 + 32);
    v23 = *(void **)(v22 + 384);
    *(_QWORD *)(v22 + 384) = v7;
    v24 = v7;

    (*(void (**)(void))(*(_QWORD *)(v28 + 40) + 16))();
    v3 = v29;
  }
  else
  {
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(void **)(v25 + 384);
    *(_QWORD *)(v25 + 384) = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)localCredentials
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "pk_safelyAddObjectsFromArray:", self->_pendingCarKeyCredentials);
  return v3;
}

- (BOOL)_isExtensionSupported:(id)a3 usingUnsupportedProvisioningExtensions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4)
  {
    v6 = a4;
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKDictionaryForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "version");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "PKArrayContaining:forKey:", objc_opt_class(), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "containsObject:", v9) & 1) != 0
        || objc_msgSend(v10, "containsObject:", 0))
      {
        PKLogFacilityTypeGetObject(6uLL);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 138412546;
          v15 = v7;
          v16 = 2112;
          v17 = v9;
          _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Extension: %@ with version: %@ is unsupported", (uint8_t *)&v14, 0x16u);
        }

        v12 = 0;
      }
      else
      {
        v12 = 1;
      }

    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)provisioningExtensionProductsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E2ABE058;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  id v22;
  void *context;
  PKAsyncUnaryOperationComposer *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x19400CFE8]();
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.PassKit.issuer-provisioning"), *MEMORY[0x1E0CB2A28]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ENTITLEMENT:%@"), CFSTR("com.apple.developer.payment-pass-provisioning"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "targetDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleAccountInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isManagedAppleAccount");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ENTITLEMENT:%@"), CFSTR("com.apple.developer.contactless-payment-pass-provisioning.maids"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v7);

  }
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionsWithMatchingAttributes:error:", v2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "targetDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Apple Watch"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unsupportedProvisioningExtensions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_isExtensionSupported:usingUnsupportedProvisioningExtensions:", v20, v14))
        {
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_2;
          v27[3] = &unk_1E2AD0930;
          v27[4] = v20;
          v28 = v11;
          -[PKAsyncUnaryOperationComposer addOperation:](v24, "addOperation:", v27);
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v17);
  }

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_2_354;
  v25[3] = &unk_1E2AD0978;
  v26 = *(id *)(a1 + 40);
  v22 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v24, "evaluateWithInput:completion:", v21, v25);

  objc_autoreleasePoolPop(context);
}

void __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  char v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_3;
  v20[3] = &unk_1E2AD0908;
  v12 = v7;
  v13 = *(_QWORD *)(a1 + 32);
  v21 = v12;
  v22 = v13;
  v25 = *(_BYTE *)(a1 + 40);
  v14 = v8;
  v23 = v14;
  v15 = v9;
  v24 = v15;
  +[PKIssuerProvisioningExtensionConsumerCoordinator beginWithExtension:completion:](PKIssuerProvisioningExtensionConsumerCoordinator, "beginWithExtension:completion:", v10, v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_352;
    v18[3] = &unk_1E2ABE120;
    v19 = v16;
    objc_msgSend(v12, "addCancelAction:", v18);

  }
}

void __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  char v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || (objc_msgSend(v7, "isCanceled") & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) != 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("YES");
      if (!*(_BYTE *)(a1 + 64))
        v12 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v25 = v10;
      v26 = 2112;
      v27 = v12;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Did not create product for extension with identifier: %@ extension executation cancelled isRemote: %@", buf, 0x16u);

    }
    objc_msgSend(v6, "invalidate");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = (uint64_t)v14;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Querying status for extension with identifier: %@", buf, 0xCu);

    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_349;
    v18[3] = &unk_1E2AD08E0;
    v15 = v6;
    v23 = *(_BYTE *)(a1 + 64);
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(void **)(a1 + 48);
    v19 = v15;
    v20 = v16;
    v21 = v17;
    v22 = *(id *)(a1 + 56);
    objc_msgSend(v15, "statusWithCompletion:", v18);

  }
}

void __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_349(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  const __CFString *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (!*(_BYTE *)(a1 + 64))
  {
    if ((objc_msgSend(v3, "passEntriesAvailable") & 1) != 0)
      goto LABEL_5;
    if (!*(_BYTE *)(a1 + 64))
      goto LABEL_13;
  }
  if (!objc_msgSend(v3, "remotePassEntriesAvailable"))
  {
LABEL_13:
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "description");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = *(unsigned __int8 *)(a1 + 64);
      v17 = 138412802;
      v18 = v12;
      if (v15)
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Did not create product for extension with identifier: %@ status: [%@] isRemote: %@", (uint8_t *)&v17, 0x20u);

    }
    goto LABEL_18;
  }
LABEL_5:
  +[PKPaymentSetupProduct productForIssuerProvisioningExtension:withStatus:](PKPaymentSetupProduct, "productForIssuerProvisioningExtension:withStatus:", *(_QWORD *)(a1 + 40), v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_13;
  v5 = v4;
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[NSObject displayName](v5, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject productIdentifier](v5, "productIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = *(unsigned __int8 *)(a1 + 64);
    v17 = 138412802;
    v18 = v7;
    if (v10)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Created product for extension named: %@ identifier: %@ isRemote: %@", (uint8_t *)&v17, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
LABEL_18:

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_352(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_2_354(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_357);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_4;
  v7[3] = &unk_1E2ABDA18;
  v5 = *(id *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_3_355(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    v7 = 0;
  }
  else if (v5)
  {
    if (v6)
      v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_mockBrowseBanksResponse
{
  void *v2;
  void *v3;

  objc_msgSend(CFSTR("{\"availablePartners\":[{\"displayName\":\"Boon.\",\"searchTerms\":[\"Boon\"],\"associatedStoreIdentifiers\":[1042647367],\"appLaunchURLScheme\":\"boon\",\"appLaunchURLPath\":\"applewalletlist\",\"cameraCaptureSupport\":[],\"inAppProvisioningSupport\":[\"prepaid\"]},{\"displayName\":\"UniCredit\",\"searchTerms\":[\"UniCredit\",\"monhey\"],\"associatedStoreIdentifiers\":[1119177197],\"appLaunchURLScheme\":\"mhyuc\",\"appLaunchURLPath\":\"appleWalletList\",\"cameraCaptureSupport\":[\"credit\",\"debit\",\"prepaid\"],\"inAppProvisioningSupport\":[]},{\"displayName\":\"Allianz\",\"searchTerms\":[\"Allianz\",\"Allianz Prime\"],\"associatedStoreIdentifiers\":[1282314742],\"appLaunchURLScheme\":\"allianz\",\"appLaunchURLPath\":\"applewalletlist\",\"cameraCaptureSupport\":[],\"inAppProvisioningSupport\":[\"prepaid\"]},{\"displayName\":\"ICCREA\",\"searchTerms\":[\"Banca Credito Cooperativo\",\"ICCREA\",\"Istituto Centrale delle Casse Rurali ed Artigiane\"],\"associatedStoreIdentifiers\":[],\"appLaunchURLScheme\":\"\",\"appLaunchURLPath\":\"\",\"cameraCaptureSupport\":[\"credit\",\"debit\",\"prepaid\"],\"inAppProvisioningSupport\":[]},{\"displayName\":\"Widiba\",\"searchTerms\":[\"Monte dei Paschi di Siena\",\"Widiba\"],\"associatedStoreIdentifiers\":[915429623],\"appLaunchURLScheme\":\"widiba\",\"appLaunchURLPath\":\"applewalletlist\",\"cameraCaptureSupport\":[\"debit\"],\"inAppProvisioningSupport\":[]},{\"displayName\":\"TIM\",\"searchTerms\":[\"Banca Sella\",\"Hype\",\"TIM\",\"‘TIM Personal’\"],\"associatedStoreIdentifiers\":[1156051372],\"appLaunchURLScheme\":\"timpersonal\",\"appLaunchURLPath\":\"applewalletlist\",\"cameraCaptureSupport\":[],\"inAppProvisioningSupport\":[\"prepaid\"]},{\"displayName\":\"Vamsi\",\"searchTerms\":[\"ok\"],\"associatedStoreIdentifiers\":[123],\"appLaunchURLScheme\":\"launch\",\"appLaunchURLPath\":\"here\",\"cameraCaptureSupport\":[\"credit\",\"debit\"],\"inAppProvisioningSupport\":[\"prepaid\"]},{\"displayName\":\"Banca Mediolanum\",\"searchTerms\":[\"Mediolanum\",\"Mediolanum Wallet’\",\"‘Banca Mediolanum’\"],\"associatedStoreIdentifiers\":[412610547],\"appLaunchURLScheme\":\"mediolanumwallet\",\"appLaunchURLPath\":\"applewalletlist\",\"cameraCaptureSupport\":[\"debit\"],\"inAppProvisioningSupport\":[]},{\"displayName\":\"Hype\",\"searchTerms\":[\"Banca Sella\",\"Hype\"],\"associatedStoreIdentifiers\":[943405905],\"appLaunchURLScheme\":\"hype\",\"appLaunchURLPath\":\"appleWalletList\",\"cameraCaptureSupport\":[\"prepaid\"],\"inAppProvisioningSupport\":[]},{\"displayName\":\"N26\",\"searchTerms\":[\"N26\"],\"associatedStoreIdentifiers\":[956857223],\"appLaunchURLScheme\":\"number26\",\"appLaunchURLPath\":\"applepay/list\",\"cameraCaptureSupport\":[\"credit\",\"debit\"],\"inAppProvisioningSupport\":[]},{\"displayName\":\"Nexi\",\"searchTerms\":[\"Banca Mediolanum\",\"Banco di Desio\",\"Banco di Spoleto\",\"Carige\",\"CartaSi\",\"Casse Rurali Trentine\",\"Credit Agricole\",\"Nexi\",\"Nexi Pay\",\"Sparkasse\"],\"associatedStoreIdentifiers\":[518695175],\"appLaunchURLScheme\":\"cartasiapp\",\"appLaunchURLPath\":\"appleWalletList\",\"cameraCaptureSupport\":[\"credit\",\"debit\",\"prepaid\"],\"inAppProvisioningSupport\":[]},{\"displayName\":\"Bunq\",\"searchTerms\":[\"Bunq\"],\"associatedStoreIdentifiers\":[1021178150],\"appLaunchURLScheme\":\"bunq\",\"appLaunchURLPath\":\"x-bunq-app/apple-pay-wallet\",\"cameraCaptureSupport\":[\"debit\"],\"inAppProvisioningSupport\":[]}]}"), "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKWebServiceResponse responseWithData:](PKPaymentBrowseableBankAppsResponse, "responseWithData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pendingProvisioningForCredential:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_pendingProvisionings;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "representsCredential:", v4, (_QWORD)v11) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)requestProvisioningMethodMetadataForProduct:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  dispatch_group_t v18;
  PKPaymentProvisioningController *v19;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  objc_msgSend(v6, "provisioningMethodTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __97__PKPaymentProvisioningController_requestProvisioningMethodMetadataForProduct_completionHandler___block_invoke;
  v16[3] = &unk_1E2AD09C8;
  v17 = v6;
  v18 = v8;
  v19 = self;
  v11 = v8;
  v12 = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);

  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __97__PKPaymentProvisioningController_requestProvisioningMethodMetadataForProduct_completionHandler___block_invoke_4;
  v14[3] = &unk_1E2ABD9A0;
  v15 = v7;
  v13 = v7;
  dispatch_group_notify(v11, MEMORY[0x1E0C80D38], v14);

}

void __97__PKPaymentProvisioningController_requestProvisioningMethodMetadataForProduct_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  PKPaymentProvisioningMethodMetadataRequest *v5;
  void *v6;
  void *v7;
  PKPaymentProvisioningMethodMetadataRequest *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("inApp")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "provisioningMethodMetadataForType:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      v5 = [PKPaymentProvisioningMethodMetadataRequest alloc];
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "productIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PKPaymentProvisioningMethodMetadataRequest initWithProductIdentifier:provisioningMethod:](v5, "initWithProductIdentifier:provisioningMethod:", v7, v3);

      v9 = *(void **)(*(_QWORD *)(a1 + 48) + 344);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __97__PKPaymentProvisioningController_requestProvisioningMethodMetadataForProduct_completionHandler___block_invoke_2;
      v10[3] = &unk_1E2AD09A0;
      v11 = *(id *)(a1 + 32);
      v12 = v3;
      v13 = *(id *)(a1 + 40);
      objc_msgSend(v9, "provisioningMethodWithRequest:completion:", v8, v10);

    }
  }

}

void __97__PKPaymentProvisioningController_requestProvisioningMethodMetadataForProduct_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a3;
  if (a2 != 1 || a4)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __97__PKPaymentProvisioningController_requestProvisioningMethodMetadataForProduct_completionHandler___block_invoke_3;
    v8[3] = &unk_1E2AC0F90;
    v9 = *(id *)(a1 + 32);
    v10 = v7;
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

void __97__PKPaymentProvisioningController_requestProvisioningMethodMetadataForProduct_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "provisioningMethodMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProvisioningMethodMetadata:forType:", v3, *(_QWORD *)(a1 + 48));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __97__PKPaymentProvisioningController_requestProvisioningMethodMetadataForProduct_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requestPurchasesForProduct:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  PKPaymentServiceProviderPurchasesRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKPaymentServiceProviderPurchasesRequest *v18;
  void *v19;
  void *v20;
  void *v21;
  PKPaymentWebService *webService;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  uint8_t *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[8];
  uint8_t *v50;
  uint64_t v51;
  const char *v52;
  int v53;
  _QWORD v54[4];
  id v55;
  uint8_t buf[4];
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = a4;
  v33 = v6;
  objc_msgSend(v6, "provisioningMethodMetadataForType:", CFSTR("digitalIssuance"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "digitalIssuanceMetadata");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService context](self->_webService, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "regions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34 && objc_msgSend(v29, "count"))
  {
    *(_QWORD *)v49 = 0;
    v50 = v49;
    v51 = 0x2810000000;
    v52 = "";
    v53 = 0;
    v8 = dispatch_group_create();
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v29;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    if (v9)
    {
      v31 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v46 != v31)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          PKLogFacilityTypeGetObject(6uLL);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v11;
            _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Querying for purchases in region %@", buf, 0xCu);
          }

          v13 = [PKPaymentServiceProviderPurchasesRequest alloc];
          objc_msgSend(v33, "configuration");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "productIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "action");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "serviceProviderCountryCode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[PKPaymentServiceProviderPurchasesRequest initWithPurchaseState:serviceProviderIdentifier:productIdentifier:actionIdentifier:serviceProviderCountryCode:](v13, "initWithPurchaseState:serviceProviderIdentifier:productIdentifier:actionIdentifier:serviceProviderCountryCode:", 0, 0, v15, v16, v17);

          if (self->_isProvisioningForAltAccount)
          {
            -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "trustedDeviceEnrollmentInfoForWebService:", self->_webService);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "deviceSerialNumber");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPaymentServiceProviderPurchasesRequest setTargetDeviceSerialNumber:](v18, "setTargetDeviceSerialNumber:", v21);

          }
          dispatch_group_enter(v8);
          webService = self->_webService;
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __80__PKPaymentProvisioningController_requestPurchasesForProduct_completionHandler___block_invoke_367;
          v39[3] = &unk_1E2AD09F0;
          v44 = v49;
          v40 = v32;
          v41 = v33;
          v42 = v11;
          v43 = v8;
          -[PKPaymentWebService serviceProviderPurchasesWithRequest:inRegion:completion:](webService, "serviceProviderPurchasesWithRequest:inRegion:completion:", v18, v11, v39);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      }
      while (v9);
    }

    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__PKPaymentProvisioningController_requestPurchasesForProduct_completionHandler___block_invoke_370;
    block[3] = &unk_1E2AD0A18;
    v36 = v32;
    v23 = v32;
    objc_copyWeak(&v38, (id *)buf);
    v37 = v27;
    v24 = v27;
    dispatch_group_notify(v8, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);

    _Block_object_dispose(v49, 8);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Error: Could not fetch product purchases", v49, 2u);
    }

    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __80__PKPaymentProvisioningController_requestPurchasesForProduct_completionHandler___block_invoke;
    v54[3] = &unk_1E2ABD9A0;
    v55 = v27;
    v26 = v27;
    dispatch_async(MEMORY[0x1E0C80D38], v54);

  }
}

uint64_t __80__PKPaymentProvisioningController_requestPurchasesForProduct_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__PKPaymentProvisioningController_requestPurchasesForProduct_completionHandler___block_invoke_367(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  PKPaymentPurchasedProductCredential *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)a1[6];
      *(_DWORD *)buf = 138412546;
      v41 = v8;
      v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Error querying region %@ for purchases: %@", buf, 0x16u);
    }

  }
  else
  {
    v26 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1[8] + 8) + 32));
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v27 = v5;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v37;
      v28 = *(_QWORD *)v37;
      v29 = a1;
      do
      {
        v12 = 0;
        v30 = v10;
        do
        {
          if (*(_QWORD *)v37 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v12);
          if ((objc_msgSend(v13, "state", v26) & 0xFFFFFFFFFFFFFFFDLL) == 1)
          {
            objc_msgSend(v13, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            v35 = 0u;
            v15 = (id)a1[4];
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v33;
              while (2)
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v33 != v18)
                    objc_enumerationMutation(v15);
                  objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "purchase");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "identifier");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = objc_msgSend(v21, "isEqualToString:", v14);

                  if ((v22 & 1) != 0)
                  {

                    PKLogFacilityTypeGetObject(6uLL);
                    v24 = (PKPaymentPurchasedProductCredential *)objc_claimAutoreleasedReturnValue();
                    a1 = v29;
                    if (os_log_type_enabled(&v24->super.super, OS_LOG_TYPE_DEFAULT))
                    {
                      v25 = (void *)v29[6];
                      *(_DWORD *)buf = 138412546;
                      v41 = v14;
                      v42 = 2112;
                      v43 = v25;
                      _os_log_impl(&dword_18FC92000, &v24->super.super, OS_LOG_TYPE_DEFAULT, "Dropped purchase: %@ from region: %@ as this is already present in purcahses from other regions", buf, 0x16u);
                    }
                    goto LABEL_22;
                  }
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
                if (v17)
                  continue;
                break;
              }
            }

            a1 = v29;
            v23 = (void *)v29[4];
            v24 = -[PKPaymentPurchasedProductCredential initWithPaymentSetupProduct:purchase:]([PKPaymentPurchasedProductCredential alloc], "initWithPaymentSetupProduct:purchase:", v29[5], v13);
            objc_msgSend(v23, "addObject:", v24);
LABEL_22:
            v11 = v28;
            v10 = v30;

          }
          ++v12;
        }
        while (v12 != v10);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v10);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1[8] + 8) + 32));
    v6 = v26;
    v5 = v27;
  }
  dispatch_group_leave((dispatch_group_t)a1[7]);

}

void __80__PKPaymentProvisioningController_requestPurchasesForProduct_completionHandler___block_invoke_370(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id *WeakRetained;
  id *v5;
  uint64_t v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = objc_msgSend(v2, "count");
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Final (pending/refunded) purchases count: %d", (uint8_t *)v7, 8u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 47, v2);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v2, 0);

}

- (void)setupProductForProvisioning:(id)a3 includePurchases:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKAsyncUnaryOperationComposer *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  PKPaymentProvisioningController *v30;
  _QWORD *v31;
  _QWORD v32[4];
  id v33;
  PKPaymentProvisioningController *v34;
  _QWORD *v35;
  _QWORD v36[4];
  id v37;
  PKPaymentProvisioningController *v38;
  id v39;
  _QWORD *v40;
  BOOL v41;
  _QWORD v42[5];
  id v43;
  _QWORD *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD v51[5];
  id v52;
  id v53;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[4];
  id v60;
  PKPaymentProvisioningController *v61;
  _QWORD *v62;
  _QWORD v63[5];
  id v64;
  _QWORD v65[3];
  char v66;

  v8 = a3;
  v9 = a5;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  v66 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__38;
  v63[4] = __Block_byref_object_dispose__38;
  v64 = 0;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v12 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    objc_msgSend(v8, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "type");
    if (v14 == 6)
    {
      objc_msgSend(v8, "provisioningExtension");
      v57[0] = 0;
      v57[1] = v57;
      v57[2] = 0x3032000000;
      v57[3] = __Block_byref_object_copy__38;
      v57[4] = __Block_byref_object_dispose__38;
      v58 = 0;
      v51[0] = v12;
      v51[1] = 3221225472;
      v51[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_2;
      v51[3] = &unk_1E2AD0AB8;
      v51[4] = self;
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v52 = v16;
      v54 = v57;
      v55 = v65;
      v53 = v8;
      v56 = v63;
      -[PKAsyncUnaryOperationComposer addOperation:](v11, "addOperation:", v51);
      v45[0] = v12;
      v45[1] = 3221225472;
      v45[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_7;
      v45[3] = &unk_1E2AD0AB8;
      v48 = v57;
      v45[4] = self;
      v17 = v16;
      v46 = v17;
      v47 = v10;
      v49 = v65;
      v50 = v63;
      -[PKAsyncUnaryOperationComposer addOperation:](v11, "addOperation:", v45);

      _Block_object_dispose(v57, 8);
    }
    else
    {
      if (v14 == 10)
      {
        v32[0] = v12;
        v32[1] = 3221225472;
        v32[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_385;
        v32[3] = &unk_1E2AD0A40;
        v35 = v65;
        v33 = v10;
        v34 = self;
        -[PKAsyncUnaryOperationComposer addOperation:](v11, "addOperation:", v32);
        v15 = v33;
      }
      else if (v14 == 11)
      {
        v59[0] = v12;
        v59[1] = 3221225472;
        v59[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke;
        v59[3] = &unk_1E2AD0A40;
        v62 = v65;
        v60 = v10;
        v61 = self;
        -[PKAsyncUnaryOperationComposer addOperation:](v11, "addOperation:", v59);
        v15 = v60;
      }
      else
      {
        v42[0] = v12;
        v42[1] = 3221225472;
        v42[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_3_380;
        v42[3] = &unk_1E2AC71C0;
        v42[4] = self;
        v18 = v8;
        v43 = v18;
        v44 = v65;
        -[PKAsyncUnaryOperationComposer addOperation:](v11, "addOperation:", v42);
        v36[0] = v12;
        v36[1] = 3221225472;
        v36[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_5_382;
        v36[3] = &unk_1E2AD0AE0;
        v40 = v65;
        v41 = a4;
        v37 = v18;
        v38 = self;
        v39 = v10;
        -[PKAsyncUnaryOperationComposer addOperation:](v11, "addOperation:", v36);

        v15 = v43;
      }

    }
  }
  else
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_2_386;
    v28[3] = &unk_1E2AD0A40;
    v31 = v65;
    v29 = v10;
    v30 = self;
    -[PKAsyncUnaryOperationComposer addOperation:](v11, "addOperation:", v28);
    v13 = v29;
  }

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_3_387;
  v23[3] = &unk_1E2AD0B08;
  v20 = v9;
  v25 = v20;
  v26 = v65;
  v27 = v63;
  v21 = v10;
  v24 = v21;
  v22 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v11, "evaluateWithInput:completion:", v19, v23);

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);

}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  void *v5;
  uint64_t v6;
  void (**v7)(id, id, _QWORD);
  id v8;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v5 = (void *)a1[4];
  v6 = *(_QWORD *)(a1[5] + 384);
  v7 = a4;
  v8 = a3;
  objc_msgSend(v5, "pk_safelyAddObjectsFromArray:", v6);
  v7[2](v7, v8, 0);

}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  __int128 v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 400), *(id *)(a1 + 40));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 408);
  *(_QWORD *)(v8 + 408) = 0;

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_3;
  v17[3] = &unk_1E2AD0A90;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v20 = v7;
  v17[4] = v10;
  v18 = v6;
  v21 = *(_OWORD *)(a1 + 56);
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 72);
  v19 = v12;
  v22 = v13;
  v14 = v6;
  v15 = v7;
  v16 = +[PKIssuerProvisioningExtensionConsumerCoordinator beginWithExtension:completion:](PKIssuerProvisioningExtensionConsumerCoordinator, "beginWithExtension:completion:", v11, v17);

}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  _QWORD block[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  id v30;
  __int128 v31;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "targetDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Apple Watch"));

    if ((v10 & 1) != 0)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_5;
      v24[3] = &unk_1E2AD0A68;
      v25 = v6;
      v19 = *(_OWORD *)(a1 + 56);
      v11 = (id)v19;
      v27 = v19;
      v26 = *(id *)(a1 + 40);
      objc_msgSend(v25, "remotePassEntriesWithCompletion:", v24);

      v12 = v25;
    }
    else
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_4;
      v28[3] = &unk_1E2AD0A68;
      v29 = v6;
      v20 = *(_OWORD *)(a1 + 56);
      v18 = (id)v20;
      v31 = v20;
      v30 = *(id *)(a1 + 40);
      objc_msgSend(v29, "passEntriesWithCompletion:", v28);

      v12 = v29;
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    objc_msgSend(*(id *)(a1 + 48), "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("PROVISIONING_EXTENSION_GENERIC_ERROR_MESSAGE"), CFSTR("%@"), v13);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    PKLocalizedPaymentString(CFSTR("PROVISIONING_EXTENSION_GENERIC_ERROR_TITLE"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustomWithType(-1, v14, v12, 0, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_6;
    block[3] = &unk_1E2ABDA18;
    v23 = *(id *)(a1 + 56);
    v22 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 1);
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_7(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  PKPaymentIssuerProvisioningExtensionCredential *v23;
  PKPaymentIssuerProvisioningExtensionCredential *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD block[5];
  id v44;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  PKPaymentIssuerProvisioningExtensionCredential *v53;
  _BYTE v54[128];
  _QWORD v55[4];

  v55[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "count");
  if (!v8)
  {
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 0;
    PKDisplayableErrorForCommonType(7, 0);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = *(_QWORD *)(a1[9] + 8);
    v35 = *(void **)(v34 + 40);
    *(_QWORD *)(v34 + 40) = v33;

    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_2_379;
    v40[3] = &unk_1E2ABDA18;
    v41 = v6;
    v42 = v7;
    v32 = v6;
    v10 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v40);

    v31 = v42;
    goto LABEL_26;
  }
  v9 = v8;
  v36 = v6;
  v37 = v7;
  v55[0] = *(_QWORD *)(a1[4] + 344);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
  v39 = a1;
  v48 = 0u;
  v50 = 0u;
  v51 = 0u;
  v49 = 0u;
  v11 = *(id *)(*(_QWORD *)(a1[7] + 8) + 40);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (!v12)
    goto LABEL_22;
  v13 = v12;
  v14 = *(_QWORD *)v49;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v49 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
      objc_msgSend(v16, "paymentPassEntry");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "addRequestConfiguration");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          -[NSObject _filterWebServices:primaryAccountIdentifierRequired:](v19, "_filterWebServices:primaryAccountIdentifierRequired:", v10, 1);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21 && -[NSObject count](v21, "count"))
          {
            v23 = -[PKPaymentIssuerProvisioningExtensionCredential initWithExtension:entry:]([PKPaymentIssuerProvisioningExtensionCredential alloc], "initWithExtension:entry:", v39[5], v18);
            objc_msgSend(v38, "addObject:", v23);
            objc_msgSend((id)v39[6], "addObject:", v23);
          }
          else
          {
            PKLogFacilityTypeGetObject(6uLL);
            v23 = (PKPaymentIssuerProvisioningExtensionCredential *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v23->super.super, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v16, "identifier");
              v24 = (PKPaymentIssuerProvisioningExtensionCredential *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v53 = v24;
              _os_log_impl(&dword_18FC92000, &v23->super.super, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController: filtering pass entry %@ due to configuration parameters.", buf, 0xCu);

            }
          }
          goto LABEL_18;
        }
        PKLogFacilityTypeGetObject(6uLL);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "identifier");
          v23 = (PKPaymentIssuerProvisioningExtensionCredential *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v53 = v23;
          _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController: filtering pass entry %@ due to missing configuration.", buf, 0xCu);
LABEL_18:

        }
      }
      else
      {
        PKLogFacilityTypeGetObject(6uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        objc_msgSend(v16, "identifier");
        v22 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = (PKPaymentIssuerProvisioningExtensionCredential *)v22;
        _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController: filtering pass entry %@ due to type.", buf, 0xCu);
      }

LABEL_20:
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  }
  while (v13);
LABEL_22:

  v25 = v38;
  *(_BYTE *)(*(_QWORD *)(v39[8] + 8) + 24) = objc_msgSend(v38, "count") != 0;
  if (!*(_BYTE *)(*(_QWORD *)(v39[8] + 8) + 24))
  {

    PKDisplayableErrorForCommonType(7, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(v39[9] + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    v25 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_378;
  block[3] = &unk_1E2AC5630;
  v29 = (void *)v39[5];
  block[4] = v39[4];
  v44 = v29;
  v45 = v25;
  v46 = v36;
  v47 = v37;
  v30 = v36;
  v31 = v37;
  v32 = v25;
  dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_26:
}

uint64_t __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_378(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 400) == *(_QWORD *)(a1 + 40))
  {
    v2 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 408);
    *(_QWORD *)(v3 + 408) = v2;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

uint64_t __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_2_379(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 1);
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_3_380(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)a1[4];
  v9 = a1[5];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_4_381;
  v13[3] = &unk_1E2AC5928;
  v10 = a1[6];
  v15 = v7;
  v16 = v10;
  v14 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v8, "requestProvisioningMethodMetadataForProduct:completionHandler:", v9, v13);

}

uint64_t __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_4_381(_QWORD *a1)
{
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], 0);
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_5_382(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, id, _QWORD);
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  void (**v21)(id, id, _QWORD);
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = PKPaymentSetupMergeProductsPartnersAPIEnabled();
  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    LODWORD(v10) = objc_msgSend(v9, "supportsProvisioningMethodForType:", 2);
    PKLogFacilityTypeGetObject(6uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 136315394;
    v23 = "-[PKPaymentProvisioningController setupProductForProvisioning:includePurchases:withCompletionHandler:]_block_invoke_5";
    v24 = 1024;
    v25 = v10;
    v12 = "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled On: supportsDigitalIssuance: %d";
  }
  else
  {
    v13 = objc_msgSend(v9, "supportedProvisioningMethods");
    v14 = v13;
    v10 = (v13 >> 1) & 1;
    PKLogFacilityTypeGetObject(6uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 136315394;
    v23 = "-[PKPaymentProvisioningController setupProductForProvisioning:includePurchases:withCompletionHandler:]_block_invoke";
    v24 = 1024;
    v25 = (unint64_t)(v14 & 2) >> 1;
    v12 = "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled Off: supportsDigitalIssuance: %d";
  }
  _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x12u);
LABEL_7:

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    v15 = (_DWORD)v10 == 0;
  else
    v15 = 1;
  if (v15 || !*(_BYTE *)(a1 + 64) || (objc_msgSend(*(id *)(a1 + 32), "suppressPendingPurchases") & 1) != 0)
  {
    v7[2](v7, v6, 0);
  }
  else
  {
    v17 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(a1 + 40);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_384;
    v18[3] = &unk_1E2ACF3C0;
    v19 = *(id *)(a1 + 48);
    v21 = v7;
    v20 = v6;
    objc_msgSend(v16, "requestPurchasesForProduct:completionHandler:", v17, v18);

  }
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_384(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
    v6 = a2;
  else
    v6 = MEMORY[0x1E0C9AA60];
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v6);
  if (v5)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Error getting purchases for product:%@", (uint8_t *)&v8, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_385(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  void *v5;
  void *v6;
  void (**v7)(id, id, _QWORD);
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v5 = (void *)a1[4];
  v6 = (void *)a1[5];
  v7 = a4;
  v11 = a3;
  objc_msgSend(v6, "associatedCredentialsForDefaultBehaviour");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = v8;
  else
    v10 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v5, "addObjectsFromArray:", v10);

  v7[2](v7, v11, 0);
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_2_386(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  void *v5;
  void *v6;
  void (**v7)(id, id, _QWORD);
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v5 = (void *)a1[4];
  v6 = (void *)a1[5];
  v7 = a4;
  v11 = a3;
  objc_msgSend(v6, "associatedCredentialsForDefaultBehaviour");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = v8;
  else
    v10 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v5, "addObjectsFromArray:", v10);

  v7[2](v7, v11, 0);
}

uint64_t __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_3_387(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), a1[4]);
}

- (void)setupAccountCredentialForProvisioning:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    -[PKPaymentWebService context](self->_webService, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "primaryRegion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(0xEuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "accountServiceURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accountServicePushTopic");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "setupAccountCredentialForProvisioning accountServiceURL %@ accountServicePushTopic %@", buf, 0x16u);

    }
    objc_msgSend(v10, "accountServiceURL");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14
      && (v15 = (void *)v14,
          objc_msgSend(v10, "accountServicePushTopic"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v16,
          v15,
          v16))
    {
      -[PKPaymentProvisioningController _setupAccountCredentialForProvisioning:completion:](self, "_setupAccountCredentialForProvisioning:completion:", v6, v8);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "!!!! Missing account service URL or push topic, updating accounts before setting up account credential. Region: %@", buf, 0xCu);
      }

      -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __84__PKPaymentProvisioningController_setupAccountCredentialForProvisioning_completion___block_invoke;
      v18[3] = &unk_1E2AD0B30;
      v18[4] = self;
      v19 = v6;
      v20 = v8;
      objc_msgSend(v17, "updatedAccountsForProvisioningWithCompletion:", v18);

    }
    goto LABEL_12;
  }
  if (v7)
  {
    -[PKPaymentProvisioningController displayableErrorForError:](self, "displayableErrorForError:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v10);
LABEL_12:

  }
}

void __84__PKPaymentProvisioningController_setupAccountCredentialForProvisioning_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject(0xEuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Finished updating accounts %@ %@, continuing with setting up account credential.", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setupAccountCredentialForProvisioning:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_setupAccountCredentialForProvisioning:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void (**v20)(id, uint64_t, _QWORD);
  id v21;
  void *v22;
  id v23;
  id v24;
  void (**v25)(void *, _QWORD);
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  PKPaymentProvisioningController *v36;
  void (**v37)(id, uint64_t, _QWORD);
  id v38;
  _QWORD aBlock[5];
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_msgSend(v6, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKFeatureIdentifierToString(objc_msgSend(v8, "feature"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentProvisioningController _supportedFeatureIdentifierStringsForAccountProvisioning](self, "_supportedFeatureIdentifierStringsForAccountProvisioning");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "containsObject:", v10) & 1) != 0)
  {
    v31 = v11;
    objc_msgSend(v6, "passDetailsResponse");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && objc_msgSend(v12, "status") != -1)
    {
      if (objc_msgSend(v13, "status") != 1
        || (objc_msgSend(v13, "provisioningIdentifier"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v14, "length"),
            v14,
            v15))
      {
        PKLogFacilityTypeGetObject(0xEuLL);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v9;
          _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Account credential for account: %@ has already already setup for provisioning", buf, 0xCu);
        }

        v11 = v31;
        if (v7)
          v7[2](v7, 1, 0);
        goto LABEL_25;
      }
      PKLogFacilityTypeGetObject(0xEuLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Error: Pass details response cached but missing provisioning identifier", buf, 2u);
      }

    }
    v29 = v10;
    v19 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke;
    aBlock[3] = &unk_1E2AD0BA8;
    v20 = v7;
    v41 = v20;
    aBlock[4] = self;
    v21 = v6;
    v40 = v21;
    v22 = _Block_copy(aBlock);
    v32[0] = v19;
    v32[1] = 3221225472;
    v32[2] = __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_390;
    v32[3] = &unk_1E2AD0C20;
    v30 = v9;
    v33 = v9;
    v34 = v8;
    v23 = v21;
    v35 = v23;
    v36 = self;
    v37 = v20;
    v24 = v22;
    v38 = v24;
    v25 = (void (**)(void *, _QWORD))_Block_copy(v32);
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v23, "sharingInstanceIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        v28 = 111;
      else
        v28 = 255;
      objc_msgSend(v26, "paymentWebService:deviceMetadataWithFields:completion:", self->_webService, v28, v25, v29);
    }
    else
    {
      v25[2](v25, 0);
    }

    v10 = v29;
    v9 = v30;
    v11 = v31;
LABEL_25:

    goto LABEL_26;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v9;
    _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Account credential for account: %@ is not supported by target device supported features", buf, 0xCu);
  }

  if (v7)
  {
    -[PKPaymentProvisioningController displayableErrorForError:](self, "displayableErrorForError:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v13);
    goto LABEL_25;
  }
LABEL_26:

}

void __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void (**v7)(id, BOOL, _QWORD);
  void (**v8)(id, BOOL, _QWORD);
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "status") == 4)
  {
    objc_msgSend(v3, "passURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v4;
        _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Downloading the account shell pass again after getting pass details: %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, a1[4]);
      v6 = (void *)*((_QWORD *)a1[4] + 43);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_388;
      v9[3] = &unk_1E2AD0B80;
      objc_copyWeak(&v13, (id *)buf);
      v10 = a1[5];
      v11 = v4;
      v12 = a1[6];
      v14 = v3 != 0;
      objc_msgSend(v6, "passAtURL:completion:", v11, v9);

      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v8 = (void (**)(id, BOOL, _QWORD))a1[6];
      if (v8)
        v8[2](v8, v3 != 0, 0);
    }

  }
  else
  {
    v7 = (void (**)(id, BOOL, _QWORD))a1[6];
    if (v7)
      v7[2](v7, v3 != 0, 0);
  }

}

void __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_388(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12[2];
  char v13;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_2;
  block[3] = &unk_1E2AD0B58;
  objc_copyWeak(v12, (id *)(a1 + 56));
  v12[1] = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v13 = *(_BYTE *)(a1 + 64);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v12);
}

void __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && *(_QWORD *)(a1 + 72) == 1 && (v3 = *(_QWORD *)(a1 + 32)) != 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Updating the account credential payment pass %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "setPaymentPass:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 48);
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "A nil payment pass was defined after getting the pass at url %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, *(unsigned __int8 *)(a1 + 80), 0);

}

void __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_390(uint64_t a1, void *a2)
{
  id v3;
  PKAccountWebServicePassDetailsRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  v4 = objc_alloc_init(PKAccountWebServicePassDetailsRequest);
  -[PKAccountWebServicePassDetailsRequest setAccountIdentifier:](v4, "setAccountIdentifier:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "accountBaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServicePassDetailsRequest setBaseURL:](v4, "setBaseURL:", v5);

  -[PKAccountWebServicePassDetailsRequest setDeviceMetadata:](v4, "setDeviceMetadata:", v3);
  objc_msgSend(*(id *)(a1 + 48), "sharingInstanceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServicePassDetailsRequest setSharingInstanceIdentifier:](v4, "setSharingInstanceIdentifier:", v6);

  v7 = *(void **)(a1 + 48);
  v8 = *(void **)(*(_QWORD *)(a1 + 56) + 344);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_2_392;
  v9[3] = &unk_1E2AD0BF8;
  v10 = v7;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 72);
  objc_msgSend(v8, "accountPassDetailsRequest:completion:", v4, v9);

}

void __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_2_392(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_3;
  v9[3] = &unk_1E2AD0BD0;
  v10 = v5;
  v11 = a1[4];
  v12 = v6;
  v13 = a1[5];
  v14 = a1[6];
  v15 = a1[7];
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "setPassDetailsResponse:");
  v2 = *(void **)(a1 + 48);
  if (v2
    && (PKAccountDisplayableError(v2, objc_msgSend(*(id *)(a1 + 56), "feature"), 0, 0),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    v5 = *(_QWORD *)(a1 + 64);
    if (v5)
    {
      v6 = v4;
      (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, *(_QWORD *)(a1 + 32) != 0);
      v4 = v6;
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    v4 = 0;
  }

}

- (id)_filteredPaymentSetupProductSections:(id)a3
{
  id v4;
  void *v5;
  uint64_t i;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v17;
  id obj;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_isProvisioningForAltAccount)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v17 = v5;
    obj = v5;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v21)
    {
      v20 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v22 = v7;
          objc_msgSend(v7, "categories");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v24 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
                objc_msgSend(v14, "identifier", v17);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v15, "isEqualToString:", CFSTR("creditDebit")) & 1) == 0
                  && (objc_msgSend(v15, "isEqualToString:", CFSTR("appExtensions")) & 1) == 0)
                {
                  objc_msgSend(v8, "addObject:", v14);
                }

              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v11);
          }

          if (objc_msgSend(v8, "count"))
          {
            objc_msgSend(v22, "setCategories:", v8);
            objc_msgSend(v19, "addObject:", v22);
          }

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v21);
    }

    v5 = v17;
  }
  else
  {
    v19 = v4;
  }

  return v19;
}

- (id)_filterPaymentSetupProducts:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSSet *requiredTransitNetworkIdentifiers;
  void *v22;
  void *v23;
  int v24;
  unint64_t targetDeviceSupportsTypeF;
  uint64_t v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  _BOOL4 v34;
  int v35;
  int v36;
  int v37;
  char v38;
  void *v39;
  uint64_t v40;
  NSSet *allowedProductIdentifiers;
  void *v42;
  _BOOL4 v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v48;
  uint64_t v49;
  id v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_targetDeviceSupportsTypeF)
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "felicaSecureElementIsAvailable");
      v7 = 1;
      if (!v6)
        v7 = 2;
    }
    else
    {
      v7 = 2;
    }
    self->_targetDeviceSupportsTypeF = v7;

  }
  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPaymentProvisioningController _supportedFeatureIdentifierStrings](self, "_supportedFeatureIdentifierStrings");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v53;
    v49 = *(_QWORD *)v53;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v53 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v11);
        objc_msgSend(v12, "configuration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "state");

        if (self->_allowedPaymentNetworks)
        {
          objc_msgSend(v12, "paymentOptions");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          PKPaymentNetworkNameForPaymentCredentialType(objc_msgSend(v16, "cardType"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSArray containsObject:](self->_allowedPaymentNetworks, "containsObject:", v17))
            goto LABEL_17;
          objc_msgSend(v12, "configuration");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "featureIdentifier") == 2)
          {

            v10 = v49;
LABEL_17:

            goto LABEL_18;
          }
          objc_msgSend(v12, "configuration");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "type");

          v10 = v49;
          if (v40 != 5)
            goto LABEL_25;
        }
LABEL_18:
        if (-[NSSet count](self->_requiredTransitNetworkIdentifiers, "count"))
        {
          objc_msgSend(v12, "supportedTransitNetworkIdentifiers");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (!v19 || !objc_msgSend(v19, "count"))
          {

LABEL_25:
            objc_msgSend(v12, "configuration");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
            v24 = 0;
            goto LABEL_27;
          }
          requiredTransitNetworkIdentifiers = self->_requiredTransitNetworkIdentifiers;
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(requiredTransitNetworkIdentifiers) = -[NSSet intersectsSet:](requiredTransitNetworkIdentifiers, "intersectsSet:", v22);

          if (!(_DWORD)requiredTransitNetworkIdentifiers)
            goto LABEL_25;
        }
        if ((objc_msgSend(v12, "allSupportedProtocols") & 4) != 0)
        {
          targetDeviceSupportsTypeF = self->_targetDeviceSupportsTypeF;
          objc_msgSend(v12, "configuration");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (targetDeviceSupportsTypeF != 1)
            goto LABEL_26;
        }
        else
        {
          objc_msgSend(v12, "configuration");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (objc_msgSend(v23, "type") == 7)
        {
          v26 = objc_msgSend(v23, "featureIdentifier");
          PKFeatureIdentifierToString(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v48, "containsObject:", v27);

          if (!v28)
            goto LABEL_26;
          v29 = PKDeviceSupportsApplicationForFeatureIdentifier(v26);
          if (v26 == 3 && v29)
          {
            objc_msgSend(v12, "accounts");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "firstObject");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v31, "payLaterDetails");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "hasProvisionedPass");

            v34 = -[PKPaymentProvisioningController hasPayLaterPass](self, "hasPayLaterPass");
            v35 = objc_msgSend(v31, "hidePayLaterSetupInWallet");
            if (v31)
              v36 = v33;
            else
              v36 = 1;
            v10 = v49;
            v37 = v36 | v34 | v35;
            if ((unint64_t)(v14 - 3) < 2)
              v38 = (v31 == 0) & ~v34;
            else
              v38 = 0;

            if (v37 == 1 && (v38 & 1) == 0)
              goto LABEL_26;
          }
          else if (!v29)
          {
            goto LABEL_26;
          }
        }
        allowedProductIdentifiers = self->_allowedProductIdentifiers;
        if (allowedProductIdentifiers)
        {
          objc_msgSend(v12, "productIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = -[NSSet containsObject:](allowedProductIdentifiers, "containsObject:", v42);

          if (!v43)
            goto LABEL_26;
        }
        if (objc_msgSend(v12, "minimumSupportedAge") >= 13 && self->_isCurrentUserUnder13 == 1)
        {
LABEL_54:
          objc_msgSend(v12, "setMeetsAgeRequirements:", 0);
          goto LABEL_55;
        }
        v24 = 1;
LABEL_27:
        objc_msgSend(v12, "setMeetsAgeRequirements:", 1);
        if (v24
          && self->_isProvisioningForAltAccount
          && objc_msgSend(v12, "minimumTargetUserSupportedAge") >= 13
          && self->_isTargetUserUnder13 == 1)
        {
          goto LABEL_54;
        }
        if (v24)
        {
          objc_msgSend(v50, "addObject:", v12);
          goto LABEL_58;
        }
LABEL_55:
        PKLogFacilityTypeGetObject(6uLL);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "displayName");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v57 = v45;
          _os_log_impl(&dword_18FC92000, v44, OS_LOG_TYPE_DEFAULT, "Product %@ is not supported by target device", buf, 0xCu);

        }
LABEL_58:

        ++v11;
      }
      while (v9 != v11);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      v9 = v46;
    }
    while (v46);
  }

  return v50;
}

- (void)_queryRequirementsForCredential:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  PKPaymentRequirementsRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKProvisioningUtility *utility;
  _QWORD v16[4];
  id v17;
  PKPaymentProvisioningController *v18;
  void (**v19)(id, uint64_t, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_msgSend(v6, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requirementsResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v7)
      v7[2](v7, 1, 0);
  }
  else
  {
    v10 = -[PKPaymentRequirementsRequest initWithPaymentCredential:]([PKPaymentRequirementsRequest alloc], "initWithPaymentCredential:", v6);
    -[PKSecureElementProvisioningState referrerIdentifier](self->_provisioningState, "referrerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[PKSecureElementProvisioningState referrerIdentifier](self->_provisioningState, "referrerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRequirementsRequest setReferrerIdentifier:](v10, "setReferrerIdentifier:", v12);

    }
    objc_msgSend(v6, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    utility = self->_utility;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __78__PKPaymentProvisioningController__queryRequirementsForCredential_completion___block_invoke;
    v16[3] = &unk_1E2AD0C48;
    v17 = v6;
    v18 = self;
    v19 = v7;
    -[PKProvisioningUtility requestRequirements:sid:completion:](utility, "requestRequirements:sid:completion:", v10, v14, v16);

  }
}

void __78__PKPaymentProvisioningController__queryRequirementsForCredential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PKPaymentProvisioningController__queryRequirementsForCredential_completion___block_invoke_2;
  block[3] = &unk_1E2ABE260;
  v13 = v5;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v14 = v7;
  v15 = v8;
  v16 = v6;
  v17 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __78__PKPaymentProvisioningController__queryRequirementsForCredential_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (!*(_QWORD *)(a1 + 32)
    || objc_msgSend(*(id *)(a1 + 40), "isRemoteCredential")
    && (objc_msgSend(*(id *)(a1 + 40), "remoteCredential"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "status"),
        v2,
        v3 == 2)
    && objc_msgSend(*(id *)(a1 + 32), "status") != 1)
  {
    objc_msgSend(*(id *)(a1 + 48), "displayableErrorForError:", *(_QWORD *)(a1 + 56));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "state");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRequirementsResponse:", *(_QWORD *)(a1 + 32));

    v5 = 0;
  }
  v6 = (id)v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (void)_queryEligibilityForCredential:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  PKPaymentEligibilityRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKProvisioningUtility *utility;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  PKPaymentProvisioningController *v20;
  void (**v21)(id, uint64_t, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_msgSend(v6, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eligibilityResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v7)
      v7[2](v7, 1, 0);
  }
  else
  {
    v10 = -[PKPaymentEligibilityRequest initWithPaymentCredential:]([PKPaymentEligibilityRequest alloc], "initWithPaymentCredential:", v6);
    -[PKSecureElementProvisioningState referrerIdentifier](self->_provisioningState, "referrerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[PKSecureElementProvisioningState referrerIdentifier](self->_provisioningState, "referrerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentEligibilityRequest setReferrerIdentifier:](v10, "setReferrerIdentifier:", v12);

    }
    objc_msgSend(v6, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    utility = self->_utility;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __77__PKPaymentProvisioningController__queryEligibilityForCredential_completion___block_invoke;
    v17[3] = &unk_1E2AD0C70;
    v18 = v6;
    v19 = v14;
    v20 = self;
    v21 = v7;
    v16 = v14;
    -[PKProvisioningUtility requestEligibility:sid:completion:](utility, "requestEligibility:sid:completion:", v10, v16, v17);

  }
}

void __77__PKPaymentProvisioningController__queryEligibilityForCredential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__PKPaymentProvisioningController__queryEligibilityForCredential_completion___block_invoke_2;
  v10[3] = &unk_1E2ABE238;
  v11 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = *(id *)(a1 + 40);
  v14 = v6;
  v7 = *(void **)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 48);
  v16 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __77__PKPaymentProvisioningController__queryEligibilityForCredential_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isSafariCredential")
    && objc_msgSend(*(id *)(a1 + 40), "supersededBy"))
  {
    PKLogFacilityTypeGetObject(0x26uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 48);
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "[%@] Excluding Safari credential since the same card is already being offered as a previous card", (uint8_t *)&v11, 0xCu);
    }

    v4 = 0;
  }
  else
  {
    v4 = 1;
  }
  v5 = *(void **)(a1 + 40);
  if (v5
    && !*(_QWORD *)(a1 + 56)
    && (objc_msgSend(v5, "eligibilityStatus") == 1 ? (v6 = v4) : (v6 = 0),
        objc_msgSend(*(id *)(a1 + 32), "state"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "setEligibilityResponse:", *(_QWORD *)(a1 + 40)),
        v7,
        (v6 & 1) != 0))
  {
    v8 = 0;
    v9 = 1;
  }
  else if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 64), "displayableErrorForError:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  v10 = *(_QWORD *)(a1 + 72);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, v9, v8);

}

- (void)requestRequirements:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  unint64_t state;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  state = self->_state;
  if (state)
  {
    if (v7)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        PKPaymentProvisioningControllerStateToString(state);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Error: Requirements requested but state is: %@", (uint8_t *)&v12, 0xCu);

      }
      v8[2](v8, 0, 0);
    }
  }
  else
  {
    -[PKPaymentProvisioningController _requestRequirements:withCompletionHandler:](self, "_requestRequirements:withCompletionHandler:", v6, v7);
  }

}

- (void)_requestRequirements:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  PKPaymentCredential *v8;
  PKPaymentCredential *currentCredential;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKProvisioningUtility *utility;
  _QWORD v16[5];
  void (**v17)(id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  -[PKPaymentProvisioningController _setLocalizedProgressDescription:](self, "_setLocalizedProgressDescription:", 0);
  objc_msgSend(v6, "paymentCredential");
  v8 = (PKPaymentCredential *)objc_claimAutoreleasedReturnValue();
  currentCredential = self->_currentCredential;
  self->_currentCredential = v8;

  -[PKPaymentCredential state](self->_currentCredential, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requirementsResponse");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v11, "status") == 1)
  {
    -[PKSecureElementProvisioningState setRequirementsResponse:](self->_provisioningState, "setRequirementsResponse:", v11);
    -[PKPaymentProvisioningController _setState:notify:](self, "_setState:notify:", 1, 1);
    if (v7)
      v7[2](v7, v11, 0);
  }
  else
  {
    -[PKSecureElementProvisioningState referrerIdentifier](self->_provisioningState, "referrerIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[PKSecureElementProvisioningState referrerIdentifier](self->_provisioningState, "referrerIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setReferrerIdentifier:", v13);

    }
    -[PKPaymentProvisioningController _effectiveSessionIdentifier](self, "_effectiveSessionIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    utility = self->_utility;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __78__PKPaymentProvisioningController__requestRequirements_withCompletionHandler___block_invoke;
    v16[3] = &unk_1E2AD0C98;
    v16[4] = self;
    v17 = v7;
    -[PKProvisioningUtility requestRequirements:sid:completion:](utility, "requestRequirements:sid:completion:", v6, v14, v16);

  }
}

void __78__PKPaymentProvisioningController__requestRequirements_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__PKPaymentProvisioningController__requestRequirements_withCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E2AC4A20;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v5;
  v13 = v7;
  v14 = v6;
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __78__PKPaymentProvisioningController__requestRequirements_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "setRequirementsResponse:");
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 168);
    objc_msgSend(*(id *)(a1 + 32), "nonce");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNonce:", v3);

    if (objc_msgSend(*(id *)(a1 + 32), "status") == 1)
      objc_msgSend(*(id *)(a1 + 40), "_setState:notify:", 1, 1);
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)resolveAmbiguousRequirementsWithProductIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  PKSecureElementProvisioningState *provisioningState;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    if (!self->_state)
    {
      v9 = v4;
      -[PKSecureElementProvisioningState requirementsResponse](self->_provisioningState, "requirementsResponse");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "status");

      v4 = v9;
      if (v6 == 2)
      {
        -[PKPaymentProvisioningController _setState:notify:](self, "_setState:notify:", 1, 0);
        provisioningState = self->_provisioningState;
        v8 = (void *)objc_msgSend(v9, "copy");
        -[PKSecureElementProvisioningState setProductIdentifier:](provisioningState, "setProductIdentifier:", v8);

        v4 = v9;
      }
    }
  }

}

- (void)resolveRequirementsUsingProduct:(id)a3
{
  id v4;
  PKPaymentRequirementsResponse *v5;
  id v6;

  v4 = a3;
  if (v4 && !self->_state)
  {
    v6 = v4;
    -[PKPaymentProvisioningController _setState:notify:](self, "_setState:notify:", 1, 0);
    v5 = -[PKPaymentRequirementsResponse initWithProduct:]([PKPaymentRequirementsResponse alloc], "initWithProduct:", v6);
    -[PKSecureElementProvisioningState setRequirementsResponse:](self->_provisioningState, "setRequirementsResponse:", v5);

    v4 = v6;
  }

}

- (void)resolveRequirementsUsingProvisioningMethodMetadata:(id)a3
{
  id v4;
  PKPaymentRequirementsResponse *v5;
  id v6;

  v4 = a3;
  if (v4 && !self->_state)
  {
    v6 = v4;
    -[PKPaymentProvisioningController _setState:notify:](self, "_setState:notify:", 1, 0);
    v5 = -[PKPaymentRequirementsResponse initWithProvisioningMethodMetadata:]([PKPaymentRequirementsResponse alloc], "initWithProvisioningMethodMetadata:", v6);
    -[PKSecureElementProvisioningState setRequirementsResponse:](self->_provisioningState, "setRequirementsResponse:", v5);

    v4 = v6;
  }

}

- (void)resolveRequirementsForShareableCredential:(id)a3
{
  id v5;
  NSObject *v6;
  PKPaymentCredential *currentCredential;
  void *v8;
  int64_t state;
  int v10;
  PKPaymentCredential *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    currentCredential = self->_currentCredential;
    v10 = 138412290;
    v11 = currentCredential;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "resolivng requirements for credential %@", (uint8_t *)&v10, 0xCu);
  }

  if (!self->_state)
  {
    -[PKPaymentProvisioningController _setState:notify:](self, "_setState:notify:", 1, 0);
    objc_storeStrong((id *)&self->_currentCredential, a3);
    +[PKPaymentRequirementsResponse emptyRequirementsResponse](PKPaymentRequirementsResponse, "emptyRequirementsResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementProvisioningState setRequirementsResponse:](self->_provisioningState, "setRequirementsResponse:", v8);

  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    state = self->_state;
    v10 = 67109120;
    LODWORD(v11) = state;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "state is %d", (uint8_t *)&v10, 8u);
  }

}

- (void)resolveRequirementsForIssuerProvisioningExtensionCredential:(id)a3
{
  id v5;
  NSObject *v6;
  PKPaymentCredential *currentCredential;
  void *v8;
  int64_t state;
  int v10;
  PKPaymentCredential *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    currentCredential = self->_currentCredential;
    v10 = 138412290;
    v11 = currentCredential;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "resolivng requirements for credential %@", (uint8_t *)&v10, 0xCu);
  }

  if (!self->_state)
  {
    -[PKPaymentProvisioningController _setState:notify:](self, "_setState:notify:", 1, 0);
    objc_storeStrong((id *)&self->_currentCredential, a3);
    +[PKPaymentRequirementsResponse emptyRequirementsResponse](PKPaymentRequirementsResponse, "emptyRequirementsResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementProvisioningState setRequirementsResponse:](self->_provisioningState, "setRequirementsResponse:", v8);

  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    state = self->_state;
    v10 = 67109120;
    LODWORD(v11) = state;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "state is %d", (uint8_t *)&v10, 8u);
  }

}

- (BOOL)setState:(int64_t)a3 forCredential:(id)a4
{
  id v6;
  NSObject *v7;
  PKPaymentCredential *currentCredential;
  int v9;
  BOOL v10;
  unint64_t state;
  _BOOL4 v12;
  const __CFString *v13;
  int64_t v14;
  int v16;
  _BYTE v17[14];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    currentCredential = self->_currentCredential;
    v16 = 67109378;
    *(_DWORD *)v17 = a3;
    *(_WORD *)&v17[4] = 2112;
    *(_QWORD *)&v17[6] = currentCredential;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to set provisioning controller state to %d for credential %@", (uint8_t *)&v16, 0x12u);
  }

  switch(a3)
  {
    case 0:
      v9 = 1;
      break;
    case 1:
      v10 = self->_state == 0;
      goto LABEL_12;
    case 2:
      v10 = self->_state == 1;
      goto LABEL_12;
    case 3:
      state = self->_state;
      goto LABEL_10;
    case 4:
      state = self->_state & 0xFFFFFFFFFFFFFFFELL;
LABEL_10:
      v10 = state == 2;
      goto LABEL_12;
    case 5:
      v10 = self->_state == 4;
LABEL_12:
      v9 = v10;
      break;
    default:
      v9 = 0;
      break;
  }
  if ((objc_msgSend(v6, "isHomeKeyCredential") & 1) != 0
    || (objc_msgSend(v6, "isAppleBalanceCredential") | v9) == 1)
  {
    -[PKPaymentProvisioningController _setState:notify:](self, "_setState:notify:", a3, 0);
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("failed");
    v14 = self->_state;
    if (v12)
      v13 = CFSTR("succeeded");
    v16 = 138412546;
    *(_QWORD *)v17 = v13;
    *(_WORD *)&v17[8] = 1024;
    *(_DWORD *)&v17[10] = v14;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Setting provisioning controller state %@, state is %d", (uint8_t *)&v16, 0x12u);
  }

  return v12;
}

- (void)resolveLocalEligibilityRequirementsForAppleBalanceCredential:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  char v8;
  PKAsyncUnaryOperationComposer *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD *v16;
  id v17;
  id location;
  _QWORD v19[6];
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "isAppleBalanceCredential");
  if ((objc_msgSend(v6, "isRemoteCredential") & 1) != 0
    || (v8 & 1) != 0
    || objc_msgSend(v6, "isLocalPassCredential"))
  {
    v9 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__38;
    v21[4] = __Block_byref_object_dispose__38;
    v10 = MEMORY[0x1E0C809B0];
    v22 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __111__PKPaymentProvisioningController_resolveLocalEligibilityRequirementsForAppleBalanceCredential_withCompletion___block_invoke;
    v20[3] = &unk_1E2AC5118;
    v20[4] = v21;
    -[PKAsyncUnaryOperationComposer addOperation:](v9, "addOperation:", v20);
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __111__PKPaymentProvisioningController_resolveLocalEligibilityRequirementsForAppleBalanceCredential_withCompletion___block_invoke_413;
    v19[3] = &unk_1E2AC7148;
    v19[4] = self;
    v19[5] = v21;
    -[PKAsyncUnaryOperationComposer addOperation:](v9, "addOperation:", v19);
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __111__PKPaymentProvisioningController_resolveLocalEligibilityRequirementsForAppleBalanceCredential_withCompletion___block_invoke_419;
    v13[3] = &unk_1E2AD0D88;
    v16 = v21;
    objc_copyWeak(&v17, &location);
    v14 = v6;
    v15 = v7;
    v12 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v9, "evaluateWithInput:completion:", v11, v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    _Block_object_dispose(v21, 8);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __111__PKPaymentProvisioningController_resolveLocalEligibilityRequirementsForAppleBalanceCredential_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, id, BOOL);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t v16[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "ams_isActiveAccountCombined") & 1) == 0)
  {
    objc_msgSend(v8, "ams_activeiTunesAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Apple Account provisioning failed: iCloud and iTunes account do not match", v16, 2u);
      }

      PKLocalizedLynxString(CFSTR("ELIGIBILITY_ERROR_SPLIT_ACCOUNT_TITLE"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedLynxString(CFSTR("ELIGIBILITY_ERROR_SPLIT_ACCOUNT_MESSAGE"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustomWithType(-1, v11, v12, 0, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
  v7[2](v7, v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0);

}

void __111__PKPaymentProvisioningController_resolveLocalEligibilityRequirementsForAppleBalanceCredential_withCompletion___block_invoke_413(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, id, BOOL);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryAuthKitAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appleIDCountryCodeForAccount:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "targetDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deviceRegion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v12, "isEqualToString:", v10) & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412546;
      v20 = v10;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Apple Account provisioning failed: account region %@ and device region %@ do not match", (uint8_t *)&v19, 0x16u);
    }

    PKLocalizedLynxString(CFSTR("ELIGIBILITY_ERROR_REGION_MISMATCH_TITLE"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedLynxString(CFSTR("ELIGIBILITY_ERROR_REGION_MISMATCH_MESSAGE"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustomWithType(-1, v14, v15, 0, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
  v7[2](v7, v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0);

}

void __111__PKPaymentProvisioningController_resolveLocalEligibilityRequirementsForAppleBalanceCredential_withCompletion___block_invoke_419(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id *WeakRetained;
  id *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      objc_storeStrong(WeakRetained + 8, *(id *)(a1 + 32));
      objc_msgSend(v8, "_setState:notify:", 1, 0);
    }

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void)requestEligibility:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  int64_t state;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PKAddPaymentPassRequestConfiguration *v17;
  PKAddPaymentPassRequestConfiguration *currentAddPaymentPassRequestConfiguration;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  __CFString *v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  PKProvisioningUtility *utility;
  void *v38;
  _QWORD v39[5];
  void (**v40)(id, void *, _QWORD);
  uint64_t *v41;
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  state = self->_state;
  if (state == 1)
    goto LABEL_5;
  if (!state)
  {
    objc_msgSend(v6, "paymentCredential");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

      goto LABEL_5;
    }
    objc_msgSend(v6, "issuerIdentifier");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      objc_msgSend(v6, "encryptedCardData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
LABEL_5:
        objc_msgSend(v6, "paymentCredential");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "state");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "eligibilityResponse");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 && objc_msgSend(v12, "eligibilityStatus") == 1)
        {
          -[PKSecureElementProvisioningState setEligibilityResponse:](self->_provisioningState, "setEligibilityResponse:", v12);
          -[PKPaymentProvisioningController _setState:notify:](self, "_setState:notify:", 2, 1);
          if (v7)
            v7[2](v7, v12, 0);
LABEL_30:

          goto LABEL_31;
        }
        v43 = 0;
        v44 = &v43;
        v45 = 0x2020000000;
        v13 = MEMORY[0x1E0C809B0];
        v46 = 0;
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __76__PKPaymentProvisioningController_requestEligibility_withCompletionHandler___block_invoke;
        v42[3] = &unk_1E2AC5078;
        v42[4] = &v43;
        v14 = PKBeginBackgroundTask(CFSTR("com.apple.passbook.cardChecking"), v42);
        v44[3] = v14;
        -[PKSecureElementProvisioningState referrerIdentifier](self->_provisioningState, "referrerIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[PKSecureElementProvisioningState referrerIdentifier](self->_provisioningState, "referrerIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setReferrerIdentifier:", v16);

        }
        objc_msgSend(v6, "addPaymentPassRequestConfiguration");
        v17 = (PKAddPaymentPassRequestConfiguration *)objc_claimAutoreleasedReturnValue();
        currentAddPaymentPassRequestConfiguration = self->_currentAddPaymentPassRequestConfiguration;
        self->_currentAddPaymentPassRequestConfiguration = v17;

        if (-[PKPaymentProvisioningController _isProvisioningPaymentAccount](self, "_isProvisioningPaymentAccount"))
        {
          PKLocalizedAquamanString(CFSTR("PROGRESS_CONTACTING_ACCOUNT_ISSUER"), 0);
          v19 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v6, "paymentCredential");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "credentialType");

          if (v21 == 135)
          {
            v22 = 0;
            goto LABEL_21;
          }
          PKCoreLocalizedString(CFSTR("PROGRESS_CONTACTING_ISSUER"), 0);
          v19 = objc_claimAutoreleasedReturnValue();
        }
        v22 = (void *)v19;
LABEL_21:
        -[PKPaymentProvisioningController _setLocalizedProgressDescription:](self, "_setLocalizedProgressDescription:", v22);
        if (-[PKSecureElementProvisioningState hasNonce](self->_provisioningState, "hasNonce")
          && objc_msgSend(v6, "requiresNonce"))
        {
          -[PKSecureElementProvisioningState useNonce](self->_provisioningState, "useNonce");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setNonce:", v26);

        }
        objc_msgSend(v6, "paymentCredential", v12);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "state");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          v31 = v22;
          v32 = v13;
          v33 = v29;
        }
        else
        {
          -[PKSecureElementProvisioningState sid](self->_provisioningState, "sid");
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = (void *)v34;
          v31 = v22;
          v32 = v13;
          v36 = &stru_1E2ADF4C0;
          if (v34)
            v36 = (__CFString *)v34;
          v33 = v36;

        }
        utility = self->_utility;
        v39[0] = v32;
        v39[1] = 3221225472;
        v39[2] = __76__PKPaymentProvisioningController_requestEligibility_withCompletionHandler___block_invoke_2;
        v39[3] = &unk_1E2AD0CE8;
        v39[4] = self;
        v40 = v7;
        v41 = &v43;
        -[PKProvisioningUtility requestEligibility:sid:completion:](utility, "requestEligibility:sid:completion:", v6, v33, v39);

        _Block_object_dispose(&v43, 8);
        v12 = v38;
        goto LABEL_30;
      }
    }
  }
  if (v7)
    v7[2](v7, 0, 0);
LABEL_31:

}

void __76__PKPaymentProvisioningController_requestEligibility_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    PKEndBackgroundTask(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

void __76__PKPaymentProvisioningController_requestEligibility_withCompletionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __76__PKPaymentProvisioningController_requestEligibility_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E2AD0CC0;
  v7 = a1[4];
  v8 = (void *)a1[5];
  v14 = v5;
  v15 = v7;
  block[1] = 3221225472;
  v16 = v6;
  v9 = v8;
  v10 = a1[6];
  v17 = v9;
  v18 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __76__PKPaymentProvisioningController_requestEligibility_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 168);
    objc_msgSend(v2, "nonce");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNonce:", v4);

    if (!*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "setEligibilityResponse:", *(_QWORD *)(a1 + 32));
      v7 = objc_msgSend(*(id *)(a1 + 32), "eligibilityStatus");
      if (v7 == 3)
      {
        objc_msgSend(*(id *)(a1 + 40), "_passAlreadyProvisioned");
      }
      else if (v7 == 1)
      {
        objc_msgSend(*(id *)(a1 + 40), "_setState:notify:", 2, 1);
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
  {
    if (*(_QWORD *)(a1 + 48))
      v6 = 0;
    else
      v6 = *(_QWORD *)(a1 + 32);
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v6);
  }
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v8)
  {
    PKEndBackgroundTask(v8);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
}

- (void)acceptTerms
{
  unint64_t state;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state == 3)
  {
    self->_state = 4;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      PKPaymentProvisioningControllerStateToString(state);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Terms accept requested but found incorrect state: %@", (uint8_t *)&v5, 0xCu);

    }
  }
}

- (void)declineTerms
{
  unint64_t state;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state == 3)
  {
    self->_state = 1;
    -[PKSecureElementProvisioningState setEligibilityResponse:](self->_provisioningState, "setEligibilityResponse:", 0);
    v4 = -[PKSecureElementProvisioningState useNonce](self->_provisioningState, "useNonce");
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      PKPaymentProvisioningControllerStateToString(state);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Terms decline requested but found incorrect state: %@", (uint8_t *)&v7, 0xCu);

    }
  }
}

- (void)resolveProvisioningForCredential:(id)a3
{
  NSMutableArray *associatedCredentials;
  id v5;
  PKPaymentCredential *currentCredential;

  if (!self->_state)
  {
    associatedCredentials = self->_associatedCredentials;
    v5 = a3;
    -[NSMutableArray removeObject:](associatedCredentials, "removeObject:", v5);
    -[PKPaymentProvisioningControllerCredentialQueue removeCredential:](self->_credentialProvisioningQueue, "removeCredential:", v5);

    currentCredential = self->_currentCredential;
    self->_currentCredential = 0;

    -[PKPaymentProvisioningController _setState:notify:](self, "_setState:notify:", 5, 1);
  }
}

- (void)requestExternalizedAuthForWatchWithVisibleViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Requesting and storing externalized auth", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PKPaymentProvisioningController_requestExternalizedAuthForWatchWithVisibleViewController_completion___block_invoke;
  aBlock[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v13 = v9;
  v10 = _Block_copy(aBlock);
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "requestAndStoreExternalizedAuthWithVisibleViewController:completion:", v6, v10);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "requestAndStoreExternalizedAuthWithCompletion:", v10);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Target device doesn't support generating an externalized auth. Let the user proceed anyways because it might succeed", buf, 2u);
    }

    if (v9)
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

void __103__PKPaymentProvisioningController_requestExternalizedAuthForWatchWithVisibleViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Requested externalized auth returned %@", buf, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v3)
    {
      v6 = objc_msgSend(v3, "code");
      v7 = *(_QWORD *)(a1 + 32);
      if (v6 == 4)
      {
        (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v3);
      }
      else
      {
        v8 = (void *)MEMORY[0x1E0CB35C8];
        PKLocalizedPaymentString(CFSTR("WATCH_ON_WRIST_REQUIREMENTS_TITLE"), 0, *MEMORY[0x1E0CB2D50]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v9;
        v13[1] = *MEMORY[0x1E0CB2D80];
        PKLocalizedPaymentString(CFSTR("WATCH_ON_WRIST_REQUIREMENTS_MESSAGE"), 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14[1] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("PKDisplayableError"), 60000, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, 1, v12);

      }
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 1, 0);
    }
  }

}

- (void)storeExternalizedAuth:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_externalizedAuth, a3);
    v5 = v6;
  }

}

- (BOOL)hasExternalizedAuth
{
  return -[NSData length](self->_externalizedAuth, "length") != 0;
}

- (id)retrieveExternalizedAuth
{
  return self->_externalizedAuth;
}

- (void)requestProvisioning:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__PKPaymentProvisioningController_requestProvisioning_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E2AD0D10;
  v9 = v6;
  v7 = v6;
  -[PKPaymentProvisioningController requestProvisioning:withCompletion:](self, "requestProvisioning:withCompletion:", a3, v8);

}

uint64_t __77__PKPaymentProvisioningController_requestProvisioning_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (void)requestProvisioning:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKAsyncUnaryOperationComposer *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_state == 4)
  {
    v9 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    objc_initWeak(&location, self);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__38;
    v20[4] = __Block_byref_object_dispose__38;
    v21 = 0;
    v10 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[2] = __70__PKPaymentProvisioningController_requestProvisioning_withCompletion___block_invoke;
    v18[3] = &unk_1E2AD0D60;
    v18[1] = 3221225472;
    objc_copyWeak(&v19, &location);
    v18[4] = v20;
    -[PKAsyncUnaryOperationComposer addOperation:](v9, "addOperation:", v18);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __70__PKPaymentProvisioningController_requestProvisioning_withCompletion___block_invoke_3;
    v13[3] = &unk_1E2AD0D88;
    objc_copyWeak(&v17, &location);
    v14 = v6;
    v15 = v8;
    v16 = v20;
    v12 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v9, "evaluateWithInput:completion:", v11, v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    _Block_object_dispose(v20, 8);

    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);
  }

}

void __70__PKPaymentProvisioningController_requestProvisioning_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id *WeakRetained;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained[8];
  if (objc_msgSend(v9, "credentialType") == 135
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v9, "isFromBackgroundProvisioning") & 1) == 0)
  {
    +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__PKPaymentProvisioningController_requestProvisioning_withCompletion___block_invoke_2;
    v11[3] = &unk_1E2AD0D38;
    v14 = *(_QWORD *)(a1 + 32);
    v13 = v7;
    v12 = v6;
    objc_msgSend(v10, "backgroundProvisionInProgressForFeature:withCompletion:", 4, v11);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

uint64_t __70__PKPaymentProvisioningController_requestProvisioning_withCompletion___block_invoke_2(_QWORD *a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a2)
  {
    PKLocalizedLynxString(CFSTR("ERROR_BACKGROUND_PROVISION_IN_PROGRESS_TITLE"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedLynxString(CFSTR("ERROR_BACKGROUND_PROVISION_IN_PROGRESS_MESSAGE"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustomWithType(-1, v3, v4, 0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  return (*(uint64_t (**)(_QWORD, _QWORD, BOOL))(a1[5] + 16))(a1[5], a1[4], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0);
}

void __70__PKPaymentProvisioningController_requestProvisioning_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  id WeakRetained;

  if ((objc_msgSend(a4, "isCanceled") & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_requestProvisioning:withCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)_noteProvisioningDidBegin
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PKPaymentProvisioningController__noteProvisioningDidBegin__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __60__PKPaymentProvisioningController__noteProvisioningDidBegin__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Received Note provisioning did begin (%li)", (uint8_t *)&buf, 0xCu);
  }

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) == 1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Note provisioning did begin to target device", (uint8_t *)&buf, 2u);
    }

    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "_localizedProgressDescriptionForEnablingCard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setLocalizedProgressDescription:", v5);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "targetDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "noteProvisioningDidBegin");

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v10 = 0x2020000000;
    v11 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__PKPaymentProvisioningController__noteProvisioningDidBegin__block_invoke_444;
    v8[3] = &unk_1E2AC5078;
    v8[4] = &buf;
    v7 = PKBeginBackgroundTask(CFSTR("com.apple.passbook.cardProvisioning"), v8);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v7;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = v7;
    _Block_object_dispose(&buf, 8);
  }
}

void __60__PKPaymentProvisioningController__noteProvisioningDidBegin__block_invoke_444(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    PKEndBackgroundTask(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (void)_noteProvisioningDidEnd
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PKPaymentProvisioningController__noteProvisioningDidEnd__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __58__PKPaymentProvisioningController__noteProvisioningDidEnd__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
    v7 = 134217984;
    v8 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Received Note provisioning did end (%li)", (uint8_t *)&v7, 0xCu);
  }

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  if (v4)
  {
    if (v4 < 0)
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 134217984;
        v8 = v4;
        _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Unbalance Note provisioning did begin/end current count:%li. Setting back to 0", (uint8_t *)&v7, 0xCu);
      }

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Note provisioning did end to target device", (uint8_t *)&v7, 2u);
    }

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
    if (v5)
    {
      PKEndBackgroundTask(v5);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
    }
    else
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Unexpected invalid background task identifier", (uint8_t *)&v7, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_setLocalizedProgressDescription:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "targetDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "noteProvisioningDidEnd");

  }
}

- (id)_localizedProgressDescriptionForEnablingCard
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (-[PKPaymentProvisioningController _isProvisioningPaymentAccount](self, "_isProvisioningPaymentAccount")
    || -[PKPaymentCredential credentialType](self->_currentCredential, "credentialType") == 135)
  {
    -[PKPaymentCredential longDescription](self->_currentCredential, "longDescription");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      PKLocalizedAquamanString(CFSTR("PROGRESS_SETTING_UP_ACCOUNT"), CFSTR("%@"), v3);
    else
      PKLocalizedAquamanString(CFSTR("PROGRESS_SETTING_UP_ACCOUNT_GENERIC"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PKCoreLocalizedString(CFSTR("PROGRESS_ENABLING_CARD"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)ingestSecureElementPassForCredential:(id)a3 completion:(id)a4
{
  PKPaymentCredential *v6;
  id v7;
  PKPaymentCredential *currentCredential;
  PKPaymentCredential *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v6 = (PKPaymentCredential *)a3;
  v7 = a4;
  currentCredential = self->_currentCredential;
  self->_currentCredential = v6;
  v9 = v6;

  -[PKPaymentProvisioningController _effectiveSessionIdentifier](self, "_effectiveSessionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentProvisioningController provisioningTracker](self, "provisioningTracker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__PKPaymentProvisioningController_ingestSecureElementPassForCredential_completion___block_invoke;
  v15[3] = &unk_1E2AD0E00;
  v15[4] = self;
  v16 = v10;
  v17 = v11;
  v18 = v7;
  v12 = v11;
  v13 = v10;
  v14 = v7;
  -[PKPaymentProvisioningController _updateCredentialWithPaymentPass:completion:](self, "_updateCredentialWithPaymentPass:completion:", v9, v15);

}

void __83__PKPaymentProvisioningController_ingestSecureElementPassForCredential_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKPaymentProvisioningPassData *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  PKPaymentProvisioningPassData *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  PKPaymentProvisioningPassData *v13;
  id v14;
  id v15;

  v3 = a2;
  if (v3)
  {
    v4 = -[PKPaymentProvisioningPassData initWithSecureElementPass:]([PKPaymentProvisioningPassData alloc], "initWithSecureElementPass:", v3);
    objc_msgSend(*(id *)(a1 + 32), "_addOrUpdateProvisonedPassData:", v4);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v5 + 16);
    v8 = *(_QWORD *)(v5 + 312);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __83__PKPaymentProvisioningController_ingestSecureElementPassForCredential_completion___block_invoke_2;
    v12[3] = &unk_1E2AD0DD8;
    v12[4] = v5;
    v15 = *(id *)(a1 + 56);
    v13 = v4;
    v14 = *(id *)(a1 + 48);
    v9 = v4;
    objc_msgSend(v7, "ingestProvisioningPassData:cloudStoreCoordinatorDelegate:moreInfoURLs:ingestionProperties:sid:completion:", v9, v8, 0, 0, v6, v12);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 56);
    PKDisplayableErrorForCommonType(1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

  }
}

void __83__PKPaymentProvisioningController_ingestSecureElementPassForCredential_completion___block_invoke_2(uint64_t a1, void *a2, char a3, char a4)
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  char v15;

  v7 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__PKPaymentProvisioningController_ingestSecureElementPassForCredential_completion___block_invoke_3;
  v9[3] = &unk_1E2AD0DB0;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v14 = a3;
  v15 = a4;
  v13 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __83__PKPaymentProvisioningController_ingestSecureElementPassForCredential_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 432), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 297) = *(_BYTE *)(a1 + 72);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 298) = *(_BYTE *)(a1 + 73);
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48), 0);
  return result;
}

- (void)_requestProvisioning:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PKProvisioningUtility *utility;
  NSData *externalizedAuth;
  PKCloudStoreCoordinatorDelegate *cloudStoreCoordinator;
  _BOOL8 v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  _QWORD aBlock[6];

  v6 = a3;
  v7 = a4;
  -[PKPaymentProvisioningController provisioningTracker](self, "provisioningTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentProvisioningController _effectiveSessionIdentifier](self, "_effectiveSessionIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E2ABE120;
  aBlock[4] = self;
  v26 = _Block_copy(aBlock);
  v35[0] = v9;
  v35[1] = 3221225472;
  v35[2] = __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_3;
  v35[3] = &unk_1E2AD0E28;
  v35[4] = self;
  v10 = v7;
  v37 = v10;
  v11 = v8;
  v36 = v11;
  v12 = _Block_copy(v35);
  v31[0] = v9;
  v31[1] = 3221225472;
  v31[2] = __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_4;
  v31[3] = &unk_1E2AD0E50;
  v31[4] = self;
  v13 = v6;
  v32 = v13;
  v14 = v10;
  v34 = v14;
  v15 = v11;
  v33 = v15;
  v16 = _Block_copy(v31);
  -[PKSecureElementProvisioningState referrerIdentifier](self->_provisioningState, "referrerIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PKSecureElementProvisioningState referrerIdentifier](self->_provisioningState, "referrerIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setReferrerIdentifier:", v18);

  }
  -[PKSecureElementProvisioningState useNonce](self->_provisioningState, "useNonce");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNonce:", v19);

  utility = self->_utility;
  externalizedAuth = self->_externalizedAuth;
  cloudStoreCoordinator = self->_cloudStoreCoordinator;
  v23 = -[PKPaymentCredential isAppleBalanceCredential](self->_currentCredential, "isAppleBalanceCredential");
  v28[0] = v9;
  v28[1] = 3221225472;
  v28[2] = __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_467;
  v28[3] = &unk_1E2AD0E78;
  v29 = v16;
  v30 = v12;
  v24 = v12;
  v25 = v16;
  -[PKProvisioningUtility requestProvisioning:externalizedAuth:cloudStoreCoordinatorDelegate:onStartPassDownload:sid:requireZoneCreationSuccess:completion:](utility, "requestProvisioning:externalizedAuth:cloudStoreCoordinatorDelegate:onStartPassDownload:sid:requireZoneCreationSuccess:completion:", v13, externalizedAuth, cloudStoreCoordinator, v26, v27, v23, v28);

}

void __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E2ABE120;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_setState:notify:", 5, 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "targetDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone")) & 1) != 0)
  {
    v4 = CFSTR("PROGRESS_DOWNLOADING_CARD_IPHONE");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Apple Watch")) & 1) != 0)
  {
    v4 = CFSTR("PROGRESS_DOWNLOADING_CARD_WATCH");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("iPad")))
  {
    v4 = CFSTR("PROGRESS_DOWNLOADING_CARD_IPAD");
  }
  else
  {
    v4 = CFSTR("PROGRESS_DOWNLOADING_CARD_GENERIC");
  }
  PKCoreLocalizedString(&v4->isa, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setLocalizedProgressDescription:", v5);

}

void __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  objc_msgSend(v3, "provisioningResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProvisioningResponse:", v5);

  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 64))
  {
    objc_msgSend(*(id *)(v6 + 40), "removeObject:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "removeCredential:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 64);
    *(_QWORD *)(v7 + 64) = 0;

    v6 = *(_QWORD *)(a1 + 32);
  }
  v9 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = 0;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v3, "provisionedPasses", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(a1 + 32), "_addOrUpdateProvisonedPassData:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  objc_msgSend(v3, "moreInfoItems");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 432);
  *(_QWORD *)(v16 + 432) = v15;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 297) = objc_msgSend(v3, "expressModeSetupOptional");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 298) = objc_msgSend(v3, "ampEnrollmentAvailable");
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v3, "provisionedPasses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "secureElementPass");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "paymentPass");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v16[16];

  v7 = a3;
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  v9 = a4;
  objc_msgSend(a2, "nonce");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNonce:", v10);

  objc_msgSend(*(id *)(a1 + 32), "_handleProvisioningError:forRequest:pass:", v7, *(_QWORD *)(a1 + 40), v9);
  objc_msgSend(v7, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v11, "isEqualToString:", CFSTR("PKPaymentWebServiceErrorDomain"));

  if ((_DWORD)v10 && objc_msgSend(v7, "code") == 40400)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Removing eligibility as next step token is invalid", v16, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "setEligibilityResponse:", 0);
    v13 = *(void **)(a1 + 32);
    v14 = 0;
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    v14 = 1;
  }
  objc_msgSend(v13, "_setState:notify:", v14, 1);
  v15 = *(_QWORD *)(a1 + 56);
  if (v15)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v15 + 16))(v15, 0, *(_QWORD *)(a1 + 48), v7);

}

void __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_467(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_2_468;
  v9[3] = &unk_1E2ACBF80;
  v10 = v6;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_2_468(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "provisionedPasses");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "secureElementPass");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "provisioningResponse");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, id))(v4 + 16))(v4, v5, *(_QWORD *)(a1 + 32), v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)_deletePaymentPass:(id)a3
{
  id v4;
  PKPaymentDeprovisionRequest *v5;

  v4 = a3;
  v5 = -[PKPaymentDeprovisionRequest initWithPaymentPass:]([PKPaymentDeprovisionRequest alloc], "initWithPaymentPass:", v4);

  -[PKPaymentWebService deprovisionForRequest:completion:](self->_webService, "deprovisionForRequest:completion:", v5, 0);
}

- (void)verifyPassIsSupportedForExpressInLocalMarket:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  id location;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = v6;
  objc_msgSend(v6, "paymentPass");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke;
  aBlock[3] = &unk_1E2AD0EA0;
  objc_copyWeak(&v33, &location);
  v9 = v7;
  v32 = v9;
  v10 = _Block_copy(aBlock);
  if (PKLocationServicesEnabled())
  {
    -[PKPaymentWebService context](self->_webService, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "marketsURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "deviceClass");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "deviceVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v8;
      v26[1] = 3221225472;
      v26[2] = __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke_473;
      v26[3] = &unk_1E2AD0F40;
      objc_copyWeak(&v30, &location);
      v29 = v10;
      v17 = v14;
      v27 = v17;
      v28 = v25;
      +[PKPaymentMarketsConfiguration paymentMarketsConfigurationWithURL:forDeviceClass:version:completion:](PKPaymentMarketsConfiguration, "paymentMarketsConfigurationWithURL:forDeviceClass:version:completion:", v13, v15, v16, v26);

      objc_destroyWeak(&v30);
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v36 = v22;
        v23 = v22;
        _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "%@: No markets URL", buf, 0xCu);

      }
      (*((void (**)(void *, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v36 = v19;
      v20 = v19;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "%@: Location services disabled or not authorized", buf, 0xCu);

    }
    (*((void (**)(void *, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

void __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*((id *)WeakRetained + 22), "stopUpdatingLocation");
  v6 = *((_QWORD *)WeakRetained + 23);
  if (v6)
  {
    dispatch_source_cancel(v6);
    v7 = (void *)*((_QWORD *)WeakRetained + 23);
    *((_QWORD *)WeakRetained + 23) = 0;

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v9);

}

void __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke_473(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD aBlock[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v18 = (id)objc_opt_class();
        v19 = 2112;
        v20 = v6;
        v10 = v18;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "%@: Failed to get market data: %@", buf, 0x16u);

      }
      (*((void (**)(void))a1[6] + 2))();
    }
    else
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke_474;
      aBlock[3] = &unk_1E2AD0F18;
      objc_copyWeak(&v16, a1 + 7);
      v15 = a1[6];
      v12 = a1[4];
      v13 = a1[5];
      v14 = v5;
      v8 = _Block_copy(aBlock);
      objc_msgSend(WeakRetained, "_startLocationSearchWithTimeout:completion:", v8, 10.0);

      objc_destroyWeak(&v16);
    }
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke_474(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_19;
  }
  if (!v3)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = (id)objc_opt_class();
      v8 = v27;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "%@: Unable to get location", buf, 0xCu);

    }
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "upgradeRequestForPass:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paymentApplicationIdentifiers");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(*(id *)(a1 + 40), "devicePrimaryPaymentApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "initWithObjects:", v5, 0);
  }
  v10 = (void *)v6;

  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke_477;
  v23[3] = &unk_1E2AD0EC8;
  v12 = *(void **)(a1 + 48);
  v24 = *(id *)(a1 + 40);
  v13 = v10;
  v25 = v13;
  objc_msgSend(v12, "marketsForLocation:passingTest:", v3, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    +[PKPaymentMarketsConfiguration closestMarketFromSet:forLocation:](PKPaymentMarketsConfiguration, "closestMarketFromSet:forLocation:", v14, v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v21[0] = v11;
      v21[1] = 3221225472;
      v21[2] = __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke_479;
      v21[3] = &unk_1E2AD0EF0;
      v22 = *(id *)(a1 + 56);
      objc_msgSend(WeakRetained, "_loadMoreInfoItemForMarket:eligibleMarkets:completionHandler:", v15, v14, v21);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class();
      v18 = *(void **)(a1 + 40);
      v19 = v17;
      objc_msgSend(v18, "uniqueID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v17;
      v28 = 2112;
      v29 = v20;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "%@: no express capable credential type found for the current location on pass: %@.", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

LABEL_19:
}

uint64_t __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke_477(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "expressCredentialTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "devicePaymentApplications", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v9, "applicationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "containsObject:", v11) & 1) != 0)
        break;
      v12 = objc_msgSend(v9, "supportsExpress");

      if ((v12 & 1) != 0)
        goto LABEL_9;
LABEL_10:
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_12;
      }
    }

LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "paymentNetworkIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v3, "containsObject:", v13);

    if ((v14 & 1) != 0)
    {
      v15 = 1;
      goto LABEL_14;
    }
    goto LABEL_10;
  }
LABEL_12:
  v15 = 0;
LABEL_14:

  return v15;
}

uint64_t __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke_479(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)provisionHomeKeyCredential:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD aBlock[4];
  id v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v7;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Provisioning HomeKey credential %@", buf, 0xCu);
  }

  if (self->_state == 4)
  {
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__PKPaymentProvisioningController_provisionHomeKeyCredential_completionHandler___block_invoke;
    aBlock[3] = &unk_1E2ABD9C8;
    v24 = v8;
    v11 = _Block_copy(aBlock);
    objc_storeStrong((id *)&self->_currentCredential, a3);
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "serialNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v10;
      v19[1] = 3221225472;
      v19[2] = __80__PKPaymentProvisioningController_provisionHomeKeyCredential_completionHandler___block_invoke_3;
      v19[3] = &unk_1E2AD0F68;
      v19[4] = self;
      v20 = v7;
      v21 = v12;
      v22 = v11;
      objc_msgSend(v21, "provisionHomeKeyPassForSerialNumbers:completionHandler:", v14, v19);

    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Target device does not response to provisionHomeKeyPassForSerialNumbers:completionHandler:", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void *))v11 + 2))(v11, v18);

    }
    v17 = v24;
    goto LABEL_12;
  }
  if (v8)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2938];
    v27 = CFSTR("Error: provisioning controller in incorrect state:");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *))v8 + 2))(v8, v17);
LABEL_12:

  }
}

void __80__PKPaymentProvisioningController_provisionHomeKeyCredential_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__PKPaymentProvisioningController_provisionHomeKeyCredential_completionHandler___block_invoke_2;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __80__PKPaymentProvisioningController_provisionHomeKeyCredential_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __80__PKPaymentProvisioningController_provisionHomeKeyCredential_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t i;
  PKPaymentProvisioningPassData *v14;
  PKPaymentProvisioningPassData *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  PKPaymentSetupMoreInfoItem *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  PKPaymentSetupMoreInfoItem *v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v31 = objc_msgSend(v5, "count");
    v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Provisioning HomeKey credential returned provisionedPasses: %lu error: %@", buf, 0x16u);
  }

  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setState:notify:", 5, 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "removeCredential:", *(_QWORD *)(a1 + 40));
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v8);
          if (!v11)
            v11 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v14 = [PKPaymentProvisioningPassData alloc];
          v15 = -[PKPaymentProvisioningPassData initWithSecureElementPass:](v14, "initWithSecureElementPass:", v11, (_QWORD)v24);
          objc_msgSend(*(id *)(a1 + 32), "_addOrUpdateProvisonedPassData:", v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v10);

      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 48), "deviceName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Apple Watch"));

        -[NSObject localizedDescription](v11, "localizedDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PKPaymentSetupMoreInfoItemDictionaryForHomeExpress(v18, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = -[PKPaymentSetupMoreInfoItem initWithMoreInfoDictionary:]([PKPaymentSetupMoreInfoItem alloc], "initWithMoreInfoDictionary:", v19);
        v28 = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(void **)(v22 + 432);
        *(_QWORD *)(v22 + 432) = v21;

LABEL_18:
        goto LABEL_19;
      }
    }
    else
    {

    }
    PKLogFacilityTypeGetObject(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18FC92000, v11, OS_LOG_TYPE_ERROR, "Provisioned HomeKey with no error, but no provisioned pass not found!", buf, 2u);
    }
    goto LABEL_18;
  }
LABEL_19:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)_startLocationSearchWithTimeout:(double)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  NSObject *v11;
  id v12;
  double v13;

  v6 = a4;
  v7 = MEMORY[0x1E0C80D38];
  v8 = MEMORY[0x1E0C80D38];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__PKPaymentProvisioningController__startLocationSearchWithTimeout_completion___block_invoke;
  v10[3] = &unk_1E2ABE080;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v13 = a3;
  v9 = v6;
  dispatch_async(v7, v10);

}

void __78__PKPaymentProvisioningController__startLocationSearchWithTimeout_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  const void *v6;
  void (**v7)(void *, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  dispatch_source_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  dispatch_time_t v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD aBlock[4];
  id v43;
  id v44;
  _QWORD handler[4];
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[23];
  if (v3)
  {
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 184);
    *(_QWORD *)(v4 + 184) = 0;

    v2 = *(_QWORD **)(a1 + 32);
  }
  v6 = (const void *)v2[24];
  if (v6)
  {
    v7 = (void (**)(void *, _QWORD))_Block_copy(v6);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 192);
    *(_QWORD *)(v8 + 192) = 0;

    v7[2](v7, 0);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v10 = (void *)v2[22];
  if (!v10)
  {
    if (!v2[25])
    {
      v11 = (void *)MEMORY[0x1E0C9E3A8];
      PKPassKitCoreBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "newAssertionForBundle:withReason:", v12, CFSTR("Passbook is displaying provisioning flow"));
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 200);
      *(_QWORD *)(v14 + 200) = v13;

    }
    v16 = objc_alloc(MEMORY[0x1E0C9E3C8]);
    PKPassKitCoreBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundlePath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "initWithEffectiveBundlePath:delegate:onQueue:", v18, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(v20 + 176);
    *(_QWORD *)(v20 + 176) = v19;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setDesiredAccuracy:", *MEMORY[0x1E0C9E4F8]);
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  }
  objc_msgSend(v10, "location");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v22)
    v23 = *(void **)(*(_QWORD *)(a1 + 32) + 504);
  v24 = v23;

  if (objc_msgSend(*(id *)(a1 + 32), "_isValidLocation:", v24))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v48 = (id)objc_opt_class();
      v49 = 2112;
      v50 = v24;
      v26 = v48;
      _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "%@: current location:%@ is valid will use it.", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v27 = MEMORY[0x1E0C809B0];
    if (*(double *)(a1 + 56) > 0.0)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (void *)objc_opt_class();
        v30 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        v48 = v29;
        v49 = 2048;
        v50 = v30;
        v31 = v29;
        _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, "%@: Start Location search with time out:%fsec", buf, 0x16u);

      }
      v32 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 40));
      v33 = *(_QWORD *)(a1 + 32);
      v34 = *(void **)(v33 + 184);
      *(_QWORD *)(v33 + 184) = v32;

      v35 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 184);
      v36 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
      dispatch_source_set_timer(v35, v36, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      v37 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 184);
      handler[0] = v27;
      handler[1] = 3221225472;
      handler[2] = __78__PKPaymentProvisioningController__startLocationSearchWithTimeout_completion___block_invoke_491;
      handler[3] = &unk_1E2AC3648;
      objc_copyWeak(&v46, (id *)buf);
      dispatch_source_set_event_handler(v37, handler);
      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 184));
      objc_destroyWeak(&v46);
      objc_destroyWeak((id *)buf);
    }
    v38 = a1 + 32;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    aBlock[0] = v27;
    aBlock[1] = 3221225472;
    aBlock[2] = __78__PKPaymentProvisioningController__startLocationSearchWithTimeout_completion___block_invoke_492;
    aBlock[3] = &unk_1E2AD0F90;
    objc_copyWeak(&v44, (id *)buf);
    v43 = *(id *)(a1 + 48);
    v39 = _Block_copy(aBlock);
    v40 = _Block_copy(v39);
    v41 = *(void **)(*(_QWORD *)v38 + 192);
    *(_QWORD *)(*(_QWORD *)v38 + 192) = v40;

    objc_msgSend(*(id *)(*(_QWORD *)v38 + 176), "startUpdatingLocation");
    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)buf);
  }

}

void __78__PKPaymentProvisioningController__startLocationSearchWithTimeout_completion___block_invoke_491(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  id v3;
  const void *v4;
  void (**v5)(void *, _QWORD);
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = (id)objc_opt_class();
      v3 = v8;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "%@: Location search timed out", (uint8_t *)&v7, 0xCu);

    }
    v4 = (const void *)WeakRetained[24];
    if (v4)
    {
      v5 = (void (**)(void *, _QWORD))_Block_copy(v4);
      v6 = (void *)WeakRetained[24];
      WeakRetained[24] = 0;

      v5[2](v5, 0);
    }
  }

}

void __78__PKPaymentProvisioningController__startLocationSearchWithTimeout_completion___block_invoke_492(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PKPaymentProvisioningController__startLocationSearchWithTimeout_completion___block_invoke_2;
  block[3] = &unk_1E2AC8F88;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __78__PKPaymentProvisioningController__startLocationSearchWithTimeout_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained[22], "stopUpdatingLocation");
    v4 = v9[22];
    v9[22] = 0;

    v5 = v9[25];
    v9[25] = 0;

    v3 = v9;
    v6 = v9[23];
    if (v6)
    {
      dispatch_source_cancel(v6);
      v7 = v9[23];
      v9[23] = 0;

      v3 = v9;
    }
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, *(_QWORD *)(a1 + 32));
      v3 = v9;
    }
  }

}

- (BOOL)_isValidLocation:(id)a3
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  BOOL v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "horizontalAccuracy");
  if (v5 >= *MEMORY[0x1E0C9E4F8])
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v3, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v6);
    v8 = v7 < 300.0;

  }
  return v8;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = (id)objc_opt_class();
    v24 = 2112;
    v25 = v7;
    v9 = v23;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%@: received locations:%@", buf, 0x16u);

  }
  if (self->_locationCompletion)
  {
    objc_initWeak((id *)buf, self);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (-[PKPaymentProvisioningController _isValidLocation:](self, "_isValidLocation:", v14))
          {
            v15[0] = MEMORY[0x1E0C809B0];
            v15[1] = 3221225472;
            v15[2] = __70__PKPaymentProvisioningController_locationManager_didUpdateLocations___block_invoke;
            v15[3] = &unk_1E2ABE7B0;
            objc_copyWeak(&v16, (id *)buf);
            v15[4] = v14;
            dispatch_async(MEMORY[0x1E0C80D38], v15);
            objc_destroyWeak(&v16);
            goto LABEL_14;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_14:

    objc_destroyWeak((id *)buf);
  }

}

void __70__PKPaymentProvisioningController_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[24];
    if (v4)
    {
      v6 = v3;
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 32));
      v5 = (void *)v6[24];
      v6[24] = 0;

      v3 = v6;
    }
  }

}

- (id)_eligibleMarketNames:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "analyticsReportingNameValue", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_loadMoreInfoItemForMarket:(id)a3 eligibleMarkets:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "notificationAssetIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKMobileAssetManager sharedInstance](PKMobileAssetManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__PKPaymentProvisioningController__loadMoreInfoItemForMarket_eligibleMarkets_completionHandler___block_invoke;
  v16[3] = &unk_1E2AD0FB8;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "fetchMarketNotificationAssetsForIdentifier:isDiscretionary:completionHandler:", v11, 0, v16);

}

void __96__PKPaymentProvisioningController__loadMoreInfoItemForMarket_eligibleMarkets_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  PKPaymentSetupMoreInfoItem *v11;
  void *v12;
  PKPaymentSetupMoreInfoItem *v13;
  id v14;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 344);
  v4 = a2;
  objc_msgSend(v3, "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v6, "isEqualToString:", CFSTR("Apple Watch"));

  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 40), "analyticsReportingNameValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safelySetObject:forKey:", v7, CFSTR("marketName"));

  objc_msgSend(*(id *)(a1 + 40), "region");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safelySetObject:forKey:", v8, CFSTR("marketRegion"));

  objc_msgSend(*(id *)(a1 + 32), "_eligibleMarketNames:", *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safelySetObject:forKey:", v9, CFSTR("eligibleMarkets"));

  v10 = *(_QWORD *)(a1 + 56);
  v11 = [PKPaymentSetupMoreInfoItem alloc];
  PKPaymentSetupMoreInfoItemDictionaryForExpressUpgradeMarket(v4, (int)v3, objc_msgSend(*(id *)(a1 + 40), "expressUpgradeHideDisableAction") == 1, 0, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PKPaymentSetupMoreInfoItem initWithMoreInfoDictionary:](v11, "initWithMoreInfoDictionary:", v12);
  (*(void (**)(uint64_t, PKPaymentSetupMoreInfoItem *))(v10 + 16))(v10, v13);

}

- (void)removeProvisionedPasses
{
  NSMutableOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  PKPaymentWebService *webService;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_provisionedPasses;
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v7), "secureElementPass");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "paymentPass");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          webService = self->_webService;
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __58__PKPaymentProvisioningController_removeProvisionedPasses__block_invoke;
          v12[3] = &unk_1E2AC2F80;
          v13 = v9;
          objc_msgSend(v10, "paymentWebService:removePass:withCompletionHandler:", webService, v13, v12);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  -[NSMutableOrderedSet removeAllObjects](self->_provisionedPasses, "removeAllObjects");
}

void __58__PKPaymentProvisioningController_removeProvisionedPasses__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Error removing provisioned pass. pass=%@, error=%@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)_passAlreadyProvisioned
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController _passAlreadyProvisioned. Calling download all payment passes.", v5, 2u);
  }

  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "downloadAllPaymentPassesForPaymentWebService:", self->_webService);

}

- (void)_handleProvisioningError:(id)a3 forRequest:(id)a4 pass:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "eligibilityResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v7, "applicationIdentifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(v7, "subCredentialIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(6uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = v13;
    v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController handling provisioning error for aid: %@ subcredentialId: %@", (uint8_t *)&v18, 0x16u);
  }

  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v17, "deleteKeyMaterialForSubCredentialId:", v14);
  }
  else if (v13)
  {
    objc_msgSend(v16, "paymentWebService:deleteApplicationWithAID:", self->_webService, v13);
  }
  if (v8)
    -[PKPaymentProvisioningController _deletePaymentPass:](self, "_deletePaymentPass:", v8);

}

- (void)_setLocalizedProgressDescription:(id)a3
{
  NSString *v4;
  NSString *localizedProgressDescription;
  NSString *v6;
  id v7;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  localizedProgressDescription = self->_localizedProgressDescription;
  self->_localizedProgressDescription = v4;
  v6 = v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:", CFSTR("PKPaymentProvisioningControllerLocalizedProgressDescriptionDidChangeNotification"), self);
}

- (BOOL)provisioningUserInterfaceIsVisible
{
  return self->_provisioningUserInterfaceIsVisible;
}

- (void)noteProvisioningUserInterfaceDidAppear
{
  id v2;

  if (!self->_provisioningUserInterfaceIsVisible)
  {
    self->_provisioningUserInterfaceIsVisible = 1;
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "noteProvisioningUserInterfaceDidAppear");

  }
}

- (void)noteProvisioningUserInterfaceDidDisappear
{
  void *v3;

  if (self->_provisioningUserInterfaceIsVisible)
  {
    self->_provisioningUserInterfaceIsVisible = 0;
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "noteProvisioningUserInterfaceDidDisappear");

    -[PKPaymentProvisioningController _endRequiringUpgradedPasscodeIfNecessary](self, "_endRequiringUpgradedPasscodeIfNecessary");
  }
}

- (BOOL)_isProvisioningPaymentAccount
{
  return -[PKPaymentCredential credentialType](self->_currentCredential, "credentialType") == 123
      || -[PKAddPaymentPassRequestConfiguration isPaymentAccount](self->_currentAddPaymentPassRequestConfiguration, "isPaymentAccount");
}

- (void)addDelegate:(id)a3
{
  os_unfair_lock_s *p_delegatesLock;
  id v5;

  if (a3)
  {
    p_delegatesLock = &self->_delegatesLock;
    v5 = a3;
    os_unfair_lock_lock(p_delegatesLock);
    -[NSHashTable addObject:](self->_delegates, "addObject:", v5);

    os_unfair_lock_unlock(p_delegatesLock);
  }
}

- (void)removeDelegate:(id)a3
{
  os_unfair_lock_s *p_delegatesLock;
  id v5;

  if (a3)
  {
    p_delegatesLock = &self->_delegatesLock;
    v5 = a3;
    os_unfair_lock_lock(p_delegatesLock);
    -[NSHashTable removeObject:](self->_delegates, "removeObject:", v5);

    os_unfair_lock_unlock(p_delegatesLock);
  }
}

- (id)associatedCredentialsForDefaultBehaviour
{
  NSMutableArray *associatedCredentials;
  _QWORD v4[5];

  associatedCredentials = self->_associatedCredentials;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__PKPaymentProvisioningController_associatedCredentialsForDefaultBehaviour__block_invoke;
  v4[3] = &unk_1E2AC17A0;
  v4[4] = self;
  -[NSMutableArray pk_objectsPassingTest:](associatedCredentials, "pk_objectsPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __75__PKPaymentProvisioningController_associatedCredentialsForDefaultBehaviour__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;

  v3 = a2;
  if ((objc_msgSend(v3, "isLocalPassCredential") & 1) != 0
    || (objc_msgSend(v3, "isPeerPaymentCredential") & 1) != 0
    || (objc_msgSend(v3, "isAccountCredential") & 1) != 0
    || (objc_msgSend(v3, "isShareableCredential") & 1) != 0
    || (objc_msgSend(v3, "isLocalAppletSubcredentialPassCredential") & 1) != 0)
  {
    v4 = 1;
    goto LABEL_7;
  }
  if (!objc_msgSend(v3, "isRemoteCredential"))
  {
    v4 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v3, "remoteCredential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "cardType");
  if (v7 == 2)
  {
    LOBYTE(v9) = 1;
LABEL_15:
    v10 = 1;
    goto LABEL_16;
  }
  if (v7)
  {
    LOBYTE(v9) = 0;
    goto LABEL_15;
  }
  v8 = objc_msgSend(v6, "credentialType");
  v9 = ((unint64_t)(v8 - 103) < 7) & (0x61u >> (v8 - 103));
  v10 = (unint64_t)(v8 - 129) < 0xFFFFFFFFFFFFFFFELL;
LABEL_16:
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  objc_msgSend(v6, "productIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "productForProductIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "type");

  v16 = objc_msgSend(v6, "status");
  v17 = v15 != 9 && v10;
  if (v16 == 2)
    v17 = 1;
  if ((v9 & 1) != 0)
    v4 = v16 == 2;
  else
    v4 = v17;

LABEL_7:
  return v4;
}

- (NSArray)allCredentials
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPaymentProvisioningController associatedCredentials](self, "associatedCredentials");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = MEMORY[0x1E0C9AA60];
  if (v4)
    v7 = v4;
  else
    v7 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  -[PKPaymentProvisioningController purchaseCredentials](self, "purchaseCredentials");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = v8;
  else
    v10 = v6;
  objc_msgSend(v3, "addObjectsFromArray:", v10);

  return (NSArray *)v3;
}

- (id)associatedCredentialsForProductIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PKPaymentProvisioningController allCredentials](self, "allCredentials");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__PKPaymentProvisioningController_associatedCredentialsForProductIdentifier___block_invoke;
  v9[3] = &unk_1E2AC17A0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "pk_objectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __77__PKPaymentProvisioningController_associatedCredentialsForProductIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "setupProductIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (BOOL)isPasscodeUpgradeRequired
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PKSecureElementProvisioningState eligibilityResponse](self->_provisioningState, "eligibilityResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "region");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((PKEnforceUpgradedPasscodePolicyForAllRegions() & 1) != 0)
  {
    v5 = 1;
  }
  else if (v4)
  {
    v5 = -[PKPaymentWebService isChinaRegionIdentifier:](self->_webService, "isChinaRegionIdentifier:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)preflightPasscodeUpgradeWithCompletion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void *, uint64_t, _QWORD);
  void *v7;
  char v8;
  void *v9;
  _QWORD aBlock[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKPaymentProvisioningController_preflightPasscodeUpgradeWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2AD0FE0;
  objc_copyWeak(&v12, &location);
  v5 = v4;
  v11 = v5;
  v6 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "notePasscodeUpgradeFlowWillBeginWithCompletion:", v6);

  }
  else
  {
    v6[2](v6, 1, 0);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __74__PKPaymentProvisioningController_preflightPasscodeUpgradeWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(WeakRetained[43], "targetDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        objc_msgSend(v7[43], "targetDevice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __74__PKPaymentProvisioningController_preflightPasscodeUpgradeWithCompletion___block_invoke_2;
        v15[3] = &unk_1E2AD0FE0;
        objc_copyWeak(&v17, (id *)(a1 + 40));
        v16 = *(id *)(a1 + 32);
        objc_msgSend(v10, "enforceUpgradedPasscodePolicyWithCompletion:", v15);

        objc_destroyWeak(&v17);
      }
      else if (*(_QWORD *)(a1 + 32))
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v18 = *MEMORY[0x1E0CB2938];
        v19[0] = CFSTR("Error: target device does not support enforceUpgradedPasscodePolicyWithCompletion:");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
    }
    else
    {
      v11 = *(_QWORD *)(a1 + 32);
      if (v11)
        (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v11 + 16))(v11, 0, 0, v5);
    }
  }

}

void __74__PKPaymentProvisioningController_preflightPasscodeUpgradeWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  uint64_t v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v7)
      objc_msgSend(WeakRetained, "_startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:", a2);
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(uint64_t, BOOL, uint64_t))(v6 + 16))(v6, v7 == 0, a2);
  }

}

- (void)passcodeUpgradeCompleted:(BOOL)a3
{
  void *v4;
  char v5;
  id v6;

  if (self->_state == 2)
  {
    if (a3)
    {
      self->_state = 3;
      goto LABEL_8;
    }
    self->_state = 1;
    goto LABEL_7;
  }
  if (!a3)
LABEL_7:
    -[PKPaymentProvisioningController _endRequiringUpgradedPasscodeIfNecessary](self, "_endRequiringUpgradedPasscodeIfNecessary");
LABEL_8:
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notePasscodeUpgradeFlowDidEnd");

  }
}

- (void)_startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:", v3);

  }
}

- (void)_endRequiringUpgradedPasscodeIfNecessary
{
  void *v3;
  char v4;
  id v5;

  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endRequiringUpgradedPasscodeIfNecessary");

  }
}

- (int64_t)availableSecureElementPassSpaces
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int64_t v11;
  objc_class *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "paymentWebService:passesOfType:", self->_webService, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "pk_countObjectsPassingTest:", &__block_literal_global_514);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - Target device did not respond to passesOfType. Assuming it has no passes", (uint8_t *)&v15, 0xCu);

    }
    v5 = 0;
    if (!v3)
    {
LABEL_13:
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v13;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "%@ - Target device did not respond to max payment cards. Assuming local maximum.", (uint8_t *)&v15, 0xCu);

      }
      v9 = PKMaxPaymentCards();
      if (!v9)
        goto LABEL_9;
LABEL_16:
      v11 = v9 - v5;
      goto LABEL_17;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v9 = objc_msgSend(v3, "maximumPaymentCards");
  if (v9)
    goto LABEL_16;
LABEL_9:
  PKLogFacilityTypeGetObject(6uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Error: Unknown maximum SE cards returned. Returning Not Found.", (uint8_t *)&v15, 2u);
  }

  v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_17:

  return v11;
}

BOOL __67__PKPaymentProvisioningController_availableSecureElementPassSpaces__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "passActivationState") != 4;
}

+ (id)watchWebServiceForIssuerProvisioning
{
  id v2;
  int v3;
  id v4;
  void *v5;

  if (PKIsPairedWithWatch()
    && (v2 = objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_2[0]()),
        v3 = objc_msgSend(v2, "isIssuerAppProvisioningSupported"),
        v2,
        v3))
  {
    v4 = objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_2[0]());
    objc_msgSend(v4, "watchPaymentWebService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)cleanupTransferredCredentialFromSourceDevice:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a4;
  objc_msgSend(a3, "localPassCredential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paymentPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  if (objc_msgSend(v7, "isRemotePass"))
  {
    v10 = objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_2[0]());
    objc_msgSend(v10, "watchPaymentWebService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "targetDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "targetDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __91__PKPaymentProvisioningController_cleanupTransferredCredentialFromSourceDevice_completion___block_invoke;
    v15[3] = &unk_1E2ABDAE0;
    v16 = v9;
    v17 = v5;
    objc_msgSend(v12, "paymentWebService:removePass:withCompletionHandler:", v11, v7, v15);

  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_18FC92000, v13, OS_LOG_TYPE_ERROR, "Error: Target device does not support pass deletion", v14, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
  }

}

void __91__PKPaymentProvisioningController_cleanupTransferredCredentialFromSourceDevice_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__PKPaymentProvisioningController_cleanupTransferredCredentialFromSourceDevice_completion___block_invoke_2;
  v7[3] = &unk_1E2ABE210;
  v11 = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __91__PKPaymentProvisioningController_cleanupTransferredCredentialFromSourceDevice_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56) && !*(_QWORD *)(a1 + 32))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 40);
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Deleted pass: %@ from source device", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Failed to delete pass from source device with error: %@", (uint8_t *)&v6, 0xCu);

    }
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)triggerWatchProvisioningForAppleBalanceCredential:(id)a3
{
  id v3;

  if (objc_msgSend(a3, "isAppleBalanceCredential"))
  {
    if (PKIsPairedWithWatch())
    {
      v3 = objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_2[0]());
      objc_msgSend(v3, "provisionPassForRemoteCredentialWithType:andIdentifier:completion:", 135, 0, &__block_literal_global_519);

    }
  }
}

void __85__PKPaymentProvisioningController_triggerWatchProvisioningForAppleBalanceCredential___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xEuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("failed");
    if (a2)
      v6 = CFSTR("succeeded");
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = a3;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Provisioning Apple Balance pass to Watch %@ with error %@", (uint8_t *)&v7, 0x16u);
  }

}

- (PKPaymentRequirementsResponse)requirementsResponse
{
  return -[PKSecureElementProvisioningState requirementsResponse](self->_provisioningState, "requirementsResponse");
}

- (PKPaymentEligibilityResponse)eligibilityResponse
{
  return -[PKSecureElementProvisioningState eligibilityResponse](self->_provisioningState, "eligibilityResponse");
}

- (PKPaymentProvisioningResponse)provisioningResponse
{
  return -[PKSecureElementProvisioningState provisioningResponse](self->_provisioningState, "provisioningResponse");
}

- (NSString)productIdentifier
{
  return -[PKSecureElementProvisioningState productIdentifier](self->_provisioningState, "productIdentifier");
}

- (NSString)referrerIdentifier
{
  return -[PKSecureElementProvisioningState referrerIdentifier](self->_provisioningState, "referrerIdentifier");
}

- (void)setReferrerIdentifier:(id)a3
{
  -[PKSecureElementProvisioningState setReferrerIdentifier:](self->_provisioningState, "setReferrerIdentifier:", a3);
}

- (void)updateStateAfterProvisioning:(id)a3 credential:(id)a4 passes:(id)a5 moreInfoItems:(id)a6
{
  id v10;
  PKSecureElementProvisioningState *provisioningState;
  id v12;
  id v13;
  void *v14;
  PKSecureElementProvisioningState *v15;
  void *v16;
  PKSecureElementProvisioningState *v17;
  void *v18;
  PKSecureElementProvisioningState *v19;
  void *v20;
  PKSecureElementProvisioningState *v21;
  void *v22;
  NSMutableOrderedSet *v23;
  NSMutableOrderedSet *provisionedPasses;
  id v25;

  v25 = a4;
  v10 = a6;
  provisioningState = self->_provisioningState;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v13, "requirementsResponse");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSecureElementProvisioningState setRequirementsResponse:](provisioningState, "setRequirementsResponse:", v14);

  v15 = self->_provisioningState;
  objc_msgSend(v13, "eligibilityResponse");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSecureElementProvisioningState setEligibilityResponse:](v15, "setEligibilityResponse:", v16);

  v17 = self->_provisioningState;
  objc_msgSend(v13, "provisioningResponse");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSecureElementProvisioningState setProvisioningResponse:](v17, "setProvisioningResponse:", v18);

  v19 = self->_provisioningState;
  objc_msgSend(v13, "productIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSecureElementProvisioningState setProductIdentifier:](v19, "setProductIdentifier:", v20);

  v21 = self->_provisioningState;
  objc_msgSend(v13, "referrerIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSecureElementProvisioningState setReferrerIdentifier:](v21, "setReferrerIdentifier:", v22);
  v23 = (NSMutableOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v12);

  provisionedPasses = self->_provisionedPasses;
  self->_provisionedPasses = v23;

  objc_storeStrong((id *)&self->_moreInfoItems, a6);
  if (v25)
    -[NSMutableArray removeObject:](self->_associatedCredentials, "removeObject:", v25);

}

- (id)_effectiveSessionIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;

  -[PKPaymentCredential state](self->_currentCredential, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PKSecureElementProvisioningState sid](self->_provisioningState, "sid");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = &stru_1E2ADF4C0;
    if (v7)
      v9 = (__CFString *)v7;
    v6 = v9;

  }
  return v6;
}

- (void)finishOptionalExpressModeSetupForPass:(id)a3 withProvisioningTracker:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PKPaymentWebService *webService;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  _BYTE location[12];
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKTargetDeviceSupportsExpress(v11))
  {
    objc_initWeak((id *)location, self);
    webService = self->_webService;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __108__PKPaymentProvisioningController_finishOptionalExpressModeSetupForPass_withProvisioningTracker_completion___block_invoke;
    v14[3] = &unk_1E2AD1068;
    objc_copyWeak(&v18, (id *)location);
    v14[4] = self;
    v15 = v8;
    v16 = v9;
    v17 = v10;
    objc_msgSend(v11, "paymentWebService:handlePotentialExpressPass:withCompletionHandler:", webService, v15, v14);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)location);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[PKPaymentProvisioningController finishOptionalExpressModeSetupForPass:withProvisioning"
                                "Tracker:completion:]";
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "%s called for target device (%@) which does not support express. File a radar!", location, 0x16u);
    }

    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __108__PKPaymentProvisioningController_finishOptionalExpressModeSetupForPass_withProvisioningTracker_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD block[5];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__PKPaymentProvisioningController_finishOptionalExpressModeSetupForPass_withProvisioningTracker_completion___block_invoke_2;
    block[3] = &unk_1E2ABE260;
    v5 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    v8 = v3;
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __108__PKPaymentProvisioningController_finishOptionalExpressModeSetupForPass_withProvisioningTracker_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __108__PKPaymentProvisioningController_finishOptionalExpressModeSetupForPass_withProvisioningTracker_completion___block_invoke_3;
  v6[3] = &unk_1E2ABDA18;
  v8 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleOptionalExpressModeSetupDidFinishForPass:withExpressModes:provisioningTracker:completion:", v3, v4, v5, v6);

}

uint64_t __108__PKPaymentProvisioningController_finishOptionalExpressModeSetupForPass_withProvisioningTracker_completion___block_invoke_3(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
    return (*(uint64_t (**)(uint64_t, BOOL))(v1 + 16))(v1, objc_msgSend(*(id *)(result + 32), "count") != 0);
  return result;
}

- (void)handleOptionalExpressModeSetupDidFinishForPass:(id)a3 withExpressModes:(id)a4 provisioningTracker:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  PKProvisioningUtility *utility;
  PKSecureElementProvisioningState *provisioningState;
  PKPaymentProvisioningController *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  const __CFString *v29;
  __CFString *v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  objc_msgSend(a3, "serialNumber");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (__CFString *)v11;
  else
    v13 = &stru_1E2ADF4C0;
  v14 = v13;

  if (v9)
  {
    objc_msgSend(v9, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(","));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (__CFString *)v16;
    else
      v18 = &stru_1E2ADF4C0;
    v19 = v18;

    v31[0] = CFSTR("automaticExpressModes");
    v31[1] = CFSTR("passSerialNumber");
    v32[0] = v19;
    v32[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = CFSTR("passSerialNumber");
    v30 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  self->_expressModeSetupOptional = 0;
  utility = self->_utility;
  provisioningState = self->_provisioningState;
  v23 = self;
  -[PKSecureElementProvisioningState provisioningResponse](provisioningState, "provisioningResponse");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "moreInfoURLs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __130__PKPaymentProvisioningController_handleOptionalExpressModeSetupDidFinishForPass_withExpressModes_provisioningTracker_completion___block_invoke;
  v27[3] = &unk_1E2ABDE50;
  v27[4] = v23;
  v28 = v10;
  v26 = v10;
  -[PKProvisioningUtility downloadMoreInfoItemsFrom:metadata:sid:completion:](utility, "downloadMoreInfoItemsFrom:metadata:sid:completion:", v25, v20, &stru_1E2ADF4C0, v27);

}

void __130__PKPaymentProvisioningController_handleOptionalExpressModeSetupDidFinishForPass_withExpressModes_provisioningTracker_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __130__PKPaymentProvisioningController_handleOptionalExpressModeSetupDidFinishForPass_withExpressModes_provisioningTracker_completion___block_invoke_2;
  block[3] = &unk_1E2ABE030;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __130__PKPaymentProvisioningController_handleOptionalExpressModeSetupDidFinishForPass_withExpressModes_provisioningTracker_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v5 = *(id *)(a1 + 32);
  if (v5)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = (void *)v5[54];
    v5[54] = v2;

    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
  }

}

- (id)provisioningTracker
{
  return -[PKPaymentProvisioningTracker initWithPaymentProvisioningController:]([PKPaymentProvisioningTracker alloc], "initWithPaymentProvisioningController:", self);
}

- (BOOL)hasPaymentPass
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paymentWebService:passesOfType:", self->_webService, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v6, "count") != 0;

  return v7;
}

- (BOOL)hasPayLaterPass
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  if (self->_queriedHasPayLaterPass)
    return self->_hasPayLaterPass;
  -[PKPaymentProvisioningController _accountsForFeatureIdentifier:](self, "_accountsForFeatureIdentifier:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "associatedPassUniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "paymentWebService:passWithUniqueID:", self->_webService, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "paymentPass");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v11 != 0;
      self->_queriedHasPayLaterPass = 1;

    }
    else
    {
      v3 = 0;
    }
    self->_hasPayLaterPass = v3;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)hasCreditPaymentPass
{
  void *v2;
  BOOL v3;

  -[PKPaymentProvisioningController _paymentPassWithPaymentMethodType:](self, "_paymentPassWithPaymentMethodType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)hasDebitPaymentPass
{
  void *v2;
  BOOL v3;

  -[PKPaymentProvisioningController _paymentPassWithPaymentMethodType:](self, "_paymentPassWithPaymentMethodType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)_paymentPassWithPaymentMethodType:(unint64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paymentWebService:passesOfType:", self->_webService, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "paymentPass", (_QWORD)v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "devicePrimaryPaymentApplication");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "paymentType");

        if (v18 == a3)
        {
          objc_msgSend(v15, "paymentPass");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v19);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  v20 = (void *)objc_msgSend(v9, "copy");
  return v20;
}

- (id)_displayableErrorOverrideForUnderlyingError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  if (!v5)
  {
    objc_msgSend(v3, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("PKWebServiceErrorDomain"));

    if (v8)
    {
      v9 = objc_msgSend(v3, "code");
      if ((unint64_t)(v9 - 2) < 4 || !v9)
      {
        objc_msgSend(v3, "localizedFailureReason");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_13;
LABEL_10:
        objc_msgSend(v3, "localizedFailureReason");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "localizedRecoverySuggestion");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
        v16 = v15;
        PKDisplayableErrorCustomWithType(-1, v14, v15, v3, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(v3, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("PKPaymentWebServiceErrorDomain"));

      if (v12)
      {
        objc_msgSend(v3, "localizedFailureReason");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          goto LABEL_10;
        if (!objc_msgSend(v3, "code"))
        {
LABEL_13:
          PKCoreLocalizedString(CFSTR("COULD_NOT_ADD_CARD_TITLE"), 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          PKCoreLocalizedString(CFSTR("COULD_NOT_ADD_CARD_MESSAGE"), 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
      }
    }
    v6 = 0;
    goto LABEL_15;
  }
  PKDisplayableErrorForCommonType(2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v6;
}

- (id)displayableErrorForError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PKDisplayableError"));

  if (v6)
  {
    v7 = v4;
LABEL_5:
    v8 = v7;
    goto LABEL_6;
  }
  -[PKPaymentProvisioningController _displayableErrorOverrideForUnderlyingError:](self, "_displayableErrorOverrideForUnderlyingError:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    PKDisplayableErrorForCommonType(0, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return v8;
}

- (id)displayableErrorForProvisioningError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PKDisplayableError"));

  if (v6)
  {
    v7 = v4;
LABEL_10:
    v10 = v7;
    goto LABEL_11;
  }
  if (v4)
  {
    objc_msgSend(v4, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PKWebServiceErrorDomain")) & 1) != 0)
    {
      v9 = objc_msgSend(v4, "code");

      if (v9 == 1)
      {
        v10 = 0;
        goto LABEL_11;
      }
    }
    else
    {

    }
  }
  -[PKPaymentProvisioningController _displayableErrorOverrideForUnderlyingError:](self, "_displayableErrorOverrideForUnderlyingError:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    PKDisplayableErrorForCommonType(1, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:

  return v10;
}

- (void)accountAdded:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPaymentProvisioningController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PKPaymentProvisioningController_accountAdded___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __48__PKPaymentProvisioningController_accountAdded___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xEuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Updating setup products because account added: %@", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_reloadSetupProducts");
}

- (void)_reloadSetupProducts
{
  NSSet *supportedFeatureIdentifierStrings;
  NSSet *supportedFeatureIdentifierStringsForAccountProvisioning;
  _QWORD v5[5];

  supportedFeatureIdentifierStrings = self->_supportedFeatureIdentifierStrings;
  self->_supportedFeatureIdentifierStrings = 0;

  supportedFeatureIdentifierStringsForAccountProvisioning = self->_supportedFeatureIdentifierStringsForAccountProvisioning;
  self->_supportedFeatureIdentifierStringsForAccountProvisioning = 0;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PKPaymentProvisioningController__reloadSetupProducts__block_invoke;
  v5[3] = &unk_1E2AC2F80;
  v5[4] = self;
  -[PKPaymentProvisioningController updatePaymentSetupProductModelWithCompletionHandler:](self, "updatePaymentSetupProductModelWithCompletionHandler:", v5);
}

uint64_t __55__PKPaymentProvisioningController__reloadSetupProducts__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_informDelegatesOfAccountsUpdated");
  return result;
}

- (void)featureApplicationAdded:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "applicationState");
  if ((unint64_t)(v5 - 4) < 5 || v5 == 16)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__PKPaymentProvisioningController_featureApplicationAdded___block_invoke;
    v7[3] = &unk_1E2ABE0D0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

void __59__PKPaymentProvisioningController_featureApplicationAdded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setupProductsOfType:", 7);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v29;
    v21 = *(_QWORD *)v29;
    do
    {
      v5 = 0;
      v22 = v3;
      do
      {
        if (*(_QWORD *)v29 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v5);
        objc_msgSend(v6, "configuration");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "featureIdentifier");
        v9 = objc_msgSend(*(id *)(a1 + 40), "feature");

        if (v8 == v9)
        {
          objc_msgSend(v6, "featureApplications");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v25;
            while (2)
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v25 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "applicationIdentifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v16, "isEqualToString:", v17);

                if ((v18 & 1) != 0)
                {
                  v19 = v11;
                  goto LABEL_17;
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              if (v13)
                continue;
              break;
            }
          }

          v19 = (void *)objc_msgSend(v11, "mutableCopy");
          objc_msgSend(v19, "addObject:", *(_QWORD *)(a1 + 40));
          v20 = (void *)objc_msgSend(v19, "copy");
          objc_msgSend(v6, "setFeatureApplications:", v20);

LABEL_17:
          v4 = v21;
          v3 = v22;
        }
        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v3);
  }

}

- (void)featureApplicationRemoved:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PKPaymentProvisioningController_featureApplicationRemoved___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __61__PKPaymentProvisioningController_featureApplicationRemoved___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setupProductsOfType:", 7);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v31;
    v21 = *(_QWORD *)v31;
    do
    {
      v5 = 0;
      v22 = v3;
      do
      {
        if (*(_QWORD *)v31 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v5);
        objc_msgSend(v6, "configuration");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "featureIdentifier");
        v9 = objc_msgSend(*(id *)(a1 + 40), "feature");

        if (v8 == v9)
        {
          v25 = v5;
          v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v24 = v6;
          objc_msgSend(v6, "featureApplications");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v27 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
                objc_msgSend(v16, "applicationIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v17, "isEqualToString:", v18);

                if ((v19 & 1) == 0)
                  objc_msgSend(v10, "addObject:", v16);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v13);
          }

          v20 = (void *)objc_msgSend(v10, "copy");
          objc_msgSend(v24, "setFeatureApplications:", v20);

          v4 = v21;
          v3 = v22;
          v5 = v25;
        }
        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v3);
  }

}

- (void)featureApplicationChanged:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "applicationState");
  if ((unint64_t)(v5 - 4) < 5 || v5 == 16)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__PKPaymentProvisioningController_featureApplicationChanged___block_invoke;
    v7[3] = &unk_1E2ABE0D0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
  else
  {
    -[PKPaymentProvisioningController featureApplicationRemoved:](self, "featureApplicationRemoved:", v4);
  }

}

void __61__PKPaymentProvisioningController_featureApplicationChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setupProductsOfType:", 7);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v31;
    v21 = *(_QWORD *)v31;
    do
    {
      v5 = 0;
      v22 = v3;
      do
      {
        if (*(_QWORD *)v31 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v5);
        objc_msgSend(v6, "configuration");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "featureIdentifier");
        v9 = objc_msgSend(*(id *)(a1 + 40), "feature");

        if (v8 == v9)
        {
          v25 = v5;
          v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v24 = v6;
          objc_msgSend(v6, "featureApplications");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v27 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
                objc_msgSend(v16, "applicationIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v17, "isEqualToString:", v18);

                if (v19)
                  v16 = *(void **)(a1 + 40);
                objc_msgSend(v10, "addObject:", v16);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v13);
          }

          v20 = (void *)objc_msgSend(v10, "copy");
          objc_msgSend(v24, "setFeatureApplications:", v20);

          v4 = v21;
          v3 = v22;
          v5 = v25;
        }
        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v3);
  }

}

- (void)didReceivePendingProvisioningUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPaymentProvisioningController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PKPaymentProvisioningController_didReceivePendingProvisioningUpdate___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __71__PKPaymentProvisioningController_didReceivePendingProvisioningUpdate___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
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
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v7, "pendingProvisioning");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 288), "indexOfObject:", v8);
        switch(objc_msgSend(v7, "type"))
        {
          case 0:
            v10 = *(void **)(*(_QWORD *)(a1 + 40) + 288);
            goto LABEL_15;
          case 1:
            v10 = *(void **)(*(_QWORD *)(a1 + 40) + 288);
            if (v9 == 0x7FFFFFFFFFFFFFFFLL)
LABEL_15:
              objc_msgSend(v10, "addObject:", v8);
            else
              objc_msgSend(v10, "setObject:atIndexedSubscript:", v8, v9);
            goto LABEL_21;
          case 2:
            if (v9 == 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_21;
            objc_msgSend(v8, "setStatus:", 5);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 288), "setObject:atIndexedSubscript:", v8, v9);
            v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "count");
            if (!v11)
              goto LABEL_21;
            v12 = v11;
            v13 = 0;
            break;
          case 3:
            if (v9 == 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_21;
            v16 = *(void **)(*(_QWORD *)(a1 + 40) + 288);
            v17 = v9;
            goto LABEL_20;
          default:
            goto LABEL_21;
        }
        while (1)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectAtIndexedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v8, "representsCredential:", v14);

          if (v15)
            break;
          if (v12 == ++v13)
            goto LABEL_21;
        }
        v16 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
        v17 = v13;
LABEL_20:
        objc_msgSend(v16, "removeObjectAtIndex:", v17);
LABEL_21:

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v4);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 88));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 88));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v24, "provisioningControllerUpdatedPendingProvisioning:", *(_QWORD *)(a1 + 40), (_QWORD)v25);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v21);
  }

}

- (void)paymentWebService:(id)a3 didQueueTSMConnectionForTaskID:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  PKPaymentProvisioningController *v10;
  unint64_t v11;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PKPaymentProvisioningController_paymentWebService_didQueueTSMConnectionForTaskID___block_invoke;
  block[3] = &unk_1E2AC5810;
  v9 = v6;
  v10 = self;
  v11 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __84__PKPaymentProvisioningController_paymentWebService_didQueueTSMConnectionForTaskID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v1 + 344))
  {
    v3 = *(void **)(v1 + 24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v3, "containsObject:", v4);

    if ((_DWORD)v3)
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 40), sel__updateLocalizedProgressAndInvalidateTimer, 0, 0, 20.0);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(v6 + 32);
      *(_QWORD *)(v6 + 32) = v5;

      if ((objc_msgSend(*(id *)(a1 + 40), "_isProvisioningPaymentAccount") & 1) != 0)
        PKLocalizedAquamanString(CFSTR("PROGRESS_CONFIGURING_ACCOUNT"), 0);
      else
        PKCoreLocalizedString(CFSTR("PROGRESS_CONFIGURING"), 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_setLocalizedProgressDescription:", v8);

    }
  }
}

- (void)paymentWebService:(id)a3 didCompleteTSMConnectionForTaskID:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  PKPaymentProvisioningController *v10;
  unint64_t v11;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PKPaymentProvisioningController_paymentWebService_didCompleteTSMConnectionForTaskID___block_invoke;
  block[3] = &unk_1E2AC5810;
  v9 = v6;
  v10 = self;
  v11 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __87__PKPaymentProvisioningController_paymentWebService_didCompleteTSMConnectionForTaskID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v1 + 344))
  {
    v3 = *(void **)(v1 + 24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v3, "containsObject:", v4);

    if ((_DWORD)v3)
      objc_msgSend(*(id *)(a1 + 40), "_updateLocalizedProgressAndInvalidateTimer");
  }
}

- (void)_updateLocalizedProgressAndInvalidateTimer
{
  NSTimer *descriptionTimer;
  id v4;

  -[NSTimer invalidate](self->_descriptionTimer, "invalidate");
  descriptionTimer = self->_descriptionTimer;
  self->_descriptionTimer = 0;

  -[PKPaymentProvisioningController _localizedProgressDescriptionForEnablingCard](self, "_localizedProgressDescriptionForEnablingCard");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentProvisioningController _setLocalizedProgressDescription:](self, "_setLocalizedProgressDescription:", v4);

}

- (void)_addAssociatedCredential:(id)a3
{
  -[NSMutableArray addObject:](self->_associatedCredentials, "addObject:", a3);
}

- (void)proofingFlowManager:(id)a3 completedProofingWithError:(id)a4
{
  void (**identityProofingManagerCompletionHandler)(id, id);

  identityProofingManagerCompletionHandler = (void (**)(id, id))self->_identityProofingManagerCompletionHandler;
  if (identityProofingManagerCompletionHandler)
    identityProofingManagerCompletionHandler[2](identityProofingManagerCompletionHandler, a4);
}

- (void)proofingFlowManager:(id)a3 didChangeActiveConfigurations:(id)a4
{
  id v5;

  v5 = a4;
  -[PKPaymentProvisioningController _applyIdentityConfiguration:activeConfigurations:completion:](self, "_applyIdentityConfiguration:activeConfigurations:completion:", objc_msgSend(v5, "count") != 0, v5, &__block_literal_global_543);

}

void __85__PKPaymentProvisioningController_proofingFlowManager_didChangeActiveConfigurations___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  PKLogFacilityTypeGetObject(6uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18FC92000, v0, OS_LOG_TYPE_DEFAULT, "Identity Proofing configurations have been updated, model updated", v1, 2u);
  }

}

- (void)deleteCredential:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  PKPaymentDeleteRequest *v13;
  PKPaymentWebService *webService;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  PKPaymentProvisioningController *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isDeletable") & 1) != 0)
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isCarKeyTerminalPairingCredential")
      && objc_msgSend(v6, "credentialType") == 301
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPendingCarKeyProvisioning uniqueIdentifierForCarKeyConfiguration:](PKPendingCarKeyProvisioning, "uniqueIdentifierForCarKeyConfiguration:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __70__PKPaymentProvisioningController_deleteCredential_completionHandler___block_invoke;
      v20[3] = &unk_1E2ACA348;
      v20[4] = self;
      v21 = v6;
      v22 = v7;
      objc_msgSend(v8, "removePendingProvisioningOfType:withUniqueIdentifier:completion:", CFSTR("CarKey"), v10, v20);

    }
    else
    {
      objc_msgSend(v6, "remoteCredential");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "paymentPass");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v13 = -[PKPaymentDeleteRequest initWithPaymentPass:]([PKPaymentDeleteRequest alloc], "initWithPaymentPass:", v9);
        webService = self->_webService;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __70__PKPaymentProvisioningController_deleteCredential_completionHandler___block_invoke_548;
        v16[3] = &unk_1E2AD10B0;
        v17 = v6;
        v18 = self;
        v19 = v7;
        -[PKPaymentWebService deleteForRequest:completion:](webService, "deleteForRequest:completion:", v13, v16);

      }
      else
      {
        PKLogFacilityTypeGetObject(6uLL);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v6;
          _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Attempted to delete pass for credential %@, but missing pass", buf, 0xCu);
        }

        if (!v7)
        {
          v9 = 0;
          goto LABEL_17;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), 0, 0);
        v13 = (PKPaymentDeleteRequest *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, PKPaymentDeleteRequest *))v7 + 2))(v7, v13);
      }

    }
LABEL_17:

    goto LABEL_18;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v6;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Attempted to delete credential %@, but it isn't deletable", buf, 0xCu);
  }

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v8);
LABEL_18:

  }
}

uint64_t __70__PKPaymentProvisioningController_deleteCredential_completionHandler___block_invoke(_QWORD *a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  _QWORD block[5];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = *(void **)(a1[4] + 384);
    v10[0] = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByExcludingObjectsInArray:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = a1[4];
    v7 = *(void **)(v6 + 384);
    *(_QWORD *)(v6 + 384) = v5;

    if (!objc_msgSend(*(id *)(a1[4] + 384), "count"))
    {
      objc_msgSend(*(id *)(a1[4] + 424), "removeCarKeyCategory");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__PKPaymentProvisioningController_deleteCredential_completionHandler___block_invoke_2;
      block[3] = &unk_1E2ABE120;
      block[4] = a1[4];
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __70__PKPaymentProvisioningController_deleteCredential_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Updating setup products because all pending car keys were removed", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_reloadSetupProducts");
}

void __70__PKPaymentProvisioningController_deleteCredential_completionHandler___block_invoke_548(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  int8x16_t v10;
  _QWORD block[4];
  id v12;
  int8x16_t v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v16 = v7;
    v17 = 2048;
    v18 = a2;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Deleted credential %@, return result: %lu error: %@", buf, 0x20u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKPaymentProvisioningController_deleteCredential_completionHandler___block_invoke_549;
  block[3] = &unk_1E2ABE1E8;
  v12 = v5;
  v10 = *(int8x16_t *)(a1 + 32);
  v8 = (id)v10.i64[0];
  v13 = vextq_s8(v10, v10, 8uLL);
  v14 = *(id *)(a1 + 48);
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __70__PKPaymentProvisioningController_deleteCredential_completionHandler___block_invoke_549(_QWORD *a1)
{
  uint64_t result;

  if (!a1[4])
    objc_msgSend(*(id *)(a1[5] + 40), "removeObjectIdenticalTo:", a1[6]);
  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a1[4]);
  return result;
}

- (void)_addOrUpdateProvisonedPassData:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableOrderedSet *provisionedPasses;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = -[NSMutableOrderedSet indexOfObject:](self->_provisionedPasses, "indexOfObject:", v4);
    provisionedPasses = self->_provisionedPasses;
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableOrderedSet addObject:](provisionedPasses, "addObject:", v7);
    else
      -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](provisionedPasses, "replaceObjectAtIndex:withObject:", v5, v7);
    v4 = v7;
  }

}

- (PKPaymentPass)provisionedPass
{
  void *v2;
  void *v3;
  void *v4;

  -[NSMutableOrderedSet firstObject](self->_provisionedPasses, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secureElementPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPaymentPass *)v4;
}

- (PKCloudStoreCoordinatorDelegate)cloudStoreCoordinator
{
  return self->_cloudStoreCoordinator;
}

- (void)setCloudStoreCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_cloudStoreCoordinator, a3);
}

- (PKPaymentDataProvider)paymentDataProvider
{
  return self->_paymentDataProvider;
}

- (void)setPaymentDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_paymentDataProvider, a3);
}

- (PKPaymentOffersController)paymentOffersController
{
  return self->_paymentOffersController;
}

- (void)setPaymentOffersController:(id)a3
{
  objc_storeStrong((id *)&self->_paymentOffersController, a3);
}

- (BOOL)isProvisioningForAltAccount
{
  return self->_isProvisioningForAltAccount;
}

- (void)setIsProvisioningForAltAccount:(BOOL)a3
{
  self->_isProvisioningForAltAccount = a3;
}

- (unint64_t)isCurrentUserUnder13
{
  return self->_isCurrentUserUnder13;
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)localizedProgressDescription
{
  return self->_localizedProgressDescription;
}

- (unint64_t)preflightRequirements
{
  return self->_preflightRequirements;
}

- (NSArray)associatedCredentials
{
  return &self->_associatedCredentials->super;
}

- (NSArray)purchaseCredentials
{
  return self->_purchaseCredentials;
}

- (NSArray)pendingCarKeyCredentials
{
  return self->_pendingCarKeyCredentials;
}

- (PKProvisioningSEStorageSnapshot)storageSnapshot
{
  return self->_storageSnapshot;
}

- (NSExtension)provisioningExtension
{
  return self->_provisioningExtension;
}

- (NSArray)provisioningExtensionCredentials
{
  return self->_provisioningExtensionCredentials;
}

- (PKPaymentProvisioningControllerCredentialQueue)credentialProvisioningQueue
{
  return self->_credentialProvisioningQueue;
}

- (PKPaymentSetupProductModel)paymentSetupProductModel
{
  return self->_paymentSetupProductModel;
}

- (NSOrderedSet)provisionedPasses
{
  return &self->_provisionedPasses->super;
}

- (NSArray)moreInfoItems
{
  return self->_moreInfoItems;
}

- (BOOL)isExpressModeSetupOptional
{
  return self->_expressModeSetupOptional;
}

- (NSSet)automaticExpressModes
{
  return self->_automaticExpressModes;
}

- (BOOL)isAMPEnrollmentAvailable
{
  return self->_AMPEnrollmentAvailable;
}

- (NSArray)allowedPaymentNetworks
{
  return self->_allowedPaymentNetworks;
}

- (void)setAllowedPaymentNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_allowedPaymentNetworks, a3);
}

- (NSArray)allowedCardTypes
{
  return self->_allowedCardTypes;
}

- (void)setAllowedCardTypes:(id)a3
{
  objc_storeStrong((id *)&self->_allowedCardTypes, a3);
}

- (NSSet)requiredTransitNetworkIdentifiers
{
  return self->_requiredTransitNetworkIdentifiers;
}

- (void)setRequiredTransitNetworkIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_requiredTransitNetworkIdentifiers, a3);
}

- (NSSet)allowedFeatureIdentifiers
{
  return self->_allowedFeatureIdentifiers;
}

- (NSSet)allowedProductIdentifiers
{
  return self->_allowedProductIdentifiers;
}

- (void)setAllowedProductIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_allowedProductIdentifiers, a3);
}

- (BOOL)preventsFeatureApplications
{
  return self->_preventsFeatureApplications;
}

- (void)setPreventsFeatureApplications:(BOOL)a3
{
  self->_preventsFeatureApplications = a3;
}

- (BOOL)fetchProductsFromStaticDataSource
{
  return self->_fetchProductsFromStaticDataSource;
}

- (void)setFetchProductsFromStaticDataSource:(BOOL)a3
{
  self->_fetchProductsFromStaticDataSource = a3;
}

- (CIDVUIProofingFlowManager)identityProofingManager
{
  return self->_identityProofingManager;
}

- (void)setIdentityProofingManager:(id)a3
{
  objc_storeStrong((id *)&self->_identityProofingManager, a3);
}

- (id)identityProofingManagerCompletionHandler
{
  return self->_identityProofingManagerCompletionHandler;
}

- (void)setIdentityProofingManagerCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (CLLocation)cachedLocation
{
  return self->_cachedLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLocation, 0);
  objc_storeStrong(&self->_identityProofingManagerCompletionHandler, 0);
  objc_storeStrong((id *)&self->_identityProofingManager, 0);
  objc_storeStrong((id *)&self->_allowedProductIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedFeatureIdentifiers, 0);
  objc_storeStrong((id *)&self->_requiredTransitNetworkIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedCardTypes, 0);
  objc_storeStrong((id *)&self->_allowedPaymentNetworks, 0);
  objc_storeStrong((id *)&self->_automaticExpressModes, 0);
  objc_storeStrong((id *)&self->_moreInfoItems, 0);
  objc_storeStrong((id *)&self->_paymentSetupProductModel, 0);
  objc_storeStrong((id *)&self->_credentialProvisioningQueue, 0);
  objc_storeStrong((id *)&self->_provisioningExtensionCredentials, 0);
  objc_storeStrong((id *)&self->_provisioningExtension, 0);
  objc_storeStrong((id *)&self->_storageSnapshot, 0);
  objc_storeStrong((id *)&self->_pendingCarKeyCredentials, 0);
  objc_storeStrong((id *)&self->_purchaseCredentials, 0);
  objc_storeStrong((id *)&self->_localizedProgressDescription, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentOffersController, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_cloudStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingProvisionings, 0);
  objc_storeStrong((id *)&self->_carKeyProduct, 0);
  objc_storeStrong((id *)&self->_paymentSetupFeatures, 0);
  objc_storeStrong((id *)&self->_zoneCreationManager, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_preflighUpdateHandlers, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_locationInUseAssertion, 0);
  objc_storeStrong(&self->_locationCompletion, 0);
  objc_storeStrong((id *)&self->_locationTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_provisioningState, 0);
  objc_storeStrong((id *)&self->_externalizedAuth, 0);
  objc_storeStrong((id *)&self->_featuresDidBeginReporting, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_analyticsFeaturesToReport, 0);
  objc_storeStrong((id *)&self->_supportedFeatureIdentifierStringsForAccountProvisioning, 0);
  objc_storeStrong((id *)&self->_supportedFeatureIdentifierStrings, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_currentAddPaymentPassRequestConfiguration, 0);
  objc_storeStrong((id *)&self->_currentCredential, 0);
  objc_storeStrong((id *)&self->_provisionedPasses, 0);
  objc_storeStrong((id *)&self->_associatedCredentials, 0);
  objc_storeStrong((id *)&self->_descriptionTimer, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_utility, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

- (BOOL)suppressDefaultCardholderNameField
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[PKPaymentProvisioningController webService](self, "webService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentProvisioningController webService](self, "webService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "suppressCardholderNameFieldForRegion:", v5);

  return v9;
}

@end

@implementation PKPassPaymentContainerView

+ (BOOL)userIntentPotentiallyRequiredForPass:(id)a3 fieldDetect:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  BOOL v6;
  void *v7;
  char v8;
  char IsAvailable;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "passType") != 1 && !v4;
  if (v6
    || (objc_msgSend(v5, "paymentPass"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isIdentityPass"),
        v7,
        (v8 & 1) != 0))
  {
    IsAvailable = 0;
  }
  else
  {
    IsAvailable = PKUserIntentIsAvailable();
  }

  return IsAvailable;
}

+ (BOOL)initialPhysicalButtonRequiredAssumptionForPass:(id)a3 context:(id)a4 paymentService:(id)a5
{
  return objc_msgSend(a1, "_initialUserIntentRequiredAssumptionForPass:context:paymentService:requirePhysicalButton:", a3, a4, a5, 1);
}

+ (BOOL)initialUserIntentRequiredAssumptionForPass:(id)a3 context:(id)a4 paymentService:(id)a5
{
  return objc_msgSend(a1, "_initialUserIntentRequiredAssumptionForPass:context:paymentService:requirePhysicalButton:", a3, a4, a5, 0);
}

+ (BOOL)_initialUserIntentRequiredAssumptionForPass:(id)a3 context:(id)a4 paymentService:(id)a5 requirePhysicalButton:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;
  BOOL v15;
  _BOOL4 v17;
  void *v18;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!objc_msgSend(a1, "userIntentPotentiallyRequiredForPass:fieldDetect:", v10, objc_msgSend(v11, "isFieldDetect")))goto LABEL_4;
  v13 = objc_msgSend(MEMORY[0x1E0D6BFD8], "userIntentStyle");
  if ((objc_msgSend(MEMORY[0x1E0D6BFD8], "isUserIntentAvailableWithStyle:", v13) & 1) != 0)
    goto LABEL_4;
  v14 = objc_msgSend(MEMORY[0x1E0D6BFD8], "cachedStateForPolicy:", 0);
  if ((v14 & 1) == 0)
    goto LABEL_4;
  if (PKPearlIsAvailable())
  {
    if (v13 != 1 && v6)
      goto LABEL_4;
    goto LABEL_14;
  }
  v15 = 0;
  v17 = (v14 & 4) == 0;
  if (v6)
    v17 = v13 == 1;
  if ((v14 & 4) == 0 && v17)
  {
LABEL_14:
    if ((PKRunningInRemoteContext() & 1) != 0
      || (objc_msgSend(v11, "isFieldDetect") & 1) != 0
      || objc_msgSend(v12, "hasPaymentDeviceFieldProperties"))
    {
      if (objc_msgSend(v10, "passType") == 1)
      {
        v18 = (void *)RequiredExpressApplicationsForAutomaticAuthorization(v10, v11, v12, 0);
        v15 = objc_msgSend(v18, "count") == 0;

      }
      else
      {
        v15 = 1;
      }
      goto LABEL_5;
    }
LABEL_4:
    v15 = 0;
  }
LABEL_5:

  return v15;
}

+ (BOOL)shouldAutomaticallyAuthorizeForPass:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  char v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "passType") == 1)
  {
    v7 = 0;
  }
  else if ((objc_msgSend(v6, "isFieldDetect") & 1) != 0)
  {
    if ((PKUIOnlyDemoModeEnabled() & 1) != 0)
      v7 = 1;
    else
      v7 = PKStoreDemoModeEnabled();
  }
  else
  {
    objc_msgSend(v5, "nfcPayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "requiresAuthentication") & 1) != 0 && (PKUIOnlyDemoModeEnabled() & 1) == 0)
      v7 = PKStoreDemoModeEnabled();
    else
      v7 = 1;

  }
  return v7;
}

- (void)_reportPassPresentedForPayment:(id)a3
{
  __CFString *i;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  id *v25;
  __CFString *v26;
  unint64_t v27;
  __CFString *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  __CFString *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  id obj;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[2];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "secureElementPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v50 = v4;
    v49 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v49, "setObject:forKey:", *MEMORY[0x1E0D68B98], *MEMORY[0x1E0D68AA0]);
    v6 = (id)*MEMORY[0x1E0D68FE0];
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v5, "devicePaymentApplications");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    v52 = v5;
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v54;
      v10 = (void *)*MEMORY[0x1E0D68FE8];
      while (2)
      {
        for (i = 0; i != (__CFString *)v8; i = (__CFString *)((char *)i + 1))
        {
          if (*(_QWORD *)v54 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v11, "supportsExpress"))
          {
            v20 = (id)*MEMORY[0x1E0D68FD8];

            v6 = v20;
            goto LABEL_14;
          }
          v12 = objc_alloc(MEMORY[0x1E0C99D20]);
          objc_msgSend(v11, "secureElementIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, 0);

          PKDeviceClass();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D66EA0], "fromDeviceVersion");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "eligibleExpressUpgradeRequestsForDeviceClass:deviceSEIDs:deviceVersion:technologyTest:", v15, v14, v16, &__block_literal_global_196);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

          if (v18)
          {
            v19 = v10;

            v6 = v19;
          }

          v5 = v52;
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_14:

    objc_msgSend(v49, "safelySetObject:forKey:", v6, *MEMORY[0x1E0D68FD0]);
    v21 = v49;
    v4 = v50;
    v22 = v50;
    v23 = v22;
    if (!v22 || !v21)
      goto LABEL_40;
    v24 = objc_msgSend(v22, "passType");
    v25 = (id *)MEMORY[0x1E0D69618];
    if ((unint64_t)(v24 + 1) >= 3)
      v26 = (__CFString *)(id)*MEMORY[0x1E0D69618];
    else
      v26 = off_1E3E77408[v24 + 1];
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D69040]);

    v27 = objc_msgSend(v23, "style");
    if (v27 < 0xD && ((0x13FFu >> v27) & 1) != 0)
      v28 = off_1E3E77420[v27];
    else
      v28 = (__CFString *)*v25;
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D69038]);

    objc_msgSend(v23, "nfcPayload");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D69000]);

    v31 = v23;
    if (objc_msgSend(v31, "passType") == 1)
    {
      objc_msgSend(v31, "secureElementPass");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "cardType");
      if (v33 <= 4)
        i = (__CFString *)**((id **)&unk_1E3E77488 + v33);

    }
    else
    {
      i = CFSTR("other");
    }

    objc_msgSend(v21, "setObject:forKeyedSubscript:", i, *MEMORY[0x1E0D69028]);
    objc_msgSend(v31, "secureElementPass");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "isIdentityPass"))
    {
      v35 = objc_msgSend(v34, "identityType");
      if ((unint64_t)(v35 - 1) < 3)
      {
        v36 = off_1E3E774B0[v35 - 1];
        goto LABEL_35;
      }
    }
    else if (objc_msgSend(v34, "isAccessPass"))
    {
      v37 = objc_msgSend(v34, "accessType");
      if (v37 < 7)
      {
        v36 = off_1E3E774C8[v37];
        goto LABEL_35;
      }
    }
    v36 = (__CFString *)*v25;
LABEL_35:

    objc_msgSend(v21, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D69020]);
    objc_msgSend(v31, "secureElementPass");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "devicePaymentApplications");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "count");

    PKAnalyticsReportSwitchToggleResultValue();
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0D68940]);
    objc_msgSend(v31, "secureElementPass");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = *v25;
    objc_msgSend(v41, "organizationName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "length"))
    {
      v44 = objc_msgSend(v41, "cardType");
      if (v44 == 4 || v44 == 2)
      {
        v45 = v43;

        v42 = v45;
      }
    }

    objc_msgSend(v21, "setObject:forKeyedSubscript:", v42, *MEMORY[0x1E0D68D88]);
LABEL_40:

    v46 = (void *)MEMORY[0x1E0D66A58];
    v47 = *MEMORY[0x1E0D69940];
    v57[0] = *MEMORY[0x1E0D698E8];
    v57[1] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "subjects:sendEvent:", v48, v21);

    v5 = v52;
  }

}

uint64_t __61__PKPassPaymentContainerView__reportPassPresentedForPayment___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D67630], "supportsExpressForAutomaticSelectionTechnologyType:", a2);
}

- (PKPassPaymentContainerView)initWithPass:(id)a3 passView:(id)a4 context:(id)a5 paymentSession:(id)a6 paymentService:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PKPassPaymentContainerView *v17;
  PKPassPaymentContainerView *v18;
  PKAuthenticator *v19;
  PKAuthenticator *authenticator;
  NSObject *v21;
  PKAuthenticator *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *authorizationQueue;
  void *v26;
  uint64_t v27;
  PKTransitBalanceModel *transitBalanceModel;
  PKLinkedApplication *v29;
  PKLinkedApplication *linkedApplication;
  NSMutableArray *v31;
  NSMutableArray *linkedApplicationUpdateCompletionHandlers;
  uint64_t v33;
  PKPaymentService *paymentService;
  void *v35;
  void *v36;
  uint64_t v37;
  PKPaymentService *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  PKPassLibrary *passLibrary;
  void *v43;
  uint64_t v44;
  UICoordinateSpace *fixedScreenCoordinateSpace;
  NSMutableArray *v46;
  NSMutableArray *transitionCompletionHandlers;
  NSMutableArray *v48;
  NSMutableArray *pendingGlyphStateCompletionHandlers;
  int v50;
  double Current;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  PKPeerPaymentService *peerPaymentService;
  uint64_t v57;
  PKContactResolver *transactionFooterContactResolver;
  PKPeerPaymentAccountResolutionController *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  uint64_t v64;
  PKPeerPaymentAccountResolutionController *peerPaymentAccountResolutionController;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  $77BFE790A1370D46B4241309C9753022 *p_foregroundActiveState;
  PKAuthenticator *v71;
  dispatch_time_t v72;
  PKAuthenticator *v73;
  int v74;
  NSMutableArray *v75;
  NSMutableArray *sessionExchangeTaskQueue;
  uint64_t v77;
  NSData *authorizedExternalizedContext;
  uint64_t v80;
  char v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  _QWORD block[4];
  PKAuthenticator *v89;
  objc_super v90;
  uint8_t buf[4];
  PKPassPaymentContainerView *v92;
  __int16 v93;
  id v94;
  __int16 v95;
  PKAuthenticator *v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v90.receiver = self;
  v90.super_class = (Class)PKPassPaymentContainerView;
  v17 = -[PKPassFooterContentView initWithPass:presentationContext:](&v90, sel_initWithPass_presentationContext_, v12, v14);
  v18 = v17;
  if (v17)
  {
    v87 = v16;
    objc_storeStrong((id *)&v17->_passView, a4);
    v19 = (PKAuthenticator *)objc_alloc_init(MEMORY[0x1E0D6BFD8]);
    authenticator = v18->_authenticator;
    v18->_authenticator = v19;

    PKLogFacilityTypeGetObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v18->_authenticator;
      *(_DWORD *)buf = 134218496;
      v92 = v18;
      v93 = 2048;
      v94 = v15;
      v95 = 2048;
      v96 = v22;
      _os_log_impl(&dword_19D178000, v21, OS_LOG_TYPE_DEFAULT, "PKPassPaymentContainerView (%p): initializing with session %p and authenticator %p.", buf, 0x20u);
    }
    v86 = v15;

    -[PKPassPaymentContainerView _reportPassPresentedForPayment:](v18, "_reportPassPresentedForPayment:", v12);
    dispatch_get_global_queue(33, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create_with_target_V2("com.apple.passkit.authorization", 0, v23);
    authorizationQueue = v18->_authorizationQueue;
    v18->_authorizationQueue = (OS_dispatch_queue *)v24;

    v18->_userIntentStyle = PKUserIntentIsAvailable();
    objc_msgSend(v12, "paymentPass");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isStoredValuePass"))
    {
      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67740]), "initWithPass:", v26);
      transitBalanceModel = v18->_transitBalanceModel;
      v18->_transitBalanceModel = (PKTransitBalanceModel *)v27;

    }
    if (-[PKPassFooterContentView style](v18, "style") == 3)
    {
      v29 = -[PKLinkedApplication initWithPass:]([PKLinkedApplication alloc], "initWithPass:", v26);
      linkedApplication = v18->_linkedApplication;
      v18->_linkedApplication = v29;

      -[PKLinkedApplication addObserver:](v18->_linkedApplication, "addObserver:", v18);
      -[PKLinkedApplication reloadApplicationStateIfNecessary](v18->_linkedApplication, "reloadApplicationStateIfNecessary");
      v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      linkedApplicationUpdateCompletionHandlers = v18->_linkedApplicationUpdateCompletionHandlers;
      v18->_linkedApplicationUpdateCompletionHandlers = v31;

    }
    if (v16)
    {
      objc_storeStrong((id *)&v18->_paymentService, a7);
      -[PKPaymentService setDelegate:](v18->_paymentService, "setDelegate:", v18);
    }
    else
    {
      v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", v18);
      paymentService = v18->_paymentService;
      v18->_paymentService = (PKPaymentService *)v33;

    }
    v85 = v12;
    objc_msgSend(v26, "devicePrimaryPaymentApplication");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "subcredentials");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "anyObject");
    v37 = objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = v18->_paymentService;
      objc_msgSend(v35, "applicationIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassPaymentContainerView _calculateTerminalStateWithRangingSuspensionReasons:](v18, "_calculateTerminalStateWithRangingSuspensionReasons:", -[PKPaymentService rangingSuspensionReasonForAppletSubcredential:forPaymentApplicationID:](v38, "rangingSuspensionReasonForAppletSubcredential:forPaymentApplicationID:", v37, v39));

    }
    v84 = (void *)v37;
    v40 = v35;
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v41 = objc_claimAutoreleasedReturnValue();
    passLibrary = v18->_passLibrary;
    v18->_passLibrary = (PKPassLibrary *)v41;

    -[PKAuthenticator setDelegate:](v18->_authenticator, "setDelegate:", v18);
    objc_storeStrong((id *)&v18->_contactlessInterfaceSession, a6);
    -[PKContactlessInterfaceSession setDelegate:](v18->_contactlessInterfaceSession, "setDelegate:", v18);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "fixedCoordinateSpace");
    v44 = objc_claimAutoreleasedReturnValue();
    fixedScreenCoordinateSpace = v18->_fixedScreenCoordinateSpace;
    v18->_fixedScreenCoordinateSpace = (UICoordinateSpace *)v44;

    v46 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    transitionCompletionHandlers = v18->_transitionCompletionHandlers;
    v18->_transitionCompletionHandlers = v46;

    v48 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingGlyphStateCompletionHandlers = v18->_pendingGlyphStateCompletionHandlers;
    v18->_pendingGlyphStateCompletionHandlers = v48;

    v18->_VASInfoViewHidden = 1;
    v50 = objc_msgSend(v14, "wasAutomaticallySelected");
    Current = 0.0;
    if (v50)
      Current = CFAbsoluteTimeGetCurrent();
    v18->_lastFieldExitTime = Current;
    if (objc_msgSend(v26, "hasAssociatedPeerPaymentAccount"))
    {
      -[PKPassLibrary peerPaymentPassUniqueID](v18->_passLibrary, "peerPaymentPassUniqueID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "uniqueID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqualToString:", v53);

      if (v54)
      {
        objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
        v55 = objc_claimAutoreleasedReturnValue();
        peerPaymentService = v18->_peerPaymentService;
        v18->_peerPaymentService = (PKPeerPaymentService *)v55;

        v83 = objc_alloc_init(MEMORY[0x1E0C97298]);
        objc_msgSend(MEMORY[0x1E0D67400], "requiredContactKeys");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66C60]), "initWithContactStore:keysToFetch:", v83, v82);
        transactionFooterContactResolver = v18->_transactionFooterContactResolver;
        v18->_transactionFooterContactResolver = (PKContactResolver *)v57;

        v59 = [PKPeerPaymentAccountResolutionController alloc];
        -[PKPeerPaymentService account](v18->_peerPaymentService, "account");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
        v61 = v13;
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_alloc_init(MEMORY[0x1E0D66F18]);
        v64 = -[PKPeerPaymentAccountResolutionController initWithAccount:webService:context:delegate:passLibraryDataProvider:](v59, "initWithAccount:webService:context:delegate:passLibraryDataProvider:", v60, v62, 0, 0, v63);
        peerPaymentAccountResolutionController = v18->_peerPaymentAccountResolutionController;
        v18->_peerPaymentAccountResolutionController = (PKPeerPaymentAccountResolutionController *)v64;

        v13 = v61;
        v35 = v40;

      }
    }
    -[PKPassPaymentContainerView _configureForStyle:context:](v18, "_configureForStyle:context:", -[PKPassFooterContentView style](v18, "style", v82), v14);
    -[PKPassPaymentPayStateView glyph](v18->_payStateView, "glyph");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setFadeOnRecognized:", -[PKContactlessInterfaceSession fieldPresent](v18->_contactlessInterfaceSession, "fieldPresent"));
    NSStringFromSelector(sel_state);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObserver:forKeyPath:options:context:", v18, v67, 0, &KVOContext);

    +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v68;
    p_foregroundActiveState = &v18->_foregroundActiveState;
    if (v68)
    {
      *p_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)objc_msgSend(v68, "registerObserver:", v18);
      v18->_deactivationReasons = objc_msgSend(v69, "registerDeactivationObserver:", v18);
    }
    else
    {
      *p_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)257;
    }
    v12 = v85;
    v18->_pendingPayState = 0;
    v18->_currentPayState = 0;
    if (objc_msgSend(v14, "wantsPersistentCardEmulation"))
      objc_msgSend(v86, "queuePersistentCardEmulation");
    -[PKPassPaymentContainerView _commitPendingPayStateAnimated:](v18, "_commitPendingPayStateAnimated:", 0);
    if (PKRunningInRemoteContext() && (PKPearlIsAvailable() & 1) == 0)
    {
      v71 = v18->_authenticator;
      v72 = dispatch_time(0, 300000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __90__PKPassPaymentContainerView_initWithPass_passView_context_paymentSession_paymentService___block_invoke;
      block[3] = &unk_1E3E612E8;
      v89 = v71;
      v73 = v71;
      dispatch_after(v72, MEMORY[0x1E0C80D38], block);

    }
    v74 = objc_msgSend(v14, "wantsForcedPayment");
    if (v74)
      LOBYTE(v74) = objc_msgSend(v14, "wasForcedFromButton");
    v18->_presentationWasForcedFromButton = v74;
    v18->_presentationWasForFieldDetect = objc_msgSend(v14, "isFieldDetect");
    v75 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sessionExchangeTaskQueue = v18->_sessionExchangeTaskQueue;
    v18->_sessionExchangeTaskQueue = v75;

    objc_msgSend(v14, "externalizedAuthenticationContext");
    v77 = objc_claimAutoreleasedReturnValue();
    authorizedExternalizedContext = v18->_authorizedExternalizedContext;
    v18->_authorizedExternalizedContext = (NSData *)v77;

    if (v18->_pendingAutomaticAuthorization
      || !v18->_authorizedExternalizedContext
      || -[PKPassFooterContentView style](v18, "style") == 4)
    {
      goto LABEL_30;
    }
    v80 = objc_msgSend(MEMORY[0x1E0D6BFD8], "userIntentStyle");
    if (v80)
    {
      if (v80 != 1)
      {
LABEL_30:

        v15 = v86;
        v16 = v87;
        goto LABEL_31;
      }
      v81 = objc_msgSend(MEMORY[0x1E0D6BFD8], "isUserIntentAvailableWithStyle:", 1);
    }
    else
    {
      v81 = 1;
    }
    v18->_pendingAutomaticAuthorization = v81;
    goto LABEL_30;
  }
  InvalidateSession_0(v15);
LABEL_31:

  return v18;
}

void __90__PKPassPaymentContainerView_initWithPass_passView_context_paymentSession_paymentService___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "fingerPresent");
  JUMPOUT(0x1A1AE3A74);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  PKAuthenticator *authenticator;
  PKPassPaymentPayStateView *payStateView;
  void *v7;
  void *v8;
  NSObject *transactionResolutionTimer;
  OS_dispatch_source *v10;
  NSObject *transactionTerminalResponseTimer;
  OS_dispatch_source *v12;
  id WeakRetained;
  id v14;
  void *v15;
  objc_super v16;

  +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);
  objc_msgSend(v3, "unregisterDeactivationObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[PKPaymentService setDelegate:](self->_paymentService, "setDelegate:", 0);
  -[PKAuthenticator invalidate](self->_authenticator, "invalidate");
  -[PKAuthenticator setDelegate:](self->_authenticator, "setDelegate:", 0);
  authenticator = self->_authenticator;
  self->_authenticator = 0;

  -[PKPassPaymentContainerView _endContactlessPaymentSession](self, "_endContactlessPaymentSession");
  payStateView = self->_payStateView;
  if (payStateView)
  {
    -[PKPassPaymentPayStateView glyph](payStateView, "glyph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_state);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, v8, &KVOContext);

  }
  transactionResolutionTimer = self->_transactionResolutionTimer;
  if (transactionResolutionTimer)
  {
    dispatch_source_cancel(transactionResolutionTimer);
    v10 = self->_transactionResolutionTimer;
    self->_transactionResolutionTimer = 0;

  }
  transactionTerminalResponseTimer = self->_transactionTerminalResponseTimer;
  if (transactionTerminalResponseTimer)
  {
    dispatch_source_cancel(transactionTerminalResponseTimer);
    v12 = self->_transactionTerminalResponseTimer;
    self->_transactionTerminalResponseTimer = 0;

  }
  -[PKPassPaymentContainerView _executePendingGlyphStateCompletionHandlers:](self, "_executePendingGlyphStateCompletionHandlers:", 1);
  -[PKPassPaymentContainerView _executeTransitionCompletionHandlers:](self, "_executeTransitionCompletionHandlers:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataReleaseVC);

  if (WeakRetained)
  {
    v14 = objc_loadWeakRetained((id *)&self->_dataReleaseVC);
    objc_msgSend(v14, "presentingViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dismissViewControllerAnimated:completion:", 1, 0);

    objc_storeWeak((id *)&self->_dataReleaseVC, 0);
  }

  v16.receiver = self;
  v16.super_class = (Class)PKPassPaymentContainerView;
  -[PKPassFooterContentView dealloc](&v16, sel_dealloc);
}

- (void)layoutSubviews
{
  LAUIPhysicalButtonView *physicalButtonView;
  int64_t v4;
  void *v5;
  void *v6;
  double v7;
  _BOOL4 v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  UIView *displayedPrimaryView;
  PKPassValueAddedServiceInfoView *valueAddedServiceInfoView;
  double v28;
  CGFloat v29;
  PKPassValueAddedServiceInfoView *v30;
  double v31;
  CGFloat v32;
  UIView *displayedSecondaryView;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double y;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  UIView *v44;
  double v45;
  CGFloat v46;
  PKPassValueAddedServiceInfoView *v47;
  CGFloat v48;
  UIView *v49;
  double v50;
  CGFloat v51;
  UIButton *actionButton;
  double v53;
  double v54;
  void *v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  CGFloat x;
  CGFloat v65;
  CGFloat height;
  CGFloat MaxY;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  UITextView *bottomTextView;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat width;
  double v83;
  _BOOL4 v84;
  double rect;
  CGFloat recta;
  double v87;
  _QWORD v88[5];
  CGRect v89;
  CGRect slice;
  CGRect remainder;
  objc_super v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;

  v92.receiver = self;
  v92.super_class = (Class)PKPassPaymentContainerView;
  -[PKPassFooterContentView layoutSubviews](&v92, sel_layoutSubviews);
  physicalButtonView = self->_physicalButtonView;
  if (physicalButtonView)
    -[LAUIPhysicalButtonView updateFrame](physicalButtonView, "updateFrame");
  v4 = -[PKPassFooterContentView style](self, "style");
  -[PKPassFooterContentView bottomRule](self, "bottomRule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "alpha");
    v8 = v7 > 0.0;
  }
  else
  {
    v8 = 0;
  }

  v9 = (unint64_t)(v4 - 1) < 3 && v8;
  -[PKPassPaymentContainerView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[PKPassPaymentContainerView _topMargin](self, "_topMargin");
  v19 = v18 + v13;
  if (v8)
  {
    objc_msgSend(v5, "frame");
    v20 = CGRectGetMinY(v93) - v19;
  }
  else
  {
    v20 = v17 - (v18 + 0.0);
  }
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = v11 + 0.0;
  remainder.origin.y = v19;
  remainder.size.width = v15;
  remainder.size.height = v20;
  if (self->_applicationsView)
  {
    v94.origin.x = v11 + 0.0;
    v94.origin.y = v19;
    v94.size.width = v15;
    v94.size.height = v20;
    CGRectDivide(v94, &slice, &remainder, 85.0, CGRectMinYEdge);
    -[PKPassPaymentApplicationView setFrame:](self->_applicationsView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  rect = v19;
  v87 = v11 + 0.0;
  -[PKPassValueAddedServiceInfoView alpha](self->_valueAddedServiceInfoView, "alpha");
  v22 = v21;
  v84 = v9;
  v23 = v20;
  if (-[PKPassPaymentContainerView _shouldDisplayPrimaryView](self, "_shouldDisplayPrimaryView"))
  {
    -[UIView sizeThatFits:](self->_displayedPrimaryView, "sizeThatFits:", v15, 1.79769313e308);
    v25 = v24;
    displayedPrimaryView = self->_displayedPrimaryView;
    PKSizeAlignedInRect();
    -[UIView setFrame:](displayedPrimaryView, "setFrame:");
    CGRectDivide(remainder, &slice, &remainder, v25, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
  }
  valueAddedServiceInfoView = self->_valueAddedServiceInfoView;
  if (valueAddedServiceInfoView)
  {
    -[PKPassValueAddedServiceInfoView sizeThatFits:](valueAddedServiceInfoView, "sizeThatFits:", v15, 1.79769313e308);
    v29 = v28;
    v30 = self->_valueAddedServiceInfoView;
    PKSizeAlignedInRect();
    -[PKPassValueAddedServiceInfoView setFrame:](v30, "setFrame:");
    if (v22 > 0.0)
    {
      CGRectDivide(remainder, &slice, &remainder, v29, CGRectMinYEdge);
      CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
    }
  }
  if (-[PKPassPaymentContainerView _shouldDisplaySecondaryView](self, "_shouldDisplaySecondaryView"))
  {
    -[UIView sizeThatFits:](self->_displayedSecondaryView, "sizeThatFits:", v15, 1.79769313e308);
    v32 = v31;
    displayedSecondaryView = self->_displayedSecondaryView;
    PKSizeAlignedInRect();
    -[UIView setFrame:](displayedSecondaryView, "setFrame:");
    if (v22 <= 0.0)
      CGRectDivide(remainder, &slice, &remainder, v32, CGRectMinYEdge);
  }
  v35 = v19;
  v34 = v87;
  v36 = v23;
  if (-[PKPassFooterContentView style](self, "style") == 3)
  {
    y = remainder.origin.y;
    PKPassFrontFaceContentSize();
    if (y <= rect + v38 - v39)
    {
      PKPassFrontFaceContentSize();
      v40 = rect + v41 - v42;
    }
    else
    {
      v40 = remainder.origin.y;
    }
    remainder.origin.y = v40;
  }
  -[PKPassPaymentPayStateView alpha](self->_payStateView, "alpha");
  if (v43 <= 0.0)
  {
    v88[1] = 3221225472;
    v89 = remainder;
    v88[0] = MEMORY[0x1E0C809B0];
    v88[2] = __44__PKPassPaymentContainerView_layoutSubviews__block_invoke;
    v88[3] = &unk_1E3E62900;
    v88[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v88);
  }
  else
  {
    -[PKPassPaymentPayStateView setFrame:](self->_payStateView, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    -[PKPassPaymentPayStateView layoutIfNeeded](self->_payStateView, "layoutIfNeeded");
  }
  remainder.origin.x = v87;
  remainder.origin.y = rect;
  remainder.size.width = v15;
  remainder.size.height = v36;
  if (self->_applicationsView)
  {
    v95.origin.x = v87;
    v95.origin.y = rect;
    v95.size.width = v15;
    v95.size.height = v36;
    CGRectDivide(v95, &slice, &remainder, 85.0, CGRectMinYEdge);
  }
  v44 = self->_displayedPrimaryView;
  if (v44)
  {
    -[UIView alpha](v44, "alpha");
    if (v45 > 0.0)
    {
      -[UIView frame](self->_displayedPrimaryView, "frame");
      CGRectDivide(remainder, &slice, &remainder, v46, CGRectMinYEdge);
      CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
    }
  }
  v47 = self->_valueAddedServiceInfoView;
  if (v47 && v22 > 0.0)
  {
    -[PKPassValueAddedServiceInfoView frame](v47, "frame");
    CGRectDivide(remainder, &slice, &remainder, v48, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
  }
  v49 = self->_displayedSecondaryView;
  if (v49)
  {
    -[UIView alpha](v49, "alpha");
    if (v50 > 0.0 && v22 <= 0.0)
    {
      -[UIView frame](self->_displayedSecondaryView, "frame");
      CGRectDivide(remainder, &slice, &remainder, v51, CGRectMinYEdge);
    }
  }
  actionButton = self->_actionButton;
  if (actionButton)
  {
    -[UIButton frame](actionButton, "frame");
    v54 = v53;
    v83 = v36;
    if (v84)
    {
      v81 = v15;
      -[PKPassFooterContentView appIconView](self, "appIconView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "frame");
      v57 = v56;
      v59 = v58;
      v61 = v60;
      v63 = v62;

      -[PKPassFooterContentView infoButtonFrame](self, "infoButtonFrame");
      x = v96.origin.x;
      v65 = v96.origin.y;
      width = v96.size.width;
      height = v96.size.height;
      CGRectGetMinX(v96);
      v97.origin.x = v57;
      v97.origin.y = v59;
      v97.size.width = v61;
      v97.size.height = v63;
      CGRectGetMaxX(v97);
      v98.origin.x = v57;
      v98.origin.y = v59;
      v98.size.width = v61;
      v98.size.height = v63;
      CGRectGetMinX(v98);
      v99.origin.x = x;
      v99.origin.y = v65;
      v99.size.width = width;
      v99.size.height = height;
      CGRectGetMaxX(v99);
      UIRectCenteredYInRect();
      if (v4 == 2 || PKUIGetMinScreenWidthType())
      {
        v15 = v81;
        v35 = rect;
      }
      else
      {
        -[PKPassFooterContentView infoButtonAlpha](self, "infoButtonAlpha");
        v15 = v81;
        v35 = rect;
      }
      -[PKPassPaymentPayStateView setLabelStateBottomInset:](self->_payStateView, "setLabelStateBottomInset:", 0.0);
    }
    else
    {
      -[PKPassPaymentPayStateView bounds](self->_payStateView, "bounds");
      -[PKPassPaymentContainerView convertRect:fromView:](self, "convertRect:fromView:", self->_payStateView);
      MaxY = CGRectGetMaxY(v100);
      -[PKPassPaymentPayStateView setLabelStateBottomInset:](self->_payStateView, "setLabelStateBottomInset:", MaxY - (MaxY - v54 + -12.0));
      if (!-[PKPassPaymentPayStateView layoutState](self->_payStateView, "layoutState"))
      {
        -[PKPassPaymentPayStateView label](self->_payStateView, "label");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v68;
        if (v68)
        {
          v70 = v68;
        }
        else
        {
          -[PKPassPaymentPayStateView glyph](self->_payStateView, "glyph");
          v70 = (id)objc_claimAutoreleasedReturnValue();
        }
        v71 = v70;

        objc_msgSend(v71, "bounds");
        -[PKPassPaymentContainerView convertRect:fromView:](self, "convertRect:fromView:", v71);
        CGRectGetMaxY(v101);

      }
    }
    UIRectCenteredXInRect();
    -[UIButton setFrame:](self->_actionButton, "setFrame:");
    v34 = v87;
    v36 = v83;
  }
  else
  {
    -[PKPassPaymentPayStateView setLabelStateBottomInset:](self->_payStateView, "setLabelStateBottomInset:", 0.0);
  }
  bottomTextView = self->_bottomTextView;
  if (bottomTextView)
  {
    -[UITextView frame](bottomTextView, "frame");
    v74 = v73;
    recta = v75;
    -[UITextView sizeThatFits:](self->_bottomTextView, "sizeThatFits:", v15, 1.79769313e308);
    v76 = v15;
    v78 = v77;
    v80 = v79;
    v102.origin.x = v34;
    v102.origin.y = v35;
    v102.size.width = v76;
    v102.size.height = v36;
    CGRectGetMaxY(v102);
    v103.origin.x = v74;
    v103.origin.y = recta;
    v103.size.width = v78;
    v103.size.height = v80;
    CGRectGetHeight(v103);
    UIRectCenteredXInRect();
    -[UITextView setFrame:](self->_bottomTextView, "setFrame:");
  }

}

uint64_t __44__PKPassPaymentContainerView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "layoutIfNeeded");
}

- (double)_topMargin
{
  int64_t v2;
  double v3;
  unint64_t v4;

  v2 = -[PKPassFooterContentView style](self, "style");
  v3 = 0.0;
  if ((unint64_t)(v2 - 1) >= 3)
  {
    if (v2 == 4 || !v2)
      return 10.0;
  }
  else
  {
    v4 = PKUIGetMinScreenWidthType();
    if (v4 <= 0xC)
      return dbl_19DF17A58[v4];
  }
  return v3;
}

- (void)_updateDigitalCarKeyAssertion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NFDCKAssertion *v10;
  id v11;
  NFDCKAssertion *dckAssertion;
  NSObject *v13;
  NFDCKAssertion *v14;
  NFDCKAssertion *v15;
  uint8_t v16[8];
  id v17;

  -[PKPassFooterContentView paymentPass](self, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isCarKeyPass") & 1) != 0 && self->_isVisible && !self->_dckAssertion)
  {
    objc_msgSend(v3, "paymentApplications");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subcredentials");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)PKGetClassNFDigitalCarKeySession();
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v8, "requestAssertionForKeyID:options:outError:", v9, 0, &v17);
    v10 = (NFDCKAssertion *)objc_claimAutoreleasedReturnValue();
    v11 = v17;
    dckAssertion = self->_dckAssertion;
    self->_dckAssertion = v10;

    if (!self->_dckAssertion && v11)
    {
      PKLogFacilityTypeGetObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Failed to acquire DCK key assertion", v16, 2u);
      }

    }
  }
  else
  {
    v14 = self->_dckAssertion;
    if (v14)
    {
      -[NFDCKAssertion invalidate](v14, "invalidate");
      v15 = self->_dckAssertion;
      self->_dckAssertion = 0;

    }
  }

}

- (BOOL)isPassAuthorized
{
  if (-[PKPassFooterContentView style](self, "style") == 3)
    return self->_activeBarcodeIdentifier != 0;
  else
    return -[PKContactlessInterfaceSession state](self->_contactlessInterfaceSession, "state") == 2;
}

- (void)willBecomeVisibleAnimated:(BOOL)a3
{
  NSNumber *pendingPresentationContextState;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPassPaymentContainerView;
  -[PKPassFooterContentView willBecomeVisibleAnimated:](&v7, sel_willBecomeVisibleAnimated_, a3);
  self->_isVisible = 1;
  self->_lastFieldExitTime = CFAbsoluteTimeGetCurrent();
  -[PKPassPaymentContainerView _updateDigitalCarKeyAssertion](self, "_updateDigitalCarKeyAssertion");
  if (self->_failureReason)
  {
    -[PKPassPaymentContainerView _applyTerminalFailureState](self, "_applyTerminalFailureState");
    return;
  }
  pendingPresentationContextState = self->_pendingPresentationContextState;
  if (pendingPresentationContextState)
  {
    v5 = -[NSNumber integerValue](pendingPresentationContextState, "integerValue");
    if (v5 == 8)
    {
      -[PKPassPaymentContainerView _setGlyphState:animated:](self, "_setGlyphState:animated:", 8, 0);
      return;
    }
    if (v5)
      return;
  }
  if (self->_didBecomeHiddenWhileAuthorized)
  {
    -[PKPassFooterContentView pass](self, "pass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_pendingAutomaticAuthorization = +[PKPassPaymentContainerView shouldAutomaticallyAuthorizeForPass:withContext:](PKPassPaymentContainerView, "shouldAutomaticallyAuthorizeForPass:withContext:", v6, 0);

    self->_didBecomeHiddenWhileAuthorized = 0;
  }
  -[PKPassPaymentContainerView _resetToIdleState](self, "_resetToIdleState");
}

- (void)didBecomeVisibleAnimated:(BOOL)a3
{
  NSNumber *pendingPresentationContextState;
  uint64_t v5;
  NSNumber *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPassPaymentContainerView;
  -[PKPassFooterContentView didBecomeVisibleAnimated:](&v7, sel_didBecomeVisibleAnimated_, a3);
  pendingPresentationContextState = self->_pendingPresentationContextState;
  if (pendingPresentationContextState)
  {
    v5 = -[NSNumber integerValue](pendingPresentationContextState, "integerValue");
    v6 = self->_pendingPresentationContextState;
    self->_pendingPresentationContextState = 0;

    if (v5)
      -[PKPassPaymentContainerView _applyPresentationPayState:](self, "_applyPresentationPayState:", v5);
  }
  self->_presentationWasForcedFromButton = 0;
}

- (void)willBecomeHiddenAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassPaymentContainerView;
  -[PKPassFooterContentView willBecomeHiddenAnimated:](&v4, sel_willBecomeHiddenAnimated_, a3);
  self->_didBecomeHiddenWhileAuthorized = self->_currentPayState == 5;
  self->_isVisible = 0;
  -[PKPassPaymentContainerView _updateDigitalCarKeyAssertion](self, "_updateDigitalCarKeyAssertion");
  -[PKPassPaymentContainerView _endPaymentAuthorizationWithWillUpdateState:](self, "_endPaymentAuthorizationWithWillUpdateState:", 1);
  -[PKPassPaymentContainerView dismissPasscodeViewController](self, "dismissPasscodeViewController");
}

- (void)didBecomeHiddenAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassPaymentContainerView;
  -[PKPassFooterContentView didBecomeHiddenAnimated:](&v4, sel_didBecomeHiddenAnimated_, a3);
  -[PKPassPaymentContainerView _cancelHoldingTerminalTransactionSubstateIfNecessary](self, "_cancelHoldingTerminalTransactionSubstateIfNecessary");
  -[PKPassPaymentContainerView _applyPayState:](self, "_applyPayState:", 0);
  -[PKPassPaymentContainerView _endContactlessPaymentSession](self, "_endContactlessPaymentSession");
  self->_didBecomeHiddenWhileAuthorized = 0;
  self->_presentationWasForFieldDetect = 0;
}

- (void)coachingStateDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassPaymentContainerView;
  -[PKPassFooterContentView coachingStateDidChange](&v3, sel_coachingStateDidChange);
  -[PKPassPaymentContainerView _updateCoachingInstruction](self, "_updateCoachingInstruction");
}

- (void)showFullScreenBarcode
{
  PKPaymentBarcodeViewController **p_barcodeViewController;
  id WeakRetained;
  PKPaymentBarcodeViewController *v5;
  void *v6;
  void *v7;
  PKPaymentBarcodeViewController *obj;

  if (self->_activeBarcodeIdentifier && self->_activeBarcodeCredential)
  {
    p_barcodeViewController = &self->_barcodeViewController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_barcodeViewController);
    if (!WeakRetained)
    {
      if (!-[PKPassPaymentContainerView _authenticationAllowed](self, "_authenticationAllowed"))
        return;
      v5 = [PKPaymentBarcodeViewController alloc];
      -[PKPassFooterContentView paymentPass](self, "paymentPass");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      obj = -[PKPaymentBarcodeViewController initWithPass:](v5, "initWithPass:", v6);

      -[PKPaymentBarcodeViewController setBarcodeData:](obj, "setBarcodeData:", self->_activeBarcodeCredential);
      -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentViewController:animated:completion:", obj, 1, 0);

      objc_storeWeak((id *)p_barcodeViewController, obj);
      WeakRetained = obj;
    }

  }
}

- (void)_didInvalidate
{
  PKAuthenticator *authenticator;
  PKAuthenticator *v4;
  NFDCKAssertion *dckAssertion;
  NFDCKAssertion *v6;
  PKPassPaymentPayStateView *payStateView;
  void *v8;
  void *v9;
  PKPassPaymentPayStateView *v10;
  objc_super v11;

  -[PKPassPaymentContainerView _endPaymentAuthorizationWithWillUpdateState:](self, "_endPaymentAuthorizationWithWillUpdateState:", 0);
  -[PKPassPaymentContainerView _endContactlessPaymentSession](self, "_endContactlessPaymentSession");
  authenticator = self->_authenticator;
  if (authenticator)
  {
    -[PKAuthenticator invalidate](authenticator, "invalidate");
    -[PKAuthenticator setDelegate:](self->_authenticator, "setDelegate:", 0);
    v4 = self->_authenticator;
    self->_authenticator = 0;

  }
  dckAssertion = self->_dckAssertion;
  if (dckAssertion)
  {
    -[NFDCKAssertion invalidate](dckAssertion, "invalidate");
    v6 = self->_dckAssertion;
    self->_dckAssertion = 0;

  }
  payStateView = self->_payStateView;
  if (payStateView)
  {
    -[PKPassPaymentPayStateView setDelegate:](payStateView, "setDelegate:", 0);
    -[PKPassPaymentPayStateView glyph](self->_payStateView, "glyph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_state);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:forKeyPath:context:", self, v9, &KVOContext);

    -[PKPassPaymentPayStateView removeFromSuperview](self->_payStateView, "removeFromSuperview");
    v10 = self->_payStateView;
    self->_payStateView = 0;

  }
  v11.receiver = self;
  v11.super_class = (Class)PKPassPaymentContainerView;
  -[PKPassFooterContentView _didInvalidate](&v11, sel__didInvalidate);
}

- (void)paymentApplicationView:(id)a3 didSelectApplication:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  void *v12;
  PKPaymentService *paymentService;
  void *v14;
  _QWORD v15[4];
  id v16;
  void (**v17)(id, _QWORD);
  id v18;
  id buf[2];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  PKLogFacilityTypeGetObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Did select payment application button", (uint8_t *)buf, 2u);
  }

  if (-[PKPassPaymentContainerView _recognizingBiometrics](self, "_recognizingBiometrics")
    || self->_authenticating && (-[PKAuthenticator fingerPresent](self->_authenticator, "fingerPresent") & 1) != 0)
  {
    if (v10)
      v10[2](v10, 0);
  }
  else
  {
    -[PKPassFooterContentView paymentPass](self, "paymentPass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassPaymentContainerView _resetActiveApplicationForPaymentPass:withCompletion:](self, "_resetActiveApplicationForPaymentPass:withCompletion:", v12, 0);
    objc_initWeak(buf, self);
    paymentService = self->_paymentService;
    objc_msgSend(v12, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __85__PKPassPaymentContainerView_paymentApplicationView_didSelectApplication_completion___block_invoke;
    v15[3] = &unk_1E3E768B0;
    v16 = v9;
    objc_copyWeak(&v18, buf);
    v17 = v10;
    -[PKPaymentService setDefaultPaymentApplication:forPassUniqueIdentifier:completion:](paymentService, "setDefaultPaymentApplication:forPassUniqueIdentifier:completion:", v16, v14, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);

  }
}

void __85__PKPassPaymentContainerView_paymentApplicationView_didSelectApplication_completion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Set new default payment application %@ for pass %@", buf, 0x16u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__PKPassPaymentContainerView_paymentApplicationView_didSelectApplication_completion___block_invoke_83;
  v9[3] = &unk_1E3E61C80;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v10 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v11);
}

void __85__PKPassPaymentContainerView_paymentApplicationView_didSelectApplication_completion___block_invoke_83(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_activateForPayment");
    v3 = v6;
    if (v6[752])
    {
      objc_msgSend(v6, "_restartPaymentAuthorization");
LABEL_8:
      v3 = v6;
      goto LABEL_9;
    }
    v4 = 21;
    if (!v6[784])
      v4 = 22;
    if (*(_QWORD *)&v6[OBJC_IVAR___PKPassPaymentContainerView__passView[v4]] == 5)
    {
      objc_msgSend(v6, "_beginPaymentAuthorization");
      goto LABEL_8;
    }
  }
LABEL_9:
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    v3 = v6;
  }

}

- (BOOL)_recognizingBiometrics
{
  return self->_authenticationEvaluationState == 2;
}

- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  int64_t authenticationEvaluationState;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int IsAvailable;
  int64_t v27;
  uint64_t v28;
  _QWORD aBlock[4];
  id v30[2];
  id location;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  authenticationEvaluationState = self->_authenticationEvaluationState;
  self->_authenticationEvaluationState = var0;
  v9 = 21;
  if (!self->_transitioning)
    v9 = 22;
  v10 = *(unint64_t *)((char *)&self->super.super.super.super.isa
                            + OBJC_IVAR___PKPassPaymentContainerView__passView[v9]);
  if (-[PKPassPaymentContainerView _authenticationAllowed](self, "_authenticationAllowed") && self->_authenticating)
  {
    v11 = v10 > 6 || ((1 << v10) & 0x4E) == 0;
    if (!v11 && !self->_transactionSubstate)
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __84__PKPassPaymentContainerView_authenticator_didTransitionToEvaluationStateWithEvent___block_invoke;
      aBlock[3] = &unk_1E3E768D8;
      objc_copyWeak(v30, &location);
      v30[1] = (id)v10;
      v12 = _Block_copy(aBlock);
      v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v12;
      v14 = 0;
      v15 = 2;
      switch(var0)
      {
        case 0:
          if (var1 == 1)
          {
            if (PKPearlIsAvailable())
            {
              PKLocalizedPearlString(CFSTR("GENERIC_PEARL_FAILURE"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = 1;
              v25 = 3;
              goto LABEL_40;
            }
            PKLocalizedPaymentString(CFSTR("PAYMENT_TRY_AGAIN"));
            v16 = objc_claimAutoreleasedReturnValue();
            goto LABEL_39;
          }
          if (var1 == 3)
          {
            PKLocalizedPearlString(CFSTR("GENERIC_PEARL_UNAVAILABLE"));
            v16 = objc_claimAutoreleasedReturnValue();
LABEL_39:
            v23 = (void *)v16;
            v25 = 0;
            v24 = 1;
            goto LABEL_40;
          }
          IsAvailable = PKPearlIsAvailable();
          v23 = 0;
          v25 = 0;
          if ((unint64_t)(authenticationEvaluationState - 1) < 2)
            v24 = IsAvailable;
          else
            v24 = 0;
LABEL_40:
          if (!PKPearlIsAvailable()
            || (v27 = -[PKPassFooterContentView coachingState](self, "coachingState"), v28 = 3, v27 != 3) && v10 != 3)
          {
            v28 = 1;
          }
          ((void (**)(_QWORD, uint64_t, uint64_t, uint64_t, void *))v13)[2](v13, v28, v25, v24, v23);

LABEL_45:
          -[PKPassPaymentContainerView _updateCoachingInstruction](self, "_updateCoachingInstruction", v14);

          objc_destroyWeak(v30);
          objc_destroyWeak(&location);
          break;
        case 1:
          v21 = PKPearlIsAvailable();
          v22 = -[PKPassFooterContentView coachingState](self, "coachingState");
          if (v21)
            v19 = 4;
          else
            v19 = 0;
          if (v22 == 3)
            v20 = 3;
          else
            v20 = 1;
          goto LABEL_22;
        case 2:
          if ((PKPearlIsAvailable() & 1) == 0)
            kdebug_trace();
          v17 = PKPearlIsAvailable();
          v18 = -[PKPassFooterContentView coachingState](self, "coachingState");
          if (v17)
            v19 = 5;
          else
            v19 = 1;
          if (v18 == 3)
            v20 = 3;
          else
            v20 = 1;
LABEL_22:
          v13[2](v13, v20, v19, 0, 0);
          goto LABEL_45;
        case 3:
          goto LABEL_32;
        case 4:
          v14 = 0;
          v15 = 3;
          goto LABEL_32;
        case 5:
          if (v10 == 6)
            goto LABEL_45;
          v14 = 8;
          v15 = 6;
LABEL_32:
          (*((void (**)(void *, uint64_t, uint64_t, _QWORD, _QWORD))v12 + 2))(v12, v15, v14, 0, 0);
          goto LABEL_45;
        default:
          goto LABEL_45;
      }
    }
  }

}

void __84__PKPassPaymentContainerView_authenticator_didTransitionToEvaluationStateWithEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 40) != a2)
      objc_msgSend(WeakRetained, "_applyPayState:", a2);
    if (a4)
      objc_msgSend(v10, "_emphasizeStateIfPossible:withTextOverride:playSystemSound:", a2, v11, PKPearlIsAvailable() ^ 1);
    objc_msgSend(v10, "_setGlyphState:animated:withCompletionHandler:", a3, 1, 0);
  }

}

- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4
{
  -[PKPassFooterContentView _setCoachingState:](self, "_setCoachingState:", a4);
}

- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void (**v11)(void *, _QWORD);
  void *v12;
  unint64_t currentPayState;
  BOOL v14;
  uint64_t v15;
  BOOL v16;
  _QWORD v17[4];
  void (**v18)(void *, _QWORD);
  _QWORD aBlock[5];
  id v20;

  v7 = a3;
  v8 = a4;
  self->_presentingPasscode = 1;
  v9 = MEMORY[0x1E0C809B0];
  ++PresentationTrackingCounter;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKPassPaymentContainerView_presentPasscodeViewController_completionHandler_reply___block_invoke;
  aBlock[3] = &unk_1E3E669E0;
  aBlock[4] = self;
  v10 = v8;
  v20 = v10;
  v11 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12
    || ((currentPayState = self->_currentPayState, v14 = currentPayState > 6,
                                                   v15 = (1 << currentPayState) & 0x4E,
                                                   !v14)
      ? (v16 = v15 == 0)
      : (v16 = 1),
        v16
     || (objc_msgSend(v7, "setModalPresentationStyle:", 6),
         objc_msgSend(v7, "setModalTransitionStyle:", 0),
         self->_requiresPasscodeDismissal)))
  {
    v11[2](v11, 0);
  }
  else
  {
    objc_storeWeak((id *)&self->_passcodeVC, v7);
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __84__PKPassPaymentContainerView_presentPasscodeViewController_completionHandler_reply___block_invoke_3;
    v17[3] = &unk_1E3E61590;
    v18 = v11;
    objc_msgSend(v12, "presentViewController:animated:completion:", v7, 1, v17);

  }
}

void __84__PKPassPaymentContainerView_presentPasscodeViewController_completionHandler_reply___block_invoke(uint64_t a1, int a2)
{
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD block[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 848) = 0;
  v3 = *(_BYTE **)(a1 + 32);
  if (v3[849])
  {
    v4 = 0;
    v3[849] = 0;
    if (!a2)
      goto LABEL_7;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__PKPassPaymentContainerView_presentPasscodeViewController_completionHandler_reply___block_invoke_2;
    block[3] = &unk_1E3E612E8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else if (a2)
  {
    v4 = 1;
    objc_msgSend(v3, "_setGlyphState:animated:", 8, 1);
    goto LABEL_7;
  }
  v4 = 0;
LABEL_7:
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);
  PKUIEndTrackingPresentation();
}

uint64_t __84__PKPassPaymentContainerView_presentPasscodeViewController_completionHandler_reply___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissPasscodeViewController");
}

uint64_t __84__PKPassPaymentContainerView_presentPasscodeViewController_completionHandler_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dismissPasscodeViewController
{
  void *v3;
  void *v4;
  char v5;
  id WeakRetained;

  if (self->_presentingPasscode)
  {
    self->_requiresPasscodeDismissal = 1;
  }
  else
  {
    self->_requiresPasscodeDismissal = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeVC);
    objc_storeWeak((id *)&self->_passcodeVC, 0);
    v3 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "presentingViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(WeakRetained, "isBeingDismissed");
      if (v4)
      {
        if ((v5 & 1) == 0)
          objc_msgSend(v4, "dismissViewControllerAnimated:completion:", -[PKPassPaymentContainerView _isBackgrounded](self, "_isBackgrounded") ^ 1, 0);
      }

      v3 = WeakRetained;
    }

  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__PKPassPaymentContainerView_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __97__PKPassPaymentContainerView_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  char v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "paymentPass");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = v2;
  v5 = v3;
  if (v4 == v5)
  {

LABEL_10:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 928), "setTransitProperties:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_updateContentPrimaryView");
    objc_msgSend(*(id *)(a1 + 32), "_updateContentSecondaryView");
    return;
  }
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {

    return;
  }
  v8 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v8 & 1) != 0)
    goto LABEL_10;
}

- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v8 = a3;
  v9 = a4;
  if (a5 == 1)
  {
    -[PKPassFooterContentView paymentPass](self, "paymentPass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueID");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    v13 = v12;
    if (v11 == v12)
    {

    }
    else
    {
      if (!v12 || !v11)
      {

        goto LABEL_10;
      }
      v14 = objc_msgSend(v11, "isEqualToString:", v12);

      if ((v14 & 1) == 0)
        goto LABEL_10;
    }
    -[PKPassPaymentContainerView _groupTileForTiles:](self, "_groupTileForTiles:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __81__PKPassPaymentContainerView_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke;
    v17[3] = &unk_1E3E61388;
    v17[4] = self;
    v18 = v15;
    v16 = v15;
    dispatch_async(MEMORY[0x1E0C80D38], v17);

  }
LABEL_10:

}

uint64_t __81__PKPassPaymentContainerView_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 616), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentPrimaryView");
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PKPassPaymentContainerView_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __86__PKPassPaymentContainerView_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  int v8;
  int v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "paymentPass");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = v2;
  v5 = v3;
  if (v4 == v5)
  {

    goto LABEL_10;
  }
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {

LABEL_12:
    goto LABEL_13;
  }
  v8 = objc_msgSend(v4, "isEqualToString:", v5);

  if (!v8)
    goto LABEL_12;
LABEL_10:
  v9 = objc_msgSend(v10, "isStoredValuePass");

  if (v9)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 928), "setDynamicBalances:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_updateContentPrimaryView");
    objc_msgSend(*(id *)(a1 + 32), "_updateContentSecondaryView");
  }
LABEL_13:

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PKPassPaymentContainerView_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __83__PKPassPaymentContainerView_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "paymentPass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKEqualObjects();

  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 928), "updateWithDynamicCommutePlans:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_updateContentPrimaryView");
    objc_msgSend(*(id *)(a1 + 32), "_updateContentSecondaryView");
  }
}

- (void)credential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5
{
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v7 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__PKPassPaymentContainerView_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke;
  block[3] = &unk_1E3E63480;
  block[4] = self;
  v10 = v7;
  v11 = a5;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __97__PKPassPaymentContainerView_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  char v11;
  _QWORD *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "paymentPass");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "devicePrimaryPaymentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subcredentials");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  if (v7 == v8)
  {

LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "_calculateTerminalStateWithRangingSuspensionReasons:", *(_QWORD *)(a1 + 48));
    v12 = *(_QWORD **)(a1 + 32);
    if (v12[134])
      objc_msgSend(v12, "_applyTerminalFailureState");
    else
      objc_msgSend(v12, "_resetToIdleState");
    goto LABEL_13;
  }
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {

    goto LABEL_13;
  }
  v11 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v11 & 1) != 0)
    goto LABEL_10;
LABEL_13:

}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PKPassPaymentContainerView_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __80__PKPassPaymentContainerView_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  if (objc_msgSend(*(id *)(a1 + 32), "style") == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "paymentPass");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "hasDeviceTransactionSourceIdentifier:", *(_QWORD *)(a1 + 40));

    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "_handleReceivedBarcodePaymentTransaction:", *(_QWORD *)(a1 + 48));
  }
}

- (void)contactlessInterfaceSessionHasPendingServerRequest:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PKPassPaymentContainerView_contactlessInterfaceSessionHasPendingServerRequest___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __81__PKPassPaymentContainerView_contactlessInterfaceSessionHasPendingServerRequest___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  id v4;

  v2 = *(_BYTE **)(a1 + 32);
  v3 = 21;
  if (!v2[784])
    v3 = 22;
  if (!*(_QWORD *)&v2[OBJC_IVAR___PKPassPaymentContainerView__passView[v3]]
    && (objc_msgSend(v2, "_recognizingBiometrics") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "passFooterContentViewRequestsSessionSuppression:", *(_QWORD *)(a1 + 32));

  }
}

- (void)contactlessInterfaceSessionDidTimeout:(id)a3 forPaymentApplications:(id)a4 paymentPass:(id)a5 valueAddedServicePasses:(id)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __127__PKPassPaymentContainerView_contactlessInterfaceSessionDidTimeout_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

_BYTE *__127__PKPassPaymentContainerView_contactlessInterfaceSessionDidTimeout_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke(uint64_t a1)
{
  _BYTE *result;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "_cancelTerminalResponseTimeout");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "updateDebugLabel:isErrorState:", CFSTR("did timeout"), 0);
  result = *(_BYTE **)(a1 + 32);
  v3 = 21;
  if (!result[784])
    v3 = 22;
  if (*(_QWORD *)&result[OBJC_IVAR___PKPassPaymentContainerView__passView[v3]] == 5)
    return (_BYTE *)objc_msgSend(result, "_resetToIdleState");
  return result;
}

- (void)contactlessInterfaceSessionDidStartTransaction:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__PKPassPaymentContainerView_contactlessInterfaceSessionDidStartTransaction_withContext___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __89__PKPassPaymentContainerView_contactlessInterfaceSessionDidStartTransaction_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1088), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "updateDebugLabel:isErrorState:", CFSTR("did start"), 0);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pkui_resetSharedRootAuthenticationContext");

  objc_msgSend(*(id *)(a1 + 32), "_cancelTerminalResponseTimeout");
  v3 = *(_BYTE **)(a1 + 32);
  v4 = 21;
  if (!v3[784])
    v4 = 22;
  v5 = *(_QWORD *)&v3[OBJC_IVAR___PKPassPaymentContainerView__passView[v4]];
  v6 = objc_msgSend(v3, "style");
  v7 = *(_QWORD **)(a1 + 32);
  if (v6 == 4)
  {
    v8 = (void *)v7[135];
    v7[135] = 0;

    if (v5 != 7)
    {
      v9 = *(void **)(a1 + 32);
      PKLocalizedIdentityString(CFSTR("PRESENTMENT_FOOTER_CONNECTING"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_applyPayState:withTextOverride:", 7, v10);

    }
  }
  else
  {
    objc_msgSend(v7, "_applyPaymentIndefiniteSuccessState");
  }
}

- (void)contactlessInterfaceSession:(id)a3 didReceive18013Request:(id)a4 readerAuthInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PKPassPaymentContainerView_contactlessInterfaceSession_didReceive18013Request_readerAuthInfo___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __96__PKPassPaymentContainerView_contactlessInterfaceSession_didReceive18013Request_readerAuthInfo___block_invoke(id *a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  const void *v6;
  _BOOL4 v7;
  NSObject *v8;
  char v9;
  PKDataReleaseViewController *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  __CFString *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *((_BYTE *)a1[4] + 1128) = 1;
  objc_msgSend(*((id *)a1[4] + 63), "updateDebugLabel:isErrorState:", CFSTR("received request"), 0);
  PKISO18013DataReleaseRequestFromSTSRequest(a1[5], a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExternalizedAuthenticationContext:", *((_QWORD *)a1[4] + 97));
  v3 = a1[4];
  v4 = (void *)v3[97];
  v3[97] = 0;

  objc_msgSend(v2, "authenticationACL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (const void *)SecAccessControlCreateFromData();
    v7 = v6 != 0;
    if (v6)
      goto LABEL_8;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = 0;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Could not create access control ref from provided data with error %@", buf, 0xCu);
  }

  if (!v7)
  {
    v10 = 0;
    goto LABEL_12;
  }
LABEL_8:
  v9 = objc_msgSend(MEMORY[0x1E0D6BFD8], "currentStateForAccessControl:", v6);
  CFRelease(v6);
  if ((v9 & 1) == 0
    || (v9 & 6) == 0
    || (v9 & 9) == 9
    || (objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47020]),
        v13,
        v14 == 1))
  {
    v10 = -[PKDataReleaseViewController initWithRequest:delegate:]([PKDataReleaseViewController alloc], "initWithRequest:delegate:", v2, a1[4]);
    if (v10)
    {
      objc_msgSend(a1[4], "_applyPayState:", 11);
      objc_storeWeak((id *)a1[4] + 132, v10);
      objc_msgSend(a1[4], "pkui_viewControllerFromResponderChain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, &__block_literal_global_109_1);

      goto LABEL_17;
    }
  }
  else
  {
    *((_QWORD *)a1[4] + 133) = 4;
    if (PKPearlIsAvailable())
      v15 = CFSTR("PRESENTMENT_BIOMETRICS_FACEID_DISABLED");
    else
      v15 = CFSTR("PRESENTMENT_BIOMETRICS_TOUCHID_DISABLED");
    PKLocalizedIdentityString(&v15->isa);
    v10 = (PKDataReleaseViewController *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "No controller to present", buf, 2u);
  }

  objc_msgSend(a1[4], "_cancelTerminalResponseTimeout");
  objc_msgSend(a1[4], "_endPaymentAuthorizationWithWillUpdateState:", 1);
  objc_msgSend(a1[4], "_endContactlessPaymentSession");
  if (!v10)
  {
    objc_msgSend(a1[4], "_textOverrideForFatalError");
    v10 = (PKDataReleaseViewController *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1[4], "_applyPayState:withTextOverride:", 9, v10);
LABEL_17:

}

void __96__PKPassPaymentContainerView_contactlessInterfaceSession_didReceive18013Request_readerAuthInfo___block_invoke_108()
{
  NSObject *v0;
  uint8_t v1[16];

  PKLogFacilityTypeGetObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19D178000, v0, OS_LOG_TYPE_DEFAULT, "Presented data release confirmation controller", v1, 2u);
  }

}

- (void)contactlessInterfaceSessionDidReceiveActivityTimeout:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PKPassPaymentContainerView_contactlessInterfaceSessionDidReceiveActivityTimeout___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __83__PKPassPaymentContainerView_contactlessInterfaceSessionDidReceiveActivityTimeout___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "paymentPass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTransitPass");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_cancelTerminalResponseTimeout");
    objc_msgSend(*(id *)(a1 + 32), "_applyTerminalTransactionSubstateWithSuccess:reset:", 1, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "updateDebugLabel:isErrorState:", CFSTR("activity timemout"), 0);
  }
}

- (void)contactlessInterfaceSessionDidReceiveUntrustedTerminal:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKPassPaymentContainerView_contactlessInterfaceSessionDidReceiveUntrustedTerminal___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __85__PKPassPaymentContainerView_contactlessInterfaceSessionDidReceiveUntrustedTerminal___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "paymentPass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isIdentityPass");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pkui_resetSharedRootAuthenticationContext");

    objc_msgSend(*(id *)(a1 + 32), "_cancelTerminalResponseTimeout");
    v5 = *(void **)(a1 + 32);
    PKLocalizedIdentityString(CFSTR("PRESENTMENT_UNTRUSTED_READER"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_applyTerminalTransactionSubstateWithSuccess:reset:errorOverride:", 0, 0, v6);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "updateDebugLabel:isErrorState:", CFSTR("untrusted reader"), 0);
    v7 = (void *)MEMORY[0x1E0D66A58];
    v8 = *MEMORY[0x1E0D698E8];
    v15[0] = *MEMORY[0x1E0D69940];
    v15[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0D68A90];
    v13[0] = *MEMORY[0x1E0D68AA0];
    v13[1] = v10;
    v11 = *MEMORY[0x1E0D68A98];
    v14[0] = *MEMORY[0x1E0D68BF0];
    v14[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subjects:sendEvent:", v9, v12);

  }
}

- (void)contactlessInterfaceSession:(id)a3 didFinishTransactionWithContext:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33[2];
  char v34;
  uint8_t buf[8];
  id location;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "updateDebugLabel:isErrorState:", CFSTR("did finish"), objc_msgSend(*(id *)(a1 + 40), "success") ^ 1);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pkui_resetSharedRootAuthenticationContext");

  objc_msgSend(*(id *)(a1 + 32), "_cancelTerminalResponseTimeout");
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = *(void **)(a1 + 40);
  if (v3)
    v4 = objc_msgSend(v3, "success");
  else
    v4 = 0;
  objc_msgSend(*(id *)(a1 + 32), "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "transitHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v4;
  v27 = (void *)objc_msgSend(*(id *)(a1 + 32), "style");
  objc_msgSend(*(id *)(a1 + 32), "pkui_viewControllerFromResponderChain");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isTransitPass") && !PKExpressEducationHasDismissedMessage())
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D672B0]);
    objc_msgSend(v5, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isExpressModeEnabledForPassUniqueIdentifier:", v8);

    if (v9)
    {
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Pre-arm transaction on express enabled transit pass", buf, 2u);
      }

      PKIncrementPreArmTransactionOnExpressPassCount();
      if ((unint64_t)PKGetPreArmTransactionOnExpressPassCount() >= *MEMORY[0x1E0D6A530])
        PKExpressEducationSetHasDismissedMessage();
    }

  }
  if (objc_msgSend(v5, "hasAssociatedPeerPaymentAccount"))
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D685D0], 0);
  if (v6)
  {
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 488);
    objc_msgSend(*(id *)(a1 + 40), "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "paymentApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "paymentPass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "expressState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "processTransitTransactionEventWithHistory:transactionDate:forPaymentApplication:withPassUniqueIdentifier:expressTransactionState:", v6, v12, v13, v15, v16);

  }
  v18 = *(void **)(a1 + 32);
  v17 = *(void **)(a1 + 40);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_119;
  v29[3] = &unk_1E3E76990;
  v29[4] = v18;
  v30 = v17;
  objc_copyWeak(v33, &location);
  v19 = v6;
  v31 = v19;
  v34 = v28;
  v20 = v26;
  v32 = v20;
  v33[1] = v27;
  objc_msgSend(v18, "_processPaymentTransactionForContext:withCompletion:", v30, v29);
  v21 = *(void **)(*(_QWORD *)(a1 + 32) + 488);
  objc_msgSend(*(id *)(a1 + 40), "paymentPass");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "uniqueID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "paymentApplication");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applicationIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "recordPaymentApplicationUsageForPassUniqueIdentifier:paymentApplicationIdentifier:", v23, v25);

  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
}

void __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_119(uint64_t a1, char a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13[2];
  char v14;
  char v15;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_2;
  v8[3] = &unk_1E3E76968;
  objc_copyWeak(v13, (id *)(a1 + 64));
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v14 = *(_BYTE *)(a1 + 80);
  v15 = a2;
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13[1] = *(id *)(a1 + 72);
  objc_msgSend(v4, "_processValueAddedServiceTransactionsForContext:withCompletion:", v5, v8);

  objc_destroyWeak(v13);
}

void __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  id WeakRetained;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  void (**v29)(_QWORD, _QWORD);
  id v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  id v34;
  id v35;
  char v36;
  char v37;
  char v38;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_3;
  aBlock[3] = &unk_1E3E76920;
  objc_copyWeak(&v35, (id *)(a1 + 64));
  v32 = *(id *)(a1 + 32);
  v33 = *(id *)(a1 + 40);
  v36 = *(_BYTE *)(a1 + 80);
  v37 = a2;
  v38 = *(_BYTE *)(a1 + 81);
  v34 = *(id *)(a1 + 48);
  v7 = _Block_copy(aBlock);
  v8 = (void (**)(_QWORD, _QWORD))v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (*(_BYTE *)(v9 + 1128))
    goto LABEL_2;
  v12 = *(_QWORD *)(a1 + 72);
  if (v12 >= 2)
  {
    if (v12 == 4)
    {
LABEL_2:
      WeakRetained = objc_loadWeakRetained((id *)(v9 + 1056));
      v11 = WeakRetained;
      if (WeakRetained)
      {
        objc_msgSend(WeakRetained, "dataReleaseCompletedWithError:", 0);
        objc_storeWeak((id *)(*(_QWORD *)(a1 + 56) + 1056), 0);
      }
      v8[2](v8, 0);
      goto LABEL_5;
    }
    if (v12 != 3)
    {
      (*((void (**)(void *, uint64_t))v7 + 2))(v7, 1);
      goto LABEL_6;
    }
  }
  if (*(_BYTE *)(a1 + 80))
  {
    v13 = objc_alloc(MEMORY[0x1E0D67708]);
    v14 = (void *)objc_msgSend(v13, "initWithIdentifier:bundleIdentifier:context:", *MEMORY[0x1E0D6BA08], *MEMORY[0x1E0D6B590], *MEMORY[0x1E0D6BA00]);
    objc_msgSend(v14, "donateSignalWithCompletion:", &__block_literal_global_122);

  }
  objc_msgSend(*(id *)(a1 + 32), "valueAddedServiceTransactions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  if (!(_DWORD)a2)
  {
    if (!*(_BYTE *)(a1 + 80))
    {
      objc_msgSend(v15, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "terminalMode") == 2)
      {
        v22 = objc_msgSend(*(id *)(a1 + 56), "_shouldShowTerminalIsNotRequestingPaymentError");

        if (v22)
        {
          objc_msgSend(*(id *)(a1 + 56), "_showTerminalIsNotRequestingPaymentError");
          goto LABEL_24;
        }
      }
      else
      {

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "expressState");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v23;
    if (v23 && (objc_msgSend(v23, "isExpress") & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 488), "handleStandaloneTransaction:", v17);
    else
      v8[2](v8, 1);
    goto LABEL_35;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 56) + 672) && objc_msgSend(v5, "count"))
  {
    v16 = *(_QWORD *)(a1 + 56);
    if (*(_BYTE *)(v16 + 874))
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(v16 + 672), "pass");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 && objc_msgSend(v5, "containsObject:", v17))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 672), "setStyle:", 1);
        v8[2](v8, 1);
LABEL_35:

        goto LABEL_5;
      }
    }
    objc_msgSend(v11, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v18, "terminalMode");

    v19 = *(_QWORD *)(a1 + 56);
    if (*(_QWORD *)(v19 + 672) && v26 == 3)
    {
      *(_BYTE *)(v19 + 875) = 1;
      v20 = *(void **)(*(_QWORD *)(a1 + 56) + 672);
      v27[0] = v6;
      v27[1] = 3221225472;
      v27[2] = __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_123;
      v27[3] = &unk_1E3E685A8;
      objc_copyWeak(&v30, (id *)(a1 + 64));
      v28 = v5;
      v29 = v8;
      objc_msgSend(v20, "setStyle:animated:completion:", 1, 0, v27);

      objc_destroyWeak(&v30);
    }
    else
    {
      objc_msgSend(v5, "firstObject", v26);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "uniqueID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v19, "_presentPassWithUniqueIdentifier:additionalPassUniqueIdentifiers:payState:", v25, 0, 8);

      v8[2](v8, 0);
    }
    goto LABEL_35;
  }
LABEL_24:
  v8[2](v8, a2);
LABEL_5:

LABEL_6:
  objc_destroyWeak(&v35);

}

void __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_3(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  BOOL v7;
  char v8;
  _BOOL8 v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 32), "transaction");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "valueAddedServiceTransactions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (*(_QWORD *)(a1 + 40))
        v7 = 1;
      else
        v7 = v6 == 0;
      v8 = !v7;
      if (v5 || (v8 & 1) != 0)
      {
        if (v5 || !v6 || *(_BYTE *)(a1 + 65))
        {
          if (*(_BYTE *)(a1 + 66))
            v9 = 1;
          else
            v9 = *(_BYTE *)(a1 + 65) != 0;
          objc_msgSend(v11, "_applyTerminalTransactionSubstateWithSuccess:reset:", v9, 1);
        }
      }
      else
      {
        objc_msgSend(v11, "_applyTerminalTransactionSubstateWithSuccess:reset:", *(unsigned __int8 *)(a1 + 64), 0);
        objc_msgSend(v11, "_finishHoldingTerminalTransactionSubstateAfterDelay:", 1.0);
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", *MEMORY[0x1E0D69C38], *(_QWORD *)(a1 + 48));

    WeakRetained = v11;
  }

}

void __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v8 = 138412290;
      v9 = v2;
      v5 = "TPSDiscoverabilitySignal - Failed to donate discoverability signal - contactless transaction: %@";
      v6 = v3;
      v7 = 12;
LABEL_6:
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    v5 = "TPSDiscoverabilitySignal - Successfully donated discoverability signal - contactless transaction";
    v6 = v3;
    v7 = 2;
    goto LABEL_6;
  }

}

void __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_123(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 84);
    objc_msgSend(a1[4], "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_2_124;
    v7[3] = &unk_1E3E61C30;
    objc_copyWeak(&v9, v2);
    v8 = a1[5];
    objc_msgSend(v5, "setPass:animated:completion:", v6, 0, v7);

    objc_destroyWeak(&v9);
  }

}

void __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_2_124(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 875) = 0;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_3_125;
    v4[3] = &unk_1E3E614F0;
    v5 = *(id *)(a1 + 32);
    objc_msgSend(v3, "_setVASInfoViewHidden:animated:completion:", 0, 1, v4);

  }
}

uint64_t __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_3_125(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)contactlessInterfaceSession:(id)a3 didEndPersistentCardEmulationWithContexts:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PKPassPaymentContainerView_contactlessInterfaceSession_didEndPersistentCardEmulationWithContexts___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __100__PKPassPaymentContainerView_contactlessInterfaceSession_didEndPersistentCardEmulationWithContexts___block_invoke(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  id *v31;
  _QWORD v32[6];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pkui_resetSharedRootAuthenticationContext");

  objc_msgSend(a1[4], "_cancelTerminalResponseTimeout");
  objc_msgSend(*((id *)a1[4] + 63), "setPersistentEmulationHint:", objc_msgSend(a1[5], "persistentCardEmulationQueued"));
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v3 = a1[6];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v34;
    v7 = MEMORY[0x1E0C809B0];
    v30 = v3;
    v31 = a1;
    v29 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v9, "paymentApplication", v29);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "transitHistory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11
          && (objc_msgSend(v9, "transaction"), v12 = (void *)objc_claimAutoreleasedReturnValue(),
                                               v12,
                                               !v12))
        {
          v14 = (void *)*((_QWORD *)a1[4] + 61);
          objc_msgSend(v9, "date");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "paymentPass");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "uniqueID");
          v17 = v5;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "expressState");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "processTransitTransactionEventWithHistory:transactionDate:forPaymentApplication:withPassUniqueIdentifier:expressTransactionState:", v11, v15, v10, v18, v19);

          v5 = v17;
          a1 = v31;

          v20 = (void *)*((_QWORD *)v31[4] + 61);
          v6 = v29;
          objc_msgSend(v9, "paymentPass");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "uniqueID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "applicationIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v20;
          v3 = v30;
          objc_msgSend(v24, "recordPaymentApplicationUsageForPassUniqueIdentifier:paymentApplicationIdentifier:", v22, v23);

          v7 = MEMORY[0x1E0C809B0];
        }
        else
        {
          v13 = a1[4];
          v32[0] = v7;
          v32[1] = 3221225472;
          v32[2] = __100__PKPassPaymentContainerView_contactlessInterfaceSession_didEndPersistentCardEmulationWithContexts___block_invoke_2;
          v32[3] = &unk_1E3E619E0;
          v32[4] = v13;
          v32[5] = v9;
          objc_msgSend(v13, "_processPaymentTransactionForContext:withCompletion:", v9, v32);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0D6AD00];
  v27 = a1[4];
  v37 = *MEMORY[0x1E0D6AD08];
  v38 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "postNotificationName:object:userInfo:", v26, v27, v28);

}

uint64_t __100__PKPassPaymentContainerView_contactlessInterfaceSession_didEndPersistentCardEmulationWithContexts___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processValueAddedServiceTransactionsForContext:withCompletion:", *(_QWORD *)(a1 + 40), 0);
}

- (void)contactlessInterfaceSessionDidFailDeferredAuthorization:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PKPassPaymentContainerView_contactlessInterfaceSessionDidFailDeferredAuthorization___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __86__PKPassPaymentContainerView_contactlessInterfaceSessionDidFailDeferredAuthorization___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pkui_resetSharedRootAuthenticationContext");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "updateDebugLabel:isErrorState:", CFSTR("did fail deferred authorization"), 1);
  return objc_msgSend(*(id *)(a1 + 32), "_applyTerminalTransactionSubstateWithSuccess:reset:", 0, 1);
}

- (void)contactlessInterfaceSessionDidFailTransaction:(id)a3 forPaymentApplication:(id)a4 paymentPass:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __110__PKPassPaymentContainerView_contactlessInterfaceSessionDidFailTransaction_forPaymentApplication_paymentPass___block_invoke;
  v8[3] = &unk_1E3E61388;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __110__PKPassPaymentContainerView_contactlessInterfaceSessionDidFailTransaction_forPaymentApplication_paymentPass___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pkui_resetSharedRootAuthenticationContext");

  objc_msgSend(*(id *)(a1 + 32), "_cancelTerminalResponseTimeout");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "updateDebugLabel:isErrorState:", CFSTR("did fail transaction"), 1);
  v3 = objc_msgSend(*(id *)(a1 + 32), "style");
  v4 = *(_QWORD *)(a1 + 32);
  if (v3 == 4 || *(_BYTE *)(v4 + 1128))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v4 + 1056));
    if (WeakRetained
      && (objc_msgSend(WeakRetained, "presentingViewController"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKDataReleaseErrorDomain"), 3, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "dataReleaseCompletedWithError:", v6);

      objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 1056), 0);
    }
    else
    {
      v7 = *(void **)(a1 + 32);
      PKLocalizedIdentityString(CFSTR("PRESENTMENT_TRANSACTION_ERROR"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_applyPayState:withTextOverride:", 9, v8);

      objc_msgSend(*(id *)(a1 + 32), "_resetToIdleStateAfterDelay:", 2.0);
    }
  }
  else
  {
    objc_msgSend((id)v4, "pass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueID");
    WeakRetained = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(WeakRetained, "isEqualToString:", v10);

    if (v11)
      objc_msgSend(*(id *)(a1 + 32), "_applyTerminalTransactionSubstateWithSuccess:reset:", 0, 1);
  }

}

- (id)_textOverrideForFatalError
{
  void *v2;
  uint64_t v3;

  -[PKPassFooterContentView paymentPass](self, "paymentPass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cardType");

  if (v3 == 4)
    PKLocalizedIdentityString(CFSTR("PRESENTMENT_TRANSACTION_ERROR"));
  else
    PKLocalizedPaymentString(CFSTR("PAYMENT_ERROR_TRANSACTION_ERROR"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)contactlessInterfaceSessionDidFail:(id)a3 forPaymentApplications:(id)a4 paymentPass:(id)a5 valueAddedServicePasses:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __124__PKPassPaymentContainerView_contactlessInterfaceSessionDidFail_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke;
  v9[3] = &unk_1E3E61388;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __124__PKPassPaymentContainerView_contactlessInterfaceSessionDidFail_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pkui_resetSharedRootAuthenticationContext");

  objc_msgSend(*(id *)(a1 + 32), "_cancelTerminalResponseTimeout");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "updateDebugLabel:isErrorState:", CFSTR("did fail transaction"), 1);
  objc_msgSend(*(id *)(a1 + 32), "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueID");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isEqualToString:", v4);

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "_textOverrideForFatalError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_applyPayState:withTextOverride:", 9, v7);

  }
}

- (void)contactlessInterfaceSessionDidTerminate:(id)a3
{
  -[PKPassPaymentContainerView contactlessInterfaceSessionDidTerminate:withErrorCode:](self, "contactlessInterfaceSessionDidTerminate:withErrorCode:", a3, 0);
}

- (void)contactlessInterfaceSessionDidTerminate:(id)a3 withErrorCode:(unint64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__PKPassPaymentContainerView_contactlessInterfaceSessionDidTerminate_withErrorCode___block_invoke;
  v4[3] = &unk_1E3E62010;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

void __84__PKPassPaymentContainerView_contactlessInterfaceSessionDidTerminate_withErrorCode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __CFString *v4;
  uint64_t v5;
  id v6;

  v2 = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1072) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "updateDebugLabel:isErrorState:", CFSTR("session did terminate"), 1);
  objc_msgSend(*(id *)(a1 + 32), "_cancelTerminalResponseTimeout");
  objc_msgSend(*(id *)(a1 + 32), "_endPaymentAuthorizationWithWillUpdateState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_endContactlessPaymentSession");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064) = 0;
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 == 2)
  {
    v4 = CFSTR("PRESENTMENT_NO_BLUETOOTH");
  }
  else
  {
    if (v3 != 1)
    {
LABEL_9:
      objc_msgSend(*(id *)(a1 + 32), "_textOverrideForFatalError");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (PKUseWLAN())
      v4 = CFSTR("PRESENTMENT_NO_WLAN_OR_BLUETOOTH");
    else
      v4 = CFSTR("PRESENTMENT_NO_WIFI_OR_BLUETOOTH");
    v2 = 2;
  }
  PKLocalizedIdentityString(&v4->isa);
  v5 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064) = v2;
  if (!v5)
    goto LABEL_9;
LABEL_10:
  v6 = (id)v5;
  objc_msgSend(*(id *)(a1 + 32), "_applyPayState:withTextOverride:", 9, v5);

}

- (void)contactlessInterfaceSessionDidEnterField:(id)a3 withProperties:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PKPassPaymentContainerView_contactlessInterfaceSessionDidEnterField_withProperties___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __86__PKPassPaymentContainerView_contactlessInterfaceSessionDidEnterField_withProperties___block_invoke(uint64_t a1)
{
  double v2;
  NSObject *v3;
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = CFAbsoluteTimeGetCurrent() - *(double *)(*(_QWORD *)(a1 + 32) + 880);
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = v2;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Last field exit was %g seconds ago.", (uint8_t *)&v4, 0xCu);
  }

  if (v2 >= 1.25)
    objc_msgSend(*(id *)(a1 + 32), "_handleContactlessInterfaceSessionDidEnterField:withProperties:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_handleContactlessInterfaceSessionDidEnterField:(id)a3 withProperties:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id *v13;
  id v14;
  PKPassLibrary *passLibrary;
  id v16;
  id v17;
  _QWORD v18[4];
  void *v19;
  _QWORD v20[4];
  _QWORD v21[2];
  id v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[5];
  id v26;

  v5 = a4;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke;
  aBlock[3] = &unk_1E3E61388;
  aBlock[4] = self;
  v7 = v5;
  v26 = v7;
  v8 = _Block_copy(aBlock);
  v9 = objc_msgSend(v7, "technology");
  v10 = objc_msgSend(v7, "valueAddedServiceMode");
  v11 = objc_msgSend(v7, "terminalType");
  if ((!objc_msgSend(v7, "secondaryPropertiesRequired")
     || objc_msgSend(v7, "secondaryPropertiesAcquired"))
    && (v9 & 8) != 0
    && ((objc_msgSend(v7, "merchantIdentifiers"),
         v12 = (void *)objc_claimAutoreleasedReturnValue(),
         v12,
         v12)
     || v11 == 3))
  {
    passLibrary = self->_passLibrary;
    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_2;
    v20[3] = &unk_1E3E769E0;
    v13 = (id *)v21;
    v16 = v7;
    v21[0] = v16;
    v21[1] = self;
    v22 = v8;
    v23 = v11;
    v24 = v10;
    v17 = v8;
    -[PKPassLibrary getMetadataForFieldWithProperties:withHandler:](passLibrary, "getMetadataForFieldWithProperties:withHandler:", v16, v20);

  }
  else
  {
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_6;
    v18[3] = &unk_1E3E61590;
    v13 = &v19;
    v19 = v8;
    v14 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], v18);
  }

}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id *v8;
  __CFString *v9;
  unint64_t v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  unint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "style") == 8)
    goto LABEL_35;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68B68], *MEMORY[0x1E0D68AA0]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68FF0], *MEMORY[0x1E0D68F50]);
  v4 = v3;
  v5 = v2;
  v6 = v5;
  if (v5 && v4)
  {
    v7 = objc_msgSend(v5, "passType");
    v8 = (id *)MEMORY[0x1E0D69618];
    if ((unint64_t)(v7 + 1) >= 3)
      v9 = (__CFString *)(id)*MEMORY[0x1E0D69618];
    else
      v9 = off_1E3E77408[v7 + 1];
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D69040]);

    v10 = objc_msgSend(v6, "style");
    if (v10 < 0xD && ((0x13FFu >> v10) & 1) != 0)
      v11 = off_1E3E77420[v10];
    else
      v11 = (__CFString *)*v8;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D69038]);

    objc_msgSend(v6, "nfcPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D69000]);

    v14 = v6;
    if (objc_msgSend(v14, "passType") == 1)
    {
      objc_msgSend(v14, "secureElementPass");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "cardType");
      if (v16 <= 4)
        v13 = (__CFString *)**((id **)&unk_1E3E77488 + v16);

    }
    else
    {
      v13 = CFSTR("other");
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D69028]);
    objc_msgSend(v14, "secureElementPass");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isIdentityPass"))
    {
      v18 = objc_msgSend(v17, "identityType");
      if ((unint64_t)(v18 - 1) < 3)
      {
        v19 = off_1E3E774B0[v18 - 1];
        goto LABEL_23;
      }
    }
    else if (objc_msgSend(v17, "isAccessPass"))
    {
      v20 = objc_msgSend(v17, "accessType");
      if (v20 < 7)
      {
        v19 = off_1E3E774C8[v20];
        goto LABEL_23;
      }
    }
    v19 = (__CFString *)*v8;
LABEL_23:

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D69020]);
    objc_msgSend(v14, "secureElementPass");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "devicePaymentApplications");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "count");

    PKAnalyticsReportSwitchToggleResultValue();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D68940]);
    objc_msgSend(v14, "secureElementPass");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *v8;
    objc_msgSend(v24, "organizationName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "length"))
    {
      v27 = objc_msgSend(v24, "cardType");
      if (v27 == 4 || v27 == 2)
      {
        v28 = v26;

        v25 = v28;
      }
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D68D88]);
  }

  v29 = *(void **)(a1 + 40);
  v30 = v4;
  v31 = objc_msgSend(v29, "terminalType");
  if (v31 <= 5)
  {
    v32 = (_QWORD *)MEMORY[0x1E0D69398];
    if (((1 << v31) & 0x2D) == 0)
    {
      v33 = *MEMORY[0x1E0D69398];
      if (v31 != 1)
        objc_msgSend(v30, "setObject:forKeyedSubscript:", CFSTR("identity"), *MEMORY[0x1E0D69398]);
      objc_msgSend(v30, "setObject:forKeyedSubscript:", CFSTR("payment"), v33);
    }
    objc_msgSend(v30, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68EF0], *v32);
  }

  v34 = (void *)MEMORY[0x1E0D66A58];
  v35 = *MEMORY[0x1E0D69940];
  v42[0] = *MEMORY[0x1E0D698E8];
  v42[1] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "subjects:sendEvent:", v36, v30);

LABEL_35:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "glyph");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFadeOnRecognized:", 1);

  v38 = *(_QWORD *)(a1 + 32);
  v39 = 21;
  if (!*(_BYTE *)(v38 + 784))
    v39 = 22;
  v40 = *(_QWORD *)(v38 + OBJC_IVAR___PKPassPaymentContainerView__passView[v39]);
  if (objc_msgSend(*(id *)(v38 + 512), "state") != 2
    && (objc_msgSend(*(id *)(a1 + 32), "_recognizingBiometrics") & 1) == 0
    && v40 <= 6
    && ((1 << v40) & 0x4E) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_applyPayState:", v40);
  }

}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "shouldIgnoreField"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_144;
    v12[3] = &unk_1E3E769B8;
    v12[4] = *(_QWORD *)(a1 + 40);
    v7 = v4;
    v9 = *(void **)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v13 = v7;
    v16 = v8;
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 64);
    v15 = v10;
    v17 = v11;
    v14 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring entered field: %@", buf, 0xCu);
    }

  }
}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_144(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  unint64_t v21;
  BOOL v22;
  uint64_t v23;
  BOOL v24;
  char isKindOfClass;
  id v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  void *v32;
  unint64_t v33;
  __CFString *v34;
  void *v35;
  __CFString *v36;
  id v37;
  void *v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  __CFString *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id location;
  _QWORD v59[3];

  v59[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pkui_viewControllerFromResponderChain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "associatedPassIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_QWORD *)(a1 + 64) == 3)
  {
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 656), "passWithUniqueID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToPassIncludingMetadata:", v7) & 1) != 0
      || ((v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 736), v22 = v21 > 6, v23 = (1 << v21) & 0x4E, !v22)
        ? (v24 = v23 == 0)
        : (v24 = 1),
          v24))
    {

    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        if (objc_msgSend(v6, "style") == 8)
        {
LABEL_62:
          objc_msgSend(*(id *)(a1 + 32), "_presentPassWithUniqueIdentifier:additionalPassUniqueIdentifiers:", v5, 0, v55);
          goto LABEL_30;
        }
        v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v26, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68B68], *MEMORY[0x1E0D68AA0]);
        objc_msgSend(v26, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68FF0], *MEMORY[0x1E0D68F50]);
        v27 = v26;
        v28 = v6;
        v29 = v28;
        if (!v28 || !v27)
        {
LABEL_61:

          v52 = (void *)MEMORY[0x1E0D66A58];
          v53 = *MEMORY[0x1E0D69940];
          v59[0] = *MEMORY[0x1E0D698E8];
          v59[1] = v53;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "subjects:sendEvent:", v54, v27);

          goto LABEL_62;
        }
        v30 = objc_msgSend(v28, "passType");
        if ((unint64_t)(v30 + 1) >= 3)
          v31 = (__CFString *)(id)*MEMORY[0x1E0D69618];
        else
          v31 = off_1E3E77408[v30 + 1];
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D69040]);

        v33 = objc_msgSend(v29, "style");
        if (v33 < 0xD && ((0x13FFu >> v33) & 1) != 0)
          v34 = off_1E3E77420[v33];
        else
          v34 = (__CFString *)(id)*MEMORY[0x1E0D69618];
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D69038]);

        objc_msgSend(v29, "nfcPayload");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        PKAnalyticsReportSwitchToggleResultValue();
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D69000]);

        v37 = v29;
        if (objc_msgSend(v37, "passType") == 1)
        {
          objc_msgSend(v37, "secureElementPass");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "cardType");
          if (v39 <= 4)
            v36 = (__CFString *)**((id **)&unk_1E3E77488 + v39);

        }
        else
        {
          v36 = CFSTR("other");
        }

        objc_msgSend(v27, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D69028]);
        objc_msgSend(v37, "secureElementPass");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "isIdentityPass"))
        {
          v41 = objc_msgSend(v40, "identityType");
          if ((unint64_t)(v41 - 1) < 3)
          {
            v42 = off_1E3E774B0[v41 - 1];
            goto LABEL_56;
          }
        }
        else if (objc_msgSend(v40, "isAccessPass"))
        {
          v43 = objc_msgSend(v40, "accessType");
          if (v43 < 7)
          {
            v42 = off_1E3E774C8[v43];
            goto LABEL_56;
          }
        }
        v42 = (__CFString *)(id)*MEMORY[0x1E0D69618];
LABEL_56:

        objc_msgSend(v27, "setObject:forKeyedSubscript:", v42, *MEMORY[0x1E0D69020]);
        objc_msgSend(v37, "secureElementPass");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "devicePaymentApplications");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "count");
        v55 = v29;

        PKAnalyticsReportSwitchToggleResultValue();
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "setObject:forKeyedSubscript:", v46, *MEMORY[0x1E0D68940]);
        objc_msgSend(v37, "secureElementPass");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (id)*MEMORY[0x1E0D69618];
        objc_msgSend(v47, "organizationName");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v49, "length"))
        {
          v50 = objc_msgSend(v47, "cardType");
          if (v50 == 4 || v50 == 2)
          {
            v51 = v49;

            v48 = v51;
            v29 = v55;
          }
        }

        objc_msgSend(v27, "setObject:forKeyedSubscript:", v48, *MEMORY[0x1E0D68D88]);
        goto LABEL_61;
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_30:

    goto LABEL_38;
  }
  v8 = *(_QWORD *)(a1 + 72);
  if (v8 != 4 && v8 != 2)
    goto LABEL_34;
  if (!objc_msgSend(v3, "count"))
  {
    v8 = *(_QWORD *)(a1 + 72);
LABEL_34:
    if (v8 == 3 && objc_msgSend(v4, "count"))
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      v32 = *(void **)(*(_QWORD *)(a1 + 32) + 656);
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_2_146;
      v56[3] = &unk_1E3E61BE0;
      objc_copyWeak(&v57, &location);
      objc_msgSend(v32, "getPassesWithUniqueIdentifiers:handler:", v4, v56);
      objc_destroyWeak(&v57);
      objc_destroyWeak(&location);
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    goto LABEL_38;
  }
  objc_msgSend(v4, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 656), "passWithUniqueID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "hasValidNFCPayload") && objc_msgSend(v12, "isValid"))
  {
    objc_msgSend(v12, "passTypeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataUsingEncoding:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "SHA256Hash");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "merchantIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v16, "containsObject:", v15);

    if ((_DWORD)v14)
    {
      objc_msgSend(v12, "uniqueID");
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = v12;
      v11 = v18;
      v10 = (void *)v17;
    }

  }
  if ((objc_msgSend(v11, "isEqualToPassIncludingMetadata:", v12) & 1) != 0
    || (objc_msgSend(v11, "hasStoredValue") & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v19 = *(void **)(a1 + 32);
    objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_presentPassWithUniqueIdentifier:additionalPassUniqueIdentifiers:", v10, v20);

  }
LABEL_38:

}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_2_146(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_3;
  v5[3] = &unk_1E3E612C0;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], v5);
  objc_destroyWeak(&v7);

}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id *v6;
  _QWORD *WeakRetained;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_4;
  v13[3] = &unk_1E3E63A28;
  v5 = v2;
  v14 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v13);
  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_setValueAddedServicePasses:", v5);
    v9 = (void *)v8[84];
    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_5;
    v11[3] = &unk_1E3E61C58;
    objc_copyWeak(&v12, v6);
    objc_msgSend(v9, "setPass:animated:completion:", v10, 0, v11);

    objc_destroyWeak(&v12);
  }

}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "hasValidNFCPayload")
    && objc_msgSend(v3, "isValid")
    && (objc_msgSend(v3, "hasStoredValue") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_5(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    if (objc_msgSend(WeakRetained, "_hasValueAddedServicePasses"))
      objc_msgSend(v2, "_setVASInfoViewHidden:animated:completion:", 0, 1, 0);
    WeakRetained = v2;
    if (v2[872])
    {
      objc_msgSend(v2, "_beginPaymentAuthorization");
      WeakRetained = v2;
    }
  }

}

uint64_t __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)contactlessInterfaceSessionDidExitField:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKPassPaymentContainerView_contactlessInterfaceSessionDidExitField___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __70__PKPassPaymentContainerView_contactlessInterfaceSessionDidExitField___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id *v8;
  __CFString *v9;
  unint64_t v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 880) = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "style") != 8)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68B70], *MEMORY[0x1E0D68AA0]);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68FF0], *MEMORY[0x1E0D68F50]);
    v4 = v3;
    v5 = v2;
    v6 = v5;
    if (!v5 || !v4)
    {
LABEL_28:

      v29 = (void *)MEMORY[0x1E0D66A58];
      v30 = *MEMORY[0x1E0D69940];
      v33[0] = *MEMORY[0x1E0D698E8];
      v33[1] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "subjects:sendEvent:", v31, v4);

      goto LABEL_29;
    }
    v7 = objc_msgSend(v5, "passType");
    v8 = (id *)MEMORY[0x1E0D69618];
    if ((unint64_t)(v7 + 1) >= 3)
      v9 = (__CFString *)(id)*MEMORY[0x1E0D69618];
    else
      v9 = off_1E3E77408[v7 + 1];
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D69040]);

    v10 = objc_msgSend(v6, "style");
    if (v10 < 0xD && ((0x13FFu >> v10) & 1) != 0)
      v11 = off_1E3E77420[v10];
    else
      v11 = (__CFString *)*v8;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D69038]);

    objc_msgSend(v6, "nfcPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D69000]);

    v14 = v6;
    if (objc_msgSend(v14, "passType") == 1)
    {
      objc_msgSend(v14, "secureElementPass");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "cardType");
      if (v16 <= 4)
        v13 = (__CFString *)**((id **)&unk_1E3E77488 + v16);

    }
    else
    {
      v13 = CFSTR("other");
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D69028]);
    objc_msgSend(v14, "secureElementPass");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isIdentityPass"))
    {
      v18 = objc_msgSend(v17, "identityType");
      if ((unint64_t)(v18 - 1) < 3)
      {
        v19 = off_1E3E774B0[v18 - 1];
        goto LABEL_23;
      }
    }
    else if (objc_msgSend(v17, "isAccessPass"))
    {
      v20 = objc_msgSend(v17, "accessType");
      if (v20 < 7)
      {
        v19 = off_1E3E774C8[v20];
        goto LABEL_23;
      }
    }
    v19 = (__CFString *)*v8;
LABEL_23:

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D69020]);
    objc_msgSend(v14, "secureElementPass");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "devicePaymentApplications");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "count");

    PKAnalyticsReportSwitchToggleResultValue();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D68940]);
    objc_msgSend(v14, "secureElementPass");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *v8;
    objc_msgSend(v24, "organizationName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "length"))
    {
      v27 = objc_msgSend(v24, "cardType");
      if (v27 == 4 || v27 == 2)
      {
        v28 = v26;

        v25 = v28;
      }
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D68D88]);
    goto LABEL_28;
  }
LABEL_29:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "glyph");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFadeOnRecognized:", 0);

  objc_msgSend(*(id *)(a1 + 32), "_cancelTerminalResponseTimeout");
  objc_msgSend(*(id *)(a1 + 32), "_promoteToAuthorizedStateIfPossible");

}

- (void)contactlessInterfaceSessionDidSelectPayment:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__PKPassPaymentContainerView_contactlessInterfaceSessionDidSelectPayment___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __74__PKPassPaymentContainerView_contactlessInterfaceSessionDidSelectPayment___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "style") == 2)
    return objc_msgSend(*(id *)(a1 + 32), "_showTerminalIsRequestingPaymentError");
  result = objc_msgSend(*(id *)(a1 + 40), "state");
  if (result == 2)
    return objc_msgSend(*(id *)(a1 + 32), "_beginTerminalResponseTimeout");
  return result;
}

- (void)contactlessInterfaceSession:(id)a3 didTransitionFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PKPassPaymentContainerView_contactlessInterfaceSession_didTransitionFromState_toState___block_invoke;
  block[3] = &unk_1E3E62928;
  block[4] = self;
  block[5] = a5;
  block[6] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __89__PKPassPaymentContainerView_contactlessInterfaceSession_didTransitionFromState_toState___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_QWORD *)(result + 40) == 2)
    result = objc_msgSend(*(id *)(result + 32), "_postDidAuthorizeNotification");
  if (*(_QWORD *)(v1 + 48) == 2)
    return objc_msgSend(*(id *)(v1 + 32), "_postDidDeauthorizeNotification");
  return result;
}

- (void)contactlessInterfaceSession:(id)a3 didReceiveExpressTransactionState:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__PKPassPaymentContainerView_contactlessInterfaceSession_didReceiveExpressTransactionState___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __92__PKPassPaymentContainerView_contactlessInterfaceSession_didReceiveExpressTransactionState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  _BOOL8 v4;
  uint64_t v5;
  int v6;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "resetPersistentCardEmulation"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setPersistentEmulationHint:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_cancelTerminalResponseTimeout");
  objc_msgSend(*(id *)(a1 + 32), "_cancelAuthentication");
  v2 = objc_msgSend(*(id *)(a1 + 40), "status");
  result = objc_msgSend(*(id *)(a1 + 40), "isProcessing");
  if ((result & 1) != 0)
  {
    if ((unint64_t)(v2 - 1) < 3)
    {
      v4 = v2 == 1;
      result = *(_QWORD *)(a1 + 32);
      v5 = 0;
      return objc_msgSend((id)result, "_applyTerminalTransactionSubstateWithSuccess:reset:", v4, v5);
    }
    if (!v2)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "_shouldDisplayPrimaryView"))
        objc_msgSend(*(id *)(a1 + 32), "_updateContentPrimaryView");
      if (objc_msgSend(*(id *)(a1 + 32), "_shouldDisplaySecondaryView"))
        objc_msgSend(*(id *)(a1 + 32), "_updateContentSecondaryView");
      return objc_msgSend(*(id *)(a1 + 32), "_applyPaymentIndefiniteSuccessState");
    }
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "isIgnorable");
    result = *(_QWORD *)(a1 + 32);
    if (v6)
      return objc_msgSend((id)result, "_resetToIdleState");
    if (!*(_BYTE *)(result + 824))
    {
      v4 = v2 == 1;
      v5 = 1;
      return objc_msgSend((id)result, "_applyTerminalTransactionSubstateWithSuccess:reset:", v4, v5);
    }
    if (!*(_QWORD *)(result + 832))
      return objc_msgSend((id)result, "_finishHoldingTerminalTransactionSubstateAfterDelay:", 1.0);
  }
  return result;
}

- (void)contactlessInterfaceSessionDidResume:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Contactless interface session did resume", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PKPassPaymentContainerView_contactlessInterfaceSessionDidResume___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __67__PKPassPaymentContainerView_contactlessInterfaceSessionDidResume___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 520) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_executeNextSessionExchangeTask");
}

- (void)contactlessInterfaceSession:(id)a3 didSuspendWithToken:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v5 = a4;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Contactless interface session did suspend", buf, 2u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__PKPassPaymentContainerView_contactlessInterfaceSession_didSuspendWithToken___block_invoke;
  v8[3] = &unk_1E3E61388;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __78__PKPassPaymentContainerView_contactlessInterfaceSession_didSuspendWithToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 520) = 1;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 1104);
    *(_QWORD *)(v2 + 1104) = 0;

  }
}

- (void)payStateView:(id)a3 revealingCheckmark:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v9;
  SystemSoundID v10;
  id v11;

  v11 = a3;
  v5 = 21;
  if (!self->_transitioning)
    v5 = 22;
  v6 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v5]);
  v7 = -[PKPassPaymentContainerView _isForegroundActive](self, "_isForegroundActive");
  if (v6 == 8 && v7)
  {
    kdebug_trace();
    -[PKPassFooterContentView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "passFooterContentViewDidTransact:success:", self, 1);

    if (objc_msgSend(v11, "accessPass"))
      v10 = 1163;
    else
      v10 = 1394;
    AudioServicesPlaySystemSound(v10);
  }

}

- (void)payStateViewRevealingFailure:(id)a3
{
  id v4;

  -[PKPassFooterContentView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passFooterContentViewDidTransact:success:", self, 0);

}

- (void)_beginPaymentAuthorization
{
  PKPassPaymentPayStateView *payStateView;
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 pendingAutomaticAuthorization;
  void *v9;
  void *v10;
  PKPassPaymentContainerView *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v17[6];
  uint8_t buf[4];
  PKPassPaymentContainerView *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PKPassPaymentContainerView _updateAuthenticatorState](self, "_updateAuthenticatorState");
  payStateView = self->_payStateView;
  v4 = -[PKPassPaymentContainerView _canAuthenticateWithBiometrics](self, "_canAuthenticateWithBiometrics") ^ 1;
  v5 = self->_transitioning || self->_currentPayState != 0;
  -[PKPassPaymentPayStateView setBiometricsUnavailableHint:animated:](payStateView, "setBiometricsUnavailableHint:animated:", v4, v5);
  if (!-[PKPassPaymentContainerView _authenticationAllowed](self, "_authenticationAllowed"))
  {
    -[PKPassPaymentContainerView _endPaymentAuthorizationWithWillUpdateState:](self, "_endPaymentAuthorizationWithWillUpdateState:", 0);
    return;
  }
  v6 = 21;
  if (!self->_transitioning)
    v6 = 22;
  v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v6]);
  pendingAutomaticAuthorization = self->_pendingAutomaticAuthorization;
  self->_pendingAutomaticAuthorization = 0;
  if (self->_requireExpress || pendingAutomaticAuthorization)
  {
    -[PKPassPaymentPayStateView glyph](self->_payStateView, "glyph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFadeOnRecognized:", 1);
    if (self->_authorizedExternalizedContext)
    {
      if (v7 != 6)
        -[PKPassPaymentContainerView _applyPayState:withTextOverride:animated:completionHandler:](self, "_applyPayState:withTextOverride:animated:completionHandler:", 6, 0, 0, 0);
      -[PKPassPaymentContainerView _performAuthentication](self, "_performAuthentication");
    }
    else
    {
      -[PKPassPaymentContainerView _cancelAuthentication](self, "_cancelAuthentication");
      if (v7 != 4)
        -[PKPassPaymentContainerView _applyPayState:](self, "_applyPayState:", 4);
      if (pendingAutomaticAuthorization)
      {
        v13 = -[PKAuthenticator authenticationIdentifier](self->_authenticator, "authenticationIdentifier");
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __56__PKPassPaymentContainerView__beginPaymentAuthorization__block_invoke;
        v17[3] = &unk_1E3E76A08;
        v17[4] = self;
        v17[5] = v13;
        -[PKPassPaymentContainerView _authorizeForTransactionWithAuthenticatorEvaluationResponse:authenticationIdentifier:completion:](self, "_authorizeForTransactionWithAuthenticatorEvaluationResponse:authenticationIdentifier:completion:", 0, v13, v17);
      }
      else
      {
        PKLogFacilityTypeGetObject();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v19 = self;
          _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "PKPassPaymentContainerView (%p): Skipping authorization.", buf, 0xCu);
        }

        -[PKPassPaymentContainerView _promoteToAuthorizedStateIfPossible](self, "_promoteToAuthorizedStateIfPossible");
      }
    }

    return;
  }
  if (-[PKPassFooterContentView style](self, "style") == 4)
  {
    if (-[PKContactlessInterfaceSession isWaitingOnConfirmationForHandoff](self->_contactlessInterfaceSession, "isWaitingOnConfirmationForHandoff"))
    {
      PKLocalizedIdentityString(CFSTR("PRESENTMENT_FOOTER_CONNECTING"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self;
      v12 = 7;
    }
    else
    {
      if (v7 == 4)
      {
LABEL_32:
        -[PKPassPaymentContainerView _activateForPayment](self, "_activateForPayment");
        return;
      }
      PKLocalizedIdentityString(CFSTR("PRESENTMENT_NFC_INSTRUCTION"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self;
      v12 = 4;
    }
    -[PKPassPaymentContainerView _applyPayState:withTextOverride:](v11, "_applyPayState:withTextOverride:", v12, v10);

    goto LABEL_32;
  }
  if (-[PKPassPaymentContainerView _canAuthenticateWithBiometrics](self, "_canAuthenticateWithBiometrics")
    || (PKUIOnlyDemoModeEnabled() & 1) != 0
    || PKStoreDemoModeEnabled())
  {
    if (self->_userIntentRequired)
      v14 = 2;
    else
      v14 = 1;
    if (v14 != v7)
      -[PKPassPaymentContainerView _applyPayState:](self, "_applyPayState:");
    -[PKPassPaymentContainerView _performAuthentication](self, "_performAuthentication");
  }
  else if (-[PKPassPaymentContainerView _canAuthenticateWithPasscode](self, "_canAuthenticateWithPasscode"))
  {
    if (self->_userIntentRequired)
      v16 = 2;
    else
      v16 = 3;
    if (v16 != v7)
      -[PKPassPaymentContainerView _applyPayState:](self, "_applyPayState:");
    -[PKPassPaymentContainerView _performAuthentication](self, "_performAuthentication");
    if (self->_presentationWasForcedFromButton)
      -[PKAuthenticator fallbackToSystemPasscodeUI](self->_authenticator, "fallbackToSystemPasscodeUI");
  }
  else if (v7 != 10)
  {
    -[PKPassPaymentContainerView _applyPayState:](self, "_applyPayState:", 10);
  }
}

void __56__PKPassPaymentContainerView__beginPaymentAuthorization__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 134217984;
      v11 = v8;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPassPaymentContainerView (%p): Automatically authorized card.", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_didAuthorizePaymentApplicationWithAuthenticationIdentifier:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v7)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 134217984;
      v11 = v9;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPassPaymentContainerView (%p): Failed to automatically authorize card, falling back to authentication.", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_beginPaymentAuthorization");
  }

}

- (void)_endPaymentAuthorizationWithWillUpdateState:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[PKPassPaymentContainerView _resetCardEmulationWithCompletion:](self, "_resetCardEmulationWithCompletion:", 0);
  if (v3)
  {
    -[PKPassPaymentContainerView _cancelAuthentication](self, "_cancelAuthentication");
  }
  else if (self->_authenticating)
  {
    -[PKAuthenticator cancelEvaluation](self->_authenticator, "cancelEvaluation");
  }
  -[PKPassPaymentContainerView _resetTransactionAuthenticationIfNecessary](self, "_resetTransactionAuthenticationIfNecessary");
  -[PKPassPaymentContainerView _dismissBarcodeViewControllerIfNecessaryWithCompletion:](self, "_dismissBarcodeViewControllerIfNecessaryWithCompletion:", 0);
  -[PKPassPaymentContainerView _cancelBarcodeDisplayTimer](self, "_cancelBarcodeDisplayTimer");
  if (!-[PKPassFooterContentView isInvalidated](self, "isInvalidated"))
    -[PKPassPaymentContainerView _updateBottomTextView](self, "_updateBottomTextView");
}

- (BOOL)_restartPaymentAuthorization
{
  uint64_t v3;
  unint64_t v4;

  v3 = 21;
  if (!self->_transitioning)
    v3 = 22;
  v4 = *(unint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___PKPassPaymentContainerView__passView[v3]);
  -[PKPassPaymentContainerView _resetCardEmulationWithCompletion:](self, "_resetCardEmulationWithCompletion:", 0);
  if (!self->_authenticating)
    return v4 == 5;
  -[PKPassPaymentContainerView _updateAuthenticatorState](self, "_updateAuthenticatorState");
  if (-[PKPassPaymentContainerView _authenticationAllowed](self, "_authenticationAllowed")
    && (-[PKPassPaymentContainerView _canAuthenticateWithBiometrics](self, "_canAuthenticateWithBiometrics")
     || -[PKPassPaymentContainerView _canAuthenticateWithPasscode](self, "_canAuthenticateWithPasscode")))
  {
    -[PKAuthenticator restartEvaluation](self->_authenticator, "restartEvaluation");
    return v4 == 5;
  }
  -[PKAuthenticator cancelEvaluation](self->_authenticator, "cancelEvaluation");
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 4)
    return 1;
  else
    return (v4 < 7) & (0x4Eu >> v4);
}

- (void)_beginBarcodeDisplayTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *barcodeDisplayTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  barcodeDisplayTimer = self->_barcodeDisplayTimer;
  self->_barcodeDisplayTimer = v3;

  v5 = self->_barcodeDisplayTimer;
  v6 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, self);
  v7 = self->_barcodeDisplayTimer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PKPassPaymentContainerView__beginBarcodeDisplayTimer__block_invoke;
  v8[3] = &unk_1E3E61310;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_barcodeDisplayTimer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __55__PKPassPaymentContainerView__beginBarcodeDisplayTimer__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  uint64_t v2;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_cancelBarcodeDisplayTimer");
    WeakRetained = v3;
    v2 = 21;
    if (!v3[784])
      v2 = 22;
    if (*(_QWORD *)&v3[OBJC_IVAR___PKPassPaymentContainerView__passView[v2]] == 5)
    {
      objc_msgSend(v3, "_endPaymentAuthorizationWithWillUpdateState:", 1);
      objc_msgSend(v3, "_resetToIdleState");
      WeakRetained = v3;
    }
  }

}

- (void)_cancelBarcodeDisplayTimer
{
  NSObject *barcodeDisplayTimer;
  OS_dispatch_source *v4;

  barcodeDisplayTimer = self->_barcodeDisplayTimer;
  if (barcodeDisplayTimer)
  {
    dispatch_source_cancel(barcodeDisplayTimer);
    v4 = self->_barcodeDisplayTimer;
    self->_barcodeDisplayTimer = 0;

  }
}

- (void)_performAuthentication
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CFAbsoluteTime Current;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSData *authorizedExternalizedContext;
  void *v15;
  PKAuthenticator *authenticator;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *AccesibilityIntentUnavailable;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  _QWORD aBlock[4];
  NSObject *v29;
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33[2];
  id buf[2];
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  if (!self->_authenticating)
  {
    if ((PKUIOnlyDemoModeEnabled() & 1) != 0 || PKStoreDemoModeEnabled())
    {
      PKLogFacilityTypeGetObject();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPassPaymentContainerView: skipping authentication due to demo mode.", (uint8_t *)buf, 2u);
      }
    }
    else
    {
      self->_authenticating = 1;
      v4 = (void *)MEMORY[0x1E0D66A58];
      v5 = *MEMORY[0x1E0D69940];
      v37[0] = *MEMORY[0x1E0D698E8];
      v37[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = *MEMORY[0x1E0D68AA0];
      v36 = *MEMORY[0x1E0D68C18];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subjects:sendEvent:", v6, v7);

      Current = CFAbsoluteTimeGetCurrent();
      -[PKPassFooterContentView pass](self, "pass");
      v3 = objc_claimAutoreleasedReturnValue();
      v9 = -[NSObject passType](v3, "passType");
      if (v9 == 1)
        v10 = v3;
      else
        v10 = 0;
      v11 = v10;
      v12 = 0;
      if (v9 != 1)
        v12 = objc_msgSend((id)objc_opt_class(), "userIntentPotentiallyRequiredForPass:fieldDetect:", v3, self->_presentationWasForFieldDetect) ^ 1;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6BFE0]), "initWithPolicy:", v12);
      objc_msgSend(v13, "setInitialAuthenticatorState:", self->_authenticatorState);
      objc_msgSend(v13, "setAssumeUserIntentAvailable:", !self->_userIntentRequired);
      if (self->_authorizedExternalizedContext)
      {
        objc_msgSend(v13, "setExternalizedContext:");
        objc_msgSend(v13, "setAssumeBiometricOrPasscodeAvailable:", 1);
        authorizedExternalizedContext = self->_authorizedExternalizedContext;
        self->_authorizedExternalizedContext = 0;

      }
      if (v11 && -[NSObject isAccessPass](v11, "isAccessPass"))
      {
        PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_PASSCODE_TITLE_CONFIRM"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPasscodeTitle:", v15);

      }
      objc_initWeak(buf, self);
      authenticator = self->_authenticator;
      v17 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __52__PKPassPaymentContainerView__performAuthentication__block_invoke;
      v31[3] = &unk_1E3E76A58;
      objc_copyWeak(v33, buf);
      v33[1] = *(id *)&Current;
      v18 = v11;
      v32 = v18;
      -[PKAuthenticator evaluateRequest:withCompletion:](authenticator, "evaluateRequest:withCompletion:", v13, v31);
      if (self->_userIntentStyle == -1)
      {
        -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          aBlock[0] = v17;
          aBlock[1] = 3221225472;
          aBlock[2] = __52__PKPassPaymentContainerView__performAuthentication__block_invoke_160;
          aBlock[3] = &unk_1E3E61B68;
          objc_copyWeak(&v30, buf);
          v29 = v18;
          v20 = _Block_copy(aBlock);
          v23 = v17;
          v24 = 3221225472;
          v25 = __52__PKPassPaymentContainerView__performAuthentication__block_invoke_2;
          v26 = &unk_1E3E73920;
          objc_copyWeak(&v27, buf);
          v21 = _Block_copy(&v23);
          AccesibilityIntentUnavailable = PKAlertCreateAccesibilityIntentUnavailable(v20, v21);
          objc_msgSend(v19, "presentViewController:animated:completion:", AccesibilityIntentUnavailable, 1, 0, v23, v24, v25, v26);

          objc_destroyWeak(&v27);
          objc_destroyWeak(&v30);
        }

      }
      objc_destroyWeak(v33);
      objc_destroyWeak(buf);

    }
  }
}

void __52__PKPassPaymentContainerView__performAuthentication__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  double Current;
  int IsAvailable;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  id v34[2];
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[2];
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    Current = CFAbsoluteTimeGetCurrent();
    *((_BYTE *)WeakRetained + 752) = 0;
    IsAvailable = PKUserIntentIsAvailable();
    v7 = 3;
    if (!IsAvailable)
      v7 = 0;
    *((_QWORD *)WeakRetained + 96) = v7;
    switch(objc_msgSend(v3, "result"))
    {
      case 0:
        v8 = (void *)objc_msgSend(*((id *)WeakRetained + 62), "authenticationIdentifier");
        PKLogFacilityTypeGetObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Authentication Succeeded", buf, 2u);
        }

        v10 = (void *)MEMORY[0x1E0D66A58];
        v11 = *MEMORY[0x1E0D69940];
        v50[0] = *MEMORY[0x1E0D698E8];
        v50[1] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = *MEMORY[0x1E0D68AA0];
        v49 = *MEMORY[0x1E0D68AF8];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "subjects:sendEvent:", v12, v13);

        objc_msgSend(*((id *)WeakRetained + 63), "glyph");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "fadeOnRecognized") & 1) == 0)
          objc_msgSend(v14, "setFadeOnRecognized:", Current - *(double *)(a1 + 48) < 0.1);
        if (objc_msgSend(WeakRetained, "_authenticationAllowed")
          && objc_msgSend(v3, "biometricMatch"))
        {
          objc_msgSend(MEMORY[0x1E0D6BFF0], "invokeSuccessFeedback");
        }
        if (objc_msgSend(WeakRetained, "style") == 3)
          objc_msgSend(WeakRetained, "_applyPayState:withTextOverride:animated:completionHandler:", 4, 0, 0, 0);
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __52__PKPassPaymentContainerView__performAuthentication__block_invoke_157;
        v32[3] = &unk_1E3E76A30;
        objc_copyWeak(v34, (id *)(a1 + 40));
        v34[1] = v8;
        v33 = *(id *)(a1 + 32);
        objc_msgSend(WeakRetained, "_authorizeForTransactionWithAuthenticatorEvaluationResponse:authenticationIdentifier:completion:", v3, v8, v32);

        objc_destroyWeak(v34);
        break;
      case 1:
        v15 = (void *)MEMORY[0x1E0D66A58];
        v16 = *MEMORY[0x1E0D69940];
        v47[0] = *MEMORY[0x1E0D698E8];
        v47[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = *MEMORY[0x1E0D68AA0];
        v46 = *MEMORY[0x1E0D68AD8];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "subjects:sendEvent:", v17, v18);

        objc_msgSend(WeakRetained, "_resetToIdleState");
        break;
      case 2:
        v19 = (void *)MEMORY[0x1E0D66A58];
        v20 = *MEMORY[0x1E0D69940];
        v44[0] = *MEMORY[0x1E0D698E8];
        v44[1] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = *MEMORY[0x1E0D68AA0];
        v43 = *MEMORY[0x1E0D68AD0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "subjects:sendEvent:", v21, v22);

        objc_msgSend(WeakRetained, "_applyPayState:", 0);
        break;
      case 3:
      case 6:
      case 7:
        objc_msgSend(WeakRetained, "_applyPayState:", 0);
        break;
      case 4:
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "processName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v28, "processIdentifier");
        PKLogFacilityTypeGetObject();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v39 = v29;
          v40 = 2048;
          v41 = v30;
          _os_log_impl(&dword_19D178000, v31, OS_LOG_TYPE_DEFAULT, "Authentication by %@[%ld] preempted by another process.", buf, 0x16u);
        }

        objc_msgSend(WeakRetained, "_applyPayState:", 0);
        break;
      case 5:
        v23 = (void *)MEMORY[0x1E0D66A58];
        v24 = *MEMORY[0x1E0D69940];
        v37[0] = *MEMORY[0x1E0D698E8];
        v37[1] = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *MEMORY[0x1E0D68AA0];
        v36 = *MEMORY[0x1E0D68AE0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "subjects:sendEvent:", v25, v26);

        objc_msgSend(*(id *)(a1 + 32), "isAccessPass");
        PKLocalizedSEPAuthorizationErrorString();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_applyPayState:withTextOverride:", 9, v27);
        objc_msgSend(WeakRetained, "_resetToIdleStateAfterDelay:", 4.0);

        break;
      default:
        break;
    }
  }

}

void __52__PKPassPaymentContainerView__performAuthentication__block_invoke_157(uint64_t a1, int a2, void *a3)
{
  id *WeakRetained;
  id *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained[62], "authenticationIdentifier") == *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v6[63], "glyph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFadeOnRecognized:", objc_msgSend(v6[64], "fieldPresent"));

    if (a2)
    {
      objc_msgSend(v6, "_didAuthorizePaymentApplicationWithAuthenticationIdentifier:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      v8 = (uint64_t)v9;
      if (!v9)
      {
        objc_msgSend(*(id *)(a1 + 32), "isAccessPass");
        PKLocalizedSEPAuthorizationErrorString();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v9 = (id)v8;
      objc_msgSend(v6, "_applyPayState:withTextOverride:", 9, v8);
      objc_msgSend(v6, "_resetToIdleStateAfterDelay:", 4.0);
    }
  }

}

void __52__PKPassPaymentContainerView__performAuthentication__block_invoke_160(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[752])
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "isAccessPass");
    PKLocalizedSEPAuthorizationErrorString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_applyPayState:withTextOverride:", 9, v3);

    WeakRetained = v4;
  }

}

void __52__PKPassPaymentContainerView__performAuthentication__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_openURL:", v5);

}

- (void)_cancelAuthentication
{
  if (self->_authenticating)
  {
    self->_authenticating = 0;
    -[PKAuthenticator cancelEvaluationWithOptions:](self->_authenticator, "cancelEvaluationWithOptions:", 1);
  }
}

- (void)_endContactlessPaymentSession
{
  PKContactlessInterfaceSession *contactlessInterfaceSession;
  id WeakRetained;
  void *v5;

  if (self->_contactlessInterfaceSession)
  {
    objc_msgSend(MEMORY[0x1E0D66C70], "attachDefaultBehaviorToSession:");
    InvalidateSession_0(self->_contactlessInterfaceSession);
    contactlessInterfaceSession = self->_contactlessInterfaceSession;
    self->_contactlessInterfaceSession = 0;

    self->_contactlessInterfaceSessionSuspended = 0;
    if (-[PKPassFooterContentView style](self, "style") == 4 || self->_didReceiveISO18013Signal)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataReleaseVC);
      if (WeakRetained)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKDataReleaseErrorDomain"), 4, 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "dataReleaseCompletedWithError:", v5);

        objc_storeWeak((id *)&self->_dataReleaseVC, 0);
      }

    }
    -[PKPassPaymentContainerView _clearSessionExchangeTasks](self, "_clearSessionExchangeTasks");
  }
  self->_didReceiveISO18013Signal = 0;
}

- (void)_activateForPayment
{
  if (-[PKPassFooterContentView style](self, "style") != 2)
    -[PKPassPaymentContainerView _activateForPaymentWithApplications:](self, "_activateForPaymentWithApplications:", 0);
}

- (void)_activateForPaymentWithApplications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PKPassFooterContentView style](self, "style") != 2 && -[PKPassFooterContentView style](self, "style") != 3)
  {
    -[PKPassFooterContentView paymentPass](self, "paymentPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "count"))
    {
      switch(objc_msgSend(v5, "contactlessActivationGroupingType"))
      {
        case 0:

          v4 = (id)MEMORY[0x1E0C9AA60];
          break;
        case 1:
          objc_msgSend(v5, "devicePrimaryContactlessPaymentApplication");
          v7 = objc_claimAutoreleasedReturnValue();
          v8 = (void *)v7;
          if (v7)
          {
            v18[0] = v7;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
            v9 = objc_claimAutoreleasedReturnValue();

            v4 = (id)v9;
          }
          else
          {

            v4 = (id)MEMORY[0x1E0C9AA60];
          }

          break;
        case 2:
          -[PKPaymentService defaultPaymentApplicationForPassUniqueIdentifier:](self->_paymentService, "defaultPaymentApplicationForPassUniqueIdentifier:", v6);
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v10;
          if (v10)
          {
            v17 = v10;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
          objc_msgSend(v5, "devicePrimaryContactlessPaymentApplication");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (void *)v14;
            v16 = v14;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
            v13 = objc_claimAutoreleasedReturnValue();

            v4 = v15;
          }
          else
          {

            v4 = 0;
            v13 = MEMORY[0x1E0C9AA60];
          }
          goto LABEL_14;
        case 3:
          objc_msgSend(v5, "deviceContactlessPaymentApplications");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "pk_arrayCopy");
LABEL_13:
          v13 = v12;
LABEL_14:

          v4 = (id)v13;
          break;
        default:
          break;
      }
    }
    -[PKPassPaymentContainerView _activatePaymentApplications:forPaymentPass:withCompletion:](self, "_activatePaymentApplications:forPaymentPass:withCompletion:", v4, v5, 0);

  }
}

- (void)_passcodeFallbackButtonPressed:(id)a3
{
  -[PKAuthenticator fallbackToSystemPasscodeUI](self->_authenticator, "fallbackToSystemPasscodeUI", a3);
}

- (void)_addPasscodeButtonPressed:(id)a3
{
  const __CFString *v4;
  id v5;

  if (PKPearlIsAvailable())
    v4 = CFSTR("prefs:root=Pearl");
  else
    v4 = CFSTR("prefs:root=TOUCHID_PASSCODE&path=TOUCHID_PASSCODE");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassPaymentContainerView _openURL:](self, "_openURL:", v5);

}

- (void)_calculateTerminalStateWithRangingSuspensionReasons:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  id v11;

  -[PKPassFooterContentView paymentPass](self, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "devicePrimaryPaymentApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subcredentials");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v7 = PKRangingSuspensionDisplayableReasonForRangingSuspensionReason();
  if (objc_msgSend(v11, "supportedRadioTechnologies") != 2)
  {
    v9 = 0;
    v10 = 0;
    v8 = v11;
    goto LABEL_5;
  }
  v8 = v11;
  if (v7 <= 4)
  {
    v9 = qword_19DF17AC0[v7];
    v10 = qword_19DF17AE8[v7];
LABEL_5:
    self->_failureReason = v9;
    self->_failureAction = v10;
  }

}

- (void)_applyTerminalFailureState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  uint64_t v10;
  id v11;
  id v12;

  switch(self->_failureReason)
  {
    case 2:
      -[PKPassFooterContentView paymentPass](self, "paymentPass");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "devicePrimaryPaymentApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subcredentials");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "anyObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6
        && (objc_msgSend(v6, "entitlement"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v7, "carKeyEntitlementType"),
            v7,
            v8 <= 6))
      {
        PKLocalizedCredentialString(&off_1E3E77500[v8]->isa);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

      v10 = (uint64_t)v11;
      if (!v11)
        goto LABEL_9;
      goto LABEL_10;
    case 3:
      v9 = CFSTR("UWB_UPDATED_FAILED_CHECKMARK_OVERRIDE");
      goto LABEL_8;
    case 4:
      v9 = CFSTR("TURN_OFF_AIRPLANE_MODE");
      goto LABEL_8;
    case 5:
      v9 = CFSTR("BLUETOOTH_DISABLED_TITLE");
LABEL_8:
      PKLocalizedCredentialString(&v9->isa);
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_9;
      goto LABEL_10;
    default:
LABEL_9:
      -[PKPassPaymentContainerView _textOverrideForFatalError](self, "_textOverrideForFatalError");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v12 = (id)v10;
      -[PKPassPaymentContainerView _applyPayState:withTextOverride:](self, "_applyPayState:withTextOverride:", 9, v10);

      return;
  }
}

- (void)_resetToIdleState
{
  uint64_t v3;
  uint64_t v4;

  v3 = 21;
  if (!self->_transitioning)
    v3 = 22;
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v3]);
  -[PKPassPaymentPayStateView updateDebugLabel:isErrorState:](self->_payStateView, "updateDebugLabel:isErrorState:", 0, 0);
  if (-[PKPassPaymentContainerView _isBackgrounded](self, "_isBackgrounded")
    || !self->_isVisible
    || self->_waitingForPasses)
  {
    if (v4)
      -[PKPassPaymentContainerView _applyPayState:](self, "_applyPayState:", 0);
  }
  else
  {
    -[PKPassPaymentContainerView _beginPaymentAuthorization](self, "_beginPaymentAuthorization");
  }
}

- (void)_resetToIdleStateAfterDelay:(double)a3
{
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__PKPassPaymentContainerView__resetToIdleStateAfterDelay___block_invoke;
  v5[3] = &unk_1E3E61310;
  objc_copyWeak(&v6, &location);
  dispatch_after(v4, MEMORY[0x1E0C80D38], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__PKPassPaymentContainerView__resetToIdleStateAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_resetToIdleState");
    WeakRetained = v2;
  }

}

- (void)_promoteToAuthorizedStateIfPossible
{
  uint64_t v3;
  uint64_t v4;

  v3 = 21;
  if (!self->_transitioning)
    v3 = 22;
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v3]);
  if ((-[PKContactlessInterfaceSession state](self->_contactlessInterfaceSession, "state") == 2
     || (PKUIOnlyDemoModeEnabled() & 1) != 0
     || (PKStoreDemoModeEnabled() & 1) != 0
     || self->_activeBarcodeIdentifier
     || self->_requireExpress)
    && ((unint64_t)(v4 - 1) < 4 || v4 == 6))
  {
    -[PKPassPaymentContainerView _applyPayState:](self, "_applyPayState:", 5);
  }
}

- (void)_didAuthorizePaymentApplicationWithAuthenticationIdentifier:(unint64_t)a3
{
  dispatch_time_t v5;
  void *v6;
  _QWORD v7[6];

  if (-[PKPassPaymentContainerView _authenticationAllowed](self, "_authenticationAllowed")
    && -[PKAuthenticator authenticationIdentifier](self->_authenticator, "authenticationIdentifier") == a3)
  {
    if (-[PKContactlessInterfaceSession fieldPresent](self->_contactlessInterfaceSession, "fieldPresent"))
    {
      v5 = dispatch_time(0, 500000000);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __90__PKPassPaymentContainerView__didAuthorizePaymentApplicationWithAuthenticationIdentifier___block_invoke;
      v7[3] = &unk_1E3E62010;
      v7[4] = self;
      v7[5] = a3;
      dispatch_after(v5, MEMORY[0x1E0C80D38], v7);
    }
    else
    {
      -[PKPassPaymentContainerView _promoteToAuthorizedStateIfPossible](self, "_promoteToAuthorizedStateIfPossible");
    }
    -[PKPassFooterContentView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "passFooterContentViewDidAuthenticate:", self);

  }
}

uint64_t __90__PKPassPaymentContainerView__didAuthorizePaymentApplicationWithAuthenticationIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "authenticationIdentifier");
  if (result == *(_QWORD *)(a1 + 40))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_authenticationAllowed");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "_promoteToAuthorizedStateIfPossible");
  }
  return result;
}

- (void)_updateCoachingInstruction
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  BOOL v6;

  v3 = 21;
  if (!self->_transitioning)
    v3 = 22;
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v3]);
  v5 = -[PKPassFooterContentView coachingState](self, "coachingState");
  if (-[PKPassPaymentContainerView _authenticationAllowed](self, "_authenticationAllowed")
    && self->_authenticating
    && v4 == 1)
  {
    if (self->_transactionSubstate)
      v6 = 0;
    else
      v6 = v5 == 3;
    if (v6)
      -[PKPassPaymentContainerView _applyPayState:](self, "_applyPayState:", 3);
  }
}

- (void)_openURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CA5938]);
  objc_msgSend(v5, "setSensitive:", 1);
  v9 = *MEMORY[0x1E0D22D88];
  v10[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrontBoardOptions:", v6);

  if ((PKRunningInViewService() & 1) != 0 || PKRunningInLockScreenPlugin())
  {
    -[PKPassPaymentContainerView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      PKPostOpenApplicationNotification(v7, v4, v5);

  }
  else
  {
    PKOpenApplication(v4, v5);
  }

}

- (void)_transactionAwardsViewTapped:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKPaymentService *paymentService;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D698E8];
  v21[0] = *MEMORY[0x1E0D69940];
  v21[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D68858];
  v19[0] = *MEMORY[0x1E0D68AA0];
  v19[1] = v7;
  v8 = *MEMORY[0x1E0D695F8];
  v20[0] = *MEMORY[0x1E0D68B18];
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subjects:sendEvent:", v6, v9);

  -[PKPaymentTransaction awards](self->_transactionForDisplayedBarcode, "awards");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PKPassFooterContentView paymentPass](self, "paymentPass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    paymentService = self->_paymentService;
    objc_msgSend(v12, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentService transactionsAppLaunchTokenForPassWithUniqueIdentifier:](paymentService, "transactionsAppLaunchTokenForPassWithUniqueIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/offers/%@"), v16);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = CFSTR("/offers");
    }
    +[PKPaymentNotificationAppURLHelper appURLForTransactionNotification:excludeTransactionIdentifier:pass:pathSuffix:appLaunchToken:](PKPaymentNotificationAppURLHelper, "appURLForTransactionNotification:excludeTransactionIdentifier:pass:pathSuffix:appLaunchToken:", self->_transactionForDisplayedBarcode, 0, v12, v17, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      -[PKPassPaymentContainerView _openURL:](self, "_openURL:", v18);

  }
}

- (void)_postDidAuthorizeNotification
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D69C28];
  -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", v3, v4);

}

- (void)_postDidDeauthorizeNotification
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D69C30];
  -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", v3, v4);

}

- (void)_activatePaymentApplications:(id)a3 forPaymentPass:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKContactlessInterfaceSession *v11;
  NSObject *authorizationQueue;
  id v13;
  id v14;
  id v15;
  PKContactlessInterfaceSession *v16;
  _QWORD block[4];
  PKContactlessInterfaceSession *v18;
  id v19;
  id v20;
  PKPassPaymentContainerView *v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self->_contactlessInterfaceSession;
  authorizationQueue = self->_authorizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PKPassPaymentContainerView__activatePaymentApplications_forPaymentPass_withCompletion___block_invoke;
  block[3] = &unk_1E3E669B8;
  v18 = v11;
  v19 = v8;
  v20 = v9;
  v21 = self;
  v22 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = v11;
  dispatch_async(authorizationQueue, block);

}

void __89__PKPassPaymentContainerView__activatePaymentApplications_forPaymentPass_withCompletion___block_invoke(uint64_t a1)
{
  int v2;
  char v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "activatePaymentApplications:forPaymentPass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = v2;
  if (v2 && objc_msgSend(*(id *)(a1 + 56), "style") == 4)
    objc_msgSend(*(id *)(a1 + 32), "authorizeAndStartCardEmulationWithCredential:deferAuthorization:requiresConfirmationForHandoff:startHandoffIfPending:", 0, 0, 0, 1);
  v4 = *(void **)(a1 + 64);
  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __89__PKPassPaymentContainerView__activatePaymentApplications_forPaymentPass_withCompletion___block_invoke_2;
    v5[3] = &unk_1E3E61A58;
    v6 = v4;
    v7 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __89__PKPassPaymentContainerView__activatePaymentApplications_forPaymentPass_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_authorizeForTransactionWithAuthenticatorEvaluationResponse:(id)a3 authenticationIdentifier:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  PKContactlessInterfaceSession *v13;
  void *v14;
  NSObject *authorizationQueue;
  id v16;
  PKContactlessInterfaceSession *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  _QWORD *v22;
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD block[4];
  PKContactlessInterfaceSession *v27;
  id v28;
  id v29;
  uint64_t *v30;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  _QWORD *v34;
  id v35[2];
  id location;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;

  v8 = a3;
  v9 = a5;
  if (-[PKPassPaymentContainerView _authenticationAllowed](self, "_authenticationAllowed")
    && -[PKAuthenticator authenticationIdentifier](self->_authenticator, "authenticationIdentifier") == a4)
  {
    objc_msgSend(v8, "credential");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = dispatch_group_create();
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__52;
    v37[4] = __Block_byref_object_dispose__52;
    v38 = 0;
    objc_initWeak(&location, self);
    if ((PKUIOnlyDemoModeEnabled() & 1) != 0 || (PKStoreDemoModeEnabled() & 1) != 0)
    {
      *((_BYTE *)v40 + 24) = 1;
    }
    else if (-[PKPassFooterContentView style](self, "style") == 3)
    {
      dispatch_group_enter(v11);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke;
      v31[3] = &unk_1E3E76A80;
      objc_copyWeak(v35, &location);
      v35[1] = (id)a4;
      v32 = v11;
      v33 = &v39;
      v34 = v37;
      -[PKPassPaymentContainerView _retrieveDecryptedBarcodeWithAuthorization:shouldFetchBarcodeIfNecessary:completion:](self, "_retrieveDecryptedBarcodeWithAuthorization:shouldFetchBarcodeIfNecessary:completion:", v10, 1, v31);

      objc_destroyWeak(v35);
    }
    else
    {
      v13 = self->_contactlessInterfaceSession;
      v14 = (void *)-[NSMutableArray copy](self->_valueAddedPasses, "copy");
      authorizationQueue = self->_authorizationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke_2;
      block[3] = &unk_1E3E76AA8;
      v27 = v13;
      v28 = v14;
      v29 = v10;
      v30 = &v39;
      v16 = v14;
      v17 = v13;
      dispatch_group_async(v11, authorizationQueue, block);

    }
    if (-[PKPassPaymentContainerView _shouldDisplayPrimaryView](self, "_shouldDisplayPrimaryView"))
      -[PKPassPaymentContainerView _updateContentPrimaryView](self, "_updateContentPrimaryView");
    if (-[PKPassPaymentContainerView _shouldDisplaySecondaryView](self, "_shouldDisplaySecondaryView"))
      -[PKPassPaymentContainerView _updateContentSecondaryView](self, "_updateContentSecondaryView");
    v12 = 21;
    if (!self->_transitioning)
      v12 = 22;
    if (*(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR___PKPassPaymentContainerView__passView[v12])
       - 1 <= 2
      && !self->_transactionSubstate)
    {
      dispatch_group_enter(v11);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke_197;
      v24[3] = &unk_1E3E62288;
      v25 = v11;
      -[PKPassPaymentContainerView _setGlyphState:animated:withCompletionHandler:](self, "_setGlyphState:animated:withCompletionHandler:", 8, 1, v24);

    }
    if (v9)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke_2_198;
      v18[3] = &unk_1E3E76AD0;
      v20 = v9;
      v21 = &v39;
      v22 = v37;
      objc_copyWeak(&v23, &location);
      v19 = v8;
      dispatch_group_notify(v11, MEMORY[0x1E0C80D38], v18);

      objc_destroyWeak(&v23);
    }
    objc_destroyWeak(&location);
    _Block_object_dispose(v37, 8);

    _Block_object_dispose(&v39, 8);
  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

void __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  const __CFString *v17;
  void *v18;
  id *WeakRetained;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0D66A58];
  v11 = *MEMORY[0x1E0D69940];
  v39[0] = *MEMORY[0x1E0D698E8];
  v39[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D68AA0];
  v38[0] = *MEMORY[0x1E0D68B00];
  v14 = *MEMORY[0x1E0D687E8];
  v37[0] = v13;
  v37[1] = v14;
  PKAnalyticsReportBarcodeCredentialRetrivalStatusFromError();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v15;
  v37[2] = *MEMORY[0x1E0D68E50];
  v16 = PKNetworkConnectivityAvailable();
  v17 = CFSTR("true");
  if (!v16)
    v17 = CFSTR("false");
  v38[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subjects:sendEvent:", v12, v18);

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (!objc_msgSend(WeakRetained, "_authenticationAllowed")
    || objc_msgSend(WeakRetained[62], "authenticationIdentifier") != *(_QWORD *)(a1 + 64))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_14:

    goto LABEL_15;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9 == 0;
  PKLogFacilityTypeGetObject();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v21)
    {
      *(_DWORD *)buf = 138412290;
      v36 = v9;
      _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "Transaction Authorization Error: failed to retrieve barcode with error, %@", buf, 0xCu);
    }

    objc_msgSend(v9, "userInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = v23;

      v9 = v24;
    }
    objc_msgSend(v9, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    {
      if (objc_msgSend(v9, "code") == -1001)
      {

LABEL_22:
        v26 = CFSTR("PAYMENT_ERROR_BARCODE_PAYMENT_NETWORK_ERROR");
        goto LABEL_23;
      }
      v27 = objc_msgSend(v9, "code");

      if (v27 == -1009)
        goto LABEL_22;
    }
    else
    {

    }
    v26 = CFSTR("PAYMENT_ERROR_BARCODE_PAYMENT_AUTHORIZATION_ERROR");
LABEL_23:
    PKLocalizedAquamanString(&v26->isa);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    goto LABEL_14;
  }
  if (v21)
  {
    *(_DWORD *)buf = 138412290;
    v36 = v7;
    _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "Transaction Authorization succeeded: retrieved barcode identifier, %@", buf, 0xCu);
  }

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke_195;
  v31[3] = &unk_1E3E62460;
  v31[4] = WeakRetained;
  v32 = v7;
  v33 = v8;
  v34 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v31);

LABEL_15:
}

void __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke_195(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 936), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 944), *(id *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 992);
  *(_QWORD *)(v2 + 992) = 0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke_2(uint64_t a1)
{
  char v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  __int16 v6;
  __int16 v7;

  if ((objc_msgSend(*(id *)(a1 + 32), "activateValueAddedServicePasses:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 0;
      v4 = "Transaction Authorization Error: failed to activate VAS passes...";
      v5 = (uint8_t *)&v7;
LABEL_10:
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    }
LABEL_11:

    v2 = 0;
    goto LABEL_12;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "authorizeAndStartCardEmulationWithCredential:", *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 0;
      v4 = "Transaction Authorization Error: failed to start card emulation...";
      v5 = (uint8_t *)&v6;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "persistentCardEmulationQueued"))
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D684E8], 0);
  v2 = 1;
LABEL_12:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v2;
}

void __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke_197(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke_2_198(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "style");
    v3 = v7;
    if (v4 == 3)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        objc_msgSend(v7, "delegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "passFooterContentView:didAuthorizeAndRetrieveDecryptedBarcode:", v7, v7[118]);

        objc_msgSend(v7, "_beginBarcodeDisplayTimer");
        objc_msgSend(v7, "_postDidAuthorizeNotification");
        objc_msgSend(v7, "_showInstallAssociatedApplicationInstructionsIfNecessary");
        if (objc_msgSend(*(id *)(a1 + 32), "biometricMatch"))
        {
          if (PKPearlIsAvailable())
            v6 = 3;
          else
            v6 = 2;
        }
        else
        {
          v6 = 1;
        }
        objc_msgSend(v7, "_collectAndSubmitBarcodeEventMetadataWithAuthenticationType:", v6);
        objc_msgSend(v7, "_insertPaymentTransactionForActiveBarcode");
        v3 = v7;
      }
    }
  }

}

- (void)_resetActiveApplicationForPaymentPass:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  PKContactlessInterfaceSession *v8;
  NSObject *authorizationQueue;
  id v10;
  id v11;
  PKContactlessInterfaceSession *v12;
  _QWORD block[4];
  PKContactlessInterfaceSession *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = self->_contactlessInterfaceSession;
  authorizationQueue = self->_authorizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PKPassPaymentContainerView__resetActiveApplicationForPaymentPass_withCompletion___block_invoke;
  block[3] = &unk_1E3E65388;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_async(authorizationQueue, block);

}

void __83__PKPassPaymentContainerView__resetActiveApplicationForPaymentPass_withCompletion___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  char v4;
  _QWORD v5[4];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "stopCardEmulation");
  v2 = objc_msgSend(*(id *)(a1 + 32), "activatePaymentApplications:forPaymentPass:", 0, *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    v4 = v2;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __83__PKPassPaymentContainerView__resetActiveApplicationForPaymentPass_withCompletion___block_invoke_2;
    v5[3] = &unk_1E3E61A58;
    v6 = v3;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __83__PKPassPaymentContainerView__resetActiveApplicationForPaymentPass_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_resetCardEmulationWithCompletion:(id)a3
{
  id v4;
  NSString *activeBarcodeIdentifier;
  NSData *activeBarcodeCredential;
  PKAssertion *userNotificationSupressionAssertion;
  void *v8;
  PKContactlessInterfaceSession *v9;
  NSObject *authorizationQueue;
  id v11;
  PKContactlessInterfaceSession *v12;
  _QWORD v13[4];
  PKContactlessInterfaceSession *v14;
  id v15;

  v4 = a3;
  if (-[PKPassFooterContentView style](self, "style") == 3)
  {
    activeBarcodeIdentifier = self->_activeBarcodeIdentifier;
    self->_activeBarcodeIdentifier = 0;

    activeBarcodeCredential = self->_activeBarcodeCredential;
    self->_activeBarcodeCredential = 0;

    -[PKAssertion invalidate](self->_userNotificationSupressionAssertion, "invalidate");
    userNotificationSupressionAssertion = self->_userNotificationSupressionAssertion;
    self->_userNotificationSupressionAssertion = 0;

  }
  -[PKPassFooterContentView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "passFooterContentViewDidInvalidateAuthorization:", self);

  v9 = self->_contactlessInterfaceSession;
  authorizationQueue = self->_authorizationQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__PKPassPaymentContainerView__resetCardEmulationWithCompletion___block_invoke;
  v13[3] = &unk_1E3E61850;
  v14 = v9;
  v15 = v4;
  v11 = v4;
  v12 = v9;
  dispatch_async(authorizationQueue, v13);

}

void __64__PKPassPaymentContainerView__resetCardEmulationWithCompletion___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  char v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "stopCardEmulation");
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    v4 = v2;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__PKPassPaymentContainerView__resetCardEmulationWithCompletion___block_invoke_2;
    v5[3] = &unk_1E3E61A58;
    v6 = v3;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __64__PKPassPaymentContainerView__resetCardEmulationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_beginSessionExchange:(id)a3
{
  NSMutableArray *sessionExchangeTaskQueue;
  void *v5;

  if (a3)
  {
    sessionExchangeTaskQueue = self->_sessionExchangeTaskQueue;
    v5 = _Block_copy(a3);
    -[NSMutableArray addObject:](sessionExchangeTaskQueue, "addObject:", v5);

    -[PKPassPaymentContainerView _executeNextSessionExchangeTask](self, "_executeNextSessionExchangeTask");
  }
}

- (void)_endSessionExchange
{
  self->_sessionExchangeActive = 0;
  -[PKPassPaymentContainerView _executeNextSessionExchangeTask](self, "_executeNextSessionExchangeTask");
}

- (void)_executeNextSessionExchangeTask
{
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  NSData *sessionExchangeToken;
  PKContactlessInterfaceSession *contactlessInterfaceSession;
  _QWORD v7[4];
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;
  id location;

  if (!self->_contactlessInterfaceSessionSuspended
    && !self->_sessionExchangeActive
    && -[NSMutableArray count](self->_sessionExchangeTaskQueue, "count"))
  {
    -[NSMutableArray firstObject](self->_sessionExchangeTaskQueue, "firstObject");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_sessionExchangeTaskQueue, "removeObjectAtIndex:", 0);
    if (self->_contactlessInterfaceSession && !-[PKPassFooterContentView isInvalidated](self, "isInvalidated"))
    {
      self->_sessionExchangeActive = 1;
      sessionExchangeToken = self->_sessionExchangeToken;
      if (sessionExchangeToken)
      {
        ((void (**)(_QWORD, NSData *, _QWORD))v3)[2](v3, sessionExchangeToken, 0);
      }
      else
      {
        objc_initWeak(&location, self);
        contactlessInterfaceSession = self->_contactlessInterfaceSession;
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __61__PKPassPaymentContainerView__executeNextSessionExchangeTask__block_invoke;
        v7[3] = &unk_1E3E76AF8;
        objc_copyWeak(&v9, &location);
        v8 = v3;
        -[PKContactlessInterfaceSession createSessionHandoffTokenWithCompletion:](contactlessInterfaceSession, "createSessionHandoffTokenWithCompletion:", v7);

        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], -1, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v3)[2](v3, 0, v4);

    }
  }
}

void __61__PKPassPaymentContainerView__executeNextSessionExchangeTask__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__PKPassPaymentContainerView__executeNextSessionExchangeTask__block_invoke_2;
  v10[3] = &unk_1E3E67750;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v11 = v5;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v14);
}

void __61__PKPassPaymentContainerView__executeNextSessionExchangeTask__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 138, *(id *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(WeakRetained, "_executeNextSessionExchangeTask");

}

- (void)_clearSessionExchangeTasks
{
  NSData *sessionExchangeToken;
  id v4;

  sessionExchangeToken = self->_sessionExchangeToken;
  self->_sessionExchangeToken = 0;

  self->_sessionExchangeActive = 0;
  v4 = (id)-[NSMutableArray copy](self->_sessionExchangeTaskQueue, "copy");
  -[NSMutableArray removeAllObjects](self->_sessionExchangeTaskQueue, "removeAllObjects");
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_201);

}

void __56__PKPassPaymentContainerView__clearSessionExchangeTasks__block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0D6A758];
  v5 = a2;
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -1, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, id))a2)[2](v5, 0, v6);

}

- (id)_groupTileForTiles:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isGroupType") & 1) != 0)
      objc_msgSend(v3, "pk_firstObjectPassingTest:", &__block_literal_global_204_0);
    else
      objc_msgSend(MEMORY[0x1E0D66F50], "_createDefaultDashboardGroupTileWithChildTiles:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "pk_firstObjectPassingTest:", &__block_literal_global_204_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

BOOL __49__PKPassPaymentContainerView__groupTileForTiles___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "prearmTiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_reloadTiles
{
  PKPaymentService *paymentService;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  paymentService = self->_paymentService;
  -[PKPassFooterContentView paymentPass](self, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__PKPassPaymentContainerView__reloadTiles__block_invoke;
  v6[3] = &unk_1E3E665B8;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  -[PKPaymentService tilesForPassWithUniqueIdentifier:context:completion:](paymentService, "tilesForPassWithUniqueIdentifier:context:completion:", v5, 1, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __42__PKPassPaymentContainerView__reloadTiles__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_groupTileForTiles:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__PKPassPaymentContainerView__reloadTiles__block_invoke_2;
    v8[3] = &unk_1E3E61388;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v7 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

uint64_t __42__PKPassPaymentContainerView__reloadTiles__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 616), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentPrimaryView");
}

- (void)_applyLatestContentToViews
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  int *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  PKPaymentService *paymentService;
  id v14;
  NSObject *v15;
  PKPaymentService *v16;
  NSObject *v17;
  PKPaymentService *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[8];
  id v23[2];
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  NSObject *v28;
  _BYTE *v29;
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD *v33;
  _QWORD v34[4];
  NSObject *v35;
  _QWORD *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  NSObject *v40;
  _QWORD *v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  id location;
  _BYTE buf[24];
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (self->_VASInfoViewWillShow
    || self->_VASInfoViewSuppressedTransactionUpdate
    || self->_valueAddedServiceInfoView
    && !self->_VASInfoViewHidden
    && -[PKPassPaymentContainerView _shouldDisplayPrimaryView](self, "_shouldDisplayPrimaryView"))
  {
    self->_VASInfoViewSuppressedTransactionUpdate = 1;
  }
  v3 = (void *)(self->_contentUpdateCounter + 1);
  self->_contentUpdateCounter = (unint64_t)v3;
  objc_initWeak(&location, self);
  v4 = dispatch_group_create();
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349312;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2050;
    *(_QWORD *)&buf[14] = v3;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPassPaymentContainerView (%{public}p - %{public}ld): fetching content...", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v50 = __Block_byref_object_copy__52;
  v51 = __Block_byref_object_dispose__52;
  v52 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__52;
  v46[4] = __Block_byref_object_dispose__52;
  v47 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__52;
  v44[4] = __Block_byref_object_dispose__52;
  v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__52;
  v42[4] = __Block_byref_object_dispose__52;
  v43 = 0;
  -[PKPassFooterContentView paymentPass](self, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isStoredValuePass");
  v9 = &OBJC_IVAR___PKPassPaymentConfirmationView__showingSuccessResolution;
  v10 = MEMORY[0x1E0C809B0];
  v11 = (_QWORD *)&unk_19DF14000;
  if (v8)
  {
    objc_msgSend(v6, "devicePrimaryPaymentApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v4);
    paymentService = self->_paymentService;
    v37[0] = v10;
    v37[1] = 3221225472;
    v37[2] = __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke;
    v37[3] = &unk_1E3E69088;
    v41 = v46;
    v14 = v12;
    v38 = v14;
    v39 = v6;
    v15 = v4;
    v40 = v15;
    -[PKPaymentService transitStateWithPassUniqueIdentifier:paymentApplication:completion:](paymentService, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v7, v14, v37);
    dispatch_group_enter(v15);
    v16 = self->_paymentService;
    v34[0] = v10;
    v34[1] = 3221225472;
    v34[2] = __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_3;
    v34[3] = &unk_1E3E690B0;
    v36 = v44;
    v17 = v15;
    v35 = v17;
    -[PKPaymentService balancesForPaymentPassWithUniqueIdentifier:completion:](v16, "balancesForPaymentPassWithUniqueIdentifier:completion:", v7, v34);
    dispatch_group_enter(v17);
    v18 = self->_paymentService;
    v31[0] = v10;
    v31[1] = 3221225472;
    v31[2] = __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_5;
    v31[3] = &unk_1E3E633C0;
    v33 = v42;
    v32 = v17;
    -[PKPaymentService plansForPaymentPassWithUniqueIdentifier:completion:](v18, "plansForPaymentPassWithUniqueIdentifier:completion:", v7, v31);

    v11 = &unk_19DF14000;
    v9 = &OBJC_IVAR___PKPassPaymentConfirmationView__showingSuccessResolution;
  }
  dispatch_group_enter(v4);
  v19 = *(Class *)((char *)&self->super.super.super.super.isa + v9[128]);
  v24 = v10;
  v25 = v11[249];
  v20 = v25;
  v26 = __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_6;
  v27 = &unk_1E3E76530;
  v29 = buf;
  objc_copyWeak(&v30, &location);
  v21 = v4;
  v28 = v21;
  objc_msgSend(v19, "tilesForPassWithUniqueIdentifier:context:completion:", v7, 1, &v24);
  v22[0] = v10;
  v22[1] = v20;
  v22[2] = __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_7;
  v22[3] = &unk_1E3E76BA8;
  objc_copyWeak(v23, &location);
  v23[1] = v3;
  v22[4] = v46;
  v22[5] = v44;
  v22[6] = v42;
  v22[7] = buf;
  dispatch_group_notify(v21, MEMORY[0x1E0C80D38], v22);
  objc_destroyWeak(v23);

  objc_destroyWeak(&v30);
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);
}

void __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_2;
  block[3] = &unk_1E3E76B80;
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v11 = v4;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "transitPassPropertiesWithPaymentApplication:pass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  __int128 v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_4;
  block[3] = &unk_1E3E69AF8;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 32);
  v4 = (id)v6;
  v9 = v6;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_5(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_6(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_groupTileForTiles:", v4);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_7(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  NSObject *v5;
  int v6;
  id *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[80];
    if (v4 == *(id *)(a1 + 72))
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 134349312;
        v7 = v3;
        v8 = 2050;
        v9 = v4;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPassPaymentContainerView (%{public}p - %{public}ld): finished fetching balances.", (uint8_t *)&v6, 0x16u);
      }

      objc_msgSend(v3[116], "setTransitProperties:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      objc_msgSend(v3[116], "setDynamicBalances:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      objc_msgSend(v3[116], "updateWithDynamicCommutePlans:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_storeStrong(v3 + 77, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      objc_msgSend(v3, "_updateContentPrimaryView");
      objc_msgSend(v3, "_updateContentSecondaryView");
    }
  }

}

- (void)_updateContentPrimaryView
{
  UIView **p_displayedPrimaryView;
  UIView *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  id *p_singleValueCellPrimary;
  PKPaymentDashboardCellActionHandleable *singleValueCellPrimary;
  __objc2_class **v10;
  void *v11;
  uint64_t v12;
  PKPaymentTransactionView *transactionAwardsView;
  BOOL v14;
  PKPaymentTransactionView *v15;
  PKPaymentTransactionView *v16;
  PKPaymentTransactionView *v17;
  PKPaymentTransactionView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PKPaymentTransactionView *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  BOOL v31;
  PKPassTileGroupView *tileGroupView;
  PKPassTileGroupView *v33;
  PKPassTileGroupView *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  PKPaymentTransactionView *v39;
  NSString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  PKPaymentDashboardCellActionHandleable *v57;
  UIView *v58;
  id v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  float v65;
  float v66;
  _BOOL8 v68;
  unint64_t v69;
  PKPaymentDashboardCellActionHandleable *v70;
  PKPaymentDashboardCellActionHandleable *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  UIView **v76;
  void *v77;
  void *v78;
  PKPaymentDashboardCellActionHandleable *v79;
  _BOOL8 v80;
  void *v81;
  _BOOL8 v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  float v89;
  float v90;
  BOOL v91;
  PKPassTileGroupView *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  UIView *v99;
  void *v100;
  BOOL v101;
  double v102;
  void *v103;
  void *v104;
  UIView *v105;
  _BOOL4 v106;
  UIView **v107;
  UIView **v108;
  BOOL v109;
  BOOL v110;
  _QWORD v111[5];
  uint64_t v112;
  uint64_t v113;
  _QWORD v114[3];

  v114[2] = *MEMORY[0x1E0C80C00];
  p_displayedPrimaryView = &self->_displayedPrimaryView;
  v4 = self->_displayedPrimaryView;
  if (-[PKTransitBalanceModel hasBalanceContent](self->_transitBalanceModel, "hasBalanceContent"))
  {
    -[PKTransitBalanceModel displayableBalances](self->_transitBalanceModel, "displayableBalances");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    v7 = v6;
    if (v6 == 1)
    {
      p_singleValueCellPrimary = (id *)&self->_singleValueCellPrimary;
      singleValueCellPrimary = self->_singleValueCellPrimary;
      if (!singleValueCellPrimary)
      {
        v10 = &off_1E3E1A730;
LABEL_31:
        v59 = objc_alloc(*v10);
        v60 = objc_msgSend(v59, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v61 = *p_singleValueCellPrimary;
        *p_singleValueCellPrimary = (id)v60;

        objc_msgSend(*p_singleValueCellPrimary, "setAlpha:", 0.0);
        -[PKPassPaymentContainerView addSubview:](self, "addSubview:", *p_singleValueCellPrimary);
        singleValueCellPrimary = (PKPaymentDashboardCellActionHandleable *)*p_singleValueCellPrimary;
        v31 = 1;
        goto LABEL_32;
      }
    }
    else
    {
      if (!v6)
      {
        v57 = 0;
        v31 = 0;
        goto LABEL_33;
      }
      p_singleValueCellPrimary = (id *)&self->_dualValueCellPrimary;
      singleValueCellPrimary = self->_dualValueCellPrimary;
      if (!singleValueCellPrimary)
      {
        v10 = off_1E3E1B4D8;
        goto LABEL_31;
      }
    }
    v31 = 0;
LABEL_32:
    v57 = singleValueCellPrimary;
LABEL_33:
    objc_storeStrong((id *)p_displayedPrimaryView, v57);
    -[PKPaymentDashboardCellActionHandleable layer](v57, "layer");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "presentationLayer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (!v63)
      v63 = v62;
    objc_msgSend(v63, "opacity");
    v66 = v65;

    v68 = v66 > 0.0 && self->_isVisible;
    v69 = v7 - 1;
    if (v7 == 1)
    {
      v110 = v31;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v70 = (PKPaymentDashboardCellActionHandleable *)objc_claimAutoreleasedReturnValue();
      v71 = v57;
      -[PKPaymentDashboardCellActionHandleable beginUpdates](v71, "beginUpdates");
      -[PKPaymentDashboardCellActionHandleable setEnableDisclosure:](v71, "setEnableDisclosure:", 0);
      -[PKPassFooterContentView paymentPass](self, "paymentPass");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentDashboardCellActionHandleable setPass:](v71, "setPass:", v72);

      -[PKPaymentDashboardCellActionHandleable localizedTitle](v70, "localizedTitle");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (v73)
      {
        -[PKPaymentDashboardCellActionHandleable setTitle:](v71, "setTitle:", v73);
      }
      else
      {
        PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_BALANCE_HEADER"));
        v76 = p_displayedPrimaryView;
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentDashboardCellActionHandleable setTitle:](v71, "setTitle:", v77);

        p_displayedPrimaryView = v76;
      }

      -[PKPaymentDashboardCellActionHandleable formattedValue](v70, "formattedValue");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentDashboardCellActionHandleable setDetail:](v71, "setDetail:", v78);

      -[PKPaymentDashboardCellActionHandleable setSubDetail:](v71, "setSubDetail:", 0);
      v79 = v71;
      v80 = v68;
    }
    else
    {
      if (v7 == 2)
      {
        v110 = v31;
        v108 = p_displayedPrimaryView;
        v70 = v57;
        -[PKPaymentDashboardCellActionHandleable beginUpdates](v70, "beginUpdates");
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v71 = (PKPaymentDashboardCellActionHandleable *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentDashboardCellActionHandleable localizedTitle](v71, "localizedTitle");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (v74)
        {
          -[PKPaymentDashboardCellActionHandleable setLeftTitle:](v70, "setLeftTitle:", v74);
        }
        else
        {
          PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_BALANCE_HEADER"));
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentDashboardCellActionHandleable setLeftTitle:](v70, "setLeftTitle:", v81);

        }
        v82 = v68;

        -[PKPaymentDashboardCellActionHandleable formattedValue](v71, "formattedValue");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentDashboardCellActionHandleable setLeftDetail:](v70, "setLeftDetail:", v83);

        -[PKPaymentDashboardCellActionHandleable setLeftSubDetail:](v70, "setLeftSubDetail:", 0);
        objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "localizedTitle");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        if (v85)
        {
          -[PKPaymentDashboardCellActionHandleable setRightTitle:](v70, "setRightTitle:", v85);
        }
        else
        {
          PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_BALANCE_HEADER"));
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentDashboardCellActionHandleable setRightTitle:](v70, "setRightTitle:", v86);

        }
        objc_msgSend(v84, "formattedValue");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentDashboardCellActionHandleable setRightDetail:](v70, "setRightDetail:", v87);

        -[PKPaymentDashboardCellActionHandleable setRightSubDetail:](v70, "setRightSubDetail:", 0);
        -[PKPassFooterContentView paymentPass](self, "paymentPass");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentDashboardCellActionHandleable setPass:](v70, "setPass:", v88);

        -[PKPaymentDashboardCellActionHandleable setEnableDisclosure:](v70, "setEnableDisclosure:", 0);
        -[PKPaymentDashboardCellActionHandleable endUpdates:](v70, "endUpdates:", v82);

        p_displayedPrimaryView = v108;
        goto LABEL_68;
      }
      if (v7 < 3)
      {
LABEL_69:
        -[PKPassPaymentContainerView setNeedsLayout](self, "setNeedsLayout");

        goto LABEL_70;
      }
      v106 = v68;
      v110 = v31;
      v70 = v57;
      -[PKPaymentDashboardCellActionHandleable beginUpdates](v70, "beginUpdates");
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v71 = (PKPaymentDashboardCellActionHandleable *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentDashboardCellActionHandleable localizedTitle](v71, "localizedTitle");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (v75)
      {
        -[PKPaymentDashboardCellActionHandleable setLeftTitle:](v70, "setLeftTitle:", v75);
      }
      else
      {
        PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_BALANCE_HEADER"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentDashboardCellActionHandleable setLeftTitle:](v70, "setLeftTitle:", v94);

      }
      -[PKPaymentDashboardCellActionHandleable formattedValue](v71, "formattedValue");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentDashboardCellActionHandleable setLeftDetail:](v70, "setLeftDetail:", v95);

      -[PKPaymentDashboardCellActionHandleable setLeftSubDetail:](v70, "setLeftSubDetail:", 0);
      PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_OTHER_BALANCES_HEADER"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentDashboardCellActionHandleable setRightTitle:](v70, "setRightTitle:", v96);

      PKLocalizedPaymentString(CFSTR("PROPERTY_SUMMARY_MORE_BALANCES_HEADER"), CFSTR("%lu"), v69);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentDashboardCellActionHandleable setRightDetail:](v70, "setRightDetail:", v97);

      -[PKPaymentDashboardCellActionHandleable setRightSubDetail:](v70, "setRightSubDetail:", 0);
      -[PKPassFooterContentView paymentPass](self, "paymentPass");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentDashboardCellActionHandleable setPass:](v70, "setPass:", v98);

      -[PKPaymentDashboardCellActionHandleable setEnableDisclosure:](v70, "setEnableDisclosure:", 0);
      v79 = v70;
      v80 = v106;
    }
    -[PKPaymentDashboardCellActionHandleable endUpdates:](v79, "endUpdates:", v80);
LABEL_68:

    v31 = v110;
    goto LABEL_69;
  }
  -[PKPaymentTransaction awards](self->_transactionForDisplayedBarcode, "awards");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    transactionAwardsView = self->_transactionAwardsView;
    v14 = transactionAwardsView == 0;
    if (!transactionAwardsView)
    {
      v15 = [PKPaymentTransactionView alloc];
      v16 = -[PKPaymentTransactionView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v17 = self->_transactionAwardsView;
      self->_transactionAwardsView = v16;

      -[PKPaymentTransactionView setAlpha:](self->_transactionAwardsView, "setAlpha:", 0.0);
      -[UIView pkui_setMaskType:](self->_transactionAwardsView, "pkui_setMaskType:", 3);
      v18 = self->_transactionAwardsView;
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransactionView setBackgroundColor:](v18, "setBackgroundColor:", v19);

      -[PKPassPaymentContainerView addSubview:](self, "addSubview:", self->_transactionAwardsView);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__transactionAwardsViewTapped_);
      -[PKPaymentTransactionView addGestureRecognizer:](self->_transactionAwardsView, "addGestureRecognizer:", v20);

      transactionAwardsView = self->_transactionAwardsView;
    }
    objc_storeStrong((id *)p_displayedPrimaryView, transactionAwardsView);
    -[PKPaymentTransaction awards](self->_transactionForDisplayedBarcode, "awards");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = self->_transactionAwardsView;
    objc_msgSend(v22, "formattedStringValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionView setPrimaryString:](v23, "setPrimaryString:", v24);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "claimExpiryDate");
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "redeemExpiryDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = (void *)v26;
    if (v26)
    {
      objc_msgSend(v25, "earlierDate:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v26) = v28 == v25;

    }
    v105 = v4;
    v107 = p_displayedPrimaryView;
    v109 = v14;
    if (v27)
    {
      objc_msgSend(v25, "earlierDate:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29 == v25;

    }
    else
    {
      v30 = 0;
    }
    if (v26 | v30)
      v38 = CFSTR("REDEEM_TRANSACTION_AWARD");
    else
      v38 = CFSTR("VIEW_TRANSACTION_AWARD");
    v39 = self->_transactionAwardsView;
    v40 = v38;
    -[PKPassFooterContentView paymentPass](self, "paymentPass");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "organizationName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedAquamanString(v40, CFSTR("%@"), v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentTransactionView setSecondaryString:](v39, "setSecondaryString:", v43);
    objc_msgSend(v22, "subtype");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "length");

    if (v45)
    {
      -[PKPassFooterContentView paymentPass](self, "paymentPass");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "rawIcon");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = objc_alloc(MEMORY[0x1E0D66DF8]);
      v49 = objc_retainAutorelease(v47);
      v50 = objc_msgSend(v49, "imageRef");
      objc_msgSend(v49, "scale");
      v51 = (void *)objc_msgSend(v48, "initWithCGImage:scale:orientation:", v50, 1);
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PKUIImageNamed(CFSTR("AppleOffer"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }
    p_displayedPrimaryView = v107;
    -[PKPaymentTransactionView setPrimaryImage:](self->_transactionAwardsView, "setPrimaryImage:", v52);
    -[PKPassPaymentContainerView setNeedsLayout](self, "setNeedsLayout");
    v53 = (void *)MEMORY[0x1E0D66A58];
    v54 = *MEMORY[0x1E0D698E8];
    v114[0] = *MEMORY[0x1E0D69940];
    v114[1] = v54;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = *MEMORY[0x1E0D68AA0];
    v113 = *MEMORY[0x1E0D68C40];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "subjects:sendEvent:", v55, v56);

    v4 = v105;
    v31 = v109;
  }
  else if (self->_groupTile)
  {
    tileGroupView = self->_tileGroupView;
    v31 = tileGroupView == 0;
    if (!tileGroupView)
    {
      v33 = objc_alloc_init(PKPassTileGroupView);
      v34 = self->_tileGroupView;
      self->_tileGroupView = v33;

      -[PKPassTileGroupView setAlpha:](self->_tileGroupView, "setAlpha:", 0.0);
      -[PKPassTileGroupView setDelegate:](self->_tileGroupView, "setDelegate:", self);
      -[PKPassPaymentContainerView addSubview:](self, "addSubview:", self->_tileGroupView);
      tileGroupView = self->_tileGroupView;
    }
    objc_storeStrong((id *)p_displayedPrimaryView, tileGroupView);
    -[UIView layer](*p_displayedPrimaryView, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "presentationLayer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (!v36)
      v36 = v35;
    objc_msgSend(v36, "opacity");
    v90 = v89;

    v91 = v90 <= 0.0 || !self->_isVisible;
    v92 = self->_tileGroupView;
    v93 = !v91;
    v111[0] = MEMORY[0x1E0C809B0];
    v111[1] = 3221225472;
    v111[2] = __55__PKPassPaymentContainerView__updateContentPrimaryView__block_invoke;
    v111[3] = &unk_1E3E612E8;
    v111[4] = self;
    -[PKPassTileGroupView performBatchUpdates:animated:](v92, "performBatchUpdates:animated:", v111, v93);
    -[PKPassPaymentContainerView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    v58 = *p_displayedPrimaryView;
    *p_displayedPrimaryView = 0;

    v31 = 0;
  }
LABEL_70:
  v99 = *p_displayedPrimaryView;
  if (v4 != *p_displayedPrimaryView)
  {
    if (v4)
    {
      -[UIView layer](v4, "layer");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "pkui_animateToOpacity:withCompletion:", 0, 0.0);

      v99 = *p_displayedPrimaryView;
    }
    v101 = !v31;
    if (v4)
      v101 = 0;
    if (!v101 && v99)
    {
      v102 = (double)-[PKPassPaymentContainerView _isPrimaryViewVisible](self, "_isPrimaryViewVisible");
      -[UIView layer](*p_displayedPrimaryView, "layer");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "pkui_animateToOpacity:withCompletion:", 0, v102);

    }
  }

}

void __55__PKPassPaymentContainerView__updateContentPrimaryView__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9[8];
  uint64_t v10;
  uint64_t v11;

  if (objc_msgSend(*(id *)(a1 + 32), "_canDisplaySecondaryView"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldDisplaySecondaryView"))
      v2 = 1;
    else
      v2 = 2;
  }
  else
  {
    v2 = 1;
  }
  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[76];
  objc_msgSend(v3, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 600);
  v8 = *(_QWORD *)(v6 + 616);
  v9[0] = 1;
  v10 = v2;
  v11 = 0;
  objc_msgSend(v4, "setPass:passView:groupTile:context:animated:", v5, v7, v8, v9, 0);

}

- (void)_updateContentSecondaryView
{
  UIView **p_displayedSecondaryView;
  UIView *v4;
  PKPaymentDashboardCellActionHandleable *singleValueCellSecondary;
  PKAdjustableSingleCellView *v6;
  PKPaymentDashboardCellActionHandleable *v7;
  PKPaymentDashboardCellActionHandleable *v8;
  void *v9;
  void *v10;
  void *v11;
  UIView *v12;
  BOOL v13;
  float v14;
  float v15;
  _BOOL8 v17;
  void *v18;
  PKPaymentDashboardCellActionHandleable *v19;
  PKTransitBalanceModel *transitBalanceModel;
  id v21;
  id v22;
  __CFString *v23;
  id v24;
  id v25;
  void *v26;
  UIView *v27;
  void *v28;
  BOOL v29;
  double v30;
  void *v31;
  BOOL v32;
  __CFString *v33;
  id v34;
  id v35;
  char v36;

  p_displayedSecondaryView = &self->_displayedSecondaryView;
  v4 = self->_displayedSecondaryView;
  if (-[PKTransitBalanceModel hasCommutePlanContent](self->_transitBalanceModel, "hasCommutePlanContent"))
  {
    singleValueCellSecondary = self->_singleValueCellSecondary;
    v32 = singleValueCellSecondary == 0;
    if (!singleValueCellSecondary)
    {
      v6 = [PKAdjustableSingleCellView alloc];
      v7 = -[PKAdjustableSingleCellView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v8 = self->_singleValueCellSecondary;
      self->_singleValueCellSecondary = v7;

      -[PKPaymentDashboardCellActionHandleable setAlpha:](self->_singleValueCellSecondary, "setAlpha:", 0.0);
      -[PKPassPaymentContainerView addSubview:](self, "addSubview:", self->_singleValueCellSecondary);
      singleValueCellSecondary = self->_singleValueCellSecondary;
    }
    objc_storeStrong((id *)p_displayedSecondaryView, singleValueCellSecondary);
    -[UIView layer](*p_displayedSecondaryView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentationLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
      v10 = v9;
    objc_msgSend(v10, "opacity");
    v15 = v14;

    v17 = v15 > 0.0 && self->_isVisible;
    -[PKPassFooterContentView paymentPass](self, "paymentPass");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self->_singleValueCellSecondary;
    -[PKPaymentDashboardCellActionHandleable beginUpdates](v19, "beginUpdates");
    -[PKPaymentDashboardCellActionHandleable setPass:](v19, "setPass:", v18);
    -[PKPaymentDashboardCellActionHandleable setEnableDisclosure:](v19, "setEnableDisclosure:", 0);
    transitBalanceModel = self->_transitBalanceModel;
    v36 = 0;
    v34 = 0;
    v35 = 0;
    v33 = &stru_1E3E7D690;
    -[PKTransitBalanceModel getDisplayableCommutePlanDetailsForTitle:value:subtitle:isExpired:](transitBalanceModel, "getDisplayableCommutePlanDetailsForTitle:value:subtitle:isExpired:", &v35, &v34, &v33, &v36);
    v21 = v35;
    v22 = v34;
    v23 = v33;
    PKCommutePlanFieldEitherLabelOrValueIsEmpty();
    PKCommutePlanFormatTitleFromLabelAndValue();
    v24 = v21;

    v25 = v22;
    -[PKPaymentDashboardCellActionHandleable setTitle:](v19, "setTitle:", v24);
    -[PKPaymentDashboardCellActionHandleable setDetail:](v19, "setDetail:", v25);
    -[PKPaymentDashboardCellActionHandleable setSubDetail:](v19, "setSubDetail:", v23);
    if (v36)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDashboardCellActionHandleable setSubDetailColor:](v19, "setSubDetailColor:", v26);

    -[PKPaymentDashboardCellActionHandleable endUpdates:](v19, "endUpdates:", v17);
    -[PKPassPaymentContainerView layoutIfNeeded](self, "layoutIfNeeded");
    -[PKPassPaymentContainerView setNeedsLayout](self, "setNeedsLayout");

    v13 = v32;
  }
  else
  {
    v12 = *p_displayedSecondaryView;
    *p_displayedSecondaryView = 0;

    v13 = 0;
  }
  v27 = *p_displayedSecondaryView;
  if (v4 != *p_displayedSecondaryView)
  {
    if (v4)
    {
      -[UIView layer](v4, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "pkui_animateToOpacity:withCompletion:", 0, 0.0);

      v27 = *p_displayedSecondaryView;
    }
    v29 = !v13;
    if (v4)
      v29 = 0;
    if (!v29 && v27)
    {
      v30 = (double)-[PKPassPaymentContainerView _isSecondaryViewVisible](self, "_isSecondaryViewVisible");
      -[UIView layer](*p_displayedSecondaryView, "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "pkui_animateToOpacity:withCompletion:", 0, v30);

    }
  }

}

- (void)_updateApplicationsView
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v8;

  if (self->_applicationsView)
  {
    v3 = 21;
    if (!self->_transitioning)
      v3 = 22;
    v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v3]);
    -[PKPassPaymentPayStateView glyph](self->_payStateView, "glyph");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "state");

    if (v4 != 1 || v6 > 8)
      v8 = 1;
    else
      v8 = (0x5Du >> v6) & 1;
    -[PKPassPaymentApplicationView setUserInteractionEnabled:](self->_applicationsView, "setUserInteractionEnabled:", v8);
  }
}

- (void)_performActivationStateUpdate:(id)a3
{
  void (**v4)(void);
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  BOOL v10;
  void *v11;
  _BOOL4 v12;
  void (**v13)(void);

  v4 = (void (**)(void))a3;
  if (v4)
  {
    v13 = v4;
    v5 = -[PKPassPaymentContainerView _isDeactivated](self, "_isDeactivated");
    v6 = -[PKPassPaymentContainerView _isBackgrounded](self, "_isBackgrounded");
    v7 = -[PKPassPaymentContainerView _authenticationAllowed](self, "_authenticationAllowed");
    v13[2]();
    v8 = -[PKPassPaymentContainerView _isDeactivated](self, "_isDeactivated");
    v9 = -[PKPassPaymentContainerView _isBackgrounded](self, "_isBackgrounded");
    v10 = -[PKPassPaymentContainerView _authenticationAllowed](self, "_authenticationAllowed");
    if (v7 && !v10)
      -[PKPassPaymentContainerView _endPaymentAuthorizationWithWillUpdateState:](self, "_endPaymentAuthorizationWithWillUpdateState:", v6 ^ v9 | v5 ^ v8);
    if (v6 && !v9)
      -[PKPassPaymentContainerView _applyLatestContentToViews](self, "_applyLatestContentToViews");
    v4 = v13;
    if (v6 ^ v9 | v5 ^ v8)
    {
      if (v5 && !v8)
      {
        -[PKPassFooterContentView pass](self, "pass");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[PKPassPaymentContainerView shouldAutomaticallyAuthorizeForPass:withContext:](PKPassPaymentContainerView, "shouldAutomaticallyAuthorizeForPass:withContext:", v11, 0);

        if (v12)
          self->_pendingAutomaticAuthorization = 1;
      }
      -[PKPassPaymentContainerView _resetToIdleState](self, "_resetToIdleState");
      v4 = v13;
    }
  }

}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  _QWORD v4[5];
  $96EE1C12479E9B303E9C2794B92A11A2 v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__PKPassPaymentContainerView_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke;
  v4[3] = &unk_1E3E64930;
  v4[4] = self;
  v5 = a4;
  -[PKPassPaymentContainerView _performActivationStateUpdate:](self, "_performActivationStateUpdate:", v4);
}

uint64_t __85__PKPassPaymentContainerView_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke(uint64_t result)
{
  *(_WORD *)(*(_QWORD *)(result + 32) + 864) = *(_WORD *)(result + 40);
  return result;
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateDeactivationReasons:(unsigned int)a4
{
  _QWORD v4[5];
  unsigned int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__PKPassPaymentContainerView_foregroundActiveArbiter_didUpdateDeactivationReasons___block_invoke;
  v4[3] = &unk_1E3E64958;
  v4[4] = self;
  v5 = a4;
  -[PKPassPaymentContainerView _performActivationStateUpdate:](self, "_performActivationStateUpdate:", v4);
}

uint64_t __83__PKPassPaymentContainerView_foregroundActiveArbiter_didUpdateDeactivationReasons___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 868) = *(_DWORD *)(result + 40);
  return result;
}

- (BOOL)_isDeactivated
{
  return !self->_foregroundActiveState.foregroundActive
      || +[PKUIForegroundActiveArbiter isDeactivedForReasons:](PKUIForegroundActiveArbiter, "isDeactivedForReasons:", self->_deactivationReasons);
}

- (BOOL)_isBackgrounded
{
  return !self->_foregroundActiveState.foreground
      || +[PKUIForegroundActiveArbiter isBackgroundedForReasons:](PKUIForegroundActiveArbiter, "isBackgroundedForReasons:", self->_deactivationReasons);
}

- (BOOL)_isForegroundActive
{
  if (-[PKPassPaymentContainerView _isDeactivated](self, "_isDeactivated"))
    return 0;
  else
    return !-[PKPassPaymentContainerView _isBackgrounded](self, "_isBackgrounded");
}

- (void)_configureForStyle:(int64_t)a3 context:(id)a4
{
  void *v6;
  LAUIPhysicalButtonView *v7;
  LAUIPhysicalButtonView *physicalButtonView;
  void *v9;
  id v10;

  v10 = a4;
  -[PKPassFooterContentView pass](self, "pass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKUserIntentIsAvailable())
  {
    v7 = (LAUIPhysicalButtonView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D44460]), "initWithStyle:", 0);
    physicalButtonView = self->_physicalButtonView;
    self->_physicalButtonView = v7;

    -[LAUIPhysicalButtonView setAlpha:](self->_physicalButtonView, "setAlpha:", 0.0);
    -[PKPassPaymentContainerView addSubview:](self, "addSubview:", self->_physicalButtonView);
    -[PKPassPaymentContainerView _setUserIntentRequired:](self, "_setUserIntentRequired:", +[PKPassPaymentContainerView initialUserIntentRequiredAssumptionForPass:context:paymentService:](PKPassPaymentContainerView, "initialUserIntentRequiredAssumptionForPass:context:paymentService:", v6, v10, self->_paymentService));
  }
  if ((unint64_t)a3 <= 4)
  {
    if (a3 == 2)
    {
      -[PKPassPaymentContainerView _configureForValueAddedServiceWithPass:context:](self, "_configureForValueAddedServiceWithPass:context:", v6, v10);
    }
    else
    {
      -[PKPassFooterContentView paymentPass](self, "paymentPass");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassPaymentContainerView _configureForPaymentWithPaymentPass:context:](self, "_configureForPaymentWithPaymentPass:context:", v9, v10);

    }
  }

}

- (void)_configureForPaymentWithPaymentPass:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  PKPassPaymentPayStateView *v9;
  PKPassPaymentPayStateView *payStateView;
  uint64_t v11;
  PKPassPaymentPayStateView *v12;
  _BOOL8 v13;
  PKPassPaymentApplicationView *v14;
  PKPassPaymentApplicationView *applicationsView;
  UITextView *v16;
  UITextView *bottomTextView;
  UITextView *v18;
  void *v19;
  UITextView *v20;
  void *v21;
  void *v22;
  void *v23;
  PKPassValueAddedServiceInfoView *v24;
  PKPassValueAddedServiceInfoView *valueAddedServiceInfoView;
  void *v26;
  void *v27;
  void *v28;
  PKPassLibrary *passLibrary;
  void *v30;
  id *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[PKPassFooterContentView style](self, "style");
  v9 = -[PKPassPaymentPayStateView initWithStyle:]([PKPassPaymentPayStateView alloc], "initWithStyle:", v8);
  payStateView = self->_payStateView;
  self->_payStateView = v9;

  v11 = objc_msgSend(v6, "isAccessPass");
  -[PKPassPaymentPayStateView setAccessPass:](self->_payStateView, "setAccessPass:", v11);
  v12 = self->_payStateView;
  if ((_DWORD)v11)
    v13 = objc_msgSend(v6, "accessType") == 3;
  else
    v13 = 0;
  -[PKPassPaymentPayStateView setHomeKeyPass:](v12, "setHomeKeyPass:", v13);
  -[PKPassPaymentPayStateView setDelegate:](self->_payStateView, "setDelegate:", self);
  -[PKPassPaymentPayStateView setAlpha:](self->_payStateView, "setAlpha:", 0.0);
  -[PKPassPaymentPayStateView setPersistentEmulationHint:](self->_payStateView, "setPersistentEmulationHint:", objc_msgSend(v7, "wantsPersistentCardEmulation"));
  -[PKPassPaymentContainerView addSubview:](self, "addSubview:", self->_payStateView);
  -[PKPassPaymentContainerView _applyLatestContentToViews](self, "_applyLatestContentToViews");
  if (objc_msgSend(v6, "contactlessActivationGroupingType") == 2
    && objc_msgSend(v6, "hasContactlessDevicePaymentApplicationsAvailable"))
  {
    v14 = -[PKPassPaymentApplicationView initWithPass:]([PKPassPaymentApplicationView alloc], "initWithPass:", v6);
    applicationsView = self->_applicationsView;
    self->_applicationsView = v14;

    -[PKPassPaymentApplicationView setDelegate:](self->_applicationsView, "setDelegate:", self);
    -[PKPassPaymentApplicationView setAlpha:](self->_applicationsView, "setAlpha:", 0.0);
    -[PKPassPaymentContainerView addSubview:](self, "addSubview:", self->_applicationsView);
  }
  if (v8 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3E50], "pkui_plainInteractiveTextViewWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v16 = (UITextView *)objc_claimAutoreleasedReturnValue();
    bottomTextView = self->_bottomTextView;
    self->_bottomTextView = v16;

    v18 = self->_bottomTextView;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AA0], (NSString *)*MEMORY[0x1E0DC48D8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v18, "setFont:", v19);

    v20 = self->_bottomTextView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v20, "setTextColor:", v21);

    -[UITextView setEditable:](self->_bottomTextView, "setEditable:", 0);
    -[UITextView setSelectable:](self->_bottomTextView, "setSelectable:", 1);
    -[UITextView setScrollingEnabled:](self->_bottomTextView, "setScrollingEnabled:", 0);
    -[UITextView _setInteractiveTextSelectionDisabled:](self->_bottomTextView, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView setAlpha:](self->_bottomTextView, "setAlpha:", 0.0);
    -[UITextView setDelegate:](self->_bottomTextView, "setDelegate:", self);
    -[PKPassPaymentContainerView addSubview:](self, "addSubview:", self->_bottomTextView);
  }
  -[PKPassFooterContentView bottomRule](self, "bottomRule");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAlpha:", 0.0);

  -[PKPassFooterContentView setInfoButtonAlpha:](self, "setInfoButtonAlpha:", 0.0);
  if ((unint64_t)(-[PKPassFooterContentView style](self, "style") - 1) >= 3)
  {
    -[PKPassFooterContentView bottomRule](self, "bottomRule");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassPaymentContainerView addSubview:](self, "addSubview:", v23);

    v24 = -[PKPassValueAddedServiceInfoView initWithStyle:]([PKPassValueAddedServiceInfoView alloc], "initWithStyle:", 0);
    valueAddedServiceInfoView = self->_valueAddedServiceInfoView;
    self->_valueAddedServiceInfoView = v24;

    -[PKPassValueAddedServiceInfoView setAlpha:](self->_valueAddedServiceInfoView, "setAlpha:", 0.0);
    -[PKPassPaymentContainerView addSubview:](self, "addSubview:", self->_valueAddedServiceInfoView);
  }
  -[PKPassFooterContentView paymentPass](self, "paymentPass");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)RequiredExpressApplicationsForAutomaticAuthorization(v26, v7, self->_paymentService, self->_contactlessInterfaceSession);

  if (objc_msgSend(v27, "count"))
    self->_requireExpress = 1;
  if (self->_valueAddedServiceInfoView)
  {
    self->_waitingForPasses = 1;
    objc_initWeak(&location, self);
    objc_msgSend(v7, "additionalPassUniqueIdentifiers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    passLibrary = self->_passLibrary;
    if (v28)
    {
      objc_msgSend(v7, "additionalPassUniqueIdentifiers");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke;
      v34[3] = &unk_1E3E61BE0;
      v31 = &v35;
      objc_copyWeak(&v35, &location);
      -[PKPassLibrary getPassesWithUniqueIdentifiers:handler:](passLibrary, "getPassesWithUniqueIdentifiers:handler:", v30, v34);

    }
    else
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_5;
      v32[3] = &unk_1E3E61BE0;
      v31 = &v33;
      objc_copyWeak(&v33, &location);
      -[PKPassLibrary enabledValueAddedServicePassesWithCompletion:](passLibrary, "enabledValueAddedServicePassesWithCompletion:", v32);
    }
    objc_destroyWeak(v31);
    objc_destroyWeak(&location);
  }
  if (v8 != 4)
    -[PKPassPaymentContainerView _activateForPaymentWithApplications:](self, "_activateForPaymentWithApplications:", v27);

}

void __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(a2, "pk_objectsPassingTest:", &__block_literal_global_242);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_3;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

uint64_t __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "hasValidNFCPayload") && objc_msgSend(v2, "isValid"))
    v3 = objc_msgSend(v2, "hasStoredValue") ^ 1;
  else
    v3 = 0;

  return v3;
}

void __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_3(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_setValueAddedServicePasses:", *(_QWORD *)(a1 + 32));
    v5 = (void *)v4[84];
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_4;
    v7[3] = &unk_1E3E61C58;
    objc_copyWeak(&v8, v2);
    objc_msgSend(v5, "setPass:animated:completion:", v6, 0, v7);

    objc_destroyWeak(&v8);
  }

}

void __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_4(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[873] = 0;
    v2 = WeakRetained;
    if (objc_msgSend(WeakRetained, "_hasValueAddedServicePasses"))
      objc_msgSend(v2, "_setVASInfoViewHidden:animated:completion:", 0, 1, 0);
    WeakRetained = v2;
    if (v2[872])
    {
      objc_msgSend(v2, "_beginPaymentAuthorization");
      WeakRetained = v2;
    }
  }

}

void __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_6;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_6(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_setValueAddedServicePasses:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
    v3[873] = 0;
    if (v3[872])
    {
      objc_msgSend(v3, "_resetToIdleState");
      WeakRetained = v3;
    }
  }

}

- (void)_configureForValueAddedServiceWithPass:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  PKPassPaymentPayStateView *v8;
  PKPassPaymentPayStateView *payStateView;
  void *v10;
  void *v11;
  void *v12;
  NSNumber *v13;
  NSNumber *pendingPresentationContextState;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = -[PKPassPaymentPayStateView initWithStyle:]([PKPassPaymentPayStateView alloc], "initWithStyle:", -[PKPassFooterContentView style](self, "style"));
  payStateView = self->_payStateView;
  self->_payStateView = v8;

  -[PKPassPaymentPayStateView setDelegate:](self->_payStateView, "setDelegate:", self);
  -[PKPassPaymentPayStateView setAlpha:](self->_payStateView, "setAlpha:", 0.0);
  -[PKPassPaymentContainerView addSubview:](self, "addSubview:", self->_payStateView);
  -[PKPassPaymentContainerView _applyLatestContentToViews](self, "_applyLatestContentToViews");
  -[PKPassFooterContentView appIconView](self, "appIconView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", 1.0);

  -[PKPassFooterContentView setInfoButtonAlpha:](self, "setInfoButtonAlpha:", 1.0);
  -[PKPassFooterContentView bottomRule](self, "bottomRule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", 1.0);

  -[PKPassFooterContentView bottomRule](self, "bottomRule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassPaymentContainerView addSubview:](self, "addSubview:", v12);

  objc_msgSend(v6, "userInfo");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("PKPassPaymentContainerViewPresentationPayStateKey"));
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  pendingPresentationContextState = self->_pendingPresentationContextState;
  self->_pendingPresentationContextState = v13;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassPaymentContainerView _setValueAddedServicePasses:](self, "_setValueAddedServicePasses:", v15);

  LOBYTE(v15) = +[PKPassPaymentContainerView shouldAutomaticallyAuthorizeForPass:withContext:](PKPassPaymentContainerView, "shouldAutomaticallyAuthorizeForPass:withContext:", v7, v6);
  self->_pendingAutomaticAuthorization = (char)v15;

}

- (void)_applyPresentationPayState:(int64_t)a3
{
  if (a3 == 8)
    -[PKPassPaymentContainerView _applyTerminalTransactionSubstateWithSuccess:reset:](self, "_applyTerminalTransactionSubstateWithSuccess:reset:", 1, 1);
  else
    -[PKPassPaymentContainerView _applyPayState:withTextOverride:animated:completionHandler:](self, "_applyPayState:withTextOverride:animated:completionHandler:");
}

- (void)_applyPaymentIndefiniteSuccessState
{
  uint64_t v2;

  if (!self->_transactionSubstate)
  {
    self->_transactionSubstate = 1;
    v2 = 21;
    if (!self->_transitioning)
      v2 = 22;
    if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v2]) != (Class)7)
      -[PKPassPaymentContainerView _applyPayState:withTextOverride:completionHandler:](self, "_applyPayState:withTextOverride:completionHandler:", 7, 0, 0);
  }
}

- (void)_applyTerminalTransactionSubstateWithSuccess:(BOOL)a3 reset:(BOOL)a4
{
  -[PKPassPaymentContainerView _applyTerminalTransactionSubstateWithSuccess:reset:errorOverride:](self, "_applyTerminalTransactionSubstateWithSuccess:reset:errorOverride:", a3, a4, 0);
}

- (void)_applyTerminalTransactionSubstateWithSuccess:(BOOL)a3 reset:(BOOL)a4 errorOverride:(id)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  int64_t transactionSubstate;
  BOOL v11;
  int v12;
  NSObject *v13;
  _BOOL4 holdingTerminalSubstate;
  NSObject *transactionResolutionTimer;
  OS_dispatch_source *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  __CFString *v24;
  _QWORD v25[4];
  id v26;
  _QWORD aBlock[4];
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v6 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  self->_lastTransactionTime = CFAbsoluteTimeGetCurrent();
  v9 = 2;
  if (!v6)
    v9 = 3;
  transactionSubstate = self->_transactionSubstate;
  v11 = transactionSubstate == 2;
  if (transactionSubstate == 2)
  {
    v12 = 1;
  }
  else
  {
    transactionSubstate = v9;
    v12 = v6;
  }
  if (v11 && !v6)
  {
    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v30 = 3;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "View overriding desired transaction state: %ld -> success.", buf, 0xCu);
    }

    v12 = 1;
    transactionSubstate = 2;
  }
  holdingTerminalSubstate = self->_holdingTerminalSubstate;
  self->_holdingTerminalSubstate = !a4;
  self->_transactionSubstate = transactionSubstate;
  if (!self->_holdingTerminalSubstate)
  {
    transactionResolutionTimer = self->_transactionResolutionTimer;
    if (transactionResolutionTimer)
    {
      dispatch_source_cancel(transactionResolutionTimer);
      v16 = self->_transactionResolutionTimer;
      self->_transactionResolutionTimer = 0;

    }
  }
  objc_initWeak((id *)buf, self);
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PKPassPaymentContainerView__applyTerminalTransactionSubstateWithSuccess_reset_errorOverride___block_invoke;
  aBlock[3] = &unk_1E3E61310;
  objc_copyWeak(&v28, (id *)buf);
  v18 = _Block_copy(aBlock);
  v19 = v18;
  v20 = 21;
  if (!self->_transitioning)
    v20 = 22;
  if (v12)
    v21 = 8;
  else
    v21 = 9;
  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v20]) == (Class)v21)
  {
    if (holdingTerminalSubstate && !self->_holdingTerminalSubstate && !self->_transitioning)
      (*((void (**)(void *))v18 + 2))(v18);
  }
  else
  {
    if ((v12 & 1) != 0)
    {
      v22 = 0;
    }
    else if (objc_msgSend(v8, "length"))
    {
      v22 = v8;
    }
    else
    {
      -[PKPassFooterContentView paymentPass](self, "paymentPass");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "isAccessPass"))
        v24 = CFSTR("PAYMENT_TRY_AGAIN");
      else
        v24 = CFSTR("PAYMENT_ERROR_TRANSACTION_ERROR");
      PKLocalizedPaymentString(&v24->isa);
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    v25[0] = v17;
    v25[1] = 3221225472;
    v25[2] = __95__PKPassPaymentContainerView__applyTerminalTransactionSubstateWithSuccess_reset_errorOverride___block_invoke_2;
    v25[3] = &unk_1E3E614F0;
    v26 = v19;
    -[PKPassPaymentContainerView _applyPayState:withTextOverride:completionHandler:](self, "_applyPayState:withTextOverride:completionHandler:", v21, v22, v25);

  }
  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);

}

void __95__PKPassPaymentContainerView__applyTerminalTransactionSubstateWithSuccess_reset_errorOverride___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[824])
  {
    *((_QWORD *)WeakRetained + 102) = 0;
    objc_msgSend(WeakRetained, "_setVASInfoViewHidden:animated:completion:", 1, 1, 0);
    v3 = objc_msgSend(v2, "_actionAfterTransaction");
    if (v3 != 1)
    {
      if (v3 != 2)
      {
        v4 = 0;
        goto LABEL_8;
      }
      v2[889] = 1;
    }
    objc_msgSend(v2, "_resetToIdleStateAfterDelay:", 2.0);
    v4 = 1;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D6AD00];
    v9 = *MEMORY[0x1E0D6AD08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", v6, v2, v8);

  }
}

uint64_t __95__PKPassPaymentContainerView__applyTerminalTransactionSubstateWithSuccess_reset_errorOverride___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)_finishHoldingTerminalTransactionSubstateAfterDelay:(double)a3
{
  NSObject *transactionResolutionTimer;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id location;

  transactionResolutionTimer = self->_transactionResolutionTimer;
  if (transactionResolutionTimer)
  {
    dispatch_source_cancel(transactionResolutionTimer);
    v6 = self->_transactionResolutionTimer;
    self->_transactionResolutionTimer = 0;

  }
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  v8 = self->_transactionResolutionTimer;
  self->_transactionResolutionTimer = v7;

  v9 = self->_transactionResolutionTimer;
  v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  v11 = self->_transactionResolutionTimer;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__PKPassPaymentContainerView__finishHoldingTerminalTransactionSubstateAfterDelay___block_invoke;
  v12[3] = &unk_1E3E61310;
  objc_copyWeak(&v13, &location);
  dispatch_source_set_event_handler(v11, v12);
  dispatch_resume((dispatch_object_t)self->_transactionResolutionTimer);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __82__PKPassPaymentContainerView__finishHoldingTerminalTransactionSubstateAfterDelay___block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  NSObject *v4;
  NSObject **v5;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[104];
    v5 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      v4 = v5[104];
      v5[104] = 0;

      v2 = v5;
    }
    if (*((_BYTE *)v2 + 824))
    {
      objc_msgSend(v2, "_applyTerminalTransactionSubstateWithSuccess:reset:", v2[102] == 2, 1);
      v2 = v5;
    }
  }

}

- (void)_cancelHoldingTerminalTransactionSubstateIfNecessary
{
  NSObject *transactionResolutionTimer;
  OS_dispatch_source *v4;
  PKContactlessInterfaceTransactionContext *contextForCurrentTransaction;
  PKContactlessInterfaceTransactionContext *v6;
  PKContactlessInterfaceTransactionContext *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  PKPaymentService *paymentService;
  void *v13;
  void *v14;
  uint8_t v15[16];

  if (self->_holdingTerminalSubstate)
  {
    self->_holdingTerminalSubstate = 0;
    self->_transactionSubstate = 0;
    transactionResolutionTimer = self->_transactionResolutionTimer;
    if (transactionResolutionTimer)
    {
      dispatch_source_cancel(transactionResolutionTimer);
      v4 = self->_transactionResolutionTimer;
      self->_transactionResolutionTimer = 0;

    }
    else
    {
      contextForCurrentTransaction = self->_contextForCurrentTransaction;
      if (contextForCurrentTransaction)
      {
        v6 = contextForCurrentTransaction;
        v7 = self->_contextForCurrentTransaction;
        self->_contextForCurrentTransaction = 0;

        -[PKContactlessInterfaceTransactionContext paymentPass](v6, "paymentPass");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKContactlessInterfaceTransactionContext paymentApplication](v6, "paymentApplication");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 && objc_msgSend(v8, "isTransitPass"))
        {
          -[PKContactlessInterfaceSession transitAppletStateForPaymentApplication:](self->_contactlessInterfaceSession, "transitAppletStateForPaymentApplication:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKContactlessInterfaceSession resetExpressState](self->_contactlessInterfaceSession, "resetExpressState");
          PKLogFacilityTypeGetObject();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Handling early cancel of felica session during transaction...", v15, 2u);
          }

          paymentService = self->_paymentService;
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "uniqueID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentService processTransitTransactionEventWithHistory:transactionDate:forPaymentApplication:withPassUniqueIdentifier:expressTransactionState:](paymentService, "processTransitTransactionEventWithHistory:transactionDate:forPaymentApplication:withPassUniqueIdentifier:expressTransactionState:", v10, v13, v9, v14, 0);

        }
      }
    }
  }
}

- (void)_beginTerminalResponseTimeout
{
  OS_dispatch_source *v3;
  OS_dispatch_source *transactionTerminalResponseTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[PKPassPaymentContainerView _cancelTerminalResponseTimeout](self, "_cancelTerminalResponseTimeout");
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  transactionTerminalResponseTimer = self->_transactionTerminalResponseTimer;
  self->_transactionTerminalResponseTimer = v3;

  v5 = self->_transactionTerminalResponseTimer;
  v6 = dispatch_time(0, 4000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  v7 = self->_transactionTerminalResponseTimer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PKPassPaymentContainerView__beginTerminalResponseTimeout__block_invoke;
  v8[3] = &unk_1E3E61310;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_transactionTerminalResponseTimer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__PKPassPaymentContainerView__beginTerminalResponseTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "_cancelTerminalResponseTimeout");
    objc_msgSend(v10, "pkui_viewControllerFromResponderChain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedPaymentString(CFSTR("TERMINAL_RESPONSE_TIMED_OUT_TITLE"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("TERMINAL_RESPONSE_TIMED_OUT_BODY"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAction:", v9);

      AudioServicesPlaySystemSound(0x573u);
      objc_msgSend(v2, "presentViewController:animated:completion:", v6, 1, 0);

    }
    WeakRetained = v10;
  }

}

- (void)_cancelTerminalResponseTimeout
{
  NSObject *transactionTerminalResponseTimer;
  OS_dispatch_source *v4;

  transactionTerminalResponseTimer = self->_transactionTerminalResponseTimer;
  if (transactionTerminalResponseTimer)
  {
    dispatch_source_cancel(transactionTerminalResponseTimer);
    v4 = self->_transactionTerminalResponseTimer;
    self->_transactionTerminalResponseTimer = 0;

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == &KVOContext)
  {
    -[PKPassPaymentContainerView _updateApplicationsView](self, "_updateApplicationsView", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)PKPassPaymentContainerView;
    -[PKPassPaymentContainerView observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_applyPayState:(int64_t)a3
{
  -[PKPassPaymentContainerView _applyPayState:withTextOverride:completionHandler:](self, "_applyPayState:withTextOverride:completionHandler:", a3, 0, 0);
}

- (void)_applyPayState:(int64_t)a3 withTextOverride:(id)a4
{
  -[PKPassPaymentContainerView _applyPayState:withTextOverride:completionHandler:](self, "_applyPayState:withTextOverride:completionHandler:", a3, a4, 0);
}

- (void)_applyPayState:(int64_t)a3 withTextOverride:(id)a4 completionHandler:(id)a5
{
  -[PKPassPaymentContainerView _applyPayState:withTextOverride:animated:completionHandler:](self, "_applyPayState:withTextOverride:animated:completionHandler:", a3, a4, 1, a5);
}

- (void)_applyPayState:(int64_t)a3 withTextOverride:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  id v12;

  v7 = a5;
  v12 = a4;
  v10 = (void (**)(id, _QWORD))a6;
  if (a3 != 5)
    -[PKPassPaymentContainerView _cancelTerminalResponseTimeout](self, "_cancelTerminalResponseTimeout");
  v11 = 21;
  if (!self->_transitioning)
    v11 = 22;
  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v11]) == (Class)a3)
  {
    if (a3)
      -[PKPassPaymentContainerView _emphasizeStateIfPossible:withTextOverride:](self, "_emphasizeStateIfPossible:withTextOverride:", a3, v12);
    if (v10)
      v10[2](v10, 0);
  }
  else
  {
    -[PKPassPaymentContainerView _transitionToState:withTextOverride:animated:completionHandler:](self, "_transitionToState:withTextOverride:animated:completionHandler:", a3, v12, v7, v10);
  }

}

- (void)_showEmphasisButtonForStateIfPossible:(int64_t)a3
{
  UIButton **p_actionButton;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  p_actionButton = &self->_actionButton;
  if (!self->_actionButton)
  {
    -[PKPassPaymentContainerView _emphasisButtonForState:](self, "_emphasisButtonForState:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v10 = v5;
      objc_storeStrong((id *)p_actionButton, v5);
      -[PKPassPaymentContainerView addSubview:](self, "addSubview:", *p_actionButton);
      v6 = 0.0;
      if (!PKUIGetMinScreenWidthType()
        && (-[PKPassPaymentContainerView _shouldDisplayPrimaryView](self, "_shouldDisplayPrimaryView")
         || -[PKPassPaymentContainerView _shouldDisplaySecondaryView](self, "_shouldDisplaySecondaryView")
         || -[PKPassPaymentContainerView _isVASInfoViewVisible](self, "_isVASInfoViewVisible")))
      {
        -[PKPassFooterContentView _setRequestPileSuppression:](self, "_setRequestPileSuppression:", 1);
        v6 = 0.5;
      }
      -[UIButton layer](*p_actionButton, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBeginTime:", v6);
      objc_msgSend(v8, "pkui_updateForAdditiveAnimationFromScalar:toScalar:withLayerScalar:", 0.0, 1.0, 1.0);
      v9 = (id)objc_msgSend(v7, "pkui_addAdditiveAnimation:", v8);

      v5 = v10;
    }

  }
}

- (void)_emphasizeStateIfPossible:(int64_t)a3 withTextOverride:(id)a4
{
  -[PKPassPaymentContainerView _emphasizeStateIfPossible:withTextOverride:playSystemSound:](self, "_emphasizeStateIfPossible:withTextOverride:playSystemSound:");
}

- (void)_emphasizeStateIfPossible:(int64_t)a3 withTextOverride:(id)a4 playSystemSound:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v5 = a5;
  v11 = a4;
  if (v5)
  {
    AudioServicesPlaySystemSound(0x573u);
    -[PKPassPaymentContainerView _showEmphasisButtonForStateIfPossible:](self, "_showEmphasisButtonForStateIfPossible:", a3);
LABEL_6:
    -[PKPassPaymentPayStateView emphasizeStateIfPossible:withOverrideText:](self->_payStateView, "emphasizeStateIfPossible:withOverrideText:", a3, v11);
    goto LABEL_7;
  }
  -[PKPassPaymentContainerView _showEmphasisButtonForStateIfPossible:](self, "_showEmphasisButtonForStateIfPossible:", a3);
  if ((PKPearlIsAvailable() & 1) == 0)
    goto LABEL_6;
  if (-[PKPassPaymentPayStateView state](self->_payStateView, "state") == a3)
    -[PKPassPaymentPayStateView setState:animated:withOverrideText:preserveGlyphState:completionHandler:](self->_payStateView, "setState:animated:withOverrideText:preserveGlyphState:completionHandler:", a3, 1, v11, 1, 0);
LABEL_7:
  if (self->_currentPayState == 3)
  {
    -[UIButton layer](self->_actionButton, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD26F8], "pkui_shakeAnimation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v8, "pkui_addAdditiveAnimation:", v9);

  }
}

- (void)_transitionToState:(int64_t)a3 withTextOverride:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  NSString *pendingPayStateTextOverride;
  _BOOL8 v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  id v25;

  v7 = a5;
  v25 = a4;
  v10 = a6;
  v11 = v10;
  v12 = 21;
  if (!self->_transitioning)
    v12 = 22;
  v13 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v12]);
  if (v13 == a3)
  {
    if (self->_transitioning || self->_waitingForGlyphView)
    {
      -[PKPassPaymentContainerView _addTransitionCompletionHandler:](self, "_addTransitionCompletionHandler:", v10);
    }
    else if (v10)
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }
  }
  else
  {
    -[PKPassPaymentContainerView _executeTransitionCompletionHandlers:](self, "_executeTransitionCompletionHandlers:", 1);
    self->_pendingPayState = a3;
    self->_pendingPayStateAnimated = v7;
    v14 = (NSString *)objc_msgSend(v25, "copy");
    pendingPayStateTextOverride = self->_pendingPayStateTextOverride;
    self->_pendingPayStateTextOverride = v14;

    self->_pendingPayStateGlyphStateQueued = 0;
    -[PKPassPaymentContainerView _addTransitionCompletionHandler:](self, "_addTransitionCompletionHandler:", v11);
    v16 = 0;
    if (a3 == 2)
      v16 = !self->_requireExpress;
    -[PKPassPaymentContainerView _setUserIntentRequired:](self, "_setUserIntentRequired:", v16);
    if (a3 == 8 || !self->_transitioning)
      -[PKPassPaymentContainerView _commitPendingPayStateAnimated:](self, "_commitPendingPayStateAnimated:", v7);
    if ((unint64_t)(a3 - 10) > 0xFFFFFFFFFFFFFFFCLL)
    {
      if (self->_pendingAutomaticAuthorization)
        self->_pendingAutomaticAuthorization = 0;
    }
    else
    {
      -[PKPassPaymentContainerView _cancelHoldingTerminalTransactionSubstateIfNecessary](self, "_cancelHoldingTerminalTransactionSubstateIfNecessary");
    }
    if (a3 != 12 && a3
      || (-[PKPassPaymentContainerView _endPaymentAuthorizationWithWillUpdateState:](self, "_endPaymentAuthorizationWithWillUpdateState:", 1), a3))
    {
      if (!v13)
      {
        -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v17, "setTableModalPresentationEnabled:animated:", 0, 1);
        v18 = -[PKPassFooterContentView style](self, "style") - 1;
        v19 = PKUIGetMinScreenWidthType();
        if (v19)
          v20 = (unint64_t)PKUIGetMinScreenType() < 4;
        else
          v20 = 1;
        -[PKPassFooterContentView pass](self, "pass");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "style");

        v24 = v23 == 7 && v20;
        if (!v19)
          v24 = 1;
        if (v18 <= 2 && v24)
          -[PKPassFooterContentView _setRequestPileSuppression:](self, "_setRequestPileSuppression:", 1);

      }
    }
    else
    {
      if (-[PKContactlessInterfaceSession persistentCardEmulationQueued](self->_contactlessInterfaceSession, "persistentCardEmulationQueued")&& !-[PKPassPaymentContainerView _authenticationAllowed](self, "_authenticationAllowed")&& -[PKContactlessInterfaceSession resetPersistentCardEmulation](self->_contactlessInterfaceSession, "resetPersistentCardEmulation"))
      {
        -[PKPassPaymentPayStateView setPersistentEmulationHint:](self->_payStateView, "setPersistentEmulationHint:", 0);
      }
      if (v13)
      {
        -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v21, "setTableModalPresentationEnabled:animated:", 1, 1);

      }
    }
  }

}

- (void)_commitPendingPayStateAnimated:(BOOL)a3
{
  int64_t currentPayState;
  _BOOL8 v6;
  void *v7;
  int64_t pendingPayStateGlyphState;
  _BOOL8 pendingPayStateGlyphStateAnimated;
  id v10;
  _QWORD v11[4];
  id v12;

  currentPayState = self->_currentPayState;
  self->_currentPayState = self->_pendingPayState;
  self->_glyphStateDirty = !self->_pendingPayStateGlyphStateQueued;
  v6 = a3 || self->_pendingPayStateAnimated;
  -[PKPassPaymentContainerView _transitionViewsFromPayState:animated:](self, "_transitionViewsFromPayState:animated:", currentPayState, v6);
  if (self->_pendingPayStateGlyphStateQueued)
  {
    self->_pendingPayStateGlyphStateQueued = 0;
    v7 = (void *)-[NSMutableArray copy](self->_pendingGlyphStateCompletionHandlers, "copy");
    -[NSMutableArray removeAllObjects](self->_pendingGlyphStateCompletionHandlers, "removeAllObjects");
    pendingPayStateGlyphState = self->_pendingPayStateGlyphState;
    pendingPayStateGlyphStateAnimated = self->_pendingPayStateGlyphStateAnimated;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__PKPassPaymentContainerView__commitPendingPayStateAnimated___block_invoke;
    v11[3] = &unk_1E3E62288;
    v12 = v7;
    v10 = v7;
    -[PKPassPaymentContainerView _setGlyphState:animated:withCompletionHandler:](self, "_setGlyphState:animated:withCompletionHandler:", pendingPayStateGlyphState, pendingPayStateGlyphStateAnimated, v11);

  }
}

void __61__PKPassPaymentContainerView__commitPendingPayStateAnimated___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_transitionViewsFromPayState:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  char *currentPayState;
  uint64_t v7;
  NSString *pendingPayStateTextOverride;
  char *v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  double v17;
  char v18;
  BOOL v19;
  char v20;
  unint64_t v21;
  void *v22;
  UIButton *v23;
  uint64_t v24;
  UIButton *v25;
  id v26;
  void *v27;
  UIButton *v28;
  id v29;
  uint64_t v30;
  void *v31;
  double v32;
  void *v33;
  id v34;
  id v35;
  UIButton *v36;
  id v37;
  char v38;
  void *v39;
  BOOL v40;
  void *v41;
  BOOL v42;
  BOOL v43;
  BOOL v44;
  void *v45;
  _BOOL4 v46;
  BOOL v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51[3];
  BOOL v52;
  _QWORD v53[4];
  id v54[3];
  char v55;
  BOOL v56;
  BOOL v57;
  BOOL v58;
  BOOL v59;
  BOOL v60;
  BOOL v61;
  _QWORD v62[4];
  id v63;
  UIButton *v64;
  PKPassPaymentContainerView *v65;
  id v66;
  id v67[2];
  BOOL v68;
  BOOL v69;
  BOOL v70;
  BOOL v71;
  BOOL v72;
  BOOL v73;
  BOOL v74;
  char v75;
  _QWORD aBlock[4];
  UIButton *v77;
  id v78;
  _QWORD *v79;
  id v80[4];
  BOOL v81;
  BOOL v82;
  BOOL v83;
  _QWORD v84[3];
  char v85;
  id location[2];

  v4 = a4;
  objc_initWeak(location, self);
  self->_transitioning = 1;
  self->_waitingForGlyphView = 1;
  currentPayState = (char *)self->_currentPayState;
  v7 = -[NSString copy](self->_pendingPayStateTextOverride, "copy");
  pendingPayStateTextOverride = self->_pendingPayStateTextOverride;
  self->_pendingPayStateTextOverride = 0;

  v9 = -[PKPassFooterContentView style](self, "style");
  v10 = -[PKPassPaymentContainerView _showPhysicalButtonForPayState:](self, "_showPhysicalButtonForPayState:", currentPayState);
  v11 = -[PKPassPaymentContainerView _isVASInfoViewVisible](self, "_isVASInfoViewVisible");
  v12 = -[PKPassPaymentContainerView _showGlyphForPayState:](self, "_showGlyphForPayState:", currentPayState);
  v13 = -[PKPassPaymentContainerView _isPrimaryViewVisible](self, "_isPrimaryViewVisible");
  v45 = (void *)v7;
  v14 = -[PKPassPaymentContainerView _isSecondaryViewVisible](self, "_isSecondaryViewVisible");
  if (self->_applicationsView)
    v15 = currentPayState == 0;
  else
    v15 = 1;
  v16 = !v10;
  if (v15)
    v16 = 0;
  v47 = v16;
  if ((unint64_t)(currentPayState - 7) > 1)
  {
    v40 = 0;
  }
  else
  {
    -[PKPassPaymentPayStateView alpha](self->_payStateView, "alpha");
    v40 = v17 != 0.0;
  }
  v43 = v13;
  v44 = v11;
  v42 = v14;
  if (v9 == (char *)2)
  {
    if (!v10)
    {
      v38 = PKRunningInRemoteContext();
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  v18 = (unint64_t)(v9 - 4) < 0xFFFFFFFFFFFFFFFDLL || v10;
  if ((v18 & 1) != 0 || !PKRunningInRemoteContext())
  {
LABEL_24:
    v38 = 0;
    goto LABEL_25;
  }
  if (PKUIGetMinScreenWidthType())
    v19 = 1;
  else
    v19 = currentPayState == 0;
  v20 = v19;
  v38 = v20;
LABEL_25:
  v21 = self->_payStateTransitionCounter + 1;
  self->_payStateTransitionCounter = v21;
  v22 = (void *)v21;
  v39 = (void *)v21;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x2020000000;
  v85 = 0;
  v23 = self->_actionButton;
  v24 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke;
  aBlock[3] = &unk_1E3E76C38;
  objc_copyWeak(v80, location);
  v79 = v84;
  v25 = v23;
  v77 = v25;
  v80[1] = currentPayState;
  v80[2] = v9;
  v81 = v10;
  v82 = v12;
  v83 = v4;
  v26 = v45;
  v78 = v26;
  v80[3] = v22;
  v46 = v4;
  v27 = _Block_copy(aBlock);
  v62[0] = v24;
  v62[1] = 3221225472;
  v62[2] = __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_3;
  v62[3] = &unk_1E3E76C60;
  objc_copyWeak(v67, location);
  v68 = v10;
  v69 = v40;
  v67[1] = currentPayState;
  v37 = v26;
  v63 = v37;
  v70 = v12;
  v71 = v47;
  v72 = v43;
  v73 = v42;
  v74 = v44;
  v28 = v25;
  v75 = v38;
  v36 = v28;
  v64 = v28;
  v65 = self;
  v29 = v27;
  v66 = v29;
  v41 = _Block_copy(v62);
  v30 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_4;
  v53[3] = &unk_1E3E76C88;
  objc_copyWeak(v54, location);
  v54[1] = v9;
  v54[2] = currentPayState;
  v55 = v38;
  v56 = v44;
  v57 = v10;
  v58 = v12;
  v59 = v43;
  v60 = v42;
  v61 = v47;
  v31 = _Block_copy(v53);
  if (v46)
    v32 = 0.2;
  else
    v32 = 0.0;
  v33 = (void *)MEMORY[0x1E0DC3F10];
  v48[0] = v30;
  v48[1] = 3221225472;
  v48[2] = __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_5;
  v48[3] = &unk_1E3E76D00;
  objc_copyWeak(v51, location);
  v51[1] = v39;
  v34 = v29;
  v49 = v34;
  v51[2] = *(id *)&v32;
  v35 = v31;
  v50 = v35;
  v52 = v46;
  objc_msgSend(v33, "animateWithDuration:delay:options:animations:completion:", 4, v41, v48, v32, 0.0);

  objc_destroyWeak(v51);
  objc_destroyWeak(v54);

  objc_destroyWeak(v67);
  objc_destroyWeak(v80);

  _Block_object_dispose(v84, 8);
  objc_destroyWeak(location);
}

void __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  uint64_t v5;
  id *v6;
  void *v7;
  id v8;
  __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  unsigned int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  _QWORD v23[4];
  id v24[2];
  char v25;

  v2 = (id *)(a1 + 56);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_34;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v5 + 24))
    goto LABEL_34;
  *(_BYTE *)(v5 + 24) = 1;
  v6 = WeakRetained + 85;
  if (WeakRetained[85] == *(id *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "_buttonForState:", *(_QWORD *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "setAlpha:", 0.0);
    if (*v6 != v8)
    {
      objc_msgSend(*v6, "removeFromSuperview");
      objc_msgSend(v4, "addSubview:", v8);
      objc_storeStrong(v4 + 85, v8);
    }

  }
  objc_msgSend(v4, "setNeedsLayout");
  objc_msgSend(v4, "layoutIfNeeded");
  objc_msgSend(v4, "_updateApplicationsView");
  if (*(_BYTE *)(a1 + 88))
  {
    if ((objc_msgSend(v4[63], "persistentEmulationHint") & 1) != 0)
    {
      v9 = CFSTR("PAYMENT_SERVICE_MODE_PUSH_BUTTON_TWO_LINE");
    }
    else if ((objc_msgSend(v4[63], "accessPass") & 1) != 0)
    {
      v9 = CFSTR("GENERIC_PUSH_BUTTON_TWO_LINE");
    }
    else if (*(_QWORD *)(a1 + 72) == 2)
    {
      v9 = CFSTR("NFC_PASS_PUSH_BUTTON_TWO_LINE");
    }
    else
    {
      v9 = CFSTR("PAYMENT_PUSH_BUTTON_TWO_LINE");
    }
    PKLocalizedPearlString(&v9->isa);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[71], "setInstruction:", v10);

  }
  v11 = v4[63];
  if (*((_BYTE *)v4 + 752))
    v12 = objc_msgSend(v4, "_recognizingBiometrics");
  else
    v12 = 0;
  objc_msgSend(v11, "setRecognizingHint:", v12);
  objc_msgSend(v4[63], "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentationLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if ((objc_msgSend(v14, "isHidden") & 1) != 0)
    {

      goto LABEL_26;
    }
    objc_msgSend(v14, "opacity");
    v16 = v15;

    if (v16 <= 0.0)
    {
LABEL_26:
      v17 = *(unsigned __int8 *)(a1 + 89);
      if (*(_BYTE *)(a1 + 89))
        v17 = (unint64_t)(*(_QWORD *)(a1 + 64) - 7) < 3;
      goto LABEL_28;
    }
  }
  v17 = 1;
LABEL_28:
  v18 = v4[63];
  v19 = *(_QWORD *)(a1 + 64);
  if (*(_BYTE *)(a1 + 90))
    v20 = v17;
  else
    v20 = 0;
  v21 = *(_QWORD *)(a1 + 40);
  v22 = *((_BYTE *)v4 + 808) == 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_2;
  v23[3] = &unk_1E3E76C10;
  objc_copyWeak(v24, v2);
  v24[1] = *(id *)(a1 + 80);
  v25 = *(_BYTE *)(a1 + 89);
  objc_msgSend(v18, "setState:animated:withOverrideText:preserveGlyphState:completionHandler:", v19, v20, v21, v22, v23);
  if (!*(_BYTE *)(a1 + 89))
    *((_BYTE *)v4 + 811) = 0;
  objc_destroyWeak(v24);
LABEL_34:

}

void __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 40) == *((_QWORD *)WeakRetained + 87))
    {
      if (*(_BYTE *)(a1 + 48))
      {
        WeakRetained[811] = 0;
        if (!WeakRetained[784])
        {
          v3 = WeakRetained;
          objc_msgSend(WeakRetained, "_executeTransitionCompletionHandlers:", 0);
          WeakRetained = v3;
        }
      }
    }
  }

}

void __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  double v3;
  int v4;
  double v5;
  void *v6;
  void *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    if (!*(_BYTE *)(a1 + 80))
    {
      objc_msgSend(WeakRetained[71], "setAlpha:", 0.0);
      objc_msgSend(v8[71], "setAnimating:", 0);
    }
    if (!*(_BYTE *)(a1 + 81)
      && objc_msgSend(v8[63], "labelWillChangeForState:withOverrideText:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(v8[63], "setLabelAlpha:", 0.0);
    }
    if (!*(_BYTE *)(a1 + 82))
      objc_msgSend(v8[63], "setAlpha:", 0.0);
    if (!*(_BYTE *)(a1 + 83))
      objc_msgSend(v8[83], "setAlpha:", 0.0);
    if (!*(_BYTE *)(a1 + 84))
      objc_msgSend(v8[78], "setAlpha:", 0.0);
    if (!*(_BYTE *)(a1 + 85))
      objc_msgSend(v8[79], "setAlpha:", 0.0);
    if (*(_BYTE *)(a1 + 86) || (objc_msgSend(v8[84], "alpha"), v3 <= 0.0))
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v8[84], "setAlpha:", 0.0);
      v4 = 1;
    }
    objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
    if (!*(_BYTE *)(a1 + 87))
    {
      objc_msgSend(*(id *)(a1 + 48), "infoButtonAlpha");
      if (v5 > 0.0)
      {
        objc_msgSend(v8, "appIconView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setAlpha:", 0.0);

        objc_msgSend(v8, "setInfoButtonAlpha:", 0.0);
        objc_msgSend(v8, "bottomRule");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setAlpha:", 0.0);

        if (!*(_BYTE *)(a1 + 81))
          goto LABEL_26;
LABEL_24:
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_27:
        WeakRetained = v8;
        goto LABEL_28;
      }
    }
    WeakRetained = v8;
    if (*(_BYTE *)(a1 + 81))
      goto LABEL_24;
    if (v4)
    {
LABEL_26:
      objc_msgSend(v8, "setNeedsLayout");
      objc_msgSend(v8, "layoutIfNeeded");
      goto LABEL_27;
    }
  }
LABEL_28:

}

void __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  double v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  id *v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v3 = WeakRetained[85];
    if ((unint64_t)(*(_QWORD *)(a1 + 40) - 1) > 2)
    {
      if (v3)
      {
        objc_msgSend(v3, "setAlpha:", 1.0);
        if (*(_QWORD *)(a1 + 48) != 3)
        {
          objc_msgSend(v10, "bottomRule");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setAlpha:", 1.0);

        }
      }
    }
    else if (v3)
    {
      objc_msgSend(v3, "setAlpha:", 1.0);
    }
    if (*(_BYTE *)(a1 + 56) && (objc_msgSend(v10, "infoButtonAlpha"), v5 <= 0.0))
    {
      objc_msgSend(v10, "appIconView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", 1.0);

      objc_msgSend(v10, "infoButtonAlpha");
      objc_msgSend(v10, "bottomRule");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAlpha:", 1.0);

      v6 = 1;
    }
    else
    {
      v6 = 0;
    }
    if (*(_BYTE *)(a1 + 57))
    {
      objc_msgSend(v10[84], "alpha");
      if (v9 <= 0.0)
      {
        objc_msgSend(v10[84], "setAlpha:", 1.0);
        v6 = 1;
      }
    }
    if (*(_BYTE *)(a1 + 58))
    {
      objc_msgSend(v10[71], "setAlpha:", 1.0);
      objc_msgSend(v10[71], "setAnimating:", 1);
    }
    objc_msgSend(v10[63], "setLabelAlpha:", 1.0);
    if (*(_BYTE *)(a1 + 59))
      objc_msgSend(v10[63], "setAlpha:", 1.0);
    if (*(_BYTE *)(a1 + 60))
      objc_msgSend(v10[78], "setAlpha:", 1.0);
    WeakRetained = v10;
    if (*(_BYTE *)(a1 + 61))
    {
      objc_msgSend(v10[79], "setAlpha:", 1.0);
      WeakRetained = v10;
    }
    if (*(_BYTE *)(a1 + 62))
    {
      objc_msgSend(v10[83], "setAlpha:", 1.0);
      WeakRetained = v10;
    }
    if (v6)
    {
      objc_msgSend(v10, "setNeedsLayout");
      objc_msgSend(v10, "layoutIfNeeded");
      WeakRetained = v10;
    }
  }

}

void __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_5(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;
  id v5[3];
  char v6;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_6;
  v2[3] = &unk_1E3E76CD8;
  objc_copyWeak(v5, (id *)(a1 + 48));
  v5[1] = *(id *)(a1 + 56);
  v3 = *(id *)(a1 + 32);
  v5[2] = *(id *)(a1 + 64);
  v4 = *(id *)(a1 + 40);
  v6 = *(_BYTE *)(a1 + 72);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(v5);
}

void __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_6(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9[2];
  char v10;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 56) == *((_QWORD *)WeakRetained + 87))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v6 = *(double *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_7;
    v8[3] = &unk_1E3E76C10;
    objc_copyWeak(v9, v2);
    v9[1] = *(id *)(a1 + 56);
    v10 = *(_BYTE *)(a1 + 72);
    objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", 4, v7, v8, v6, 0.0);
    objc_destroyWeak(v9);
  }

}

void __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_7(uint64_t a1)
{
  _QWORD block[4];
  id v3[2];
  char v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_8;
  block[3] = &unk_1E3E76CB0;
  objc_copyWeak(v3, (id *)(a1 + 32));
  v3[1] = *(id *)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v3);
}

void __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_8(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(_QWORD *)(a1 + 40) == WeakRetained[87])
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_endTransition:", *(unsigned __int8 *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (void)_endTransition:(BOOL)a3
{
  self->_transitioning = 0;
  if (self->_currentPayState == self->_pendingPayState)
  {
    if (!self->_waitingForGlyphView)
      -[PKPassPaymentContainerView _executeTransitionCompletionHandlers:](self, "_executeTransitionCompletionHandlers:", 0);
  }
  else
  {
    -[PKPassPaymentContainerView _commitPendingPayStateAnimated:](self, "_commitPendingPayStateAnimated:", a3);
  }
}

- (void)_addTransitionCompletionHandler:(id)a3
{
  NSMutableArray *transitionCompletionHandlers;
  void *v4;
  id v5;

  if (a3)
  {
    transitionCompletionHandlers = self->_transitionCompletionHandlers;
    v5 = (id)objc_msgSend(a3, "copy");
    v4 = _Block_copy(v5);
    -[NSMutableArray addObject:](transitionCompletionHandlers, "addObject:", v4);

  }
}

- (void)_executeTransitionCompletionHandlers:(BOOL)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_transitionCompletionHandlers, "count"))
  {
    v4 = (void *)-[NSMutableArray copy](self->_transitionCompletionHandlers, "copy");
    -[NSMutableArray removeAllObjects](self->_transitionCompletionHandlers, "removeAllObjects");
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)_setGlyphState:(int64_t)a3 animated:(BOOL)a4
{
  -[PKPassPaymentContainerView _setGlyphState:animated:withCompletionHandler:](self, "_setGlyphState:animated:withCompletionHandler:", a3, a4, 0);
}

- (void)_setGlyphState:(int64_t)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v5;
  void *v8;
  NSMutableArray *pendingGlyphStateCompletionHandlers;
  void *v10;
  id v11;

  v5 = a4;
  v11 = a5;
  if (self->_currentPayState == self->_pendingPayState || !self->_transitioning)
  {
    self->_glyphStateDirty = 0;
    -[PKPassPaymentPayStateView glyph](self->_payStateView, "glyph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setState:animated:completionHandler:", a3, v5, v11);
LABEL_12:

    goto LABEL_13;
  }
  if (self->_pendingPayStateGlyphStateQueued && self->_pendingPayStateGlyphState == a3)
  {
    self->_pendingPayStateGlyphStateQueued = 1;
    self->_pendingPayStateGlyphState = a3;
    if (!self->_pendingPayStateGlyphStateAnimated)
      LOBYTE(v5) = 0;
  }
  else
  {
    -[PKPassPaymentContainerView _executePendingGlyphStateCompletionHandlers:](self, "_executePendingGlyphStateCompletionHandlers:", 1);
    self->_pendingPayStateGlyphStateQueued = 1;
    self->_pendingPayStateGlyphState = a3;
  }
  self->_pendingPayStateGlyphStateAnimated = v5;
  if (v11)
  {
    pendingGlyphStateCompletionHandlers = self->_pendingGlyphStateCompletionHandlers;
    v8 = (void *)objc_msgSend(v11, "copy");
    v10 = _Block_copy(v8);
    -[NSMutableArray addObject:](pendingGlyphStateCompletionHandlers, "addObject:", v10);

    goto LABEL_12;
  }
LABEL_13:

}

- (void)_executePendingGlyphStateCompletionHandlers:(BOOL)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_pendingGlyphStateCompletionHandlers, "count"))
  {
    v4 = (void *)-[NSMutableArray copy](self->_pendingGlyphStateCompletionHandlers, "copy");
    -[NSMutableArray removeAllObjects](self->_pendingGlyphStateCompletionHandlers, "removeAllObjects");
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)_updateAuthenticatorState
{
  self->_authenticatorState = objc_msgSend(MEMORY[0x1E0D6BFD8], "currentStateForPolicy:", 0);
  -[PKPassPaymentContainerView _setUserIntentStyle:](self, "_setUserIntentStyle:", objc_msgSend(MEMORY[0x1E0D6BFD8], "userIntentStyle"));
}

- (BOOL)_canAuthenticateWithBiometrics
{
  return self->_authenticatorState & ((self->_authenticatorState & 6) != 0);
}

- (BOOL)_canAuthenticateWithPasscode
{
  return (~LODWORD(self->_authenticatorState) & 9) == 0;
}

- (void)_setUserIntentRequired:(BOOL)a3
{
  if (self->_userIntentRequired != a3)
  {
    self->_userIntentRequired = a3;
    -[PKPassPaymentContainerView _updatePhysicalButtonRequirement](self, "_updatePhysicalButtonRequirement");
  }
}

- (void)_setUserIntentStyle:(int64_t)a3
{
  if (self->_userIntentStyle != a3)
  {
    self->_userIntentStyle = a3;
    -[PKPassPaymentPayStateView setUserIntentStyle:](self->_payStateView, "setUserIntentStyle:");
    -[PKPassPaymentContainerView _updatePhysicalButtonRequirement](self, "_updatePhysicalButtonRequirement");
  }
}

- (void)_updatePhysicalButtonRequirement
{
  _BOOL8 v2;

  v2 = self->_userIntentStyle == 1 && self->_userIntentRequired;
  -[PKPassFooterContentView _setPhysicalButtonRequired:](self, "_setPhysicalButtonRequired:", v2);
}

- (id)_buttonForState:(int64_t)a3
{
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  id *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int64_t failureReason;
  const __CFString *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;

  if ((PKUIOnlyDemoModeEnabled() & 1) != 0 || (PKStoreDemoModeEnabled() & 1) != 0)
    return 0;
  v6 = -[PKPassFooterContentView style](self, "style") - 1;
  -[PKPassFooterContentView bottomRule](self, "bottomRule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 > 2)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v7, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "alpha");
      v11 = v10 > 0.0;
    }
    else
    {
      v11 = 0;
    }

  }
  objc_initWeak(&location, self);
  switch(a3)
  {
    case 10:
      v16 = (void *)MEMORY[0x1E0DC3428];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __46__PKPassPaymentContainerView__buttonForState___block_invoke_2;
      v29[3] = &unk_1E3E62BD0;
      v13 = &v30;
      objc_copyWeak(&v30, &location);
      objc_msgSend(v16, "actionWithHandler:", v29);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("GENERIC_NO_PASSCODE"));
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 9:
      v17 = 0;
      v14 = 0;
      v18 = 0;
      switch(self->_failureAction)
      {
        case 0:
          goto LABEL_40;
        case 1:
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Bluetooth"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedIdentityString(CFSTR("PRESENTMENT_TURN_ON_CARRIER"));
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        case 2:
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root="));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (self->_failureReason == 4)
            PKLocalizedCredentialString(CFSTR("TURN_OFF_AIRPLANE_MODE_BUTTON_TITLE"));
          else
            PKLocalizedIdentityString(CFSTR("PRESENTMENT_GO_TO_SETTINGS"));
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        case 3:
          failureReason = self->_failureReason;
          if (failureReason == 3)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/HT208733"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedCredentialString(CFSTR("LEARN_MORE_BUTTON_TITLE"));
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (failureReason != 2)
            {
              v17 = 0;
              v19 = 0;
LABEL_33:
              v23 = (void *)MEMORY[0x1E0DC3428];
              v26[0] = MEMORY[0x1E0C809B0];
              v26[1] = 3221225472;
              v26[2] = __46__PKPassPaymentContainerView__buttonForState___block_invoke_3;
              v26[3] = &unk_1E3E659D0;
              objc_copyWeak(&v28, &location);
              v24 = v19;
              v27 = v24;
              objc_msgSend(v23, "actionWithHandler:", v26);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              objc_destroyWeak(&v28);
              goto LABEL_34;
            }
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/HT212274"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedCredentialString(CFSTR("LEARN_MORE_BUTTON_TITLE"));
            v20 = objc_claimAutoreleasedReturnValue();
          }
LABEL_32:
          v17 = (void *)v20;
          goto LABEL_33;
        case 4:
          PKLocalizedIdentityString(CFSTR("PRESENTMENT_TURN_ON_BIOMETRICS"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (PKPearlIsAvailable())
            v22 = CFSTR("prefs:root=Pearl");
          else
            v22 = CFSTR("prefs:root=TOUCHID_PASSCODE&path=TOUCHID_PASSCODE");
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        default:
          v19 = 0;
          goto LABEL_33;
      }
    case 3:
      v12 = (void *)MEMORY[0x1E0DC3428];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __46__PKPassPaymentContainerView__buttonForState___block_invoke;
      v31[3] = &unk_1E3E62BD0;
      v13 = &v32;
      objc_copyWeak(&v32, &location);
      objc_msgSend(v12, "actionWithHandler:", v31);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassPaymentContainerView _passcodeButtonTitle](self, "_passcodeButtonTitle");
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v17 = (void *)v15;
      objc_destroyWeak(v13);
LABEL_34:
      v18 = 0;
      if (v14 && v17)
      {
        if (v11)
          -[PKPassFooterContentView _buttonWithTitle:action:](self, "_buttonWithTitle:action:", v17, v14);
        else
          -[PKPassPaymentContainerView _filledButtonWithTitle:action:](self, "_filledButtonWithTitle:action:", v17, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_40;
  }
  v17 = 0;
  v14 = 0;
  v18 = 0;
LABEL_40:
  objc_msgSend(v18, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67830]);
  v25 = v18;

  objc_destroyWeak(&location);
  return v25;
}

void __46__PKPassPaymentContainerView__buttonForState___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_passcodeFallbackButtonPressed:", v4);
}

void __46__PKPassPaymentContainerView__buttonForState___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_addPasscodeButtonPressed:", v4);
}

void __46__PKPassPaymentContainerView__buttonForState___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_openURL:", *(_QWORD *)(a1 + 32));

}

- (id)_emphasisButtonForState:(int64_t)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id location;

  if (a3 == 1)
  {
    -[PKPassPaymentContainerView _passcodeButtonTitle](self, "_passcodeButtonTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKPassFooterContentView style](self, "style");
    -[PKPassFooterContentView bottomRule](self, "bottomRule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E0DC3428];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __54__PKPassPaymentContainerView__emphasisButtonForState___block_invoke;
    v18 = &unk_1E3E62BD0;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v7, "actionWithHandler:", &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(v5 - 1) <= 2
      && (objc_msgSend(v6, "superview", v15, v16, v17, v18), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      && (objc_msgSend(v6, "alpha"), v11 = v10, v9, v11 > 0.0))
    {
      -[PKPassFooterContentView _buttonWithTitle:action:](self, "_buttonWithTitle:action:", v4, v8);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKPassPaymentContainerView _filledButtonWithTitle:action:](self, "_filledButtonWithTitle:action:", v4, v8, v15, v16, v17, v18);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v12;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  else
  {
    v4 = 0;
    v13 = 0;
  }

  return v13;
}

void __54__PKPassPaymentContainerView__emphasisButtonForState___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_passcodeFallbackButtonPressed:", v4);
}

- (id)_passcodeButtonTitle
{
  int64_t v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;

  v3 = -[PKPassFooterContentView style](self, "style");
  v4 = 0;
  switch(v3)
  {
    case 0:
    case 1:
    case 3:
      -[PKPassFooterContentView paymentPass](self, "paymentPass");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isAccessPass");

      if (!v6)
        goto LABEL_4;
      v7 = CFSTR("GENERIC_PASSCODE");
      goto LABEL_5;
    case 2:
      PKLocalizedString(CFSTR("VAS_PASS_USE_PASSCODE"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      return v4;
    default:
LABEL_4:
      v7 = CFSTR("PAYMENT_PASSCODE");
LABEL_5:
      PKLocalizedPaymentString(&v7->isa);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v4;
}

- (id)_filledButtonWithTitle:(id)a3 action:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  PKContinuousButton *v11;
  void *v12;
  uint64_t v14;
  __int128 v15;
  int64x2_t v16;

  v5 = a4;
  v6 = a3;
  PKFloatRoundToPixel();
  v8 = v7;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A90], (NSString *)*MEMORY[0x1E0DC48D8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lineHeight");
  PKFloatRoundToPixel();
  v14 = v10;
  v15 = xmmword_19DEE0240;
  v16 = vdupq_n_s64(2uLL);
  v11 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", &v14);
  -[PKContinuousButton setContentEdgeInsets:](v11, "setContentEdgeInsets:", v8, 25.0, 16.0 - v8, 25.0);
  -[PKContinuousButton titleLabel](v11, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v9);
  objc_msgSend(v12, "setMinimumScaleFactor:", 0.5);
  objc_msgSend(v12, "setTextAlignment:", 1);
  objc_msgSend(v12, "setLineBreakMode:", 4);
  -[PKContinuousButton setTitle:forState:](v11, "setTitle:forState:", v6, 0);

  -[PKContinuousButton _setTouchInsets:](v11, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  -[PKContinuousButton setExclusiveTouch:](v11, "setExclusiveTouch:", 1);
  -[PKContinuousButton sizeToFit](v11, "sizeToFit");
  -[PKContinuousButton addAction:forControlEvents:](v11, "addAction:forControlEvents:", v5, 64);

  return v11;
}

- (unint64_t)_actionAfterTransaction
{
  PKPassPaymentContainerView *v2;
  int64_t v3;
  int v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  v2 = self;
  v3 = -[PKPassFooterContentView style](self, "style");
  v4 = PKRunningInRemoteContext();
  -[PKPassFooterContentView delegate](v2, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v5, "isPassFooterContentViewInGroup:", v2);

  v6 = 2;
  if ((_DWORD)v2)
    v7 = 2;
  else
    v7 = 0;
  if (v4)
    v6 = v7;
  if (v3 == 2)
    return v6;
  else
    return v7;
}

- (BOOL)_shouldDisplayPrimaryView
{
  int64_t v3;
  void *v4;
  BOOL v5;
  BOOL v6;

  v3 = -[PKPassFooterContentView style](self, "style");
  if ((unint64_t)(v3 - 1) < 3)
  {
    if (v3 != 3)
      return 0;
    -[PKPaymentTransaction awards](self->_transactionForDisplayedBarcode, "awards");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") == 0;
    goto LABEL_8;
  }
  -[PKPassFooterContentView paymentPass](self, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isStoredValuePass")
    || (-[PKTransitBalanceModel hasBalanceContent](self->_transitBalanceModel, "hasBalanceContent") & 1) == 0)
  {
    v5 = self->_groupTile == 0;
LABEL_8:
    v6 = !v5;
    goto LABEL_11;
  }
  v6 = 1;
LABEL_11:

  return v6;
}

- (BOOL)_canDisplaySecondaryView
{
  double v4;

  if ((unint64_t)(-[PKPassFooterContentView style](self, "style") - 1) < 3)
    return 0;
  -[PKPassValueAddedServiceInfoView alpha](self->_valueAddedServiceInfoView, "alpha");
  return v4 <= 0.0;
}

- (BOOL)_shouldDisplaySecondaryView
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[PKPassPaymentContainerView _canDisplaySecondaryView](self, "_canDisplaySecondaryView");
  if (v3)
  {
    -[PKPassFooterContentView paymentPass](self, "paymentPass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isTransitPass"))
    {
      v5 = -[PKTransitBalanceModel hasCommutePlanContent](self->_transitBalanceModel, "hasCommutePlanContent");

      if ((v5 & 1) != 0)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
    }
    else
    {

    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_showPhysicalButtonForPayState:(int64_t)a3
{
  return a3 == 2 && self->_userIntentStyle == 1;
}

- (BOOL)_showGlyphForPayState:(int64_t)a3
{
  BOOL result;

  result = 0;
  switch(a3)
  {
    case 1:
      result = PKSystemApertureIsAvailable() ^ 1;
      break;
    case 2:
      result = self->_userIntentStyle != 1;
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 12:
      result = 1;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)_isVASInfoViewVisible
{
  if (self->_valueAddedServiceInfoView && !self->_VASInfoViewHidden)
    return !-[PKPassPaymentContainerView _showPhysicalButtonForPayState:](self, "_showPhysicalButtonForPayState:", self->_currentPayState);
  else
    return 0;
}

- (BOOL)_isPrimaryViewVisible
{
  _BOOL4 v3;

  if (self->_currentPayState)
  {
    v3 = -[PKPassPaymentContainerView _shouldDisplayPrimaryView](self, "_shouldDisplayPrimaryView");
    if (v3)
      LOBYTE(v3) = !-[PKPassPaymentContainerView _showPhysicalButtonForPayState:](self, "_showPhysicalButtonForPayState:", self->_currentPayState);
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_isSecondaryViewVisible
{
  _BOOL4 v3;

  if (!self->_currentPayState)
  {
LABEL_4:
    LOBYTE(v3) = 0;
    return v3;
  }
  v3 = -[PKPassPaymentContainerView _shouldDisplaySecondaryView](self, "_shouldDisplaySecondaryView");
  if (v3)
  {
    if (!-[PKPassPaymentContainerView _showPhysicalButtonForPayState:](self, "_showPhysicalButtonForPayState:", self->_currentPayState))
    {
      LOBYTE(v3) = !-[PKPassPaymentContainerView _isVASInfoViewVisible](self, "_isVASInfoViewVisible");
      return v3;
    }
    goto LABEL_4;
  }
  return v3;
}

- (BOOL)_authenticationAllowed
{
  _BOOL4 v3;

  if (-[PKPassFooterContentView isInvalidated](self, "isInvalidated") || !self->_isVisible)
    goto LABEL_5;
  v3 = -[PKPassPaymentContainerView _isForegroundActive](self, "_isForegroundActive");
  if (v3)
  {
    if (self->_failureReason)
    {
LABEL_5:
      LOBYTE(v3) = 0;
      return v3;
    }
    LOBYTE(v3) = !-[PKPassPaymentContainerView passOnlySupportsPassiveEntry](self, "passOnlySupportsPassiveEntry");
  }
  return v3;
}

- (BOOL)passOnlySupportsPassiveEntry
{
  void *v2;
  BOOL v3;

  -[PKPassFooterContentView paymentPass](self, "paymentPass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedRadioTechnologies") == 2;

  return v3;
}

- (void)_presentPassWithUniqueIdentifier:(id)a3 additionalPassUniqueIdentifiers:(id)a4
{
  -[PKPassPaymentContainerView _presentPassWithUniqueIdentifier:additionalPassUniqueIdentifiers:payState:](self, "_presentPassWithUniqueIdentifier:additionalPassUniqueIdentifiers:payState:", a3, a4, 0);
}

- (void)_presentPassWithUniqueIdentifier:(id)a3 additionalPassUniqueIdentifiers:(id)a4 payState:(int64_t)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("PKPassPaymentContainerViewPresentationPayStateKey"));

    +[PKPassPresentationContext contextWithWasAutomaticallySelected:additionalPassUniqueIdentifiers:userInfo:](PKPassPresentationContext, "contextWithWasAutomaticallySelected:additionalPassUniqueIdentifiers:userInfo:", 1, 0, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFieldDetect:", 1);
    objc_msgSend(v7, "presentPassWithUniqueID:context:animated:completionHandler:", v11, v10, 1, 0);

  }
}

- (BOOL)_shouldShowTerminalIsNotRequestingPaymentError
{
  if (-[PKPassFooterContentView style](self, "style") || self->_currentPayState != 5)
    return 0;
  else
    return !-[PKPassPaymentContainerView _hasValueAddedServicePasses](self, "_hasValueAddedServicePasses");
}

- (void)_showTerminalIsNotRequestingPaymentError
{
  int64_t currentPayState;
  void *v4;
  uint64_t v5;
  dispatch_time_t v6;
  _QWORD v7[6];

  currentPayState = self->_currentPayState;
  PKLocalizedString(CFSTR("VAS_PASS_ERROR_TERMINAL_EXPECTS_VAS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassPaymentContainerView _emphasizeStateIfPossible:withTextOverride:playSystemSound:](self, "_emphasizeStateIfPossible:withTextOverride:playSystemSound:", currentPayState, v4, 1);

  v5 = -[PKAuthenticator authenticationIdentifier](self->_authenticator, "authenticationIdentifier");
  v6 = dispatch_time(0, 4000000000);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PKPassPaymentContainerView__showTerminalIsNotRequestingPaymentError__block_invoke;
  v7[3] = &unk_1E3E62010;
  v7[4] = self;
  v7[5] = v5;
  dispatch_after(v6, MEMORY[0x1E0C80D38], v7);
}

void __70__PKPassPaymentContainerView__showTerminalIsNotRequestingPaymentError__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "authenticationIdentifier") == *(_QWORD *)(a1 + 40))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v2 + 736) == 5)
    {
      v3 = *(void **)(v2 + 504);
      PKLocalizedPaymentString(CFSTR("GENERIC_INSTRUCTION"));
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setState:animated:withOverrideText:preserveGlyphState:completionHandler:", 5, 1, v4, 0, 0);

    }
  }
}

- (void)_showTerminalIsRequestingPaymentError
{
  int64_t currentPayState;
  void *v4;
  uint64_t v5;
  dispatch_time_t v6;
  _QWORD v7[6];

  currentPayState = self->_currentPayState;
  PKLocalizedString(CFSTR("VAS_PASS_ERROR_TERMINAL_EXPECTS_PAYMENT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassPaymentContainerView _emphasizeStateIfPossible:withTextOverride:playSystemSound:](self, "_emphasizeStateIfPossible:withTextOverride:playSystemSound:", currentPayState, v4, 1);

  v5 = -[PKAuthenticator authenticationIdentifier](self->_authenticator, "authenticationIdentifier");
  v6 = dispatch_time(0, 4000000000);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__PKPassPaymentContainerView__showTerminalIsRequestingPaymentError__block_invoke;
  v7[3] = &unk_1E3E62010;
  v7[4] = self;
  v7[5] = v5;
  dispatch_after(v6, MEMORY[0x1E0C80D38], v7);
}

uint64_t __67__PKPassPaymentContainerView__showTerminalIsRequestingPaymentError__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "authenticationIdentifier");
  if (result == *(_QWORD *)(a1 + 40))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v3 + 736) == 5)
      return objc_msgSend(*(id *)(v3 + 504), "setState:animated:withOverrideText:preserveGlyphState:completionHandler:", 5, 1, 0, 0, 0);
  }
  return result;
}

- (void)_setVASInfoViewHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void (**v8)(id, uint64_t);
  double v9;
  double v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD aBlock[6];

  v5 = a4;
  v6 = a3;
  v8 = (void (**)(id, uint64_t))a5;
  if (self->_VASInfoViewHidden == v6)
  {
    -[PKPassPaymentContainerView _updateVASInfoViewSuppressedTransactionIfNecessary](self, "_updateVASInfoViewSuppressedTransactionIfNecessary");
    goto LABEL_5;
  }
  self->_VASInfoViewHidden = v6;
  -[PKPassPaymentContainerView _updateVASInfoViewSuppressedTransactionIfNecessary](self, "_updateVASInfoViewSuppressedTransactionIfNecessary");
  if (!self->_valueAddedServiceInfoView
    || (v9 = (double)-[PKPassPaymentContainerView _isVASInfoViewVisible](self, "_isVASInfoViewVisible"),
        -[PKPassValueAddedServiceInfoView alpha](self->_valueAddedServiceInfoView, "alpha"),
        v10 == v9))
  {
LABEL_5:
    if (v8)
      v8[2](v8, 1);
    goto LABEL_7;
  }
  if (v5)
    -[PKPassPaymentContainerView layoutIfNeeded](self, "layoutIfNeeded");
  -[PKPassPaymentContainerView setNeedsLayout](self, "setNeedsLayout");
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPassPaymentContainerView__setVASInfoViewHidden_animated_completion___block_invoke;
  aBlock[3] = &unk_1E3E62010;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v9;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  v13 = v12;
  if (v5)
  {
    v14 = (void *)MEMORY[0x1E0DC3F10];
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __72__PKPassPaymentContainerView__setVASInfoViewHidden_animated_completion___block_invoke_2;
    v15[3] = &unk_1E3E61590;
    v16 = v12;
    objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", 4, v15, v8, 0.2, 0.0);

  }
  else
  {
    v12[2](v12);
    if (v8)
      v8[2](v8, 1);
  }

LABEL_7:
}

uint64_t __72__PKPassPaymentContainerView__setVASInfoViewHidden_animated_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "setAlpha:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setAlpha:", (double)objc_msgSend(*(id *)(a1 + 32), "_isPrimaryViewVisible"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "setAlpha:", (double)objc_msgSend(*(id *)(a1 + 32), "_isSecondaryViewVisible"));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __72__PKPassPaymentContainerView__setVASInfoViewHidden_animated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateVASInfoViewSuppressedTransactionIfNecessary
{
  if (self->_VASInfoViewHidden && self->_VASInfoViewSuppressedTransactionUpdate)
  {
    self->_VASInfoViewSuppressedTransactionUpdate = 0;
    -[PKPassPaymentContainerView _applyLatestContentToViews](self, "_applyLatestContentToViews");
  }
}

- (void)_setValueAddedServicePasses:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *valueAddedPasses;
  void *v6;
  BOOL v7;
  id v8;
  _QWORD v9[5];
  BOOL v10;

  v8 = a3;
  v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  valueAddedPasses = self->_valueAddedPasses;
  self->_valueAddedPasses = v4;

  if (v8)
  {
    -[PKPassFooterContentView paymentPass](self, "paymentPass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__PKPassPaymentContainerView__setValueAddedServicePasses___block_invoke;
    v9[3] = &unk_1E3E76D28;
    v10 = v7;
    v9[4] = self;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);
  }

}

void __58__PKPassPaymentContainerView__setValueAddedServicePasses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (!*(_BYTE *)(a1 + 40) || (v4 = objc_msgSend(v3, "hasStoredValue"), v5 = v6, (v4 & 1) == 0))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "addObject:", v6);
    v5 = v6;
  }

}

- (BOOL)_hasValueAddedServicePasses
{
  return -[NSMutableArray count](self->_valueAddedPasses, "count") != 0;
}

- (void)_processPaymentTransactionForContext:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PKPaymentService *paymentService;
  void *v14;
  id v15;

  v15 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  objc_msgSend(v15, "transaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v12 = 0;
    if (!v6)
      goto LABEL_11;
    goto LABEL_10;
  }
  -[PKPassFooterContentView paymentPass](self, "paymentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (v9 && v11)
  {
    if (objc_msgSend(v9, "isEqualToString:", v11))
    {
      objc_msgSend(v7, "setMerchant:", self->_merchantForCurrentTransaction);
      paymentService = self->_paymentService;
      objc_msgSend(v15, "paymentApplication");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentService insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:](paymentService, "insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:", v7, v9, v14, 0);

      v12 = 1;
    }
    else
    {
      v12 = 0;
    }
  }

  if (v6)
LABEL_10:
    v6[2](v6, v12);
LABEL_11:

}

- (void)_insertPaymentTransactionForActiveBarcode
{
  void *v3;
  void *v4;
  PKPaymentService *paymentService;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0D67370], "paymentTransactionWithSource:", 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOriginatedByDevice:", 1);
  PKTransactionPaymentHashForBarcodeIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPaymentHash:", v3);

  objc_msgSend(v10, "addUpdateReasons:", 0x20000);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTransactionDate:", v4);

  paymentService = self->_paymentService;
  -[PKPassFooterContentView paymentPass](self, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassFooterContentView paymentPass](self, "paymentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "devicePrimaryBarcodePaymentApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentService insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:](paymentService, "insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:", v10, v7, v9, 0);

}

- (void)_processValueAddedServiceTransactionsForContext:(id)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v23;
  void (**v24)(id, _QWORD, id);
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  PKPassPaymentContainerView *v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = (void (**)(id, _QWORD, id))a4;
  v25 = v5;
  objc_msgSend(v5, "valueAddedServicePasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueAddedServiceTransactions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transaction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v12, "passTypeIdentifier", v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dataUsingEncoding:", 4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "SHA256Hash");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v16, v15);
        }
        objc_msgSend(v16, "addObject:", v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v9);
  }

  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __93__PKPassPaymentContainerView__processValueAddedServiceTransactionsForContext_withCompletion___block_invoke;
  v26[3] = &unk_1E3E76D50;
  v31 = &v32;
  v18 = v7;
  v27 = v18;
  v19 = v17;
  v28 = v19;
  v29 = self;
  v20 = v21;
  v30 = v20;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v26);
  if (v24)
    v24[2](v24, *((unsigned __int8 *)v33 + 24), v19);

  _Block_object_dispose(&v32, 8);
}

void __93__PKPassPaymentContainerView__processValueAddedServiceTransactionsForContext_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (objc_msgSend(v6, "didSucceed"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6, "merchant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v16, (_QWORD)v28);
          v17 = *(void **)(*(_QWORD *)(a1 + 48) + 488);
          objc_msgSend(v16, "uniqueID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "insertOrUpdateValueAddedServiceTransaction:forPassUniqueIdentifier:paymentTransaction:completion:", v6, v18, *(_QWORD *)(a1 + 56), 0);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);
    }

  }
  else if (objc_msgSend(v6, "error") == 3)
  {
    v19 = *(void **)(a1 + 32);
    objc_msgSend(v6, "merchant");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "_setValueAddedServicePasses:", v22);
    v23 = objc_msgSend(v6, "terminalMode");
    if (!objc_msgSend(*(id *)(a1 + 48), "style") && (v23 == 4 || v23 == 2))
    {
      objc_msgSend(v22, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "uniqueID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "_presentPassWithUniqueIdentifier:additionalPassUniqueIdentifiers:payState:", v27, 0, 5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "_resetCardEmulationWithCompletion:", 0);
      *a4 = 1;
    }

  }
  else if (objc_msgSend(v6, "error") == 1)
  {
    objc_msgSend(v6, "merchantURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (v25)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 488), "insertOrUpdateValueAddedServiceTransaction:forPassUniqueIdentifier:paymentTransaction:completion:", v6, 0, 0, 0);
  }

}

- (void)_retrieveDecryptedBarcodeWithAuthorization:(id)a3 shouldFetchBarcodeIfNecessary:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  BOOL v14;
  id location;

  v8 = a3;
  v9 = a5;
  if (v9 && -[PKPassPaymentContainerView _authenticationAllowed](self, "_authenticationAllowed"))
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __114__PKPassPaymentContainerView__retrieveDecryptedBarcodeWithAuthorization_shouldFetchBarcodeIfNecessary_completion___block_invoke;
    v10[3] = &unk_1E3E76DF0;
    objc_copyWeak(&v13, &location);
    v12 = v9;
    v11 = v8;
    v14 = a4;
    -[PKPassPaymentContainerView _beginSessionExchange:](self, "_beginSessionExchange:", v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __114__PKPassPaymentContainerView__retrieveDecryptedBarcodeWithAuthorization_shouldFetchBarcodeIfNecessary_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "_authenticationAllowed") & 1) != 0)
  {
    if (v6)
    {
      objc_msgSend(v8, "_endSessionExchange");
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      objc_msgSend(v8, "paymentPass");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uniqueID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)v8[61];
      v14 = *(_QWORD *)(a1 + 32);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __114__PKPassPaymentContainerView__retrieveDecryptedBarcodeWithAuthorization_shouldFetchBarcodeIfNecessary_completion___block_invoke_2;
      v16[3] = &unk_1E3E76DC8;
      objc_copyWeak(&v20, (id *)(a1 + 48));
      v19 = *(id *)(a1 + 40);
      v21 = *(_BYTE *)(a1 + 56);
      v15 = v12;
      v17 = v15;
      v18 = *(id *)(a1 + 32);
      objc_msgSend(v13, "retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:authorization:sessionExchangeToken:withCompletion:", v15, v14, v5, v16);

      objc_destroyWeak(&v20);
    }
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], -1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v9 + 16))(v9, 0, 0, v10);

  }
}

void __114__PKPassPaymentContainerView__retrieveDecryptedBarcodeWithAuthorization_shouldFetchBarcodeIfNecessary_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  char v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __114__PKPassPaymentContainerView__retrieveDecryptedBarcodeWithAuthorization_shouldFetchBarcodeIfNecessary_completion___block_invoke_3;
  v14[3] = &unk_1E3E76DA0;
  objc_copyWeak(&v21, (id *)(a1 + 56));
  v10 = *(id *)(a1 + 48);
  v15 = v7;
  v16 = v8;
  v20 = v10;
  v17 = v9;
  v22 = *(_BYTE *)(a1 + 64);
  v18 = *(id *)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

  objc_destroyWeak(&v21);
}

void __114__PKPassPaymentContainerView__retrieveDecryptedBarcodeWithAuthorization_shouldFetchBarcodeIfNecessary_completion___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[16];

  v2 = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v4 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_9;
  objc_msgSend(WeakRetained, "_endSessionExchange");
  objc_msgSend(*(id *)(a1 + 48), "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D69A70]))
  {

LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    goto LABEL_10;
  }
  v6 = objc_msgSend(*(id *)(a1 + 48), "code");

  if (v6 != 3 || !*(_BYTE *)(a1 + 88))
    goto LABEL_9;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "No valid barcode found, trying to fetch barcodes", buf, 2u);
  }

  v8 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __114__PKPassPaymentContainerView__retrieveDecryptedBarcodeWithAuthorization_shouldFetchBarcodeIfNecessary_completion___block_invoke_305;
  v9[3] = &unk_1E3E76D78;
  v11 = *(id *)(a1 + 72);
  objc_copyWeak(&v12, v2);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v4, "_fetchBarcodeForPassUniqueIdentifier:shouldReregisterIfNecessary:withCompletion:", v8, 1, v9);

  objc_destroyWeak(&v12);
LABEL_10:

}

void __114__PKPassPaymentContainerView__retrieveDecryptedBarcodeWithAuthorization_shouldFetchBarcodeIfNecessary_completion___block_invoke_305(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218242;
    v9 = a2;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Fetch barcode completed, fetched %ld, error: %@", (uint8_t *)&v8, 0x16u);
  }

  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_retrieveDecryptedBarcodeWithAuthorization:shouldFetchBarcodeIfNecessary:completion:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));

  }
}

- (void)_fetchBarcodeForPassUniqueIdentifier:(id)a3 shouldReregisterIfNecessary:(BOOL)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  BOOL v14;
  id location;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __110__PKPassPaymentContainerView__fetchBarcodeForPassUniqueIdentifier_shouldReregisterIfNecessary_withCompletion___block_invoke;
    v10[3] = &unk_1E3E76DF0;
    objc_copyWeak(&v13, &location);
    v12 = v9;
    v11 = v8;
    v14 = a4;
    -[PKPassPaymentContainerView _beginSessionExchange:](self, "_beginSessionExchange:", v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __110__PKPassPaymentContainerView__fetchBarcodeForPassUniqueIdentifier_shouldReregisterIfNecessary_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  char v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_msgSend(WeakRetained, "_endSessionExchange");
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v11 = (void *)WeakRetained[61];
      v12 = *(_QWORD *)(a1 + 32);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __110__PKPassPaymentContainerView__fetchBarcodeForPassUniqueIdentifier_shouldReregisterIfNecessary_withCompletion___block_invoke_2;
      v13[3] = &unk_1E3E76E68;
      objc_copyWeak(&v16, (id *)(a1 + 48));
      v15 = *(id *)(a1 + 40);
      v17 = *(_BYTE *)(a1 + 56);
      v14 = *(id *)(a1 + 32);
      objc_msgSend(v11, "fetchBarcodesForPassUniqueIdentifier:sessionExchangeToken:withCompletion:", v12, v5, v13);

      objc_destroyWeak(&v16);
    }
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], -1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

void __110__PKPassPaymentContainerView__fetchBarcodeForPassUniqueIdentifier_shouldReregisterIfNecessary_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__PKPassPaymentContainerView__fetchBarcodeForPassUniqueIdentifier_shouldReregisterIfNecessary_withCompletion___block_invoke_3;
  block[3] = &unk_1E3E76E40;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v9 = *(id *)(a1 + 40);
  v7 = v4;
  v11 = *(_BYTE *)(a1 + 56);
  v8 = *(id *)(a1 + 32);
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
}

void __110__PKPassPaymentContainerView__fetchBarcodeForPassUniqueIdentifier_shouldReregisterIfNecessary_withCompletion___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[16];

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_9;
  objc_msgSend(WeakRetained, "_endSessionExchange");
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D69A70]))
  {

LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_10;
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "code");

  if (v6 != 2 || !*(_BYTE *)(a1 + 64))
    goto LABEL_9;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "No valid certificate when fetching barcode, attempting to re-register auxiliary capability", buf, 2u);
  }

  v8 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __110__PKPassPaymentContainerView__fetchBarcodeForPassUniqueIdentifier_shouldReregisterIfNecessary_withCompletion___block_invoke_307;
  v9[3] = &unk_1E3E76E18;
  objc_copyWeak(&v12, v2);
  v11 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v4, "_reregisterAuxiliaryCapabilityForPassUniqueIdentifier:withCompletion:", v8, v9);

  objc_destroyWeak(&v12);
LABEL_10:

}

void __110__PKPassPaymentContainerView__fetchBarcodeForPassUniqueIdentifier_shouldReregisterIfNecessary_withCompletion___block_invoke_307(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (v5 || !WeakRetained)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    objc_msgSend(WeakRetained, "_fetchBarcodeForPassUniqueIdentifier:shouldReregisterIfNecessary:withCompletion:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));

}

- (void)_reregisterAuxiliaryCapabilityForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __99__PKPassPaymentContainerView__reregisterAuxiliaryCapabilityForPassUniqueIdentifier_withCompletion___block_invoke;
    v8[3] = &unk_1E3E76E90;
    objc_copyWeak(&v11, &location);
    v10 = v7;
    v9 = v6;
    -[PKPassPaymentContainerView _beginSessionExchange:](self, "_beginSessionExchange:", v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __99__PKPassPaymentContainerView__reregisterAuxiliaryCapabilityForPassUniqueIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_msgSend(WeakRetained, "_endSessionExchange");
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v11 = (void *)WeakRetained[61];
      v12 = *(_QWORD *)(a1 + 32);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __99__PKPassPaymentContainerView__reregisterAuxiliaryCapabilityForPassUniqueIdentifier_withCompletion___block_invoke_2;
      v13[3] = &unk_1E3E64320;
      objc_copyWeak(&v15, (id *)(a1 + 48));
      v14 = *(id *)(a1 + 40);
      objc_msgSend(v11, "registerAuxiliaryCapabilityForPassUniqueIdentifier:sessionExchangeToken:withCompletion:", v12, v5, v13);

      objc_destroyWeak(&v15);
    }
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], -1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
}

void __99__PKPassPaymentContainerView__reregisterAuxiliaryCapabilityForPassUniqueIdentifier_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Re-register auxiliary capability finished with error: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PKPassPaymentContainerView__reregisterAuxiliaryCapabilityForPassUniqueIdentifier_withCompletion___block_invoke_308;
  block[3] = &unk_1E3E61478;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
}

void __99__PKPassPaymentContainerView__reregisterAuxiliaryCapabilityForPassUniqueIdentifier_withCompletion___block_invoke_308(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_endSessionExchange");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_dismissBarcodeViewControllerIfNecessaryWithCompletion:(id)a3
{
  id WeakRetained;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_barcodeViewController);
  objc_storeWeak((id *)&self->_barcodeViewController, 0);
  objc_msgSend(WeakRetained, "invalidate");
  objc_msgSend(WeakRetained, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(WeakRetained, "isBeingDismissed") & 1) == 0)
  {
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", -[PKPassPaymentContainerView _isBackgrounded](self, "_isBackgrounded") ^ 1, v6);
  }
  else if (v6)
  {
    v6[2]();
  }

}

- (void)_handleReceivedBarcodePaymentTransaction:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSString *activeBarcodeIdentifier;
  _BOOL8 transactionAuthenticationInProgress;
  int64_t transactionSubstate;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _BYTE location[12];
  __int16 v29;
  _BOOL8 v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  v7 = 21;
  if (!self->_transitioning)
    v7 = 22;
  v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v7]);
  if (self->_activeBarcodeIdentifier
    && (objc_msgSend(v5, "barcodeIdentifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", self->_activeBarcodeIdentifier),
        v9,
        v10)
    && (objc_storeStrong((id *)&self->_transactionForDisplayedBarcode, a3), !self->_transactionAuthenticationInProgress)
    && (v8 & 0xFFFFFFFFFFFFFFFDLL) == 5
    && self->_transactionSubstate <= 1uLL)
  {
    v11 = objc_msgSend(v6, "transactionStatus");
    if (v11)
    {
      if (v11 == 2)
      {
        v22 = (void *)MEMORY[0x1E0D66A58];
        v23 = *MEMORY[0x1E0D69940];
        v37[0] = *MEMORY[0x1E0D698E8];
        v37[1] = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *MEMORY[0x1E0D68AA0];
        v36 = *MEMORY[0x1E0D68B10];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "subjects:sendEvent:", v24, v25);

        -[PKPassPaymentContainerView _endPaymentAuthorizationWithWillUpdateState:](self, "_endPaymentAuthorizationWithWillUpdateState:", 1);
        -[PKPassPaymentContainerView _applyTerminalTransactionSubstateWithSuccess:reset:](self, "_applyTerminalTransactionSubstateWithSuccess:reset:", 0, 1);
        -[PKPassPaymentContainerView _postDidDeauthorizeNotification](self, "_postDidDeauthorizeNotification");
      }
      else if (v11 == 1)
      {
        v12 = (void *)MEMORY[0x1E0D66A58];
        v13 = *MEMORY[0x1E0D69940];
        v40[0] = *MEMORY[0x1E0D698E8];
        v40[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = *MEMORY[0x1E0D68AA0];
        v39 = *MEMORY[0x1E0D68B08];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "subjects:sendEvent:", v14, v15);

        -[PKPassPaymentContainerView _endPaymentAuthorizationWithWillUpdateState:](self, "_endPaymentAuthorizationWithWillUpdateState:", 1);
        objc_msgSend(v6, "awards");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "count"))
        {
          objc_initWeak((id *)location, self);
          v17 = (void *)MEMORY[0x1E0D66B80];
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __71__PKPassPaymentContainerView__handleReceivedBarcodePaymentTransaction___block_invoke;
          v26[3] = &unk_1E3E6F340;
          objc_copyWeak(&v27, (id *)location);
          objc_msgSend(v17, "acquireAssertionOfType:withReason:completion:", 4, CFSTR("Transaction Awards Display"), v26);
          objc_destroyWeak(&v27);
          objc_destroyWeak((id *)location);
        }
        else
        {
          -[PKPassPaymentContainerView _applyTerminalTransactionSubstateWithSuccess:reset:](self, "_applyTerminalTransactionSubstateWithSuccess:reset:", 1, 1);
        }
        -[PKPassPaymentContainerView _postDidDeauthorizeNotification](self, "_postDidDeauthorizeNotification");

      }
    }
    else
    {
      -[PKPassPaymentContainerView _performAuthenticationForTransactionIfNecessary:](self, "_performAuthenticationForTransactionIfNecessary:", v6);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      activeBarcodeIdentifier = self->_activeBarcodeIdentifier;
      transactionAuthenticationInProgress = self->_transactionAuthenticationInProgress;
      transactionSubstate = self->_transactionSubstate;
      *(_DWORD *)location = 138413058;
      *(_QWORD *)&location[4] = activeBarcodeIdentifier;
      v29 = 2048;
      v30 = transactionAuthenticationInProgress;
      v31 = 2048;
      v32 = v8;
      v33 = 2048;
      v34 = transactionSubstate;
      _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Not handling transaction for barcode id: %@, authentication in progress: %ld, terminal state: %ld, transaction substate: %ld", location, 0x2Au);
    }

  }
}

void __71__PKPassPaymentContainerView__handleReceivedBarcodePaymentTransaction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *v8;
  id *WeakRetained;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;

  v6 = a2;
  v7 = a3;
  v8 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __71__PKPassPaymentContainerView__handleReceivedBarcodePaymentTransaction___block_invoke_2;
      v12[3] = &unk_1E3E61310;
      objc_copyWeak(&v13, v8);
      objc_msgSend(v6, "setInvalidationHandler:", v12);
      objc_storeStrong(WeakRetained + 119, a2);
      objc_destroyWeak(&v13);
    }
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __71__PKPassPaymentContainerView__handleReceivedBarcodePaymentTransaction___block_invoke_3;
    v11[3] = &unk_1E3E612E8;
    v11[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], v11);
  }

}

void __71__PKPassPaymentContainerView__handleReceivedBarcodePaymentTransaction___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[119];
    WeakRetained[119] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

uint64_t __71__PKPassPaymentContainerView__handleReceivedBarcodePaymentTransaction___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_applyTerminalTransactionSubstateWithSuccess:reset:", 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "_finishHoldingTerminalTransactionSubstateAfterDelay:", 5.0);
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentPrimaryView");
}

- (void)_performAuthenticationForTransactionIfNecessary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSString *activeBarcodeIdentifier;
  NSObject *v11;
  int v12;
  NSString *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "authenticationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "requestedAuthenticationMechanisms");
  v7 = 21;
  if (!self->_transitioning)
    v7 = 22;
  v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v7]);
  if (!objc_msgSend(v4, "transactionStatus")
    && v6
    && (objc_msgSend(v5, "complete") & 1) == 0
    && PKTransactionAuthenticationMechanismIsValid()
    && (v8 & 0xFFFFFFFFFFFFFFFDLL) == 5)
  {
    if ((v6 & 1) != 0)
    {
      -[PKPassPaymentContainerView _performPaymentPINCollectionForTransaction:](self, "_performPaymentPINCollectionForTransaction:", v4);
    }
    else if ((v6 & 4) != 0)
    {
      -[PKPassPaymentContainerView _performUserConfirmationForTransaction:](self, "_performUserConfirmationForTransaction:", v4);
    }
    else if ((v6 & 8) != 0)
    {
      -[PKPassPaymentContainerView _performApplicationRedirectForTransaction:](self, "_performApplicationRedirectForTransaction:", v4);
    }
    else if ((v6 & 2) != 0)
    {
      -[PKPassPaymentContainerView _performTransactionSignatureSubmissionForTransaction:](self, "_performTransactionSignatureSubmissionForTransaction:", v4);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Unsupported transaction authentication mechanism for UI", (uint8_t *)&v12, 2u);
      }

    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      activeBarcodeIdentifier = self->_activeBarcodeIdentifier;
      v12 = 138413314;
      v13 = activeBarcodeIdentifier;
      v14 = 2048;
      v15 = objc_msgSend(v4, "transactionStatus");
      v16 = 2048;
      v17 = v6;
      v18 = 2048;
      v19 = objc_msgSend(v5, "complete");
      v20 = 2048;
      v21 = v8;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Not performing transaction authentication for barcode id %@, transaction status %ld, authentication mechanisms: %ld, authentication complete: %ld, terminal state: %ld", (uint8_t *)&v12, 0x34u);
    }

  }
}

- (void)_performTransactionSignatureSubmissionForTransaction:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  -[PKPassPaymentContainerView _setTransactionAuthenticationInProgress:](self, "_setTransactionAuthenticationInProgress:", 1);
  -[PKPassPaymentContainerView _applyPaymentIndefiniteSuccessState](self, "_applyPaymentIndefiniteSuccessState");
  objc_initWeak(&location, self);
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__PKPassPaymentContainerView__performTransactionSignatureSubmissionForTransaction___block_invoke;
  v6[3] = &unk_1E3E76EB8;
  objc_copyWeak(&v7, &location);
  -[PKPassPaymentContainerView _submitSignatureForTransactionIdentifier:completion:](self, "_submitSignatureForTransactionIdentifier:completion:", v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __83__PKPassPaymentContainerView__performTransactionSignatureSubmissionForTransaction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_setTransactionAuthenticationInProgress:", 0);
    if (a3)
    {
      objc_msgSend(v6, "_endPaymentAuthorizationWithWillUpdateState:", 1);
      objc_msgSend(v6, "_applyTerminalTransactionSubstateWithSuccess:reset:", 0, 1);
    }
    else
    {
      objc_msgSend(v6, "_handleReceivedBarcodePaymentTransaction:", v7);
    }
  }

}

- (void)_submitSignatureForTransactionIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD aBlock[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  v7 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v8 = MEMORY[0x1E0C809B0];
  v26 = *MEMORY[0x1E0DC4878];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E3E62060;
  aBlock[4] = &v23;
  v9 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_2;
  v20[3] = &unk_1E3E61590;
  v11 = v7;
  v21 = v11;
  v12 = objc_msgSend(v10, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Submit Transaction Details Signature"), v20);
  v24[3] = v12;

  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_3;
  v16[3] = &unk_1E3E76F80;
  v16[4] = self;
  v13 = v9;
  v18 = v13;
  v14 = v11;
  v19 = v14;
  v15 = v6;
  v17 = v15;
  -[PKPassPaymentContainerView _beginSessionExchange:](self, "_beginSessionExchange:", v16);

  _Block_object_dispose(&v23, 8);
}

void __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *MEMORY[0x1E0DC4878];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = *MEMORY[0x1E0D6A758];
    v6 = *MEMORY[0x1E0CB2938];
    v7[0] = CFSTR("Submit transaction details signature background task timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v5);

  }
}

void __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  char v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  v9 = !v8;
  if (!v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_endSessionExchange");
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 512))
    {
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v7;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Not submitting transaction details signature due to begin session exchange failure: %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v11 = *(_QWORD *)(a1 + 56);
      if (v11)
        (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v7);
      goto LABEL_17;
    }

    v5 = 0;
  }
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v5;
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Submitting transaction details signature with token: %@", buf, 0xCu);
  }

  v13 = *(void **)(a1 + 40);
  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 488);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_318;
  v17[3] = &unk_1E3E76F58;
  v15 = v13;
  v22 = v9;
  v16 = *(_QWORD *)(a1 + 32);
  v18 = v15;
  v19 = v16;
  v20 = *(id *)(a1 + 48);
  v21 = *(id *)(a1 + 56);
  objc_msgSend(v14, "submitTransactionSignatureForTransactionIdentifier:sessionExchangeToken:completion:", v15, v5, v17);

LABEL_17:
}

void __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_318(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "transactionStatus");
    PKPaymentTransactionStatusToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "authenticationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v22 = v8;
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Submitted transaction details signature for transaction %@, updated transaction status: %@, updated authentication context %@, error: %@", buf, 0x2Au);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_319;
  block[3] = &unk_1E3E76F30;
  v20 = *(_BYTE *)(a1 + 64);
  v11 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v15 = v6;
  v18 = v11;
  v19 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 32);
  v17 = v5;
  v12 = v5;
  v13 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_319(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  if (!*(_BYTE *)(a1 + 80))
    objc_msgSend(*(id *)(a1 + 32), "_endSessionExchange");
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D69A70]))
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "code");

    if (v3 == 2)
    {
      v4 = *(void **)(a1 + 32);
      objc_msgSend(v4, "paymentPass");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_2_320;
      v10[3] = &unk_1E3E76F08;
      v12 = *(id *)(a1 + 64);
      v7 = *(id *)(a1 + 72);
      v8 = *(_QWORD *)(a1 + 32);
      v13 = v7;
      v10[4] = v8;
      v11 = *(id *)(a1 + 48);
      objc_msgSend(v4, "_reregisterAuxiliaryCapabilityForPassUniqueIdentifier:withCompletion:", v6, v10);

      return;
    }
  }
  else
  {

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v9 = *(_QWORD *)(a1 + 72);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v9 + 16))(v9, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

void __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_2_320(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_3_321;
  block[3] = &unk_1E3E76EE0;
  v12 = *(id *)(a1 + 48);
  v9 = v3;
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v13 = v4;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_3_321(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (!*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "_submitSignatureForTransactionIdentifier:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_performPaymentPINCollectionForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  PKTransactionAuthenticationPasscodeViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  PKTransactionAuthenticationPasscodeViewController *v13;
  PKTransactionAuthenticationPasscodeViewController *v14;
  _QWORD v15[4];
  PKTransactionAuthenticationPasscodeViewController *v16;
  id v17;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D66A58], "archivedSessionTokenForSubject:", *MEMORY[0x1E0D69940]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D66A58], "archivedSessionTokenForSubject:", *MEMORY[0x1E0D698E8]);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = [PKTransactionAuthenticationPasscodeViewController alloc];
  -[PKPassFooterContentView paymentPass](self, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PKTransactionAuthenticationPasscodeViewController initWithPassUniqueIdentifier:transactionIdentifier:archivedAnalyticsSessionToken:](v9, "initWithPassUniqueIdentifier:transactionIdentifier:archivedAnalyticsSessionToken:", v11, v12, v8);

  -[PKTransactionAuthenticationPasscodeViewController setDelegate:](v13, "setDelegate:", self);
  objc_initWeak(&location, self);
  -[PKPassPaymentContainerView _setTransactionAuthenticationInProgress:](self, "_setTransactionAuthenticationInProgress:", 1);
  objc_storeWeak((id *)&self->_activeTransactionAuthenticationViewController, v13);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__PKPassPaymentContainerView__performPaymentPINCollectionForTransaction___block_invoke;
  v15[3] = &unk_1E3E61B68;
  objc_copyWeak(&v17, &location);
  v14 = v13;
  v16 = v14;
  -[PKPassPaymentContainerView _dismissBarcodeViewControllerIfNecessaryWithCompletion:](self, "_dismissBarcodeViewControllerIfNecessaryWithCompletion:", v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __73__PKPassPaymentContainerView__performPaymentPINCollectionForTransaction___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pkui_viewControllerFromResponderChain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__PKPassPaymentContainerView__performPaymentPINCollectionForTransaction___block_invoke_2;
  v6[3] = &unk_1E3E61310;
  objc_copyWeak(&v7, v2);
  objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, v6);

  objc_destroyWeak(&v7);
}

void __73__PKPassPaymentContainerView__performPaymentPINCollectionForTransaction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setTransactionAuthenticationUIActive:", 1);

}

- (void)_performApplicationRedirectForTransaction:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD);
  NSMutableArray *linkedApplicationUpdateCompletionHandlers;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD aBlock[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke;
  aBlock[3] = &unk_1E3E61B68;
  objc_copyWeak(&v17, &location);
  v6 = v4;
  v16 = v6;
  v7 = _Block_copy(aBlock);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_5;
  v12[3] = &unk_1E3E61C80;
  objc_copyWeak(&v14, &location);
  v8 = v7;
  v13 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(v12);
  -[PKPassPaymentContainerView _setTransactionAuthenticationInProgress:](self, "_setTransactionAuthenticationInProgress:", 1);
  if (-[PKLinkedApplication state](self->_linkedApplication, "state"))
  {
    v9[2](v9);
  }
  else
  {
    linkedApplicationUpdateCompletionHandlers = self->_linkedApplicationUpdateCompletionHandlers;
    v11 = _Block_copy(v9);
    -[NSMutableArray addObject:](linkedApplicationUpdateCompletionHandlers, "addObject:", v11);

    -[PKLinkedApplication reloadApplicationStateIfNecessary](self->_linkedApplication, "reloadApplicationStateIfNecessary");
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  char v35;
  _QWORD v36[4];
  id v37[2];

  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "pkui_viewControllerFromResponderChain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4[128], "state") != 1 || v5 == 0)
    {
      objc_msgSend(v4, "_setTransactionAuthenticationInProgress:", 0);
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedAquamanString(CFSTR("CANCEL"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_2;
      v36[3] = &unk_1E3E63F88;
      objc_copyWeak(v37, v2);
      objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, v36);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "paymentPass");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "organizationName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v4[128], "isInstalled");
      v11 = v10;
      if (v10)
      {
        PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_APP_REDIRECT_TITLE"), CFSTR("%@"), v28);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "currencyAmount");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "formattedStringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "merchant");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "displayName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_APP_REDIRECT_MESSAGE"), CFSTR("%@%@%@"), v13, v15, v28);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedAquamanString(CFSTR("OPEN"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (id *)MEMORY[0x1E0D68768];
      }
      else
      {
        PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_APP_REQUIRED_TITLE"), CFSTR("%@"), v28);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "merchant");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "displayName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_APP_REQUIRED_MESSAGE"), CFSTR("%@%@"), v19, v28);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedAquamanString(CFSTR("VIEW_IN_APP_STORE"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (id *)MEMORY[0x1E0D68770];
      }
      v20 = *v17;
      v21 = (void *)MEMORY[0x1E0DC3448];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_3;
      v31[3] = &unk_1E3E76FA8;
      objc_copyWeak(&v34, v2);
      v22 = v20;
      v32 = v22;
      v35 = v11;
      v33 = *(id *)(a1 + 32);
      objc_msgSend(v21, "actionWithTitle:style:handler:", v16, 0, v31);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v27, v26, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addAction:", v25);
      objc_msgSend(v24, "addAction:", v23);
      objc_msgSend(v24, "setPreferredAction:", v23);
      objc_storeWeak(v4 + 122, v24);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_4;
      v29[3] = &unk_1E3E61310;
      objc_copyWeak(&v30, v2);
      objc_msgSend(v5, "presentViewController:animated:completion:", v24, 1, v29);
      objc_destroyWeak(&v30);

      objc_destroyWeak(&v34);
      objc_destroyWeak(v37);
    }

  }
}

void __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1E0D66A58];
    v3 = *MEMORY[0x1E0D698E8];
    v10[0] = *MEMORY[0x1E0D69940];
    v10[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0D68858];
    v8[0] = *MEMORY[0x1E0D68AA0];
    v8[1] = v5;
    v6 = *MEMORY[0x1E0D68760];
    v9[0] = *MEMORY[0x1E0D68B18];
    v9[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "subjects:sendEvent:", v4, v7);

    objc_msgSend(WeakRetained, "_setTransactionAuthenticationUIActive:", 0);
    objc_msgSend(WeakRetained, "_cancelTransactionAuthentication");
  }

}

void __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1E0D66A58];
    v4 = *MEMORY[0x1E0D698E8];
    v21[0] = *MEMORY[0x1E0D69940];
    v21[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D68B18];
    v7 = *MEMORY[0x1E0D68858];
    v19[0] = *MEMORY[0x1E0D68AA0];
    v19[1] = v7;
    v8 = *(_QWORD *)(a1 + 32);
    v20[0] = v6;
    v20[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subjects:sendEvent:", v5, v9);

    if (*(_BYTE *)(a1 + 56))
    {
      v10 = (void *)WeakRetained[61];
      objc_msgSend(WeakRetained, "paymentPass");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uniqueID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transactionsAppLaunchTokenForPassWithUniqueIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(WeakRetained, "paymentPass");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentNotificationAppURLHelper appURLForTransactionNotification:excludeTransactionIdentifier:pass:pathSuffix:appLaunchToken:](PKPaymentNotificationAppURLHelper, "appURLForTransactionNotification:excludeTransactionIdentifier:pass:pathSuffix:appLaunchToken:", v14, 0, v15, CFSTR("/authenticate"), v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    v17 = (void *)WeakRetained[128];
    objc_msgSend(WeakRetained, "pkui_viewControllerFromResponderChain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "openApplication:withLaunchOptions:launchURL:", v18, 0, v16);

    objc_msgSend(WeakRetained, "_endPaymentAuthorizationWithWillUpdateState:", 1);
    objc_msgSend(WeakRetained, "_resetToIdleState");

  }
}

void __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setTransactionAuthenticationUIActive:", 1);

}

void __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_6;
  v3[3] = &unk_1E3E61590;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_dismissBarcodeViewControllerIfNecessaryWithCompletion:", v3);

}

uint64_t __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performUserConfirmationForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id location[2];

  v4 = a3;
  -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_initWeak(location, self);
    v6 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_USER_CONFIRMATION_NO"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke;
    v29[3] = &unk_1E3E63F88;
    objc_copyWeak(&v30, location);
    objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, v29);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_USER_CONFIRMATION_YES"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)v8;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke_2;
    v26[3] = &unk_1E3E69FE8;
    objc_copyWeak(&v28, location);
    v12 = v4;
    v27 = v12;
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "currencyAmount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "formattedStringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "merchant");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_USER_CONFIRMATION_MESSAGE"), CFSTR("%@%@"), v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_USER_CONFIRMATION_TITLE"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "alertControllerWithTitle:message:preferredStyle:", v20, v18, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "addAction:", v11);
    objc_msgSend(v21, "addAction:", v13);
    objc_msgSend(v21, "setPreferredAction:", v13);
    -[PKPassPaymentContainerView _setTransactionAuthenticationInProgress:](self, "_setTransactionAuthenticationInProgress:", 1);
    objc_storeWeak((id *)&self->_activeTransactionAuthenticationViewController, v21);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke_4;
    v23[3] = &unk_1E3E61B68;
    objc_copyWeak(&v25, location);
    v22 = v21;
    v24 = v22;
    -[PKPassPaymentContainerView _dismissBarcodeViewControllerIfNecessaryWithCompletion:](self, "_dismissBarcodeViewControllerIfNecessaryWithCompletion:", v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak(location);
  }

}

void __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1E0D66A58];
    v3 = *MEMORY[0x1E0D698E8];
    v10[0] = *MEMORY[0x1E0D69940];
    v10[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0D68858];
    v8[0] = *MEMORY[0x1E0D68AA0];
    v8[1] = v5;
    v6 = *MEMORY[0x1E0D69628];
    v9[0] = *MEMORY[0x1E0D68B18];
    v9[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "subjects:sendEvent:", v4, v7);

    objc_msgSend(WeakRetained, "_setTransactionAuthenticationUIActive:", 0);
    objc_msgSend(WeakRetained, "_cancelTransactionAuthentication");
  }

}

void __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = (void *)MEMORY[0x1E0D66A58];
    v7 = *MEMORY[0x1E0D698E8];
    v18[0] = *MEMORY[0x1E0D69940];
    v18[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D68B18];
    v10 = *MEMORY[0x1E0D68858];
    v16[0] = *MEMORY[0x1E0D68AA0];
    v16[1] = v10;
    v11 = *MEMORY[0x1E0D69630];
    v17[0] = v9;
    v17[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subjects:sendEvent:", v8, v12);

    objc_msgSend(WeakRetained, "_setTransactionAuthenticationUIActive:", 0);
    objc_msgSend(WeakRetained, "_applyPaymentIndefiniteSuccessState");
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke_3;
    v14[3] = &unk_1E3E76EB8;
    objc_copyWeak(&v15, v4);
    objc_msgSend(WeakRetained, "_submitUserConfirmation:forTransactionIdentifier:completion:", 1, v13, v14);

    objc_destroyWeak(&v15);
  }

}

void __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_setTransactionAuthenticationInProgress:", 0);
    if (a3)
    {
      objc_msgSend(v6, "_endPaymentAuthorizationWithWillUpdateState:", 1);
      objc_msgSend(v6, "_applyTerminalTransactionSubstateWithSuccess:reset:", 0, 1);
    }
    else
    {
      objc_msgSend(v6, "_handleReceivedBarcodePaymentTransaction:", v7);
    }
  }

}

void __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pkui_viewControllerFromResponderChain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke_5;
  v6[3] = &unk_1E3E61310;
  objc_copyWeak(&v7, v2);
  objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, v6);

  objc_destroyWeak(&v7);
}

void __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setTransactionAuthenticationUIActive:", 1);

}

- (void)_submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;
  _QWORD v23[4];
  id v24;
  _QWORD aBlock[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v8 = a4;
  v9 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v10 = MEMORY[0x1E0C809B0];
  v29 = *MEMORY[0x1E0DC4878];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E3E62060;
  aBlock[4] = &v26;
  v11 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_2;
  v23[3] = &unk_1E3E61590;
  v13 = v9;
  v24 = v13;
  v14 = objc_msgSend(v12, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Submit User Confirmation"), v23);
  v27[3] = v14;

  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_3;
  v18[3] = &unk_1E3E77070;
  v18[4] = self;
  v15 = v11;
  v20 = v15;
  v16 = v13;
  v21 = v16;
  v17 = v8;
  v19 = v17;
  v22 = a3;
  -[PKPassPaymentContainerView _beginSessionExchange:](self, "_beginSessionExchange:", v18);

  _Block_object_dispose(&v26, 8);
}

void __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *MEMORY[0x1E0DC4878];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = *MEMORY[0x1E0D6A758];
    v6 = *MEMORY[0x1E0CB2938];
    v7[0] = CFSTR("Submit user confirmation background task timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v5);

  }
}

void __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  char v22;
  char v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  v9 = !v8;
  if (!v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_endSessionExchange");
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 512))
    {
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v7;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Not submitting user confirmation due to begin session exchange failure: %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v11 = *(_QWORD *)(a1 + 56);
      if (v11)
        (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v7);
      goto LABEL_17;
    }

    v5 = 0;
  }
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v5;
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Submitting user confirmation with token: %@", buf, 0xCu);
  }

  v13 = *(void **)(a1 + 40);
  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 488);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_356;
  v17[3] = &unk_1E3E77048;
  v15 = v13;
  v22 = v9;
  v16 = *(_QWORD *)(a1 + 32);
  v18 = v15;
  v19 = v16;
  v20 = *(id *)(a1 + 48);
  v21 = *(id *)(a1 + 56);
  v23 = *(_BYTE *)(a1 + 64);
  objc_msgSend(v14, "submitUserConfirmation:forTransactionIdentifier:sessionExchangeToken:completion:", 1, v15, v5, v17);

LABEL_17:
}

void __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_356(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  char v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "transactionStatus");
    PKPaymentTransactionStatusToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "authenticationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Submitted user confirmation YES for transaction %@, updated transaction status: %@, updated authentication context %@, error: %@", buf, 0x2Au);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_357;
  block[3] = &unk_1E3E77020;
  v20 = *(_BYTE *)(a1 + 64);
  v11 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v15 = v6;
  v18 = v11;
  v19 = *(id *)(a1 + 56);
  v21 = *(_BYTE *)(a1 + 65);
  v16 = *(id *)(a1 + 32);
  v17 = v5;
  v12 = v5;
  v13 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_357(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  char v14;

  if (!*(_BYTE *)(a1 + 80))
    objc_msgSend(*(id *)(a1 + 32), "_endSessionExchange");
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D69A70]))
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "code");

    if (v3 == 2)
    {
      v4 = *(void **)(a1 + 32);
      objc_msgSend(v4, "paymentPass");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_2_358;
      v10[3] = &unk_1E3E76FF8;
      v12 = *(id *)(a1 + 64);
      v7 = *(id *)(a1 + 72);
      v8 = *(_QWORD *)(a1 + 32);
      v13 = v7;
      v10[4] = v8;
      v14 = *(_BYTE *)(a1 + 81);
      v11 = *(id *)(a1 + 48);
      objc_msgSend(v4, "_reregisterAuxiliaryCapabilityForPassUniqueIdentifier:withCompletion:", v6, v10);

      return;
    }
  }
  else
  {

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v9 = *(_QWORD *)(a1 + 72);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v9 + 16))(v9, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

void __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_2_358(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  char v14;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_3_359;
  v8[3] = &unk_1E3E76FD0;
  v12 = *(id *)(a1 + 48);
  v9 = v3;
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v13 = v4;
  v10 = v5;
  v14 = *(_BYTE *)(a1 + 64);
  v11 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_3_359(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (!*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "_submitUserConfirmation:forTransactionIdentifier:completion:", *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_setTransactionAuthenticationInProgress:(BOOL)a3
{
  if (((!self->_transactionAuthenticationInProgress ^ a3) & 1) == 0)
    self->_transactionAuthenticationInProgress = a3;
}

- (void)_setTransactionAuthenticationUIActive:(BOOL)a3
{
  NSObject *barcodeDisplayTimer;

  if (((!self->_transactionAuthenticationUIActive ^ a3) & 1) == 0)
  {
    self->_transactionAuthenticationUIActive = a3;
    barcodeDisplayTimer = self->_barcodeDisplayTimer;
    if (barcodeDisplayTimer)
    {
      if (a3)
        dispatch_suspend(barcodeDisplayTimer);
      else
        dispatch_resume(barcodeDisplayTimer);
    }
  }
}

- (void)_resetTransactionAuthenticationIfNecessary
{
  UIViewController **p_activeTransactionAuthenticationViewController;
  void *v4;
  char v5;
  id WeakRetained;

  p_activeTransactionAuthenticationViewController = &self->_activeTransactionAuthenticationViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeTransactionAuthenticationViewController);
  objc_storeWeak((id *)p_activeTransactionAuthenticationViewController, 0);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(WeakRetained, "isBeingDismissed");
    if (v4 && (v5 & 1) == 0)
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", -[PKPassPaymentContainerView _isBackgrounded](self, "_isBackgrounded") ^ 1, 0);

  }
  -[PKPassPaymentContainerView _setTransactionAuthenticationUIActive:](self, "_setTransactionAuthenticationUIActive:", 0);
  -[PKPassPaymentContainerView _setTransactionAuthenticationInProgress:](self, "_setTransactionAuthenticationInProgress:", 0);

}

- (void)_cancelTransactionAuthentication
{
  void *v3;

  -[PKPassPaymentContainerView _setTransactionAuthenticationInProgress:](self, "_setTransactionAuthenticationInProgress:", 0);
  -[PKPassPaymentContainerView _endPaymentAuthorizationWithWillUpdateState:](self, "_endPaymentAuthorizationWithWillUpdateState:", 1);
  PKLocalizedAquamanString(CFSTR("PAYMENT_ERROR_USER_CANCELED"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassPaymentContainerView _applyPayState:withTextOverride:](self, "_applyPayState:withTextOverride:", 9, v3);

  -[PKPassPaymentContainerView _resetToIdleStateAfterDelay:](self, "_resetToIdleStateAfterDelay:", 4.0);
}

- (void)passcodeViewController:(id)a3 requestSessionExchangeTokenWithHandler:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __92__PKPassPaymentContainerView_passcodeViewController_requestSessionExchangeTokenWithHandler___block_invoke;
    v7[3] = &unk_1E3E61850;
    v7[4] = self;
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

void __92__PKPassPaymentContainerView_passcodeViewController_requestSessionExchangeTokenWithHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __92__PKPassPaymentContainerView_passcodeViewController_requestSessionExchangeTokenWithHandler___block_invoke_2;
  v2[3] = &unk_1E3E77098;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_beginSessionExchange:", v2);

}

void __92__PKPassPaymentContainerView_passcodeViewController_requestSessionExchangeTokenWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  uint8_t v9[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Failed to obtain session exchange token for passcode encryption", v9, 2u);
    }

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v8();

}

- (void)passcodeViewControllerDidEndSessionExchange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKPassPaymentContainerView_passcodeViewControllerDidEndSessionExchange___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __74__PKPassPaymentContainerView_passcodeViewControllerDidEndSessionExchange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endSessionExchange");
}

- (void)passcodeViewControllerDidCancel:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PKPassPaymentContainerView_passcodeViewControllerDidCancel___block_invoke;
  v6[3] = &unk_1E3E62F50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_copyWeak(&v8, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __62__PKPassPaymentContainerView_passcodeViewControllerDidCancel___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__PKPassPaymentContainerView_passcodeViewControllerDidCancel___block_invoke_2;
  v3[3] = &unk_1E3E61310;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  objc_msgSend(v1, "_dismissTransactionAuthenticationPasscodeViewController:withCompletion:", v2, v3);
  objc_destroyWeak(&v4);
}

void __62__PKPassPaymentContainerView_passcodeViewControllerDidCancel___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cancelTransactionAuthentication");
    WeakRetained = v2;
  }

}

- (void)passcodeViewController:(id)a3 didGenerateEncryptedPasscode:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  PKPassPaymentContainerView *v16;
  id v17;
  id v18;
  _QWORD aBlock[4];
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke;
  aBlock[3] = &unk_1E3E61B68;
  objc_copyWeak(&v21, &location);
  v9 = v6;
  v20 = v9;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_3;
  v13[3] = &unk_1E3E77138;
  v14 = v7;
  v15 = v9;
  v16 = self;
  v17 = _Block_copy(aBlock);
  v10 = v9;
  v11 = v17;
  v12 = v7;
  objc_copyWeak(&v18, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v13);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_2;
    v5[3] = &unk_1E3E61310;
    objc_copyWeak(&v6, v2);
    objc_msgSend(WeakRetained, "_dismissTransactionAuthenticationPasscodeViewController:withCompletion:", v4, v5);
    objc_destroyWeak(&v6);
  }

}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_setTransactionAuthenticationInProgress:", 0);
    objc_msgSend(v2, "_endPaymentAuthorizationWithWillUpdateState:", 1);
    objc_msgSend(v2, "_applyTerminalTransactionSubstateWithSuccess:reset:", 0, 1);
    WeakRetained = v2;
  }

}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "transactionIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "passUniqueIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_applyPaymentIndefiniteSuccessState");
    v4 = *(void **)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_4;
    v8[3] = &unk_1E3E77110;
    objc_copyWeak(&v13, (id *)(a1 + 64));
    v6 = v3;
    v9 = v6;
    v7 = v2;
    v10 = v7;
    v12 = *(id *)(a1 + 56);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v4, "_submitEncryptedPIN:forTransactionIdentifier:completion:", v5, v7, v8);

    objc_destroyWeak(&v13);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_5;
  block[3] = &unk_1E3E770E8;
  objc_copyWeak(&v16, a1 + 8);
  v10 = v5;
  v11 = a1[4];
  v12 = a1[5];
  v13 = v6;
  v15 = a1[7];
  v14 = a1[6];
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v16);
}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_5(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int ShouldAuthenticateForMechanism;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id *location;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  char v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 80);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[117];
    objc_msgSend(*(id *)(a1 + 32), "barcodeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "isEqual:", v6);

    if ((_DWORD)v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "authenticationContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        v9 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 32), "transactionStatus");
        PKPaymentTransactionStatusToString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138413314;
        v52 = v10;
        v53 = 2112;
        v54 = v9;
        v55 = 2112;
        v56 = v11;
        v57 = 2112;
        v58 = v7;
        v59 = 2112;
        v60 = v12;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Submited payment PIN for pass %@, transaction %@, updated transaction status %@, updated authentication context %@, error: %@", buf, 0x34u);

      }
      if (*(_QWORD *)(a1 + 56))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      }
      else
      {
        v13 = v4[128];
        v14 = objc_msgSend(v7, "requestedAuthenticationMechanisms");
        if (objc_msgSend(v7, "authenticationFailure") == 2
          && objc_msgSend(*(id *)(a1 + 32), "transactionStatus") != 1
          && v14 <= 1
          && objc_msgSend(v13, "state") == 1)
        {
          v15 = (void *)MEMORY[0x1E0DC3448];
          PKLocalizedAquamanString(CFSTR("CANCEL"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = MEMORY[0x1E0C809B0];
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_362;
          v48[3] = &unk_1E3E69FE8;
          objc_copyWeak(&v50, v2);
          v49 = *(id *)(a1 + 64);
          objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, v48);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = objc_msgSend(v13, "isInstalled");
          objc_msgSend(v4, "paymentPass");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            v20 = CFSTR("OPEN");
          else
            v20 = CFSTR("VIEW_IN_APP_STORE");
          PKLocalizedAquamanString(&v20->isa);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x1E0DC3448];
          v41[0] = v17;
          v41[1] = 3221225472;
          v41[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_3_364;
          v41[3] = &unk_1E3E770C0;
          objc_copyWeak(&v46, v2);
          v47 = v18;
          v42 = *(id *)(a1 + 40);
          v43 = *(id *)(a1 + 32);
          v31 = v19;
          v44 = v31;
          v45 = v13;
          objc_msgSend(v21, "actionWithTitle:style:handler:", v35, 0, v41);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "paymentPass");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "organizationName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_APP_REDIRECT_TITLE"), CFSTR("%@"), v24, v31, &v46);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_PIN_EXCEEDED_MAX_TRIES_BODY"), CFSTR("%@"), v24);
          }
          else
          {
            PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_APP_REQUIRED_TITLE"), CFSTR("%@"), v24, v31, &v46);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_PIN_EXCEEDED_MAX_TRIES_BODY_DOWNLOAD_APP"), CFSTR("%@"), v24);
          }
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v25, v29, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addAction:", v22);
          objc_msgSend(v30, "addAction:", v34);
          objc_msgSend(v30, "setPreferredAction:", v22);
          objc_msgSend(*(id *)(a1 + 64), "presentViewController:animated:completion:", v30, 1, 0);

          objc_destroyWeak(location);
          objc_destroyWeak(&v50);
        }
        else
        {
          ShouldAuthenticateForMechanism = PKPaymentTransactionShouldAuthenticateForMechanism();
          v27 = *(void **)(a1 + 64);
          if (ShouldAuthenticateForMechanism)
          {
            v28 = objc_msgSend(v7, "authenticationFailure");
            v39[0] = MEMORY[0x1E0C809B0];
            v39[1] = 3221225472;
            v39[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_4_371;
            v39[3] = &unk_1E3E614F0;
            v40 = *(id *)(a1 + 72);
            objc_msgSend(v27, "resetWithTransactionAuthenticationFailure:completion:", v28, v39);

          }
          else
          {
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_5_372;
            v36[3] = &unk_1E3E61B68;
            objc_copyWeak(&v38, v2);
            v37 = *(id *)(a1 + 32);
            objc_msgSend(v4, "_dismissTransactionAuthenticationPasscodeViewController:withCompletion:", v27, v36);

            objc_destroyWeak(&v38);
          }
        }

      }
    }
  }

}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_362(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x1E0D66A58];
    v6 = *MEMORY[0x1E0D698E8];
    v17[0] = *MEMORY[0x1E0D69940];
    v17[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0D68B18];
    v9 = *MEMORY[0x1E0D68858];
    v15[0] = *MEMORY[0x1E0D68AA0];
    v15[1] = v9;
    v10 = *MEMORY[0x1E0D68EF8];
    v16[0] = v8;
    v16[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subjects:sendEvent:", v7, v11);

    v12 = *(_QWORD *)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_2_363;
    v13[3] = &unk_1E3E61310;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_dismissTransactionAuthenticationPasscodeViewController:withCompletion:", v12, v13);
    objc_destroyWeak(&v14);
  }

}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_2_363(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cancelTransactionAuthentication");
    WeakRetained = v2;
  }

}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_3_364(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1E0D66A58];
    v4 = *MEMORY[0x1E0D698E8];
    v17[0] = *MEMORY[0x1E0D69940];
    v17[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D68B18];
    v7 = *MEMORY[0x1E0D68858];
    v15[0] = *MEMORY[0x1E0D68AA0];
    v15[1] = v7;
    v8 = (uint64_t *)MEMORY[0x1E0D68F08];
    if (*(_BYTE *)(a1 + 72))
      v8 = (uint64_t *)MEMORY[0x1E0D68F00];
    v9 = *v8;
    v16[0] = v6;
    v16[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subjects:sendEvent:", v5, v10);

    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(WeakRetained[61], "transactionsAppLaunchTokenForPassWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentNotificationAppURLHelper appURLForTransactionNotification:excludeTransactionIdentifier:pass:pathSuffix:appLaunchToken:](PKPaymentNotificationAppURLHelper, "appURLForTransactionNotification:excludeTransactionIdentifier:pass:pathSuffix:appLaunchToken:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48), CFSTR("/resetPaymentCredential"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    v13 = *(void **)(a1 + 56);
    objc_msgSend(WeakRetained, "pkui_viewControllerFromResponderChain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "openApplication:withLaunchOptions:launchURL:", v14, 1, v12);

  }
}

uint64_t __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_4_371(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_5_372(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_setTransactionAuthenticationInProgress:", 0);
    objc_msgSend(v3, "_handleReceivedBarcodePaymentTransaction:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD aBlock[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v11 = MEMORY[0x1E0C809B0];
  v31 = *MEMORY[0x1E0DC4878];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E3E62060;
  aBlock[4] = &v28;
  v12 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  v25[1] = 3221225472;
  v25[2] = __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_2;
  v25[3] = &unk_1E3E61590;
  v14 = v10;
  v26 = v14;
  v15 = objc_msgSend(v13, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Submit Encrypted PIN"), v25);
  v29[3] = v15;

  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_3;
  v20[3] = &unk_1E3E77200;
  v20[4] = self;
  v16 = v12;
  v23 = v16;
  v17 = v14;
  v24 = v17;
  v18 = v8;
  v21 = v18;
  v19 = v9;
  v22 = v19;
  -[PKPassPaymentContainerView _beginSessionExchange:](self, "_beginSessionExchange:", v20);

  _Block_object_dispose(&v28, 8);
}

void __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *MEMORY[0x1E0DC4878];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = *MEMORY[0x1E0D6A758];
    v6 = *MEMORY[0x1E0CB2938];
    v7[0] = CFSTR("Submit encrypted PIN task timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v5);

  }
}

void __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  char v9;
  NSObject *v10;
  void (**v11)(id, _QWORD, void *);
  _QWORD *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  v9 = !v8;
  if (v8)
    goto LABEL_14;
  objc_msgSend(a1[4], "_endSessionExchange");
  if (!*((_QWORD *)a1[4] + 64))
  {

    v5 = 0;
LABEL_14:
    v12 = a1[4];
    v13 = a1[5];
    v14 = (void *)v12[61];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_377;
    v16[3] = &unk_1E3E771D8;
    v21 = v9;
    v16[4] = v12;
    v15 = a1[6];
    v19 = a1[7];
    v20 = a1[8];
    v17 = a1[5];
    v18 = a1[6];
    objc_msgSend(v14, "submitEncryptedPIN:forTransactionIdentifier:sessionExchangeToken:completion:", v13, v15, v5, v16);

    goto LABEL_15;
  }
  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v7;
    _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Not submitting encrypted PIN due to begin session exchange failure: %@", buf, 0xCu);
  }

  (*((void (**)(void))a1[7] + 2))();
  v11 = (void (**)(id, _QWORD, void *))a1[8];
  if (v11)
    v11[2](v11, 0, v7);
LABEL_15:

}

void __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_377(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_2_378;
  v9[3] = &unk_1E3E771B0;
  v16 = *(_BYTE *)(a1 + 72);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_2_378(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;

  if (!*(_BYTE *)(a1 + 88))
    objc_msgSend(*(id *)(a1 + 32), "_endSessionExchange");
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D69A70]))
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "code");

    if (v3 == 2)
    {
      v4 = *(void **)(a1 + 32);
      objc_msgSend(v4, "paymentPass");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_3_379;
      v10[3] = &unk_1E3E77188;
      v13 = *(id *)(a1 + 72);
      v7 = *(id *)(a1 + 80);
      v8 = *(_QWORD *)(a1 + 32);
      v14 = v7;
      v10[4] = v8;
      v11 = *(id *)(a1 + 48);
      v12 = *(id *)(a1 + 56);
      objc_msgSend(v4, "_reregisterAuxiliaryCapabilityForPassUniqueIdentifier:withCompletion:", v6, v10);

      return;
    }
  }
  else
  {

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  v9 = *(_QWORD *)(a1 + 80);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v9 + 16))(v9, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
}

void __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_3_379(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_4;
  v8[3] = &unk_1E3E77160;
  v13 = *(id *)(a1 + 56);
  v9 = v3;
  v4 = *(id *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v14 = v4;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  if (!*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "_submitEncryptedPIN:forTransactionIdentifier:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_dismissTransactionAuthenticationPasscodeViewController:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  id v12;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "setDelegate:", 0);
  objc_msgSend(v6, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_msgSend(v6, "isBeingDismissed") & 1) == 0)
  {
    objc_initWeak(&location, self);
    v9 = -[PKPassPaymentContainerView _isBackgrounded](self, "_isBackgrounded") ^ 1;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __101__PKPassPaymentContainerView__dismissTransactionAuthenticationPasscodeViewController_withCompletion___block_invoke;
    v10[3] = &unk_1E3E61C80;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v9, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    v7[2](v7);
  }

}

void __101__PKPassPaymentContainerView__dismissTransactionAuthenticationPasscodeViewController_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setTransactionAuthenticationUIActive:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

- (void)_showInstallAssociatedApplicationInstructionsIfNecessary
{
  NSMutableArray *linkedApplicationUpdateCompletionHandlers;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  if (-[PKPassFooterContentView style](self, "style") == 3)
  {
    if (-[PKLinkedApplication state](self->_linkedApplication, "state"))
    {
      -[PKPassPaymentContainerView _updateBottomTextView](self, "_updateBottomTextView");
    }
    else
    {
      objc_initWeak(&location, self);
      linkedApplicationUpdateCompletionHandlers = self->_linkedApplicationUpdateCompletionHandlers;
      v5 = MEMORY[0x1E0C809B0];
      v6 = 3221225472;
      v7 = __86__PKPassPaymentContainerView__showInstallAssociatedApplicationInstructionsIfNecessary__block_invoke;
      v8 = &unk_1E3E61310;
      objc_copyWeak(&v9, &location);
      v4 = _Block_copy(&v5);
      -[NSMutableArray addObject:](linkedApplicationUpdateCompletionHandlers, "addObject:", v4, v5, v6, v7, v8);

      -[PKLinkedApplication reloadApplicationStateIfNecessary](self->_linkedApplication, "reloadApplicationStateIfNecessary");
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __86__PKPassPaymentContainerView__showInstallAssociatedApplicationInstructionsIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateBottomTextView");

}

- (id)_attributedStringForBottomTextViewFromString:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0DC1288];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setLineBreakMode:", 0);
  objc_msgSend(v6, "setAlignment:", 1);
  v14[0] = *MEMORY[0x1E0DC1138];
  -[UITextView font](self->_bottomTextView, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC1178];
  v15[0] = v7;
  v15[1] = v6;
  v9 = *MEMORY[0x1E0DC1140];
  v14[1] = v8;
  v14[2] = v9;
  -[UITextView textColor](self->_bottomTextView, "textColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PKAttributedStringByParsingLinksInString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_updateBottomTextView
{
  double v3;
  dispatch_time_t v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  UITextView *bottomTextView;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  char v32;
  _QWORD v33[4];
  id v34;
  _QWORD aBlock[4];
  id v36;
  char v37;
  id location;
  _QWORD block[6];

  if (self->_bottomTextViewAnimating)
  {
    self->_bottomTextViewNeedsUpdate = 1;
    return;
  }
  v3 = CFAbsoluteTimeGetCurrent() - self->_bottomTextViewDisplayedTimestamp;
  if (v3 < 4.0)
  {
    v4 = dispatch_time(0, (uint64_t)((4.0 - v3) * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke;
    block[3] = &unk_1E3E612E8;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);
    return;
  }
  v5 = -[PKPassFooterContentView style](self, "style") == 3 && self->_activeBarcodeIdentifier != 0;
  -[PKPassFooterContentView paymentPass](self, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "organizationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextView attributedText](self->_bottomTextView, "attributedText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (self->_collectingBarcodeEventMetadata)
    {
      PKLocalizedAquamanString(CFSTR("FRAUD_PREVENTION_INSTRUCTIONS"), CFSTR("%@"), v7);
LABEL_11:
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      bottomTextView = self->_bottomTextView;
      -[PKPassPaymentContainerView _attributedStringForBottomTextViewFromString:](self, "_attributedStringForBottomTextViewFromString:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setAttributedText:](bottomTextView, "setAttributedText:", v10);

      v11 = 1;
      goto LABEL_15;
    }
    if (-[PKLinkedApplication state](self->_linkedApplication, "state") == 1
      && !-[PKLinkedApplication isInstalled](self->_linkedApplication, "isInstalled"))
    {
      PKLocalizedAquamanString(CFSTR("INSTALL_ASSOCIATED_APPLICATION_INSTRUCTIONS"), CFSTR("%@"), v7);
      goto LABEL_11;
    }
  }
  v11 = 0;
LABEL_15:
  objc_initWeak(&location, self);
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_2;
  aBlock[3] = &unk_1E3E62FC8;
  objc_copyWeak(&v36, &location);
  v37 = v11;
  v13 = _Block_copy(aBlock);
  v33[0] = v12;
  v33[1] = 3221225472;
  v33[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_4;
  v33[3] = &unk_1E3E77228;
  objc_copyWeak(&v34, &location);
  v14 = _Block_copy(v33);
  -[UITextView alpha](self->_bottomTextView, "alpha");
  self->_bottomTextViewAnimating = 1;
  if (((v11 ^ (v15 <= 0.0)) & 1) == 0)
  {
    if (v11)
    {
      -[PKPassPaymentContainerView setNeedsLayout](self, "setNeedsLayout");
      -[PKPassPaymentContainerView layoutIfNeeded](self, "layoutIfNeeded");
    }
    v19 = (void *)MEMORY[0x1E0DC3F10];
    v30[0] = v12;
    v30[1] = 3221225472;
    v30[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_5;
    v30[3] = &unk_1E3E61A58;
    v31 = v14;
    v32 = v11;
    objc_msgSend(v19, "animateWithDuration:delay:options:animations:completion:", 4, v30, v13, 0.2, 0.0);
    v20 = v31;
    goto LABEL_25;
  }
  if (v15 > 0.0 && v11 != 0)
  {
    -[UITextView attributedText](self->_bottomTextView, "attributedText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = PKEqualObjects();

    if ((v18 & 1) == 0)
    {
      v21 = (void *)MEMORY[0x1E0DC3F10];
      v28[0] = v12;
      v28[1] = 3221225472;
      v28[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_6;
      v28[3] = &unk_1E3E61590;
      v22 = v14;
      v29 = v22;
      v24[0] = v12;
      v24[1] = 3221225472;
      v24[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_7;
      v24[3] = &unk_1E3E77278;
      objc_copyWeak(&v27, &location);
      v25 = v22;
      v26 = v13;
      objc_msgSend(v21, "animateWithDuration:delay:options:animations:completion:", 4, v28, v24, 0.2, 0.0);

      objc_destroyWeak(&v27);
      v20 = v29;
LABEL_25:

      goto LABEL_26;
    }
  }
  self->_bottomTextViewAnimating = 0;
LABEL_26:

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

uint64_t __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBottomTextView");
}

void __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  char v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_3;
  v2[3] = &unk_1E3E61C08;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  v4 = *(_BYTE *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
}

void __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_3(uint64_t a1)
{
  double *WeakRetained;
  CFAbsoluteTime Current;
  double *v4;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1008) = 0;
    v4 = WeakRetained;
    if (*(_BYTE *)(a1 + 40))
    {
      Current = CFAbsoluteTimeGetCurrent();
      WeakRetained = v4;
      v4[127] = Current;
    }
    if (*((_BYTE *)WeakRetained + 1009))
    {
      *((_BYTE *)WeakRetained + 1009) = 0;
      objc_msgSend(v4, "_updateBottomTextView");
      WeakRetained = v4;
    }
  }

}

void __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_4(uint64_t a1, double a2)
{
  id *WeakRetained;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[125], "setAlpha:", a2);
    WeakRetained = v4;
  }

}

uint64_t __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_5(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), (double)*(unint64_t *)&a2);
}

uint64_t __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);
}

void __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_7(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_8;
  block[3] = &unk_1E3E77250;
  objc_copyWeak(&v5, a1 + 6);
  v3 = a1[4];
  v4 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v5);
}

void __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setNeedsLayout");
    objc_msgSend(v3, "layoutIfNeeded");
    v4 = (void *)MEMORY[0x1E0DC3F10];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_9;
    v5[3] = &unk_1E3E61590;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v4, "animateWithDuration:delay:options:animations:completion:", 4, v5, *(_QWORD *)(a1 + 40), 0.2, 0.0);

  }
}

uint64_t __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(1.0);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  void *v7;
  PKLinkedApplication *linkedApplication;
  PKBarcodePaymentPrivacyViewController *v9;
  PKBarcodePaymentPrivacyViewController *v10;
  void *v11;
  void *v12;
  PKPortraitNavigationController *v13;
  void *v14;

  objc_msgSend(a4, "absoluteString", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("OPEN_ASSOCIATED_APPLICATION_IN_APP_STORE")))
  {
    linkedApplication = self->_linkedApplication;
    -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
    v9 = (PKBarcodePaymentPrivacyViewController *)objc_claimAutoreleasedReturnValue();
    -[PKLinkedApplication openApplication:](linkedApplication, "openApplication:", v9);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("OPEN_PAYMENT_INFO_EXTENSION_PRIVACY_TEXT")))
  {
    v10 = [PKBarcodePaymentPrivacyViewController alloc];
    -[PKPassFooterContentView paymentPass](self, "paymentPass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "organizationName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKBarcodePaymentPrivacyViewController initWithIssuerName:displayContext:paymentSetupContext:](v10, "initWithIssuerName:displayContext:paymentSetupContext:", v12, 1, 0);

    v13 = -[PKPortraitNavigationController initWithRootViewController:]([PKPortraitNavigationController alloc], "initWithRootViewController:", v9);
    -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentViewController:animated:completion:", v13, 1, 0);

    goto LABEL_5;
  }
LABEL_6:

  return 0;
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKPassPaymentContainerView_linkedApplicationDidChangeState___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __62__PKPassPaymentContainerView_linkedApplicationDidChangeState___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 1032);
  objc_msgSend(v1, "removeAllObjects");
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", &__block_literal_global_393);

}

uint64_t __62__PKPassPaymentContainerView_linkedApplicationDidChangeState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)_collectAndSubmitBarcodeEventMetadataWithAuthenticationType:(int64_t)a3
{
  void *v5;
  NSString *activeBarcodeIdentifier;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  PKPassPaymentContainerView *v41;
  id v42;
  id v43;
  int64_t v44;
  _QWORD aBlock[5];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  id location[2];

  -[PKPassFooterContentView paymentPass](self, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    activeBarcodeIdentifier = self->_activeBarcodeIdentifier;

    if (activeBarcodeIdentifier)
    {
      objc_initWeak(location, self);
      -[PKPassFooterContentView paymentPass](self, "paymentPass");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPassFooterContentView paymentPass](self, "paymentPass");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deviceAccountIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)-[NSString copy](self->_activeBarcodeIdentifier, "copy");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      v47 = &v46;
      v48 = 0x2020000000;
      v13 = MEMORY[0x1E0C809B0];
      v49 = *MEMORY[0x1E0DC4878];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke;
      aBlock[3] = &unk_1E3E62060;
      aBlock[4] = &v46;
      v14 = _Block_copy(aBlock);
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Submit Barcode Payment Event"), v14);
      v47[3] = v16;

      v37[0] = v13;
      v37[1] = 3221225472;
      v37[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_2;
      v37[3] = &unk_1E3E77308;
      v30 = v12;
      v38 = v30;
      v17 = v10;
      v39 = v17;
      v18 = v11;
      v44 = a3;
      v40 = v18;
      v41 = self;
      v19 = v8;
      v42 = v19;
      v29 = v14;
      v43 = v29;
      v20 = _Block_copy(v37);
      objc_msgSend(MEMORY[0x1E0D66D68], "providerForExtensionPoint:", *MEMORY[0x1E0D69F30]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassFooterContentView paymentPass](self, "paymentPass");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "associatedApplicationIdentifiers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "allObjects");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v13;
      v31[1] = 3221225472;
      v31[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_3_401;
      v31[3] = &unk_1E3E77380;
      v25 = v19;
      v32 = v25;
      v26 = v20;
      v35 = v26;
      objc_copyWeak(&v36, location);
      v27 = v18;
      v33 = v27;
      v28 = v17;
      v34 = v28;
      objc_msgSend(v21, "extensionsWithContainingApplicationIdentifiers:completion:", v24, v31);

      objc_destroyWeak(&v36);
      _Block_object_dispose(&v46, 8);

      objc_destroyWeak(location);
    }
  }
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *MEMORY[0x1E0DC4878];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = (objc_class *)MEMORY[0x1E0D66BE0];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setEventType:", 1);
  objc_msgSend(v5, "setTimestamp:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setEventMetadata:", v4);

  objc_msgSend(v5, "setDeviceAccountIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setBarcodeIdentifier:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setAuthenticationType:", *(_QWORD *)(a1 + 80));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_3;
  v8[3] = &unk_1E3E622D8;
  v6 = *(void **)(a1 + 64);
  v8[4] = *(_QWORD *)(a1 + 56);
  v9 = v5;
  v10 = v6;
  v11 = *(id *)(a1 + 72);
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_4;
  v3[3] = &unk_1E3E772E0;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_beginSessionExchange:", v3);

}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id *v10;
  uint64_t v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_7;
    block[3] = &unk_1E3E669B8;
    block[4] = *(_QWORD *)(a1 + 32);
    v10 = &v13;
    v13 = v5;
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v7 + 488);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_5;
    v17[3] = &unk_1E3E61850;
    v17[4] = v7;
    v10 = &v18;
    v11 = *(_QWORD *)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v9, "submitBarcodePaymentEvent:forPassUniqueIdentifier:sessionExchangeToken:withCompletion:", v8, v11, a2, v17);
  }

}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_5(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_6;
  v2[3] = &unk_1E3E61850;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_endSessionExchange");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_endSessionExchange");
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 512))
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Failed to acquire session exchange token but still submitting barcode event. Acquire token error: %@", buf, 0xCu);
    }

    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 488);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_397;
    v7[3] = &unk_1E3E61590;
    v8 = *(id *)(a1 + 64);
    objc_msgSend(v4, "submitBarcodePaymentEvent:forPassUniqueIdentifier:withCompletion:", v5, v6, v7);

  }
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_397(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_2_398;
  block[3] = &unk_1E3E61590;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_2_398(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_3_401(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _BYTE *v28;
  id v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
    v7 = 0;
  else
    v7 = objc_msgSend(v5, "count");
  v8 = (void *)MEMORY[0x1E0D66A58];
  v9 = *MEMORY[0x1E0D69940];
  v36[0] = *MEMORY[0x1E0D698E8];
  v36[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D68B58];
  v12 = *MEMORY[0x1E0D68C68];
  v34[0] = *MEMORY[0x1E0D68AA0];
  v34[1] = v12;
  v13 = *MEMORY[0x1E0D69F30];
  v35[0] = v11;
  v35[1] = v13;
  v34[2] = *MEMORY[0x1E0D68EB8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subjects:sendEvent:", v10, v15);

  PKLogFacilityTypeGetObject();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v17)
    {
      v18 = a1[4];
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Matched payment information event extension for pass %@. Collecting payment information.", buf, 0xCu);
    }

    objc_msgSend(v5, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v31 = __Block_byref_object_copy__52;
    v32 = __Block_byref_object_dispose__52;
    v33 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_402;
    v22[3] = &unk_1E3E77358;
    v23 = a1[4];
    v27 = a1[7];
    objc_copyWeak(&v29, a1 + 8);
    v28 = buf;
    v20 = v19;
    v24 = v20;
    v25 = a1[5];
    v26 = a1[6];
    objc_msgSend(v20, "beginExtensionRequestWithOptions:completion:", 1, v22);

    objc_destroyWeak(&v29);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (v17)
    {
      v21 = a1[4];
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Unable to match payment information event extension for pass: %@, error: %@. Submitting barcode event directly.", buf, 0x16u);
    }

    (*((void (**)(void))a1[7] + 2))();
  }

}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_402(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  _QWORD block[4];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isInvalidated") & 1) == 0)
  {
    objc_msgSend(v4, "extensionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = MEMORY[0x1E0C809B0];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_404;
        block[3] = &unk_1E3E61310;
        objc_copyWeak(&v21, (id *)(a1 + 80));
        dispatch_async(MEMORY[0x1E0C80D38], block);
        v9 = (void *)MEMORY[0x1E0C9E3A8];
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "newAssertionForBundleIdentifier:withReason:", v10, CFSTR("Barcode Event Metadata"));
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66BD8]), "initWithBarcodeIdentifier:deviceAccountIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
        v15[0] = v8;
        v15[1] = 3221225472;
        v15[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_2_409;
        v15[3] = &unk_1E3E77330;
        v18 = *(_QWORD *)(a1 + 72);
        v16 = v4;
        objc_copyWeak(&v19, (id *)(a1 + 80));
        v17 = *(id *)(a1 + 64);
        objc_msgSend(v5, "handleInformationRequest:completion:", v14, v15);

        objc_destroyWeak(&v19);
        objc_destroyWeak(&v21);
        goto LABEL_7;
      }
    }
  }
  else
  {
    v5 = 0;
  }
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v23 = v7;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Failed to begin payment information event extension for pass: %@. Submitting barcode event directly.", buf, 0xCu);
  }

  objc_msgSend(v4, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_7:

}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_404(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1040] = 1;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateBottomTextView");
    WeakRetained = v2;
  }

}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_2_409(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_3_410;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "paymentInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  objc_destroyWeak(&v7);
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_3_410(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1040] = 0;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateBottomTextView");
    WeakRetained = v2;
  }

}

- (void)passTileGroupView:(id)a3 executeSEActionForPass:(id)a4 tile:(id)a5 withCompletion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD);
  id v12;
  int64_t transactionSubstate;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKContactlessInterfaceSession *v18;
  NSObject *authorizationQueue;
  PKContactlessInterfaceSession *v20;
  _QWORD block[4];
  PKContactlessInterfaceSession *v22;
  id v23;
  void (**v24)(id, _QWORD);
  id v25;
  id location;

  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, _QWORD))a6;
  -[PKPassFooterContentView paymentPass](self, "paymentPass");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 != v9 || !-[PKPassPaymentContainerView _authenticationAllowed](self, "_authenticationAllowed"))
  {

    goto LABEL_10;
  }
  transactionSubstate = self->_transactionSubstate;

  if (transactionSubstate)
  {
LABEL_10:
    v11[2](v11, 0);
    goto LABEL_11;
  }
  objc_msgSend(v10, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D671D0];
  objc_msgSend(v14, "actions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "effectiveActionForActions:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 && objc_msgSend(v17, "type") == 4 && !self->_contactlessInterfaceSessionShared)
  {
    self->_contactlessInterfaceSessionShared = 1;
    -[PKPassPaymentContainerView _applyPayState:](self, "_applyPayState:", 12);
    objc_initWeak(&location, self);
    v18 = self->_contactlessInterfaceSession;
    authorizationQueue = self->_authorizationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__PKPassPaymentContainerView_passTileGroupView_executeSEActionForPass_tile_withCompletion___block_invoke;
    block[3] = &unk_1E3E64B20;
    v22 = v18;
    v23 = v10;
    v24 = v11;
    v20 = v18;
    objc_copyWeak(&v25, &location);
    dispatch_async(authorizationQueue, block);
    objc_destroyWeak(&v25);

    objc_destroyWeak(&location);
  }
  else
  {
    v11[2](v11, 0);
  }

LABEL_11:
}

void __91__PKPassPaymentContainerView_passTileGroupView_executeSEActionForPass_tile_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  _QWORD aBlock[4];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  id v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v38 = 0;
  objc_msgSend(*(id *)(a1 + 32), "activatedPaymentApplications");
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v34;
LABEL_3:
    v2 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v21)
      {
        v3 = v2;
        objc_enumerationMutation(obj);
        v2 = v3;
      }
      v23 = v2;
      v4 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v2);
      objc_msgSend(v4, "applicationIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0u;
      v30 = 0u;
      v31 = 0u;
      v29 = 0u;
      objc_msgSend(v4, "subcredentials");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v30;
LABEL_8:
        v9 = 0;
        while (1)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(a1 + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v9), "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKPassTileGroupView extractSupportedVehicleFunction:action:forTile:applicationIdentifier:keyIdentifier:](PKPassTileGroupView, "extractSupportedVehicleFunction:action:forTile:applicationIdentifier:keyIdentifier:", &v38, &v37, v10, v5, v11);

          if (v38)
          {
            if (v37)
              break;
          }
          if (v7 == ++v9)
          {
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
            if (v7)
              goto LABEL_8;
            break;
          }
        }
      }

      v12 = !v38 || v37 == 0;
      v13 = v12;

      if (!v13)
        break;
      v2 = v23 + 1;
      if (v23 + 1 == v22)
      {
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
        if (v22)
          goto LABEL_3;
        break;
      }
    }
  }

  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPassPaymentContainerView_passTileGroupView_executeSEActionForPass_tile_withCompletion___block_invoke_2;
  aBlock[3] = &unk_1E3E773A8;
  v27 = *(id *)(a1 + 48);
  objc_copyWeak(&v28, (id *)(a1 + 56));
  v15 = _Block_copy(aBlock);
  v16 = v15;
  v17 = v38;
  if (v38 && (v18 = v37) != 0)
  {
    v19 = *(void **)(a1 + 32);
    v24[0] = v14;
    v24[1] = 3221225472;
    v24[2] = __91__PKPassPaymentContainerView_passTileGroupView_executeSEActionForPass_tile_withCompletion___block_invoke_4;
    v24[3] = &unk_1E3E614F0;
    v25 = v15;
    objc_msgSend(v19, "sendRKEFunction:action:withAuthorization:completion:", v17, v18, 0, v24);

  }
  else
  {
    (*((void (**)(void *, _QWORD))v15 + 2))(v15, 0);
  }

  objc_destroyWeak(&v28);
}

void __91__PKPassPaymentContainerView_passTileGroupView_executeSEActionForPass_tile_withCompletion___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__PKPassPaymentContainerView_passTileGroupView_executeSEActionForPass_tile_withCompletion___block_invoke_3;
  block[3] = &unk_1E3E6D2B8;
  v5 = *(id *)(a1 + 32);
  v7 = a2;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v6);

}

void __91__PKPassPaymentContainerView_passTileGroupView_executeSEActionForPass_tile_withCompletion___block_invoke_3(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[521] = 0;
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_resetToIdleState");
    WeakRetained = v3;
  }

}

uint64_t __91__PKPassPaymentContainerView_passTileGroupView_executeSEActionForPass_tile_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dataReleaseViewController:(id)a3 didAuthorizeWithExternalAuthorizationData:(id)a4 dataToRelease:(id)a5
{
  -[PKContactlessInterfaceSession authorize18013RequestWithDataToRelease:credential:](self->_contactlessInterfaceSession, "authorize18013RequestWithDataToRelease:credential:", a5, a4);
}

- (void)dataReleaseViewController:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PKPassPaymentContainerView *v11;

  v6 = a4;
  objc_msgSend(a3, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__PKPassPaymentContainerView_dataReleaseViewController_didFinishWithError___block_invoke;
  v9[3] = &unk_1E3E61388;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v9);

}

void __75__PKPassPaymentContainerView_dataReleaseViewController_didFinishWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  dispatch_time_t v4;
  _QWORD v5[5];
  _QWORD block[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Dismissed data release controller", buf, 2u);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = *(void **)(a1 + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __75__PKPassPaymentContainerView_dataReleaseViewController_didFinishWithError___block_invoke_2;
    v5[3] = &unk_1E3E62288;
    v5[4] = v3;
    objc_msgSend(v3, "_resetCardEmulationWithCompletion:", v5);
  }
  else
  {
    v4 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__PKPassPaymentContainerView_dataReleaseViewController_didFinishWithError___block_invoke_415;
    block[3] = &unk_1E3E612E8;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);
  }
}

void __75__PKPassPaymentContainerView_dataReleaseViewController_didFinishWithError___block_invoke_415(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D6AD00];
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *MEMORY[0x1E0D6AD08];
  v7[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", v3, v4, v5);

}

uint64_t __75__PKPassPaymentContainerView_dataReleaseViewController_didFinishWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetToIdleStateAfterDelay:", 0.3);
}

- (void)dataReleaseViewController:(id)a3 didResolveToMerchant:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__PKPassPaymentContainerView_dataReleaseViewController_didResolveToMerchant___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __77__PKPassPaymentContainerView_dataReleaseViewController_didResolveToMerchant___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1080), *(id *)(a1 + 40));
}

- (void)compactNavigationContainerControllerReceivedExternalTap:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__PKPassPaymentContainerView_compactNavigationContainerControllerReceivedExternalTap___block_invoke;
  v5[3] = &unk_1E3E612E8;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

uint64_t __86__PKPassPaymentContainerView_compactNavigationContainerControllerReceivedExternalTap___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v5[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Dismissed data release controller from external tap", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__PKPassPaymentContainerView_compactNavigationContainerControllerReceivedExternalTap___block_invoke_416;
  v5[3] = &unk_1E3E62288;
  v5[4] = v3;
  return objc_msgSend(v3, "_resetCardEmulationWithCompletion:", v5);
}

uint64_t __86__PKPassPaymentContainerView_compactNavigationContainerControllerReceivedExternalTap___block_invoke_416(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetToIdleStateAfterDelay:", 0.3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dckAssertion, 0);
  objc_storeStrong((id *)&self->_sessionExchangeTaskQueue, 0);
  objc_storeStrong((id *)&self->_sessionExchangeToken, 0);
  objc_storeStrong((id *)&self->_contextForCurrentTransaction, 0);
  objc_storeStrong((id *)&self->_merchantForCurrentTransaction, 0);
  objc_destroyWeak((id *)&self->_dataReleaseVC);
  objc_destroyWeak((id *)&self->_barcodeViewController);
  objc_storeStrong((id *)&self->_linkedApplicationUpdateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_bottomTextView, 0);
  objc_storeStrong((id *)&self->_transactionForDisplayedBarcode, 0);
  objc_storeStrong((id *)&self->_transactionAwardsView, 0);
  objc_destroyWeak((id *)&self->_activeTransactionAuthenticationViewController);
  objc_storeStrong((id *)&self->_barcodeDisplayTimer, 0);
  objc_storeStrong((id *)&self->_userNotificationSupressionAssertion, 0);
  objc_storeStrong((id *)&self->_activeBarcodeCredential, 0);
  objc_storeStrong((id *)&self->_activeBarcodeIdentifier, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_valueAddedPasses, 0);
  objc_storeStrong((id *)&self->_pendingPresentationContextState, 0);
  objc_destroyWeak((id *)&self->_passcodeVC);
  objc_storeStrong((id *)&self->_transactionTerminalResponseTimer, 0);
  objc_storeStrong((id *)&self->_transactionResolutionTimer, 0);
  objc_storeStrong((id *)&self->_pendingGlyphStateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_transitionCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_authorizedExternalizedContext, 0);
  objc_storeStrong((id *)&self->_pendingPayStateTextOverride, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_valueAddedServiceInfoView, 0);
  objc_storeStrong((id *)&self->_applicationsView, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_ignoringUpdatesFromTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_displayedSecondaryView, 0);
  objc_storeStrong((id *)&self->_displayedPrimaryView, 0);
  objc_storeStrong((id *)&self->_groupTile, 0);
  objc_storeStrong((id *)&self->_tileGroupView, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_dualValueCellPrimary, 0);
  objc_storeStrong((id *)&self->_singleValueCellSecondary, 0);
  objc_storeStrong((id *)&self->_singleValueCellPrimary, 0);
  objc_storeStrong((id *)&self->_physicalButtonView, 0);
  objc_storeStrong((id *)&self->_fixedScreenCoordinateSpace, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountResolutionController, 0);
  objc_storeStrong((id *)&self->_transactionFooterContactResolver, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_authorizationQueue, 0);
  objc_storeStrong((id *)&self->_contactlessInterfaceSession, 0);
  objc_storeStrong((id *)&self->_payStateView, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end

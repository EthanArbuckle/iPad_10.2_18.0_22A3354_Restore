@implementation PKPaymentAuthorizationStateMachine

- (PKPaymentAuthorizationStateMachine)init
{
  PKPaymentAuthorizationStateMachine *v2;
  PKPaymentAuthorizationStateMachine *v3;
  void *v4;
  uint64_t v5;
  NSString *instanceIdentifier;
  dispatch_group_t v7;
  OS_dispatch_group *delayAuthorizedStateGroup;
  PKSecureElement *v9;
  PKSecureElement *secureElement;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPaymentAuthorizationStateMachine;
  v2 = -[PKPaymentAuthorizationStateMachine init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    v2->_updatePaymentDeviceTimeout = 10.0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();
    instanceIdentifier = v3->_instanceIdentifier;
    v3->_instanceIdentifier = (NSString *)v5;

    v7 = dispatch_group_create();
    delayAuthorizedStateGroup = v3->_delayAuthorizedStateGroup;
    v3->_delayAuthorizedStateGroup = (OS_dispatch_group *)v7;

    v9 = objc_alloc_init(PKSecureElement);
    secureElement = v3->_secureElement;
    v3->_secureElement = v9;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPaymentAuthorizationStateMachine invalidate](self, "invalidate");
  -[PKPaymentAuthorizationStateMachine _clientCallbackTimedOut](self, "_clientCallbackTimedOut");
  -[PKPaymentAuthorizationStateMachine _unregisterForNotifications](self, "_unregisterForNotifications");
  if (self->_enhancedMerchantsFetcherUpdateToken)
    -[PKAccountEnhancedMerchantsFetcher removeUpdateHandler:](self->_enhancedMerchantsFetcher, "removeUpdateHandler:");
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationStateMachine;
  -[PKPaymentAuthorizationStateMachine dealloc](&v3, sel_dealloc);
}

- (void)_setState:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Setting PKPaymentAuthorizationState without param"));
}

- (void)_setState:(unint64_t)a3 param:(id)a4
{
  id v6;
  NSObject *delayAuthorizedStateGroup;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v6 = a4;
  if (a3 == 12)
  {
    objc_initWeak(&location, self);
    delayAuthorizedStateGroup = self->_delayAuthorizedStateGroup;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__PKPaymentAuthorizationStateMachine__setState_param___block_invoke;
    v8[3] = &unk_1E2AC7BE8;
    objc_copyWeak(v10, &location);
    v10[1] = (id)12;
    v9 = v6;
    dispatch_group_notify(delayAuthorizedStateGroup, MEMORY[0x1E0C80D38], v8);

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PKPaymentAuthorizationStateMachine __setState:param:](self, "__setState:param:", a3, v6);
  }

}

void __54__PKPaymentAuthorizationStateMachine__setState_param___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "__setState:param:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)__setState:(unint64_t)a3 param:(id)a4
{
  id v6;
  unint64_t state;
  void *v8;
  void *v9;
  void *v10;
  PKPayLaterFinancingController *financingController;
  int64_t cancelReason;
  uint64_t v13;
  void *v14;
  int v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  int v28;
  uint64_t v29;
  id v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  uint64_t v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int has_internal_ui;
  id obj;
  id obja;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  char v68;
  _QWORD v69[5];
  _QWORD v70[5];
  _BYTE v71[128];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[4];
  _QWORD v75[6];

  v75[4] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  state = self->_state;
  self->_state = a3;
  -[PKPaymentAuthorizationStateMachine _sendDidTransitionFromState:toState:withParam:](self, "_sendDidTransitionFromState:toState:withParam:", state, a3, v6);
  if (-[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") == 1)
  {
    -[PKPaymentAuthorizationDataModel selectedFinancingOption](self->_model, "selectedFinancingOption");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v10 = 0;
  switch(a3)
  {
    case 3uLL:
      objc_msgSend(v6, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel setStatus:forItemWithType:](self->_model, "setStatus:forItemWithType:", objc_msgSend(v6, "status"), objc_msgSend(v6, "dataType"));
      if (v10)
        goto LABEL_8;
      goto LABEL_22;
    case 5uLL:
      financingController = self->_financingController;
      cancelReason = self->_cancelReason;
      v13 = 5;
      goto LABEL_19;
    case 8uLL:
      -[PKPaymentAuthorizationStateMachine _performPrepareTransactionDetailsRequestWithParam:](self, "_performPrepareTransactionDetailsRequestWithParam:", v6);
      goto LABEL_21;
    case 9uLL:
      -[PKPaymentAuthorizationStateMachine _performNonceRequestWithParam:](self, "_performNonceRequestWithParam:", v6);
      goto LABEL_21;
    case 0xAuLL:
      -[PKPaymentAuthorizationStateMachine _performAuthorizationWithParam:](self, "_performAuthorizationWithParam:", v6);
      goto LABEL_21;
    case 0xBuLL:
      -[PKPaymentAuthorizationStateMachine _performRewrapRequestWithParam:](self, "_performRewrapRequestWithParam:", v6);
      goto LABEL_21;
    case 0xCuLL:
      -[PKPaymentAuthorizationStateMachine _performDidAuthorizeCallbackWithParam:](self, "_performDidAuthorizeCallbackWithParam:", v6);
      goto LABEL_21;
    case 0xDuLL:
      financingController = self->_financingController;
      cancelReason = self->_cancelReason;
      v13 = 2;
      goto LABEL_19;
    case 0xEuLL:
    case 0xFuLL:
      objc_msgSend(v6, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
LABEL_8:
        -[PKPayLaterFinancingController stateMachineUpdatedAuthenticationState:selectedOptionIdentifier:error:cancelReason:](self->_financingController, "stateMachineUpdatedAuthenticationState:selectedOptionIdentifier:error:cancelReason:", 3, v9, v10, self->_cancelReason);
      goto LABEL_22;
    case 0x10uLL:
      -[PKPaymentAuthorizationStateMachine _removeWebServiceConfigurationIfNeeded](self, "_removeWebServiceConfigurationIfNeeded");
      -[PKPaymentAuthorizationStateMachine _insertPendingPaymentTransactionsWithParam:](self, "_insertPendingPaymentTransactionsWithParam:", v6);
      v68 = 0;
      -[PKPaymentAuthorizationStateMachine _insertPendingOrderDetails:](self, "_insertPendingOrderDetails:", &v68);
      if (!v68)
        -[PKPaymentAuthorizationStateMachine _insertPendingTransactionRegistration](self, "_insertPendingTransactionRegistration");
      financingController = self->_financingController;
      cancelReason = self->_cancelReason;
      v13 = 1;
LABEL_19:
      -[PKPayLaterFinancingController stateMachineUpdatedAuthenticationState:selectedOptionIdentifier:error:cancelReason:](financingController, "stateMachineUpdatedAuthenticationState:selectedOptionIdentifier:error:cancelReason:", v13, v9, 0, cancelReason);
      goto LABEL_21;
    case 0x11uLL:
    case 0x13uLL:
      goto LABEL_22;
    case 0x12uLL:
      -[PKPaymentAuthorizationStateMachine _performDataProcessingWithParam:](self, "_performDataProcessingWithParam:", v6);
      goto LABEL_21;
    default:
LABEL_21:
      v10 = 0;
LABEL_22:
      objc_msgSend(v10, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("PKPassKitErrorDomain"));

      if (!v15)
        goto LABEL_78;
      obj = (id)a3;
      v59 = v9;
      v60 = v6;
      objc_msgSend(v10, "domain");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v10, "code");
      objc_msgSend(v10, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "PKBoolForKey:", CFSTR("PKPaymentErrorIsFieldEmpty"));

      has_internal_ui = os_variant_has_internal_ui();
      if (has_internal_ui)
      {
        objc_msgSend(v10, "localizedFailureReason");
        v20 = v10;
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          objc_msgSend(v20, "localizedDescription");
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v20 = v10;
        v21 = 0;
      }
      objc_msgSend(v20, "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "domain");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("PKPassKitErrorDomain"));

      v57 = v23;
      v58 = v20;
      if (!v25)
      {
        v28 = v19;
LABEL_33:
        v30 = obj;
        goto LABEL_34;
      }
      objc_msgSend(v23, "domain");
      v26 = objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v23, "code");
      objc_msgSend(v20, "userInfo");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "PKBoolForKey:", CFSTR("PKPaymentErrorIsFieldEmpty"));

      if (!has_internal_ui)
      {
        v16 = (__CFString *)v26;
        goto LABEL_33;
      }
      objc_msgSend(v23, "localizedFailureReason");
      v29 = objc_claimAutoreleasedReturnValue();

      v30 = obj;
      if (v29)
      {
        v16 = (__CFString *)v26;
        v21 = (__CFString *)v29;
      }
      else
      {
        objc_msgSend(v23, "localizedDescription");
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v16 = (__CFString *)v26;
      }
LABEL_34:
      v74[0] = CFSTR("authorizationError");
      if (v17 > -2017)
      {
        switch(v17)
        {
          case -2016:
            v31 = CFSTR("provisioningError");
            break;
          case -2015:
            v31 = CFSTR("bluetoothUnavailable");
            break;
          case -2014:
          case -2013:
          case -2007:
          case -2006:
          case -2005:
          case -2004:
            v31 = CFSTR("serverError");
            break;
          case -2012:
            v31 = CFSTR("authenticatorError");
            break;
          case -2011:
            v31 = CFSTR("continuityPaymentError");
            break;
          case -2010:
            v31 = CFSTR("continuitySendError");
            break;
          case -2009:
            v31 = CFSTR("continuityDeviceDisappeared");
            break;
          case -2008:
            v31 = CFSTR("continuityTimeout");
            break;
          case -2003:
            v31 = CFSTR("callbackSequenceError");
            break;
          case -2002:
            v31 = CFSTR("unexpectedReply");
            break;
          case -2001:
            v31 = CFSTR("callbackStatusError");
            break;
          case -2000:
            v31 = CFSTR("unknownError");
            break;
          default:
            if (v17 == -1001)
            {
              v31 = CFSTR("extensionNotFound");
            }
            else
            {
              if (v17 != -1002)
                goto LABEL_91;
              v31 = CFSTR("errorInstantiatingExtension");
            }
            break;
        }
      }
      else if (v17 > -3018)
      {
        switch(v17)
        {
          case -3017:
            v31 = CFSTR("verificationRequiredError");
            break;
          case -3016:
            v31 = CFSTR("minimumAmountError");
            break;
          case -3015:
            v31 = CFSTR("maximumAmountError");
            break;
          case -3014:
            v31 = CFSTR("missingFinancingOption");
            break;
          case -3013:
            v31 = CFSTR("cardUnsupported");
            break;
          case -3012:
            v31 = CFSTR("cardEmpty");
            break;
          case -3011:
            v31 = CFSTR("cardPINIncorrect");
            break;
          case -3010:
            v31 = CFSTR("invalidShippingContact");
            break;
          case -3009:
            v31 = CFSTR("cardInsufficientBalance");
            break;
          case -3008:
            v31 = CFSTR("paymentInstructionsError");
            break;
          case -3007:
            v31 = CFSTR("shippingPhoneticNameError");
            break;
          case -3006:
            v31 = CFSTR("shippingNameError");
            break;
          case -3005:
            v31 = CFSTR("shippingEmailError");
            break;
          case -3004:
            v31 = CFSTR("shippingPhoneError");
            break;
          case -3003:
            v31 = CFSTR("shippingAddressError");
            break;
          case -3002:
            v31 = CFSTR("billingAddressError");
            break;
          case -3001:
            v31 = CFSTR("cardLockedOut");
            break;
          case -3000:
            v31 = CFSTR("invalidPaymentCard");
            break;
          default:
            goto LABEL_91;
        }
      }
      else if (v17 <= -5001)
      {
        switch(v17)
        {
          case -6000:
            v31 = CFSTR("signatureCheckUnreachableError");
            break;
          case -5002:
            v31 = CFSTR("cloudStoreNotEntitledForMethodError");
            break;
          case -5001:
            v31 = CFSTR("cloudStoreCannotInitalizeContainerError");
            break;
          default:
LABEL_91:
            v31 = CFSTR("unknown");
            break;
        }
      }
      else
      {
        switch(v17)
        {
          case -4013:
            v31 = CFSTR("cloudStoreQueryCancelled");
            break;
          case -4012:
            v31 = CFSTR("cloudStoreCreateZoneFailed");
            break;
          case -4011:
            v31 = CFSTR("cloudStoreCopyDataFailed");
            break;
          case -4010:
            v31 = CFSTR("cloudStoreNoRecordNameForItem");
            break;
          case -4009:
            v31 = CFSTR("cloudStoreNoAssociatedContainer");
            break;
          case -4008:
            v31 = CFSTR("cloudStoreInvalidAccountState");
            break;
          case -4007:
            v31 = CFSTR("cloudStoreInitializationTimeOut");
            break;
          case -4006:
            v31 = CFSTR("cloudStoreInvalidCloudStoreState");
            break;
          case -4005:
            v31 = CFSTR("cloudStoreNotManateeCapable");
            break;
          case -4004:
            v31 = CFSTR("cloudStoreCannotPerformAction");
            break;
          case -4003:
            v31 = CFSTR("cloudStoreArgumentMismatch");
            break;
          case -4002:
            v31 = CFSTR("cloudStoreNoRecordTypeForItem");
            break;
          case -4001:
            v31 = CFSTR("cloudStoreNoZoneForItem");
            break;
          case -4000:
            v31 = CFSTR("cloudStoreUnknownError");
            break;
          default:
            if (v17 != -5000)
              goto LABEL_91;
            v31 = CFSTR("cloudStoreNotInitalizedError");
            break;
        }
      }
      if (v16)
        v32 = v16;
      else
        v32 = &stru_1E2ADF4C0;
      v75[0] = v31;
      v75[1] = v32;
      v74[1] = CFSTR("errorDomain");
      v74[2] = CFSTR("errorCode");
      v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), v17);
      v34 = (void *)v33;
      v74[3] = CFSTR("errorText");
      if (v21)
        v35 = v21;
      else
        v35 = &stru_1E2ADF4C0;
      v75[2] = v33;
      v75[3] = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationStateMachine _reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:eventType:](self, "_reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:eventType:", v36, CFSTR("transactionAuthorizationError"));

      if (v28)
      {
        v73[0] = CFSTR("fieldEmpty");
        v72[0] = CFSTR("eventType");
        v72[1] = CFSTR("errorType");
        if ((unint64_t)(v17 + 3007) > 5)
          v37 = CFSTR("unknown");
        else
          v37 = off_1E2AC8368[v17 + 3007];
        v73[1] = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("inApp"), v38);

      }
      if (v30 == (id)3)
      {
        v56 = v16;
        objc_msgSend(v60, "clientErrors");
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        obja = (id)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v65;
          do
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v65 != v41)
                objc_enumerationMutation(obja);
              v43 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
              objc_msgSend(v43, "domain");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("PKPaymentErrorDomain"));

              if (v45)
              {
                v46 = objc_msgSend(v43, "code");
                if (has_internal_ui)
                {
                  objc_msgSend(v43, "localizedFailureReason");
                  v47 = objc_claimAutoreleasedReturnValue();

                  v21 = (__CFString *)v47;
                  if (!v47)
                  {
                    objc_msgSend(v43, "localizedDescription");
                    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  }
                }
                else
                {

                  v21 = 0;
                }
                v70[0] = CFSTR("transactionAuthorizationClientError");
                v69[0] = CFSTR("eventType");
                v69[1] = CFSTR("authorizationError");
                v48 = CFSTR("unknown");
                if ((unint64_t)(v46 - 1) <= 2)
                  v48 = off_1E2AC8398[v46 - 1];
                v70[1] = v48;
                v69[2] = CFSTR("errorDomain");
                objc_msgSend(v43, "domain");
                v49 = objc_claimAutoreleasedReturnValue();
                v50 = (void *)v49;
                if (v49)
                  v51 = (const __CFString *)v49;
                else
                  v51 = &stru_1E2ADF4C0;
                v70[2] = v51;
                v69[3] = CFSTR("errorCode");
                v52 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), v46);
                v53 = (void *)v52;
                v69[4] = CFSTR("errorText");
                if (v21)
                  v54 = v21;
                else
                  v54 = &stru_1E2ADF4C0;
                v70[3] = v52;
                v70[4] = v54;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 5);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("inApp"), v55);

              }
            }
            v40 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
          }
          while (v40);
        }

        v16 = v56;
      }

      v9 = v59;
      v6 = v60;
      v10 = v58;
LABEL_78:

      return;
  }
}

- (PKPaymentSheetExperiment)paymentSheetExperiment
{
  PKPaymentSheetExperiment *paymentSheetExperiment;
  PKPaymentSheetExperiment *v4;
  PKPaymentSheetExperiment *v5;

  paymentSheetExperiment = self->_paymentSheetExperiment;
  if (!paymentSheetExperiment)
  {
    v4 = objc_alloc_init(PKPaymentSheetExperiment);
    v5 = self->_paymentSheetExperiment;
    self->_paymentSheetExperiment = v4;

    paymentSheetExperiment = self->_paymentSheetExperiment;
  }
  return paymentSheetExperiment;
}

- (PKBluetoothMonitorer)bluetoothMonitor
{
  PKBluetoothMonitorer *bluetoothMonitor;
  PKBluetoothMonitorer *v4;
  PKBluetoothMonitorer *v5;

  bluetoothMonitor = self->_bluetoothMonitor;
  if (!bluetoothMonitor)
  {
    v4 = -[PKBluetoothMonitorer initWithManagerOptions:]([PKBluetoothMonitorer alloc], "initWithManagerOptions:", 0);
    v5 = self->_bluetoothMonitor;
    self->_bluetoothMonitor = v4;

    -[PKBluetoothMonitorer setDelegate:](self->_bluetoothMonitor, "setDelegate:", self);
    bluetoothMonitor = self->_bluetoothMonitor;
  }
  return bluetoothMonitor;
}

- (void)setBluetoothMonitor:(id)a3
{
  PKBluetoothMonitorer *v4;
  PKBluetoothMonitorer *bluetoothMonitor;

  v4 = (PKBluetoothMonitorer *)a3;
  -[PKBluetoothMonitorer setDelegate:](self->_bluetoothMonitor, "setDelegate:", 0);
  -[PKBluetoothMonitorer setDelegate:](v4, "setDelegate:", self);
  bluetoothMonitor = self->_bluetoothMonitor;
  self->_bluetoothMonitor = v4;

}

- (void)setPaymentService:(id)a3
{
  objc_storeStrong((id *)&self->_paymentService, a3);
  -[PKPaymentAuthorizationStateMachine _configureAdditionalPaymentMethodsIfNeeeded](self, "_configureAdditionalPaymentMethodsIfNeeeded");
}

- (void)setPaymentWebService:(id)a3
{
  objc_storeStrong((id *)&self->_paymentWebService, a3);
  -[PKPaymentAuthorizationStateMachine _applyWebServiceConfigurationIfNeeded](self, "_applyWebServiceConfigurationIfNeeded");
  -[PKPaymentAuthorizationStateMachine _configureAdditionalPaymentMethodsIfNeeeded](self, "_configureAdditionalPaymentMethodsIfNeeeded");
}

- (void)setAccountService:(id)a3
{
  objc_storeStrong((id *)&self->_accountService, a3);
  -[PKPaymentAuthorizationStateMachine _configureAdditionalPaymentMethodsIfNeeeded](self, "_configureAdditionalPaymentMethodsIfNeeeded");
}

- (void)setPeerPaymentService:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentService, a3);
  -[PKPaymentAuthorizationStateMachine _configureAdditionalPaymentMethodsIfNeeeded](self, "_configureAdditionalPaymentMethodsIfNeeeded");
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
  -[PKPaymentAuthorizationStateMachine _configureAdditionalPaymentMethodsIfNeeeded](self, "_configureAdditionalPaymentMethodsIfNeeeded");
}

- (void)setUpdatePaymentDeviceTimeout:(double)a3
{
  self->_updatePaymentDeviceTimeout = a3;
  -[PKContinuityPaymentCoordinator setUpdatePaymentDeviceTimeout:](self->_continuityPaymentCoordinator, "setUpdatePaymentDeviceTimeout:");
}

- (void)_applyWebServiceConfigurationIfNeeded
{
  void *v3;
  PKPaymentWebService *paymentWebService;
  BOOL v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  paymentWebService = self->_paymentWebService;
  if (paymentWebService)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    -[PKWebService sessionConfiguration](paymentWebService, "sessionConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sourceApplicationBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7 != 0;
    if (v7)
    {
      PKLogFacilityTypeGetObject(7uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Request has source application bundle, applying network configuration", buf, 2u);
      }

      objc_msgSend(v3, "sourceApplicationBundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "set_sourceApplicationBundleIdentifier:", v10);

    }
    objc_msgSend(v3, "sourceApplicationSecondaryIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      PKLogFacilityTypeGetObject(7uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Request has secondary application identifier, applying network configuration", v16, 2u);
      }

      objc_msgSend(v3, "sourceApplicationSecondaryIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "set_sourceApplicationSecondaryIdentifier:", v13);

      v8 = 1;
    }
    objc_msgSend(v3, "CTDataConnectionServiceType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v3, "CTDataConnectionServiceType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "set_CTDataConnectionServiceType:", v15);

    }
    else if (!v8)
    {
LABEL_17:

      goto LABEL_18;
    }
    -[PKWebService refreshSessionWithConfiguration:](self->_paymentWebService, "refreshSessionWithConfiguration:", v6);
    goto LABEL_17;
  }
LABEL_18:

}

- (void)_configureAdditionalPaymentMethodsIfNeeeded
{
  -[PKPaymentAuthorizationStateMachine _configurePayLaterOptionsIfNeeded](self, "_configurePayLaterOptionsIfNeeded");
  -[PKPaymentAuthorizationStateMachine _configurePaymentOffersIfNeeded](self, "_configurePaymentOffersIfNeeded");
}

- (void)_fetchAdditionalPaymentMethodDataIfNeeded
{
  -[PKPaymentAuthorizationStateMachine _fetchFinancingOptionsIfNeeded](self, "_fetchFinancingOptionsIfNeeded");
  -[PKPaymentAuthorizationStateMachine _fetchPaymentOffersIfNeeded](self, "_fetchPaymentOffersIfNeeded");
}

- (void)_purchaseMerchantIdentifier:(id *)a3 originURL:(id *)a4 webMerchantIdentifier:(id *)a5 webMerchantName:(id *)a6 adamIdentifier:(id *)a7 isMerchantTokenRequest:(BOOL *)a8 isMultiTokenRequest:(BOOL *)a9
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  BOOL v24;
  id *v27;
  id v28;
  id *v29;
  id v30;
  id v31;

  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "merchantSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "originatingURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "host");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "merchantIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaymentAuthorizationStateMachine _adamIdentifier](self, "_adamIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PKPaymentAuthorizationStateMachine _adamIdentifier](self, "_adamIdentifier"));
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
  v29 = a6;
  v27 = a4;
  if (v16)
  {
    objc_msgSend(v14, "merchantIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "domain");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "merchantIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)v18;
  }
  else
  {
    v20 = 0;
    v19 = 0;
    v30 = 0;
  }
  objc_msgSend(v31, "recurringPaymentRequest");
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "automaticReloadPaymentRequest");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v21 | v22)
    v24 = -[PKPaymentAuthorizationStateMachine _isMerchantTokensSupported](self, "_isMerchantTokensSupported");
  else
    v24 = 0;
  if (objc_msgSend(v31, "isMultiTokenRequest"))
    v23 = -[PKPaymentAuthorizationStateMachine _isMultiTokenContextsSupported](self, "_isMultiTokenContextsSupported");
  else
    v23 = 0;
  if (a3)
    *a3 = objc_retainAutorelease(v17);
  if (v27)
    *v27 = objc_retainAutorelease(v30);
  if (a5)
    *a5 = objc_retainAutorelease(v19);
  if (v29)
    *v29 = objc_retainAutorelease(v20);
  if (a7)
    *a7 = objc_retainAutorelease(v28);
  if (a8)
    *a8 = v24;
  if (a9)
    *a9 = v23;

}

- (void)_configurePayLaterOptionsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  PKPayLaterFinancingControllerConfiguration *v11;
  PKPayLaterFinancingControllerConfiguration *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18;
  uint64_t v19;
  PKPayLaterFinancingController *v20;
  PKAccountService *accountService;
  PKPeerPaymentService *peerPaymentService;
  id v23;
  PKPaymentWebService *paymentWebService;
  PKPaymentService *paymentService;
  id v26;
  void *v27;
  PKAccountService *v28;
  PKPaymentService *v29;
  PKPaymentWebService *v30;
  PKPayLaterFinancingController *v31;
  PKPayLaterFinancingController *financingController;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  PKPayLaterFinancingControllerConfiguration *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _WORD v51[5];

  if (-[PKPaymentAuthorizationStateMachine _purchaseSupportsFinancingOptions](self, "_purchaseSupportsFinancingOptions"))
  {
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "originatingURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v51[0] = 0;
    v49 = 0;
    v50 = 0;
    v47 = 0;
    v48 = 0;
    v46 = 0;
    -[PKPaymentAuthorizationStateMachine _purchaseMerchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:adamIdentifier:isMerchantTokenRequest:isMultiTokenRequest:](self, "_purchaseMerchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:adamIdentifier:isMerchantTokenRequest:isMultiTokenRequest:", &v50, &v49, &v48, &v47, &v46, (char *)v51 + 1, v51);
    v6 = v50;
    v7 = v49;
    v8 = v48;
    v9 = v47;
    v10 = v46;
    -[PKPayLaterFinancingController configuration](self->_financingController, "configuration");
    v11 = (PKPayLaterFinancingControllerConfiguration *)objc_claimAutoreleasedReturnValue();
    v45 = v3;
    if (v11)
    {
      v12 = v11;
      -[PKPayLaterFinancingControllerConfiguration updateMerchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:](v11, "updateMerchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:", v6, v7, v8, v9);
    }
    else
    {
      v41 = [PKPayLaterFinancingControllerConfiguration alloc];
      -[PKPaymentAuthorizationDataModel transactionAmount](self->_model, "transactionAmount");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel currencyCode](self->_model, "currencyCode");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "countryCode");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel merchantName](self->_model, "merchantName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v6;
      v36 = HIBYTE(v51[0]);
      v14 = v9;
      v15 = v8;
      v16 = v7;
      v17 = v51[0];
      v18 = v10;
      if (v5)
        v19 = 2;
      else
        v19 = 1;
      objc_msgSend(v3, "supportedNetworks");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v19;
      v10 = v18;
      BYTE1(v33) = v17;
      v7 = v16;
      v8 = v15;
      v9 = v14;
      LOBYTE(v33) = v36;
      v6 = v43;
      v12 = -[PKPayLaterFinancingControllerConfiguration initWithTransactionAmount:currencyCode:merchantCountryCode:merchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:merchantName:adamIdentifier:isMerchantTokenRequest:isMultiTokenRequest:channel:channelType:supportedNetworks:suppressionMode:](v41, "initWithTransactionAmount:currencyCode:merchantCountryCode:merchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:merchantName:adamIdentifier:isMerchantTokenRequest:isMultiTokenRequest:channel:channelType:supportedNetworks:suppressionMode:", v39, v38, v37, v43, v7, v8, v14, v13, v10, v33, 1, v34, v35, objc_msgSend(v3, "applePayLaterAvailability"));

    }
    if (!self->_financingController)
    {
      v20 = [PKPayLaterFinancingController alloc];
      v40 = v9;
      accountService = self->_accountService;
      peerPaymentService = self->_peerPaymentService;
      v23 = v10;
      v44 = v6;
      paymentService = self->_paymentService;
      paymentWebService = self->_paymentWebService;
      -[PKPaymentAuthorizationDataModel library](self->_model, "library");
      v42 = v8;
      v26 = v7;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = accountService;
      v9 = v40;
      v29 = paymentService;
      v10 = v23;
      v30 = paymentWebService;
      v6 = v44;
      v31 = -[PKPayLaterFinancingController initWithAccountService:paymentService:peerPaymentService:paymentWebService:passLibrary:payLaterAccount:configuration:](v20, "initWithAccountService:paymentService:peerPaymentService:paymentWebService:passLibrary:payLaterAccount:configuration:", v28, v29, peerPaymentService, v30, v27, 0, v12);
      financingController = self->_financingController;
      self->_financingController = v31;

      v7 = v26;
      v8 = v42;
      -[PKPayLaterFinancingController registerObserver:](self->_financingController, "registerObserver:", self);
      -[PKPaymentAuthorizationDataModel setFinancingController:](self->_model, "setFinancingController:", self->_financingController);
    }

  }
}

- (BOOL)_purchaseSupportsFinancingOptions
{
  int v3;
  PKPaymentAuthorizationDataModel *model;
  void *v5;
  void *v6;

  v3 = _os_feature_enabled_impl();
  if (v3)
  {
    if (self->_paymentWebService)
    {
      if (self->_accountService)
      {
        model = self->_model;
        if (model)
        {
          if (self->_paymentService && self->_peerPaymentService)
          {
            -[PKPaymentAuthorizationDataModel paymentRequest](model, "paymentRequest");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v5, "requestType") || -[PKPaymentAuthorizationDataModel mode](self->_model, "mode") != 1)
            {

            }
            else
            {
              -[PKPaymentAuthorizationDataModel remoteDevice](self->_model, "remoteDevice");
              v6 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v6)
              {
                LOBYTE(v3) = 1;
                return v3;
              }
            }
          }
        }
      }
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_fetchFinancingOptionsIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  if (self->_financingController && -[PKPaymentAuthorizationDataModel mode](self->_model, "mode") == 1)
  {
    -[PKPayLaterFinancingController configuration](self->_financingController, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel transactionAmount](self->_model, "transactionAmount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateTransactionAmount:", v4);

    v6 = 0;
    -[PKPaymentAuthorizationStateMachine _purchaseMerchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:adamIdentifier:isMerchantTokenRequest:isMultiTokenRequest:](self, "_purchaseMerchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:adamIdentifier:isMerchantTokenRequest:isMultiTokenRequest:", &v6, 0, 0, 0, 0, 0, 0);
    v5 = v6;
    if (v5)
      -[PKPayLaterFinancingController updateFinancingOptionsWithCompletion:](self->_financingController, "updateFinancingOptionsWithCompletion:", 0);

  }
}

- (void)payLaterFinancingAssessmentCollectionDidUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPaymentAuthorizationStateMachine *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__PKPaymentAuthorizationStateMachine_payLaterFinancingAssessmentCollectionDidUpdate___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __85__PKPaymentAuthorizationStateMachine_payLaterFinancingAssessmentCollectionDidUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD **)(a1 + 40);
  if (v2 == (void *)v3[17])
  {
    v4 = v3[14];
    v5 = v4 > 0x10;
    v6 = (1 << v4) & 0x1A000;
    if (v5 || v6 == 0)
    {
      objc_msgSend(v2, "assessmentCollection");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_updateFinancingAssessmentsWithCollection:", v8);

    }
  }
}

- (void)payLaterAvailableFundingSourcesDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPaymentAuthorizationStateMachine *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__PKPaymentAuthorizationStateMachine_payLaterAvailableFundingSourcesDidChange___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __79__PKPaymentAuthorizationStateMachine_payLaterAvailableFundingSourcesDidChange___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(v1 + 136))
    return objc_msgSend(*(id *)(v1 + 56), "refreshPaymentMethodsAndNotifyFinancingController:", 0);
  return result;
}

- (void)payLaterFinancingController:(id)a3 financingOptionCancelled:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  PKPaymentAuthorizationStateMachine *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__PKPaymentAuthorizationStateMachine_payLaterFinancingController_financingOptionCancelled___block_invoke;
  block[3] = &unk_1E2ABE0F8;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __91__PKPaymentAuthorizationStateMachine_payLaterFinancingController_financingOptionCancelled___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  int v10;
  id v11;

  v1 = a1[5];
  if (a1[4] == *(_QWORD *)(v1 + 136))
  {
    objc_msgSend(*(id *)(v1 + 56), "previouslySelectedFinancingOption");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
LABEL_14:

      return;
    }
    v11 = v3;
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)a1[6];
    v6 = v4;
    v7 = v5;
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      if (v6)
        v9 = v7 == 0;
      else
        v9 = 1;
      if (v9)
      {

LABEL_13:
        v3 = v11;
        goto LABEL_14;
      }
      v10 = objc_msgSend(v6, "isEqualToString:", v7);

      v3 = v11;
      if (!v10)
        goto LABEL_14;
    }
    objc_msgSend(*(id *)(a1[5] + 56), "beginUpdates");
    objc_msgSend(*(id *)(a1[5] + 56), "setPreviouslySelectedFinancingOption:", 0);
    objc_msgSend(*(id *)(a1[5] + 56), "refreshPaymentMethodsAndNotifyFinancingController:", 0);
    goto LABEL_13;
  }
}

- (void)_updateFinancingAssessmentsWithCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PKPaymentAuthorizationDataModel beginUpdates](self->_model, "beginUpdates");
  -[PKPaymentAuthorizationDataModel selectedFinancingOption](self->_model, "selectedFinancingOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel previouslySelectedFinancingOption](self->_model, "previouslySelectedFinancingOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v4, "selectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "financingOptionWithSelectionIdentifier:productType:", v7, objc_msgSend(v4, "productType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_3:
    -[PKPaymentAuthorizationDataModel setSelectedFinancingOption:](self->_model, "setSelectedFinancingOption:", v8);
    goto LABEL_4;
  }
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v5, "selectionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "financingOptionWithSelectionIdentifier:productType:", v9, objc_msgSend(v6, "productType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_3;
LABEL_4:

LABEL_5:
  -[PKPaymentAuthorizationDataModel setAssessmentCollection:](self->_model, "setAssessmentCollection:", v10);
  -[PKPaymentAuthorizationStateMachine _startAssessmentIfNecessary](self, "_startAssessmentIfNecessary");
  -[PKPaymentAuthorizationDataModel endUpdates](self->_model, "endUpdates");
  -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");

}

- (void)_removeWebServiceConfigurationIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  -[PKWebService sessionConfiguration](self->_paymentWebService, "sessionConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sourceApplicationBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (objc_msgSend(v5, "_sourceApplicationSecondaryIdentifier"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend(v5, "_CTDataConnectionServiceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_5;
  }
  objc_msgSend(v5, "set_sourceApplicationBundleIdentifier:", 0);
  objc_msgSend(v5, "set_sourceApplicationSecondaryIdentifier:", 0);
  objc_msgSend(v5, "set_CTDataConnectionServiceType:", 0);
  -[PKWebService refreshSessionWithConfiguration:](self->_paymentWebService, "refreshSessionWithConfiguration:", v5);
LABEL_5:

}

- (BOOL)useSecureElement
{
  return -[PKPaymentAuthorizationDataModel mode](self->_model, "mode") == 1;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  unint64_t state;
  const __CFString *v6;
  void *v7;
  NSMutableArray *callbackQueue;
  void *v9;
  _QWORD v11[4];
  id v12;
  PKPaymentAuthorizationStateMachine *v13;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  state = self->_state;
  if (state > 0x14)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AC84B8[state];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; state: %@"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_callbackQueue, "count"))
  {
    objc_msgSend(v7, "appendString:", CFSTR("; callbackQueue:\n"));
    callbackQueue = self->_callbackQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__PKPaymentAuthorizationStateMachine_description__block_invoke;
    v11[3] = &unk_1E2AC7C10;
    v12 = v7;
    v13 = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](callbackQueue, "enumerateObjectsUsingBlock:", v11);

  }
  objc_msgSend(v7, "appendString:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v7, "copy");

  return (NSString *)v9;
}

unint64_t __49__PKPaymentAuthorizationStateMachine_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  unint64_t result;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "objectAtIndex:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("    %@"), v6);

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "count");
  if (a3 + 1 < result)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(",\n"));
  return result;
}

- (void)_configurePaymentOffersIfNeeded
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  PKPaymentOffersControllerConfiguration *v8;
  PKPaymentOffersControllerConfiguration *v9;
  uint64_t v10;
  char isKindOfClass;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  PKPaymentOffersController *v18;
  id v19;
  PKPaymentService *paymentService;
  PKPaymentWebService *paymentWebService;
  void *v22;
  PKPaymentOffersController *v23;
  PKPaymentService *v24;
  PKPaymentOffersController *v25;
  PKPaymentOffersController *paymentOffersController;
  void *v27;
  void *v28;
  void *v29;
  PKPaymentOffersControllerConfiguration *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  unsigned __int8 v41[10];

  if (-[PKPaymentAuthorizationStateMachine _purchaseSupportsPaymentOffers](self, "_purchaseSupportsPaymentOffers"))
  {
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel totalSummaryItem](self->_model, "totalSummaryItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    *(_WORD *)v41 = 0;
    v39 = 0;
    v40 = 0;
    v37 = 0;
    v38 = 0;
    -[PKPaymentAuthorizationStateMachine _purchaseMerchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:adamIdentifier:isMerchantTokenRequest:isMultiTokenRequest:](self, "_purchaseMerchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:adamIdentifier:isMerchantTokenRequest:isMultiTokenRequest:", &v40, &v39, &v38, &v37, &v36, &v41[1], v41);
    v3 = v40;
    v4 = v39;
    v5 = v38;
    v6 = v37;
    v7 = v36;
    -[PKPaymentOffersController configuration](self->_paymentOffersController, "configuration");
    v8 = (PKPaymentOffersControllerConfiguration *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      -[PKPaymentOffersControllerConfiguration updateMerchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:](v8, "updateMerchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:", v3, v4, v5, v6);
    }
    else
    {
      v32 = v3;
      v10 = v41[0] | (2 * v41[1]);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 |= 4uLL;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v12 = v10 | 8;
      if ((isKindOfClass & 1) == 0)
        v12 = v10;
      v31 = v12;
      v30 = [PKPaymentOffersControllerConfiguration alloc];
      -[PKPaymentAuthorizationDataModel transactionAmount](self->_model, "transactionAmount");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel currencyCode](self->_model, "currencyCode");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "countryCode");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel merchantName](self->_model, "merchantName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "supportedNetworks");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PKPaymentOffersControllerConfiguration initWithTransactionAmount:currencyCode:merchantCountryCode:merchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:merchantName:adamIdentifier:supportedNetworks:merchantCapabilities:payLaterSuppressionMode:options:](v30, "initWithTransactionAmount:currencyCode:merchantCountryCode:merchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:merchantName:adamIdentifier:supportedNetworks:merchantCapabilities:payLaterSuppressionMode:options:", v27, v29, v28, v32, v4, v5, v6, v13, v7, v14, objc_msgSend(v34, "merchantCapabilities"), objc_msgSend(v34, "applePayLaterAvailability"), v31);

      v3 = v32;
    }
    if (!self->_paymentOffersController)
    {
      v33 = v6;
      v15 = v5;
      v16 = v4;
      v17 = v3;
      v18 = [PKPaymentOffersController alloc];
      v19 = v7;
      paymentService = self->_paymentService;
      paymentWebService = self->_paymentWebService;
      -[PKPaymentAuthorizationDataModel library](self->_model, "library");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v18;
      v3 = v17;
      v4 = v16;
      v5 = v15;
      v6 = v33;
      v24 = paymentService;
      v7 = v19;
      v25 = -[PKPaymentOffersController initWithPaymentService:paymentWebService:passLibrary:configuration:](v23, "initWithPaymentService:paymentWebService:passLibrary:configuration:", v24, paymentWebService, v22, v9);
      paymentOffersController = self->_paymentOffersController;
      self->_paymentOffersController = v25;

      -[PKPaymentOffersController registerObserver:](self->_paymentOffersController, "registerObserver:", self);
      -[PKPaymentAuthorizationDataModel setPaymentOffersController:](self->_model, "setPaymentOffersController:", self->_paymentOffersController);
    }

  }
}

- (void)_fetchPaymentOffersIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  char v12;
  NSObject *v13;
  PKPaymentOffersController *paymentOffersController;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_paymentOffersController && -[PKPaymentAuthorizationDataModel mode](self->_model, "mode") == 1)
  {
    -[PKPaymentOffersController configuration](self->_paymentOffersController, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "transactionAmount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentAuthorizationDataModel transactionAmount](self->_model, "transactionAmount");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v4 && v5)
      v7 = objc_msgSend(v4, "isEqual:", v5);
    else
      v7 = v4 == (void *)v5;
    -[PKPaymentOffersController configuration](self->_paymentOffersController, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateTransactionAmount:", v6);

    v20 = 0;
    -[PKPaymentAuthorizationStateMachine _purchaseMerchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:adamIdentifier:isMerchantTokenRequest:isMultiTokenRequest:](self, "_purchaseMerchantIdentifier:originURL:webMerchantIdentifier:webMerchantName:adamIdentifier:isMerchantTokenRequest:isMultiTokenRequest:", &v20, 0, 0, 0, 0, 0, 0);
    v9 = v20;
    if (v9)
    {
      if (!-[PKPaymentOffersController hasFetchedCatalogFromServer](self->_paymentOffersController, "hasFetchedCatalogFromServer"))-[PKPaymentOffersController updatePaymentOfferCatalogWithCompletion:](self->_paymentOffersController, "updatePaymentOfferCatalogWithCompletion:", 0);
      -[PKPaymentAuthorizationDataModel selectedPaymentOffer](self->_model, "selectedPaymentOffer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode");
      if (v11 >= 2)
      {
        if (v11 == 2)
        {
          v12 = v10 ? v7 : 1;
          if ((v12 & 1) == 0)
          {
            if (objc_msgSend(v10, "type") == 1)
            {
              PKLogFacilityTypeGetObject(7uLL);
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v22 = v4;
                v23 = 2112;
                v24 = v6;
                _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Payment sheet total amount has changed from %@ to %@. Updating payment offers now.", buf, 0x16u);
              }

              -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 19, 0);
              paymentOffersController = self->_paymentOffersController;
              objc_msgSend(v10, "criteriaIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "paymentPass");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPaymentOffersController updatePaymentOffersForCriteriaIdentifier:paymentPass:reason:completion:](paymentOffersController, "updatePaymentOffersForCriteriaIdentifier:paymentPass:reason:completion:", v15, v16, 5, 0);

            }
            if (objc_msgSend(v10, "type") == 2)
            {
              objc_msgSend(v10, "rewardsRedemptionIntent");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "monetaryValue");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "amount");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17 && objc_msgSend(v6, "compare:", v19) == -1)
              {
                -[PKPaymentOffersController clearCurrentSelectedPaymentOfferDetails](self->_paymentOffersController, "clearCurrentSelectedPaymentOfferDetails");
                -[PKPaymentAuthorizationStateMachine didChangeFundingMode:](self, "didChangeFundingMode:", 0);
              }

            }
          }
        }
      }
      else if ((v7 & 1) == 0)
      {
        -[PKPaymentOffersController removeCachedPaymentOffers](self->_paymentOffersController, "removeCachedPaymentOffers");
      }

    }
  }
}

- (BOOL)_purchaseSupportsPaymentOffers
{
  int v3;
  PKPaymentAuthorizationDataModel *model;
  void *v5;
  void *v6;

  v3 = PKMagmaEnabled();
  if (v3)
  {
    if (self->_paymentWebService)
    {
      model = self->_model;
      if (model)
      {
        if (self->_paymentService)
        {
          -[PKPaymentAuthorizationDataModel paymentRequest](model, "paymentRequest");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v5, "requestType") || -[PKPaymentAuthorizationDataModel mode](self->_model, "mode") != 1)
          {

          }
          else
          {
            -[PKPaymentAuthorizationDataModel remoteDevice](self->_model, "remoteDevice");
            v6 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v6)
            {
              LOBYTE(v3) = 1;
              return v3;
            }
          }
        }
      }
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)paymentOfferCatalogChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPaymentAuthorizationStateMachine *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PKPaymentAuthorizationStateMachine_paymentOfferCatalogChanged___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __65__PKPaymentAuthorizationStateMachine_paymentOfferCatalogChanged___block_invoke(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v6;

  v1 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(v1 + 272))
  {
    v2 = *(_QWORD *)(v1 + 112);
    v3 = v2 > 0x10;
    v4 = (1 << v2) & 0x1A000;
    if (v3 || v4 == 0)
    {
      v6 = result;
      objc_msgSend(*(id *)(v1 + 56), "beginUpdates");
      objc_msgSend(*(id *)(*(_QWORD *)(v6 + 40) + 56), "paymentOffersDidUpdate");
      objc_msgSend(*(id *)(*(_QWORD *)(v6 + 40) + 56), "endUpdates");
      return objc_msgSend(*(id *)(v6 + 40), "_advanceToNextState");
    }
  }
  return result;
}

- (void)paymentOffersChanged:(id)a3 forPassUniqueIdentifier:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PKPaymentAuthorizationStateMachine *v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__PKPaymentAuthorizationStateMachine_paymentOffersChanged_forPassUniqueIdentifier___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __83__PKPaymentAuthorizationStateMachine_paymentOffersChanged_forPassUniqueIdentifier___block_invoke(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v6;

  v1 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(v1 + 272))
  {
    v2 = *(_QWORD *)(v1 + 112);
    v3 = v2 > 0x10;
    v4 = (1 << v2) & 0x1A000;
    if (v3 || v4 == 0)
    {
      v6 = result;
      objc_msgSend(*(id *)(v1 + 56), "beginUpdates");
      objc_msgSend(*(id *)(*(_QWORD *)(v6 + 40) + 56), "paymentOffersDidUpdate");
      objc_msgSend(*(id *)(*(_QWORD *)(v6 + 40) + 56), "endUpdates");
      return objc_msgSend(*(id *)(v6 + 40), "_advanceToNextState");
    }
  }
  return result;
}

- (void)paymentOfferActionsChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPaymentAuthorizationStateMachine *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PKPaymentAuthorizationStateMachine_paymentOfferActionsChanged___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __65__PKPaymentAuthorizationStateMachine_paymentOfferActionsChanged___block_invoke(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v6;

  v1 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(v1 + 272))
  {
    v2 = *(_QWORD *)(v1 + 112);
    v3 = v2 > 0x10;
    v4 = (1 << v2) & 0x1A000;
    if (v3 || v4 == 0)
    {
      v6 = result;
      objc_msgSend(*(id *)(v1 + 56), "beginUpdates");
      objc_msgSend(*(id *)(*(_QWORD *)(v6 + 40) + 56), "paymentOffersDidUpdate");
      objc_msgSend(*(id *)(*(_QWORD *)(v6 + 40) + 56), "endUpdates");
      return objc_msgSend(*(id *)(v6 + 40), "_advanceToNextState");
    }
  }
  return result;
}

- (void)selectedPaymentOfferChanged:(id)a3 forPassUniqueIdentifier:(id)a4
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
  block[2] = __90__PKPaymentAuthorizationStateMachine_selectedPaymentOfferChanged_forPassUniqueIdentifier___block_invoke;
  block[3] = &unk_1E2ABE0F8;
  block[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __90__PKPaymentAuthorizationStateMachine_selectedPaymentOfferChanged_forPassUniqueIdentifier___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  char v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*((id *)a1[4] + 7), "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = a1[5];
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {

LABEL_10:
    objc_msgSend(*((id *)a1[4] + 7), "beginUpdates");
    objc_msgSend(a1[6], "selectedOfferDetails");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = a1[4];
    -[NSObject selectedPaymentOffer](v9, "selectedPaymentOffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didSelectPaymentOffer:updateReason:", v11, 2);

    objc_msgSend(*((id *)a1[4] + 7), "endUpdates");
    objc_msgSend(a1[4], "_advanceToNextState");
    goto LABEL_13;
  }
  if (v5)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (v7)
  {

  }
  else
  {
    v8 = objc_msgSend(v4, "isEqualToString:", v5);

    if ((v8 & 1) != 0)
      goto LABEL_10;
  }
  PKLogFacilityTypeGetObject(7uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a1[5];
    v13 = 138412546;
    v14 = v12;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Error: Payment Offers Controller updated the selected offer for pass %@, but the selected pass is %@", (uint8_t *)&v13, 0x16u);
  }
LABEL_13:

}

- (void)paymentOfferDynamicContentChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PKPaymentAuthorizationStateMachine_paymentOfferDynamicContentChanged___block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __72__PKPaymentAuthorizationStateMachine_paymentOfferDynamicContentChanged___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "beginUpdates");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "paymentOffersDidUpdate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "endUpdates");
  return objc_msgSend(*(id *)(a1 + 32), "_advanceToNextState");
}

- (void)start
{
  NSObject *v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  int64_t v12;
  PKContinuityPaymentCoordinator *v13;
  PKContinuityPaymentCoordinator *continuityPaymentCoordinator;
  void *v15;
  void *v16;
  char v17;
  __CFString *v18;
  __CFString **v19;
  NSObject *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __CFString **v30;
  int v31;
  __CFString *v32;
  PKAggregateDictionaryProtocol *aggregateDictionary;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  const __CFString *v45;
  void *v46;
  uint8_t v47[128];
  uint8_t buf[4];
  __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(7uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = PKPaymentAuthorizationModeDescriptions[-[PKPaymentAuthorizationDataModel mode](self->_model, "mode")];
    *(_DWORD *)buf = 138412290;
    v49 = v4;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "State machine starting for mode: %@", buf, 0xCu);
  }

  self->_hostApplicationState = 0;
  -[PKPaymentAuthorizationStateMachine _postStateMachineWillStartNotification](self, "_postStateMachineWillStartNotification");
  -[PKPaymentAuthorizationStateMachine _registerForNotifications](self, "_registerForNotifications");
  if (self->_state)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Invalid state"));
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = objc_msgSend(&unk_1E2C3DE70, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v42;
    v8 = *MEMORY[0x1E0C99768];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(&unk_1E2C3DE70);
        v10 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        -[PKPaymentAuthorizationStateMachine valueForKey:](self, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v8, CFSTR("Missing required property '%@'"), v10);
      }
      v6 = objc_msgSend(&unk_1E2C3DE70, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v6);
  }
  v12 = -[PKPaymentAuthorizationDataModel mode](self->_model, "mode");
  if (v12 != 1 && v12 != 3)
  {
    if (v12 == 2)
    {
      if (self->_continuityPaymentService)
      {
        v13 = -[PKContinuityPaymentCoordinator initWithContinuityPaymentService:]([PKContinuityPaymentCoordinator alloc], "initWithContinuityPaymentService:", self->_continuityPaymentService);
        continuityPaymentCoordinator = self->_continuityPaymentCoordinator;
        self->_continuityPaymentCoordinator = v13;

        -[PKContinuityPaymentCoordinator setUpdatePaymentDeviceTimeout:](self->_continuityPaymentCoordinator, "setUpdatePaymentDeviceTimeout:", self->_updatePaymentDeviceTimeout);
        -[PKContinuityPaymentCoordinator setDelegate:](self->_continuityPaymentCoordinator, "setDelegate:", self);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Missing required property 'continuityPaymentService'"), v39);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Invalid mode: %d"), -[PKPaymentAuthorizationDataModel mode](self->_model, "mode"));
    }
  }
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentRequestValidator validatorWithObject:](PKPaymentRequestValidator, "validatorWithObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v17 = objc_msgSend(v16, "isValidWithError:", &v40);
  v18 = (__CFString *)v40;

  if ((v17 & 1) != 0)
  {
    if ((objc_msgSend(v15, "_isAMPPayment") & 1) != 0)
    {
      v19 = PKAggDKeyPaymentiTunesPurchasePresented;
    }
    else
    {
      if (objc_msgSend(v15, "requestType"))
      {
LABEL_30:
        -[PKPaymentAuthorizationStateMachine _start](self, "_start");
        goto LABEL_31;
      }
      v19 = PKAggDKeyPaymentInAppPaymentPresent;
    }
    v22 = *v19;
    AnalyticsSendEvent();
    -[PKAggregateDictionaryProtocol addValueForScalarKey:value:](self->_aggregateDictionary, "addValueForScalarKey:value:", v22, 1);
    goto LABEL_30;
  }
  PKLogFacilityTypeGetObject(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v49 = v18;
    _os_log_error_impl(&dword_18FC92000, v20, OS_LOG_TYPE_ERROR, "Payment is invalid: %{public}@", buf, 0xCu);
  }

  +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 15, v21);

LABEL_31:
  -[PKPaymentAuthorizationStateMachine _startAssessmentIfNecessary](self, "_startAssessmentIfNecessary");
  objc_msgSend(v15, "multiTokenContexts");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count")
    && !-[PKPaymentAuthorizationStateMachine _isMultiTokenContextsSupported](self, "_isMultiTokenContextsSupported"))
  {
    -[PKPaymentAuthorizationDataModel beginUpdates](self->_model, "beginUpdates");
    -[PKPaymentAuthorizationDataModel setMultiTokenContexts:](self->_model, "setMultiTokenContexts:", MEMORY[0x1E0C9AA60]);
    -[PKPaymentAuthorizationDataModel endUpdates](self->_model, "endUpdates");
  }
  objc_msgSend(v15, "recurringPaymentRequest");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "automaticReloadPaymentRequest");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deferredPaymentRequest");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v24 || v25 || v26)
    && !-[PKPaymentAuthorizationStateMachine _isMerchantTokensSupported](self, "_isMerchantTokensSupported"))
  {
    -[PKPaymentAuthorizationDataModel beginUpdates](self->_model, "beginUpdates");
    -[PKPaymentAuthorizationDataModel setRecurringPaymentRequest:](self->_model, "setRecurringPaymentRequest:", 0);
    -[PKPaymentAuthorizationDataModel setAutomaticReloadPaymentRequest:](self->_model, "setAutomaticReloadPaymentRequest:", 0);
    -[PKPaymentAuthorizationDataModel endUpdates](self->_model, "endUpdates");
  }
  objc_msgSend(v15, "thumbnailURLs");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (v28)
  {
    AnalyticsSendEvent();
    -[PKAggregateDictionaryProtocol addValueForScalarKey:value:](self->_aggregateDictionary, "addValueForScalarKey:value:", CFSTR("com.apple.passbook.payment.in-app.thumbnail"), 1);
  }
  if (!objc_msgSend(v15, "requestType"))
  {
    objc_msgSend(v15, "merchantSession");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {

      v30 = PKAggDKeyPaymentInAppUsesMerchantSession;
    }
    else
    {
      v31 = objc_msgSend(v15, "shouldUseMerchantSession");
      v30 = PKAggDKeyPaymentInAppUsesMerchantIdentifier;
      if (v31)
        v30 = PKAggDKeyPaymentInAppUsesMerchantSession;
    }
    v32 = *v30;
    AnalyticsSendEvent();
    -[PKAggregateDictionaryProtocol addValueForScalarKey:value:](self->_aggregateDictionary, "addValueForScalarKey:value:", v32, 1);
  }
  aggregateDictionary = self->_aggregateDictionary;
  v34 = (void *)MEMORY[0x1E0CB3940];
  PKAggDKeyForPaymentRequestAPIType(objc_msgSend(v15, "APIType"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.passbook.payment.api"), v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAggregateDictionaryProtocol addValueForScalarKey:value:](aggregateDictionary, "addValueForScalarKey:value:", v36, 1);

  v45 = CFSTR("api");
  PKAggDKeyForPaymentRequestAPIType(objc_msgSend(v15, "APIType"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  -[PKPaymentAuthorizationStateMachine _applyWebServiceConfigurationIfNeeded](self, "_applyWebServiceConfigurationIfNeeded");
  -[PKPaymentAuthorizationStateMachine _fetchAdditionalPaymentMethodDataIfNeeded](self, "_fetchAdditionalPaymentMethodDataIfNeeded");
  -[PKPaymentAuthorizationStateMachine _updateModelCanAddPasses](self, "_updateModelCanAddPasses");

}

- (void)invalidate
{
  PKPayLaterFinancingController *financingController;
  PKPaymentOffersController *paymentOffersController;

  -[PKPayLaterFinancingController unregisterObserver:](self->_financingController, "unregisterObserver:", self);
  -[PKPayLaterFinancingController invalidate](self->_financingController, "invalidate");
  financingController = self->_financingController;
  self->_financingController = 0;

  -[PKPaymentOffersController unregisterObserver:](self->_paymentOffersController, "unregisterObserver:", self);
  -[PKPaymentOffersController invalidate](self->_paymentOffersController, "invalidate");
  paymentOffersController = self->_paymentOffersController;
  self->_paymentOffersController = 0;

}

- (void)_startAssessmentIfNecessary
{
  void *v3;
  int v4;
  PKODITransactionAssessment *v5;
  PKODITransactionAssessment *odiTransactionAssessment;
  PKODITransactionAssessment *v7;
  NSObject *v8;
  PKODITransactionAssessment *v9;
  void *v10;
  void *v11;
  PKODIServiceProviderAssessment *v12;
  PKODIServiceProviderAssessment *odiServiceProviderAssessment;
  PKODIServiceProviderAssessment *v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[PKPaymentAuthorizationDataModel mode](self->_model, "mode") == 1)
  {
    if (!self->_odiTransactionAssessment
      && -[PKPaymentAuthorizationStateMachine _isDeviceTransactionAssessmentEnabled](self, "_isDeviceTransactionAssessmentEnabled"))
    {
      if (_os_feature_enabled_impl()
        && (-[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            v4 = objc_msgSend(v3, "isServiceProviderPaymentRequest"),
            v3,
            v4))
      {
        v5 = -[PKODITransactionAssessment initWithAssessmentType:]([PKODITransactionAssessment alloc], "initWithAssessmentType:", 1);
      }
      else
      {
        v5 = objc_alloc_init(PKODITransactionAssessment);
      }
      odiTransactionAssessment = self->_odiTransactionAssessment;
      self->_odiTransactionAssessment = v5;

      v7 = self->_odiTransactionAssessment;
      if (v7)
      {
        PKLogFacilityTypeGetObject(6uLL);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 138412290;
          v17 = v7;
          _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Starting CoreODI assessment %@", (uint8_t *)&v16, 0xCu);
        }

        v9 = self->_odiTransactionAssessment;
        -[PKPaymentAuthorizationDataModel bundleIdentifier](self->_model, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKODIAssessment startAssessmentWithHostBundleIdentifier:](v9, "startAssessmentWithHostBundleIdentifier:", v10);

      }
    }
    if (!self->_odiServiceProviderAssessment
      && -[PKPaymentAuthorizationStateMachine _isServiceProviderAssessmentEnabled](self, "_isServiceProviderAssessmentEnabled"))
    {
      -[PKPaymentAuthorizationStateMachine _odiServiceProviderAssessmentIdentifier](self, "_odiServiceProviderAssessmentIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PKODIServiceProviderAssessment initWithServiceProviderIdentifier:locationBundle:]([PKODIServiceProviderAssessment alloc], "initWithServiceProviderIdentifier:locationBundle:", v11, 0);
      odiServiceProviderAssessment = self->_odiServiceProviderAssessment;
      self->_odiServiceProviderAssessment = v12;

      v14 = self->_odiServiceProviderAssessment;
      if (v14)
      {
        PKLogFacilityTypeGetObject(6uLL);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 138412290;
          v17 = v14;
          _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Starting CoreODI assessment %@", (uint8_t *)&v16, 0xCu);
        }

        -[PKODIAssessment startAssessment](self->_odiServiceProviderAssessment, "startAssessment");
      }

    }
  }
}

- (id)_activeODIAssessment
{
  void *v3;
  uint64_t v4;
  int64_t v5;

  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isPayLaterPaymentRequest") & 1) != 0)
  {

    v4 = 224;
  }
  else
  {
    v5 = -[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode");

    v4 = 216;
    if (v5 == 1)
      v4 = 224;
  }
  return *(id *)((char *)&self->super.isa + v4);
}

- (BOOL)canSelectPaymentOptions
{
  unint64_t state;

  state = self->_state;
  if (state > 8)
    return 0;
  if (((1 << state) & 0x17A) == 0)
  {
    if (state == 7)
      return -[PKPaymentAuthorizationClientCallbackStateParam kind](self->_mostRecentClientCallback, "kind") != 5;
    return 0;
  }
  return 1;
}

- (void)didResignActive:(BOOL)a3
{
  uint64_t v3;

  v3 = 1;
  if (!a3)
    v3 = 2;
  self->_hostApplicationState |= v3;
  if (self->_state == 5)
    -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");
}

- (void)didBecomeActive:(BOOL)a3
{
  uint64_t v3;
  unint64_t state;
  BOOL v5;
  uint64_t v6;

  v3 = -4;
  if (!a3)
    v3 = -3;
  self->_hostApplicationState &= v3;
  state = self->_state;
  v5 = state > 0x10;
  v6 = (1 << state) & 0x1A008;
  if (v5 || v6 == 0)
    -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");
}

- (void)didBecomeOccluded:(BOOL)a3
{
  unint64_t hostApplicationState;
  unint64_t state;
  BOOL v5;
  uint64_t v6;

  hostApplicationState = self->_hostApplicationState;
  if (a3)
  {
    self->_hostApplicationState = hostApplicationState | 4;
  }
  else
  {
    self->_hostApplicationState = hostApplicationState & 0xFFFFFFFFFFFFFFFBLL;
    if ((hostApplicationState & 4) == 0)
      return;
  }
  state = self->_state;
  v5 = state > 0x10;
  v6 = (1 << state) & 0x1A008;
  if (v5 || v6 == 0)
    -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");
}

- (void)didBecomeArmable:(BOOL)a3
{
  unint64_t hostApplicationState;
  unint64_t state;
  BOOL v5;
  uint64_t v6;

  hostApplicationState = self->_hostApplicationState;
  if (a3)
  {
    self->_hostApplicationState = hostApplicationState & 0xFFFFFFFFFFFFFFF7;
    if ((hostApplicationState & 8) == 0)
      return;
  }
  else
  {
    self->_hostApplicationState = hostApplicationState | 8;
  }
  state = self->_state;
  v5 = state > 0x10;
  v6 = (1 << state) & 0x1A008;
  if (v5 || v6 == 0)
    -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");
}

- (void)setCancelReason:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(7uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    PKPaymentAuthorizationStateMachineCancelReasonToString(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Setting state machine cancel reason to \"%@\", (uint8_t *)&v7, 0xCu);

  }
  self->_cancelReason = a3;
}

- (void)didCancel
{
  NSObject *v3;
  unint64_t state;
  BOOL v5;
  uint64_t v6;
  void *v8;
  void *v9;
  char v10;
  __CFString **v11;
  __CFString *v12;
  void *v13;
  uint8_t v14[16];

  PKLogFacilityTypeGetObject(7uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Received cancel", v14, 2u);
  }

  state = self->_state;
  v5 = state > 0x10;
  v6 = (1 << state) & 0x1A000;
  if (v5 || v6 == 0)
  {
    -[PKPaymentAuthorizationStateMachine _reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:eventType:](self, "_reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:eventType:", 0, CFSTR("transactionAuthorizationCanceled"));
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_isAMPPayment");

    if ((v10 & 1) != 0)
    {
      v11 = PKAggDKeyPaymentiTunesPurchaseCancel;
    }
    else
    {
      if (objc_msgSend(v8, "requestType"))
      {
LABEL_13:
        -[PKContinuityPaymentCoordinator currentRemotePaymentRequest](self->_continuityPaymentCoordinator, "currentRemotePaymentRequest");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          -[PKPaymentAuthorizationStateMachine _performCancelRemotePaymentRequest](self, "_performCancelRemotePaymentRequest");
        if (self->_odiAssessmentInFlight)
        {
          -[PKODIAssessment provideSessionFeedback:](self->_odiTransactionAssessment, "provideSessionFeedback:", 1);
          -[PKODIAssessment provideSessionFeedback:](self->_odiServiceProviderAssessment, "provideSessionFeedback:", 1);
          self->_odiAssessmentInFlight = 0;
        }
        -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 13, 0);

        return;
      }
      v11 = PKAggDKeyPaymentInAppPaymentCancel;
    }
    v12 = *v11;
    AnalyticsSendEvent();
    -[PKAggregateDictionaryProtocol addValueForScalarKey:value:](self->_aggregateDictionary, "addValueForScalarKey:value:", v12, 1);
    goto LABEL_13;
  }
}

- (void)didEncounterError:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t state;
  BOOL v7;
  uint64_t v8;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject(7uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_error_impl(&dword_18FC92000, v5, OS_LOG_TYPE_ERROR, "Received error from client: %@", (uint8_t *)&v11, 0xCu);
  }

  state = self->_state;
  v7 = state > 0x10;
  v8 = (1 << state) & 0x1A000;
  if (v7 || v8 == 0)
  {
    +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 14, v10);

  }
}

- (void)didEncounterFatalError:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t state;
  BOOL v7;
  uint64_t v8;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject(7uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_error_impl(&dword_18FC92000, v5, OS_LOG_TYPE_ERROR, "Received fatal error from client: %@", (uint8_t *)&v11, 0xCu);
  }

  state = self->_state;
  v7 = state > 0x10;
  v8 = (1 << state) & 0x1A000;
  if (v7 || v8 == 0)
  {
    +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 15, v10);

  }
}

- (void)didResolveError
{
  unint64_t state;
  BOOL v3;
  uint64_t v4;
  NSObject *v6;
  uint8_t v7[16];

  state = self->_state;
  v3 = state > 0xE;
  v4 = (1 << state) & 0x4028;
  if (v3 || v4 == 0)
  {
    PKLogFacilityTypeGetObject(7uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Called didResolveError but not in error or authenticate state", v7, 2u);
    }

  }
  else
  {
    -[PKPaymentAuthorizationStateMachine _advanceToNextStateFromResolveError:](self, "_advanceToNextStateFromResolveError:", 1);
  }
}

- (void)didResolveLoadingState
{
  unint64_t state;
  BOOL v3;
  uint64_t v4;

  state = self->_state;
  v3 = state > 7;
  v4 = (1 << state) & 0xC8;
  if (!v3 && v4 != 0)
    -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");
}

- (void)didReceiveMerchantSessionCompleteWithSession:(id)a3 error:(id)a4
{
  BOOL v5;
  uint64_t v6;
  id v7;
  PKPaymentRequestMerchantSessionUpdate *v8;

  if (a3)
    v5 = a4 == 0;
  else
    v5 = 0;
  v6 = !v5;
  v7 = a3;
  v8 = -[PKPaymentRequestMerchantSessionUpdate initWithStatus:merchantSession:]([PKPaymentRequestMerchantSessionUpdate alloc], "initWithStatus:merchantSession:", v6, v7);

  -[PKPaymentAuthorizationStateMachine didReceiveMerchantSessionCompleteWithUpdate:](self, "didReceiveMerchantSessionCompleteWithUpdate:", v8);
}

- (void)didReceiveMerchantSessionCompleteWithUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  unint64_t state;
  BOOL v10;
  uint64_t v11;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _QWORD aBlock[5];
  _QWORD v39[2];
  _QWORD v40[2];
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject(7uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "status");
    v7 = CFSTR("PKPaymentAuthorizationStatusSuccess");
    switch(v6)
    {
      case 0:
        break;
      case 1:
        v7 = CFSTR("PKPaymentAuthorizationStatusFailure");
        break;
      case 2:
        v7 = CFSTR("PKPaymentAuthorizationStatusInvalidBillingPostalAddress");
        break;
      case 3:
        v7 = CFSTR("PKPaymentAuthorizationStatusInvalidShippingPostalAddress");
        break;
      case 4:
        v7 = CFSTR("PKPaymentAuthorizationStatusInvalidShippingContact");
        break;
      case 5:
        v7 = CFSTR("PKPaymentAuthorizationStatusPINRequired");
        break;
      case 6:
        v7 = CFSTR("PKPaymentAuthorizationStatusPINIncorrect");
        break;
      case 7:
        v7 = CFSTR("PKPaymentAuthorizationStatusPINLockout");
        break;
      default:
        if (v6 == 1000)
          v7 = CFSTR("PKPaymentAuthorizationStatusTryAgain");
        else
          v7 = CFSTR("unknown");
        break;
    }
    objc_msgSend(v4, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v42 = v7;
    v43 = 2112;
    v44 = v8;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Received merchant session update with status:%@ session:%@", buf, 0x16u);

  }
  state = self->_state;
  v10 = state > 0x10;
  v11 = (1 << state) & 0x1A000;
  if (v10 || v11 == 0)
  {
    self->_awaitingClientCallbackReply = 0;
    -[PKPaymentAuthorizationStateMachine _cancelClientCallbackTimer](self, "_cancelClientCallbackTimer");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__PKPaymentAuthorizationStateMachine_didReceiveMerchantSessionCompleteWithUpdate___block_invoke;
    aBlock[3] = &unk_1E2ABE120;
    aBlock[4] = self;
    v13 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(v4, "status")
      || (objc_msgSend(v4, "session"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, !v14))
    {
      v13[2](v13);
    }
    else
    {
      objc_msgSend(v4, "session");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((PKBypassCertValidation() & 1) != 0)
      {
        v16 = 0;
      }
      else
      {
        PKValidatePaymentMerchantSession(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v17 != 0;

      }
      -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "APIType");

      if ((unint64_t)(v19 - 1) > 1)
      {
        v22 = 0;
      }
      else
      {
        -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v20, "originatingURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v20) = objc_msgSend(v15, "supportsURL:", v21);
        v22 = v20 ^ 1;
      }
      if (((v16 | v22) & 1) != 0)
      {
        v13[2](v13);
      }
      else
      {
        -[PKPaymentAuthorizationDataModel beginUpdates](self->_model, "beginUpdates");
        -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setMerchantSession:", v15);

        -[PKPaymentAuthorizationDataModel endUpdates](self->_model, "endUpdates");
        objc_msgSend(v15, "merchantIdentifier");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        if (v24)
        {
          v39[0] = CFSTR("eventType");
          v39[1] = CFSTR("merchantIdentifier");
          v40[0] = CFSTR("stateChange");
          v40[1] = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
          v26 = v25;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("inApp"), v27);

          v25 = v26;
        }
        objc_msgSend(v15, "operationalAnalyticsIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v36 = v25;
          v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v29, "setObject:forKeyedSubscript:", CFSTR("stateChange"), CFSTR("eventType"));
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("analyticsIdentifier"));
          -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "originatingURL");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            objc_msgSend(v31, "host");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, CFSTR("merchantDomain"));

          }
          v33 = (void *)objc_msgSend(v29, "copy", v36);
          +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("inApp"), v33);

          v25 = v37;
        }
        -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "requestType");

        if (v35 == 5)
          -[PKPaymentAuthorizationStateMachine _performInstallmentBind](self, "_performInstallmentBind");
        else
          -[PKPaymentAuthorizationStateMachine _enqueueInitialCallbacks](self, "_enqueueInitialCallbacks");
        -[PKPaymentAuthorizationStateMachine _configureAdditionalPaymentMethodsIfNeeeded](self, "_configureAdditionalPaymentMethodsIfNeeeded");
        -[PKPaymentAuthorizationStateMachine _fetchAdditionalPaymentMethodDataIfNeeded](self, "_fetchAdditionalPaymentMethodDataIfNeeded");
        -[PKPaymentAuthorizationStateMachine _updatePassRewardsInfo](self, "_updatePassRewardsInfo");

      }
    }

  }
}

void __82__PKPaymentAuthorizationStateMachine_didReceiveMerchantSessionCompleteWithUpdate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject(7uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "Application failed to provide a valid merchant session. We can't proceed to authorize the transaction.", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setState:param:", 15, v5);

}

- (void)didChangeCouponCode:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  id v8;

  v4 = a3;
  -[PKPaymentAuthorizationDataModel couponCode](self->_model, "couponCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v6 = v5;
  if (v6 == v8)
  {

  }
  else
  {
    if (v8 && v6)
    {
      v7 = objc_msgSend(v8, "isEqualToString:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[PKPaymentAuthorizationDataModel beginUpdates](self->_model, "beginUpdates");
    -[PKPaymentAuthorizationDataModel setNumberOfOutstandingCouponCodeUpdates:](self->_model, "setNumberOfOutstandingCouponCodeUpdates:", -[PKPaymentAuthorizationDataModel numberOfOutstandingCouponCodeUpdates](self->_model, "numberOfOutstandingCouponCodeUpdates")+ 1);
    -[PKPaymentAuthorizationDataModel setCouponCode:](self->_model, "setCouponCode:", v8);
    -[PKPaymentAuthorizationDataModel endUpdates](self->_model, "endUpdates");
    -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 10, v8);
  }
LABEL_9:

}

- (void)didReceiveCouponCodeCompleteWithUpdate:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  unint64_t state;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "status");
  PKLogFacilityTypeGetObject(7uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("PKPaymentAuthorizationStatusSuccess");
    switch(v6)
    {
      case 0:
        break;
      case 1:
        v10 = CFSTR("PKPaymentAuthorizationStatusFailure");
        break;
      case 2:
        v10 = CFSTR("PKPaymentAuthorizationStatusInvalidBillingPostalAddress");
        break;
      case 3:
        v10 = CFSTR("PKPaymentAuthorizationStatusInvalidShippingPostalAddress");
        break;
      case 4:
        v10 = CFSTR("PKPaymentAuthorizationStatusInvalidShippingContact");
        break;
      case 5:
        v10 = CFSTR("PKPaymentAuthorizationStatusPINRequired");
        break;
      case 6:
        v10 = CFSTR("PKPaymentAuthorizationStatusPINIncorrect");
        break;
      case 7:
        v10 = CFSTR("PKPaymentAuthorizationStatusPINLockout");
        break;
      default:
        if (v6 == 1000)
          v10 = CFSTR("PKPaymentAuthorizationStatusTryAgain");
        else
          v10 = CFSTR("unknown");
        break;
    }
    *(_DWORD *)buf = 138412546;
    v22 = v8;
    v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Received %@ status: %{public}@", buf, 0x16u);

  }
  -[PKPaymentAuthorizationDataModel beginUpdates](self->_model, "beginUpdates");
  -[PKPaymentAuthorizationDataModel setNumberOfOutstandingCouponCodeUpdates:](self->_model, "setNumberOfOutstandingCouponCodeUpdates:", -[PKPaymentAuthorizationDataModel numberOfOutstandingCouponCodeUpdates](self->_model, "numberOfOutstandingCouponCodeUpdates")- 1);
  objc_msgSend(v5, "errors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel setCouponCodeErrors:](self->_model, "setCouponCodeErrors:", v11);
  -[PKPaymentAuthorizationDataModel endUpdates](self->_model, "endUpdates");
  if (!-[PKPaymentAuthorizationDataModel numberOfOutstandingCouponCodeUpdates](self->_model, "numberOfOutstandingCouponCodeUpdates"))
  {
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine _trackCouponCodeOutcomeWithError:](self, "_trackCouponCodeOutcomeWithError:", v12);

  }
  state = self->_state;
  if (state > 0x10 || ((1 << state) & 0x1A000) == 0)
  {
    self->_awaitingClientCallbackReply = 0;
    -[PKPaymentAuthorizationStateMachine _cancelClientCallbackTimer](self, "_cancelClientCallbackTimer");
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18FC92000, v7, OS_LOG_TYPE_ERROR, "Application failed to process coupon code change. This means that the coupon code and summary items are out of sync. We can't proceed to authorize the transaction.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 15, v15);
    }
    else
    {
      objc_msgSend(v5, "availableShippingMethods");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "paymentSummaryItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "multiTokenContexts");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recurringPaymentRequest");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "automaticReloadPaymentRequest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deferredPaymentRequest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationStateMachine _updateModelWithShippingMethods:paymentSummaryItems:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:contentItems:](self, "_updateModelWithShippingMethods:paymentSummaryItems:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:contentItems:", v14, v15, v16, v17, v18, v19, v20);

    }
  }

}

- (void)didEncounterShippingEmailError:(id)a3
{
  -[PKPaymentAuthorizationDataModel setShippingEmailError:](self->_model, "setShippingEmailError:", a3);
  -[PKPaymentAuthorizationStateMachine _processErrorsForDataType:](self, "_processErrorsForDataType:", 7);
}

- (void)didSelectShippingEmail:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PKPaymentAuthorizationDataModel shippingEmail](self->_model, "shippingEmail");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[PKPaymentAuthorizationDataModel setShippingEmail:](self->_model, "setShippingEmail:", v6);
    -[PKPaymentAuthorizationStateMachine _processErrorsForDataType:](self, "_processErrorsForDataType:", 7);
    -[PKPaymentAuthorizationStateMachine _updateAssessmentAttributes](self, "_updateAssessmentAttributes");
    v5 = v6;
  }

}

- (void)didSelectShippingPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PKPaymentAuthorizationDataModel shippingPhone](self->_model, "shippingPhone");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[PKPaymentAuthorizationDataModel setShippingPhone:](self->_model, "setShippingPhone:", v6);
    -[PKPaymentAuthorizationStateMachine _processErrorsForDataType:](self, "_processErrorsForDataType:", 7);
    -[PKPaymentAuthorizationStateMachine _updateAssessmentAttributes](self, "_updateAssessmentAttributes");
    v5 = v6;
  }

}

- (void)didSelectShippingName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PKPaymentAuthorizationDataModel shippingName](self->_model, "shippingName");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[PKPaymentAuthorizationDataModel setShippingName:](self->_model, "setShippingName:", v6);
    -[PKPaymentAuthorizationStateMachine _processErrorsForDataType:](self, "_processErrorsForDataType:", 7);
    -[PKPaymentAuthorizationStateMachine _updateAssessmentAttributes](self, "_updateAssessmentAttributes");
    v5 = v6;
  }

}

- (void)didSelectBillingAddress:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[PKPaymentAuthorizationDataModel billingAddress](self->_model, "billingAddress");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v16;
  if (v4 != v16)
  {
    -[PKPaymentAuthorizationDataModel setBillingAddress:](self->_model, "setBillingAddress:");
    if (-[PKPaymentAuthorizationDataModel mode](self->_model, "mode") == 2)
      v6 = 4;
    else
      v6 = 3;
    -[PKPaymentAuthorizationStateMachine _processErrorsForDataType:](self, "_processErrorsForDataType:", v6);
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requiredShippingContactFields");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", CFSTR("post"));

    if ((v9 & 1) != 0)
      goto LABEL_18;
    v10 = -[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode");
    if (v10 != 2)
    {
      if (v10 == 1)
      {
        -[PKPaymentAuthorizationDataModel financingController](self->_model, "financingController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "payLaterAccount");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          -[PKPaymentAuthorizationStateMachine _enqueueDidSelectPayLaterFinancingWithAccount:](self, "_enqueueDidSelectPayLaterFinancingWithAccount:", v12);
LABEL_17:

        goto LABEL_18;
      }
      if (v10)
      {
LABEL_18:
        -[PKPaymentAuthorizationStateMachine _updateAssessmentAttributes](self, "_updateAssessmentAttributes");
        v5 = v16;
        goto LABEL_19;
      }
    }
    if (-[PKPaymentAuthorizationDataModel mode](self->_model, "mode") == 2
      && (-[PKPaymentAuthorizationDataModel remotePaymentInstrument](self->_model, "remotePaymentInstrument"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      -[PKPaymentAuthorizationDataModel remotePaymentInstrument](self->_model, "remotePaymentInstrument");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationStateMachine _enqueueDidSelectRemotePaymentInstrument:](self, "_enqueueDidSelectRemotePaymentInstrument:", v12);
    }
    else
    {
      if (-[PKPaymentAuthorizationDataModel mode](self->_model, "mode") != 1)
        goto LABEL_18;
      -[PKPaymentAuthorizationDataModel pass](self->_model, "pass");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_18;
      -[PKPaymentAuthorizationDataModel pass](self->_model, "pass");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel paymentApplication](self->_model, "paymentApplication");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationStateMachine _enqueueDidSelectPaymentPass:paymentApplication:](self, "_enqueueDidSelectPaymentPass:paymentApplication:", v12, v14);

    }
    goto LABEL_17;
  }
LABEL_19:

}

- (void)didSelectFinancingOption:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject(7uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "didSelectFinancingOption called with option %@", (uint8_t *)&v8, 0xCu);
  }

  -[PKPaymentAuthorizationDataModel beginUpdates](self->_model, "beginUpdates");
  -[PKPaymentAuthorizationDataModel setSelectedFinancingOption:](self->_model, "setSelectedFinancingOption:", v4);
  if (v4)
  {
    -[PKPaymentAuthorizationDataModel financingController](self->_model, "financingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "payLaterAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentAuthorizationStateMachine _enqueueDidSelectPayLaterFinancingWithAccount:](self, "_enqueueDidSelectPayLaterFinancingWithAccount:", v7);
    if (_os_feature_enabled_impl())
      -[PKPaymentAuthorizationStateMachine didChangeFundingMode:](self, "didChangeFundingMode:", 1);
  }
  -[PKPaymentAuthorizationDataModel endUpdates](self->_model, "endUpdates");

}

- (void)didSelectPaymentOffer:(id)a3
{
  -[PKPaymentAuthorizationStateMachine didSelectPaymentOffer:updateReason:](self, "didSelectPaymentOffer:updateReason:", a3, 3);
}

- (void)didSelectPaymentOffer:(id)a3 updateReason:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  uint64_t v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PKPaymentOffersController selectedOfferDetails](self->_paymentOffersController, "selectedOfferDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel selectedPaymentOffer](self->_model, "selectedPaymentOffer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6 && v8)
  {
    if ((objc_msgSend(v8, "isEqual:", v6) & 1) != 0)
      goto LABEL_4;
LABEL_7:

    goto LABEL_8;
  }
  if (v8 != v6)
    goto LABEL_7;
LABEL_4:
  v10 = objc_msgSend(v7, "requiresUserAction");

  if ((v10 & 1) == 0)
    goto LABEL_34;
LABEL_8:
  PKLogFacilityTypeGetObject(7uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v6;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "didSelectPaymentOffer called with offer %@", (uint8_t *)&v19, 0xCu);
  }

  -[PKPaymentAuthorizationDataModel pass](self->_model, "pass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "passUniqueID");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v16 = v15;
    if (v14 == v15)
    {

    }
    else
    {
      if (!v15 || !v14)
      {

LABEL_26:
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 138412290;
          v20 = v16;
          _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Error: The selected payment offer passUniqueID doesnt match the selected passUniqueID: %@", (uint8_t *)&v19, 0xCu);
        }

        goto LABEL_33;
      }
      v17 = objc_msgSend(v14, "isEqualToString:", v15);

      if ((v17 & 1) == 0)
        goto LABEL_26;
    }
  }
  if (a4 != 2)
    -[PKPaymentOffersController updateCurrentSelectedPaymentOffer:updateReason:](self->_paymentOffersController, "updateCurrentSelectedPaymentOffer:updateReason:", v6, a4);
  -[PKPaymentAuthorizationDataModel beginUpdates](self->_model, "beginUpdates");
  -[PKPaymentAuthorizationDataModel setSelectedPaymentOffer:](self->_model, "setSelectedPaymentOffer:", v6);
  if (_os_feature_enabled_impl())
  {
    if (a4 == 1)
      -[PKPaymentOffersController clearCurrentSelectedPaymentOfferDetails](self->_paymentOffersController, "clearCurrentSelectedPaymentOfferDetails");
    if ((objc_msgSend(v7, "requiresUserAction") & 1) == 0)
    {
      if (v6)
      {
        v18 = 2;
LABEL_31:
        -[PKPaymentAuthorizationStateMachine didChangeFundingMode:](self, "didChangeFundingMode:", v18);
        goto LABEL_32;
      }
      if (-[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") == 2)
      {
        -[PKPaymentOffersController clearCurrentSelectedPaymentOfferDetails](self->_paymentOffersController, "clearCurrentSelectedPaymentOfferDetails");
        v18 = 0;
        goto LABEL_31;
      }
    }
  }
LABEL_32:
  -[PKPaymentAuthorizationDataModel endUpdates](self->_model, "endUpdates");
LABEL_33:

LABEL_34:
}

- (void)_processErrorsForDataType:(int64_t)a3
{
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  if (self->_state == 3)
  {
    -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = 0;
      v6 = objc_msgSend(v5, "isValidWithError:", &v18);
      v7 = v18;
      if ((v6 & 1) == 0)
      {
        -[PKPaymentAuthorizationDataModel paymentErrors](self->_model, "paymentErrors");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:status:error:clientErrors:](PKPaymentAuthorizationInvalidDataStateParam, "paramWithDataType:status:error:clientErrors:", a3, 1, v7, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), objc_msgSend(v7, "code"));
        if (os_variant_has_internal_ui())
        {
          objc_msgSend(v7, "localizedFailureReason");
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            objc_msgSend(v7, "localizedDescription");
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v11 = 0;
        }
        v20[0] = CFSTR("preferenceError");
        v19[0] = CFSTR("eventType");
        v19[1] = CFSTR("preferenceType");
        if ((unint64_t)a3 > 0x13)
          v12 = CFSTR("unknown");
        else
          v12 = off_1E2AC83D8[a3];
        v20[1] = v12;
        v19[2] = CFSTR("errorDomain");
        objc_msgSend(v7, "domain");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        v15 = &stru_1E2ADF4C0;
        if (v13)
          v16 = (const __CFString *)v13;
        else
          v16 = &stru_1E2ADF4C0;
        v20[2] = v16;
        v20[3] = v10;
        v19[3] = CFSTR("errorCode");
        v19[4] = CFSTR("errorText");
        if (v11)
          v15 = v11;
        v20[4] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("inApp"), v17);

        -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 3, v9);
        goto LABEL_19;
      }
    }
    else
    {
      v7 = 0;
    }
    -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 5, 0);
LABEL_19:

  }
}

- (void)didSelectShippingContact:(id)a3
{
  id v4;
  PKPaymentAuthorizationDataModel *model;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[8];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  model = self->_model;
  if (v4)
  {
    -[PKPaymentAuthorizationDataModel setShippingAddress:](model, "setShippingAddress:", v4);
    -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "isValidWithError:", 0))
    {
      -[PKPaymentAuthorizationStateMachine _enqueueDidSelectShippingContact:](self, "_enqueueDidSelectShippingContact:", v4);
    }
    else
    {
      PKLogFacilityTypeGetObject(7uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Selected contact is not valid (either same contact, or doesn't possess required fields) - bypassing callback, moving straight to invalid state", buf, 2u);
      }

      v8 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2D68];
      v9 = (void *)MEMORY[0x1E0CB3940];
      -[PKPaymentAuthorizationStateMachine model](self, "model");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shippingType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("IN_APP_PAYMENT_%@_ADDRESS_INCOMPLETE_REASON"), v11);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPaymentAuthorizationDataModel paymentErrors](self->_model, "paymentErrors");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:status:error:clientErrors:](PKPaymentAuthorizationInvalidDataStateParam, "paramWithDataType:status:error:clientErrors:", 5, 1, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 3, v17);
    }

  }
  else
  {
    -[PKPaymentAuthorizationDataModel setShippingAddress:](model, "setShippingAddress:", 0);
  }

}

- (void)didChangePeerPaymentUsage:(BOOL)a3
{
  _BOOL4 v3;
  PKPaymentAuthorizationDataModel *model;
  void *v6;
  void *v7;
  PKPaymentAuthorizationDataModel *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  PKAccountServicePaymentMethod *v23;
  void *v24;
  void *v25;
  PKAccountServicePaymentMethod *v26;
  uint8_t v27[16];

  v3 = a3;
  -[PKPaymentAuthorizationDataModel beginUpdates](self->_model, "beginUpdates");
  model = self->_model;
  if (v3)
  {
    -[PKPaymentAuthorizationDataModel peerPaymentAccount](model, "peerPaymentAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentBalance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentAuthorizationDataModel setPeerPaymentBalanceForAccountPayment:](self->_model, "setPeerPaymentBalanceForAccountPayment:", v7);
    v8 = self->_model;
    -[PKPaymentAuthorizationDataModel itemForType:](v8, "itemForType:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel setUsePeerPaymentBalance:](v8, "setUsePeerPaymentBalance:", v9 != 0);

  }
  else
  {
    -[PKPaymentAuthorizationDataModel setPeerPaymentBalanceForAccountPayment:](model, "setPeerPaymentBalanceForAccountPayment:", 0);
    -[PKPaymentAuthorizationDataModel setUsePeerPaymentBalance:](self->_model, "setUsePeerPaymentBalance:", 0);
    v7 = 0;
  }
  -[PKPaymentAuthorizationDataModel endUpdates](self->_model, "endUpdates");
  -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "isValidWithError:", 0))
  {
    objc_msgSend(v10, "pass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPeerPaymentBalance:", v7);

    if (v3)
    {
      -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accountServiceTransferRequest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "supportsSplitPayment");

      if (v14)
      {
        -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "paymentSummaryItems");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "amount");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "amount");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "compare:", v19);

        if (v20 == 1)
          v21 = 3;
        else
          v21 = 2;

      }
      else
      {
        v21 = 2;
      }
    }
    else
    {
      v21 = 1;
    }
    v23 = [PKAccountServicePaymentMethod alloc];
    -[PKPaymentAuthorizationDataModel bankAccount](self->_model, "bankAccount");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PKAccountServicePaymentMethod initWithBankAccountInformation:peerPaymentBalance:deviceSupportsPeerPaymentAccountPayment:selectedMethods:](v23, "initWithBankAccountInformation:peerPaymentBalance:deviceSupportsPeerPaymentAccountPayment:selectedMethods:", v24, v7, objc_msgSend(v25, "deviceSupportsPeerPaymentAccountPayment"), v21);

    -[PKPaymentAuthorizationStateMachine _enqueueDidUpdateAccountServicePaymentMethod:](self, "_enqueueDidUpdateAccountServicePaymentMethod:", v26);
  }
  else
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Selected peer payment usage is not valid - bypassing callback", v27, 2u);
    }

  }
}

- (void)didSelectBankAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  int v41;
  void *v42;
  PKAccountServicePaymentMethod *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t buf[8];
  uint64_t v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentAuthorizationStateMachine model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBankAccount:", v4);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKSharedCacheSetObjectForKey(v6, CFSTR("LastBankAccountIdentifier"));

  objc_msgSend(v5, "itemForType:", 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = objc_msgSend(v7, "isValidWithError:", 0);
  else
    v8 = 0;
  objc_msgSend(v5, "paymentRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountServiceTransferRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountServiceTransferRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "supportsSplitPayment");

  if (v10)
  {
    objc_msgSend(v10, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "accountIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKSetLastBankAccountIdentifierForAccountTransfer((uint64_t)v15, v16);

  }
  objc_msgSend(v5, "itemForType:", 2);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if ((v8 & 1) != 0)
  {
    v19 = 3;
    if (!v13)
      v19 = 1;
    if (v17)
      v20 = v19;
    else
      v20 = 1;
    goto LABEL_26;
  }
  objc_msgSend(v5, "peerPaymentBalanceForAccountPayment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "amount");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && v22)
  {
    if (v10)
      v23 = v13;
    else
      v23 = 1;
    if ((v23 & 1) == 0)
    {

LABEL_25:
      v20 = 2;
LABEL_26:
      -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v37, "deviceSupportsPeerPaymentAccountPayment")
        && objc_msgSend(v37, "accountPaymentUsePeerPaymentBalance"))
      {
        -[PKPaymentAuthorizationDataModel peerPaymentBalanceForAccountPayment](self->_model, "peerPaymentBalanceForAccountPayment");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = 0;
      }
      if (v10)
        v40 = v18 == 0;
      else
        v40 = 1;
      if (v40)
        v41 = 1;
      else
        v41 = v13;
      if (v41 == 1)
      {
        v42 = v7;
        v43 = -[PKAccountServicePaymentMethod initWithBankAccountInformation:peerPaymentBalance:deviceSupportsPeerPaymentAccountPayment:selectedMethods:]([PKAccountServicePaymentMethod alloc], "initWithBankAccountInformation:peerPaymentBalance:deviceSupportsPeerPaymentAccountPayment:selectedMethods:", v4, v39, objc_msgSend(v37, "deviceSupportsPeerPaymentAccountPayment"), v20);
        -[PKPaymentAuthorizationStateMachine _enqueueDidUpdateAccountServicePaymentMethod:](self, "_enqueueDidUpdateAccountServicePaymentMethod:", v43);

        v7 = v42;
      }
      else
      {
        PKLogFacilityTypeGetObject(0xEuLL);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v44, OS_LOG_TYPE_DEFAULT, "Selected bank account is not used - bypassing callback", buf, 2u);
        }

      }
      goto LABEL_41;
    }
    objc_msgSend(v5, "paymentRequest");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "paymentSummaryItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lastObject");
    v46 = v7;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "amount");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_msgSend(v26, "compare:", v22);
    v40 = v27 == 1;
    v7 = v46;
    if (!v40)
      goto LABEL_25;
  }
  else
  {

  }
  v47 = v7;
  PKLogFacilityTypeGetObject(0xEuLL);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, "Selected bank account is not valid - bypassing callback, moving straight to invalid state", buf, 2u);
  }

  v29 = (void *)MEMORY[0x1E0CB35C8];
  v49 = *MEMORY[0x1E0CB2D68];
  PKLocalizedFeatureString(CFSTR("IN_APP_PAYMENT_BANK_ACCOUNT_INCOMPLETE_REASON"), 2, 0, v30, v31, v32, v33, v34, (uint64_t)v45);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentAuthorizationDataModel paymentErrors](self->_model, "paymentErrors");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:status:error:clientErrors:](PKPaymentAuthorizationInvalidDataStateParam, "paramWithDataType:status:error:clientErrors:", 9, 1, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 3, v39);
  v7 = v47;
LABEL_41:

}

- (void)didReceiveShippingContactCompleteWithUpdate:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t state;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "status");
  PKLogFacilityTypeGetObject(7uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("PKPaymentAuthorizationStatusSuccess");
    switch(v6)
    {
      case 0:
        break;
      case 1:
        v10 = CFSTR("PKPaymentAuthorizationStatusFailure");
        break;
      case 2:
        v10 = CFSTR("PKPaymentAuthorizationStatusInvalidBillingPostalAddress");
        break;
      case 3:
        v10 = CFSTR("PKPaymentAuthorizationStatusInvalidShippingPostalAddress");
        break;
      case 4:
        v10 = CFSTR("PKPaymentAuthorizationStatusInvalidShippingContact");
        break;
      case 5:
        v10 = CFSTR("PKPaymentAuthorizationStatusPINRequired");
        break;
      case 6:
        v10 = CFSTR("PKPaymentAuthorizationStatusPINIncorrect");
        break;
      case 7:
        v10 = CFSTR("PKPaymentAuthorizationStatusPINLockout");
        break;
      default:
        if (v6 == 1000)
          v10 = CFSTR("PKPaymentAuthorizationStatusTryAgain");
        else
          v10 = CFSTR("unknown");
        break;
    }
    *(_DWORD *)buf = 138412546;
    v39 = v8;
    v40 = 2114;
    v41 = v10;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Received %@ status: %{public}@", buf, 0x16u);

  }
  objc_msgSend(v5, "errors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine sanitizeClientErrors:](self, "sanitizeClientErrors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v12, "count") && v6 == 3)
  {
    -[PKPaymentAuthorizationStateMachine model](self, "model");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "paymentErrorsFromLegacyStatus:", 3);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  v15 = objc_msgSend(v12, "count");
  v16 = (void *)MEMORY[0x1E0C99D20];
  v37 = CFSTR("post");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pk_FilteredShippingErrorsForContactFields:errors:contactFieldOptional:", v17, v12, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 != objc_msgSend(v18, "count"))
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Some errors provided were stripped out (not address related).", buf, 2u);
    }

  }
  -[PKPaymentAuthorizationDataModel setShippingAddressErrors:](self->_model, "setShippingAddressErrors:", v18);
  state = self->_state;
  if (state > 0x10 || ((1 << state) & 0x1A000) == 0)
  {
    self->_awaitingClientCallbackReply = 0;
    -[PKPaymentAuthorizationStateMachine _cancelClientCallbackTimer](self, "_cancelClientCallbackTimer");
    if (v6)
    {
      if (v6 == 3)
      {
LABEL_28:
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v35 = *MEMORY[0x1E0CB2D68];
        v21 = (void *)MEMORY[0x1E0CB3940];
        -[PKPaymentAuthorizationStateMachine model](self, "model");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "shippingType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("IN_APP_PAYMENT_%@_ADDRESS_INCOMPLETE_REASON"), v23);
        v24 = (NSString *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(v24, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKPaymentAuthorizationDataModel paymentErrors](self->_model, "paymentErrors");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:status:error:clientErrors:](PKPaymentAuthorizationInvalidDataStateParam, "paramWithDataType:status:error:clientErrors:", 5, 1, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 3, v29);
        -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");
LABEL_33:

        goto LABEL_34;
      }
    }
    else if (!objc_msgSend(v18, "count"))
    {
      objc_msgSend(v5, "availableShippingMethods");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "paymentSummaryItems");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "multiTokenContexts");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recurringPaymentRequest");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "automaticReloadPaymentRequest");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deferredPaymentRequest");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentItems");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationStateMachine _updateModelWithShippingMethods:paymentSummaryItems:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:contentItems:](self, "_updateModelWithShippingMethods:paymentSummaryItems:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:contentItems:", v27, v29, v30, v31, v32, v33, v34);

      goto LABEL_33;
    }
    if (!objc_msgSend(v18, "count"))
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Application failed to process shipping address change. This means that the user's shipping address selection and summary items are out of sync, or inappropriate errors have been provided. We can't proceed to authorize the transaction.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 15, v29);
      goto LABEL_33;
    }
    goto LABEL_28;
  }
LABEL_34:

}

- (void)didReceiveShippingContactCompleteWithStatus:(int64_t)a3 shippingMethods:(id)a4 paymentSummaryItems:(id)a5
{
  id v8;
  id v9;
  void *v10;
  PKPaymentRequestShippingContactUpdate *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  -[PKPaymentAuthorizationStateMachine model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "paymentErrorsFromLegacyStatus:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v11 = -[PKPaymentRequestShippingContactUpdate initWithErrors:paymentSummaryItems:shippingMethods:]([PKPaymentRequestShippingContactUpdate alloc], "initWithErrors:paymentSummaryItems:shippingMethods:", v12, v8, v9);
  -[PKPaymentRequestUpdate setStatus:](v11, "setStatus:", a3);
  -[PKPaymentAuthorizationStateMachine didReceiveShippingContactCompleteWithUpdate:](self, "didReceiveShippingContactCompleteWithUpdate:", v11);

}

- (void)didSelectShippingMethod:(id)a3
{
  -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 2, a3);
}

- (void)didReceiveShippingMethodCompleteWithUpdate:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  unint64_t state;
  BOOL v12;
  uint64_t v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "status");
  PKLogFacilityTypeGetObject(7uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("PKPaymentAuthorizationStatusSuccess");
    switch(v6)
    {
      case 0:
        break;
      case 1:
        v10 = CFSTR("PKPaymentAuthorizationStatusFailure");
        break;
      case 2:
        v10 = CFSTR("PKPaymentAuthorizationStatusInvalidBillingPostalAddress");
        break;
      case 3:
        v10 = CFSTR("PKPaymentAuthorizationStatusInvalidShippingPostalAddress");
        break;
      case 4:
        v10 = CFSTR("PKPaymentAuthorizationStatusInvalidShippingContact");
        break;
      case 5:
        v10 = CFSTR("PKPaymentAuthorizationStatusPINRequired");
        break;
      case 6:
        v10 = CFSTR("PKPaymentAuthorizationStatusPINIncorrect");
        break;
      case 7:
        v10 = CFSTR("PKPaymentAuthorizationStatusPINLockout");
        break;
      default:
        if (v6 == 1000)
          v10 = CFSTR("PKPaymentAuthorizationStatusTryAgain");
        else
          v10 = CFSTR("unknown");
        break;
    }
    *(_DWORD *)buf = 138412546;
    v23 = v8;
    v24 = 2114;
    v25 = v10;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Received %@ status: %{public}@", buf, 0x16u);

  }
  state = self->_state;
  v12 = state > 0x10;
  v13 = (1 << state) & 0x1A000;
  if (v12 || v13 == 0)
  {
    self->_awaitingClientCallbackReply = 0;
    -[PKPaymentAuthorizationStateMachine _cancelClientCallbackTimer](self, "_cancelClientCallbackTimer");
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Application failed to process shipping method change. This means that the user's shipping method selection and summary items are out of sync. We can't proceed to authorize the transaction.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 15, v16);
    }
    else
    {
      objc_msgSend(v5, "availableShippingMethods");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "paymentSummaryItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "multiTokenContexts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recurringPaymentRequest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "automaticReloadPaymentRequest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deferredPaymentRequest");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentItems");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationStateMachine _updateModelWithShippingMethods:paymentSummaryItems:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:contentItems:](self, "_updateModelWithShippingMethods:paymentSummaryItems:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:contentItems:", v15, v16, v17, v18, v19, v20, v21);

    }
  }

}

- (void)didReceiveUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "paymentSummaryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel beginUpdates](self->_model, "beginUpdates");
  -[PKPaymentAuthorizationStateMachine _updateModelWithPaymentSummaryItems:](self, "_updateModelWithPaymentSummaryItems:", v6);
  if (v8)
  {
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setApplePayTrustSignatureRequest:", v8);

  }
  -[PKPaymentAuthorizationDataModel endUpdates](self->_model, "endUpdates");
  self->_awaitingClientCallbackReply = 0;
  -[PKPaymentAuthorizationStateMachine _cancelClientCallbackTimer](self, "_cancelClientCallbackTimer");
  -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");

}

- (void)didReceiveShippingMethodCompleteWithStatus:(int64_t)a3 paymentSummaryItems:(id)a4
{
  id v6;
  PKPaymentRequestShippingMethodUpdate *v7;

  v6 = a4;
  v7 = objc_alloc_init(PKPaymentRequestShippingMethodUpdate);
  -[PKPaymentRequestUpdate setStatus:](v7, "setStatus:", a3);
  -[PKPaymentRequestUpdate setPaymentSummaryItems:](v7, "setPaymentSummaryItems:", v6);

  -[PKPaymentAuthorizationStateMachine didReceiveShippingMethodCompleteWithUpdate:](self, "didReceiveShippingMethodCompleteWithUpdate:", v7);
}

- (void)didSelectPaymentPass:(id)a3 paymentApplication:(id)a4
{
  -[PKPaymentAuthorizationStateMachine _enqueueDidSelectPaymentPass:paymentApplication:](self, "_enqueueDidSelectPaymentPass:paymentApplication:", a3, a4);
  if (a3)
  {
    if (_os_feature_enabled_impl())
      -[PKPaymentAuthorizationStateMachine didChangeFundingMode:](self, "didChangeFundingMode:", 0);
  }
}

- (void)didSelectRemotePaymentInstrument:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "primaryPaymentApplication");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine didSelectRemotePaymentInstrument:paymentApplication:](self, "didSelectRemotePaymentInstrument:paymentApplication:", v4, v5);

}

- (void)didSelectRemotePaymentInstrument:(id)a3 paymentApplication:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PKLogFacilityTypeGetObject(7uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v10;
    v32 = 2112;
    v33 = v7;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "State machine %@: %@", buf, 0x16u);

  }
  if (self->_hasReceivedRemoteDeviceUpdate)
  {
    -[PKPaymentAuthorizationStateMachine continuityPaymentCoordinator](self, "continuityPaymentCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentRemotePaymentRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine model](self, "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "remoteDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "isEqual:", v15);

    if ((v16 & 1) != 0)
    {
      -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "availableShippingMethods");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel paymentSummaryItems](self->_model, "paymentSummaryItems");
      v28 = v7;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "multiTokenContexts");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "recurringPaymentRequest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "automaticReloadPaymentRequest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "deferredPaymentRequest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationStateMachine _performSendClientUpdateWithShippingMethods:paymentSummaryItems:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:paymentApplication:status:](self, "_performSendClientUpdateWithShippingMethods:paymentSummaryItems:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:paymentApplication:status:", v25, v17, v18, v19, v21, v23, v8, 0);

      v7 = v28;
    }
    else
    {
      -[PKContinuityPaymentCoordinator currentRemotePaymentRequest](self->_continuityPaymentCoordinator, "currentRemotePaymentRequest");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        -[PKPaymentAuthorizationStateMachine _performCancelRemotePaymentRequest](self, "_performCancelRemotePaymentRequest");
      -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");
    }
    -[PKPaymentAuthorizationStateMachine _enqueueDidSelectRemotePaymentInstrument:paymentApplication:](self, "_enqueueDidSelectRemotePaymentInstrument:paymentApplication:", v7, v8);

  }
}

- (void)didReceivePaymentMethodCompleteWithUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  unint64_t state;
  BOOL v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  __CFString *v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PKPaymentAuthorizationDataModel *model;
  void *v31;
  void *v32;
  uint64_t v33;
  PKPaymentAuthorizationDataModel *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint8_t buf[4];
  const __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "status");
  PKLogFacilityTypeGetObject(7uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("PKPaymentAuthorizationStatusSuccess");
    switch(v5)
    {
      case 0:
        break;
      case 1:
        v7 = CFSTR("PKPaymentAuthorizationStatusFailure");
        break;
      case 2:
        v7 = CFSTR("PKPaymentAuthorizationStatusInvalidBillingPostalAddress");
        break;
      case 3:
        v7 = CFSTR("PKPaymentAuthorizationStatusInvalidShippingPostalAddress");
        break;
      case 4:
        v7 = CFSTR("PKPaymentAuthorizationStatusInvalidShippingContact");
        break;
      case 5:
        v7 = CFSTR("PKPaymentAuthorizationStatusPINRequired");
        break;
      case 6:
        v7 = CFSTR("PKPaymentAuthorizationStatusPINIncorrect");
        break;
      case 7:
        v7 = CFSTR("PKPaymentAuthorizationStatusPINLockout");
        break;
      default:
        if (v5 == 1000)
          v7 = CFSTR("PKPaymentAuthorizationStatusTryAgain");
        else
          v7 = CFSTR("unknown");
        break;
    }
    *(_DWORD *)buf = 138543362;
    v45 = v7;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Received didReceivePaymentMethodCompleteWithUpdate: %{public}@", buf, 0xCu);
  }

  state = self->_state;
  v9 = state > 0x10;
  v10 = (1 << state) & 0x1A000;
  if (v9 || v10 == 0)
  {
    self->_awaitingClientCallbackReply = 0;
    -[PKPaymentAuthorizationStateMachine _cancelClientCallbackTimer](self, "_cancelClientCallbackTimer");
    if (v5
      || (objc_msgSend(v4, "errors"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "count"),
          v12,
          v13))
    {
      objc_msgSend(v4, "errors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      v16 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v16)
        {
          objc_msgSend(v4, "errors");
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v45 = v17;
          _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Application failed to process billing address with errors: %{public}@", buf, 0xCu);

        }
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v42 = *MEMORY[0x1E0CB2D68];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IN_APP_PAYMENT_BILLING_ADDRESS_INCOMPLETE_REASON"));
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(v19, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKPaymentAuthorizationDataModel paymentErrors](self->_model, "paymentErrors");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:status:error:clientErrors:](PKPaymentAuthorizationInvalidDataStateParam, "paramWithDataType:status:error:clientErrors:", 3, 1, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 3, v24);
        -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");
      }
      else
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "The app returned PKPaymentAuthorizationStatusFailure from the payment method update callback.", buf, 2u);
        }

        v25 = (void *)MEMORY[0x1E0CB35C8];
        v40 = *MEMORY[0x1E0CB2D50];
        PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_PAYMENT_UPDATE_FAILED"), 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v27);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 15, v24);
      }
      goto LABEL_36;
    }
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v28, "isPeerPaymentRequest") & 1) != 0)
    {
      objc_msgSend(v4, "peerPaymentQuote");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        model = self->_model;
        objc_msgSend(v4, "peerPaymentQuote");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentAuthorizationDataModel setPeerPaymentQuote:](model, "setPeerPaymentQuote:", v31);
        goto LABEL_34;
      }
    }
    else
    {

    }
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "requestType");

    if (v33 != 5)
    {
LABEL_35:
      objc_msgSend(v4, "availableShippingMethods");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "paymentSummaryItems");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "multiTokenContexts");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recurringPaymentRequest");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "automaticReloadPaymentRequest");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deferredPaymentRequest");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentItems");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationStateMachine _updateModelWithShippingMethods:paymentSummaryItems:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:contentItems:](self, "_updateModelWithShippingMethods:paymentSummaryItems:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:contentItems:", v22, v24, v35, v36, v37, v38, v39);

LABEL_36:
      goto LABEL_37;
    }
    v34 = self->_model;
    objc_msgSend(v4, "installmentGroupIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel setInstallmentGroupIdentifier:](v34, "setInstallmentGroupIdentifier:", v31);
LABEL_34:

    goto LABEL_35;
  }
LABEL_37:

}

- (void)didReceivePaymentMethodCompleteWithSummaryItems:(id)a3
{
  id v4;
  PKPaymentRequestPaymentMethodUpdate *v5;

  v4 = a3;
  v5 = objc_alloc_init(PKPaymentRequestPaymentMethodUpdate);
  -[PKPaymentRequestUpdate setPaymentSummaryItems:](v5, "setPaymentSummaryItems:", v4);

  -[PKPaymentAuthorizationStateMachine didReceivePaymentMethodCompleteWithUpdate:](self, "didReceivePaymentMethodCompleteWithUpdate:", v5);
}

- (void)didRequestRefreshPaymentMethods
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationDataModel refreshPaymentMethods](self->_model, "refreshPaymentMethods");
  -[PKPaymentAuthorizationDataModel pass](self->_model, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PKPaymentAuthorizationDataModel acceptedPasses](self->_model, "acceptedPasses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PKPaymentAuthorizationDataModel defaultSelectedPaymentApplicationForPass:](self->_model, "defaultSelectedPaymentApplicationForPass:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel setPass:](self->_model, "setPass:", v5);
      -[PKPaymentAuthorizationDataModel setPaymentApplication:](self->_model, "setPaymentApplication:", v6);
      -[PKPaymentAuthorizationStateMachine didSelectPaymentPass:paymentApplication:](self, "didSelectPaymentPass:paymentApplication:", v5, v6);
      v9[0] = CFSTR("eventType");
      v9[1] = CFSTR("pageTag");
      v10[0] = CFSTR("stateChange");
      v10[1] = CFSTR("paymentPreferences");
      v9[2] = CFSTR("valueSupplied");
      PKAnalyticsReportSwitchToggleResultValue(1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[3] = CFSTR("preferenceType");
      v10[2] = v7;
      v10[3] = CFSTR("card");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("inApp"), v8);

      -[PKPaymentAuthorizationStateMachine _updateModelBillingAddressIfNeededForPass:](self, "_updateModelBillingAddressIfNeededForPass:", v5);
      -[PKPaymentAuthorizationStateMachine _updateModelCanAddPasses](self, "_updateModelCanAddPasses");

    }
    -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");

  }
}

- (void)didAuthenticateWithCredential:(id)a3
{
  PKPayment *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[PKPaymentAuthorizationDataModel mode](self->_model, "mode") == 3)
  {
    v4 = objc_alloc_init(PKPayment);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PKPayment setCredential:](v4, "setCredential:", v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[PKPayment setAuthKitAuthenticationResults:](v4, "setAuthKitAuthenticationResults:", v6);
    }
    +[PKPaymentAuthorizationAuthorizedStateParam paramWithPayment:](PKPaymentAuthorizationAuthorizedStateParam, "paramWithPayment:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 12, v5);

  }
  else
  {
    +[PKPaymentAuthorizationNonceStateParam paramWithCredential:](PKPaymentAuthorizationNonceStateParam, "paramWithCredential:", v6);
    v4 = (PKPayment *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 9, v4);
    if (-[PKPaymentAuthorizationDataModel mode](self->_model, "mode") == 1)
      -[PKPaymentAuthorizationDataModel setStatus:forItemWithType:](self->_model, "setStatus:forItemWithType:", 0, 3);
  }

}

- (void)didAuthenticateWithAuthenticatorEvaluationResponse:(id)a3
{
  id v4;

  +[PKPaymentAuthorizationNonceStateParam paramWithAuthenticatorEvaluationResponse:](PKPaymentAuthorizationNonceStateParam, "paramWithAuthenticatorEvaluationResponse:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 9, v4);

}

- (void)didReceivePaymentAuthorizationResult:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  __CFString *v8;
  unint64_t state;
  void *v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  PKPaymentAuthorizationDataModel *model;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  unsigned int v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  NSObject *v37;
  const __CFString *v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  __CFString **v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  __CFString **v55;
  uint64_t v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  NSString *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  char v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  PKPaymentAuthorizationStateMachine *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  BOOL v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  PKPaymentAuthorizationStateMachine *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  unsigned int v129;
  void *v130;
  id v131;
  id v132;
  id v133;
  const __CFString *v134;
  const __CFString *v135;
  _QWORD v136[4];
  _QWORD v137[4];
  uint64_t v138;
  id v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  void *v145;
  _QWORD v146[2];
  _QWORD v147[2];
  _QWORD v148[2];
  _QWORD v149[2];
  _QWORD v150[2];
  _QWORD v151[2];
  uint64_t v152;
  id v153;
  uint64_t v154;
  uint64_t v155;
  const __CFString *v156;
  const __CFString *v157;
  _QWORD v158[4];
  _QWORD v159[4];
  uint8_t buf[4];
  const __CFString *v161;
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "status");
  PKLogFacilityTypeGetObject(7uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("PKPaymentAuthorizationStatusSuccess");
    switch(v5)
    {
      case 0uLL:
        break;
      case 1uLL:
        v7 = CFSTR("PKPaymentAuthorizationStatusFailure");
        break;
      case 2uLL:
        v7 = CFSTR("PKPaymentAuthorizationStatusInvalidBillingPostalAddress");
        break;
      case 3uLL:
        v7 = CFSTR("PKPaymentAuthorizationStatusInvalidShippingPostalAddress");
        break;
      case 4uLL:
        v7 = CFSTR("PKPaymentAuthorizationStatusInvalidShippingContact");
        break;
      case 5uLL:
        v7 = CFSTR("PKPaymentAuthorizationStatusPINRequired");
        break;
      case 6uLL:
        v7 = CFSTR("PKPaymentAuthorizationStatusPINIncorrect");
        break;
      case 7uLL:
        v7 = CFSTR("PKPaymentAuthorizationStatusPINLockout");
        break;
      default:
        if (v5 == 1000)
          v7 = CFSTR("PKPaymentAuthorizationStatusTryAgain");
        else
          v7 = CFSTR("unknown");
        break;
    }
    *(_DWORD *)buf = 138543362;
    v161 = v7;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Received didReceivePaymentAuthorizationStatus: %{public}@", buf, 0xCu);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "errors");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v161 = v8;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Client errors: %@", buf, 0xCu);

  }
  state = self->_state;
  if (state > 0x10 || ((1 << state) & 0x1A000) == 0)
  {
    self->_awaitingClientCallbackReply = 0;
    -[PKPaymentAuthorizationStateMachine _cancelClientCallbackTimer](self, "_cancelClientCallbackTimer");
    model = self->_model;
    objc_msgSend(v4, "orderDetails");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel setPendingOrderDetails:](model, "setPendingOrderDetails:", v15);

    objc_msgSend(v4, "errors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine sanitizeClientErrors:](self, "sanitizeClientErrors:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v17, "count"))
    {
      -[NSObject firstObject](v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("PKPaymentErrorDomain"));

      objc_msgSend(v18, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("PKDisbursementErrorDomain"));

      if ((v20 & 1) == 0 && !v22)
      {
LABEL_58:

        -[PKPaymentAuthorizationDataModel setPaymentErrors:](self->_model, "setPaymentErrors:", v17);
        -[NSObject firstObject](v17, "firstObject");
        v34 = objc_claimAutoreleasedReturnValue();
        v130 = (void *)v34;
        v129 = v22;
        if (v34)
        {
          v35 = (void *)v34;
          if (os_variant_has_internal_ui())
          {
            objc_msgSend(v35, "localizedFailureReason");
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (!v36)
            {
              objc_msgSend(v35, "localizedDescription");
              v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v36 = 0;
          }
          v158[0] = CFSTR("authorizationStatus");
          v37 = v17;
          if (v5 > 7)
            v39 = CFSTR("unknown");
          else
            v39 = off_1E2AC8478[v5];
          v159[0] = v39;
          v158[1] = CFSTR("errorDomain");
          objc_msgSend(v35, "domain");
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = (void *)v40;
          if (v40)
            v42 = (const __CFString *)v40;
          else
            v42 = &stru_1E2ADF4C0;
          v159[1] = v42;
          v158[2] = CFSTR("errorCode");
          v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), objc_msgSend(v35, "code"));
          v44 = (void *)v43;
          v158[3] = CFSTR("errorText");
          if (v36)
            v45 = v36;
          else
            v45 = &stru_1E2ADF4C0;
          v159[2] = v43;
          v159[3] = v45;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v159, v158, 4);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentAuthorizationStateMachine _reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:eventType:](self, "_reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:eventType:", v46, CFSTR("transactionAuthorizationStatusUpdated"));

        }
        else
        {
          v156 = CFSTR("authorizationStatus");
          v37 = v17;
          if (v5 > 7)
            v38 = CFSTR("unknown");
          else
            v38 = off_1E2AC8478[v5];
          v157 = v38;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v157, &v156, 1);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentAuthorizationStateMachine _reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:eventType:](self, "_reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:eventType:", v36, CFSTR("transactionAuthorizationStatusUpdated"));
        }

        v26 = v37;
        switch(v5)
        {
          case 0uLL:
            -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "_isAMPPayment");

            if ((v49 & 1) != 0)
            {
              v50 = PKAggDKeyPaymentiTunesPurchaseAuthorizationSuccess;
            }
            else
            {
              if (objc_msgSend(v47, "requestType"))
              {
LABEL_140:
                objc_msgSend(v4, "peerPaymentTransactionMetadata");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                +[PKPaymentAuthorizationSuccessStateParam paramWithPeerPaymentTransactionMetadata:](PKPaymentAuthorizationSuccessStateParam, "paramWithPeerPaymentTransactionMetadata:", v100);
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 16, v101);

                v12 = 0;
                v11 = 0;
                goto LABEL_169;
              }
              AnalyticsSendEvent();
              v50 = PKAggDKeyPaymentInAppPaymentAuthorizationSuccess;
            }
            -[PKAggregateDictionaryProtocol addValueForScalarKey:value:](self->_aggregateDictionary, "addValueForScalarKey:value:", *v50, 1);
            goto LABEL_140;
          case 1uLL:
            goto LABEL_84;
          case 2uLL:
            if (-[PKPaymentAuthorizationDataModel mode](self->_model, "mode") == 2)
              v56 = 4;
            else
              v56 = 3;
            -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v133 = 0;
            v58 = objc_msgSend(v57, "isValidWithError:", &v133);
            v12 = (__CFString *)v133;

            if ((v58 & 1) != 0
              || (-[__CFString localizedFailureReason](v12, "localizedFailureReason"),
                  (v59 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
            {
              PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_BILLING_ADDRESS_INCOMPLETE_REASON"), 0);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
            }
            if (!v12)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3002, 0);
              v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            v60 = (void *)MEMORY[0x1E0CB35C8];
            v150[0] = *MEMORY[0x1E0CB2D68];
            objc_msgSend(v4, "localizedErrorMessageOverride");
            v61 = objc_claimAutoreleasedReturnValue();
            v62 = (void *)v61;
            if (v61)
              v63 = v61;
            else
              v63 = (uint64_t)v59;
            v150[1] = *MEMORY[0x1E0CB3388];
            v151[0] = v63;
            v151[1] = v12;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v151, v150, 2);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, v64);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            -[PKPaymentAuthorizationDataModel paymentErrors](self->_model, "paymentErrors");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = v56;
            goto LABEL_119;
          case 3uLL:
            -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 5);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v132 = 0;
            v68 = objc_msgSend(v67, "isValidWithError:", &v132);
            v12 = (__CFString *)v132;

            if ((v68 & 1) != 0
              || (-[__CFString localizedFailureReason](v12, "localizedFailureReason"),
                  (v59 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
            {
              v69 = (void *)MEMORY[0x1E0CB3940];
              -[PKPaymentAuthorizationDataModel shippingType](self->_model, "shippingType");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "stringWithFormat:", CFSTR("IN_APP_PAYMENT_%@_ADDRESS_INCOMPLETE_REASON"), v70);
              v71 = (NSString *)objc_claimAutoreleasedReturnValue();
              PKLocalizedPaymentString(v71, 0);
              v59 = (void *)objc_claimAutoreleasedReturnValue();

            }
            if (!v12)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3003, 0);
              v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            v72 = (void *)MEMORY[0x1E0CB35C8];
            v148[0] = *MEMORY[0x1E0CB2D68];
            objc_msgSend(v4, "localizedErrorMessageOverride");
            v73 = objc_claimAutoreleasedReturnValue();
            v74 = (void *)v73;
            if (v73)
              v75 = v73;
            else
              v75 = (uint64_t)v59;
            v148[1] = *MEMORY[0x1E0CB3388];
            v149[0] = v75;
            v149[1] = v12;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v149, v148, 2);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, v76);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            -[PKPaymentAuthorizationDataModel paymentErrors](self->_model, "paymentErrors");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = 5;
            goto LABEL_119;
          case 4uLL:
            -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 7);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = 0;
            v78 = objc_msgSend(v77, "isValidWithError:", &v131);
            v12 = (__CFString *)v131;

            if ((v78 & 1) != 0
              || (-[__CFString localizedFailureReason](v12, "localizedFailureReason"),
                  (v59 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
            {
              PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_INCOMPLETE_REASON"), 0);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
            }
            if (!v12)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3010, 0);
              v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            v79 = (void *)MEMORY[0x1E0CB35C8];
            v146[0] = *MEMORY[0x1E0CB2D68];
            objc_msgSend(v4, "localizedErrorMessageOverride");
            v80 = objc_claimAutoreleasedReturnValue();
            v81 = (void *)v80;
            if (v80)
              v82 = v80;
            else
              v82 = (uint64_t)v59;
            v146[1] = *MEMORY[0x1E0CB3388];
            v147[0] = v82;
            v147[1] = v12;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v147, v146, 2);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, v83);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            -[PKPaymentAuthorizationDataModel paymentErrors](self->_model, "paymentErrors");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = 7;
LABEL_119:
            +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:status:error:clientErrors:](PKPaymentAuthorizationInvalidDataStateParam, "paramWithDataType:status:error:clientErrors:", v66, 1, v11, v65);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 3, v47);
            goto LABEL_169;
          case 5uLL:
            -[PKPaymentAuthorizationStateMachine model](self, "model");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "setStatus:forItemWithType:", 3, 3);

            v85 = (void *)MEMORY[0x1E0CB35C8];
            v144 = *MEMORY[0x1E0CB2D68];
            objc_msgSend(v4, "localizedErrorMessageOverride");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = v86;
            if (!v86)
            {
              PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_PIN_INCORRECT"), 0);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v145 = v87;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v85;
            v90 = -1;
            goto LABEL_126;
          case 6uLL:
            -[PKPaymentAuthorizationStateMachine model](self, "model");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "setStatus:forItemWithType:", 2, 3);

            v92 = (void *)MEMORY[0x1E0CB35C8];
            v142 = *MEMORY[0x1E0CB2D68];
            objc_msgSend(v4, "localizedErrorMessageOverride");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = v86;
            if (!v86)
            {
              PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_PIN_INCORRECT"), 0);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v143 = v87;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v92;
            v90 = -3011;
LABEL_126:
            objc_msgSend(v89, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), v90, v88);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v86)
            +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v11);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = self;
            v94 = 14;
            goto LABEL_134;
          case 7uLL:
            v95 = (void *)MEMORY[0x1E0CB35C8];
            v140 = *MEMORY[0x1E0CB2D68];
            objc_msgSend(v4, "localizedErrorMessageOverride");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = v96;
            if (!v96)
            {
              PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_TOO_MANY_WRONG_CODES"), 0);
              v97 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v141 = v97;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3001, v98);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v96)
            -[PKPaymentAuthorizationDataModel paymentErrors](self->_model, "paymentErrors");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:status:error:clientErrors:](PKPaymentAuthorizationInvalidDataStateParam, "paramWithDataType:status:error:clientErrors:", 3, 4, v11, v99);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            v93 = self;
            v94 = 3;
LABEL_134:
            -[PKPaymentAuthorizationStateMachine _setState:param:](v93, "_setState:param:", v94, v47);
            goto LABEL_168;
          default:
            v26 = v37;
            if (v5 == 1000)
            {
              if ((v129 & 1) != 0)
                PKLocalizedFundsTransferString(CFSTR("FUNDS_TRANSFER_PAYMENT_APP_FAILED"), 0);
              else
                PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_TRY_AGAIN"), 0);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v108 = (void *)MEMORY[0x1E0CB35C8];
              v154 = *MEMORY[0x1E0CB2D68];
              objc_msgSend(v4, "localizedErrorMessageOverride");
              v109 = objc_claimAutoreleasedReturnValue();
              v110 = (void *)v109;
              if (v109)
                v111 = v109;
              else
                v111 = (uint64_t)v47;
              v155 = v111;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, v112);
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              +[PKPaymentAuthorizationErrorStateParam paramWithError:clientFailure:](PKPaymentAuthorizationErrorStateParam, "paramWithError:clientFailure:", v11, v129);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 14, v113);

LABEL_168:
              v12 = 0;
LABEL_169:
              v29 = v130;
LABEL_170:

              -[PKPaymentAuthorizationDataModel setPendingTransactions:](self->_model, "setPendingTransactions:", 0);
              -[PKPaymentAuthorizationDataModel setPendingOrderDetails:](self->_model, "setPendingOrderDetails:", 0);
              goto LABEL_171;
            }
            if (v5 == 1001)
            {
              -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "localizedErrorMessageOverride");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v51;
              if (v51)
              {
                v53 = v51;
              }
              else
              {
                objc_msgSend(v47, "localizedErrorMessage");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                v115 = v114;
                if (v114)
                {
                  v116 = v114;
                }
                else
                {
                  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_PAYMENT_APP_FAILED"), 0);
                  v116 = (id)objc_claimAutoreleasedReturnValue();
                }
                v53 = v116;

              }
              v126 = (void *)MEMORY[0x1E0CB35C8];
              v152 = *MEMORY[0x1E0CB2D68];
              v153 = v53;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1);
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v126, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, v127);
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              +[PKPaymentAuthorizationErrorStateParam paramWithError:clientFailure:](PKPaymentAuthorizationErrorStateParam, "paramWithError:clientFailure:", v11, 1);
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 14, v128);

              goto LABEL_168;
            }
LABEL_84:
            if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "The app failed to process the transaction (declined?)", buf, 2u);
            }

            ++self->_failureStatusCount;
            -[PKPaymentAuthorizationStateMachine _promptTapToRadar](self, "_promptTapToRadar");
            -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            if (v54)
            {
              v55 = PKAggDKeyPaymentiTunesPurchaseAuthorizationFail;
            }
            else
            {
              if (objc_msgSend(v47, "requestType"))
                goto LABEL_142;
              AnalyticsSendEvent();
              v55 = PKAggDKeyPaymentInAppPaymentAuthorizationFail;
            }
            -[PKAggregateDictionaryProtocol addValueForScalarKey:value:](self->_aggregateDictionary, "addValueForScalarKey:value:", *v55, 1);
LABEL_142:
            objc_msgSend(v4, "localizedErrorMessageOverride");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = v102;
            if (v102)
            {
              v104 = v102;
            }
            else
            {
              objc_msgSend(v47, "localizedErrorMessage");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = v105;
              if (v105)
              {
                v107 = v105;
              }
              else
              {
                PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_PAYMENT_APP_FAILED"), 0);
                v107 = (id)objc_claimAutoreleasedReturnValue();
              }
              v104 = v107;

            }
            v117 = (void *)MEMORY[0x1E0CB35C8];
            v138 = *MEMORY[0x1E0CB2D68];
            v139 = v104;
            v118 = 1;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v119);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            -[PKPaymentAuthorizationStateMachine _reportToAutoBugCapture:](self, "_reportToAutoBugCapture:", v104);
            if (!objc_msgSend(v47, "requestType"))
              v118 = objc_msgSend(v47, "APIType") != 0;
            v120 = objc_msgSend(v4, "resultSource");
            -[PKPaymentAuthorizationStateMachine paymentSheetExperiment](self, "paymentSheetExperiment");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            v122 = v121;
            v29 = v130;
            if (v118
              || v120 == 1
              || !objc_msgSend(v121, "isTaggedForAllowInAppPaymentFailureRetry")
              || (objc_msgSend(v122, "trackExperimentExposure"),
                  !objc_msgSend(v122, "shouldAllowInAppPaymentFailureRetry")))
            {
              +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v11);
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              v124 = self;
              v125 = 15;
            }
            else
            {
              +[PKPaymentAuthorizationErrorStateParam paramWithError:clientFailure:](PKPaymentAuthorizationErrorStateParam, "paramWithError:clientFailure:", v11, 1);
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              v124 = self;
              v125 = 14;
            }
            -[PKPaymentAuthorizationStateMachine _setState:param:](v124, "_setState:param:", v125, v123);

            v12 = 0;
            goto LABEL_170;
        }
      }
      v5 = -[PKPaymentAuthorizationStateMachine statusFromPaymentError:](self, "statusFromPaymentError:", v18);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v23 = CFSTR("PKPaymentAuthorizationStatusSuccess");
        switch(v5)
        {
          case 0uLL:
            break;
          case 1uLL:
            v23 = CFSTR("PKPaymentAuthorizationStatusFailure");
            break;
          case 2uLL:
            v23 = CFSTR("PKPaymentAuthorizationStatusInvalidBillingPostalAddress");
            break;
          case 3uLL:
            v23 = CFSTR("PKPaymentAuthorizationStatusInvalidShippingPostalAddress");
            break;
          case 4uLL:
            v23 = CFSTR("PKPaymentAuthorizationStatusInvalidShippingContact");
            break;
          case 5uLL:
            v23 = CFSTR("PKPaymentAuthorizationStatusPINRequired");
            break;
          case 6uLL:
            v23 = CFSTR("PKPaymentAuthorizationStatusPINIncorrect");
            break;
          case 7uLL:
            v23 = CFSTR("PKPaymentAuthorizationStatusPINLockout");
            break;
          default:
            if (v5 == 1000)
              v23 = CFSTR("PKPaymentAuthorizationStatusTryAgain");
            else
              v23 = CFSTR("unknown");
            break;
        }
        *(_DWORD *)buf = 138543362;
        v161 = v23;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Overridden didReceivePaymentAuthorizationStatus: %{public}@", buf, 0xCu);
      }
      v33 = v6;
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Checking for errors based on legacy status", buf, 2u);
      }

      -[PKPaymentAuthorizationStateMachine model](self, "model");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "paymentErrorsFromLegacyStatus:", v5);
      v32 = objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v33 = v17;
      v17 = v32;
    }

    goto LABEL_58;
  }
  objc_msgSend(v4, "errors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (os_variant_has_internal_ui())
    {
      objc_msgSend(v11, "localizedFailureReason");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(v11, "localizedDescription");
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v12 = 0;
    }
    v136[0] = CFSTR("authorizationStatus");
    if (v5 > 7)
      v24 = CFSTR("unknown");
    else
      v24 = off_1E2AC8478[v5];
    v137[0] = v24;
    v136[1] = CFSTR("errorDomain");
    objc_msgSend(v11, "domain");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25)
      v27 = (const __CFString *)v25;
    else
      v27 = &stru_1E2ADF4C0;
    v137[1] = v27;
    v136[2] = CFSTR("errorCode");
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), objc_msgSend(v11, "code"));
    v29 = (void *)v28;
    v136[3] = CFSTR("errorText");
    if (v12)
      v30 = v12;
    else
      v30 = &stru_1E2ADF4C0;
    v137[2] = v28;
    v137[3] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v137, v136, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine _reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:eventType:](self, "_reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:eventType:", v31, CFSTR("transactionAuthorizationStatusUpdated"));

LABEL_171:
    goto LABEL_172;
  }
  v134 = CFSTR("authorizationStatus");
  if (v5 > 7)
    v13 = CFSTR("unknown");
  else
    v13 = off_1E2AC8478[v5];
  v135 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine _reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:eventType:](self, "_reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:eventType:", v12, CFSTR("transactionAuthorizationStatusUpdated"));
  v11 = 0;
LABEL_172:

}

- (id)sanitizeClientErrors:(id)a3
{
  return (id)objc_msgSend(a3, "pk_arrayByApplyingBlock:", &__block_literal_global_52);
}

id __59__PKPaymentAuthorizationStateMachine_sanitizeClientErrors___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("PKPaymentErrorIsFromClient"));
  v5 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v2, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "code");

  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)statusFromPaymentError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PKPaymentErrorDomain"));

  if (!v6)
  {
    objc_msgSend(v4, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("PKDisbursementErrorDomain"));

    if (v13)
    {
      v14 = objc_msgSend(v4, "code");
      v7 = 1000;
      if (v14 == -1 || v14 == 1)
        goto LABEL_17;
      if (v14 == 2)
      {
        if (-[PKPaymentAuthorizationStateMachine isErrorAboutPostalAddressField:](self, "isErrorAboutPostalAddressField:", v4))
        {
          v7 = 2;
        }
        else
        {
          v7 = 4;
        }
        goto LABEL_17;
      }
    }
LABEL_11:
    v7 = 1;
    goto LABEL_17;
  }
  v7 = objc_msgSend(v4, "code");
  switch(v7)
  {
    case -1:
      -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "requestType");

      v10 = v9 == 0;
      v11 = 1000;
      goto LABEL_13;
    case 1:
      v10 = !-[PKPaymentAuthorizationStateMachine isErrorAboutPostalAddressField:](self, "isErrorAboutPostalAddressField:", v4);
      v11 = 3;
LABEL_13:
      if (v10)
        v7 = v11 + 1;
      else
        v7 = v11;
      break;
    case 2:
      break;
    case 3:
      v7 = 3;
      break;
    default:
      goto LABEL_11;
  }
LABEL_17:

  return v7;
}

- (BOOL)isErrorAboutPostalAddressField:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  char v18;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PKDisbursementErrorDomain"));

  v7 = (id *)&PKPaymentErrorContactFieldUserInfoKey;
  if (v6)
    v7 = (id *)&PKDisbursementErrorContactFieldUserInfoKey;
  v8 = *v7;
  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("post"));
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("name")) & 1) != 0)
    v12 = 1;
  else
    v12 = objc_msgSend(v10, "isEqualToString:", CFSTR("phoneticName"));
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requiredShippingContactFields");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", CFSTR("post"));

  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isShippingEditable");

  if ((v11 & 1) != 0)
    v18 = 1;
  else
    v18 = v12 & v15 & v17;

  return v18;
}

- (void)didReceivePaymentAuthorizationStatus:(int64_t)a3
{
  PKPaymentAuthorizationResult *v5;

  v5 = objc_alloc_init(PKPaymentAuthorizationResult);
  -[PKPaymentAuthorizationResult setStatus:](v5, "setStatus:", a3);
  -[PKPaymentAuthorizationStateMachine didReceivePaymentAuthorizationResult:](self, "didReceivePaymentAuthorizationResult:", v5);

}

- (void)delayAuthorizedStateByDuration:(double)a3
{
  dispatch_time_t v5;
  _QWORD v6[4];
  id v7;
  id location;

  dispatch_group_enter((dispatch_group_t)self->_delayAuthorizedStateGroup);
  objc_initWeak(&location, self->_delayAuthorizedStateGroup);
  v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__PKPaymentAuthorizationStateMachine_delayAuthorizedStateByDuration___block_invoke;
  v6[3] = &unk_1E2AC3648;
  objc_copyWeak(&v7, &location);
  dispatch_after(v5, MEMORY[0x1E0C80D38], v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __69__PKPaymentAuthorizationStateMachine_delayAuthorizedStateByDuration___block_invoke(uint64_t a1)
{
  NSObject *WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    dispatch_group_leave(WeakRetained);
    WeakRetained = v2;
  }

}

- (void)beginDelayingAuthorizedState
{
  dispatch_group_enter((dispatch_group_t)self->_delayAuthorizedStateGroup);
}

- (void)endDelayingAuthorizedState
{
  dispatch_group_leave((dispatch_group_t)self->_delayAuthorizedStateGroup);
}

- (void)didChangeFundingMode:(int64_t)a3
{
  unint64_t state;
  BOOL v6;
  uint64_t v7;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  const __CFString *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  v6 = state > 0x10;
  v7 = (1 << state) & 0x1A000;
  if (v6 || v7 == 0)
  {
    v14 = -[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode");
    -[PKPaymentAuthorizationDataModel setFundingMode:](self->_model, "setFundingMode:", a3);
    if (_os_feature_enabled_impl())
    {
      if (a3 == 2)
      {
        -[PKPaymentAuthorizationStateMachine didSelectFinancingOption:](self, "didSelectFinancingOption:", 0);
        -[PKPaymentAuthorizationDataModel selectedPaymentOffer](self->_model, "selectedPaymentOffer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentOffersController selectedOfferDetails](self->_paymentOffersController, "selectedOfferDetails");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentAuthorizationStateMachine didSelectPaymentOffer:updateReason:](self, "didSelectPaymentOffer:updateReason:", v17, objc_msgSend(v18, "updateReason"));

        goto LABEL_20;
      }
      if (a3 != 1)
      {
        if (!a3 && v14)
        {
          -[PKPaymentAuthorizationStateMachine didSelectFinancingOption:](self, "didSelectFinancingOption:", 0);
          -[PKPaymentAuthorizationStateMachine didSelectPaymentOffer:updateReason:](self, "didSelectPaymentOffer:updateReason:", 0, 1);
          -[PKPaymentAuthorizationDataModel pass](self->_model, "pass");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentAuthorizationDataModel paymentApplication](self->_model, "paymentApplication");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentAuthorizationStateMachine didSelectPaymentPass:paymentApplication:](self, "didSelectPaymentPass:paymentApplication:", v15, v16);

          -[PKPaymentAuthorizationDataModel refreshBillingAddressErrors](self->_model, "refreshBillingAddressErrors");
        }
        goto LABEL_21;
      }
      if (v14 != 1)
      {
        -[PKPaymentAuthorizationStateMachine didSelectPaymentOffer:updateReason:](self, "didSelectPaymentOffer:updateReason:", 0, 1);
        -[PKPaymentAuthorizationDataModel selectedFinancingOption](self->_model, "selectedFinancingOption");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentAuthorizationStateMachine didSelectFinancingOption:](self, "didSelectFinancingOption:", v17);
LABEL_20:

      }
    }
LABEL_21:
    -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");
    return;
  }
  PKLogFacilityTypeGetObject(7uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    PKPaymentAuthorizationFundingModeToString(a3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = self->_state;
    if (v12 > 0x14)
      v13 = CFSTR("unknown");
    else
      v13 = off_1E2AC84B8[v12];
    v19 = 138412546;
    v20 = v10;
    v21 = 2112;
    v22 = v13;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Not changing funding mode to %@ since the state is termainal \"%@\", (uint8_t *)&v19, 0x16u);

  }
}

- (void)continuityPaymentCoordinatorDidTimeoutUpdatePaymentDevices:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinatorDidTimeoutUpdatePaymentDevices___block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

_QWORD *__97__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinatorDidTimeoutUpdatePaymentDevices___block_invoke(uint64_t a1)
{
  _QWORD *result;
  unint64_t v2;
  BOOL v3;
  uint64_t v4;

  result = *(_QWORD **)(a1 + 32);
  v2 = result[14];
  v3 = v2 > 0x10;
  v4 = (1 << v2) & 0x1A000;
  if (v3 || v4 == 0)
    return (_QWORD *)objc_msgSend(result, "_deviceUpdateDidFailWithNoEiligbleRemoteDevices:", 0);
  return result;
}

- (void)continuityPaymentCoordinator:(id)a3 didTimeoutTotalWithPaymentDevices:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __101__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinator_didTimeoutTotalWithPaymentDevices___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __101__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinator_didTimeoutTotalWithPaymentDevices___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 112);
  if (v3 == 6)
  {
    if (!*(_BYTE *)(v2 + 9))
      objc_storeStrong((id *)(v2 + 200), *(id *)(a1 + 40));
  }
  else if (v3 == 1)
  {
    objc_msgSend((id)v2, "_updateModelWithRemoteDevices:", *(_QWORD *)(a1 + 40));
  }
}

- (void)continuityPaymentCoordinator:(id)a3 didReceiveUpdatedPaymentDevices:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __99__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinator_didReceiveUpdatedPaymentDevices___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __99__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinator_didReceiveUpdatedPaymentDevices___block_invoke(uint64_t a1)
{
  unint64_t v1;
  BOOL v2;
  uint64_t v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  _BYTE *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
  v2 = v1 > 0x10;
  v3 = (1 << v1) & 0x1A000;
  if (v2 || v3 == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v6 = *(id *)(a1 + 40);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v19;
LABEL_9:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
          objc_msgSend(v11, "remotePaymentInstruments", (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "initialRemotePaymentInstrument");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "containsObject:", v13);

          if ((v14 & 1) != 0)
            break;
          if (v8 == ++v10)
          {
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v8)
              goto LABEL_9;
            goto LABEL_15;
          }
        }
        v15 = objc_msgSend(v11, "proximityState");

        if (v15 != 2)
          goto LABEL_20;
        PKLogFacilityTypeGetObject(7uLL);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v23 = 2;
          v24 = 2048;
          v25 = 1;
          _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Skip updating remote devices: initialDeviceProximityState %ld, initialInstrumentValid %ld", buf, 0x16u);
        }

      }
      else
      {
LABEL_15:

LABEL_20:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "updateRemoteDevices:ignoreProximity:", *(_QWORD *)(a1 + 40), 0, (_QWORD)v18);
        v17 = *(_BYTE **)(a1 + 32);
        if (v17[9])
        {
          objc_msgSend(v17, "_advanceToNextState");
        }
        else
        {
          v17[9] = 1;
          objc_msgSend(*(id *)(a1 + 32), "_startPayment");
        }
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_deviceUpdateDidFailWithNoEiligbleRemoteDevices:", *(_QWORD *)(a1 + 40));
    }
  }
}

- (void)continuityPaymentCoordinator:(id)a3 didReceivePayment:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PKPaymentAuthorizationStateMachine *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinator_didReceivePayment___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __85__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinator_didReceivePayment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  PKPaymentAuthorizationResult *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "token");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "retryNonce");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "paymentRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "merchantSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRetryNonce:", v7);

  }
  v5 = *(_QWORD **)(a1 + 40);
  if (v5[14] == 5)
  {
    +[PKPaymentAuthorizationAuthorizedStateParam paramWithPayment:](PKPaymentAuthorizationAuthorizedStateParam, "paramWithPayment:", *(_QWORD *)(a1 + 32));
    v6 = (PKPaymentAuthorizationResult *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setState:param:", 12, v6);
  }
  else
  {
    v6 = objc_alloc_init(PKPaymentAuthorizationResult);
    -[PKPaymentAuthorizationResult setStatus:](v6, "setStatus:", 1000);
    objc_msgSend(*(id *)(a1 + 40), "_performSendPaymentResult:", v6);
  }

}

- (void)continuityPaymentCoordinatorDidReceiveCancellation:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinatorDidReceiveCancellation___block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

_QWORD *__89__PKPaymentAuthorizationStateMachine_continuityPaymentCoordinatorDidReceiveCancellation___block_invoke(uint64_t a1)
{
  _QWORD *result;
  unint64_t v2;
  BOOL v3;
  uint64_t v4;

  result = *(_QWORD **)(a1 + 32);
  v2 = result[14];
  v3 = v2 > 0x10;
  v4 = (1 << v2) & 0x1A000;
  if (v3 || v4 == 0)
    return (_QWORD *)objc_msgSend(result, "_setState:param:", 13, 0);
  return result;
}

- (void)_processBluetoothState:(int64_t)a3
{
  unint64_t state;
  BOOL v4;
  uint64_t v5;
  NSObject *v9;
  void *v10;
  void *v11;
  PKPaymentAuthorizationStateMachine *v12;
  uint64_t v13;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  v4 = state > 0x10;
  v5 = (1 << state) & 0x1A000;
  if (!v4 && v5 != 0)
    return;
  PKLogFacilityTypeGetObject(7uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = a3;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Processing bluetooth state: %d", (uint8_t *)v14, 8u);
  }

  if ((unint64_t)(a3 - 2) < 2)
    goto LABEL_14;
  if (a3 == 4)
  {
    if (!self->_detectedBluetoothOn)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2015, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self;
      v13 = 14;
      goto LABEL_15;
    }
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2015, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self;
    v13 = 15;
LABEL_15:
    -[PKPaymentAuthorizationStateMachine _setState:param:](v12, "_setState:param:", v13, v11);

    return;
  }
  if (a3 == 5 && !self->_detectedBluetoothOn)
  {
    self->_detectedBluetoothOn = 1;
    -[PKPaymentAuthorizationStateMachine _startRemoteDeviceUpdate](self, "_startRemoteDeviceUpdate");
  }
}

- (void)_updateModelWithRemoteDevices:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "pk_containsObjectPassingTest:", &__block_literal_global_135_0);
  if (objc_msgSend(v5, "count") && (v4 & 1) != 0)
  {
    -[PKPaymentAuthorizationDataModel updateRemoteDevices:ignoreProximity:](self->_model, "updateRemoteDevices:ignoreProximity:", v5, 0);

    if (self->_hasReceivedRemoteDeviceUpdate)
    {
      -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");
    }
    else
    {
      self->_hasReceivedRemoteDeviceUpdate = 1;
      -[PKPaymentAuthorizationStateMachine _startPayment](self, "_startPayment");
    }
  }
  else
  {
    -[PKPaymentAuthorizationStateMachine _deviceUpdateDidFailWithNoEiligbleRemoteDevices:](self, "_deviceUpdateDidFailWithNoEiligbleRemoteDevices:", v5);

  }
}

BOOL __68__PKPaymentAuthorizationStateMachine__updateModelWithRemoteDevices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proximityState") == 0;
}

- (void)_deviceUpdateDidFailWithNoEiligbleRemoteDevices:(id)a3
{
  PKPaymentAuthorizationDataModel *model;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  model = self->_model;
  v5 = a3;
  -[PKPaymentAuthorizationDataModel remoteDevice](model, "remoteDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v11 = CFSTR("PKContinuityDeviceNameKey");
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2008, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 14, v10);

  -[PKPaymentAuthorizationDataModel updateRemoteDevices:ignoreProximity:](self->_model, "updateRemoteDevices:ignoreProximity:", v5, 0);
}

- (void)_performUpdatePaymentDevices
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(7uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Updating remote payment devices", v4, 2u);
  }

  -[PKContinuityPaymentCoordinator updatePaymentDevices](self->_continuityPaymentCoordinator, "updatePaymentDevices");
}

- (void)_performSendRemotePaymentRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PKContinuityPaymentCoordinator *continuityPaymentCoordinator;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  -[PKPaymentAuthorizationStateMachine _createNewRemotePaymentRequest](self, "_createNewRemotePaymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentAuthorizationContinuitySendParam paramWithRemotePaymentRequest:](PKPaymentAuthorizationContinuitySendParam, "paramWithRemotePaymentRequest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 4, v4);

  objc_initWeak(&location, self);
  objc_msgSend(v3, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  continuityPaymentCoordinator = self->_continuityPaymentCoordinator;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__PKPaymentAuthorizationStateMachine__performSendRemotePaymentRequest__block_invoke;
  v9[3] = &unk_1E2AC7CA0;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  -[PKContinuityPaymentCoordinator sendRemotePaymentRequest:completion:](continuityPaymentCoordinator, "sendRemotePaymentRequest:completion:", v3, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __70__PKPaymentAuthorizationStateMachine__performSendRemotePaymentRequest__block_invoke(uint64_t a1, char a2, void *a3)
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
  v7[2] = __70__PKPaymentAuthorizationStateMachine__performSendRemotePaymentRequest__block_invoke_2;
  v7[3] = &unk_1E2AC7C78;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v11 = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v10);
}

void __70__PKPaymentAuthorizationStateMachine__performSendRemotePaymentRequest__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (!*(_BYTE *)(a1 + 56))
  {
    v4 = objc_msgSend(WeakRetained, "state");
    if (v4 > 0x10 || ((1 << v4) & 0x1A000) == 0)
    {
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
      {
        v11[0] = *MEMORY[0x1E0CB3388];
        v11[1] = CFSTR("PKContinuityDeviceNameKey");
        v7 = *(_QWORD *)(a1 + 40);
        v12[0] = v6;
        v12[1] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2010, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_setState:param:", 14, v10);

      }
      else
      {
        objc_msgSend(v3, "_advanceToNextState");
      }
    }
  }

}

- (void)_performSendClientUpdateWithShippingMethods:(id)a3 paymentSummaryItems:(id)a4 multiTokenContexts:(id)a5 recurringPaymentRequest:(id)a6 automaticReloadPaymentRequest:(id)a7 deferredPaymentRequest:(id)a8 paymentApplication:(id)a9 status:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  PKPaymentClientUpdate *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  PKPaymentClientUpdate *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PKContinuityPaymentCoordinator *continuityPaymentCoordinator;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id location;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = [PKPaymentClientUpdate alloc];
  objc_msgSend(v22, "applicationIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v22, "paymentType");
  v35 = v17;
  v36 = v16;
  v26 = v17;
  v27 = v18;
  v28 = -[PKPaymentClientUpdate initWithPaymentSummaryItems:shippingMethods:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:status:selectedAID:selectedPaymentMethodType:](v23, "initWithPaymentSummaryItems:shippingMethods:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:status:selectedAID:selectedPaymentMethodType:", v26, v16, v18, v19, v20, v21, a10, v24, v25);

  +[PKPaymentAuthorizationStateParam param](PKPaymentAuthorizationContinuitySendParam, "param");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 4, v29);

  objc_initWeak(&location, self);
  -[PKContinuityPaymentCoordinator currentRemotePaymentRequest](self->_continuityPaymentCoordinator, "currentRemotePaymentRequest");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "device");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "deviceName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  continuityPaymentCoordinator = self->_continuityPaymentCoordinator;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __224__PKPaymentAuthorizationStateMachine__performSendClientUpdateWithShippingMethods_paymentSummaryItems_multiTokenContexts_recurringPaymentRequest_automaticReloadPaymentRequest_deferredPaymentRequest_paymentApplication_status___block_invoke;
  v37[3] = &unk_1E2AC7CA0;
  objc_copyWeak(&v39, &location);
  v34 = v32;
  v38 = v34;
  -[PKContinuityPaymentCoordinator sendPaymentClientUpdate:completion:](continuityPaymentCoordinator, "sendPaymentClientUpdate:completion:", v28, v37);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

}

void __224__PKPaymentAuthorizationStateMachine__performSendClientUpdateWithShippingMethods_paymentSummaryItems_multiTokenContexts_recurringPaymentRequest_automaticReloadPaymentRequest_deferredPaymentRequest_paymentApplication_status___block_invoke(uint64_t a1, char a2, void *a3)
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
  v7[2] = __224__PKPaymentAuthorizationStateMachine__performSendClientUpdateWithShippingMethods_paymentSummaryItems_multiTokenContexts_recurringPaymentRequest_automaticReloadPaymentRequest_deferredPaymentRequest_paymentApplication_status___block_invoke_2;
  v7[3] = &unk_1E2AC7C78;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v11 = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v10);
}

void __224__PKPaymentAuthorizationStateMachine__performSendClientUpdateWithShippingMethods_paymentSummaryItems_multiTokenContexts_recurringPaymentRequest_automaticReloadPaymentRequest_deferredPaymentRequest_paymentApplication_status___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (!*(_BYTE *)(a1 + 56))
  {
    v4 = objc_msgSend(WeakRetained, "state");
    if (v4 > 0x10 || ((1 << v4) & 0x1A000) == 0)
    {
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
      {
        v11[0] = *MEMORY[0x1E0CB3388];
        v11[1] = CFSTR("PKContinuityDeviceNameKey");
        v7 = *(_QWORD *)(a1 + 40);
        v12[0] = v6;
        v12[1] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2010, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_setState:param:", 14, v10);

      }
      else
      {
        objc_msgSend(v3, "_advanceToNextState");
      }
    }
  }

}

- (void)_performSendPaymentResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKContinuityPaymentCoordinator *continuityPaymentCoordinator;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  PKPaymentAuthorizationStateMachine *v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  +[PKPaymentAuthorizationStateParam param](PKPaymentAuthorizationContinuitySendParam, "param");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 4, v5);

  objc_initWeak(&location, self);
  -[PKContinuityPaymentCoordinator currentRemotePaymentRequest](self->_continuityPaymentCoordinator, "currentRemotePaymentRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "deviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  continuityPaymentCoordinator = self->_continuityPaymentCoordinator;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__PKPaymentAuthorizationStateMachine__performSendPaymentResult___block_invoke;
  v12[3] = &unk_1E2AC7CF0;
  objc_copyWeak(&v16, &location);
  v10 = v8;
  v13 = v10;
  v14 = self;
  v11 = v4;
  v15 = v11;
  -[PKContinuityPaymentCoordinator sendPaymentResult:completion:](continuityPaymentCoordinator, "sendPaymentResult:completion:", v11, v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __64__PKPaymentAuthorizationStateMachine__performSendPaymentResult___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  char v16;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__PKPaymentAuthorizationStateMachine__performSendPaymentResult___block_invoke_2;
  v10[3] = &unk_1E2AC7CC8;
  objc_copyWeak(&v15, (id *)(a1 + 56));
  v16 = a2;
  v11 = v5;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v12 = v6;
  v13 = v7;
  v14 = v8;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v15);
}

void __64__PKPaymentAuthorizationStateMachine__performSendPaymentResult___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (!*(_BYTE *)(a1 + 72))
  {
    v4 = objc_msgSend(WeakRetained, "state");
    if (v4 > 0x10 || ((1 << v4) & 0x1A000) == 0)
    {
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
      {
        v11[0] = *MEMORY[0x1E0CB3388];
        v11[1] = CFSTR("PKContinuityDeviceNameKey");
        v7 = *(_QWORD *)(a1 + 40);
        v12[0] = v6;
        v12[1] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2010, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_setState:param:", 14, v10);

      }
      else
      {
        objc_msgSend(v3, "_advanceToNextState");
      }
    }
  }

}

- (void)_performCancelRemotePaymentRequest
{
  -[PKContinuityPaymentCoordinator cancelRemotePaymentRequestWithCompletion:](self->_continuityPaymentCoordinator, "cancelRemotePaymentRequestWithCompletion:", 0);
}

- (id)_createNewRemotePaymentRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  PKRemotePaymentRequest *v19;
  void *v20;
  _QWORD v22[4];
  id v23;

  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");
  v8 = objc_msgSend(v6, "majorOperatingSystemVersion");
  v9 = v8;
  v10 = v7 == 1 && v8 < 16;
  if (v10 || (!v7 ? (v11 = v8 <= 8) : (v11 = 0), v11))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("Bancomat"), CFSTR("Bancontact"), 0);
    objc_msgSend(v3, "supportedNetworks");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __68__PKPaymentAuthorizationStateMachine__createNewRemotePaymentRequest__block_invoke;
    v22[3] = &unk_1E2ABD910;
    v23 = v12;
    v14 = v12;
    objc_msgSend(v13, "pk_objectsPassingTest:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setSupportedNetworks:", v15);
  }
  v16 = v7 == 1 && v9 < 17;
  if (v16 || !v7 && v9 <= 9)
  {
    objc_msgSend(v3, "supportedNetworks");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pk_objectsPassingTest:", &__block_literal_global_141);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setSupportedNetworks:", v18);
  }
  v19 = -[PKRemotePaymentRequest initWithDevice:]([PKRemotePaymentRequest alloc], "initWithDevice:", v6);
  -[PKRemotePaymentRequest setPaymentRequest:](v19, "setPaymentRequest:", v3);
  objc_msgSend(v5, "applicationIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemotePaymentRequest setSelectedApplicationIdentifier:](v19, "setSelectedApplicationIdentifier:", v20);

  -[PKRemotePaymentRequest setSelectedPaymentMethodType:](v19, "setSelectedPaymentMethodType:", objc_msgSend(v5, "paymentType"));
  return v19;
}

uint64_t __68__PKPaymentAuthorizationStateMachine__createNewRemotePaymentRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __68__PKPaymentAuthorizationStateMachine__createNewRemotePaymentRequest__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", CFSTR("PagoBancomat")) ^ 1;
}

- (void)_start
{
  if (-[PKPaymentAuthorizationDataModel mode](self->_model, "mode") == 1)
  {
    -[PKPaymentAuthorizationStateMachine _startPayment](self, "_startPayment");
  }
  else if (-[PKPaymentAuthorizationDataModel mode](self->_model, "mode") == 2)
  {
    -[PKPaymentAuthorizationStateMachine _startHandoff](self, "_startHandoff");
  }
}

- (void)_startHandoff
{
  id v3;

  -[PKPaymentAuthorizationStateMachine bluetoothMonitor](self, "bluetoothMonitor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine _processBluetoothState:](self, "_processBluetoothState:", objc_msgSend(v3, "state"));

}

- (void)_startRemoteDeviceUpdate
{
  -[PKPaymentAuthorizationStateMachine _performUpdatePaymentDevices](self, "_performUpdatePaymentDevices");
  -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 1, 0);
}

- (void)_startPayment
{
  void *v3;
  id v4;

  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "merchantSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    goto LABEL_6;
  }
  if (!objc_msgSend(v4, "shouldUseMerchantSession"))
  {
LABEL_6:
    if (objc_msgSend(v4, "requestType") == 5)
    {
      -[PKPaymentAuthorizationStateMachine _performInstallmentBind](self, "_performInstallmentBind");
    }
    else if (objc_msgSend(v4, "requestType") == 4)
    {
      -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");
    }
    else
    {
      -[PKPaymentAuthorizationStateMachine _updatePassRewardsInfo](self, "_updatePassRewardsInfo");
      -[PKPaymentAuthorizationStateMachine _enqueueInitialCallbacks](self, "_enqueueInitialCallbacks");
    }
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "isVirtualCardRequest"))
    -[PKPaymentAuthorizationStateMachine _retrieveVPANPaymentSession](self, "_retrieveVPANPaymentSession");
  else
    -[PKPaymentAuthorizationStateMachine _enqueueDidRequestMerchantSession](self, "_enqueueDidRequestMerchantSession");
LABEL_12:

}

- (void)_performInstallmentBind
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PKPaymentAuthorizationStateMachine *v11;

  self->_awaitingWebServiceResponse = 1;
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installmentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "feature");
  if (v5 == 2)
    v6 = 4;
  else
    v6 = 2 * (v5 == 1);

  +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__PKPaymentAuthorizationStateMachine__performInstallmentBind__block_invoke;
  v9[3] = &unk_1E2AC7D60;
  v10 = v3;
  v11 = self;
  v8 = v3;
  objc_msgSend(v7, "defaultAccountForFeature:completion:", v6, v9);

}

void __61__PKPaymentAuthorizationStateMachine__performInstallmentBind__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PKAccountWebServiceInstallmentBindRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  _QWORD v16[4];
  id v17;
  id location;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "installmentConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "merchantIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "merchantSession");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "merchantIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(v7, "installmentMerchantIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v10 = objc_alloc_init(PKAccountWebServiceInstallmentBindRequest);
    objc_msgSend(v5, "accountIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServiceInstallmentBindRequest setAccountIdentifier:](v10, "setAccountIdentifier:", v11);

    objc_msgSend(v7, "bindingTotalAmount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServiceInstallmentBindRequest setBindingAmount:](v10, "setBindingAmount:", v12);

    -[PKAccountWebServiceInstallmentBindRequest setMerchantIdentifier:](v10, "setMerchantIdentifier:", v8);
    objc_msgSend(v5, "accountBaseURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServiceInstallmentBindRequest setBaseURL:](v10, "setBaseURL:", v13);

    objc_initWeak(&location, *(id *)(a1 + 40));
    v14 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__PKPaymentAuthorizationStateMachine__performInstallmentBind__block_invoke_2;
    v16[3] = &unk_1E2AC7D38;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v14, "performInstallmentBindWithRequest:completion:", v10, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PKPaymentAuthorizationStateMachine__performInstallmentBind__block_invoke_4;
    block[3] = &unk_1E2ABE120;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __61__PKPaymentAuthorizationStateMachine__performInstallmentBind__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PKPaymentAuthorizationStateMachine__performInstallmentBind__block_invoke_3;
  block[3] = &unk_1E2AC2E68;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __61__PKPaymentAuthorizationStateMachine__performInstallmentBind__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 11) = 0;
    v7 = (id *)WeakRetained;
    if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*((id *)WeakRetained + 7), "beginUpdates");
      v5 = v7[7];
      objc_msgSend(*(id *)(a1 + 32), "bindToken");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setInstallmentBindToken:", v6);

      objc_msgSend(v7[7], "endUpdates");
      objc_msgSend(v7, "_enqueueInitialCallbacks");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 15, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_setState:param:", 15, v4);

    }
    WeakRetained = v7;
  }

}

void __61__PKPaymentAuthorizationStateMachine__performInstallmentBind__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 15, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setState:param:", 15, v3);

}

- (void)_enqueueInitialCallbacks
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int64_t v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  uint64_t v25;
  _BOOL8 v26;
  PKAccountServicePaymentMethod *v27;
  void *v28;
  PKAccountServicePaymentMethod *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  id v39;

  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "shippingAddress"))
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v39, "shippingContact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postalAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5 != 0;

  }
  objc_msgSend(v39, "requiredShippingContactFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", CFSTR("post")) && !v3)
  {
    -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isValidWithError:", 0);

    if (!v8)
      goto LABEL_9;
    -[PKPaymentAuthorizationDataModel shippingAddress](self->_model, "shippingAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine _enqueueDidSelectShippingContact:](self, "_enqueueDidSelectShippingContact:", v6);
  }

LABEL_9:
  v9 = -[PKPaymentAuthorizationDataModel mode](self->_model, "mode");
  if (v9 == 2)
  {
    -[PKPaymentAuthorizationDataModel remotePaymentInstrument](self->_model, "remotePaymentInstrument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine _enqueueDidSelectRemotePaymentInstrument:](self, "_enqueueDidSelectRemotePaymentInstrument:", v11);
LABEL_66:

    goto LABEL_67;
  }
  if (v9 == 1)
  {
    if (-[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode"))
      v10 = -[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") == 2;
    else
      v10 = 1;
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "requestType");
    -[PKPaymentAuthorizationDataModel peerPaymentQuote](self->_model, "peerPaymentQuote");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10)
    {
      if (v13)
      {
        objc_msgSend(v13, "firstQuoteItemOfType:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 != 0;

      }
      else
      {
        v16 = 1;
      }
      v17 = v12 != 1 && v16;
      if (v12 == 4)
        v17 = 0;
      if (v12 != 2)
        goto LABEL_45;
    }
    else if (v12 != 2)
    {
LABEL_44:
      v17 = 0;
LABEL_45:
      v30 = v12 != 5 && v17;
      -[PKPaymentAuthorizationDataModel financingController](self->_model, "financingController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "payLaterAccount");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") == 1 && v32 != 0)
      {
        v30 = 0;
        -[PKPaymentAuthorizationStateMachine _enqueueDidSelectPayLaterFinancingWithAccount:](self, "_enqueueDidSelectPayLaterFinancingWithAccount:", v32);
      }
      if (objc_msgSend(v11, "isPayLaterPaymentRequest"))
      {
        -[PKPaymentAuthorizationDataModel bankAccount](self->_model, "bankAccount");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          -[PKPaymentAuthorizationDataModel bankAccount](self->_model, "bankAccount");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentAuthorizationStateMachine _enqueueDidSelectBankAccount:](self, "_enqueueDidSelectBankAccount:", v35);

          v30 = 0;
        }
      }
      if (v12 == 5)
      {
        -[PKPaymentAuthorizationDataModel installmentBindToken](self->_model, "installmentBindToken");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentAuthorizationStateMachine _enqueueDidSelectPaymentMethodWithBindToken:](self, "_enqueueDidSelectPaymentMethodWithBindToken:", v36);

      }
      if (v14)
        v37 = v30;
      else
        v37 = 1;
      if ((v37 & 1) == 0)
        -[PKPaymentAuthorizationStateMachine _enqueueDidSelectPaymentMethodWithQuote:](self, "_enqueueDidSelectPaymentMethodWithQuote:", v14);
      if (v30)
      {
        -[PKPaymentAuthorizationDataModel pass](self->_model, "pass");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentAuthorizationStateMachine _enqueueDidSelectPaymentPass:](self, "_enqueueDidSelectPaymentPass:", v38);

      }
      goto LABEL_66;
    }
    v18 = objc_msgSend(v11, "deviceSupportsPeerPaymentAccountPayment");
    if ((_DWORD)v18 && objc_msgSend(v11, "accountPaymentUsePeerPaymentBalance"))
    {
      -[PKPaymentAuthorizationDataModel peerPaymentBalanceForAccountPayment](self->_model, "peerPaymentBalanceForAccountPayment");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    if (objc_msgSend(v11, "isAccountServiceTransferRequest"))
    {
      objc_msgSend(v11, "accountServiceTransferRequest");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "supportsSplitPayment");

      -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        v24 = v22 != 0;
      else
        v24 = 0;
      if ((v24 & v21) != 0)
        v25 = 3;
      else
        v25 = 2;
      if (v22)
        v26 = v25;
      else
        v26 = v23 != 0;

    }
    else
    {
      v26 = 0;
    }
    v27 = [PKAccountServicePaymentMethod alloc];
    -[PKPaymentAuthorizationDataModel bankAccount](self->_model, "bankAccount");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[PKAccountServicePaymentMethod initWithBankAccountInformation:peerPaymentBalance:deviceSupportsPeerPaymentAccountPayment:selectedMethods:](v27, "initWithBankAccountInformation:peerPaymentBalance:deviceSupportsPeerPaymentAccountPayment:selectedMethods:", v28, v19, v18, v26);

    -[PKPaymentAuthorizationStateMachine _enqueueDidUpdateAccountServicePaymentMethod:](self, "_enqueueDidUpdateAccountServicePaymentMethod:", v29);
    goto LABEL_44;
  }
LABEL_67:

}

- (void)_sendDidTransitionFromState:(unint64_t)a3 toState:(unint64_t)a4 withParam:(id)a5
{
  __CFString *v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a5;
  PKLogFacilityTypeGetObject(7uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 0x14)
      v10 = CFSTR("unknown");
    else
      v10 = off_1E2AC84B8[a3];
    if (a4 > 0x14)
      v11 = CFSTR("unknown");
    else
      v11 = off_1E2AC84B8[a4];
    v12 = CFSTR("<none>");
    v14 = 138412802;
    if (v8)
      v12 = v8;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "State machine change state from %@ to %@ with param: %@", (uint8_t *)&v14, 0x20u);
  }

  -[PKPaymentAuthorizationStateMachine delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "paymentAuthorizationStateMachine:didTransitionFromState:toState:withParam:", self, a3, a4, v8);

}

- (void)_advanceToNextState
{
  -[PKPaymentAuthorizationStateMachine _advanceToNextStateFromResolveError:](self, "_advanceToNextStateFromResolveError:", 0);
}

- (void)_advanceToNextStateFromResolveError:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v6;
  id v7;
  unint64_t state;
  PKPaymentAuthorizationStateMachine *v9;
  uint64_t v10;
  char v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  PKPaymentAuthorizationStateMachine *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  uint8_t v28[16];
  id v29;
  uint64_t v30;

  v4 = a3;
  v29 = 0;
  v30 = 1;
  v6 = -[PKPaymentAuthorizationDataModel isValidWithError:errorStatus:](self->_model, "isValidWithError:errorStatus:", &v29, &v30);
  v7 = v29;
  if (*(_WORD *)&self->_awaitingClientCallbackReply || !v6 && self->_state == 3)
    goto LABEL_61;
  if (self->_hostApplicationState)
  {
    state = self->_state;
    if (state - 9 >= 4 && state != 18)
    {
      v9 = self;
      v10 = 6;
      goto LABEL_60;
    }
  }
  if (-[NSMutableArray count](self->_callbackQueue, "count"))
  {
    -[PKPaymentAuthorizationStateMachine _dispatchNextCallbackParam](self, "_dispatchNextCallbackParam");
    goto LABEL_61;
  }
  if (-[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") != 1
    || -[PKPayLaterFinancingController loadingState](self->_financingController, "loadingState") != 1)
  {
    if (-[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") == 2 && v30 == 11 && !v6)
    {
      v9 = self;
      v10 = 19;
      goto LABEL_60;
    }
    if (-[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") == 2
      && (v30 != 12 ? (v12 = 1) : (v12 = v6), (v12 & 1) == 0))
    {
      if (v4)
      {
        -[PKPaymentAuthorizationDataModel selectedPaymentOffer](self->_model, "selectedPaymentOffer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "criteriaIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "passUniqueID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentOffersController resetLoadingDetailsForPaymentOffersForCriteriaIdentifier:passUniqueID:](self->_paymentOffersController, "resetLoadingDetailsForPaymentOffersForCriteriaIdentifier:passUniqueID:", v17, v18);
        -[PKPaymentAuthorizationStateMachine didChangeFundingMode:](self, "didChangeFundingMode:", 0);

LABEL_53:
        goto LABEL_61;
      }
      +[PKPaymentAuthorizationErrorStateParam paramWithError:paymentOffersError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:paymentOffersError:", v7, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self;
      v22 = 14;
    }
    else
    {
      if (-[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") != 2
        || (v30 != 13 ? (v13 = 1) : (v13 = v6), (v13 & 1) != 0))
      {
        -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isVirtualCardRequest");
        if ((v15 & 1) != 0)
        {
          if (!self->_state)
            goto LABEL_48;
        }
        else
        {
          -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v3, "requestType") == 1 && !self->_state)
          {
LABEL_48:
            -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "merchantSession");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25 && -[PKPaymentAuthorizationDataModel wantsInstructions](self->_model, "wantsInstructions"))
            {
              -[PKPaymentAuthorizationDataModel instructions](self->_model, "instructions");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v26 == 0;

            }
            else
            {
              v27 = 0;
            }

            if ((v15 & 1) != 0)
            {

              if (v27)
                goto LABEL_59;
            }
            else
            {

              if (v27)
              {
LABEL_59:
                v9 = self;
                v10 = 8;
                goto LABEL_60;
              }
            }
            goto LABEL_38;
          }

        }
LABEL_38:
        if (v6)
        {
          v9 = self;
          v10 = 5;
          goto LABEL_60;
        }
        if (self->_state == 3
          || -[PKPaymentAuthorizationDataModel isHideMyEmailLoading](self->_model, "isHideMyEmailLoading"))
        {
          goto LABEL_61;
        }
        v19 = v30;
        -[PKPaymentAuthorizationDataModel paymentErrors](self->_model, "paymentErrors");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:status:error:clientErrors:](PKPaymentAuthorizationInvalidDataStateParam, "paramWithDataType:status:error:clientErrors:", 0, v19, v7, v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = self;
        v22 = 3;
        goto LABEL_52;
      }
      PKLogFacilityTypeGetObject(7uLL);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "The previously selected payment offer is no longer valid. User needs to take action.", v28, 2u);
      }

      +[PKPaymentAuthorizationErrorStateParam paramWithError:paymentOffersError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:paymentOffersError:", v7, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self;
      v22 = 20;
    }
LABEL_52:
    -[PKPaymentAuthorizationStateMachine _setState:param:](v21, "_setState:param:", v22, v16);
    goto LABEL_53;
  }
  if (v4 || self->_state != 14)
  {
    v9 = self;
    v10 = 17;
LABEL_60:
    -[PKPaymentAuthorizationStateMachine _setState:param:](v9, "_setState:param:", v10, 0);
  }
LABEL_61:

}

- (void)_updateModelWithPaymentSummaryItems:(id)a3
{
  PKPaymentAuthorizationDataModel *model;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  model = self->_model;
  v5 = a3;
  -[PKPaymentAuthorizationDataModel transactionAmount](model, "transactionAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel setPaymentSummaryItems:](self->_model, "setPaymentSummaryItems:", v5);

  -[PKPaymentAuthorizationDataModel transactionAmount](self->_model, "transactionAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentRequestValidator validatorWithObject:](PKPaymentRequestValidator, "validatorWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v10 = objc_msgSend(v9, "isValidWithError:", &v16);
  v11 = v16;

  if ((v10 & 1) != 0)
  {
    if (v6 && v7)
    {
      if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
        goto LABEL_16;
    }
    else if (v6 == v7)
    {
      goto LABEL_16;
    }
    if (-[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") == 1)
    {
      -[PKPaymentAuthorizationDataModel selectedFinancingOption](self->_model, "selectedFinancingOption");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        PKLogFacilityTypeGetObject(7uLL);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v6;
          v19 = 2112;
          v20 = v7;
          _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Payment Summary Items total amount has changed from %@ to %@. Updating the financing options and updating state machine state to show loading gylph.", buf, 0x16u);
        }

        -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 17, 0);
      }
    }
    -[PKPaymentAuthorizationStateMachine _fetchAdditionalPaymentMethodDataIfNeeded](self, "_fetchAdditionalPaymentMethodDataIfNeeded");
  }
  else
  {
    PKLogFacilityTypeGetObject(7uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_error_impl(&dword_18FC92000, v12, OS_LOG_TYPE_ERROR, "Updates to Payment Summary Items have caused an invalid Payment Request. Error: %@", buf, 0xCu);
    }

    +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 15, v13);

  }
LABEL_16:

}

- (BOOL)_isMultiTokenContextsSupported
{
  PKPaymentAuthorizationStateMachine *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[PKPaymentWebService targetDevice](self->_paymentWebService, "targetDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentWebService:supportedRegionFeatureOfType:", v2->_paymentWebService, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)_canUpdateWithMultiTokenContexts:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  BOOL v22;
  id *v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "multiTokenContexts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v25 = v8;
    v26 = v6;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v10)
    {
      v11 = v10;
      v24 = a4;
      v12 = 0;
      v13 = *(_QWORD *)v29;
      while (2)
      {
        v14 = 0;
        v15 = v12;
        do
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v9);
          +[PKPaymentTokenContextValidator validatorWithObject:](PKPaymentTokenContextValidator, "validatorWithObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v14), v24);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "currencyCode");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setCurrencyCode:", v18);

          -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "APIType");
          v27 = v15;
          v21 = objc_msgSend(v16, "isValidWithAPIType:withError:", v20, &v27);
          v12 = v27;

          if (!v21)
          {
            v8 = v25;
            v6 = v26;
            a4 = v24;
            goto LABEL_13;
          }
          ++v14;
          v15 = v12;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      v12 = 0;
    }

    v22 = 1;
    v8 = v25;
    v6 = v26;
  }
  else
  {
    v33 = *MEMORY[0x1E0CB2D50];
    v34[0] = CFSTR("The original payment request didn't have multi token contexts");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    if (a4)
    {
      v12 = objc_retainAutorelease(v12);
      v22 = 0;
      *a4 = v12;
    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (BOOL)_isDeviceTransactionAssessmentEnabled
{
  PKPrivacyDeviceAssessmentRetrieveStateRequest *v3;
  PKPrivacyDeviceAssessmentRetrieveStateRequest *v4;
  char v5;
  NSObject *v6;
  PKPaymentWebService *paymentWebService;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  if (-[PKPaymentAuthorizationStateMachine _isRequestUsedForTransactionAssessment](self, "_isRequestUsedForTransactionAssessment"))
  {
    if (PKHasSeenDeviceAssessmentEducation())
    {
      -[PKPaymentAuthorizationDataModel paymentApplication](self->_model, "paymentApplication");
      v3 = (PKPrivacyDeviceAssessmentRetrieveStateRequest *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v4 = v3;
        v5 = -[PKPrivacyDeviceAssessmentRetrieveStateRequest supportsDeviceAssessmentAccordingToService:](v3, "supportsDeviceAssessmentAccordingToService:", self->_paymentWebService);
      }
      else
      {
        PKLogFacilityTypeGetObject(7uLL);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "No payment application found, returning device assessment as enabled.", v10, 2u);
        }

        v4 = 0;
        v5 = 1;
      }
      goto LABEL_13;
    }
    PKLogFacilityTypeGetObject(7uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "User hasn't seen device assessment education, returning device assessment as disabled.", buf, 2u);
    }

    if (_os_feature_enabled_impl())
    {
      paymentWebService = self->_paymentWebService;
      v4 = objc_alloc_init(PKPrivacyDeviceAssessmentRetrieveStateRequest);
      -[PKPaymentWebService retrievePrivacyDeviceAssessmentStateWithRequest:completion:](paymentWebService, "retrievePrivacyDeviceAssessmentStateWithRequest:completion:", v4, &__block_literal_global_154);
      v5 = 0;
LABEL_13:

      return v5;
    }
  }
  return 0;
}

void __75__PKPaymentAuthorizationStateMachine__isDeviceTransactionAssessmentEnabled__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = a2;
  v5 = a3;
  PKLogFacilityTypeGetObject(7uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v4 || v5)
  {
    if (v7)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Could not sync Privacy UI state from server.", v8, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Synced Privacy UI state from server.", buf, 2u);
    }

    objc_msgSend(v4, "privacyUiState");
    v6 = objc_claimAutoreleasedReturnValue();
    PKSetHasSeenPrivacyTermsVersion(-[NSObject unsignedIntValue](v6, "unsignedIntValue"));
  }

}

- (BOOL)_isRequestUsedForTransactionAssessment
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v8;
  char v9;

  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPayLaterPaymentRequest");

  if ((v4 & 1) != 0)
    return 0;
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPeerPaymentRequest");

  if ((v6 & 1) != 0)
    return 0;
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAccountServiceTransferRequest");

  return v9 ^ 1;
}

- (id)_odiServiceProviderAssessmentIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;

  -[PKPaymentAuthorizationDataModel selectedFinancingOption](self->_model, "selectedFinancingOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PKPaymentAuthorizationDataModel assessmentCollection](self->_model, "assessmentCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      goto LABEL_4;
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isPayLaterPaymentRequest");

    if (v8)
    {
      -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "payLaterPaymentRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "payLaterPaymentIntentType");
      if (v11 == 2)
      {
        v12 = (id *)MEMORY[0x1E0D17790];
        goto LABEL_11;
      }
      if (v11 == 1)
      {
        v12 = (id *)MEMORY[0x1E0D17788];
LABEL_11:
        v5 = *v12;

        return v5;
      }

    }
    v5 = 0;
    return v5;
  }

LABEL_4:
  v5 = (id)*MEMORY[0x1E0D17778];
  return v5;
}

- (BOOL)_isServiceProviderAssessmentEnabled
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;

  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPeerPaymentRequest");

  if ((v4 & 1) != 0)
    return 0;
  -[PKPaymentAuthorizationStateMachine _odiServiceProviderAssessmentIdentifier](self, "_odiServiceProviderAssessmentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6 != 0;

  return v5;
}

- (BOOL)_isMerchantTokensSupported
{
  PKPaymentAuthorizationStateMachine *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[PKPaymentWebService targetDevice](self->_paymentWebService, "targetDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentWebService:supportedRegionFeatureOfType:", v2->_paymentWebService, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)_canUpdateWithRecurringPaymentRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recurringPaymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "sanitize");
    objc_msgSend(v6, "billingAgreement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "billingAgreement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v11 = -[PKPaymentAuthorizationStateMachine _canUpdateWithBillingAgreement:oldAgreement:error:](self, "_canUpdateWithBillingAgreement:oldAgreement:error:", v9, v10, &v14);
    v12 = v14;

  }
  else
  {
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("The original payment request didn't have a recurring payment request");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
  }

  if (a4 && !v11)
    *a4 = objc_retainAutorelease(v12);

  return v11;
}

- (BOOL)_canUpdateWithAutomaticReloadPaymentRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "automaticReloadPaymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "sanitize");
    objc_msgSend(v6, "billingAgreement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "billingAgreement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v11 = -[PKPaymentAuthorizationStateMachine _canUpdateWithBillingAgreement:oldAgreement:error:](self, "_canUpdateWithBillingAgreement:oldAgreement:error:", v9, v10, &v14);
    v12 = v14;

  }
  else
  {
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("The original payment request didn't have an automatic reload payment request");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
  }

  if (a4 && !v11)
    *a4 = objc_retainAutorelease(v12);

  return v11;
}

- (BOOL)_canUpdateWithBillingAgreement:(id)a3 oldAgreement:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  BOOL v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  v10 = v9;
  if (v8 == v9)
  {

    goto LABEL_7;
  }
  if (!v9 || !v8)
  {

    goto LABEL_9;
  }
  v11 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v11 & 1) != 0)
  {
LABEL_7:
    v12 = 0;
    v13 = 1;
    goto LABEL_12;
  }
LABEL_9:
  v16 = *MEMORY[0x1E0CB2D50];
  v17[0] = CFSTR("Billing agreements can't be changed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v14);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    v12 = objc_retainAutorelease(v12);
    v13 = 0;
    *a5 = v12;
  }
  else
  {
    v13 = 0;
  }
LABEL_12:

  return v13;
}

- (BOOL)_canUpdateWithDeferredPaymentRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deferredPaymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "sanitize");
    objc_msgSend(v6, "billingAgreement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "billingAgreement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v11 = -[PKPaymentAuthorizationStateMachine _canUpdateWithBillingAgreement:oldAgreement:error:](self, "_canUpdateWithBillingAgreement:oldAgreement:error:", v9, v10, &v14);
    v12 = v14;

  }
  else
  {
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("The original payment request didn't have a deferred payment request");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
  }

  if (a4 && !v11)
    *a4 = objc_retainAutorelease(v12);

  return v11;
}

- (void)_updateModelWithShippingMethods:(id)a3 paymentSummaryItems:(id)a4 multiTokenContexts:(id)a5 recurringPaymentRequest:(id)a6 automaticReloadPaymentRequest:(id)a7 deferredPaymentRequest:(id)a8 contentItems:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _BOOL4 v21;
  id v22;
  _BOOL4 v23;
  id v24;
  _BOOL4 v25;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  void *v29;
  PKPaymentAuthorizationDataModel *model;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  _BOOL4 v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  char v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  uint64_t v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  uint64_t v113;
  _QWORD v114[2];

  v114[1] = *MEMORY[0x1E0C80C00];
  v108 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  -[PKPaymentAuthorizationDataModel transactionAmount](self->_model, "transactionAmount");
  v107 = objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel beginUpdates](self->_model, "beginUpdates");
  v106 = v20;
  if (objc_msgSend(v16, "count")
    && -[PKPaymentAuthorizationStateMachine _isMultiTokenContextsSupported](self, "_isMultiTokenContextsSupported"))
  {
    v112 = 0;
    v21 = -[PKPaymentAuthorizationStateMachine _canUpdateWithMultiTokenContexts:error:](self, "_canUpdateWithMultiTokenContexts:error:", v16, &v112);
    v22 = v112;
    if (!v21)
    {
      v53 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v53, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CB3388]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, v53);
      v54 = v19;
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v55);
      v56 = objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    -[PKPaymentAuthorizationDataModel setMultiTokenContexts:](self->_model, "setMultiTokenContexts:", v16);

  }
  if (v17 && -[PKPaymentAuthorizationStateMachine _isMerchantTokensSupported](self, "_isMerchantTokensSupported"))
  {
    v111 = 0;
    v23 = -[PKPaymentAuthorizationStateMachine _canUpdateWithRecurringPaymentRequest:error:](self, "_canUpdateWithRecurringPaymentRequest:error:", v17, &v111);
    v24 = v111;
    if (!v23)
      goto LABEL_33;
    -[PKPaymentAuthorizationDataModel setRecurringPaymentRequest:](self->_model, "setRecurringPaymentRequest:", v17);

  }
  if (v18 && -[PKPaymentAuthorizationStateMachine _isMerchantTokensSupported](self, "_isMerchantTokensSupported"))
  {
    v110 = 0;
    v25 = -[PKPaymentAuthorizationStateMachine _canUpdateWithAutomaticReloadPaymentRequest:error:](self, "_canUpdateWithAutomaticReloadPaymentRequest:error:", v18, &v110);
    v24 = v110;
    if (v25)
    {
      -[PKPaymentAuthorizationDataModel setAutomaticReloadPaymentRequest:](self->_model, "setAutomaticReloadPaymentRequest:", v18);

      goto LABEL_13;
    }
LABEL_33:
    v53 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, v53);
    v54 = v19;
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v55);
    v56 = objc_claimAutoreleasedReturnValue();
    v22 = v24;
LABEL_35:
    v57 = (void *)v56;
    -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 15, v56);

    v58 = v22;
    v59 = v54;

LABEL_59:
    v86 = (void *)v107;
    goto LABEL_60;
  }
LABEL_13:
  if (v19 && -[PKPaymentAuthorizationStateMachine _isMerchantTokensSupported](self, "_isMerchantTokensSupported"))
  {
    v109 = 0;
    v26 = -[PKPaymentAuthorizationStateMachine _canUpdateWithDeferredPaymentRequest:error:](self, "_canUpdateWithDeferredPaymentRequest:error:", v19, &v109);
    v24 = v109;
    if (v26)
    {
      -[PKPaymentAuthorizationDataModel setDeferredPaymentRequest:](self->_model, "setDeferredPaymentRequest:", v19);

      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_17:
  v104 = v19;
  objc_msgSend(v108, "methods");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (v28)
  {
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAvailableShippingMethods:", v108);

    model = self->_model;
    objc_msgSend(v108, "defaultMethod");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel setShippingMethod:](model, "setShippingMethod:", v31);

  }
  v32 = objc_msgSend(v15, "count");
  if (v32)
  {
    v33 = v32;
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "requestType");

    v36 = v33 - 1;
    if (v36 && v35 == 5)
    {
      objc_msgSend(v15, "lastObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "amount");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "subarrayWithRange:", 0, v36);
      v39 = objc_claimAutoreleasedReturnValue();

      -[PKPaymentAuthorizationDataModel setInstallmentAuthorizationAmount:](self->_model, "setInstallmentAuthorizationAmount:", v38);
      v15 = (id)v39;
    }
    -[PKPaymentAuthorizationStateMachine _updateModelWithPaymentSummaryItems:](self, "_updateModelWithPaymentSummaryItems:", v15);
  }
  if (objc_msgSend(v20, "count"))
    -[PKPaymentAuthorizationDataModel setPaymentContentItems:](self->_model, "setPaymentContentItems:", v20);
  -[PKPaymentAuthorizationDataModel endUpdates](self->_model, "endUpdates");
  -[PKPaymentAuthorizationStateMachine _updateAssessmentAttributes](self, "_updateAssessmentAttributes");
  -[PKPaymentAuthorizationDataModel paymentSummaryItems](self->_model, "paymentSummaryItems");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "lastObject");
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v103 = v18;
  if (-[PKPaymentAuthorizationDataModel mode](self->_model, "mode") == 1)
  {
    -[PKPaymentAuthorizationDataModel pass](self->_model, "pass");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v41, "hasAssociatedPeerPaymentAccount"))
    {
LABEL_30:

      goto LABEL_31;
    }
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "requestType") == 10)
    {

      goto LABEL_30;
    }
    v60 = -[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode");

    if (!v60)
    {
      -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 3);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v61, "status") == 5)
        -[PKPaymentAuthorizationDataModel setStatus:forItemWithType:](self->_model, "setStatus:forItemWithType:", 0, 3);
      -[PKPaymentAuthorizationDataModel pass](self->_model, "pass");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "peerPaymentBalance");
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "currency");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = v64;
      objc_msgSend(v64, "currencyCode");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v65, "caseInsensitiveCompare:", v66);

      v99 = v61;
      if (v67)
      {
        v68 = v63;
        v69 = 1;
      }
      else
      {
        objc_msgSend(v63, "amount");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "amount");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v63;
        v69 = objc_msgSend(v70, "compare:", v71) != -1;

      }
      v72 = v68;
      objc_msgSend(v68, "amount");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v73, "compare:", v74);

      v76 = objc_msgSend(v101, "requestType");
      v77 = objc_msgSend(v101, "requestType");
      if (!v69 || !v75 && v76 != 3 && v77 != 12)
      {
        v78 = v17;
        v79 = (void *)MEMORY[0x1E0CB35C8];
        v113 = *MEMORY[0x1E0CB2D68];
        PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_INSUFFICIENT_APPLE_CASH_BALANCE"), 0);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v114[0] = v80;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, &v113, 1);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3009, v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKPaymentAuthorizationDataModel paymentErrors](self->_model, "paymentErrors");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPaymentAuthorizationInvalidDataStateParam paramWithDataType:status:error:clientErrors:](PKPaymentAuthorizationInvalidDataStateParam, "paramWithDataType:status:error:clientErrors:", 3, 5, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 3, v84);
        if (-[PKPaymentAuthorizationStateMachine hasPendingCallbacks](self, "hasPendingCallbacks"))
          -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");

        v17 = v78;
        goto LABEL_58;
      }

      goto LABEL_50;
    }
  }
LABEL_31:
  -[PKContinuityPaymentCoordinator currentRemotePaymentRequest](self->_continuityPaymentCoordinator, "currentRemotePaymentRequest");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "multiTokenContexts");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "recurringPaymentRequest");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "automaticReloadPaymentRequest");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "deferredPaymentRequest");
    v48 = v17;
    v49 = v15;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel paymentApplication](self->_model, "paymentApplication");
    v51 = v16;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine _performSendClientUpdateWithShippingMethods:paymentSummaryItems:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:paymentApplication:status:](self, "_performSendClientUpdateWithShippingMethods:paymentSummaryItems:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:paymentApplication:status:", v108, v49, v97, v44, v46, v50, v52, 0);

    v16 = v51;
    v15 = v49;
    v17 = v48;

LABEL_57:
    v18 = v103;
LABEL_58:
    v59 = v104;
    v58 = v105;
    goto LABEL_59;
  }
LABEL_50:
  if (!-[PKPaymentAuthorizationDataModel wantsInstructions](self->_model, "wantsInstructions"))
  {
    -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");
    goto LABEL_57;
  }
  -[PKPaymentAuthorizationDataModel transactionAmount](self->_model, "transactionAmount");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)v107;
  v87 = objc_msgSend(v85, "isEqualToValue:", v107);

  v59 = v104;
  v58 = v105;
  if ((v87 & 1) == 0)
    -[PKPaymentAuthorizationDataModel setInstructions:](self->_model, "setInstructions:", 0);
  v18 = v103;
  if (-[PKPaymentAuthorizationStateMachine hasPendingCallbacks](self, "hasPendingCallbacks")
    || (-[PKPaymentAuthorizationDataModel instructions](self->_model, "instructions"),
        v88 = (void *)objc_claimAutoreleasedReturnValue(),
        v88,
        v88))
  {
    -[PKPaymentAuthorizationStateMachine _advanceToNextState](self, "_advanceToNextState");
  }
  else
  {
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "merchantSession");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel paymentApplication](self->_model, "paymentApplication");
    v102 = v15;
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "secureElementIdentifier");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel transactionAmount](self->_model, "transactionAmount");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel currencyCode](self->_model, "currencyCode");
    v94 = v17;
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentAuthorizationPrepareTransactionDetailsStateParam paramWithMerchantSession:secureElementIdentifier:transactionAmount:currencyCode:](PKPaymentAuthorizationPrepareTransactionDetailsStateParam, "paramWithMerchantSession:secureElementIdentifier:transactionAmount:currencyCode:", v90, v92, v93, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v94;
    v59 = v104;

    v58 = v105;
    v86 = (void *)v107;

    v15 = v102;
    v18 = v103;

    -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 8, v96);
  }
LABEL_60:

}

- (void)_updateAssessmentAttributes
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[PKPaymentAuthorizationStateMachine _isDeviceTransactionAssessmentEnabled](self, "_isDeviceTransactionAssessmentEnabled")|| -[PKPaymentAuthorizationStateMachine _isServiceProviderAssessmentEnabled](self, "_isServiceProviderAssessmentEnabled"))
  {
    if (!-[PKODIAssessment isAssessing](self->_odiTransactionAssessment, "isAssessing")
      || !-[PKODIAssessment isAssessing](self->_odiServiceProviderAssessment, "isAssessing"))
    {
      PKLogFacilityTypeGetObject(6uLL);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "CoreODI not assessing, starting...", v4, 2u);
      }

      -[PKPaymentAuthorizationStateMachine _startAssessmentIfNecessary](self, "_startAssessmentIfNecessary");
    }
    -[PKODIAssessment updateAssessmentWithModel:](self->_odiTransactionAssessment, "updateAssessmentWithModel:", self->_model);
  }
}

- (void)_updatePassRewardsInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PKAccountEnhancedMerchantsFetcher *v8;
  PKAccountEnhancedMerchantsFetcher *enhancedMerchantsFetcher;
  PKAccountEnhancedMerchantsFetcher *v10;
  NSUUID *v11;
  NSUUID *enhancedMerchantsFetcherUpdateToken;
  void (**v13)(_QWORD);
  id v14;
  id v15;
  void *v16;
  int v17;
  PKAccountService *accountService;
  _QWORD v19[5];
  void (**v20)(_QWORD);
  _QWORD aBlock[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id location[2];

  if (PKIsPhone())
  {
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "requestType")
      || -[PKPaymentAuthorizationDataModel mode](self->_model, "mode") != 1
      || !self->_accountService)
    {
      goto LABEL_21;
    }
    -[PKPaymentAuthorizationDataModel appleCardPass](self->_model, "appleCardPass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "associatedAccountServiceAccountIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "length"))
    {
LABEL_20:

LABEL_21:
      return;
    }
    objc_msgSend(v3, "hashedMerchantIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_19:

      goto LABEL_20;
    }
    objc_initWeak(location, self);
    v7 = MEMORY[0x1E0C809B0];
    if (!self->_enhancedMerchantsFetcher)
    {
      v8 = -[PKAccountEnhancedMerchantsFetcher initWithAccountIdentifier:accountService:]([PKAccountEnhancedMerchantsFetcher alloc], "initWithAccountIdentifier:accountService:", v5, self->_accountService);
      enhancedMerchantsFetcher = self->_enhancedMerchantsFetcher;
      self->_enhancedMerchantsFetcher = v8;

      v10 = self->_enhancedMerchantsFetcher;
      v24[0] = v7;
      v24[1] = 3221225472;
      v24[2] = __60__PKPaymentAuthorizationStateMachine__updatePassRewardsInfo__block_invoke;
      v24[3] = &unk_1E2AC3648;
      objc_copyWeak(&v25, location);
      -[PKAccountEnhancedMerchantsFetcher addUpdateHandler:](v10, "addUpdateHandler:", v24);
      v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      enhancedMerchantsFetcherUpdateToken = self->_enhancedMerchantsFetcherUpdateToken;
      self->_enhancedMerchantsFetcherUpdateToken = v11;

      objc_destroyWeak(&v25);
    }
    aBlock[0] = v7;
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PKPaymentAuthorizationStateMachine__updatePassRewardsInfo__block_invoke_2;
    aBlock[3] = &unk_1E2AC2E68;
    objc_copyWeak(&v23, location);
    aBlock[4] = self;
    v22 = v6;
    v13 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[PKAccount accountIdentifier](self->_appleCardAccount, "accountIdentifier");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v5;
    v16 = v15;
    if (v14 == v15)
    {

    }
    else
    {
      if (!v15 || !v14)
      {

LABEL_17:
        accountService = self->_accountService;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __60__PKPaymentAuthorizationStateMachine__updatePassRewardsInfo__block_invoke_3;
        v19[3] = &unk_1E2ABDEA0;
        v19[4] = self;
        v20 = v13;
        -[PKAccountService accountWithIdentifier:completion:](accountService, "accountWithIdentifier:completion:", v16, v19);

        goto LABEL_18;
      }
      v17 = objc_msgSend(v14, "isEqualToString:", v15);

      if (!v17)
        goto LABEL_17;
    }
    v13[2](v13);
LABEL_18:

    objc_destroyWeak(&v23);
    objc_destroyWeak(location);
    goto LABEL_19;
  }
}

void __60__PKPaymentAuthorizationStateMachine__updatePassRewardsInfo__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePassRewardsInfo");

}

void __60__PKPaymentAuthorizationStateMachine__updatePassRewardsInfo__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "showPaymentSheetRewards"))
    objc_msgSend(WeakRetained, "_performPassRewardsUpdateForCooldownLevel:ignoreErrorBackoff:merchantIdentifier:", 3, 0, *(_QWORD *)(a1 + 40));

}

void __60__PKPaymentAuthorizationStateMachine__updatePassRewardsInfo__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  id v7;

  v6 = a2;
  if (v6 && !a3)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v6 = v7;
  }

}

- (void)_performPassRewardsUpdateForCooldownLevel:(unint64_t)a3 ignoreErrorBackoff:(BOOL)a4 merchantIdentifier:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  PKAccountEnhancedMerchantsFetcher *enhancedMerchantsFetcher;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v5 = a4;
  v8 = a5;
  -[PKPaymentAuthorizationDataModel appleCardPass](self->_model, "appleCardPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  enhancedMerchantsFetcher = self->_enhancedMerchantsFetcher;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __118__PKPaymentAuthorizationStateMachine__performPassRewardsUpdateForCooldownLevel_ignoreErrorBackoff_merchantIdentifier___block_invoke;
  v13[3] = &unk_1E2AC7DC8;
  objc_copyWeak(v16, &location);
  v11 = v9;
  v14 = v11;
  v16[1] = (id)a3;
  v12 = v8;
  v15 = v12;
  -[PKAccountEnhancedMerchantsFetcher updateDataWithCooldownLevel:ignoreErrorBackoff:completion:](enhancedMerchantsFetcher, "updateDataWithCooldownLevel:ignoreErrorBackoff:completion:", a3, v5, v13);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

void __118__PKPaymentAuthorizationStateMachine__performPassRewardsUpdateForCooldownLevel_ignoreErrorBackoff_merchantIdentifier___block_invoke(uint64_t a1, char a2)
{
  id *WeakRetained;
  id *v5;
  uint64_t v6;
  char v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  char v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) == 0)
    {
LABEL_8:
      objc_msgSend(v5[7], "setEnhancedMerchantInfo:forPass:", 0, *(_QWORD *)(a1 + 32));
      goto LABEL_16;
    }
    v6 = *(_QWORD *)(a1 + 56);
    v7 = objc_msgSend(WeakRetained[29], "dataIsWithinThresholdForCooldownLevel:", 1);
    v8 = v7;
    if (v6 == 1 && (v7 & 1) == 0)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 56);
        v13 = 134217984;
        v14 = v10;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Unexpected error: current account merchant data does not meet requested level of %ld", (uint8_t *)&v13, 0xCu);
      }

      goto LABEL_8;
    }
    objc_msgSend(v5[29], "enhancedMerchantMatchingPaymentIdentifier:", *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = v8;
    else
      v12 = 1;
    if ((v12 & 1) != 0)
      objc_msgSend(v5[7], "setEnhancedMerchantInfo:forPass:", v11, *(_QWORD *)(a1 + 32));
    else
      objc_msgSend(v5, "_performPassRewardsUpdateForCooldownLevel:ignoreErrorBackoff:merchantIdentifier:", 1, 1, *(_QWORD *)(a1 + 40));

  }
LABEL_16:

}

- (void)_dispatchNextCallbackParam
{
  PKPaymentAuthorizationClientCallbackStateParam *v3;
  NSObject *v4;
  unint64_t v5;
  const __CFString *v6;
  PKPaymentAuthorizationClientCallbackStateParam *mostRecentClientCallback;
  PKPaymentAuthorizationClientCallbackStateParam *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationStateMachine _dequeuePendingCallbackParam](self, "_dequeuePendingCallbackParam");
  v3 = (PKPaymentAuthorizationClientCallbackStateParam *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(7uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[PKPaymentAuthorizationClientCallbackStateParam kind](v3, "kind");
    if (v5 > 0xA)
      v6 = CFSTR("unknown");
    else
      v6 = off_1E2AC8560[v5];
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "State machine dispatching callback kind: %@", (uint8_t *)&v9, 0xCu);
  }

  self->_awaitingClientCallbackReply = 1;
  mostRecentClientCallback = self->_mostRecentClientCallback;
  self->_mostRecentClientCallback = v3;
  v8 = v3;

  -[PKPaymentAuthorizationStateMachine _startClientCallbackTimer](self, "_startClientCallbackTimer");
  -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 7, v8);

}

- (void)_enqueueCallbackOfKind:(int64_t)a3 withObject:(id)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  NSMutableArray *callbackQueue;
  NSMutableArray *v10;
  NSMutableArray *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PKLogFacilityTypeGetObject(7uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 0xA)
      v8 = CFSTR("unknown");
    else
      v8 = off_1E2AC8560[a3];
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "State machine enqueueing callback kind: %@ object: %@", (uint8_t *)&v13, 0x16u);
  }

  callbackQueue = self->_callbackQueue;
  if (!callbackQueue)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v11 = self->_callbackQueue;
    self->_callbackQueue = v10;

    callbackQueue = self->_callbackQueue;
  }
  +[PKPaymentAuthorizationClientCallbackStateParam paramWithCallbackKind:object:](PKPaymentAuthorizationClientCallbackStateParam, "paramWithCallbackKind:object:", a3, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](callbackQueue, "addObject:", v12);

  if (!self->_awaitingClientCallbackReply)
    -[PKPaymentAuthorizationStateMachine _dispatchNextCallbackParam](self, "_dispatchNextCallbackParam");

}

- (id)_dequeuePendingCallbackParam
{
  void *v3;

  -[NSMutableArray firstObject](self->_callbackQueue, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[NSMutableArray removeObjectAtIndex:](self->_callbackQueue, "removeObjectAtIndex:", 0);
  return v3;
}

- (BOOL)hasPendingCallbacks
{
  return self->_awaitingClientCallbackReply || -[NSMutableArray count](self->_callbackQueue, "count") != 0;
}

- (void)_startClientCallbackTimer
{
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  int64_t v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *clientCallbackTimer;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  _QWORD handler[4];
  id v14;
  uint8_t buf[4];
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationStateMachine _cancelClientCallbackTimer](self, "_cancelClientCallbackTimer");
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientCallbackTimeout");
  v5 = v4;

  if (v5 <= 0.0)
  {
    v7 = 30000000000;
  }
  else
  {
    PKLogFacilityTypeGetObject(7uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Payment request specifies a custom client callback timeout of %f seconds.", buf, 0xCu);
    }

    v7 = (uint64_t)(v5 * 1000000000.0);
  }
  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  clientCallbackTimer = self->_clientCallbackTimer;
  self->_clientCallbackTimer = v8;

  v10 = self->_clientCallbackTimer;
  v11 = dispatch_time(0, v7);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak((id *)buf, self);
  v12 = self->_clientCallbackTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __63__PKPaymentAuthorizationStateMachine__startClientCallbackTimer__block_invoke;
  handler[3] = &unk_1E2AC3648;
  objc_copyWeak(&v14, (id *)buf);
  dispatch_source_set_event_handler(v12, handler);
  dispatch_resume((dispatch_object_t)self->_clientCallbackTimer);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __63__PKPaymentAuthorizationStateMachine__startClientCallbackTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clientCallbackTimedOut");

}

- (void)_cancelClientCallbackTimer
{
  NSObject *clientCallbackTimer;
  OS_dispatch_source *v4;

  clientCallbackTimer = self->_clientCallbackTimer;
  if (clientCallbackTimer)
  {
    dispatch_source_cancel(clientCallbackTimer);
    v4 = self->_clientCallbackTimer;
    self->_clientCallbackTimer = 0;

  }
}

- (void)_clientCallbackTimedOut
{
  OS_dispatch_source *clientCallbackTimer;
  unint64_t state;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  void *v10;
  PKPaymentAuthorizationClientCallbackStateParam *mostRecentClientCallback;
  int v12;
  PKPaymentAuthorizationClientCallbackStateParam *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  clientCallbackTimer = self->_clientCallbackTimer;
  self->_clientCallbackTimer = 0;

  if (-[PKPaymentAuthorizationStateMachine hasPendingCallbacks](self, "hasPendingCallbacks"))
  {
    state = self->_state;
    v5 = state >= 0x10;
    v7 = state == 16;
    v6 = (1 << state) & 0x1A000;
    v7 = !v7 && v5 || v6 == 0;
    if (v7)
    {
      PKLogFacilityTypeGetObject(7uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        mostRecentClientCallback = self->_mostRecentClientCallback;
        v12 = 138412290;
        v13 = mostRecentClientCallback;
        _os_log_error_impl(&dword_18FC92000, v8, OS_LOG_TYPE_ERROR, "Timed out waiting for client callback: %@", (uint8_t *)&v12, 0xCu);
      }

      AnalyticsSendEvent();
      -[PKAggregateDictionaryProtocol addValueForScalarKey:value:](self->_aggregateDictionary, "addValueForScalarKey:value:", CFSTR("com.apple.passbook.payment.in-app.client-callback-timeout"), 1);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 15, v10);

    }
  }
}

- (void)_enqueueDidRequestMerchantSession
{
  -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 0, 0);
}

- (void)_enqueueDidSelectShippingContact:(id)a3
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "sanitizedContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postalAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "requiresAddressPrecision");
  if (v10)
  {
    -[PKPaymentAuthorizationDataModel hostApplicationIdentifier](self->_model, "hostApplicationIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("W74U47NE8E.com.apple.store.Jolly")) & 1) != 0)
    {
LABEL_5:

      goto LABEL_10;
    }
    -[PKPaymentAuthorizationDataModel hostApplicationIdentifier](self->_model, "hostApplicationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("MT9US5E2G8.com.apple.store.Jolly.MessagesExtension")))
    {

      goto LABEL_5;
    }
    v20 = v11;
  }
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "originatingURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isAppleURL");

  if (v10)
  {

  }
  if ((v14 & 1) == 0)
  {
    objc_msgSend(v8, "redactedPostalAddress");
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_10:
  objc_msgSend(v8, "redactedStreetAddress");
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v16 = (void *)v15;

  v22 = *MEMORY[0x1E0C967F0];
  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", CFSTR("Shipping"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97200], "pkContactWithNameComponents:labeledValues:", 0, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 1, v19);

}

- (void)_enqueueDidSelectPaymentMethodWithBindToken:(id)a3
{
  id v4;
  PKPaymentMethod *v5;

  v4 = a3;
  v5 = -[PKPaymentMethod initWithBindToken:]([PKPaymentMethod alloc], "initWithBindToken:", v4);

  -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 3, v5);
}

- (void)_enqueueDidSelectPaymentMethodWithQuote:(id)a3
{
  id v4;
  PKPaymentMethod *v5;

  v4 = a3;
  v5 = -[PKPaymentMethod initWithPeerPaymentQuote:]([PKPaymentMethod alloc], "initWithPeerPaymentQuote:", v4);

  if (-[PKPaymentAuthorizationDataModel supportsPreservePeerPaymentBalance](self->_model, "supportsPreservePeerPaymentBalance"))
  {
    -[PKPaymentMethod setUsePeerPaymentBalance:](v5, "setUsePeerPaymentBalance:", -[PKPaymentAuthorizationDataModel usePeerPaymentBalance](self->_model, "usePeerPaymentBalance"));
  }
  -[PKPaymentAuthorizationDataModel setPaymentErrors:](self->_model, "setPaymentErrors:", 0);
  -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 3, v5);

}

- (void)_enqueueDidSelectPayLaterFinancingWithAccount:(id)a3
{
  id v4;
  PKPaymentMethod *v5;

  v4 = a3;
  v5 = -[PKPaymentMethod initWithPayLaterAccount:primaryAccountNumberSuffix:obfuscateNetworks:]([PKPaymentMethod alloc], "initWithPayLaterAccount:primaryAccountNumberSuffix:obfuscateNetworks:", v4, 0, 1);

  -[PKPaymentAuthorizationStateMachine _updatePaymentRequestBillingAddressWithPaymentMethod:](self, "_updatePaymentRequestBillingAddressWithPaymentMethod:", v5);
  -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 3, v5);

}

- (void)_enqueueDidSelectBankAccount:(id)a3
{
  id v4;
  PKPaymentMethod *v5;

  v4 = a3;
  v5 = -[PKPaymentMethod initWithBankAccount:]([PKPaymentMethod alloc], "initWithBankAccount:", v4);

  -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 3, v5);
}

- (void)_enqueueDidSelectPaymentPass:(id)a3
{
  -[PKPaymentAuthorizationStateMachine _enqueueDidSelectPaymentPass:paymentApplication:](self, "_enqueueDidSelectPaymentPass:paymentApplication:", a3, 0);
}

- (void)_enqueueDidSelectPaymentPass:(id)a3 paymentApplication:(id)a4
{
  id v6;
  PKPaymentMethod *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if (!v17)
  {
    -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 3, 0);
    goto LABEL_12;
  }
  v7 = -[PKPaymentMethod initWithPaymentPass:paymentApplication:obfuscateNetworks:]([PKPaymentMethod alloc], "initWithPaymentPass:paymentApplication:obfuscateNetworks:", v17, v6, 1);
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "associatedApplicationIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel hostApplicationIdentifier](self->_model, "hostApplicationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "containsObject:", v10) & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v17, "associatedWebDomains");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "merchantSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "containsObject:", v13) & 1) != 0)
  {

LABEL_5:
LABEL_6:
    v14 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v14, "sanitizePaymentApplications");
    -[PKPaymentMethod setPaymentPass:](v7, "setPaymentPass:", v14);

    goto LABEL_7;
  }
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isPeerPaymentRequest");

  if ((v16 & 1) != 0)
    goto LABEL_6;
LABEL_7:
  -[PKPaymentAuthorizationStateMachine _updatePaymentRequestBillingAddressWithPaymentMethod:](self, "_updatePaymentRequestBillingAddressWithPaymentMethod:", v7);
  if (objc_msgSend(v8, "isPeerPaymentRequest")
    && -[PKPaymentAuthorizationDataModel supportsPreservePeerPaymentBalance](self->_model, "supportsPreservePeerPaymentBalance"))
  {
    -[PKPaymentMethod setUsePeerPaymentBalance:](v7, "setUsePeerPaymentBalance:", -[PKPaymentAuthorizationDataModel usePeerPaymentBalance](self->_model, "usePeerPaymentBalance"));
  }
  -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 3, v7);

LABEL_12:
}

- (void)_enqueueDidSelectRemotePaymentInstrument:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "primaryPaymentApplication");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine _enqueueDidSelectRemotePaymentInstrument:paymentApplication:](self, "_enqueueDidSelectRemotePaymentInstrument:paymentApplication:", v4, v5);

}

- (void)_enqueueDidSelectRemotePaymentInstrument:(id)a3 paymentApplication:(id)a4
{
  id v6;
  PKPaymentMethod *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = -[PKPaymentMethod initWithRemotePaymentInstrument:paymentApplication:]([PKPaymentMethod alloc], "initWithRemotePaymentInstrument:paymentApplication:", v13, v6);

  objc_msgSend(v13, "associatedWebDomains");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "merchantSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "containsObject:", v11);

  if (v12)
    -[PKPaymentMethod setRemoteInstrument:](v7, "setRemoteInstrument:", v13);
  -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 3, v7);

}

- (void)_enqueueDidUpdateAccountServicePaymentMethod:(id)a3
{
  -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 9, a3);
}

- (void)_enqueueDidAuthorizePaymentWithInstallmentAuthorizationToken:(id)a3 rewrapResponse:(id)a4
{
  id v6;
  id v7;
  PKPayment *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(PKPayment);
  -[PKPayment setInstallmentAuthorizationToken:](v8, "setInstallmentAuthorizationToken:", v7);

  -[PKPaymentAuthorizationStateMachine _applyBillingInformationToPayment:](self, "_applyBillingInformationToPayment:", v8);
  -[PKPaymentAuthorizationStateMachine _applyShippingMethodToPayment:](self, "_applyShippingMethodToPayment:", v8);
  -[PKPaymentAuthorizationStateMachine _applyShippingInformationToPayment:](self, "_applyShippingInformationToPayment:", v8);
  -[PKPaymentAuthorizationStateMachine _enqueueDidAuthorizePaymentWithPayment:rewrapResponse:](self, "_enqueueDidAuthorizePaymentWithPayment:rewrapResponse:", v8, v6);

}

- (void)_enqueueDidAuthorizePaymentWithToken:(id)a3 rewrapResponse:(id)a4
{
  id v6;
  id v7;
  PKPayment *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKPayment initWithToken:]([PKPayment alloc], "initWithToken:", v7);

  -[PKPaymentAuthorizationStateMachine _applyBillingInformationToPayment:](self, "_applyBillingInformationToPayment:", v8);
  -[PKPaymentAuthorizationStateMachine _applyShippingMethodToPayment:](self, "_applyShippingMethodToPayment:", v8);
  -[PKPaymentAuthorizationStateMachine _applyShippingInformationToPayment:](self, "_applyShippingInformationToPayment:", v8);
  -[PKPaymentAuthorizationStateMachine _enqueueDidAuthorizePaymentWithPayment:rewrapResponse:](self, "_enqueueDidAuthorizePaymentWithPayment:rewrapResponse:", v8, v6);

}

- (void)_enqueueDidAuthorizePaymentWithByPassPayment:(id)a3 rewrapResponse:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[PKPaymentAuthorizationStateMachine _applyBillingInformationToPayment:](self, "_applyBillingInformationToPayment:", v7);
  -[PKPaymentAuthorizationStateMachine _applyShippingMethodToPayment:](self, "_applyShippingMethodToPayment:", v7);
  -[PKPaymentAuthorizationStateMachine _applyShippingInformationToPayment:](self, "_applyShippingInformationToPayment:", v7);
  -[PKPaymentAuthorizationStateMachine _enqueueDidAuthorizePaymentWithPayment:rewrapResponse:](self, "_enqueueDidAuthorizePaymentWithPayment:rewrapResponse:", v7, v6);

}

- (void)_enqueueDidAuthorizePaymentWithRemotePayment:(id)a3 rewrapResponse:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[PKPaymentAuthorizationStateMachine _applyBillingInformationToPayment:](self, "_applyBillingInformationToPayment:", v7);
  -[PKPaymentAuthorizationStateMachine _applyShippingMethodToPayment:](self, "_applyShippingMethodToPayment:", v7);
  -[PKPaymentAuthorizationStateMachine _applyShippingInformationToPayment:](self, "_applyShippingInformationToPayment:", v7);
  -[PKPaymentAuthorizationStateMachine _enqueueDidAuthorizePaymentWithPayment:rewrapResponse:](self, "_enqueueDidAuthorizePaymentWithPayment:rewrapResponse:", v7, v6);

}

- (void)_enqueueDidAuthorizeContext
{
  -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 4, 0);
}

- (void)_enqueueDidAuthorizePaymentWithPayment:(id)a3 rewrapResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  PKPendingPaymentTransaction *v13;
  PKPaymentAuthorizationDataModel *model;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[PKPaymentAuthorizationDataModel mode](self->_model, "mode") != 3)
  {
    objc_msgSend(v6, "token");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine _transactionWithPaymentToken:](self, "_transactionWithPaymentToken:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentAuthorizationDataModel pass](self->_model, "pass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel paymentApplication](self->_model, "paymentApplication");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v9 && v10 && v11)
    {
      v13 = -[PKPendingPaymentTransaction initWithTransaction:pass:paymentApplication:]([PKPendingPaymentTransaction alloc], "initWithTransaction:pass:paymentApplication:", v9, v10, v11);
      model = self->_model;
      v29[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel setPendingTransactions:](model, "setPendingTransactions:", v15);

      -[PKPaymentAuthorizationStateMachine _enrichPaymentRewardsRedemptionWithPaymentTransaction:usingPass:](self, "_enrichPaymentRewardsRedemptionWithPaymentTransaction:usingPass:", v9, v10);
      objc_msgSend(v7, "issuerInstallmentManagementURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setIssuerInstallmentManagementURL:", v16);

    }
    v28 = v12;
    +[PKPaymentOptionsDefaults defaults](PKPaymentOptionsDefaults, "defaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[PKPaymentAuthorizationDataModel billingAddress](self->_model, "billingAddress");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        +[PKPaymentOptionsDefaults defaults](PKPaymentOptionsDefaults, "defaults");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "defaultBillingAddressForPaymentPass:", v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          -[PKPaymentAuthorizationDataModel billingAddress](self->_model, "billingAddress");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setDefaultBillingAddress:forPaymentPass:", v22, v10);

        }
      }
    }
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "requiredShippingContactFields");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentAuthorizationDataModel shippingName](self->_model, "shippingName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (((objc_msgSend(v24, "containsObject:", CFSTR("name")) & 1) != 0
       || objc_msgSend(v24, "containsObject:", CFSTR("phoneticName")))
      && (objc_msgSend(v24, "containsObject:", CFSTR("post")) & 1) == 0)
    {
      if (v25)
      {
        objc_msgSend(v17, "defaultContactName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "isEqualIgnoringIdentifiers:", v26);

        if ((v27 & 1) == 0)
          objc_msgSend(v17, "setDefaultContactName:", v25);
      }
    }

  }
  -[PKPaymentAuthorizationDataModel setPayment:](self->_model, "setPayment:", v6);
  -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 5, v6);

}

- (void)_enqeueDidAuthorizePurchaseWithParam:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  PKPendingPaymentTransaction *v11;
  PKPaymentAuthorizationDataModel *model;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "purchase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "purchaseTransactionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentAuthorizationStateMachine _transactionWithPurchase:paymentHash:](self, "_transactionWithPurchase:paymentHash:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentAuthorizationDataModel pass](self->_model, "pass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel paymentApplication](self->_model, "paymentApplication");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7 && v8 && v9)
  {
    v11 = -[PKPendingPaymentTransaction initWithTransaction:pass:paymentApplication:]([PKPendingPaymentTransaction alloc], "initWithTransaction:pass:paymentApplication:", v7, v8, v9);
    model = self->_model;
    v14[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel setPendingTransactions:](model, "setPendingTransactions:", v13);

  }
  -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 6, v5);

}

- (void)_enqueueDidAuthorizePeerPaymentQuoteWithAuthorizedQuote:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  PKPaymentAuthorizationDataModel *model;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v11, "peerPaymentQuote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRecurringPayment");

  if ((v6 & 1) == 0)
  {
    -[PKPaymentAuthorizationStateMachine _pendingTransactionOnPeerPaymentPassForAuthorizedPeerPaymentQuote:](self, "_pendingTransactionOnPeerPaymentPassForAuthorizedPeerPaymentQuote:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v7);
    -[PKPaymentAuthorizationStateMachine _pendingTransactionOnAlternateFundingSourceForAutorizedPeerPaymentQuote:](self, "_pendingTransactionOnAlternateFundingSourceForAutorizedPeerPaymentQuote:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v8);

  }
  model = self->_model;
  v10 = (void *)objc_msgSend(v4, "copy");
  -[PKPaymentAuthorizationDataModel setPendingTransactions:](model, "setPendingTransactions:", v10);

  -[PKPaymentAuthorizationStateMachine _applyBillingInformationToAuthorizedQuote:](self, "_applyBillingInformationToAuthorizedQuote:", v11);
  -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 7, v11);

}

- (void)_enqueueDidAuthorizeAccountServicePaymentRequestWithApplePayTrustSignature:(id)a3
{
  -[PKPaymentAuthorizationStateMachine _enqueueCallbackOfKind:withObject:](self, "_enqueueCallbackOfKind:withObject:", 8, a3);
}

- (void)_updatePaymentRequestBillingAddressWithPaymentMethod:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requiredBillingContactFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v5, "requiredShippingContactFields");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", CFSTR("post"));

    if ((v8 & 1) == 0)
    {
      -[PKPaymentAuthorizationDataModel billingAddress](self->_model, "billingAddress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sanitizedContact");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "postalAddresses");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "redactedPostalAddress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v18 = *MEMORY[0x1E0C967F0];
        objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", CFSTR("Billing"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C97200], "pkContactWithNameComponents:labeledValues:", 0, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setBillingAddress:", v17);

      }
    }
  }
  else
  {

  }
}

- (id)_pendingTransactionOnPeerPaymentPassForAuthorizedPeerPaymentQuote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  PKPendingPaymentTransaction *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  PKPaymentTransaction *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint8_t v56[16];
  uint8_t v57[16];
  uint8_t v58[16];
  uint8_t buf[16];

  v4 = a3;
  -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Peer payment pass is not included in the data model. Fetching the pass from the pass library.", buf, 2u);
    }

    +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "peerPaymentPassUniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "passWithUniqueID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "paymentPass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "devicePrimaryInAppPaymentApplication");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v6)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    objc_msgSend(v4, "peerPaymentQuote");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject firstQuoteItemOfType:](v15, "firstQuoteItemOfType:", 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject firstQuoteItemOfType:](v15, "firstQuoteItemOfType:", 1);
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject firstQuoteItemOfType:](v15, "firstQuoteItemOfType:", 3);
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSObject firstQuoteItemOfType:](v15, "firstQuoteItemOfType:", 4);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject recipient](v15, "recipient");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(PKPaymentTransaction);
    -[PKPaymentTransaction setOriginatedByDevice:](v19, "setOriginatedByDevice:", 1);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransaction setTransactionDate:](v19, "setTransactionDate:", v20);

    -[PKPaymentTransaction addUpdateReasons:](v19, "addUpdateReasons:", 2);
    -[PKPaymentTransaction setTransactionSource:](v19, "setTransactionSource:", 2);
    -[PKPaymentTransaction setTechnologyType:](v19, "setTechnologyType:", 2);
    if (v18)
    {
      -[PKPaymentTransaction setTransactionType:](v19, "setTransactionType:", 3);
      -[PKPaymentTransaction setPeerPaymentType:](v19, "setPeerPaymentType:", 1);
      objc_msgSend(v18, "phoneOrEmail");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction setPeerPaymentCounterpartHandle:](v19, "setPeerPaymentCounterpartHandle:", v21);
LABEL_15:

      goto LABEL_36;
    }
    if (v16 && !v55)
    {
      -[PKPaymentTransaction setTransactionType:](v19, "setTransactionType:", 6);
      goto LABEL_36;
    }
    if (v17)
    {
      v48 = v16;
      -[PKPaymentTransaction setTransactionType:](v19, "setTransactionType:", 5);
      -[PKPaymentTransaction setSecondaryFundingSourceType:](v19, "setSecondaryFundingSourceType:", 1);
      -[NSObject bankName](v15, "bankName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject accountNumber](v15, "accountNumber");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v23;
      v53 = v17;
      if ((unint64_t)objc_msgSend(v23, "length") < 4)
      {
        v27 = 0;
      }
      else
      {
        objc_msgSend(v23, "substringFromIndex:", objc_msgSend(v23, "length") - 4);
        v24 = v22;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        PKMaskedPaymentPAN((uint64_t)v25);
        v26 = objc_claimAutoreleasedReturnValue();

        v22 = v24;
        v27 = (void *)v26;
      }
      v16 = v48;
      v47 = v22;
      v33 = objc_msgSend(v22, "length");
      v34 = objc_msgSend(v27, "length");
      v50 = v27;
      if (v33 && v34)
      {
        v43 = v27;
        v35 = v47;
        PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_SECONDARY_FUNDING_SOURCE_BANK_ACCOUNT_DESCRIPTION_BANK_NAME_AND_ACCOUNT_SUFFIX_FORMAT_STRING"), CFSTR("%@%@"), v47, v43);
        v36 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v33)
        {
          if (v34)
          {
            PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_SECONDARY_FUNDING_SOURCE_BANK_ACCOUNT_DESCRIPTION_ACCOUNT_SUFFIX_FORMAT_STRING"), CFSTR("%@"), v27);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v37 = 0;
          }
          v35 = v47;
          goto LABEL_35;
        }
        v35 = v47;
        v36 = v47;
      }
      v37 = v36;
LABEL_35:
      -[PKPaymentTransaction setSecondaryFundingSourceDescription:](v19, "setSecondaryFundingSourceDescription:", v37);

      v17 = v53;
LABEL_36:
      -[PKPaymentAuthorizationDataModel pass](self->_model, "pass");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38)
      {
        -[NSObject localizedDescription](v38, "localizedDescription");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentTransaction setSecondaryFundingSourceDescription:](v19, "setSecondaryFundingSourceDescription:", v40);

        -[NSObject primaryAccountIdentifier](v39, "primaryAccountIdentifier");
        v41 = objc_claimAutoreleasedReturnValue();
        -[PKPaymentTransaction setSecondaryFundingSourceFPANIdentifier:](v19, "setSecondaryFundingSourceFPANIdentifier:", v41);
      }
      else
      {
        if (!(v16 | v17))
          goto LABEL_39;
        PKLogFacilityTypeGetObject(0xBuLL);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v56 = 0;
          _os_log_impl(&dword_18FC92000, v41, OS_LOG_TYPE_DEFAULT, "Could not find secondary funding source pass, pending transaction will not contain pass description.", v56, 2u);
        }
      }

LABEL_39:
      v14 = -[PKPendingPaymentTransaction initWithTransaction:pass:paymentApplication:]([PKPendingPaymentTransaction alloc], "initWithTransaction:pass:paymentApplication:", v19, v6, v12);
LABEL_40:

      goto LABEL_41;
    }
    if (!v54)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v57 = 0;
        _os_log_impl(&dword_18FC92000, v39, OS_LOG_TYPE_DEFAULT, "Could not find quote item to use for pending transaction. Not creating pending transaction on peer payment pass", v57, 2u);
      }
      v14 = 0;
      goto LABEL_40;
    }
    -[PKPaymentTransaction setTransactionType:](v19, "setTransactionType:", 5);
    -[PKPaymentTransaction setSecondaryFundingSourceType:](v19, "setSecondaryFundingSourceType:", 2);
    -[PKPaymentAuthorizationDataModel pass](self->_model, "pass");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v28;
    if (!v28)
    {
      v21 = 0;
LABEL_55:
      -[PKPaymentTransaction setSecondaryFundingSourceDescription:](v19, "setSecondaryFundingSourceDescription:", v21);

      goto LABEL_15;
    }
    v29 = v28;
    objc_msgSend(v28, "devicePrimaryPaymentApplication");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayablePaymentNetworkNameForPaymentCredentialType(objc_msgSend(v45, "paymentNetworkIdentifier"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "primaryAccountNumberSuffix");
    v30 = objc_claimAutoreleasedReturnValue();
    PKMaskedPaymentPAN(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v31;
    v46 = (void *)v30;
    if (v49 && v31)
    {
      PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_SECONDARY_FUNDING_SOURCE_DEBIT_DESCRIPTION_CREDENTIAL_TYPE_AND_SUFFIX_FORMAT_STRING"), CFSTR("%@%@"), v49, v31);
    }
    else
    {
      if (v49)
      {
        v32 = v49;
        goto LABEL_53;
      }
      if (!v31)
      {
        v21 = 0;
        goto LABEL_54;
      }
      PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_SECONDARY_FUNDING_SOURCE_DEBIT_DESCRIPTION_ACCOUNT_SUFFIX_FORMAT_STRING"), CFSTR("%@"), v31);
    }
    v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:
    v21 = v32;
    v31 = v44;
LABEL_54:

    goto LABEL_55;
  }
  PKLogFacilityTypeGetObject(0xBuLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v58 = 0;
    _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Could not find peer payment pass. Not creating pending transaction.", v58, 2u);
  }
  v14 = 0;
LABEL_41:

  return v14;
}

- (id)_pendingTransactionOnAlternateFundingSourceForAutorizedPeerPaymentQuote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  PKPendingPaymentTransaction *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSObject *v20;
  PKPaymentTransaction *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  uint8_t buf[16];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentAuthorizationDataModel pass](self->_model, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel paymentApplication](self->_model, "paymentApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "dpanIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "peerPaymentQuote");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (!v13)
      goto LABEL_18;
    v14 = v13;
    v26 = v11;
    v27 = v4;
    v15 = 0;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v18, "dpanIdentifier", v26, v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isEqualToString:", v10))
        {
          v20 = v18;

          v15 = v20;
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v14);
    v11 = v26;
    v4 = v27;
    if (v15)
    {
      v21 = objc_alloc_init(PKPaymentTransaction);
      -[PKPaymentTransaction setOriginatedByDevice:](v21, "setOriginatedByDevice:", 1);
      -[PKPaymentTransaction addUpdateReasons:](v21, "addUpdateReasons:", 2);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction setTransactionDate:](v21, "setTransactionDate:", v22);

      -[PKPaymentTransaction setTransactionType:](v21, "setTransactionType:", 0);
      -[PKPaymentTransaction setTransactionSource:](v21, "setTransactionSource:", 2);
      -[PKPaymentTransaction setTechnologyType:](v21, "setTechnologyType:", 2);
      -[NSObject totalAmount](v15, "totalAmount");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction setAmount:](v21, "setAmount:", v23);

      -[NSObject totalAmountCurrency](v15, "totalAmountCurrency");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction setCurrencyCode:](v21, "setCurrencyCode:", v24);

      -[PKPaymentTransaction setAssociatedFeatureIdentifier:](v21, "setAssociatedFeatureIdentifier:", 1);
      v9 = -[PKPendingPaymentTransaction initWithTransaction:pass:paymentApplication:]([PKPendingPaymentTransaction alloc], "initWithTransaction:pass:paymentApplication:", v21, v5, v7);

    }
    else
    {
LABEL_18:
      PKLogFacilityTypeGetObject(0xBuLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Could not find quote item matching dpan ID of pass in payment authorization data model", buf, 2u);
      }
      v9 = 0;
    }

  }
  return v9;
}

- (void)_performNonceRequestWithParam:(id)a3
{
  id v4;
  void *v5;
  PKPayLaterFinancingController *financingController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint32_t v21;
  dispatch_time_t v22;
  id v23;
  void *v24;
  void *v25;
  id *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  uint32_t v38;
  id location[2];

  v4 = a3;
  -[PKPaymentAuthorizationDataModel selectedFinancingOption](self->_model, "selectedFinancingOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && -[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") == 1)
  {
    financingController = self->_financingController;
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterFinancingController stateMachineUpdatedAuthenticationState:selectedOptionIdentifier:error:cancelReason:](financingController, "stateMachineUpdatedAuthenticationState:selectedOptionIdentifier:error:cancelReason:", 4, v7, 0, self->_cancelReason);

  }
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine _computeAssessmentIfNecessary](self, "_computeAssessmentIfNecessary");
  objc_initWeak(location, self);
  objc_msgSend(v8, "merchantSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!PKHandsOnDemoModeEnabled() && !PKUIOnlyDemoModeEnabled())
  {
    if (objc_msgSend(v8, "requestType") == 2
      || objc_msgSend(v8, "requestType") == 4
      || objc_msgSend(v8, "requestType") == 5)
    {
      goto LABEL_10;
    }
    if (v9)
    {
      self->_awaitingWebServiceResponse = 1;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke_2;
      v31[3] = &unk_1E2AC7DF0;
      v26 = &v34;
      objc_copyWeak(&v34, location);
      v32 = v9;
      v33 = v4;
      -[PKPaymentAuthorizationStateMachine _augmentSessionResponseWithCompletion:](self, "_augmentSessionResponseWithCompletion:", v31);

      v27 = v32;
    }
    else
    {
      if (objc_msgSend(v8, "isPeerPaymentRequest"))
      {
LABEL_10:
        objc_msgSend(v4, "credential");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPaymentAuthorizationAuthorizeStateParam paramWithCredential:](PKPaymentAuthorizationAuthorizeStateParam, "paramWithCredential:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKPaymentAuthorizationStateMachine _setState:param:](self, "_setState:param:", 10, v25);
        goto LABEL_11;
      }
      self->_awaitingWebServiceResponse = 1;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke_4;
      v28[3] = &unk_1E2AC7E18;
      v26 = &v30;
      objc_copyWeak(&v30, location);
      v29 = v4;
      -[PKPaymentAuthorizationStateMachine _nonceResponseWithCompletion:](self, "_nonceResponseWithCompletion:", v28);
      v27 = v29;
    }

    objc_destroyWeak(v26);
    goto LABEL_11;
  }
  -[PKPaymentAuthorizationDataModel paymentApplication](self->_model, "paymentApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "paymentNetworkIdentifier");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PKPaymentToken_%d"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99D50];
  PKPassKitCoreBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pathForResource:ofType:", v12, CFSTR("archive"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataWithContentsOfFile:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = arc4random();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v38, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "SHA256Hash");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hexEncoding");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setTransactionIdentifier:", v20);
  v21 = arc4random_uniform(0xAu);
  v22 = dispatch_time(0, (uint64_t)((1.0 / (double)(v21 + 1) + 1.0) * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke;
  block[3] = &unk_1E2ABE7B0;
  objc_copyWeak(&v37, location);
  v36 = v17;
  v23 = v17;
  dispatch_after(v22, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v37);
LABEL_11:

  objc_destroyWeak(location);
}

void __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[PKPaymentAuthorizationAuthorizedStateParam paramWithPaymentToken:rewrapResponse:](PKPaymentAuthorizationAuthorizedStateParam, "paramWithPaymentToken:rewrapResponse:", *(_QWORD *)(a1 + 32), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_setState:param:", 12, v2);

  }
}

void __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke_2(id *a1, void *a2, void *a3)
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

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke_3;
  block[3] = &unk_1E2AC4B38;
  objc_copyWeak(&v14, a1 + 6);
  v10 = v5;
  v11 = a1[4];
  v12 = a1[5];
  v13 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v14);
}

void __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke_3(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;
  unint64_t v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "state");
    if (v4 > 0x10 || ((1 << v4) & 0x1A000) == 0)
    {
      v3[11] = 0;
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v20 = *MEMORY[0x1E0CB3388];
        v21[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2004, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_setState:param:", 14, v10);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "retryNonce");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = v11;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "nonce");
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v14 = v13;

        v15 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v14, "pk_decodeHexadecimal");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(*(id *)(a1 + 56), "cryptogramType");
        objc_msgSend(*(id *)(a1 + 56), "networkMerchantIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPaymentAuthorizationAuthorizeStateParam paramWithNonceParam:nonce:cryptogramType:networkMerchantIdentifier:](PKPaymentAuthorizationAuthorizeStateParam, "paramWithNonceParam:nonce:cryptogramType:networkMerchantIdentifier:", v15, v16, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "_setState:param:", 10, v19);
      }
    }
  }

}

void __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke_4(uint64_t a1, void *a2, void *a3)
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
  v9[2] = __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke_5;
  v9[3] = &unk_1E2AC4A98;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v6;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __68__PKPaymentAuthorizationStateMachine__performNonceRequestWithParam___block_invoke_5(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  NSObject *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "nonceData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(7uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Nonce for pass: %@", buf, 0xCu);
  }

  if (WeakRetained)
  {
    v5 = objc_msgSend(WeakRetained, "state");
    if (v5 > 0x10 || ((1 << v5) & 0x1A000) == 0)
    {
      WeakRetained[11] = 0;
      v6 = *(_QWORD *)(a1 + 40);
      if (v6)
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v14 = *MEMORY[0x1E0CB3388];
        v15 = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2004, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_setState:param:", 14, v10);

      }
      else
      {
        v11 = *(_QWORD *)(a1 + 48);
        v12 = objc_msgSend(*(id *)(a1 + 32), "cryptogramType");
        objc_msgSend(*(id *)(a1 + 32), "networkMerchantIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPaymentAuthorizationAuthorizeStateParam paramWithNonceParam:nonce:cryptogramType:networkMerchantIdentifier:](PKPaymentAuthorizationAuthorizeStateParam, "paramWithNonceParam:nonce:cryptogramType:networkMerchantIdentifier:", v11, v3, v12, v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(WeakRetained, "_setState:param:", 10, v9);
      }

    }
  }

}

- (void)_computeAssessmentIfNecessary
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationStateMachine _activeODIAssessment](self, "_activeODIAssessment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Computing CoreODI assessment %@", (uint8_t *)&v5, 0xCu);
    }

    self->_odiAssessmentInFlight = 1;
    objc_msgSend(v3, "computeAssessment");
  }

}

- (void)_augmentSessionResponseWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __76__PKPaymentAuthorizationStateMachine__augmentSessionResponseWithCompletion___block_invoke;
    v5[3] = &unk_1E2AC7E68;
    objc_copyWeak(&v7, &location);
    v6 = v4;
    -[PKPaymentAuthorizationStateMachine _augmentBaseRequestWithCompletion:](self, "_augmentBaseRequestWithCompletion:", v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __76__PKPaymentAuthorizationStateMachine__augmentSessionResponseWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PKPaymentAuthorizationStateMachine__augmentSessionResponseWithCompletion___block_invoke_2;
  block[3] = &unk_1E2AC7E40;
  objc_copyWeak(&v19, (id *)(a1 + 40));
  v15 = v9;
  v10 = *(id *)(a1 + 32);
  v17 = v8;
  v18 = v10;
  v16 = v7;
  v11 = v8;
  v12 = v7;
  v13 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v19);
}

void __76__PKPaymentAuthorizationStateMachine__augmentSessionResponseWithCompletion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      objc_msgSend(WeakRetained[7], "paymentRequest");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentAugmentSessionRequest augmentSessionRequestWithBaseRequest:](PKPaymentAugmentSessionRequest, "augmentSessionRequestWithBaseRequest:", *(_QWORD *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "merchantSession");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMerchantSession:", v5);

      v6 = objc_msgSend(v3, "isServiceProviderPaymentRequest");
      v7 = v10[4];
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 56);
      if (v6)
        objc_msgSend(v7, "serviceProviderAugmentSessionWithRequest:serviceURL:completion:", v4, v8, v9);
      else
        objc_msgSend(v7, "augmentSessionWithRequest:serviceURL:completion:", v4, v8, v9);

    }
    WeakRetained = v10;
  }

}

- (void)_nonceResponseWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__PKPaymentAuthorizationStateMachine__nonceResponseWithCompletion___block_invoke;
    v5[3] = &unk_1E2AC7E68;
    objc_copyWeak(&v7, &location);
    v6 = v4;
    -[PKPaymentAuthorizationStateMachine _augmentBaseRequestWithCompletion:](self, "_augmentBaseRequestWithCompletion:", v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __67__PKPaymentAuthorizationStateMachine__nonceResponseWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PKPaymentAuthorizationStateMachine__nonceResponseWithCompletion___block_invoke_2;
  block[3] = &unk_1E2AC7E40;
  objc_copyWeak(&v19, (id *)(a1 + 40));
  v15 = v9;
  v10 = *(id *)(a1 + 32);
  v17 = v8;
  v18 = v10;
  v16 = v7;
  v11 = v8;
  v12 = v7;
  v13 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v19);
}

void __67__PKPaymentAuthorizationStateMachine__nonceResponseWithCompletion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PKAccountWebServiceFinancingPlanNonceRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      objc_msgSend(WeakRetained[7], "paymentRequest");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentNonceRequest nonceRequestWithBaseRequest:](PKPaymentNonceRequest, "nonceRequestWithBaseRequest:", *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "merchantIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMerchantIdentifier:", v6);

      if (objc_msgSend(v4, "isServiceProviderPaymentRequest"))
      {
        objc_msgSend(v3[4], "serviceProviderNonceWithRequest:serviceURL:completion:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      }
      else if (objc_msgSend(v4, "isPayLaterPaymentRequest"))
      {
        objc_msgSend(v4, "payLaterPaymentRequest");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_alloc_init(PKAccountWebServiceFinancingPlanNonceRequest);
        objc_msgSend(v7, "accountBaseURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKAccountWebServiceFinancingPlanNonceRequest setBaseURL:](v8, "setBaseURL:", v9);

        objc_msgSend(v7, "accountIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKAccountWebServiceFinancingPlanNonceRequest setAccountIdentifier:](v8, "setAccountIdentifier:", v10);

        objc_msgSend(v7, "financingPlan");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "planIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKAccountWebServiceFinancingPlanNonceRequest setPlanIdentifier:](v8, "setPlanIdentifier:", v12);

        -[PKAccountWebServiceFinancingPlanNonceRequest setAugmentBaseRequest:](v8, "setAugmentBaseRequest:", *(_QWORD *)(a1 + 40));
        v13 = v3[4];
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __67__PKPaymentAuthorizationStateMachine__nonceResponseWithCompletion___block_invoke_3;
        v14[3] = &unk_1E2AC7E90;
        v15 = *(id *)(a1 + 56);
        objc_msgSend(v13, "accountFinancingPlanNonceWithRequest:completion:", v8, v14);

      }
      else
      {
        objc_msgSend(v3[4], "inAppPaymentNonceWithRequest:serviceURL:completion:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      }

    }
  }

}

uint64_t __67__PKPaymentAuthorizationStateMachine__nonceResponseWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_augmentBaseRequestWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  PKSecureElement *secureElement;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD aBlock[4];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  uint8_t buf[16];

  v49 = a3;
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currencyCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundInterfaceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel paymentApplication](self->_model, "paymentApplication");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bankAccountInformation");
  v11 = objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel selectedFinancingOption](self->_model, "selectedFinancingOption");
  v12 = objc_claimAutoreleasedReturnValue();
  v54 = v8;
  v55 = v4;
  v52 = (void *)v11;
  v53 = v9;
  v50 = (void *)v6;
  v51 = (void *)v12;
  if (v12)
  {
    v13 = (void *)v12;
    if (-[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") == 1)
    {
      objc_msgSend(v13, "authAmount");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currency");
      v48 = objc_claimAutoreleasedReturnValue();

      -[PKPayLaterFinancingController selectedFundingSource](self->_financingController, "selectedFundingSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "type");
      if (v16 == 2)
      {
        v47 = v7;
        v18 = 0;
        v19 = 0;
      }
      else
      {
        if (v16 != 1)
        {
LABEL_23:
          -[PKPayLaterFinancingController payLaterAccount](self->_financingController, "payLaterAccount", v47);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "paymentServicesBaseURL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
          {
            PKLogFacilityTypeGetObject(0xEuLL);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Error: There is no paymentServicesBaseURL defined on the pay later account", buf, 2u);
            }

          }
          objc_msgSend(v13, "dueNow");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            objc_msgSend(v13, "dueNow");
            v31 = v7;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "currencyAmount");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "amount");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "pk_isZeroNumber");

            v7 = v31;
            v26 = v35 ^ 1;
          }
          else
          {
            v26 = 0;
          }
          v27 = v49;

          if (v15)
          {
            if (objc_msgSend(v15, "type") == 2)
              v26 = 0;
          }
          else
          {
            v26 = 1;
          }

          v24 = 1;
          v5 = (void *)v48;
          goto LABEL_36;
        }
        v47 = v7;
        v17 = v15;
        objc_msgSend(v17, "paymentPass");
        v18 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "paymentApplication");
        v19 = objc_claimAutoreleasedReturnValue();
        v10 = v17;
      }

      v10 = (void *)v18;
      v56 = (void *)v19;
      v7 = v47;
      goto LABEL_23;
    }
  }
  v20 = objc_msgSend(v4, "isPayLaterPaymentRequest");
  if (v10)
    v21 = 1;
  else
    v21 = v11 == 0;
  v22 = v21;
  if (v21)
    v23 = v10;
  else
    v23 = 0;
  v24 = 0;
  if (v20)
    v10 = v23;
  v25 = 0;
  if (v20)
    v26 = v22;
  else
    v26 = 1;
  v27 = v49;
LABEL_36:
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPaymentAuthorizationStateMachine__augmentBaseRequestWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2AC7EB8;
  v68 = v24;
  v36 = v10;
  v61 = v36;
  v37 = v56;
  v62 = v37;
  v38 = v50;
  v63 = v38;
  v39 = v5;
  v64 = v39;
  v40 = v7;
  v65 = v40;
  v41 = v27;
  v67 = v41;
  v42 = v25;
  v66 = v42;
  v43 = _Block_copy(aBlock);
  v44 = v43;
  if (v26)
  {
    secureElement = self->_secureElement;
    objc_msgSend(v37, "applicationIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __72__PKPaymentAuthorizationStateMachine__augmentBaseRequestWithCompletion___block_invoke_2;
    v57[3] = &unk_1E2AC7EE0;
    v58 = v37;
    v59 = v44;
    -[PKSecureElement appletWithIdentifier:completion:](secureElement, "appletWithIdentifier:completion:", v46, v57);

  }
  else
  {
    (*((void (**)(void *, _QWORD, _QWORD))v43 + 2))(v43, 0, 0);
  }

}

void __72__PKPaymentAuthorizationStateMachine__augmentBaseRequestWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PKPaymentAugmentBaseRequest *v7;

  v5 = a3;
  v6 = a2;
  v7 = objc_alloc_init(PKPaymentAugmentBaseRequest);
  -[PKPaymentAugmentBaseRequest setType:](v7, "setType:", a1[11]);
  -[PKPaymentAugmentBaseRequest setPass:](v7, "setPass:", a1[4]);
  -[PKPaymentAugmentBaseRequest setPaymentApplication:](v7, "setPaymentApplication:", a1[5]);
  -[PKPaymentAugmentBaseRequest setApplet:](v7, "setApplet:", v6);

  -[PKPaymentAugmentBaseRequest setMerchantCountryCode:](v7, "setMerchantCountryCode:", a1[6]);
  -[PKPaymentAugmentBaseRequest setCurrencyCode:](v7, "setCurrencyCode:", a1[7]);
  -[PKWebServiceRequest setBoundInterfaceIdentifier:](v7, "setBoundInterfaceIdentifier:", a1[8]);
  (*(void (**)(void))(a1[10] + 16))();

}

void __72__PKPaymentAuthorizationStateMachine__augmentBaseRequestWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("Failed to get applet with identifier: %@ from SE"), v6);

    v8 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2938];
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2004, v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_performPrepareTransactionDetailsRequestWithParam:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  PKPaymentInstructions *v10;
  PKPaymentInstructions *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PKPaymentWebService *paymentWebService;
  _QWORD v22[4];
  id v23[2];
  _QWORD v24[4];
  id v25;
  _QWORD block[4];
  PKPaymentInstructions *v27;
  id v28;
  id v29;
  id location;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  if (PKHandsOnDemoModeEnabled() || PKUIOnlyDemoModeEnabled())
  {
    PKSharedCacheDirectoryPath();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Demo/Instructions.plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v7, &v29);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v29;
    if (v8
      && (v10 = -[PKPaymentInstructions initWithDictionary:]([PKPaymentInstructions alloc], "initWithDictionary:", v8)) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __88__PKPaymentAuthorizationStateMachine__performPrepareTransactionDetailsRequestWithParam___block_invoke;
      block[3] = &unk_1E2ABE7B0;
      objc_copyWeak(&v28, &location);
      v27 = v10;
      v11 = v10;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v28);
    }
    else
    {
      PKLogFacilityTypeGetObject(7uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v32 = v6;
        v33 = 2112;
        v34 = v9;
        _os_log_error_impl(&dword_18FC92000, v12, OS_LOG_TYPE_ERROR, "Demo mode requires valid Instructions.plist at:%@, error:%@", buf, 0x16u);
      }

      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __88__PKPaymentAuthorizationStateMachine__performPrepareTransactionDetailsRequestWithParam___block_invoke_214;
      v24[3] = &unk_1E2AC3648;
      objc_copyWeak(&v25, &location);
      dispatch_async(MEMORY[0x1E0C80D38], v24);
      objc_destroyWeak(&v25);
    }

  }
  else
  {
    v13 = (void *)(self->_prepareTransactionDetailsCounter + 1);
    self->_prepareTransactionDetailsCounter = (unint64_t)v13;
    self->_awaitingWebServiceResponse = 1;
    paymentWebService = self->_paymentWebService;
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "merchantSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel paymentApplication](self->_model, "paymentApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "secureElementIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
    {
      -[PKSecureElement primarySecureElementIdentifier](self->_secureElement, "primarySecureElementIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PKPaymentAuthorizationDataModel transactionAmount](self->_model, "transactionAmount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel currencyCode](self->_model, "currencyCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __88__PKPaymentAuthorizationStateMachine__performPrepareTransactionDetailsRequestWithParam___block_invoke_2;
    v22[3] = &unk_1E2AC7F30;
    objc_copyWeak(v23, &location);
    v23[1] = v13;
    -[PKPaymentWebService prepareTransactionDetailsForMerchantSession:secureElementIdentifier:amount:currencyCode:completion:](paymentWebService, "prepareTransactionDetailsForMerchantSession:secureElementIdentifier:amount:currencyCode:completion:", v15, v18, v19, v20, v22);

    if (!v17)
    objc_destroyWeak(v23);
  }
  objc_destroyWeak(&location);

}

void __88__PKPaymentAuthorizationStateMachine__performPrepareTransactionDetailsRequestWithParam___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(7uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Demo mode advancing to prepare transactions details state..", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInstructions:", *(_QWORD *)(a1 + 32));

  objc_msgSend(WeakRetained, "_advanceToNextState");
}

void __88__PKPaymentAuthorizationStateMachine__performPrepareTransactionDetailsRequestWithParam___block_invoke_214(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2014, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_setState:param:", 15, v2);

}

void __88__PKPaymentAuthorizationStateMachine__performPrepareTransactionDetailsRequestWithParam___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12[2];

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__PKPaymentAuthorizationStateMachine__performPrepareTransactionDetailsRequestWithParam___block_invoke_3;
  v9[3] = &unk_1E2AC7F08;
  objc_copyWeak(v12, (id *)(a1 + 32));
  v12[1] = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(v12);
}

void __88__PKPaymentAuthorizationStateMachine__performPrepareTransactionDetailsRequestWithParam___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "state");
    v5 = v4 > 0x10 || ((1 << v4) & 0x1A000) == 0;
    if (v5 && *(_QWORD *)(a1 + 56) == *((_QWORD *)v3 + 23))
    {
      *((_BYTE *)v3 + 11) = 0;
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
      {
        v10 = *MEMORY[0x1E0CB3388];
        v11[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (*(_QWORD *)(a1 + 40))
        {
          objc_msgSend(*((id *)v3 + 7), "setInstructions:");
          objc_msgSend(v3, "_advanceToNextState");
          goto LABEL_6;
        }
        v7 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2014, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_setState:param:", 15, v9);

    }
  }
LABEL_6:

}

- (void)_performRewrapRequestWithParam:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[PKPaymentAuthorizationStateMachine _activeODIAssessment](self, "_activeODIAssessment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPaymentAuthorizationDataModel mode](self->_model, "mode") != 1 || v5 == 0;
  if (v6
    || (objc_msgSend(v5, "currentAssessment"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    -[PKPaymentAuthorizationStateMachine _performRewrapRequestImplWithParam:](self, "_performRewrapRequestImplWithParam:", v4);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__PKPaymentAuthorizationStateMachine__performRewrapRequestWithParam___block_invoke;
    v8[3] = &unk_1E2AC7F58;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v5, "waitForAssessmentWithContinueBlock:", v8);

  }
}

void __69__PKPaymentAuthorizationStateMachine__performRewrapRequestWithParam___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __69__PKPaymentAuthorizationStateMachine__performRewrapRequestWithParam___block_invoke_2;
  v2[3] = &unk_1E2ABE0D0;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __69__PKPaymentAuthorizationStateMachine__performRewrapRequestWithParam___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performRewrapRequestImplWithParam:", *(_QWORD *)(a1 + 40));
}

- (void)_performRewrapRequestImplWithParam:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKPaymentWebService *paymentWebService;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PKPaymentServiceProviderPerformPaymentRequest *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  int v41;
  PKAccountWebServiceFinancingPlanFundingSourceActionRequest *v42;
  uint64_t v43;
  NSObject *v44;
  PKPaymentWebService *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  BOOL v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  PKPaymentWebService *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD aBlock[5];
  id v73;
  id v74;
  id location;
  _BYTE buf[12];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "credential");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke;
  aBlock[3] = &unk_1E2AC7F80;
  objc_copyWeak(&v74, &location);
  aBlock[4] = self;
  v6 = v5;
  v73 = v6;
  v7 = _Block_copy(aBlock);
  -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "paymentPass");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentAuthorizationDataModel paymentApplication](self->_model, "paymentApplication");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "merchantSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    self->_awaitingWebServiceResponse = 1;
    *(_QWORD *)buf = 0;
    -[PKPaymentAuthorizationStateMachine _rewrapCompleteSessionRequestWithParam:serviceURL:](self, "_rewrapCompleteSessionRequestWithParam:serviceURL:", v4, buf);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    paymentWebService = self->_paymentWebService;
    v14 = *(_QWORD *)buf;
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke_220;
    v69[3] = &unk_1E2AC7FA8;
    v70 = v11;
    v71 = v7;
    -[PKPaymentWebService completeSessionWithRequest:serviceURL:completion:](paymentWebService, "completeSessionWithRequest:serviceURL:completion:", v12, v14, v69);

    goto LABEL_38;
  }
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "serviceProviderPaymentRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "serviceProviderPaymentRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "serviceProviderOrder");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v61, "serviceProviderData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "mutableCopy");

      objc_msgSend(v63, "primaryAccountIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "safelySetObject:forKey:", v21, CFSTR("primaryAccountIdentifier"));

      objc_msgSend(v62, "dpanIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "safelySetObject:forKey:", v22, CFSTR("selectedDpanId"));

      objc_msgSend(v20, "objectForKey:", CFSTR("requestMPAN"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "BOOLValue");

      if (v24)
      {
        objc_msgSend(v63, "devicePrimaryPaymentApplication");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "dpanIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "safelySetObject:forKey:", v26, CFSTR("devicePrimaryAccountIdentifier"));

        objc_msgSend(v63, "issuerCountryCode");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "safelySetObject:forKey:", v27, CFSTR("issuerCountryCode"));

      }
      v28 = (void *)objc_msgSend(v20, "copy");
      objc_msgSend(v61, "setServiceProviderData:", v28);

    }
    objc_msgSend(v61, "setPaymentInstrumentType:", 1);
    objc_msgSend(v4, "wrappedPayment");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "transactionData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setAppletValue:", v30);

    if (objc_msgSend(v62, "supportsBarcodePayment")
      && (objc_msgSend(v62, "supportsContactlessPayment") & 1) == 0)
    {
      objc_msgSend(v4, "wrappedPayment");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "transactionIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setTransactionIdentifier:", v32);

    }
    v33 = objc_alloc_init(PKPaymentServiceProviderPerformPaymentRequest);
    -[PKPaymentServiceProviderPerformPaymentRequest setPass:](v33, "setPass:", v63);
    -[PKPaymentServiceProviderPerformPaymentRequest setServiceProviderOrder:](v33, "setServiceProviderOrder:", v61);
    objc_msgSend(v4, "nonceData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentServiceProviderPerformPaymentRequest setNonce:](v33, "setNonce:", v34);

    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "serviceProviderPaymentRequest");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "targetDeviceSerialNumber");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentServiceProviderPerformPaymentRequest setTargetDeviceSerialNumber:](v33, "setTargetDeviceSerialNumber:", v37);

    -[PKPaymentServiceProviderPerformPaymentRequest setCryptogramType:](v33, "setCryptogramType:", objc_msgSend(v4, "cryptogramType"));
    if (!_os_feature_enabled_impl())
    {
      PKLogFacilityTypeGetObject(6uLL);
      v44 = objc_claimAutoreleasedReturnValue();
      v60 = v44;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v44, OS_LOG_TYPE_DEFAULT, "Device assessments not enabled for service provider payment requests", buf, 2u);
      }
      goto LABEL_37;
    }
    -[PKPaymentAuthorizationStateMachine _activeODIAssessment](self, "_activeODIAssessment");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      if (!objc_msgSend(v63, "supportsDeviceAssessmentAccordingToService:", self->_paymentWebService))
      {
        PKLogFacilityTypeGetObject(6uLL);
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v46, OS_LOG_TYPE_DEFAULT, "Not attaching device assessment to service provider payment request, as pass does not support assessments (assessment was probably generated for a supported pass, but payment is being made with an unsupported pass)", buf, 2u);
        }

        objc_msgSend(v59, "provideSessionFeedback:", 1);
        goto LABEL_29;
      }
      objc_msgSend(v59, "currentAssessment");
      v38 = objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject(6uLL);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v59;
        _os_log_impl(&dword_18FC92000, v39, OS_LOG_TYPE_DEFAULT, "Attaching device assessment to service provider payment request %@", buf, 0xCu);
      }

      -[PKPaymentServiceProviderPerformPaymentRequest setDeviceAssessments:](v33, "setDeviceAssessments:", v38);
      objc_msgSend(v59, "provideSessionFeedback:", 0);
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v38, OS_LOG_TYPE_DEFAULT, "No device assessment generated for service provider payment request", buf, 2u);
      }
    }

LABEL_29:
    -[PKPaymentAuthorizationDataModel shippingAddress](self->_model, "shippingAddress", v59);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v47
      || (objc_msgSend(v63, "shippingAddressSeed"),
          v48 = (void *)objc_claimAutoreleasedReturnValue(),
          v49 = v48 == 0,
          v48,
          v47,
          v49))
    {
      PKLogFacilityTypeGetObject(6uLL);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v54, OS_LOG_TYPE_DEFAULT, "Address seed: Pass has no seed, skipping", buf, 2u);
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v50, OS_LOG_TYPE_DEFAULT, "Address seed: Pass has seed, hashing", buf, 2u);
      }

      -[PKPaymentAuthorizationDataModel shippingAddress](self->_model, "shippingAddress");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "postalAddresses");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "firstObject");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "value");
      v54 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v63, "shippingAddressSeed");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      PKPostalAddressHash((uint64_t)v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v56, "base64EncodedStringWithOptions:", 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentServiceProviderPerformPaymentRequest setShippingAddressHash:](v33, "setShippingAddressHash:", v57);

    }
LABEL_37:

    self->_awaitingWebServiceResponse = 1;
    v58 = self->_paymentWebService;
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke_224;
    v66[3] = &unk_1E2AC7FD0;
    v68 = v7;
    v67 = v4;
    -[PKPaymentWebService performServiceProviderPayment:completion:](v58, "performServiceProviderPayment:completion:", v33, v66);

    goto LABEL_38;
  }
  self->_awaitingWebServiceResponse = 1;
  *(_QWORD *)buf = 0;
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "isPayLaterPaymentRequest");

  if (v41)
  {
    v42 = objc_alloc_init(PKAccountWebServiceFinancingPlanFundingSourceActionRequest);
    -[PKPaymentAuthorizationStateMachine _updatePayLaterFundingSourceActionRequest:param:](self, "_updatePayLaterFundingSourceActionRequest:param:", v42, v4);
    v43 = 0;
  }
  else
  {
    v42 = objc_alloc_init(PKPaymentRewrapRequest);
    -[PKPaymentAuthorizationStateMachine _updateRewrapRequest:param:serviceURL:](self, "_updateRewrapRequest:param:serviceURL:", v42, v4, buf);
    v43 = *(_QWORD *)buf;
  }
  v45 = self->_paymentWebService;
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke_2_228;
  v64[3] = &unk_1E2AC7FF8;
  v65 = v7;
  -[PKPaymentWebService rewrapInAppPaymentWithRequest:serviceURL:completion:](v45, "rewrapInAppPaymentWithRequest:serviceURL:completion:", v42, v43, v64);

LABEL_38:
  objc_destroyWeak(&v74);
  objc_destroyWeak(&location);

}

void __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke_2;
  block[3] = &unk_1E2AC4B38;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  v7 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v14);
}

void __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;
  unint64_t v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  PKPayment *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint8_t v38[8];
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_6;
  v4 = objc_msgSend(WeakRetained, "state");
  if (v4 <= 0x10 && ((1 << v4) & 0x1A000) != 0)
    goto LABEL_6;
  if (v3[13])
  {
    v3[13] = 0;
    objc_msgSend(*(id *)(a1 + 32), "_activeODIAssessment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "currentAssessmentDidTimeout"))
      v7 = 2;
    else
      v7 = 0;
    objc_msgSend(v6, "provideSessionFeedback:", v7);

  }
  v3[11] = 0;
  v8 = *(void **)(a1 + 48);
  if (*(_QWORD *)(a1 + 40) && !v8)
  {
    objc_msgSend(v3, "_setState:param:", 18);
    goto LABEL_6;
  }
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("PKPaymentWebServiceErrorDomain")))
    goto LABEL_22;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "paymentRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "requestType") != 1)
  {

LABEL_22:
LABEL_23:
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
    {
      v45 = *MEMORY[0x1E0CB3388];
      v46[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("PKPaymentWebServiceErrorDomain"));

      if (v17)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "paymentRequest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "merchantSession");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v19, "retryNonce");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
          {
            PKLogFacilityTypeGetObject(7uLL);
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v38 = 0;
              _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, "Web service error without a retry nonce. Failing payment", v38, 2u);
            }

            +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", *(_QWORD *)(a1 + 48));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "_setState:param:", 15, v29);

            goto LABEL_46;
          }
        }
        v21 = objc_msgSend(*(id *)(a1 + 48), "code");
        switch(v21)
        {
          case 60011:
            v39 = *MEMORY[0x1E0CB2D68];
            PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_TOO_MANY_WRONG_CODES"), 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v30;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
            v23 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "model");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "mode");

            v26 = -3001;
            if (v32 == 1)
            {
              v27 = 4;
              goto LABEL_41;
            }
            break;
          case 60010:
            v41 = *MEMORY[0x1E0CB2D68];
            PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_PIN_INCORRECT"), 0);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v33;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
            v23 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "model");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "mode");

            v26 = -3011;
            if (v35 == 1)
            {
              v27 = 2;
              goto LABEL_41;
            }
            break;
          case 40307:
            v43 = *MEMORY[0x1E0CB2D68];
            PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_INSUFFICIENT_BALANCE"), 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v22;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
            v23 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "model");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "mode");

            v26 = -3009;
            if (v25 == 1)
            {
              v27 = 5;
LABEL_41:
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setStatus:forItemWithType:", v27, 3);
            }
            break;
          default:
            v26 = -2007;
            goto LABEL_44;
        }
        v15 = (void *)v23;
LABEL_44:

        goto LABEL_45;
      }
    }
    else
    {
      v15 = 0;
    }
    v26 = -2007;
LABEL_45:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), v26, v15);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setState:param:", 14, v37);

LABEL_46:
    goto LABEL_6;
  }
  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "mode");

  if (v11 != 1)
    goto LABEL_23;
  objc_msgSend(v3, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fallbackToBypassMode");

  v13 = objc_alloc_init(PKPayment);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PKPayment setCredential:](v13, "setCredential:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "_enqueueDidAuthorizePaymentWithPayment:rewrapResponse:", v13, 0);

LABEL_6:
}

void __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke_220(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v9 = a3;
  v10 = a5;
  v11 = *(void **)(a1 + 32);
  v12 = a4;
  objc_msgSend(v11, "setRetryNonce:", v12);
  objc_msgSend(v9, "setRetryNonce:", v12);

  v13 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    +[PKPaymentAuthorizationAuthorizedStateParam paramWithPaymentToken:rewrapResponse:](PKPaymentAuthorizationAuthorizedStateParam, "paramWithPaymentToken:rewrapResponse:", v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v14, v15);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, id))(v13 + 16))(*(_QWORD *)(a1 + 40), 0, v15);
  }

}

void __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke_224(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void (*v12)(uint64_t, _QWORD, id);
  id v13;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  v13 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8 = a3;
    objc_msgSend(v7, "wrappedPayment");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transactionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentAuthorizationAuthorizedStateParam paramWithPurchase:purchaseTransactionIdentifier:](PKPaymentAuthorizationAuthorizedStateParam, "paramWithPurchase:purchaseTransactionIdentifier:", v13, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v11, v8);

  }
  else
  {
    v12 = *(void (**)(uint64_t, _QWORD, id))(v6 + 16);
    v9 = a3;
    v12(v6, 0, v9);
  }

}

void __73__PKPaymentAuthorizationStateMachine__performRewrapRequestImplWithParam___block_invoke_2_228(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v7;
  void (*v8)(uint64_t, _QWORD);
  id v9;

  v4 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v7 = a2;
    +[PKPaymentAuthorizationAuthorizedStateParam paramWithPaymentToken:rewrapResponse:](PKPaymentAuthorizationAuthorizedStateParam, "paramWithPaymentToken:rewrapResponse:", a3, a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v4 + 16))(v4);

  }
  else
  {
    v8 = *(void (**)(uint64_t, _QWORD))(v4 + 16);
    v9 = a2;
    v8(v4, 0);
  }

}

- (void)_updatePayLaterFundingSourceActionRequest:(id)a3 param:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  -[PKPaymentAuthorizationStateMachine _updateRewrapRequest:param:serviceURL:](self, "_updateRewrapRequest:param:serviceURL:", v6, a4, 0);
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "payLaterPaymentRequest");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "accountBaseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBaseURL:", v8);

  objc_msgSend(v12, "accountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccountIdentifier:", v9);

  objc_msgSend(v12, "financingPlan");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "planIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlanIdentifier:", v11);

  objc_msgSend(v6, "setIntent:", objc_msgSend(v12, "payLaterPaymentIntentType"));
}

- (void)_updateRewrapRequest:(id)a3 param:(id)a4 serviceURL:(id *)a5
{
  PKPaymentAuthorizationDataModel *model;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  model = self->_model;
  v9 = a4;
  v10 = a3;
  -[PKPaymentAuthorizationDataModel paymentRequest](model, "paymentRequest");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine _updateRewrapBaseRequest:param:](self, "_updateRewrapBaseRequest:param:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "merchantIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMerchantIdentifier:", v12);

  -[PKPaymentAuthorizationDataModel hostApplicationIdentifier](self->_model, "hostApplicationIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHostApplicationIdentifier:", v13);

  -[PKPaymentAuthorizationDataModel merchantName](self->_model, "merchantName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMerchantDisplayName:", v14);

  if (a5)
    objc_storeStrong(a5, v11);

}

- (id)_rewrapCompleteSessionRequestWithParam:(id)a3 serviceURL:(id *)a4
{
  PKPaymentAuthorizationDataModel *model;
  id v7;
  void *v8;
  void *v9;
  PKPaymentCompleteSessionRequest *v10;
  void *v11;

  model = self->_model;
  v7 = a3;
  -[PKPaymentAuthorizationDataModel paymentRequest](model, "paymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "merchantSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(PKPaymentCompleteSessionRequest);
  -[PKPaymentAuthorizationStateMachine _updateRewrapBaseRequest:param:](self, "_updateRewrapBaseRequest:param:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentCompleteSessionRequest setMerchantSession:](v10, "setMerchantSession:", v9);
  if (a4)
    objc_storeStrong(a4, v11);

  return v10;
}

- (id)_updateRewrapBaseRequest:(id)a3 param:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  PKPayLaterFinancingOptionFundingSource *v25;
  void *v26;
  PKPayLaterFinancingOptionFundingSource *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  PKPayLaterFinancingOptionFundingSource *v32;
  id v33;
  void *v34;
  id v35;
  PKPayLaterFinancingOptionFundingSource *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  char v47;
  uint64_t v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  __CFString **v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  NSObject *v108;
  NSObject *v109;
  id v110;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  PKPayLaterFinancingOptionFundingSource *v121;
  void *v122;
  void *v123;
  void *v124;
  _BOOL4 v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  uint8_t buf[4];
  void *v141;
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel currencyCode](self->_model, "currencyCode");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "boundInterfaceIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel paymentApplication](self->_model, "paymentApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bankAccountInformation");
  v123 = v11;
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pass");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationData");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wrappedPayment");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[PKPaymentAuthorizationDataModel mode](self->_model, "mode") == 1)
  {
    -[PKPaymentAuthorizationDataModel remoteDevice](self->_model, "remoteDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 != 0;

  }
  else
  {
    v16 = 0;
  }
  -[PKPaymentAuthorizationDataModel selectedFinancingOption](self->_model, "selectedFinancingOption");
  v136 = v14;
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v12;
  v125 = v16;
  if (v130 && -[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") == 1)
  {
    objc_msgSend(v130, "authAmount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currency");
    v18 = objc_claimAutoreleasedReturnValue();

    -[PKPayLaterFinancingController payLaterAccount](self->_financingController, "payLaterAccount");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterFinancingController selectedFundingSource](self->_financingController, "selectedFundingSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "type");
    v116 = v9;
    v137 = (void *)v18;
    v135 = v19;
    if (v20 == 2)
    {
      v33 = v19;
      v34 = (void *)v13;
      v35 = v33;

      v36 = [PKPayLaterFinancingOptionFundingSource alloc];
      objc_msgSend(v35, "accountPaymentFundingSource");
      v37 = v7;
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = -[PKPayLaterFinancingOptionFundingSource initWithAccountFundingSource:](v36, "initWithAccountFundingSource:", v38);
      v7 = v37;
      v139 = 0;
      v26 = 0;
    }
    else
    {
      v139 = (void *)v13;
      if (v20 == 1)
      {
        v21 = v19;
        objc_msgSend(v21, "paymentPass");
        v22 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "paymentApplication");
        v23 = v7;
        v24 = objc_claimAutoreleasedReturnValue();

        v25 = -[PKPayLaterFinancingOptionFundingSource initWithPaymentPass:paymentApplication:]([PKPayLaterFinancingOptionFundingSource alloc], "initWithPaymentPass:paymentApplication:", v22, v24);
        v139 = (void *)v22;
        v26 = (void *)v24;
        v7 = v23;
      }
      else
      {
        v26 = v10;
        v25 = 0;
      }
    }
    objc_msgSend(v130, "financingOptionData");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "addEntriesFromDictionary:", v39);

    -[PKPaymentAuthorizationStateMachine _additionalPayLaterServiceProviderData](self, "_additionalPayLaterServiceProviderData");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "addEntriesFromDictionary:", v40);

    -[PKPayLaterFinancingController payLaterAccount](self->_financingController, "payLaterAccount");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "paymentServicesBaseURL");
    v42 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v131, "transactionIdentifier");
    v43 = objc_claimAutoreleasedReturnValue();
    v27 = v25;
    v120 = (id)v42;
    if (!v42)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v44, OS_LOG_TYPE_DEFAULT, "Error: There is no paymentServicesBaseURL defined on the pay later account", buf, 2u);
      }

    }
    -[PKPayLaterFinancingOptionFundingSource setAutoPayment:](v25, "setAutoPayment:", -[PKPayLaterFinancingController autoPaymentOn](self->_financingController, "autoPaymentOn"));

    v28 = 1;
    v134 = v137;
    v138 = (void *)v43;
    v9 = v116;
    v10 = v26;
  }
  else if (objc_msgSend(v8, "isPayLaterPaymentRequest"))
  {
    objc_msgSend(v131, "transactionIdentifier");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v139 = (void *)v13;
      v27 = -[PKPayLaterFinancingOptionFundingSource initWithPaymentPass:paymentApplication:]([PKPayLaterFinancingOptionFundingSource alloc], "initWithPaymentPass:paymentApplication:", v13, v10);
      v132 = 0;
      v28 = 0;
      v120 = 0;
    }
    else
    {
      if (v12)
      {
        objc_msgSend(v8, "payLaterPaymentRequest");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "accountPaymentFundingSourceForBankIdentifier:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = -[PKPayLaterFinancingOptionFundingSource initWithAccountFundingSource:]([PKPayLaterFinancingOptionFundingSource alloc], "initWithAccountFundingSource:", v31);
        v27 = v32;
        v132 = 0;
      }
      else
      {
        v132 = 0;
        v27 = 0;
      }
      v28 = 0;
      v120 = 0;
      v139 = 0;
    }
  }
  else
  {
    v139 = (void *)v13;
    v132 = 0;
    v27 = 0;
    v28 = 0;
    v120 = 0;
    v138 = 0;
  }
  v121 = v27;
  -[PKPayLaterFinancingOptionFundingSource dictionaryRepresentation](v27, "dictionaryRepresentation");
  v45 = objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "isVirtualCardEnrollmentRequest");

  if ((v47 & 1) != 0)
  {
    v48 = 2;
  }
  else
  {
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "isVirtualCardRefreshRequest");

    if (v50)
      v48 = 3;
    else
      v48 = v28;
  }
  v51 = v136;
  -[PKPaymentAuthorizationDataModel selectedPaymentOffer](self->_model, "selectedPaymentOffer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v52;
  v129 = v10;
  if (-[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") == 2 && v52)
  {
    v53 = v7;
    v54 = v9;
    v55 = objc_msgSend(v52, "type");
    if (v55 == 2)
    {
      objc_msgSend(v52, "rewardsRedemptionIntent");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "dictionaryRepresentation");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "safelySetObject:forKey:", v59, CFSTR("rewardsRedemptionIntent"));

      v48 = 5;
    }
    else
    {
      if (v55 != 1)
      {
LABEL_36:
        objc_msgSend(v52, "serviceProviderData");
        v60 = v52;
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addEntriesFromDictionary:", v61);

        objc_msgSend(v60, "sessionIdentifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "safelySetObject:forKey:", v62, CFSTR("sessionIdentifier"));

        objc_msgSend(v60, "selectedOfferIdentifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "safelySetObject:forKey:", v63, CFSTR("selectedOfferIdentifier"));

        objc_msgSend(v60, "criteriaIdentifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "safelySetObject:forKey:", v64, CFSTR("criteriaIdentifier"));

        v9 = v54;
        v7 = v53;
        v10 = v129;
        goto LABEL_37;
      }
      objc_msgSend(v52, "installmentAssessment");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "offers");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)objc_msgSend(v57, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_233);

      v51 = v136;
      objc_msgSend(v136, "safelySetObject:forKey:", v58, CFSTR("allOfferIdentifiers"));
      v48 = 4;
    }

    v52 = v127;
    goto LABEL_36;
  }
LABEL_37:
  objc_msgSend(v6, "setType:", v48);
  objc_msgSend(v7, "wrappedPayment");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWrappedPayment:", v65);

  objc_msgSend(v6, "setPass:", v139);
  objc_msgSend(v6, "setPaymentApplication:", v10);
  objc_msgSend(v6, "setApplicationData:", v133);
  objc_msgSend(v6, "setBoundInterfaceIdentifier:", v9);
  objc_msgSend(v6, "setCryptogramType:", objc_msgSend(v7, "cryptogramType"));
  objc_msgSend(v6, "setCurrencyCode:", v134);
  if (objc_msgSend(v51, "count"))
  {
    v66 = (void *)objc_msgSend(v51, "copy");
    objc_msgSend(v6, "setServiceProviderData:", v66);

  }
  else
  {
    objc_msgSend(v6, "setServiceProviderData:", 0);
  }
  objc_msgSend(v6, "setPaymentHash:", v138);
  objc_msgSend(v6, "setAccount:", v132);
  objc_msgSend(v6, "setFundingSourceDetails:", v45);
  if (v125)
  {
    -[PKPaymentAuthorizationDataModel remoteDevice](self->_model, "remoteDevice");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "modelIdentifier");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v68, "length"))
      objc_msgSend(v6, "setRemoteDeviceModel:", v68);

  }
  objc_msgSend(v8, "remoteNetworkRequestPaymentTopicID");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "length");

  v128 = v7;
  if (v70)
  {
    objc_msgSend(v8, "remoteNetworkRequestPaymentTopicID");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteNetworkRequestPaymentTopicID:", v71);

    objc_msgSend(v8, "userAgent");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteNetworkRequestInitiatingUserAgent:", v72);
  }
  else
  {
    objc_msgSend(v8, "userAgent");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserAgent:", v72);
  }
  v73 = (void *)v9;

  -[PKPaymentWebService targetDevice](self->_paymentWebService, "targetDevice");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "paymentWebService:supportedRegionFeatureOfType:", self->_paymentWebService, 4);
  v75 = objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isMultiTokenRequest") && v75)
  {
    objc_msgSend(v6, "setInitiative:", CFSTR("multi_token"));
    objc_msgSend(v8, "multiTokenContexts");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMultiTokenContexts:", v76);

  }
  v118 = (void *)v75;
  objc_msgSend(v8, "recurringPaymentRequest");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "automaticReloadPaymentRequest");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deferredPaymentRequest");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService targetDevice](self->_paymentWebService, "targetDevice");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "paymentWebService:supportedRegionFeatureOfType:", self->_paymentWebService, 3);
  v81 = objc_claimAutoreleasedReturnValue();

  v119 = (void *)v45;
  v126 = (void *)v81;
  if (v77 && v81)
  {
    objc_msgSend(v6, "setInitiative:", CFSTR("merchant_token"));
    objc_msgSend(v77, "tokenNotificationURL");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "absoluteString");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInitiativeContext:", v83);

    objc_msgSend(v77, "managementURL");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "absoluteString");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMerchantTokenManagementURL:", v85);

    v86 = PKMerchantTokenRequestUseCaseRecurring;
LABEL_56:
    objc_msgSend(v6, "setMerchantTokenUseCase:", *v86);
    goto LABEL_57;
  }
  if (v78 && v81)
  {
    objc_msgSend(v6, "setInitiative:", CFSTR("merchant_token"));
    objc_msgSend(v78, "tokenNotificationURL");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "absoluteString");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInitiativeContext:", v88);

    objc_msgSend(v78, "managementURL");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "absoluteString");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMerchantTokenManagementURL:", v90);

    v86 = PKMerchantTokenRequestUseCaseAutomaticReload;
    goto LABEL_56;
  }
  if (v79 && v81)
  {
    objc_msgSend(v6, "setInitiative:", CFSTR("merchant_token"));
    objc_msgSend(v79, "tokenNotificationURL");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "absoluteString");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInitiativeContext:", v113);

    objc_msgSend(v79, "managementURL");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "absoluteString");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMerchantTokenManagementURL:", v115);

    objc_msgSend(v6, "setMerchantTokenUseCase:", CFSTR("merchant_token_deferred"));
    objc_msgSend(v6, "setIsDeferredPayment:", 1);
  }
LABEL_57:
  v91 = v73;
  if (objc_msgSend(v8, "requestType") == 10)
    objc_msgSend(v6, "setInitiative:", CFSTR("transfer_funds"));
  v117 = v79;
  -[PKPaymentAuthorizationDataModel shippingAddress](self->_model, "shippingAddress");
  v92 = objc_claimAutoreleasedReturnValue();
  v93 = v128;
  if (v92
    && (v94 = (void *)v92,
        objc_msgSend(v139, "shippingAddressSeed"),
        v95 = (void *)objc_claimAutoreleasedReturnValue(),
        v95,
        v94,
        v95))
  {
    v96 = v78;
    PKLogFacilityTypeGetObject(7uLL);
    v97 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v97, OS_LOG_TYPE_DEFAULT, "Address seed: Pass has seed, hashing", buf, 2u);
    }

    -[PKPaymentAuthorizationDataModel shippingAddress](self->_model, "shippingAddress");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "postalAddresses");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "firstObject");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "value");
    v101 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v139, "shippingAddressSeed");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    PKPostalAddressHash((uint64_t)v101, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v103, "base64EncodedStringWithOptions:", 0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShippingAddressHash:", v104);

    v105 = v139;
    v93 = v128;
    v106 = v136;
  }
  else
  {
    v96 = v78;
    PKLogFacilityTypeGetObject(7uLL);
    v101 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v101, OS_LOG_TYPE_DEFAULT, "Address seed: Pass has no seed, skipping", buf, 2u);
    }
    v106 = v136;
    v105 = v139;
  }

  -[PKPaymentAuthorizationStateMachine _activeODIAssessment](self, "_activeODIAssessment");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (v107)
  {
    if (objc_msgSend(v105, "supportsDeviceAssessmentAccordingToService:", self->_paymentWebService))
    {
      objc_msgSend(v107, "currentAssessment");
      v108 = objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject(6uLL);
      v109 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v141 = v107;
        _os_log_impl(&dword_18FC92000, v109, OS_LOG_TYPE_DEFAULT, "Setting device assessment %@", buf, 0xCu);
      }

      objc_msgSend(v6, "setDeviceAssessments:", v108);
      v106 = v136;
      v105 = v139;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v108 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v108, OS_LOG_TYPE_DEFAULT, "Not attaching device assessment to rewrap request, as pass does not support assessments (assessment was probably generated for a supported pass, but payment is being made with an unsupported pass)", buf, 2u);
      }
    }

  }
  v110 = v120;

  return v110;
}

uint64_t __69__PKPaymentAuthorizationStateMachine__updateRewrapBaseRequest_param___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (id)_additionalPayLaterServiceProviderData
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;

  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "APIType");
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((unint64_t)(v4 - 1) < 2)
  {
    objc_msgSend(v3, "merchantSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("webMerchantIdentifier"));
    if (v8)
      objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("webMerchantName"));
    if (v9)
      objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("originURL"));

    goto LABEL_12;
  }
  if (!v4)
  {
    v10 = -[PKPaymentAuthorizationStateMachine _adamIdentifier](self, "_adamIdentifier");
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("adamIdentifier"));
LABEL_12:

    }
  }
  v11 = (void *)objc_msgSend(v5, "copy");

  return v11;
}

- (void)_performDataProcessingWithParam:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  PKPaymentAuthorizationStateMachine *v17;
  id v18;

  v4 = a3;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __70__PKPaymentAuthorizationStateMachine__performDataProcessingWithParam___block_invoke;
  v16 = &unk_1E2ABE0D0;
  v17 = self;
  v5 = v4;
  v18 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(&v13);
  objc_msgSend(v5, "rewrapResponse", v13, v14, v15, v16, v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(v7, "redemption");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v7, "redemption");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentAuthorizationStateMachine _processPaymentRewardsRedemption:](self, "_processPaymentRewardsRedemption:", v9);

      }
    }
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isPayLaterPaymentRequest"))
    {
      objc_msgSend(v7, "financingPlan");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationStateMachine _updatePostPurchasePayLaterFinancingPlan:account:completion:](self, "_updatePostPurchasePayLaterFinancingPlan:account:completion:", v11, v12, v6);

    }
    else
    {
      v6[2](v6);
    }

  }
  else
  {
    v6[2](v6);
  }

}

uint64_t __70__PKPaymentAuthorizationStateMachine__performDataProcessingWithParam___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setState:param:", 12, *(_QWORD *)(a1 + 40));
}

- (void)_processPaymentRewardsRedemption:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PKPaymentRewardsRedemptionUnit *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  PKPaymentRewardsRedemptionUnit *v15;
  PKPaymentRewardsRedemptionDetails *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject(7uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v4;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Got payment rewards redemption details %@", (uint8_t *)&v17, 0xCu);
  }

  -[PKPaymentAuthorizationDataModel pass](self->_model, "pass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PKPaymentAuthorizationDataModel selectedPaymentOffer](self->_model, "selectedPaymentOffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "type") == 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "rewardsRedemptionIntent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9 && (objc_msgSend(v9, "isEmptyValued") & 1) == 0)
        {
          v11 = [PKPaymentRewardsRedemptionUnit alloc];
          v12 = objc_msgSend(v10, "rewardsType");
          objc_msgSend(v10, "monetaryValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[PKPaymentRewardsRedemptionUnit initWithType:monetaryValue:value:](v11, "initWithType:monetaryValue:value:", v12, v13, v14);

          v16 = -[PKPaymentRewardsRedemptionDetails initWithIntended:redeemed:originalTransactionDetails:]([PKPaymentRewardsRedemptionDetails alloc], "initWithIntended:redeemed:originalTransactionDetails:", v15, 0, 0);
          objc_msgSend(v4, "setDetails:", v16);

        }
      }
    }
    -[PKPaymentService insertOrUpdatePaymentRewardsRedemption:withPassUniqueIdentifier:](self->_paymentService, "insertOrUpdatePaymentRewardsRedemption:withPassUniqueIdentifier:", v4, v7);
    PKSharedCacheSetBoolForKey(1, CFSTR("PKSharedCacheHasEverMadeIssuerInstallmentTransaction"));

  }
}

- (void)_enrichPaymentRewardsRedemptionWithPaymentTransaction:(id)a3 usingPass:(id)a4
{
  id v6;
  PKPaymentService *paymentService;
  void *v8;
  void *v9;
  void *v10;
  PKPaymentRewardsRedemptionTransactionDetails *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKPaymentRewardsRedemptionDetails *v18;
  PKPaymentService *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  if (_os_feature_enabled_impl() && !PKHideCardBenefitRewards())
  {
    paymentService = self->_paymentService;
    objc_msgSend(v21, "paymentHash");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentService paymentRewardsRedemptionForPaymentHash:](paymentService, "paymentRewardsRedemptionForPaymentHash:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v21, "merchant");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc_init(PKPaymentRewardsRedemptionTransactionDetails);
      objc_msgSend(v21, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRewardsRedemptionTransactionDetails setIdentifier:](v11, "setIdentifier:", v12);

      objc_msgSend(v21, "merchantProvidedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRewardsRedemptionTransactionDetails setDescriptionText:](v11, "setDescriptionText:", v13);

      objc_msgSend(v10, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRewardsRedemptionTransactionDetails setMerchantRawName:](v11, "setMerchantRawName:", v14);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "category"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRewardsRedemptionTransactionDetails setMerchantCategoryCode:](v11, "setMerchantCategoryCode:", v15);

      objc_msgSend(v21, "transactionDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRewardsRedemptionTransactionDetails setTimestamp:](v11, "setTimestamp:", v16);

      objc_msgSend(v21, "currencyAmount");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRewardsRedemptionTransactionDetails setMonetaryValue:](v11, "setMonetaryValue:", v17);

      objc_msgSend(v9, "details");
      v18 = (PKPaymentRewardsRedemptionDetails *)objc_claimAutoreleasedReturnValue();
      if (!v18)
        v18 = objc_alloc_init(PKPaymentRewardsRedemptionDetails);
      -[PKPaymentRewardsRedemptionDetails setOriginalTransaction:](v18, "setOriginalTransaction:", v11);
      objc_msgSend(v9, "setDetails:", v18);
      v19 = self->_paymentService;
      objc_msgSend(v6, "uniqueID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentService insertOrUpdatePaymentRewardsRedemption:withPassUniqueIdentifier:](v19, "insertOrUpdatePaymentRewardsRedemption:withPassUniqueIdentifier:", v9, v20);

    }
  }

}

- (void)_updatePostPurchasePayLaterFinancingPlan:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKAsyncUnaryOperationComposer *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  PKAccountService *accountService;
  PKAccountService *v19;
  PKAccountService *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  PKAccountService *v30;
  id v31;
  _QWORD v32[4];
  PKAccountService *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "payLaterPaymentRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(v9, "accountIdentifier");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  accountService = self->_accountService;
  if (accountService)
  {
    v19 = accountService;
  }
  else
  {
    +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
    v19 = (PKAccountService *)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;
  v21 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    PKLogFacilityTypeGetObject(7uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v8;
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Updating post purchase pay later financing plan %@", buf, 0xCu);
    }

    v32[0] = v21;
    v32[1] = 3221225472;
    v32[2] = __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke;
    v32[3] = &unk_1E2AC6DB0;
    v33 = v20;
    v34 = v8;
    v35 = v17;
    -[PKAsyncUnaryOperationComposer addOperation:](v11, "addOperation:", v32);

  }
  if (v9)
  {
    PKLogFacilityTypeGetObject(7uLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v9;
      _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "Updating post purchase pay later account %@", buf, 0xCu);
    }

    v29[0] = v21;
    v29[1] = 3221225472;
    v29[2] = __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_259;
    v29[3] = &unk_1E2AC8040;
    v30 = v20;
    v31 = v9;
    -[PKAsyncUnaryOperationComposer addOperation:](v11, "addOperation:", v29);

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  v27[1] = 3221225472;
  v27[2] = __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_4;
  v27[3] = &unk_1E2AC8068;
  v28 = v10;
  v25 = v10;
  v26 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v11, "evaluateWithInput:completion:", v24, v27);

}

void __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)a1[4];
  v16[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a1[6];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_2;
  v13[3] = &unk_1E2ABE008;
  v14 = v6;
  v15 = v7;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v8, "insertOrUpdateLocalFinancingPlans:accountIdentifier:completion:", v9, v10, v13);

}

void __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_3;
  v2[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_259(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_2_260;
  v12[3] = &unk_1E2AC3040;
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "insertOrUpdateLocalAccount:completion:", v8, v12);

}

void __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_2_260(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_3_261;
  v2[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_3_261(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_4(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_5;
  block[3] = &unk_1E2ABD9A0;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __98__PKPaymentAuthorizationStateMachine__updatePostPurchasePayLaterFinancingPlan_account_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_performDidAuthorizeCallbackWithParam:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "requestType");
  if (-[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") == 1)
  {
    -[PKPaymentAuthorizationDataModel selectedFinancingOption](self->_model, "selectedFinancingOption");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[PKPayLaterFinancingController stateMachineUpdatedAuthenticationState:selectedOptionIdentifier:error:cancelReason:](self->_financingController, "stateMachineUpdatedAuthenticationState:selectedOptionIdentifier:error:cancelReason:", 1, v7, 0, self->_cancelReason);
  if (!objc_msgSend(v4, "isServiceProviderPaymentRequest"))
  {
    if (objc_msgSend(v4, "isPeerPaymentRequest"))
    {
      objc_msgSend(v10, "authorizedPeerPaymentQuote");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationStateMachine _enqueueDidAuthorizePeerPaymentQuoteWithAuthorizedQuote:](self, "_enqueueDidAuthorizePeerPaymentQuoteWithAuthorizedQuote:", v8);
LABEL_21:

      goto LABEL_22;
    }
    if (v5 != 2)
    {
      if (v5 == 5)
      {
        objc_msgSend(v10, "installmentAuthorizationToken");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "rewrapResponse");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentAuthorizationStateMachine _enqueueDidAuthorizePaymentWithInstallmentAuthorizationToken:rewrapResponse:](self, "_enqueueDidAuthorizePaymentWithInstallmentAuthorizationToken:rewrapResponse:", v8, v9);
      }
      else
      {
        if (v5 == 4)
          goto LABEL_11;
        if (-[PKPaymentAuthorizationStateMachine useSecureElement](self, "useSecureElement"))
        {
          objc_msgSend(v10, "paymentToken");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "rewrapResponse");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentAuthorizationStateMachine _enqueueDidAuthorizePaymentWithToken:rewrapResponse:](self, "_enqueueDidAuthorizePaymentWithToken:rewrapResponse:", v8, v9);
        }
        else if (-[PKPaymentAuthorizationDataModel mode](self->_model, "mode") == 3)
        {
          if (v5 <= 0xD && ((1 << v5) & 0x20C0) != 0)
          {
            -[PKPaymentAuthorizationStateMachine _enqueueDidAuthorizeContext](self, "_enqueueDidAuthorizeContext");
            goto LABEL_22;
          }
          objc_msgSend(v10, "payment");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "rewrapResponse");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentAuthorizationStateMachine _enqueueDidAuthorizePaymentWithByPassPayment:rewrapResponse:](self, "_enqueueDidAuthorizePaymentWithByPassPayment:rewrapResponse:", v8, v9);
        }
        else
        {
          objc_msgSend(v10, "payment");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "rewrapResponse");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentAuthorizationStateMachine _enqueueDidAuthorizePaymentWithRemotePayment:rewrapResponse:](self, "_enqueueDidAuthorizePaymentWithRemotePayment:rewrapResponse:", v8, v9);
        }
      }

      goto LABEL_21;
    }
LABEL_11:
    objc_msgSend(v10, "applePayTrustSignature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationStateMachine _enqueueDidAuthorizeAccountServicePaymentRequestWithApplePayTrustSignature:](self, "_enqueueDidAuthorizeAccountServicePaymentRequestWithApplePayTrustSignature:", v8);
    goto LABEL_21;
  }
  -[PKPaymentAuthorizationStateMachine _enqeueDidAuthorizePurchaseWithParam:](self, "_enqeueDidAuthorizePurchaseWithParam:", v10);
LABEL_22:

}

- (void)_insertPendingPaymentTransactionsWithParam:(id)a3
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  __int128 v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  if (-[PKPaymentAuthorizationDataModel mode](self->_model, "mode") == 1
    && -[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") != 1)
  {
    -[PKPaymentAuthorizationDataModel pendingTransactions](self->_model, "pendingTransactions");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v29;
      *(_QWORD *)&v5 = 138412802;
      v25 = v5;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v9, "paymentApplication", v25);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "dpanIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "peerPaymentTransactionMetadata");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "dpanIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqual:", v11);

            if (v15)
            {
              objc_msgSend(v9, "transaction");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "serviceIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setServiceIdentifier:", v17);

              objc_msgSend(v13, "requestDeviceScoreIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setRequestDeviceScoreIdentifier:", v18);

              objc_msgSend(v13, "sendDeviceScoreIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setSendDeviceScoreIdentifier:", v19);

            }
          }
          objc_msgSend(v9, "transaction");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "paymentApplication");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "pass");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "uniqueID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          PKLogFacilityTypeGetObject(0x17uLL);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            v33 = v20;
            v34 = 2112;
            v35 = v23;
            v36 = 2112;
            v37 = v21;
            _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Inserting transaction: %@ for pass: %@ paymentApplication: %@", buf, 0x20u);
          }

          -[PKPaymentService insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:](self->_paymentService, "insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:", v20, v23, v21, &__block_literal_global_266_0);
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v6);
    }

  }
}

void __81__PKPaymentAuthorizationStateMachine__insertPendingPaymentTransactionsWithParam___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  PKLogFacilityTypeGetObject(0x17uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18FC92000, v0, OS_LOG_TYPE_DEFAULT, "Inserted transaction from PKPaymentAuthorizationStateMachine", v1, 2u);
  }

}

- (void)_insertPendingTransactionRegistration
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    if (PKDocumentDeliveryEnabled())
    {
      -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "requestType");

      if ((unint64_t)(v4 - 1) >= 0xA
        && (unint64_t)(v4 - 12) >= 3
        && -[PKPaymentAuthorizationDataModel mode](self->_model, "mode") == 1
        && +[PKWebServiceDocumentDeliveryFeature isEnabledWithWebService:](PKWebServiceDocumentDeliveryFeature, "isEnabledWithWebService:", self->_paymentWebService))
      {
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        -[PKPaymentAuthorizationDataModel pendingTransactions](self->_model, "pendingTransactions");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v16;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v16 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
              v11 = objc_alloc_init((Class)getFKTrillianTransactionImporterClass[0]());
              PKLogFacilityTypeGetObject(7uLL);
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v14 = 0;
                _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Inserting pending transaction registration", v14, 2u);
              }

              objc_msgSend(v10, "transaction");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "registerTransaction:", v13);

              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v7);
        }

      }
    }
  }
}

- (void)_insertPendingOrderDetails:(BOOL *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationDataModel payment](self->_model, "payment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel pendingOrderDetails](self->_model, "pendingOrderDetails");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
LABEL_9:
    *a3 = 0;
    goto LABEL_13;
  }
  if (PKOrderManagementDisabled())
  {
    PKLogFacilityTypeGetObject(7uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Payment had order details, but user has disabled order management. Skipping.", (uint8_t *)&v20, 2u);
    }

    goto LABEL_9;
  }
  objc_msgSend(v5, "token");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transactionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(_MergedGlobals_173());
  objc_msgSend(v7, "orderTypeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orderIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "webServiceURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "authenticationToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v12, "initWithTransactionIdentifier:orderTypeIdentifier:orderIdentifier:webServiceBaseURL:authenticationToken:", v11, v13, v14, v15, v16);

  v18 = objc_alloc_init((Class)off_1ECF21B38());
  PKLogFacilityTypeGetObject(7uLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v17;
    _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Inserting pending Apple Pay order with details: %@", (uint8_t *)&v20, 0xCu);
  }

  objc_msgSend(v18, "insertOrUpdatePendingApplePayOrder:", v17);
  *a3 = 1;

LABEL_13:
}

- (void)_updateModelCanAddPasses
{
  PKPaymentWebService *paymentWebService;
  _QWORD v3[5];

  paymentWebService = self->_paymentWebService;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__PKPaymentAuthorizationStateMachine__updateModelCanAddPasses__block_invoke;
  v3[3] = &unk_1E2AC35F8;
  v3[4] = self;
  +[PKPaymentRegistrationUtilities _shouldShowAddCardFlowForWebService:completion:](PKPaymentRegistrationUtilities, "_shouldShowAddCardFlowForWebService:completion:", paymentWebService, v3);
}

uint64_t __62__PKPaymentAuthorizationStateMachine__updateModelCanAddPasses__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "beginUpdates");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setCanAddPasses:", a2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "endUpdates");
}

- (void)_updateModelBillingAddressIfNeededForPass:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requiredBillingContactFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", CFSTR("post")) & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  -[PKPaymentAuthorizationDataModel billingAddress](self->_model, "billingAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[PKPaymentOptionsDefaults defaults](PKPaymentOptionsDefaults, "defaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultBillingAddressForPaymentPass:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[PKPaymentAuthorizationDataModel setBillingAddress:](self->_model, "setBillingAddress:", v4);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)_retrieveVPANPaymentSession
{
  PKPaymentWebService *paymentWebService;
  _QWORD v3[5];

  self->_awaitingWebServiceResponse = 1;
  paymentWebService = self->_paymentWebService;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__PKPaymentAuthorizationStateMachine__retrieveVPANPaymentSession__block_invoke;
  v3[3] = &unk_1E2AC80D0;
  v3[4] = self;
  -[PKPaymentWebService virtualCardPaymentSessionWithCompletion:](paymentWebService, "virtualCardPaymentSessionWithCompletion:", v3);
}

void __65__PKPaymentAuthorizationStateMachine__retrieveVPANPaymentSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PKPaymentAuthorizationStateMachine__retrieveVPANPaymentSession__block_invoke_2;
  block[3] = &unk_1E2ABE0F8;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __65__PKPaymentAuthorizationStateMachine__retrieveVPANPaymentSession__block_invoke_2(uint64_t a1)
{
  void *v2;
  PKPaymentRequestMerchantSessionUpdate *v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = 0;
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = -[PKPaymentRequestMerchantSessionUpdate initWithStatus:merchantSession:]([PKPaymentRequestMerchantSessionUpdate alloc], "initWithStatus:merchantSession:", 0, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "didReceiveMerchantSessionCompleteWithUpdate:");
    objc_msgSend(*(id *)(a1 + 32), "_advanceToNextState");
  }
  else
  {
    v2 = *(void **)(a1 + 32);
    +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", *(_QWORD *)(a1 + 48));
    v3 = (PKPaymentRequestMerchantSessionUpdate *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_setState:param:", 15);
  }

}

- (void)_registerForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:suspensionBehavior:", self, sel__handleStateMachineWillStartNotification_, CFSTR("PKPaymentAuthorizationStateMachineWillStartNotification"), 0, 4);

}

- (void)_unregisterForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_postStateMachineWillStartNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:options:", CFSTR("PKPaymentAuthorizationStateMachineWillStartNotification"), self->_instanceIdentifier, 0, 1);

}

- (void)_handleStateMachineWillStartNotification:(id)a3
{
  id v4;
  unint64_t state;
  BOOL v6;
  uint64_t v7;
  void *v9;
  char v10;
  id v11;

  v4 = a3;
  state = self->_state;
  v6 = state > 0x10;
  v7 = (1 << state) & 0x1A000;
  if (v6 || v7 == 0)
  {
    v11 = v4;
    objc_msgSend(v4, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", self->_instanceIdentifier);

    v4 = v11;
    if ((v10 & 1) == 0)
    {
      -[PKPaymentAuthorizationStateMachine didCancel](self, "didCancel");
      v4 = v11;
    }
  }

}

- (void)_performAuthorizationWithParam:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void (**v22)(void *, void *, _QWORD);
  id v23;
  void (**v24)(void);
  id v25;
  id v26;
  void (**v27)(void);
  void *v28;
  void *peerPaymentSession;
  void (**v30)(void *, void *, _QWORD);
  uint64_t v31;
  void (**v32)(void);
  uint64_t v33;
  uint64_t v34;
  _BOOL4 v35;
  _QWORD *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void (**v43)(void *, void *, _QWORD);
  void (**v44)(void);
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[5];
  id v54;
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  _QWORD v60[5];
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  PKPaymentAuthorizationStateMachine *v69;
  id v70;
  id v71;
  id v72[3];
  _QWORD aBlock[4];
  id v74;
  id v75;
  PKPaymentAuthorizationStateMachine *v76;
  id v77[3];
  id location[2];

  v4 = a3;
  objc_initWeak(location, self);
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "requestType");

  objc_msgSend(v4, "credential");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nonceData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "cryptogramType");
  objc_msgSend(v4, "networkMerchantIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke;
  aBlock[3] = &unk_1E2AC8148;
  objc_copyWeak(v77, location);
  v12 = v8;
  v74 = v12;
  v13 = v7;
  v77[1] = v9;
  v77[2] = v6;
  v75 = v13;
  v76 = self;
  v14 = _Block_copy(aBlock);
  v65[0] = v11;
  v65[1] = 3221225472;
  v65[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_276;
  v65[3] = &unk_1E2AC8170;
  v15 = v12;
  v66 = v15;
  v16 = v13;
  v67 = v16;
  v72[1] = v9;
  v42 = v10;
  v68 = v42;
  v69 = self;
  v17 = v4;
  v70 = v17;
  v18 = v14;
  v71 = v18;
  objc_copyWeak(v72, location);
  v72[2] = v6;
  v43 = (void (**)(void *, void *, _QWORD))_Block_copy(v65);
  v63[0] = v11;
  v63[1] = 3221225472;
  v63[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_285;
  v63[3] = &unk_1E2AC8198;
  objc_copyWeak(&v64, location);
  v19 = _Block_copy(v63);
  v60[0] = v11;
  v60[1] = 3221225472;
  v60[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3_288;
  v60[3] = &unk_1E2AC7820;
  v60[4] = self;
  objc_copyWeak(&v62, location);
  v20 = v16;
  v61 = v20;
  v44 = (void (**)(void))_Block_copy(v60);
  v56[0] = v11;
  v56[1] = 3221225472;
  v56[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_4_300;
  v56[3] = &unk_1E2AC8260;
  v56[4] = self;
  v21 = v20;
  v57 = v21;
  v39 = v19;
  v58 = v39;
  objc_copyWeak(&v59, location);
  v22 = (void (**)(void *, void *, _QWORD))_Block_copy(v56);
  v53[0] = v11;
  v53[1] = 3221225472;
  v53[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_304;
  v53[3] = &unk_1E2AC2E68;
  objc_copyWeak(&v55, location);
  v53[4] = self;
  v23 = v21;
  v54 = v23;
  v24 = (void (**)(void))_Block_copy(v53);
  v47[0] = v11;
  v47[1] = 3221225472;
  v47[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_308;
  v47[3] = &unk_1E2AC82D8;
  objc_copyWeak(&v52, location);
  v47[4] = self;
  v41 = v15;
  v48 = v41;
  v40 = v23;
  v49 = v40;
  v25 = v17;
  v50 = v25;
  v26 = v18;
  v51 = v26;
  v27 = (void (**)(void))_Block_copy(v47);
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "isPeerPaymentRequest"))
  {
    peerPaymentSession = self->_peerPaymentSession;
    v30 = v22;
    if (peerPaymentSession)
      goto LABEL_3;
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_313;
    v46[3] = &unk_1E2AC8300;
    v36 = v46;
    v46[4] = v22;
    v37 = +[PKPaymentSession startPeerPaymentSessionWithCompletion:](PKPaymentSession, "startPeerPaymentSessionWithCompletion:", v46);
LABEL_10:

    goto LABEL_11;
  }
  v31 = objc_msgSend(v28, "requestType");
  v32 = v24;
  if (v31 == 2
    || (v33 = objc_msgSend(v28, "requestType"), v32 = v24, v33 == 4)
    || (v34 = objc_msgSend(v28, "requestType"), v32 = v44, v34 == 5)
    || (v35 = -[PKPaymentAuthorizationStateMachine _shouldSignPurpleTrustData](self, "_shouldSignPurpleTrustData"),
        v32 = v27,
        v35))
  {
    v32[2]();
    goto LABEL_11;
  }
  peerPaymentSession = self->_inAppPaymentSession;
  v30 = v43;
  if (!peerPaymentSession)
  {
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3_315;
    v45[3] = &unk_1E2AC8328;
    v36 = v45;
    v45[4] = v43;
    v38 = +[PKPaymentSession startInAppSessionWithCompletion:](PKPaymentSession, "startInAppSessionWithCompletion:", v45);
    goto LABEL_10;
  }
LABEL_3:
  v30[2](v30, peerPaymentSession, 0);
LABEL_11:

  objc_destroyWeak(&v52);
  objc_destroyWeak(&v55);

  objc_destroyWeak(&v59);
  objc_destroyWeak(&v62);

  objc_destroyWeak(&v64);
  objc_destroyWeak(v72);

  objc_destroyWeak(v77);
  objc_destroyWeak(location);

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  __int128 v13;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2;
  block[3] = &unk_1E2AC8120;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v13 = *(_OWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;
  id v12[2];
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17[2];

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3;
      block[3] = &unk_1E2AC80F8;
      v4 = v17;
      objc_copyWeak(v17, v2);
      v14 = *(id *)(a1 + 32);
      v15 = *(id *)(a1 + 40);
      v5 = *(id *)(a1 + 48);
      v6 = *(void **)(a1 + 72);
      v16 = v5;
      v17[1] = v6;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v7 = v14;
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_4;
      v10[3] = &unk_1E2AC7F08;
      v4 = v12;
      objc_copyWeak(v12, v2);
      v12[1] = *(id *)(a1 + 80);
      v9 = *(int8x16_t *)(a1 + 48);
      v8 = (id)v9.i64[0];
      v11 = vextq_s8(v9, v9, 8uLL);
      dispatch_async(MEMORY[0x1E0C80D38], v10);
      v7 = (void *)v11.i64[1];
    }

    objc_destroyWeak(v4);
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  unint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "state");
    v4 = v3 > 0x10;
    v5 = 1 << v3;
    WeakRetained = v9;
    v6 = v5 & 0x1A000;
    if (v4 || v6 == 0)
    {
      +[PKPaymentAuthorizationRewrapStateParam paramWithWrappedPayment:nonce:credential:cryptogramType:](PKPaymentAuthorizationRewrapStateParam, "paramWithWrappedPayment:nonce:credential:cryptogramType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setState:param:", 11, v8);

      WeakRetained = v9;
    }
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  PKPayment *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint8_t v9[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56) == 1 && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "mode") == 1)
  {
    PKLogFacilityTypeGetObject(7uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Dual enrollment rewrap failed, performing regular buy", v9, 2u);
    }

    objc_msgSend(WeakRetained, "model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fallbackToBypassMode");

    v5 = objc_alloc_init(PKPayment);
    -[PKPayment setCredential:](v5, "setCredential:", *(_QWORD *)(a1 + 40));
    objc_msgSend(WeakRetained, "_enqueueDidAuthorizePaymentWithPayment:rewrapResponse:", v5, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2006, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (WeakRetained)
    {
      v7 = objc_msgSend(WeakRetained, "state");
      if (v7 > 0x10 || ((1 << v7) & 0x1A000) == 0)
      {
        +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_setState:param:", 14, v8);

      }
    }

  }
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_276(uint64_t a1, void *a2, int a3)
{
  id v5;
  PKInAppPaymentSessionAuthorizeParamaters *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20[2];
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[15];
  char v25;

  v5 = a2;
  if (v5)
  {
    v25 = 0;
    v6 = -[PKInAppPaymentSessionAuthorizeParamaters initWithNonce:authenticationCredential:networkMerchantIdentifier:cryptogramType:]([PKInAppPaymentSessionAuthorizeParamaters alloc], "initWithNonce:authenticationCredential:networkMerchantIdentifier:cryptogramType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88));
    -[PKInAppPaymentSessionAuthorizeParamaters setIsFeatureNotSupportedError:](v6, "setIsFeatureNotSupportedError:", &v25);
    objc_msgSend(*(id *)(a1 + 56), "_inAppSessionAuthorizationRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "authorizeWithRequest:authorizationParameters:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "evaluationResponse");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "kextBlacklistVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setKextBlacklistVersion:", v10);

    if (a3)
      objc_msgSend(v5, "invalidateSession");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 56), "itemForType:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v25
      && (objc_msgSend(v11, "pass"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "hasAssociatedPeerPaymentAccount"),
          v13,
          v14))
    {
      PKLogFacilityTypeGetObject(7uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "SE Error: Handling NFCD isFeatureNotSupported error. Re-registering for peer payment, then retrying quote authorization request again.", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 56), "peerPaymentService");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_278;
      v21[3] = &unk_1E2ABDF68;
      v23 = *(id *)(a1 + 72);
      v22 = v8;
      objc_msgSend(v16, "registerDeviceWithForceReregister:completion:", 1, v21);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }

  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_283;
    v18[3] = &unk_1E2AC7F08;
    objc_copyWeak(v20, (id *)(a1 + 80));
    v17 = *(_QWORD *)(a1 + 56);
    v20[1] = *(id *)(a1 + 96);
    v18[4] = v17;
    v19 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v18);

    objc_destroyWeak(v20);
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_278(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject(7uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Completed peer payment re-register with success: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_283(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  PKPayment *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint8_t v9[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56) == 1 && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "mode") == 1)
  {
    PKLogFacilityTypeGetObject(7uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Dual enrollment session not available, performing regular buy", v9, 2u);
    }

    objc_msgSend(WeakRetained, "model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fallbackToBypassMode");

    v5 = objc_alloc_init(PKPayment);
    -[PKPayment setCredential:](v5, "setCredential:", *(_QWORD *)(a1 + 40));
    objc_msgSend(WeakRetained, "_enqueueDidAuthorizePaymentWithPayment:rewrapResponse:", v5, 0);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2005, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained)
  {
    v7 = objc_msgSend(WeakRetained, "state");
    if (v7 > 0x10 || ((1 << v7) & 0x1A000) == 0)
    {
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_setState:param:", 14, v8);

    }
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_285(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_286;
  v5[3] = &unk_1E2ABE7B0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_286(uint64_t a1)
{
  id WeakRetained;
  unint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_13;
  v11 = WeakRetained;
  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2006, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "state");
    if (v9 > 0x10 || ((1 << v9) & 0x1A000) == 0)
    {
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_setState:param:", 14, v10);

    }
    goto LABEL_12;
  }
  v3 = objc_msgSend(WeakRetained, "state");
  v4 = v3 > 0x10;
  v5 = 1 << v3;
  WeakRetained = v11;
  v6 = v5 & 0x1A000;
  if (v4 || v6 == 0)
  {
    +[PKPaymentAuthorizationAuthorizedStateParam paramWithAuthorizedPeerPaymentQuote:](PKPaymentAuthorizationAuthorizedStateParam, "paramWithAuthorizedPeerPaymentQuote:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setState:param:", 12, v8);
LABEL_12:

    WeakRetained = v11;
  }
LABEL_13:

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3_288(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "paymentRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installmentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "feature");
  if (v4 == 2)
    v5 = 4;
  else
    v5 = 2 * (v4 == 1);

  +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_4_289;
  v7[3] = &unk_1E2AC8238;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v6, "defaultAccountForFeature:completion:", v5, v7);

  objc_destroyWeak(&v9);
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_4_289(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PKAccountWebServiceInstallmentAuthorizationRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PKAccountWebServiceInstallmentAuthorizationRequest *v19;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  PKAccountWebServiceInstallmentAuthorizationRequest *v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_alloc_init(PKAccountWebServiceInstallmentAuthorizationRequest);
    objc_msgSend(v5, "accountIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServiceInstallmentAuthorizationRequest setAccountIdentifier:](v7, "setAccountIdentifier:", v8);

    objc_msgSend(v5, "accountBaseURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServiceInstallmentAuthorizationRequest setBaseURL:](v7, "setBaseURL:", v9);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "installmentBindToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServiceInstallmentAuthorizationRequest setBindToken:](v7, "setBindToken:", v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "installmentAuthorizationAmount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServiceInstallmentAuthorizationRequest setAuthorizationAmount:](v7, "setAuthorizationAmount:", v11);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "installmentGroupIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServiceInstallmentAuthorizationRequest setInstallmentGroupIdentifier:](v7, "setInstallmentGroupIdentifier:", v12);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "shippingAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "shippingAddress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postalAddresses");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKAccountWebServiceInstallmentAuthorizationRequest setShippingAddress:](v7, "setShippingAddress:", v17);
    }
    v18 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_5;
    v23[3] = &unk_1E2AC8210;
    objc_copyWeak(&v28, (id *)(a1 + 48));
    v19 = v7;
    v24 = v19;
    v20 = *(id *)(a1 + 40);
    v21 = *(_QWORD *)(a1 + 32);
    v25 = v20;
    v26 = v21;
    v27 = v5;
    objc_msgSend(v18, "performInstallmentAuthorizationWithRequest:completion:", v19, v23);

    objc_destroyWeak(&v28);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2006, 0);
    v19 = (PKAccountWebServiceInstallmentAuthorizationRequest *)objc_claimAutoreleasedReturnValue();
    v22 = *(void **)(a1 + 32);
    +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_setState:param:", 14, v11);
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_6;
  v12[3] = &unk_1E2AC81E8;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  v13 = *(id *)(a1 + 32);
  v7 = v5;
  v14 = v7;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(void **)(a1 + 56);
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = +[PKPaymentSession startApplePayTrustSessionWithCompletion:](PKPaymentSession, "startApplePayTrustSessionWithCompletion:", v12);

  objc_destroyWeak(&v18);
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PKApplePayTrustSignatureRequest *v7;
  void *v8;
  PKApplePayTrustSignatureRequest *v9;
  void *v10;
  PKAccountWebServiceApplePayTrustRequest *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[4];
  id v19;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "referenceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manifestHashWithReferenceIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = [PKApplePayTrustSignatureRequest alloc];
    objc_msgSend(*(id *)(a1 + 40), "nonce");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKApplePayTrustSignatureRequest initWithKeyIdentifier:manifestHash:nonce:](v7, "initWithKeyIdentifier:manifestHash:nonce:", CFSTR("com.apple.wallet.applepaytrust"), v6, v8);

    objc_msgSend(v3, "signatureForRequest:withAuthorization:", v9, *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateSession");
    if (v10)
    {
      v11 = -[PKAccountWebServiceApplePayTrustRequest initWithApplePayTrustProtocol:]([PKAccountWebServiceApplePayTrustRequest alloc], "initWithApplePayTrustProtocol:", *(_QWORD *)(a1 + 32));
      -[PKAccountWebServiceApplePayTrustRequest setSignature:](v11, "setSignature:", v10);
      v12 = *(_QWORD *)(a1 + 64);
      v13 = *(void **)(*(_QWORD *)(a1 + 56) + 32);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_294;
      v16[3] = &unk_1E2AC81C0;
      objc_copyWeak(&v17, (id *)(a1 + 72));
      objc_msgSend(v13, "applePayTrustSignatureRequestWithRequest:account:completion:", v11, v12, v16);
      objc_destroyWeak(&v17);

    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3_297;
      v14[3] = &unk_1E2AC3648;
      objc_copyWeak(&v15, (id *)(a1 + 72));
      dispatch_async(MEMORY[0x1E0C80D38], v14);
      objc_destroyWeak(&v15);
    }

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_7;
    block[3] = &unk_1E2AC3648;
    objc_copyWeak(&v19, (id *)(a1 + 72));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v19);
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  unint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_msgSend(WeakRetained, "state");
    if (v3 > 0x10 || ((1 << v3) & 0x1A000) == 0)
    {
      PKLogFacilityTypeGetObject(7uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v8 = 136315138;
        v9 = "-[PKPaymentAuthorizationStateMachine _performAuthorizationWithParam:]_block_invoke_7";
        _os_log_error_impl(&dword_18FC92000, v5, OS_LOG_TYPE_ERROR, "Failed to get Apple Pay Trust session for method: %s", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2006, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_setState:param:", 14, v7);

    }
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_294(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(a2, "authorizationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_295;
  v5[3] = &unk_1E2ABE7B0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_295(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      +[PKPaymentAuthorizationAuthorizedStateParam paramWithInstallmentAuthorizationToken:](PKPaymentAuthorizationAuthorizedStateParam, "paramWithInstallmentAuthorizationToken:");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_setState:param:", 12, v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2006, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_setState:param:", 14, v4);

    }
    WeakRetained = v5;
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3_297(uint64_t a1)
{
  id WeakRetained;
  unint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v2 = objc_msgSend(WeakRetained, "state");
    v3 = v2 > 0x10;
    v4 = 1 << v2;
    WeakRetained = v9;
    v5 = v4 & 0x1A000;
    if (v3 || v5 == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2006, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setState:param:", 14, v8);

      WeakRetained = v9;
    }
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_4_300(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[15];
  char v18;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "itemForType:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paymentApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "peerPaymentQuote");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "authorizePeerPaymentQuote:forPaymentApplication:withAuthenticationCredential:shouldReregister:", v8, v7, *(_QWORD *)(a1 + 40), &v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
      objc_msgSend(v5, "invalidateSession");
    if (v18)
    {
      PKLogFacilityTypeGetObject(7uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "SE Error: Handling NFCD shouldReregister error. Re-registering for peer payment, then retrying quote authorization request again.", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "peerPaymentService");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_301;
      v14[3] = &unk_1E2ABDF68;
      v16 = *(id *)(a1 + 48);
      v15 = v9;
      objc_msgSend(v11, "registerDeviceWithForceReregister:completion:", 1, v14);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_302;
    block[3] = &unk_1E2AC3648;
    objc_copyWeak(&v13, (id *)(a1 + 56));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v13);
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_301(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject(7uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Completed peer payment re-register with success: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_302(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  unint64_t v4;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2005, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "state");
    if (v4 > 0x10 || ((1 << v4) & 0x1A000) == 0)
    {
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_setState:param:", 14, v6);

    }
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_304(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3_305;
  v4[3] = &unk_1E2AC8288;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v2 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v3 = +[PKPaymentSession startApplePayTrustSessionWithCompletion:](PKPaymentSession, "startApplePayTrustSessionWithCompletion:", v4);

  objc_destroyWeak(&v6);
}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3_305(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "paymentRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applePayTrustSignatureRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "signatureForRequest:withAuthorization:", v5, *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateSession");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_307;
    v8[3] = &unk_1E2ABE7B0;
    objc_copyWeak(&v10, (id *)(a1 + 48));
    v9 = v6;
    v7 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

    objc_destroyWeak(&v10);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_4_306;
    block[3] = &unk_1E2ABE7B0;
    objc_copyWeak(&v13, (id *)(a1 + 48));
    v12 = 0;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v13);
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_4_306(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  unint64_t v4;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "state");
    if (v4 > 0x10 || ((1 << v4) & 0x1A000) == 0)
    {
      PKLogFacilityTypeGetObject(7uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8 = 136315138;
        v9 = "-[PKPaymentAuthorizationStateMachine _performAuthorizationWithParam:]_block_invoke_4";
        _os_log_error_impl(&dword_18FC92000, v6, OS_LOG_TYPE_ERROR, "Failed to get Apple Pay Trust session for method: %s", (uint8_t *)&v8, 0xCu);
      }

      +[PKPaymentAuthorizationAuthorizedStateParam paramWithApplePayTrustSignature:](PKPaymentAuthorizationAuthorizedStateParam, "paramWithApplePayTrustSignature:", *(_QWORD *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_setState:param:", 12, v7);

    }
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_307(uint64_t a1)
{
  id WeakRetained;
  unint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "state");
    v4 = v3 > 0x10;
    v5 = 1 << v3;
    WeakRetained = v10;
    v6 = v5 & 0x1A000;
    if (v4 || v6 == 0)
    {
      if (*(_QWORD *)(a1 + 32))
      {
        +[PKPaymentAuthorizationAuthorizedStateParam paramWithApplePayTrustSignature:](PKPaymentAuthorizationAuthorizedStateParam, "paramWithApplePayTrustSignature:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_setState:param:", 12, v8);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2006, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_setState:param:", 14, v9);

      }
      WeakRetained = v10;
    }
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_308(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 9;
  WeakRetained = objc_loadWeakRetained(a1 + 9);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "_paymentRequestPurpleTrustData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_309;
      v12[3] = &unk_1E2AC82B0;
      objc_copyWeak(&v19, v2);
      v13 = v4;
      v14 = a1[5];
      v5 = a1[6];
      v6 = a1[4];
      v15 = v5;
      v16 = v6;
      v17 = a1[7];
      v18 = a1[8];
      v7 = +[PKPaymentSession startApplePayTrustSessionWithCompletion:](PKPaymentSession, "startApplePayTrustSessionWithCompletion:", v12);

      objc_destroyWeak(&v19);
    }
    else
    {
      PKLogFacilityTypeGetObject(7uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[PKPaymentAuthorizationStateMachine _performAuthorizationWithParam:]_block_invoke_2";
        _os_log_error_impl(&dword_18FC92000, v8, OS_LOG_TYPE_ERROR, "Failed to get Apple Pay purple trust data for method: %s", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2006, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = a1[4];
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setState:param:", 14, v11);

    }
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_309(uint64_t a1, void *a2)
{
  id v3;
  PKApplePayTrustSignatureRequest *v4;
  void *v5;
  PKWrappedPayment *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  if (v3)
  {
    v4 = -[PKApplePayTrustSignatureRequest initWithKeyIdentifier:manifestHash:nonce:]([PKApplePayTrustSignatureRequest alloc], "initWithKeyIdentifier:manifestHash:nonce:", CFSTR("com.apple.wallet.applepaytrust"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "signatureForRequest:withAuthorization:", v4, *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateSession");
    if (v5)
    {
      v6 = objc_alloc_init(PKWrappedPayment);
      objc_msgSend(v5, "signatureData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKWrappedPayment setTransactionData:](v6, "setTransactionData:", v7);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 56), "paymentRequest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "countryCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKWrappedPayment setMerchantCountryCode:](v6, "setMerchantCountryCode:", v9);

      objc_msgSend(*(id *)(a1 + 64), "evaluationResponse");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "kextBlacklistVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKWrappedPayment setKextBlacklistVersion:](v6, "setKextBlacklistVersion:", v11);

      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_311;
      v12[3] = &unk_1E2AC3648;
      objc_copyWeak(&v13, (id *)(a1 + 80));
      dispatch_async(MEMORY[0x1E0C80D38], v12);
      objc_destroyWeak(&v13);
    }

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_310;
    block[3] = &unk_1E2AC3648;
    objc_copyWeak(&v15, (id *)(a1 + 80));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v15);
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_310(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  unint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_msgSend(WeakRetained, "state");
    if (v3 > 0x10 || ((1 << v3) & 0x1A000) == 0)
    {
      PKLogFacilityTypeGetObject(7uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v8 = 136315138;
        v9 = "-[PKPaymentAuthorizationStateMachine _performAuthorizationWithParam:]_block_invoke_2";
        _os_log_error_impl(&dword_18FC92000, v5, OS_LOG_TYPE_ERROR, "Failed to get Apple Pay Trust session for method: %s", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2006, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_setState:param:", 14, v7);

    }
  }

}

void __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_311(uint64_t a1)
{
  id WeakRetained;
  unint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v2 = objc_msgSend(WeakRetained, "state");
    v3 = v2 > 0x10;
    v4 = 1 << v2;
    WeakRetained = v9;
    v5 = v4 & 0x1A000;
    if (v3 || v5 == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2006, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentAuthorizationErrorStateParam paramWithError:](PKPaymentAuthorizationErrorStateParam, "paramWithError:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setState:param:", 14, v8);

      WeakRetained = v9;
    }
  }

}

uint64_t __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_2_313(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__PKPaymentAuthorizationStateMachine__performAuthorizationWithParam___block_invoke_3_315(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_shouldSignPurpleTrustData
{
  void *v2;
  BOOL v3;

  -[PKPaymentAuthorizationStateMachine _paymentRequestPurpleTrustData](self, "_paymentRequestPurpleTrustData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_paymentRequestPurpleTrustData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel selectedFinancingOption](self->_model, "selectedFinancingOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && -[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") == 1)
  {
    -[PKPayLaterFinancingController selectedFundingSource](self->_financingController, "selectedFundingSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "type") != 2)
    {
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(v5, "accountPaymentFundingSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      PKLogFacilityTypeGetObject(7uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18FC92000, v8, OS_LOG_TYPE_ERROR, "Error there is no bank identifier for the bank payment source", buf, 2u);
      }

      goto LABEL_18;
    }
  }
  else
  {
    if (!objc_msgSend(v3, "isPayLaterPaymentRequest"))
    {
LABEL_19:
      v7 = 0;
      v11 = 0;
      goto LABEL_20;
    }
    -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bankAccountInformation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      PKLogFacilityTypeGetObject(7uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18FC92000, v16, OS_LOG_TYPE_ERROR, "Error there is no bank identifier for the bank payment source", buf, 2u);
      }

      goto LABEL_18;
    }
    v7 = (void *)v10;

  }
  v22 = CFSTR("bankIdentifier");
  v23[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_20:
    v15 = 0;
    goto LABEL_21;
  }
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v11, 0, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;
  v14 = v13;
  if (!v12 || v13)
  {
    PKLogFacilityTypeGetObject(7uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_error_impl(&dword_18FC92000, v18, OS_LOG_TYPE_ERROR, "Error forming JSON for purple trust data %@", buf, 0xCu);
    }

    v15 = 0;
  }
  else
  {
    v15 = v12;
  }

LABEL_21:
  return v15;
}

- (id)_inAppSessionAuthorizationRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  PKInAppPaymentSessionAuthorizationRequest *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;

  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel itemForType:](self->_model, "itemForType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "currencyCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_transactionAmount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "merchantCapabilities");
  objc_msgSend(v3, "supportedNetworks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel selectedFinancingOption](self->_model, "selectedFinancingOption");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && -[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") == 1)
  {
    -[PKPayLaterFinancingController selectedFundingSource](self->_financingController, "selectedFundingSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "type");
    if (v13 == 2)
    {
      v14 = 0;
    }
    else
    {
      if (v13 != 1)
      {
LABEL_8:
        objc_msgSend(v11, "authAmount");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "currency");
        v24 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "authAmount");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "amount");
        v17 = objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v11, "merchantCapabilities");
        objc_msgSend(v11, "supportedRepaymentNetworks");
        v18 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v18;
        v8 = (void *)v17;
        v6 = (void *)v24;
        goto LABEL_9;
      }
      objc_msgSend(v12, "paymentApplication");
      v14 = objc_claimAutoreleasedReturnValue();
    }

    v5 = (void *)v14;
    goto LABEL_8;
  }
LABEL_9:
  v19 = objc_alloc_init(PKInAppPaymentSessionAuthorizationRequest);
  -[PKInAppPaymentSessionAuthorizationRequest setPaymentApplication:](v19, "setPaymentApplication:", v5);
  -[PKInAppPaymentSessionAuthorizationRequest setCurrencyCode:](v19, "setCurrencyCode:", v6);
  -[PKInAppPaymentSessionAuthorizationRequest setCountryCode:](v19, "setCountryCode:", v7);
  -[PKInAppPaymentSessionAuthorizationRequest setTransactionAmount:](v19, "setTransactionAmount:", v8);
  -[PKInAppPaymentSessionAuthorizationRequest setMerchantCapabilities:](v19, "setMerchantCapabilities:", v9);
  -[PKInAppPaymentSessionAuthorizationRequest setSupportedNetworks:](v19, "setSupportedNetworks:", v10);
  objc_msgSend(v3, "merchantIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInAppPaymentSessionAuthorizationRequest setMerchantIdentifier:](v19, "setMerchantIdentifier:", v20);

  objc_msgSend(v3, "applicationData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInAppPaymentSessionAuthorizationRequest setApplicationData:](v19, "setApplicationData:", v21);

  objc_msgSend(v3, "merchantSession");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInAppPaymentSessionAuthorizationRequest setMerchantSession:](v19, "setMerchantSession:", v22);

  return v19;
}

- (void)_applyShippingInformationToPayment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PKContact *v40;
  void *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "requestType") != 10)
  {
    objc_msgSend(v5, "requiredShippingContactFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      objc_msgSend(v5, "requiredShippingContactFields");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", CFSTR("email"));

      if (v9)
      {
        -[PKPaymentAuthorizationDataModel shippingEmail](self->_model, "shippingEmail");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "emailAddresses");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x1E0C97338];
        objc_msgSend(v12, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "labeledValueWithLabel:value:", CFSTR("Shipping"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = 0;
      }
      objc_msgSend(v5, "requiredShippingContactFields");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsObject:", CFSTR("phone"));

      if (v18)
      {
        -[PKPaymentAuthorizationDataModel shippingPhone](self->_model, "shippingPhone");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "phoneNumbers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (void *)MEMORY[0x1E0C97338];
        objc_msgSend(v21, "value");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "labeledValueWithLabel:value:", CFSTR("Shipping"), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v25 = 0;
      }
      v26 = objc_msgSend(v5, "isShippingEditable");
      objc_msgSend(v5, "requiredShippingContactFields");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "containsObject:", CFSTR("post"));

      objc_msgSend(v5, "requiredShippingContactFields");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "containsObject:", CFSTR("name"));

      v31 = v28 & v26;
      if (v28)
      {
        -[PKPaymentAuthorizationDataModel shippingAddress](self->_model, "shippingAddress");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentAuthorizationDataModel shippingAddress](self->_model, "shippingAddress");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = 0;
        v33 = 0;
      }
      if (((v30 ^ 1 | v31) & 1) == 0)
      {
        -[PKPaymentAuthorizationDataModel shippingName](self->_model, "shippingName");
        v34 = objc_claimAutoreleasedReturnValue();

        v33 = (void *)v34;
      }
      v35 = (void *)MEMORY[0x1E0C97200];
      objc_msgSend(v33, "nameComponents");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "postalAddresses");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "pkContactWithNameComponents:postalAddresses:emailAddresses:phoneNumbers:", v36, v37, v16, v25);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "sanitizedContact");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = -[PKContact initWithCNContact:]([PKContact alloc], "initWithCNContact:", v39);
      objc_msgSend(v4, "setShippingContact:", v40);

    }
  }

}

- (void)_applyShippingMethodToPayment:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PKPaymentAuthorizationDataModel shippingMethod](self->_model, "shippingMethod");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKPaymentAuthorizationDataModel shippingMethod](self->_model, "shippingMethod");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShippingMethod:", v5);

  }
}

- (void)_applyBillingInformationToPayment:(id)a3
{
  PKPaymentAuthorizationDataModel *model;
  id v5;
  void *v6;
  id v7;

  model = self->_model;
  v5 = a3;
  -[PKPaymentAuthorizationDataModel paymentRequest](model, "paymentRequest");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine _billingInformationFromPaymentRequest:](self, "_billingInformationFromPaymentRequest:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBillingContact:", v6);

}

- (void)_applyBillingInformationToAuthorizedQuote:(id)a3
{
  PKPaymentAuthorizationDataModel *model;
  id v5;
  void *v6;
  id v7;

  model = self->_model;
  v5 = a3;
  -[PKPaymentAuthorizationDataModel paymentRequest](model, "paymentRequest");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationStateMachine _billingInformationFromPaymentRequest:](self, "_billingInformationFromPaymentRequest:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContact:", v6);

}

- (id)_billingInformationFromPaymentRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  PKContact *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_msgSend(v4, "requiredBillingContactFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (objc_msgSend(v4, "requestType") == 10)
  {
    objc_msgSend(v4, "requiredShippingContactFields");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") | v6;

    if (!v8)
    {
LABEL_3:
      v9 = 0;
      goto LABEL_21;
    }
  }
  else if (!v6)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "requiredBillingContactFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", CFSTR("post"));

  if (v11)
  {
    -[PKPaymentAuthorizationDataModel billingAddress](self->_model, "billingAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if (objc_msgSend(v4, "requestType") == 10)
  {
    objc_msgSend(v12, "nameComponents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      -[PKPaymentAuthorizationDataModel shippingName](self->_model, "shippingName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "nameComponents");
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "requiredShippingContactFields");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "containsObject:", CFSTR("email"));

    if (v22)
    {
      -[PKPaymentAuthorizationDataModel shippingEmail](self->_model, "shippingEmail");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "emailAddresses");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v4, "requiredShippingContactFields");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "containsObject:", CFSTR("phone"));

    if (v25)
    {
      -[PKPaymentAuthorizationDataModel shippingPhone](self->_model, "shippingPhone");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "phoneNumbers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }
    v27 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v12, "postalAddresses");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "pkContactWithNameComponents:postalAddresses:emailAddresses:phoneNumbers:", v15, v28, v17, v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sanitizedContact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v12, "nameComponents");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postalAddresses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pkContactWithNameComponents:postalAddresses:emailAddresses:phoneNumbers:", v15, v17, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sanitizedContact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v9 = -[PKContact initWithCNContact:]([PKContact alloc], "initWithCNContact:", v19);
LABEL_21:

  return v9;
}

- (id)_transactionWithPaymentToken:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PKMerchant *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;

  v4 = a3;
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "APIType");
  v7 = v6;
  v8 = v6 - 1;
  if ((unint64_t)(v6 - 1) >= 2)
    v9 = 2;
  else
    v9 = 3;
  if (!v6)
  {
    objc_msgSend(v5, "merchantSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v9 = 3;
  }
  +[PKPaymentTransaction paymentTransactionWithSource:](PKPaymentTransaction, "paymentTransactionWithSource:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOriginatedByDevice:", 1);
  objc_msgSend(v4, "transactionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPaymentHash:", v12);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTransactionDate:", v13);

  objc_msgSend(v11, "setTechnologyType:", 2);
  -[PKPaymentAuthorizationDataModel transactionAmount](self->_model, "transactionAmount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAmount:", v14);

  -[PKPaymentAuthorizationDataModel currencyCode](self->_model, "currencyCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCurrencyCode:", v15);

  objc_msgSend(v11, "addUpdateReasons:", 2);
  if (-[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode") == 2)
  {
    -[PKPaymentAuthorizationDataModel selectedPaymentOffer](self->_model, "selectedPaymentOffer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIsIssuerInstallmentTransaction:", objc_msgSend(v16, "type") == 1);

  }
  else
  {
    objc_msgSend(v11, "setIsIssuerInstallmentTransaction:", 0);
  }
  -[PKPaymentAuthorizationDataModel paymentApplication](self->_model, "paymentApplication");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dpanIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDPANIdentifier:", v18);

  objc_msgSend(v11, "setPaymentNetworkIdentifier:", objc_msgSend(v17, "paymentNetworkIdentifier"));
  v19 = objc_alloc_init(PKMerchant);
  -[PKPaymentAuthorizationDataModel merchantName](self->_model, "merchantName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchant setName:](v19, "setName:", v20);

  if (v8 >= 2)
  {
    if (!v7)
    {
      v27 = -[PKPaymentAuthorizationStateMachine _adamIdentifier](self, "_adamIdentifier");
      if (v27)
        -[PKMerchant setAdamIdentifier:](v19, "setAdamIdentifier:", v27);
    }
  }
  else
  {
    objc_msgSend(v5, "merchantSession");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "merchantIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMerchant setWebMerchantIdentifier:](v19, "setWebMerchantIdentifier:", v22);

    objc_msgSend(v21, "displayName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMerchant setWebMerchantName:](v19, "setWebMerchantName:", v23);

    v24 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v21, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "URLWithString:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMerchant setOriginURL:](v19, "setOriginURL:", v26);

  }
  objc_msgSend(v11, "setMerchant:", v19);

  return v11;
}

- (unint64_t)_adamIdentifier
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "APIType"))
  {
    -[PKPaymentAuthorizationDataModel hostApplicationIdentifier](self->_model, "hostApplicationIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject rangeOfString:](v5, "rangeOfString:", CFSTR("."));
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      PKLogFacilityTypeGetObject(7uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v5;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "No bundle ID in app identifier %@", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      -[NSObject substringFromIndex:](v5, "substringFromIndex:", v6 + v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v8, 1, 0);
      objc_msgSend(v9, "iTunesMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v10, "storeItemIdentifier");

      if (v4)
      {

LABEL_12:
        goto LABEL_13;
      }
      PKLogFacilityTypeGetObject(7uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v8;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "No item ID for %@", (uint8_t *)&v13, 0xCu);
      }

    }
    v4 = 0;
    goto LABEL_12;
  }
  v4 = 0;
LABEL_13:

  return v4;
}

- (id)_transactionWithPurchase:(id)a3 paymentHash:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKMerchant *v10;
  void *v11;

  v5 = a4;
  +[PKPaymentTransaction paymentTransactionWithSource:](PKPaymentTransaction, "paymentTransactionWithSource:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOriginatedByDevice:", 1);
  objc_msgSend(v6, "setPaymentHash:", v5);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTransactionDate:", v7);

  objc_msgSend(v6, "setTechnologyType:", 2);
  -[PKPaymentAuthorizationDataModel transactionAmount](self->_model, "transactionAmount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAmount:", v8);

  -[PKPaymentAuthorizationDataModel currencyCode](self->_model, "currencyCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrencyCode:", v9);

  objc_msgSend(v6, "addUpdateReasons:", 2);
  v10 = objc_alloc_init(PKMerchant);
  -[PKPaymentAuthorizationDataModel merchantName](self->_model, "merchantName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchant setName:](v10, "setName:", v11);

  objc_msgSend(v6, "setMerchant:", v10);
  return v6;
}

- (void)_promptTapToRadar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKTapToRadarRequest *v9;

  if (os_variant_has_internal_ui() && self->_paymentService && self->_failureStatusCount == 2)
  {
    v9 = objc_alloc_init(PKTapToRadarRequest);
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[PKPaymentAuthorizationDataModel merchantName](self->_model, "merchantName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Apple Pay failed in %@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTapToRadarRequest setReason:](v9, "setReason:", v5);

    v6 = (void *)MEMORY[0x1E0CB3940];
    -[PKPaymentAuthorizationDataModel merchantName](self->_model, "merchantName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Apple Pay failure detected in %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTapToRadarRequest setAlertHeader:](v9, "setAlertHeader:", v8);

    -[PKTapToRadarRequest setAlertMessage:](v9, "setAlertMessage:", CFSTR("Help improve Apple Pay by reporting this problem."));
    -[PKPaymentService displayTapToRadarAlertForRequest:completion:](self->_paymentService, "displayTapToRadarAlertForRequest:completion:", v9, 0);

  }
}

- (void)_reportToAutoBugCapture:(id)a3
{
  PKAutoBugCaptureReporter *v4;
  id v5;

  v5 = a3;
  if (os_variant_has_internal_ui() && self->_failureStatusCount == 1)
  {
    v4 = objc_alloc_init(PKAutoBugCaptureReporter);
    -[PKAutoBugCaptureReporter reportIssueWithDomain:type:subtype:subtypeContext:payload:](v4, "reportIssueWithDomain:type:subtype:subtypeContext:payload:", CFSTR("Wallet"), CFSTR("PKPaymentAuthorization"), CFSTR("StatusFailure"), v5, 0);

  }
}

- (void)_simulatePayment
{
  void *v3;
  void *v4;
  void *v5;
  uint32_t v6;
  dispatch_time_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  -[PKPaymentAuthorizationDataModel paymentApplication](self->_model, "paymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKPaymentNetworkNameForPaymentCredentialType(objc_msgSend(v3, "paymentNetworkIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKPaymentToken simulatedTokenForNetwork:](PKPaymentToken, "simulatedTokenForNetwork:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = arc4random_uniform(0xAu);
  v7 = dispatch_time(0, (uint64_t)((1.0 / (double)(v6 + 1) + 1.0) * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PKPaymentAuthorizationStateMachine__simulatePayment__block_invoke;
  block[3] = &unk_1E2ABE7B0;
  objc_copyWeak(&v11, &location);
  v10 = v5;
  v8 = v5;
  dispatch_after(v7, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __54__PKPaymentAuthorizationStateMachine__simulatePayment__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[PKPaymentAuthorizationAuthorizedStateParam paramWithPaymentToken:rewrapResponse:](PKPaymentAuthorizationAuthorizedStateParam, "paramWithPaymentToken:rewrapResponse:", *(_QWORD *)(a1 + 32), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_setState:param:", 12, v2);

}

- (id)_relevantAnalyticsSubject
{
  _BOOL4 v2;
  __CFString **v3;

  v2 = -[PKPaymentAuthorizationStateMachine _reportPayLaterAnalytics](self, "_reportPayLaterAnalytics");
  v3 = PKAnalyticsSubjectInApp;
  if (v2)
    v3 = PKAnalyticsSubjectPayLaterEngagement;
  return *v3;
}

- (BOOL)_reportPayLaterAnalytics
{
  int64_t v3;
  void *v4;
  char v5;

  v3 = -[PKPaymentAuthorizationDataModel fundingMode](self->_model, "fundingMode");
  if (v3 != 1)
  {
    -[PKPaymentAuthorizationDataModel paymentRequest](self->_model, "paymentRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPayLaterPaymentRequest");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)_additionalRelevantAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!-[PKPaymentAuthorizationStateMachine _reportPayLaterAnalytics](self, "_reportPayLaterAnalytics"))
    return 0;
  v7 = CFSTR("productType");
  -[PKPaymentAuthorizationDataModel selectedFinancingOption](self->_model, "selectedFinancingOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKPayLaterAccountProductTypeToString(objc_msgSend(v3, "productType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_reportAnalyticsTransactionAuthorizationWithAdditionalDictionary:(id)a3 eventType:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v8, "addObject:", CFSTR("inApp"));
  if (-[PKPaymentAuthorizationStateMachine _reportPayLaterAnalytics](self, "_reportPayLaterAnalytics"))
    objc_msgSend(v8, "addObject:", CFSTR("fpsEngagement"));
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "addEntriesFromDictionary:", v6);
  -[PKPaymentAuthorizationStateMachine _additionalRelevantAnalyticsDictionary](self, "_additionalRelevantAnalyticsDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v10);

  objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("eventType"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), v9, (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)_trackCouponCodeOutcomeWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  __CFString **v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString **v12;
  const __CFString **v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    -[PKPaymentAuthorizationDataModel couponCode](self->_model, "couponCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      v24 = CFSTR("eventType");
      v25[0] = CFSTR("couponCodeValid");
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = (const __CFString **)v25;
      v13 = &v24;
    }
    else
    {
      v22 = CFSTR("eventType");
      v23 = CFSTR("couponCodeCannotBeApplied");
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = &v23;
      v13 = &v22;
    }
    objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("inApp"), v15);
    goto LABEL_13;
  }
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PKPaymentErrorDomain"));

  if (v7)
  {
    if (objc_msgSend(v5, "code") == 5)
    {
      v8 = PKAnalyticsReportEventTypeCouponCodeOutcomeExpired;
    }
    else
    {
      if (objc_msgSend(v5, "code") != 4)
        goto LABEL_14;
      v8 = PKAnalyticsReportEventTypeCouponCodeOutcomeInvalid;
    }
    v14 = *v8;
    if (v14)
    {
      v15 = v14;
      objc_msgSend(v5, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "PKStringForKey:", *MEMORY[0x1E0CB2D50]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v21[0] = v15;
      v20[0] = CFSTR("eventType");
      v20[1] = CFSTR("couponCodeErrorMerchantProvided");
      PKAnalyticsReportSwitchToggleResultValue(objc_msgSend(v17, "length") != 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("inApp"), v19);

LABEL_13:
    }
  }
LABEL_14:

}

- (PKPaymentService)paymentService
{
  return self->_paymentService;
}

- (PKPaymentWebService)paymentWebService
{
  return self->_paymentWebService;
}

- (PKAccountService)accountService
{
  return self->_accountService;
}

- (PKPeerPaymentService)peerPaymentService
{
  return self->_peerPaymentService;
}

- (PKPaymentAuthorizationDataModel)model
{
  return self->_model;
}

- (PKAggregateDictionaryProtocol)aggregateDictionary
{
  return self->_aggregateDictionary;
}

- (void)setAggregateDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateDictionary, a3);
}

- (PKInAppPaymentSession)inAppPaymentSession
{
  return self->_inAppPaymentSession;
}

- (void)setInAppPaymentSession:(id)a3
{
  objc_storeStrong((id *)&self->_inAppPaymentSession, a3);
}

- (PKPeerPaymentSession)peerPaymentSession
{
  return self->_peerPaymentSession;
}

- (void)setPeerPaymentSession:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentSession, a3);
}

- (PKContinuityPaymentService)continuityPaymentService
{
  return self->_continuityPaymentService;
}

- (void)setContinuityPaymentService:(id)a3
{
  objc_storeStrong((id *)&self->_continuityPaymentService, a3);
}

- (double)updatePaymentDeviceTimeout
{
  return self->_updatePaymentDeviceTimeout;
}

- (PKPaymentAuthorizationStateMachineDelegate)delegate
{
  return (PKPaymentAuthorizationStateMachineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (int64_t)cancelReason
{
  return self->_cancelReason;
}

- (BOOL)showingExternalPasswordEntry
{
  return self->_showingExternalPasswordEntry;
}

- (void)setShowingExternalPasswordEntry:(BOOL)a3
{
  self->_showingExternalPasswordEntry = a3;
}

- (PKContinuityPaymentCoordinator)continuityPaymentCoordinator
{
  return self->_continuityPaymentCoordinator;
}

- (void)setContinuityPaymentCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_continuityPaymentCoordinator, a3);
}

- (PKPayLaterFinancingController)financingController
{
  return self->_financingController;
}

- (void)setFinancingController:(id)a3
{
  objc_storeStrong((id *)&self->_financingController, a3);
}

- (NSMutableArray)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (unint64_t)hostApplicationState
{
  return self->_hostApplicationState;
}

- (void)setHostApplicationState:(unint64_t)a3
{
  self->_hostApplicationState = a3;
}

- (BOOL)hasReceivedRemoteDeviceUpdate
{
  return self->_hasReceivedRemoteDeviceUpdate;
}

- (void)setHasReceivedRemoteDeviceUpdate:(BOOL)a3
{
  self->_hasReceivedRemoteDeviceUpdate = a3;
}

- (BOOL)awaitingClientCallbackReply
{
  return self->_awaitingClientCallbackReply;
}

- (void)setAwaitingClientCallbackReply:(BOOL)a3
{
  self->_awaitingClientCallbackReply = a3;
}

- (OS_dispatch_source)clientCallbackTimer
{
  return self->_clientCallbackTimer;
}

- (void)setClientCallbackTimer:(id)a3
{
  objc_storeStrong((id *)&self->_clientCallbackTimer, a3);
}

- (PKPaymentAuthorizationClientCallbackStateParam)mostRecentClientCallback
{
  return self->_mostRecentClientCallback;
}

- (void)setMostRecentClientCallback:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentClientCallback, a3);
}

- (BOOL)awaitingWebServiceResponse
{
  return self->_awaitingWebServiceResponse;
}

- (void)setAwaitingWebServiceResponse:(BOOL)a3
{
  self->_awaitingWebServiceResponse = a3;
}

- (NSString)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (void)setInstanceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_instanceIdentifier, a3);
}

- (unint64_t)prepareTransactionDetailsCounter
{
  return self->_prepareTransactionDetailsCounter;
}

- (void)setPrepareTransactionDetailsCounter:(unint64_t)a3
{
  self->_prepareTransactionDetailsCounter = a3;
}

- (BOOL)detectedBluetoothOn
{
  return self->_detectedBluetoothOn;
}

- (void)setDetectedBluetoothOn:(BOOL)a3
{
  self->_detectedBluetoothOn = a3;
}

- (OS_dispatch_group)delayAuthorizedStateGroup
{
  return self->_delayAuthorizedStateGroup;
}

- (void)setDelayAuthorizedStateGroup:(id)a3
{
  objc_storeStrong((id *)&self->_delayAuthorizedStateGroup, a3);
}

- (NSArray)remoteDevicesToUpdate
{
  return self->_remoteDevicesToUpdate;
}

- (void)setRemoteDevicesToUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevicesToUpdate, a3);
}

- (PKSecureElement)secureElement
{
  return self->_secureElement;
}

- (void)setSecureElement:(id)a3
{
  objc_storeStrong((id *)&self->_secureElement, a3);
}

- (PKODITransactionAssessment)odiTransactionAssessment
{
  return self->_odiTransactionAssessment;
}

- (void)setOdiTransactionAssessment:(id)a3
{
  objc_storeStrong((id *)&self->_odiTransactionAssessment, a3);
}

- (PKODIServiceProviderAssessment)odiServiceProviderAssessment
{
  return self->_odiServiceProviderAssessment;
}

- (void)setOdiServiceProviderAssessment:(id)a3
{
  objc_storeStrong((id *)&self->_odiServiceProviderAssessment, a3);
}

- (BOOL)odiAssessmentInFlight
{
  return self->_odiAssessmentInFlight;
}

- (void)setOdiAssessmentInFlight:(BOOL)a3
{
  self->_odiAssessmentInFlight = a3;
}

- (PKAccountEnhancedMerchantsFetcher)enhancedMerchantsFetcher
{
  return self->_enhancedMerchantsFetcher;
}

- (void)setEnhancedMerchantsFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_enhancedMerchantsFetcher, a3);
}

- (NSUUID)enhancedMerchantsFetcherUpdateToken
{
  return self->_enhancedMerchantsFetcherUpdateToken;
}

- (void)setEnhancedMerchantsFetcherUpdateToken:(id)a3
{
  objc_storeStrong((id *)&self->_enhancedMerchantsFetcherUpdateToken, a3);
}

- (PKAccount)appleCardAccount
{
  return self->_appleCardAccount;
}

- (void)setAppleCardAccount:(id)a3
{
  objc_storeStrong((id *)&self->_appleCardAccount, a3);
}

- (unint64_t)failureStatusCount
{
  return self->_failureStatusCount;
}

- (void)setFailureStatusCount:(unint64_t)a3
{
  self->_failureStatusCount = a3;
}

- (void)setPaymentSheetExperiment:(id)a3
{
  objc_storeStrong((id *)&self->_paymentSheetExperiment, a3);
}

- (PKPaymentOffersController)paymentOffersController
{
  return self->_paymentOffersController;
}

- (void)setPaymentOffersController:(id)a3
{
  objc_storeStrong((id *)&self->_paymentOffersController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentOffersController, 0);
  objc_storeStrong((id *)&self->_paymentSheetExperiment, 0);
  objc_storeStrong((id *)&self->_appleCardAccount, 0);
  objc_storeStrong((id *)&self->_enhancedMerchantsFetcherUpdateToken, 0);
  objc_storeStrong((id *)&self->_enhancedMerchantsFetcher, 0);
  objc_storeStrong((id *)&self->_odiServiceProviderAssessment, 0);
  objc_storeStrong((id *)&self->_odiTransactionAssessment, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_remoteDevicesToUpdate, 0);
  objc_storeStrong((id *)&self->_delayAuthorizedStateGroup, 0);
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
  objc_storeStrong((id *)&self->_mostRecentClientCallback, 0);
  objc_storeStrong((id *)&self->_clientCallbackTimer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_financingController, 0);
  objc_storeStrong((id *)&self->_continuityPaymentCoordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_continuityPaymentService, 0);
  objc_storeStrong((id *)&self->_peerPaymentSession, 0);
  objc_storeStrong((id *)&self->_inAppPaymentSession, 0);
  objc_storeStrong((id *)&self->_aggregateDictionary, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_bluetoothMonitor, 0);
}

@end

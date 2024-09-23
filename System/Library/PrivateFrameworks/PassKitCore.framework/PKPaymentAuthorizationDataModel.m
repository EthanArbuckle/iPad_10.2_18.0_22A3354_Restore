@implementation PKPaymentAuthorizationDataModel

- (PKPaymentAuthorizationDataModel)init
{
  return -[PKPaymentAuthorizationDataModel initWithMode:](self, "initWithMode:", 1);
}

- (PKPaymentAuthorizationDataModel)initWithMode:(int64_t)a3
{
  PKPaymentAuthorizationDataModel *v4;
  PKPaymentAuthorizationDataModel *v5;
  NSMutableArray *v6;
  NSMutableArray *items;
  NSMutableDictionary *v8;
  NSMutableDictionary *typeToItemMap;
  NSMutableDictionary *v10;
  NSMutableDictionary *billingAddressForFundingSource;
  NSMutableDictionary *v12;
  NSMutableDictionary *acceptedApplications;
  NSString *couponCode;
  NSArray *v15;
  NSArray *paymentErrors;
  NSArray *v17;
  NSArray *clientErrors;
  NSArray *v19;
  NSArray *paymentContactFormatErrors;
  uint64_t v21;
  PKPaymentWebService *paymentWebService;
  PKAccountEnhancedMerchant *appleCardEnhancedMerchant;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *balancesProviderQueue;
  NSMutableSet *v27;
  NSMutableSet *primaryAccountIdentifiersWithConnectedCardStateSet;
  uint64_t v29;
  void *allRemoteDevices;
  uint64_t v31;
  NSMapTable *instrumentToDeviceMap;
  uint64_t v33;
  NSMutableDictionary *remoteDeviceToAcceptedInstruments;
  ABRecordRef v35;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)PKPaymentAuthorizationDataModel;
  v4 = -[PKPaymentAuthorizationDataModel init](&v37, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    items = v5->_items;
    v5->_items = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    typeToItemMap = v5->_typeToItemMap;
    v5->_typeToItemMap = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    billingAddressForFundingSource = v5->_billingAddressForFundingSource;
    v5->_billingAddressForFundingSource = v10;

    v5->_holdPendingUpdatesCount = 0;
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    acceptedApplications = v5->_acceptedApplications;
    v5->_acceptedApplications = v12;

    couponCode = v5->_couponCode;
    v5->_couponCode = (NSString *)&stru_1E2ADF4C0;

    v15 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    paymentErrors = v5->_paymentErrors;
    v5->_paymentErrors = v15;

    v17 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    clientErrors = v5->_clientErrors;
    v5->_clientErrors = v17;

    v19 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    paymentContactFormatErrors = v5->_paymentContactFormatErrors;
    v5->_paymentContactFormatErrors = v19;

    +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
    v21 = objc_claimAutoreleasedReturnValue();
    paymentWebService = v5->_paymentWebService;
    v5->_paymentWebService = (PKPaymentWebService *)v21;

    appleCardEnhancedMerchant = v5->_appleCardEnhancedMerchant;
    v5->_appleCardEnhancedMerchant = 0;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create("com.apple.PassKitCore.balancesProvider", v24);
    balancesProviderQueue = v5->_balancesProviderQueue;
    v5->_balancesProviderQueue = (OS_dispatch_queue *)v25;

    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    primaryAccountIdentifiersWithConnectedCardStateSet = v5->_primaryAccountIdentifiersWithConnectedCardStateSet;
    v5->_primaryAccountIdentifiersWithConnectedCardStateSet = v27;

    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
      v31 = objc_claimAutoreleasedReturnValue();
      instrumentToDeviceMap = v5->_instrumentToDeviceMap;
      v5->_instrumentToDeviceMap = (NSMapTable *)v31;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v33 = objc_claimAutoreleasedReturnValue();
      remoteDeviceToAcceptedInstruments = v5->_remoteDeviceToAcceptedInstruments;
      v5->_remoteDeviceToAcceptedInstruments = (NSMutableDictionary *)v33;

      allRemoteDevices = v5->_allRemoteDevices;
      v5->_allRemoteDevices = (NSArray *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      if (a3 != 1)
      {
LABEL_7:
        v35 = ABPersonCreate();
        CFRelease(v35);
        return v5;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v29 = objc_claimAutoreleasedReturnValue();
      allRemoteDevices = v5->_statusForPass;
      v5->_statusForPass = (NSMutableDictionary *)v29;
    }

    goto LABEL_7;
  }
  return v5;
}

- (PKPassLibrary)library
{
  PKPassLibrary *library;
  PKPassLibrary *v4;
  PKPassLibrary *v5;

  library = self->_library;
  if (!library)
  {
    +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
    v4 = (PKPassLibrary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_library;
    self->_library = v4;

    library = self->_library;
  }
  return library;
}

- (PKPaymentOptionsDefaults)defaults
{
  PKPaymentOptionsDefaults *defaults;
  PKPaymentOptionsDefaults *v4;
  PKPaymentOptionsDefaults *v5;

  defaults = self->_defaults;
  if (!defaults)
  {
    +[PKPaymentOptionsDefaults defaults](PKPaymentOptionsDefaults, "defaults");
    v4 = (PKPaymentOptionsDefaults *)objc_claimAutoreleasedReturnValue();
    v5 = self->_defaults;
    self->_defaults = v4;

    defaults = self->_defaults;
  }
  return defaults;
}

- (PKPaymentOptionsRecents)recents
{
  PKPaymentOptionsRecents *recents;
  PKPaymentOptionsRecents *v4;
  PKPaymentOptionsRecents *v5;

  recents = self->_recents;
  if (!recents)
  {
    +[PKPaymentOptionsRecents defaultInstance](PKPaymentOptionsRecents, "defaultInstance");
    v4 = (PKPaymentOptionsRecents *)objc_claimAutoreleasedReturnValue();
    v5 = self->_recents;
    self->_recents = v4;

    recents = self->_recents;
  }
  return recents;
}

- (void)setFundingMode:(int64_t)a3
{
  int64_t fundingMode;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  fundingMode = self->_fundingMode;
  if (fundingMode != a3)
  {
    PKLogFacilityTypeGetObject(7uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      PKPaymentAuthorizationFundingModeToString(fundingMode);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKPaymentAuthorizationFundingModeToString(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Did update funding mode from %@ to %@", (uint8_t *)&v9, 0x16u);

    }
    self->_fundingMode = a3;
    -[NSMutableDictionary removeAllObjects](self->_acceptedApplications, "removeAllObjects");
    -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
  }
}

- (void)setPaymentRequest:(id)a3
{
  void *v5;
  NSDecimalNumber *v6;
  NSDecimalNumber *initialTransactionAmount;
  id v8;

  v8 = a3;
  if (self->_paymentRequest)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Illegal state"), CFSTR("paymentRequest property already set"));
  }
  else
  {
    objc_storeStrong((id *)&self->_paymentRequest, a3);
    -[PKPaymentAuthorizationDataModel _ensureItems](self, "_ensureItems");
    -[PKPaymentAuthorizationDataModel transactionAmount](self, "transactionAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSDecimalNumber *)objc_msgSend(v5, "copy");
    initialTransactionAmount = self->_initialTransactionAmount;
    self->_initialTransactionAmount = v6;

  }
}

- (void)setPaymentContentItems:(id)a3
{
  objc_storeStrong((id *)&self->_paymentContentItems, a3);
  -[PKPaymentAuthorizationDataModel _ensurePaymentContentItems](self, "_ensurePaymentContentItems");
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

- (void)setBillingAgreement:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSString *v8;
  NSString *billingAgreement;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v10, "length") <= 0x1F4)
    v7 = objc_msgSend(v10, "length");
  else
    v7 = 500;
  objc_msgSend(v10, "substringToIndex:", v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  billingAgreement = self->_billingAgreement;
  self->_billingAgreement = v8;

  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");

}

- (void)setRecurringPaymentRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "sanitize");
  -[PKPaymentRequest setRecurringPaymentRequest:](self->_paymentRequest, "setRecurringPaymentRequest:", v4);
  objc_msgSend(v4, "billingAgreement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  }
  else
  {
    -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", 12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel _removeDataItem:](self, "_removeDataItem:", v7);

  }
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

- (void)setAutomaticReloadPaymentRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "sanitize");
  -[PKPaymentRequest setAutomaticReloadPaymentRequest:](self->_paymentRequest, "setAutomaticReloadPaymentRequest:", v4);
  objc_msgSend(v4, "billingAgreement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  }
  else
  {
    -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", 12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel _removeDataItem:](self, "_removeDataItem:", v7);

  }
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

- (void)setDeferredPaymentRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "sanitize");
  -[PKPaymentRequest setDeferredPaymentRequest:](self->_paymentRequest, "setDeferredPaymentRequest:", v4);
  objc_msgSend(v4, "billingAgreement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  }
  else
  {
    -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", 12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel _removeDataItem:](self, "_removeDataItem:", v7);

  }
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

- (void)setMultiTokenContexts:(id)a3
{
  void *v4;

  -[PKPaymentRequest setMultiTokenContexts:](self->_paymentRequest, "setMultiTokenContexts:", a3);
  if (-[PKPaymentRequest isMultiTokenRequest](self->_paymentRequest, "isMultiTokenRequest"))
  {
    -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  }
  else
  {
    -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", 13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel _removeDataItem:](self, "_removeDataItem:", v4);

  }
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

- (void)setCouponCode:(id)a3
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  NSArray *v7;
  NSArray *paymentErrors;

  v4 = objc_msgSend(a3, "copy");
  v5 = (void *)v4;
  if (v4)
    v6 = (__CFString *)v4;
  else
    v6 = &stru_1E2ADF4C0;
  objc_storeStrong((id *)&self->_couponCode, v6);

  -[NSArray pk_objectsPassingTest:](self->_paymentErrors, "pk_objectsPassingTest:", &__block_literal_global_37);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  paymentErrors = self->_paymentErrors;
  self->_paymentErrors = v7;

  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

BOOL __49__PKPaymentAuthorizationDataModel_setCouponCode___block_invoke(uint64_t a1, void *a2)
{
  return !PKIsCouponCodeError(a2);
}

- (void)setNumberOfOutstandingCouponCodeUpdates:(unint64_t)a3
{
  self->_numberOfOutstandingCouponCodeUpdates = a3;
  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

- (void)setCouponCodeErrors:(id)a3
{
  NSArray *paymentErrors;
  id v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  id v10;

  paymentErrors = self->_paymentErrors;
  v5 = a3;
  -[NSArray pk_objectsPassingTest:](paymentErrors, "pk_objectsPassingTest:", &__block_literal_global_60_0);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v7 = self->_paymentErrors;
  self->_paymentErrors = v6;

  objc_msgSend(v5, "pk_arrayByApplyingBlock:", &__block_literal_global_62);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v10, "count"))
  {
    -[NSArray arrayByAddingObjectsFromArray:](self->_paymentErrors, "arrayByAddingObjectsFromArray:", v10);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_paymentErrors;
    self->_paymentErrors = v8;

  }
  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");

}

BOOL __55__PKPaymentAuthorizationDataModel_setCouponCodeErrors___block_invoke(uint64_t a1, void *a2)
{
  return !PKIsCouponCodeError(a2);
}

uint64_t __55__PKPaymentAuthorizationDataModel_setCouponCodeErrors___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pk_paymentErrorWithLocalizedDescription");
}

- (void)setShippingEmail:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CNContact *v8;
  CNContact *shippingEmail;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSArray *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  NSArray *v24;
  NSArray *paymentErrors;
  void *v26;
  void *v27;
  NSArray *v28;
  PKContactFormatValidator *contactFormatValidator;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSArray *v36;
  NSArray *paymentContactFormatErrors;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  const __CFString *v42;
  _QWORD v43[2];
  _BYTE v44[128];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = (CNContact *)v4;
  else
    v8 = 0;
  shippingEmail = self->_shippingEmail;
  self->_shippingEmail = v8;

  v10 = 0x1E0C99000uLL;
  v11 = (void *)MEMORY[0x1E0C99D20];
  v45[0] = CFSTR("email");
  v45[1] = CFSTR("contactInfo");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pk_FilteredShippingErrorsForContactFields:errors:", v12, self->_clientErrors);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayment shippingContact](self->_payment, "shippingContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "emailAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", v7);

  if (v16)
  {
    v17 = (NSArray *)-[NSArray mutableCopy](self->_paymentErrors, "mutableCopy");
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v18 = v13;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v39 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          if (!-[NSArray containsObject:](self->_paymentErrors, "containsObject:", v23, (_QWORD)v38))
            -[NSArray addObject:](v17, "addObject:", v23);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v20);
    }

    v24 = (NSArray *)-[NSArray copy](v17, "copy");
    paymentErrors = self->_paymentErrors;
    self->_paymentErrors = v24;

    v10 = 0x1E0C99000;
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0C99D20];
    v43[0] = CFSTR("email");
    v43[1] = CFSTR("contactInfo");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pk_FilteredShippingErrorsForContactFields:errors:", v27, self->_paymentErrors);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    -[NSArray pk_arrayByRemovingObjectsInArray:](self->_paymentErrors, "pk_arrayByRemovingObjectsInArray:", v18);
    v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v17 = self->_paymentErrors;
    self->_paymentErrors = v28;
  }

  contactFormatValidator = self->_contactFormatValidator;
  if (contactFormatValidator)
  {
    v30 = -[PKContactFormatValidator emailAddressIsValid:](contactFormatValidator, "emailAddressIsValid:", v7);
    v31 = (void *)-[NSArray mutableCopy](self->_paymentContactFormatErrors, "mutableCopy");
    v32 = *(void **)(v10 + 3360);
    v42 = CFSTR("email");
    objc_msgSend(v32, "arrayWithObjects:count:", &v42, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "pk_FilteredShippingErrorsForContactFields:errors:", v33, self->_paymentContactFormatErrors);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "removeObjectsInArray:", v34);

    if (!v30)
    {
      PKContactFormatErrorForInvalidEmailAddressFormat();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v35);

    }
    v36 = (NSArray *)objc_msgSend(v31, "copy", (_QWORD)v38);
    paymentContactFormatErrors = self->_paymentContactFormatErrors;
    self->_paymentContactFormatErrors = v36;

  }
  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");

}

- (void)setShippingEmailError:(id)a3
{
  void *v4;
  NSArray *v5;
  NSArray *paymentErrors;
  id v7;

  v7 = a3;
  if (!-[NSArray containsObject:](self->_paymentErrors, "containsObject:"))
  {
    v4 = (void *)-[NSArray mutableCopy](self->_paymentErrors, "mutableCopy");
    objc_msgSend(v4, "addObject:", v7);
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    paymentErrors = self->_paymentErrors;
    self->_paymentErrors = v5;

    -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
  }

}

- (void)setShippingPhone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CNContact *v8;
  CNContact *shippingPhone;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSArray *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  NSArray *v24;
  NSArray *paymentErrors;
  void *v26;
  void *v27;
  NSArray *v28;
  PKContactFormatValidator *contactFormatValidator;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSArray *v36;
  NSArray *paymentContactFormatErrors;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  const __CFString *v42;
  _QWORD v43[2];
  _BYTE v44[128];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "phoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = (CNContact *)v4;
  else
    v8 = 0;
  shippingPhone = self->_shippingPhone;
  self->_shippingPhone = v8;

  v10 = 0x1E0C99000uLL;
  v11 = (void *)MEMORY[0x1E0C99D20];
  v45[0] = CFSTR("phone");
  v45[1] = CFSTR("contactInfo");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pk_FilteredShippingErrorsForContactFields:errors:", v12, self->_clientErrors);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayment shippingContact](self->_payment, "shippingContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "phoneNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", v7);

  if (v16)
  {
    v17 = (NSArray *)-[NSArray mutableCopy](self->_paymentErrors, "mutableCopy");
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v18 = v13;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v39 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          if (!-[NSArray containsObject:](self->_paymentErrors, "containsObject:", v23, (_QWORD)v38))
            -[NSArray addObject:](v17, "addObject:", v23);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v20);
    }

    v24 = (NSArray *)-[NSArray copy](v17, "copy");
    paymentErrors = self->_paymentErrors;
    self->_paymentErrors = v24;

    v10 = 0x1E0C99000;
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0C99D20];
    v43[0] = CFSTR("phone");
    v43[1] = CFSTR("contactInfo");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pk_FilteredShippingErrorsForContactFields:errors:", v27, self->_paymentErrors);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    -[NSArray pk_arrayByRemovingObjectsInArray:](self->_paymentErrors, "pk_arrayByRemovingObjectsInArray:", v18);
    v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v17 = self->_paymentErrors;
    self->_paymentErrors = v28;
  }

  contactFormatValidator = self->_contactFormatValidator;
  if (contactFormatValidator)
  {
    v30 = -[PKContactFormatValidator phoneNumberIsValid:forCountryCode:](contactFormatValidator, "phoneNumberIsValid:forCountryCode:", v7, 0);
    v31 = (void *)-[NSArray mutableCopy](self->_paymentContactFormatErrors, "mutableCopy");
    v32 = *(void **)(v10 + 3360);
    v42 = CFSTR("phone");
    objc_msgSend(v32, "arrayWithObjects:count:", &v42, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "pk_FilteredShippingErrorsForContactFields:errors:", v33, self->_paymentContactFormatErrors);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "removeObjectsInArray:", v34);

    if (!v30)
    {
      PKContactFormatErrorForInvalidPhoneNumberFormat();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v35);

    }
    v36 = (NSArray *)objc_msgSend(v31, "copy", (_QWORD)v38);
    paymentContactFormatErrors = self->_paymentContactFormatErrors;
    self->_paymentContactFormatErrors = v36;

  }
  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");

}

- (void)setShippingName:(id)a3
{
  id v4;
  void *v5;
  CNContact *v6;
  CNContact *shippingName;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  NSArray *v22;
  void *v23;
  void *v24;
  NSArray *paymentErrors;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[3];
  _BYTE v31[128];
  _QWORD v32[5];

  v32[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "nameComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (CNContact *)v4;
  else
    v6 = 0;
  shippingName = self->_shippingName;
  self->_shippingName = v6;

  v8 = (void *)MEMORY[0x1E0C99D20];
  v32[0] = CFSTR("name");
  v32[1] = CFSTR("phoneticName");
  v32[2] = CFSTR("contactInfo");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pk_FilteredShippingErrorsForContactFields:errors:", v9, self->_clientErrors);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayment shippingContact](self->_payment, "shippingContact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nameComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if (v14)
  {
    v15 = (void *)-[NSArray mutableCopy](self->_paymentErrors, "mutableCopy");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v10;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (!-[NSArray containsObject:](self->_paymentErrors, "containsObject:", v21, (_QWORD)v26))
            objc_msgSend(v15, "addObject:", v21);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v18);
    }

    v22 = (NSArray *)objc_msgSend(v15, "copy");
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0C99D20];
    v30[0] = CFSTR("name");
    v30[1] = CFSTR("phoneticName");
    v30[2] = CFSTR("contactInfo");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pk_FilteredShippingErrorsForContactFields:errors:", v24, self->_paymentErrors);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray pk_arrayByRemovingObjectsInArray:](self->_paymentErrors, "pk_arrayByRemovingObjectsInArray:", v15);
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  paymentErrors = self->_paymentErrors;
  self->_paymentErrors = v22;

  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");

}

- (void)setShippingAddress:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNContact *v10;
  CNContact *shippingAddress;
  CNContact *originalShippingAddress;
  void *v13;
  int v14;
  void *v15;
  void *v16;
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
  int v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  NSArray *v54;
  NSArray *paymentErrors;
  uint64_t v56;
  PKContactFormatValidator *contactFormatValidator;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSArray *v66;
  NSArray *paymentContactFormatErrors;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD v75[3];
  _QWORD v76[2];
  _QWORD v77[2];
  const __CFString *v78;
  _QWORD v79[2];
  _QWORD v80[2];
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "nameComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postalAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&self->_originalShippingAddress, a3);
    -[PKPaymentAuthorizationDataModel _formatAddressContactIfNecessary:](self, "_formatAddressContactIfNecessary:", v5);
    v10 = (CNContact *)objc_claimAutoreleasedReturnValue();
    shippingAddress = self->_shippingAddress;
    self->_shippingAddress = v10;
  }
  else
  {
    originalShippingAddress = self->_originalShippingAddress;
    self->_originalShippingAddress = 0;

    shippingAddress = self->_shippingAddress;
    self->_shippingAddress = 0;
  }

  v13 = (void *)MEMORY[0x1E0C99D20];
  v85[0] = CFSTR("post");
  v14 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pk_FilteredShippingErrorsForContactFields:errors:", v15, self->_clientErrors);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99D20];
  v84 = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pk_FilteredShippingErrorsForContactFields:errors:", v17, self->_clientErrors);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0C99D20];
  v83 = CFSTR("phoneticName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pk_FilteredShippingErrorsForContactFields:errors:", v19, self->_clientErrors);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentRequest requiredShippingContactFields](self->_paymentRequest, "requiredShippingContactFields");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "containsObject:", CFSTR("name")) & 1) == 0)
    v14 = objc_msgSend(v20, "containsObject:", CFSTR("post"));
  v69 = v20;
  v70 = objc_msgSend(v20, "containsObject:", CFSTR("phoneticName"));
  v21 = (void *)-[NSArray mutableCopy](self->_paymentErrors, "mutableCopy");
  v22 = (void *)MEMORY[0x1E0C99D20];
  v82 = CFSTR("post");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pk_FilteredShippingErrorsForContactFields:errors:", v23, self->_paymentErrors);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeObjectsInArray:", v24);

  -[PKPayment shippingContact](self->_payment, "shippingContact");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "postalAddress");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqual:", v9);

  if (v27)
    objc_msgSend(v21, "addObjectsFromArray:", v71);
  if (objc_msgSend(v73, "count"))
    v28 = 1;
  else
    v28 = v14;
  if (v28 == 1)
  {
    v29 = (void *)MEMORY[0x1E0C99D20];
    v81 = CFSTR("name");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "pk_FilteredShippingErrorsForContactFields:errors:", v30, self->_paymentErrors);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObjectsInArray:", v31);

    -[PKPayment shippingContact](self->_payment, "shippingContact");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "isEqual:", v6))
    {
      v34 = objc_msgSend(v73, "count");

      if (v34)
      {
        objc_msgSend(v21, "addObjectsFromArray:", v73);
        goto LABEL_19;
      }
    }
    else
    {

    }
    if (v14)
    {
      objc_msgSend(v5, "pkFullName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "length");

      if (!v36)
      {
        PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_NAME_REQUIRED"), 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPaymentRequest paymentContactInvalidErrorWithContactField:localizedDescription:](PKPaymentRequest, "paymentContactInvalidErrorWithContactField:localizedDescription:", CFSTR("name"), v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v38);

        v79[0] = CFSTR("eventType");
        v79[1] = CFSTR("authorizationError");
        v80[0] = CFSTR("transactionAuthorizationPreferenceError");
        v80[1] = CFSTR("shippingContactInvalid");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("inApp"), v39);

      }
    }
  }
LABEL_19:
  if (objc_msgSend(v72, "count"))
    v40 = 1;
  else
    v40 = v70;
  if (v40 == 1)
  {
    v68 = v5;
    v41 = (void *)MEMORY[0x1E0C99D20];
    v78 = CFSTR("phoneticName");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "pk_FilteredShippingErrorsForContactFields:errors:", v42, self->_paymentErrors);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObjectsInArray:", v43);

    -[PKPayment shippingContact](self->_payment, "shippingContact");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "name");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "phoneticRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "phoneticRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "isEqual:", v47))
    {
      v48 = objc_msgSend(v72, "count");

      if (v48)
      {
        objc_msgSend(v21, "addObjectsFromArray:", v72);
        v5 = v68;
        goto LABEL_30;
      }
    }
    else
    {

    }
    v5 = v68;
    if (v70)
    {
      objc_msgSend(v68, "pkPhoneticName");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "length");

      if (!v50)
      {
        PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_PHONETIC_NAME_REQUIRED"), 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPaymentRequest paymentContactInvalidErrorWithContactField:localizedDescription:](PKPaymentRequest, "paymentContactInvalidErrorWithContactField:localizedDescription:", CFSTR("phoneticName"), v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v52);

        v76[0] = CFSTR("eventType");
        v76[1] = CFSTR("authorizationError");
        v77[0] = CFSTR("transactionAuthorizationPreferenceError");
        v77[1] = CFSTR("shippingContactInvalid");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 2);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("inApp"), v53);

      }
    }
  }
LABEL_30:
  v54 = (NSArray *)objc_msgSend(v21, "copy");
  paymentErrors = self->_paymentErrors;
  self->_paymentErrors = v54;

  v56 = -[PKContactFormatValidator checkPostalAddressFormat:](self->_contactFormatValidator, "checkPostalAddressFormat:", v9);
  contactFormatValidator = self->_contactFormatValidator;
  objc_msgSend(v9, "ISOCountryCode");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = -[PKContactFormatValidator checkNameFormat:forCountryCode:](contactFormatValidator, "checkNameFormat:forCountryCode:", v6, v58);

  v60 = (void *)-[NSArray mutableCopy](self->_paymentContactFormatErrors, "mutableCopy");
  v61 = (void *)MEMORY[0x1E0C99D20];
  v75[0] = CFSTR("post");
  v75[1] = CFSTR("name");
  v75[2] = CFSTR("phoneticName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 3);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "pk_FilteredShippingErrorsForContactFields:errors:", v62, self->_paymentContactFormatErrors);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "removeObjectsInArray:", v63);

  if (v56)
  {
    PKContactFormatErrorsFromShippingAddressFormatErrors(v56);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addObjectsFromArray:", v64);

  }
  if (v59)
  {
    PKContactFormatErrorsFromShippingNameComponenentFormatErrors(v59);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addObjectsFromArray:", v65);

  }
  v66 = (NSArray *)objc_msgSend(v60, "copy");
  paymentContactFormatErrors = self->_paymentContactFormatErrors;
  self->_paymentContactFormatErrors = v66;

  if (-[PKPaymentAuthorizationDataModel shouldUpdateContactDataItem](self, "shouldUpdateContactDataItem"))
    -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");

}

- (BOOL)shouldUpdateContactDataItem
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;

  -[PKPaymentRequest requiredShippingContactFields](self->_paymentRequest, "requiredShippingContactFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("email"));

  -[PKPaymentRequest requiredShippingContactFields](self->_paymentRequest, "requiredShippingContactFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("phone"));

  -[PKPaymentRequest requiredShippingContactFields](self->_paymentRequest, "requiredShippingContactFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsObject:", CFSTR("name")) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[PKPaymentRequest requiredShippingContactFields](self->_paymentRequest, "requiredShippingContactFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", CFSTR("phoneticName"));

    v8 = v10 ^ 1;
  }

  -[PKPaymentRequest requiredShippingContactFields](self->_paymentRequest, "requiredShippingContactFields");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", CFSTR("post"));

  return v4 | v6 | (v8 | v12 & -[PKPaymentRequest isShippingEditable](self->_paymentRequest, "isShippingEditable")) ^ 1;
}

- (void)setShippingMethod:(id)a3
{
  id v5;
  uint64_t v6;

  objc_storeStrong((id *)&self->_shippingMethod, a3);
  v5 = a3;
  v6 = objc_opt_class();

  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", v6);
  -[PKPaymentAuthorizationDataModel _updatePeerPaymentPromotionAvailability](self, "_updatePeerPaymentPromotionAvailability");
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

- (void)setShippingEditableMessage:(id)a3
{
  objc_storeStrong((id *)&self->_shippingEditableMessage, a3);
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

- (CNContact)billingAddress
{
  void *v3;
  void *v4;

  -[PKPaymentAuthorizationDataModel _billingAddressKey](self, "_billingAddressKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_billingAddressForFundingSource, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (CNContact *)v4;
}

- (void)setBillingAddress:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "postalAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[PKPaymentAuthorizationDataModel _formatAddressContactIfNecessary:](self, "_formatAddressContactIfNecessary:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  -[PKPaymentAuthorizationDataModel _billingAddressKey](self, "_billingAddressKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_billingAddressForFundingSource, "setObject:forKeyedSubscript:", v5, v6);
  -[PKPaymentAuthorizationDataModel refreshBillingAddressErrors](self, "refreshBillingAddressErrors");
  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");

}

- (void)refreshBillingAddressErrors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PKContactFormatValidator *contactFormatValidator;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *paymentContactFormatErrors;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationDataModel updateBillingErrors](self, "updateBillingErrors");
  -[PKPaymentAuthorizationDataModel billingAddress](self, "billingAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postalAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PKContactFormatValidator checkPostalAddressFormat:](self->_contactFormatValidator, "checkPostalAddressFormat:", v7);
  contactFormatValidator = self->_contactFormatValidator;
  objc_msgSend(v7, "ISOCountryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKContactFormatValidator checkNameFormat:forCountryCode:](contactFormatValidator, "checkNameFormat:forCountryCode:", v4, v10);

  v12 = (void *)-[NSArray mutableCopy](self->_paymentContactFormatErrors, "mutableCopy");
  v13 = (void *)MEMORY[0x1E0C99D20];
  v20[0] = CFSTR("post");
  v20[1] = CFSTR("name");
  v20[2] = CFSTR("phoneticName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pk_FilteredBillingErrorsForContactFields:errors:", v14, self->_paymentContactFormatErrors);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectsInArray:", v15);

  if (v8)
  {
    PKContactFormatErrorsFromBillingAddressFormatErrors(v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v16);

  }
  if (v11)
  {
    PKContactFormatErrorsFromBillingNameComponenentFormatErrors(v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v17);

  }
  v18 = (NSArray *)objc_msgSend(v12, "copy");
  paymentContactFormatErrors = self->_paymentContactFormatErrors;
  self->_paymentContactFormatErrors = v18;

}

- (id)_billingAddressKey
{
  int64_t fundingMode;
  int64_t mode;
  uint64_t v4;
  void *v5;
  void *v6;

  fundingMode = self->_fundingMode;
  switch(fundingMode)
  {
    case 2:
      goto LABEL_4;
    case 1:
      -[PKPayLaterFinancingController selectedFundingSource](self->_financingController, "selectedFundingSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
    case 0:
LABEL_4:
      mode = self->_mode;
      if (mode == 2)
      {
        -[PKRemotePaymentInstrument passIdentifier](self->_remotePaymentInstrument, "passIdentifier");
        v4 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      if (mode == 1)
      {
        -[PKObject uniqueID](self->_pass, "uniqueID");
        v4 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v5 = (void *)v4;
        return v5;
      }
      break;
  }
  v5 = 0;
  return v5;
}

- (void)updateBillingErrors
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  NSString *paymentApplicationIdentifierForErrors;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *paymentErrors;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSArray *v25;
  NSArray *v26;
  void *v27;
  void *v28;
  NSArray *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  NSArray *v69;
  NSArray *v70;
  NSArray *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  NSArray *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t j;
  uint64_t v87;
  NSArray *v88;
  NSArray *v89;
  NSArray *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[2];
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[2];
  const __CFString *v110;
  const __CFString *v111;
  _QWORD v112[3];
  _BYTE v113[128];
  _QWORD v114[2];
  _BYTE v115[128];
  _QWORD v116[3];

  v116[1] = *MEMORY[0x1E0C80C00];
  -[PKPaymentRequest requiredBillingContactFields](self->_paymentRequest, "requiredBillingContactFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0x1E0C99000uLL;
  if (!objc_msgSend(v3, "containsObject:", CFSTR("post"))
    || !self->_paymentApplicationIdentifierForErrors
    || (-[PKPaymentApplication applicationIdentifier](self->_paymentApplication, "applicationIdentifier"),
        (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_17;
  }
  v6 = (void *)v5;
  paymentApplicationIdentifierForErrors = self->_paymentApplicationIdentifierForErrors;
  -[PKPaymentApplication applicationIdentifier](self->_paymentApplication, "applicationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(paymentApplicationIdentifierForErrors) = -[NSString isEqualToString:](paymentApplicationIdentifierForErrors, "isEqualToString:", v8);

  if (!(_DWORD)paymentApplicationIdentifierForErrors)
  {
LABEL_17:
    v27 = (void *)MEMORY[0x1E0C99D20];
    v112[0] = CFSTR("post");
    v112[1] = CFSTR("name");
    v112[2] = CFSTR("phoneticName");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "pk_FilteredBillingErrorsForContactFields:errors:", v28, self->_clientErrors);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray pk_arrayByRemovingObjectsInArray:](self->_paymentErrors, "pk_arrayByRemovingObjectsInArray:", v12);
    v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
    paymentErrors = self->_paymentErrors;
    self->_paymentErrors = v29;
    goto LABEL_18;
  }
  -[PKPaymentAuthorizationDataModel billingAddress](self, "billingAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postalAddresses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayment billingContact](self->_payment, "billingContact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postalAddress");
  paymentErrors = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99D20];
  v116[0] = CFSTR("post");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pk_FilteredBillingErrorsForContactFields:errors:", v16, self->_clientErrors);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = v17;
  if (objc_msgSend(v12, "isEqual:", paymentErrors))
  {
    v18 = (NSArray *)-[NSArray mutableCopy](self->_paymentErrors, "mutableCopy");
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v103;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v103 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i);
          if (!-[NSArray containsObject:](self->_paymentErrors, "containsObject:", v24))
            -[NSArray addObject:](v18, "addObject:", v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
      }
      while (v21);
    }

    v25 = (NSArray *)-[NSArray copy](v18, "copy");
    v26 = self->_paymentErrors;
    self->_paymentErrors = v25;

    v4 = 0x1E0C99000;
    goto LABEL_40;
  }
  if (objc_msgSend(v17, "count"))
  {
    -[NSArray pk_arrayByRemovingObjectsInArray:](self->_paymentErrors, "pk_arrayByRemovingObjectsInArray:", v17);
    v71 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v18 = self->_paymentErrors;
    self->_paymentErrors = v71;
LABEL_40:

  }
  -[PKPaymentAuthorizationDataModel billingAddress](self, "billingAddress");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "nameComponents");
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayment billingContact](self->_payment, "billingContact");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "name");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = *(void **)(v4 + 3360);
  v114[0] = CFSTR("name");
  v114[1] = CFSTR("phoneticName");
  objc_msgSend(v75, "arrayWithObjects:count:", v114, 2);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "pk_FilteredBillingErrorsForContactFields:errors:", v76, self->_clientErrors);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = v97;
  if (objc_msgSend(v77, "count") && objc_msgSend(v97, "isEqual:", v74))
  {
    v91 = v74;
    v92 = paymentErrors;
    v79 = -[NSArray mutableCopy](self->_paymentErrors, "mutableCopy");
    v80 = v77;
    v81 = (NSArray *)v79;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v93 = v80;
    v82 = v80;
    v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v98, v113, 16);
    if (v83)
    {
      v84 = v83;
      v85 = *(_QWORD *)v99;
      do
      {
        for (j = 0; j != v84; ++j)
        {
          if (*(_QWORD *)v99 != v85)
            objc_enumerationMutation(v82);
          v87 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * j);
          if (!-[NSArray containsObject:](self->_paymentErrors, "containsObject:", v87))
            -[NSArray addObject:](v81, "addObject:", v87);
        }
        v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v98, v113, 16);
      }
      while (v84);
    }

    v88 = (NSArray *)-[NSArray copy](v81, "copy");
    v89 = self->_paymentErrors;
    self->_paymentErrors = v88;

    v78 = v97;
    v4 = 0x1E0C99000;
    v74 = v91;
    paymentErrors = v92;
    goto LABEL_55;
  }
  if (objc_msgSend(v77, "count"))
  {
    v93 = v77;
    -[NSArray pk_arrayByRemovingObjectsInArray:](self->_paymentErrors, "pk_arrayByRemovingObjectsInArray:", v77);
    v90 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v81 = self->_paymentErrors;
    self->_paymentErrors = v90;
LABEL_55:

    v77 = v93;
  }

LABEL_18:
  -[PKPaymentAuthorizationDataModel billingAddress](self, "billingAddress");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
    return;
  -[PKPaymentRequest requiredBillingContactFields](self->_paymentRequest, "requiredBillingContactFields");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v31, "containsObject:", CFSTR("name")) & 1) != 0)
    v32 = 1;
  else
    v32 = objc_msgSend(v31, "containsObject:", CFSTR("post"));
  v33 = objc_msgSend(v31, "containsObject:", CFSTR("phoneticName"));
  v34 = *(void **)(v4 + 3360);
  v111 = CFSTR("name");
  objc_msgSend(v34, "arrayWithObjects:count:", &v111, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "pk_FilteredBillingErrorsForContactFields:errors:", v35, self->_paymentErrors);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = *(void **)(v4 + 3360);
  v110 = CFSTR("phoneticName");
  objc_msgSend(v36, "arrayWithObjects:count:", &v110, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "pk_FilteredBillingErrorsForContactFields:errors:", v37, self->_paymentErrors);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)-[NSArray mutableCopy](self->_paymentErrors, "mutableCopy");
  if (v32)
  {
    v40 = v33;
    v41 = v31;
    v42 = v38;
    -[PKPayment billingContact](self->_payment, "billingContact");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "name");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel billingAddress](self, "billingAddress");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "nameComponents");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v44, "isEqual:", v46);

    if ((v47 & 1) != 0)
    {
      v38 = v42;
      v31 = v41;
      v33 = v40;
      if (objc_msgSend(v96, "count"))
        goto LABEL_29;
    }
    else
    {
      objc_msgSend(v39, "removeObjectsInArray:", v96);
      objc_msgSend(v96, "count");
      v38 = v42;
      v31 = v41;
      v33 = v40;
    }
    -[PKPaymentAuthorizationDataModel billingAddress](self, "billingAddress");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "pkFullName");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "length");

    if (!v50)
    {
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_CONTACT_INVALID_NAME"), 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:localizedDescription:](PKPaymentRequest, "paymentBillingAddressInvalidErrorWithKey:localizedDescription:", CFSTR("name"), v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObject:", v52);

      v108[0] = CFSTR("eventType");
      v108[1] = CFSTR("authorizationError");
      v109[0] = CFSTR("transactionAuthorizationPreferenceError");
      v109[1] = CFSTR("billingContactInvalid");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v108, 2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("inApp"), v53);

    }
  }
LABEL_29:
  if (v33)
  {
    v95 = v31;
    v54 = v38;
    -[PKPayment billingContact](self->_payment, "billingContact");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "name");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "phoneticRepresentation");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel billingAddress](self, "billingAddress");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "nameComponents");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "phoneticRepresentation");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v57, "isEqual:", v60);

    if ((v61 & 1) == 0)
    {
      v38 = v54;
      objc_msgSend(v39, "removeObjectsInArray:", v54);
      objc_msgSend(v54, "count");
      v31 = v95;
      goto LABEL_34;
    }
    v38 = v54;
    v62 = objc_msgSend(v54, "count");
    v31 = v95;
    if (!v62)
    {
LABEL_34:
      -[PKPaymentAuthorizationDataModel billingAddress](self, "billingAddress");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "pkPhoneticName");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "length");

      if (!v65)
      {
        PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_CONTACT_ITEM_INCORRECT_PHONETIC_NAME"), 0);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:localizedDescription:](PKPaymentRequest, "paymentBillingAddressInvalidErrorWithKey:localizedDescription:", CFSTR("phoneticName"), v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObject:", v67);

        v106[0] = CFSTR("eventType");
        v106[1] = CFSTR("authorizationError");
        v107[0] = CFSTR("transactionAuthorizationPreferenceError");
        v107[1] = CFSTR("billingContactInvalid");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v106, 2);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("inApp"), v68);

      }
    }
  }
  v69 = (NSArray *)objc_msgSend(v39, "copy");
  v70 = self->_paymentErrors;
  self->_paymentErrors = v69;

}

- (void)setShippingAddressErrors:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *paymentErrors;
  NSArray *v17;
  NSArray *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "pk_paymentErrorWithLocalizedDescription", (_QWORD)v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v8);
  }

  v12 = (void *)MEMORY[0x1E0C99D20];
  v23 = CFSTR("post");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pk_FilteredShippingErrorsForContactFields:errors:", v13, self->_paymentErrors);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray pk_arrayByRemovingObjectsInArray:](self->_paymentErrors, "pk_arrayByRemovingObjectsInArray:", v14);
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  paymentErrors = self->_paymentErrors;
  self->_paymentErrors = v15;

  if (v5 && objc_msgSend(v5, "count"))
  {
    -[NSArray arrayByAddingObjectsFromArray:](self->_paymentErrors, "arrayByAddingObjectsFromArray:", v5);
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v18 = self->_paymentErrors;
    self->_paymentErrors = v17;

  }
  if (-[PKPaymentAuthorizationDataModel shouldUpdateContactDataItem](self, "shouldUpdateContactDataItem", (_QWORD)v19))
    -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());

}

- (NSArray)allErrors
{
  id v3;
  void *v4;
  void *v5;

  if (self->_paymentErrors || self->_paymentContactFormatErrors)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = v3;
    if (self->_paymentErrors)
      objc_msgSend(v3, "addObjectsFromArray:");
    if (self->_paymentContactFormatErrors)
      objc_msgSend(v4, "addObjectsFromArray:");
    v5 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (void)setPaymentErrors:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSArray *paymentErrors;
  NSArray *v13;
  NSString *v14;
  NSString *paymentApplicationIdentifierForErrors;
  NSArray *v16;
  NSArray *clientErrors;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "pk_paymentErrorWithLocalizedDescription", (_QWORD)v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  paymentErrors = self->_paymentErrors;
  self->_paymentErrors = v5;
  v13 = v5;

  -[PKPaymentApplication applicationIdentifier](self->_paymentApplication, "applicationIdentifier");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  paymentApplicationIdentifierForErrors = self->_paymentApplicationIdentifierForErrors;
  self->_paymentApplicationIdentifierForErrors = v14;

  v16 = (NSArray *)-[NSArray copy](v13, "copy");
  clientErrors = self->_clientErrors;
  self->_clientErrors = v16;

}

- (void)setPeerPaymentService:(id)a3
{
  PKPeerPaymentAccount *v5;
  PKPeerPaymentAccount *peerPaymentAccount;
  id v7;

  objc_storeStrong((id *)&self->_peerPaymentService, a3);
  v7 = a3;
  -[PKPeerPaymentService account](self->_peerPaymentService, "account");
  v5 = (PKPeerPaymentAccount *)objc_claimAutoreleasedReturnValue();
  peerPaymentAccount = self->_peerPaymentAccount;
  self->_peerPaymentAccount = v5;

}

- (void)setPeerPaymentQuote:(id)a3
{
  void *v5;
  BOOL *p_supportsPreservePeerPaymentBalance;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_storeStrong((id *)&self->_peerPaymentQuote, a3);
  if (-[PKPeerPaymentAccount supportsPreserveCurrentBalance](self->_peerPaymentAccount, "supportsPreserveCurrentBalance"))
  {
    -[PKPeerPaymentQuote recipient](self->_peerPaymentQuote, "recipient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      self->_supportsPreservePeerPaymentBalance = 1;
      p_supportsPreservePeerPaymentBalance = &self->_supportsPreservePeerPaymentBalance;
    }
    else
    {
      -[PKPaymentRequest peerPaymentRequest](self->_paymentRequest, "peerPaymentRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self->_supportsPreservePeerPaymentBalance = objc_msgSend(v7, "hasUndeterminedRecipient");
      p_supportsPreservePeerPaymentBalance = &self->_supportsPreservePeerPaymentBalance;

    }
    if (*p_supportsPreservePeerPaymentBalance)
    {
      -[PKPaymentAuthorizationDataModel acceptedPasses](self, "acceptedPasses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self->_supportsPreservePeerPaymentBalance = objc_msgSend(v8, "count") != 0;

      goto LABEL_9;
    }
  }
  else
  {
    self->_supportsPreservePeerPaymentBalance = 0;
    p_supportsPreservePeerPaymentBalance = &self->_supportsPreservePeerPaymentBalance;
  }
  *p_supportsPreservePeerPaymentBalance = 0;
LABEL_9:
  objc_msgSend(v18, "recipient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

LABEL_12:
    objc_msgSend(v18, "firstQuoteItemOfType:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 != 0;

    objc_msgSend(v18, "firstQuoteItemOfType:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;

    -[PKPaymentAuthorizationDataModel showPeerPaymentCardDataItem:withCardDataItem:](self, "showPeerPaymentCardDataItem:withCardDataItem:", v13, v15);
    goto LABEL_13;
  }
  -[PKPaymentRequest peerPaymentRequest](self->_paymentRequest, "peerPaymentRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasUndeterminedRecipient");

  if (v11)
    goto LABEL_12;
  objc_msgSend(v18, "firstQuoteItemOfType:", 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

  }
  else
  {
    objc_msgSend(v18, "firstQuoteItemOfType:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_14;
  }
  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
LABEL_13:
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
LABEL_14:

}

- (void)setBankAccount:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  PKPaymentRequest *paymentRequest;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  PKPaymentPass *pass;
  PKPaymentApplication *paymentApplication;
  id v21;

  v21 = a3;
  objc_storeStrong((id *)&self->_bankAccount, a3);
  -[PKPaymentAuthorizationDataModel peerPaymentBalanceForAccountPayment](self, "peerPaymentBalanceForAccountPayment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "compare:", v6);

    paymentRequest = self->_paymentRequest;
    if (v10 == -1)
    {
      -[PKPaymentRequest paymentSummaryItems](paymentRequest, "paymentSummaryItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "amount");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "compare:", v6);
      v12 = v16 != 1;

      if (!-[PKPaymentRequest isAccountServiceTransferRequest](self->_paymentRequest, "isAccountServiceTransferRequest"))
      {
        if (v16 == 1)
          goto LABEL_9;
        goto LABEL_12;
      }
    }
    else
    {
      if (!-[PKPaymentRequest isAccountServiceTransferRequest](paymentRequest, "isAccountServiceTransferRequest"))
        goto LABEL_9;
      v12 = 0;
    }
    -[PKPaymentRequest accountServiceTransferRequest](self->_paymentRequest, "accountServiceTransferRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "supportsSplitPayment");

    if (v18 && !v12)
      goto LABEL_9;
LABEL_12:
    -[PKPaymentAuthorizationDataModel _removeDataItem:](self, "_removeDataItem:", v7);
    goto LABEL_13;
  }
LABEL_9:
  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  if (self->_bankAccount)
  {
    pass = self->_pass;
    self->_pass = 0;

    paymentApplication = self->_paymentApplication;
    self->_paymentApplication = 0;

  }
LABEL_13:
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");

}

- (void)setPeerPaymentBalanceForAccountPayment:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_storeStrong((id *)&self->_peerPaymentBalanceForAccountPayment, a3);
  if (self->_peerPaymentBalanceForAccountPayment)
    -[PKSecureElementPass setPeerPaymentBalance:](self->_peerPaymentPass, "setPeerPaymentBalance:", v21);
  -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  -[PKPaymentRequest accountServiceTransferRequest](self->_paymentRequest, "accountServiceTransferRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "transferType");

  v12 = (v10 & 0xFFFFFFFFFFFFFFFELL) != 2 && v8 != 1;
  if (!v21 || v12)
  {
    -[PKPaymentAuthorizationDataModel _removeDataItem:](self, "_removeDataItem:", v5);
    v13 = v5;
  }
  else
  {
    -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
    -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "pass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPeerPaymentBalance:", v21);

    -[PKPaymentRequest accountServiceTransferRequest](self->_paymentRequest, "accountServiceTransferRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "supportsSplitPayment");

    if (v16)
    {
      -[PKPaymentRequest paymentSummaryItems](self->_paymentRequest, "paymentSummaryItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "amount");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "compare:", v6) != 1)
      {
        -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", 9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentAuthorizationDataModel _removeDataItem:](self, "_removeDataItem:", v20);

      }
    }
  }
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");

}

- (void)setPaymentDateForPaymentRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "paymentDate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "paymentFrequency");
  objc_msgSend(v4, "paymentTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(v5 - 4) < 4 || v5 == 2)
  {
    -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
    -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", 10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPaymentDate:", v8);
    objc_msgSend(v7, "setPaymentFrequency:", v5);
    objc_msgSend(v7, "setPaymentTimeZone:", v6);
    -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");

  }
}

- (NSString)merchantName
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[PKPaymentRequest requestType](self->_paymentRequest, "requestType");
  -[PKPaymentRequest paymentSummaryItems](self->_paymentRequest, "paymentSummaryItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 10)
    objc_msgSend(v4, "firstObject");
  else
    objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)currencyCode
{
  return -[PKPaymentRequest currencyCode](self->_paymentRequest, "currencyCode");
}

- (void)setPaymentSummaryItems:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[PKPaymentRequest setPaymentSummaryItems:](self->_paymentRequest, "setPaymentSummaryItems:", a3);
  -[PKPaymentAuthorizationDataModel paymentSummaryItems](self, "paymentSummaryItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 2)
    -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  if (-[PKPaymentRequest requestType](self->_paymentRequest, "requestType") == 2
    || (-[PKPaymentRequest peerPaymentRequest](self->_paymentRequest, "peerPaymentRequest"),
        (v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v7 = (void *)v6,
        -[PKPeerPaymentQuote recipient](self->_peerPaymentQuote, "recipient"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    -[PKPaymentAuthorizationDataModel paymentSummaryItems](self, "paymentSummaryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 == 1)
    {
      -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", 8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel _removeDataItem:](self, "_removeDataItem:", v11);

    }
  }
  -[PKPaymentAuthorizationDataModel _updatePeerPaymentPromotionAvailability](self, "_updatePeerPaymentPromotionAvailability");
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

- (NSArray)paymentSummaryItems
{
  return -[PKPaymentRequest paymentSummaryItems](self->_paymentRequest, "paymentSummaryItems");
}

- (NSDecimalNumber)transactionAmount
{
  void *v3;
  void *v4;
  void *v5;

  if (-[PKPaymentRequest requestType](self->_paymentRequest, "requestType") == 10)
  {
    -[PKPaymentRequest paymentSummaryItems](self->_paymentRequest, "paymentSummaryItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "amount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKPaymentAuthorizationDataModel totalSummaryItem](self, "totalSummaryItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "amount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSDecimalNumber *)v5;
}

- (PKPaymentSummaryItem)totalSummaryItem
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[PKPaymentRequest requestType](self->_paymentRequest, "requestType");
  -[PKPaymentRequest paymentSummaryItems](self->_paymentRequest, "paymentSummaryItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 10)
    objc_msgSend(v4, "firstObject");
  else
    objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPaymentSummaryItem *)v6;
}

- (NSArray)items
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_items, "copy");
}

- (BOOL)isInlineSummaryItemsEligible
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v7;
  void *v8;

  if (-[PKPaymentRequest requestType](self->_paymentRequest, "requestType")
    && -[PKPaymentRequest requestType](self->_paymentRequest, "requestType") != 11)
  {
    return 0;
  }
  -[PKPaymentRequest multiTokenContexts](self->_paymentRequest, "multiTokenContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 0;
  -[PKPaymentRequest recurringPaymentRequest](self->_paymentRequest, "recurringPaymentRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v5 = 0;
LABEL_8:

    return v5;
  }
  -[PKPaymentRequest automaticReloadPaymentRequest](self->_paymentRequest, "automaticReloadPaymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[PKPaymentRequest deferredPaymentRequest](self->_paymentRequest, "deferredPaymentRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 == 0;
    goto LABEL_8;
  }
  return 0;
}

- (id)automaticallyPresentedPassFromAcceptedPasses:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PKPaymentRequest originatingURL](self->_paymentRequest, "originatingURL");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((uint64_t)self->_hostApplicationIdentifier | v6)
  {
    v24 = v5;
    v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (!v8)
      goto LABEL_19;
    v9 = v8;
    v10 = *(_QWORD *)v27;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (v6)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "associatedWebDomains");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v6, "host");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "containsObject:", v14) & 1) != 0)
          {
            v15 = objc_msgSend(v12, "settings");

            if ((v15 & 0x10) != 0)
              goto LABEL_15;
          }
          else
          {

          }
        }
        if (!self->_hostApplicationIdentifier)
          continue;
        objc_msgSend(v12, "associatedApplicationIdentifiers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "containsObject:", self->_hostApplicationIdentifier) & 1) != 0)
        {
          v17 = objc_msgSend(v12, "settings");

          if ((v17 & 0x10) == 0)
            continue;
LABEL_15:
          -[NSObject addObject:](v25, "addObject:", v12, v24);
          continue;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (!v9)
      {
LABEL_19:

        v18 = v25;
        if (-[NSObject count](v25, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("ingestedDate"), 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v19;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject sortUsingDescriptors:](v25, "sortUsingDescriptors:", v20);

          -[NSObject firstObject](v25, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v21 = 0;
        }
        v5 = v24;
        goto LABEL_26;
      }
    }
  }
  PKLogFacilityTypeGetObject(0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v22;
    _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Warning: %@ requested without a valid hostApplicationIdentifier or web domain. This is likely not what you want!", buf, 0xCu);

  }
  v21 = 0;
LABEL_26:

  return v21;
}

- (void)setUpdateHandler:(id)a3
{
  void *v4;
  id updateHandler;

  v4 = (void *)objc_msgSend(a3, "copy");
  updateHandler = self->_updateHandler;
  self->_updateHandler = v4;

}

- (void)beginUpdates
{
  ++self->_holdPendingUpdatesCount;
}

- (void)endUpdates
{
  unint64_t holdPendingUpdatesCount;
  void (**updateHandler)(void);

  holdPendingUpdatesCount = self->_holdPendingUpdatesCount;
  if (holdPendingUpdatesCount)
  {
    self->_holdPendingUpdatesCount = holdPendingUpdatesCount - 1;
    updateHandler = (void (**)(void))self->_updateHandler;
    if (updateHandler)
      updateHandler[2]();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("No matching beginUpdates"));
  }
}

- (id)itemForType:(int64_t)a3
{
  NSMutableDictionary *typeToItemMap;
  void *v4;
  void *v5;

  typeToItemMap = self->_typeToItemMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](typeToItemMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setDataItem:(id)a3
{
  void *v4;
  NSMutableDictionary *typeToItemMap;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "supportsMultipleItems") & 1) == 0)
  {
    -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", objc_msgSend(v7, "type"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[PKPaymentAuthorizationDataModel _removeDataItem:](self, "_removeDataItem:", v4);
    typeToItemMap = self->_typeToItemMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](typeToItemMap, "setObject:forKey:", v7, v6);

  }
  -[NSMutableArray insertObject:atIndex:](self->_items, "insertObject:atIndex:", v7, -[PKPaymentAuthorizationDataModel _insertionIndexForItem:](self, "_insertionIndexForItem:", v7));

}

- (void)_setPaymentContentDataItems:(id)a3
{
  NSMutableArray *items;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  items = self->_items;
  v5 = a3;
  -[NSMutableArray indexesOfObjectsPassingTest:](items, "indexesOfObjectsPassingTest:", &__block_literal_global_91);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsAtIndexes:](self->_items, "removeObjectsAtIndexes:", v9);
  v6 = objc_alloc(MEMORY[0x1E0CB36B8]);
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithIndexesInRange:", -[PKPaymentAuthorizationDataModel _insertionIndexForItem:](self, "_insertionIndexForItem:", v7), objc_msgSend(v5, "count"));

  -[NSMutableArray insertObjects:atIndexes:](self->_items, "insertObjects:atIndexes:", v5, v8);
}

BOOL __63__PKPaymentAuthorizationDataModel__setPaymentContentDataItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 1;
}

- (unint64_t)_insertionIndexForItem:(id)a3
{
  NSMutableArray *items;
  id v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[5];

  items = self->_items;
  v5 = a3;
  v6 = -[NSMutableArray count](items, "count");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__PKPaymentAuthorizationDataModel__insertionIndexForItem___block_invoke;
  v9[3] = &unk_1E2AC5D20;
  v9[4] = self;
  v7 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](items, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, v6, 1024, v9);

  return v7;
}

uint64_t __58__PKPaymentAuthorizationDataModel__insertionIndexForItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "_displayOrderForDataType:", objc_msgSend(a2, "type"));
  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(v6, "type");

  v10 = objc_msgSend(v8, "_displayOrderForDataType:", v9);
  if (v7 < v10)
    return -1;
  else
    return v7 != v10;
}

- (int64_t)_displayOrderForDataType:(int64_t)a3
{
  int64_t result;

  switch(a3)
  {
    case 1:
      result = 2;
      break;
    case 2:
      if (-[PKPaymentRequest requestType](self->_paymentRequest, "requestType") == 1)
        result = 0x7FFFFFFFFFFFFFFFLL;
      else
        result = 0;
      break;
    case 3:
      if (-[PKPaymentRequest requestType](self->_paymentRequest, "requestType") == 1)
        result = 0x7FFFFFFFFFFFFFFFLL;
      else
        result = 1;
      break;
    case 4:
      result = 5;
      break;
    case 5:
      result = 7;
      break;
    case 6:
      result = 8;
      break;
    case 7:
      result = 9;
      break;
    case 8:
      result = 13;
      break;
    case 9:
      result = 3;
      break;
    case 10:
      result = 4;
      break;
    case 11:
      result = 10;
      break;
    case 12:
      result = 6;
      break;
    case 13:
      result = 11;
      break;
    default:
      result = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }
  return result;
}

- (NSString)defaultPaymentPassUniqueIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PKPaymentAuthorizationDataModel paymentRequest](self, "paymentRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_defaultPaymentPassForPaymentRequest:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)_ensureItems
{
  int64_t mode;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  PKPaymentAuthorizationDataModel *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  PKPaymentRequest *paymentRequest;
  void *v48;
  void *v49;
  void *v50;
  PKPaymentRequest *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  char v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  PKPaymentPass *v67;
  PKPaymentPass *peerPaymentPass;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  PKPaymentPass *v73;
  void *v74;
  void *v75;
  void *v76;
  PKPaymentPass *v77;
  PKPaymentPass *v78;
  PKPaymentPass *v79;
  void *v80;
  void *v81;
  _BOOL4 v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t i;
  void *v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  int v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id obj;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD v110[4];
  id v111;
  _QWORD v112[4];
  id v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationDataModel _ensurePlaceholderItems](self, "_ensurePlaceholderItems");
  mode = self->_mode;
  if (mode != 3)
  {
    if (mode != 1)
      goto LABEL_36;
    if (-[PKPaymentRequest requestType](self->_paymentRequest, "requestType") == 1)
    {
      -[PKPaymentRequest passTypeIdentifier](self->_paymentRequest, "passTypeIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRequest passSerialNumber](self->_paymentRequest, "passSerialNumber");
      v5 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "length") && objc_msgSend((id)v5, "length"))
      {
        -[PKPaymentAuthorizationDataModel library](self, "library");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "passWithPassTypeIdentifier:serialNumber:", v4, v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "paymentPass");
        v8 = objc_claimAutoreleasedReturnValue();

        if (v8)
          -[PKPaymentAuthorizationDataModel setPass:](self, "setPass:", v8);
LABEL_31:

        if (!-[PKPaymentRequest _isAMPPayment](self->_paymentRequest, "_isAMPPayment"))
        {
          v28 = -[PKPaymentRequest requestType](self->_paymentRequest, "requestType");
          if (v28 > 5 || ((1 << v28) & 0x2C) == 0)
            goto LABEL_36;
        }
        goto LABEL_34;
      }
      -[PKPaymentAuthorizationDataModel library](self, "library");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "defaultPaymentPassesWithRemotePasses:", 0);
      v8 = objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend((id)v8, "count"))
        goto LABEL_31;
      objc_msgSend((id)v8, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel setPass:](self, "setPass:", v13);
    }
    else
    {
      -[PKPaymentAuthorizationDataModel acceptedPasses](self, "acceptedPasses");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PKPaymentRequest isPayLaterPaymentRequest](self->_paymentRequest, "isPayLaterPaymentRequest"))
      {
        -[PKPaymentRequest payLaterPaymentRequest](self->_paymentRequest, "payLaterPaymentRequest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "defaultBankAccount");
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "defaultPassUniqueID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v112[0] = MEMORY[0x1E0C809B0];
          v112[1] = 3221225472;
          v112[2] = __47__PKPaymentAuthorizationDataModel__ensureItems__block_invoke;
          v112[3] = &unk_1E2AC44F0;
          v113 = v10;
          objc_msgSend(v4, "pk_firstObjectPassingTest:", v112);
          v5 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v5 = 0;
        }

      }
      else
      {
        v8 = 0;
        v5 = 0;
      }
      if (-[PKPaymentRequest isVirtualCardRequest](self->_paymentRequest, "isVirtualCardRequest")
        || (-[PKPaymentRequest peerPaymentRequest](self->_paymentRequest, "peerPaymentRequest"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v14, "peerPaymentQuote"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v15, "isRecurringPayment"),
            v15,
            v14,
            v16))
      {
        -[PKPaymentRequest passSerialNumber](self->_paymentRequest, "passSerialNumber");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          v110[0] = MEMORY[0x1E0C809B0];
          v110[1] = 3221225472;
          v110[2] = __47__PKPaymentAuthorizationDataModel__ensureItems__block_invoke_2;
          v110[3] = &unk_1E2AC44F0;
          v111 = v17;
          objc_msgSend(v4, "pk_firstObjectPassingTest:", v110);
          v19 = objc_claimAutoreleasedReturnValue();

          v5 = v19;
        }

      }
      if (-[PKPaymentRequest isServiceProviderPaymentRequest](self->_paymentRequest, "isServiceProviderPaymentRequest"))
      {
        -[PKPaymentRequest serviceProviderOrder](self->_paymentRequest, "serviceProviderOrder");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "serviceProviderData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "objectForKey:", CFSTR("primaryAccountIdentifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentAuthorizationDataModel library](self, "library");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "passWithFPANIdentifier:", v22);
        v24 = objc_claimAutoreleasedReturnValue();

        v5 = v24;
      }
      if (!(v5 | v8))
      {
        objc_msgSend(v4, "pk_firstObjectPassingTest:", &__block_literal_global_95);
        v5 = objc_claimAutoreleasedReturnValue();
      }
      -[PKPaymentAuthorizationDataModel automaticallyPresentedPassFromAcceptedPasses:](self, "automaticallyPresentedPassFromAcceptedPasses:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[PKPaymentAuthorizationDataModel setPass:](self, "setPass:", v13);
        v25 = self;
        v26 = v13;
      }
      else
      {
        if (!v5)
        {
          if (v8)
          {
            -[PKPaymentAuthorizationDataModel setBankAccount:](self, "setBankAccount:", v8);
          }
          else if (self->_supportsEmptyPass)
          {
            -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
            -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
          }
          goto LABEL_30;
        }
        -[PKPaymentAuthorizationDataModel setPass:](self, "setPass:", v5);
        v25 = self;
        v26 = (void *)v5;
      }
      -[PKPaymentAuthorizationDataModel defaultSelectedPaymentApplicationForPass:](v25, "defaultSelectedPaymentApplicationForPass:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel setPaymentApplication:](self, "setPaymentApplication:", v27);

    }
LABEL_30:

    goto LABEL_31;
  }
LABEL_34:
  -[PKPaymentRequest paymentContentItems](self->_paymentRequest, "paymentContentItems");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");

  if (v30)
  {
    -[PKPaymentRequest paymentContentItems](self->_paymentRequest, "paymentContentItems");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel setPaymentContentItems:](self, "setPaymentContentItems:", v31);

  }
LABEL_36:
  -[PKPaymentRequest recurringPaymentRequest](self->_paymentRequest, "recurringPaymentRequest");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel setRecurringPaymentRequest:](self, "setRecurringPaymentRequest:", v32);

  -[PKPaymentRequest automaticReloadPaymentRequest](self->_paymentRequest, "automaticReloadPaymentRequest");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel setAutomaticReloadPaymentRequest:](self, "setAutomaticReloadPaymentRequest:", v33);

  -[PKPaymentRequest deferredPaymentRequest](self->_paymentRequest, "deferredPaymentRequest");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel setDeferredPaymentRequest:](self, "setDeferredPaymentRequest:", v34);

  -[PKPaymentRequest multiTokenContexts](self->_paymentRequest, "multiTokenContexts");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel setMultiTokenContexts:](self, "setMultiTokenContexts:", v35);

  if (-[PKPaymentRequest supportsCouponCode](self->_paymentRequest, "supportsCouponCode"))
  {
    -[PKPaymentRequest couponCode](self->_paymentRequest, "couponCode");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel setCouponCode:](self, "setCouponCode:", v36);

  }
  -[PKPaymentRequest availableShippingMethods](self->_paymentRequest, "availableShippingMethods");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "methods");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "count");

  if (v39)
  {
    -[PKPaymentRequest availableShippingMethods](self->_paymentRequest, "availableShippingMethods");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "defaultMethod");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel setShippingMethod:](self, "setShippingMethod:", v41);

  }
  PKShippingTypeToString(-[PKPaymentRequest shippingType](self->_paymentRequest, "shippingType"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel setShippingType:](self, "setShippingType:", v42);

  -[PKPaymentAuthorizationDataModel setShippingEditable:](self, "setShippingEditable:", -[PKPaymentRequest isShippingEditable](self->_paymentRequest, "isShippingEditable"));
  -[PKPaymentRequest shippingEditableMessage](self->_paymentRequest, "shippingEditableMessage");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel setShippingEditableMessage:](self, "setShippingEditableMessage:", v43);

  -[PKPaymentRequest requiredBillingContactFields](self->_paymentRequest, "requiredBillingContactFields");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "containsObject:", CFSTR("post"));

  if (v45)
  {
    -[PKPaymentRequest billingContact](self->_paymentRequest, "billingContact");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    paymentRequest = self->_paymentRequest;
    if (v46)
    {
      -[PKPaymentRequest billingContact](paymentRequest, "billingContact");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "cnMutableContact");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (-[PKPaymentRequest billingAddress](paymentRequest, "billingAddress"))
    {
      objc_msgSend(MEMORY[0x1E0C97200], "contactWithABRecordRef:", -[PKPaymentRequest billingAddress](self->_paymentRequest, "billingAddress"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = 0;
    }
    -[PKPaymentAuthorizationDataModel setBillingAddress:](self, "setBillingAddress:", v49);

  }
  -[PKPaymentRequest shippingContact](self->_paymentRequest, "shippingContact");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = self->_paymentRequest;
  if (v50)
  {
    -[PKPaymentRequest shippingContact](v51, "shippingContact");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "cnMutableContact");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "setContactSource:", 4);
  }
  else if (-[PKPaymentRequest shippingAddress](v51, "shippingAddress"))
  {
    objc_msgSend(MEMORY[0x1E0C97200], "contactWithABRecordRef:", -[PKPaymentRequest shippingAddress](self->_paymentRequest, "shippingAddress"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v53 = 0;
  }
  -[PKPaymentRequest requiredShippingContactFields](self->_paymentRequest, "requiredShippingContactFields");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v54, "containsObject:", CFSTR("post")) & 1) != 0)
  {
    objc_msgSend(v53, "postalAddresses");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "count");

    if (v56)
      -[PKPaymentAuthorizationDataModel setShippingAddress:](self, "setShippingAddress:", v53);
  }
  else
  {

  }
  -[PKPaymentRequest requiredShippingContactFields](self->_paymentRequest, "requiredShippingContactFields");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v57, "containsObject:", CFSTR("email")) & 1) != 0)
  {
    objc_msgSend(v53, "emailAddresses");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v54, "count");

    if (v58)
      -[PKPaymentAuthorizationDataModel setShippingEmail:](self, "setShippingEmail:", v53);
  }
  else
  {

  }
  -[PKPaymentRequest requiredShippingContactFields](self->_paymentRequest, "requiredShippingContactFields");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v59, "containsObject:", CFSTR("phone")) & 1) != 0)
  {
    objc_msgSend(v53, "phoneNumbers");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v54, "count");

    if (v60)
      -[PKPaymentAuthorizationDataModel setShippingPhone:](self, "setShippingPhone:", v53);
  }
  else
  {

  }
  -[PKPaymentRequest requiredShippingContactFields](self->_paymentRequest, "requiredShippingContactFields");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "containsObject:", CFSTR("name"));
  if ((v62 & 1) != 0
    || (-[PKPaymentRequest requiredShippingContactFields](self->_paymentRequest, "requiredShippingContactFields"),
        v54 = (void *)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v54, "containsObject:", CFSTR("phoneticName")) & 1) != 0))
  {
    -[PKPaymentRequest shippingContact](self->_paymentRequest, "shippingContact");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "name");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v62 & 1) == 0)
    if (v64)
      -[PKPaymentAuthorizationDataModel setShippingName:](self, "setShippingName:", v53);
  }
  else
  {

  }
  if (-[PKPaymentRequest isPeerPaymentRequest](self->_paymentRequest, "isPeerPaymentRequest"))
  {
    +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAccount associatedPassUniqueID](self->_peerPaymentAccount, "associatedPassUniqueID");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "passWithUniqueID:", v66);
    v67 = (PKPaymentPass *)objc_claimAutoreleasedReturnValue();
    peerPaymentPass = self->_peerPaymentPass;
    self->_peerPaymentPass = v67;

    -[PKPaymentRequest peerPaymentRequest](self->_paymentRequest, "peerPaymentRequest");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "peerPaymentQuote");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKPeerPaymentAccount supportsPreserveCurrentBalance](self->_peerPaymentAccount, "supportsPreserveCurrentBalance"))
    {
      objc_msgSend(v70, "recipient");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (v71)
        v72 = 1;
      else
        v72 = objc_msgSend(v69, "hasUndeterminedRecipient");
      self->_supportsPreservePeerPaymentBalance = v72;

      if (self->_supportsPreservePeerPaymentBalance)
        self->_usePeerPaymentBalance = (-[PKObject settings](self->_peerPaymentPass, "settings") & 0x800) == 0;
    }
    else
    {
      self->_supportsPreservePeerPaymentBalance = 0;
    }
    v73 = self->_peerPaymentPass;
    -[PKPeerPaymentAccount currentBalance](self->_peerPaymentAccount, "currentBalance");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setPeerPaymentBalance:](v73, "setPeerPaymentBalance:", v74);

    -[PKPaymentAuthorizationDataModel setPeerPaymentQuote:](self, "setPeerPaymentQuote:", v70);
  }
  if (-[PKPaymentRequest requestType](self->_paymentRequest, "requestType") == 2
    && -[PKPaymentRequest accountPaymentSupportsPeerPayment](self->_paymentRequest, "accountPaymentSupportsPeerPayment"))
  {
    +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAccount associatedPassUniqueID](self->_peerPaymentAccount, "associatedPassUniqueID");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "passWithUniqueID:", v76);
    v77 = (PKPaymentPass *)objc_claimAutoreleasedReturnValue();
    v78 = self->_peerPaymentPass;
    self->_peerPaymentPass = v77;

    v79 = self->_peerPaymentPass;
    -[PKPeerPaymentAccount currentBalance](self->_peerPaymentAccount, "currentBalance");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setPeerPaymentBalance:](v79, "setPeerPaymentBalance:", v80);

    -[PKSecureElementPass peerPaymentBalance](self->_peerPaymentPass, "peerPaymentBalance");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = -[PKPaymentRequest accountPaymentUsePeerPaymentBalance](self->_paymentRequest, "accountPaymentUsePeerPaymentBalance");
    self->_usePeerPaymentBalance = v82;
    if (v82)
      -[PKPaymentAuthorizationDataModel setPeerPaymentBalanceForAccountPayment:](self, "setPeerPaymentBalanceForAccountPayment:", v81);

  }
  if (-[PKPaymentRequest requestType](self->_paymentRequest, "requestType") == 2)
  {
    -[PKPaymentRequest bankAccounts](self->_paymentRequest, "bankAccounts");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v83, "count");

    if (v84)
    {
      -[PKPaymentRequest bankAccounts](self->_paymentRequest, "bankAccounts");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRequest accountServiceTransferRequest](self->_paymentRequest, "accountServiceTransferRequest");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v86;
      if (!v86 || (objc_msgSend(v86, "defaultBankAccount"), (v88 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(v85, "firstObject");
        v88 = (id)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v85, "count") >= 2)
        {
          PKSharedCacheGetStringForKey(CFSTR("LastBankAccountIdentifier"));
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v89, "length"))
          {
            v108 = 0u;
            v109 = 0u;
            v106 = 0u;
            v107 = 0u;
            obj = v85;
            v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
            if (v90)
            {
              v91 = v90;
              v102 = v88;
              v103 = v87;
              v104 = v85;
              v92 = *(_QWORD *)v107;
              while (2)
              {
                for (i = 0; i != v91; ++i)
                {
                  if (*(_QWORD *)v107 != v92)
                    objc_enumerationMutation(obj);
                  v94 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
                  objc_msgSend(v94, "identifier", v102);
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  v96 = v89;
                  v97 = v95;
                  if (v96 == v97)
                  {

LABEL_106:
                    v88 = v94;

                    v87 = v103;
                    v85 = v104;
                    goto LABEL_107;
                  }
                  v98 = v97;
                  if (v89 && v97)
                  {
                    v99 = objc_msgSend(v96, "isEqualToString:", v97);

                    if (v99)
                      goto LABEL_106;
                  }
                  else
                  {

                  }
                }
                v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
                if (v91)
                  continue;
                break;
              }
              v87 = v103;
              v85 = v104;
              v88 = v102;
            }
LABEL_107:

          }
        }
      }
      -[PKPaymentAuthorizationDataModel setBankAccount:](self, "setBankAccount:", v88);
      -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", 9);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSecureElementPass peerPaymentBalance](self->_peerPaymentPass, "peerPaymentBalance");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "setPeerPaymentBalance:", v101);

    }
  }
  if (-[PKPaymentRequest requestType](self->_paymentRequest, "requestType") == 2)
    -[PKPaymentAuthorizationDataModel setPaymentDateForPaymentRequest:](self, "setPaymentDateForPaymentRequest:", self->_paymentRequest);
  -[PKPaymentAuthorizationDataModel _updatePeerPaymentPromotionAvailability](self, "_updatePeerPaymentPromotionAvailability");

}

uint64_t __47__PKPaymentAuthorizationDataModel__ensureItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

uint64_t __47__PKPaymentAuthorizationDataModel__ensureItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "serialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

uint64_t __47__PKPaymentAuthorizationDataModel__ensureItems__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPayLaterPass") ^ 1;
}

- (void)refreshPaymentMethods
{
  NSArray *unavailablePasses;
  NSArray *acceptedPasses;

  unavailablePasses = self->_unavailablePasses;
  self->_unavailablePasses = 0;

  acceptedPasses = self->_acceptedPasses;
  self->_acceptedPasses = 0;

  -[PKPayLaterFinancingController refreshAvailableFundingSources](self->_financingController, "refreshAvailableFundingSources");
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

- (void)refreshPaymentMethodsAndNotifyFinancingController:(BOOL)a3
{
  _BOOL4 v3;
  NSArray *unavailablePasses;
  NSArray *acceptedPasses;

  v3 = a3;
  unavailablePasses = self->_unavailablePasses;
  self->_unavailablePasses = 0;

  acceptedPasses = self->_acceptedPasses;
  self->_acceptedPasses = 0;

  if (v3)
    -[PKPayLaterFinancingController refreshAvailableFundingSources](self->_financingController, "refreshAvailableFundingSources");
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

- (void)_updatePeerPaymentPromotionAvailability
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  if (-[PKPaymentRequest requestType](self->_paymentRequest, "requestType"))
    v3 = -[PKPaymentRequest requestType](self->_paymentRequest, "requestType") != 11;
  else
    v3 = 0;
  if (self->_mode == 1
    && !v3
    && !-[PKPaymentRequest isPeerPaymentRequest](self->_paymentRequest, "isPeerPaymentRequest")
    && self->_peerPaymentPass)
  {
    -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", +[PKPaymentCardDataItem dataType](PKPaymentCardDataItem, "dataType"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!-[PKPeerPaymentAccount supportsCardBalancePromotion](self->_peerPaymentAccount, "supportsCardBalancePromotion"))
    {
LABEL_12:
      objc_msgSend(v22, "setShowPeerPaymentBalance:", 0);
LABEL_20:

      return;
    }
    -[PKObject uniqueID](self->_pass, "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKObject uniqueID](self->_peerPaymentPass, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 && v5)
    {
      v7 = objc_msgSend(v4, "isEqual:", v5);

      if ((v7 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

      if (v4 == v6)
        goto LABEL_12;
    }
    -[PKSecureElementPass peerPaymentBalance](self->_peerPaymentPass, "peerPaymentBalance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest paymentSummaryItems](self->_paymentRequest, "paymentSummaryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v10, "type"))
    {
      objc_msgSend(v8, "currency");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRequest currencyCode](self->_paymentRequest, "currencyCode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "caseInsensitiveCompare:", v12))
      {

      }
      else
      {
        objc_msgSend(v8, "amount");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "amount");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "compare:", v14);

        if (v15 != -1)
        {
          objc_msgSend(MEMORY[0x1E0CB3598], "zero");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "amount");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "compare:", v17);

          objc_msgSend(v22, "setShowPeerPaymentBalance:", v18 == -1);
          objc_msgSend(v22, "setPeerPaymentBalance:", v8);
          if (v18 == -1)
          {
            if (-[PKPaymentRequest isPayLaterPaymentRequest](self->_paymentRequest, "isPayLaterPaymentRequest"))
            {
              -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", +[PKBankAccountDataItem dataType](PKBankAccountDataItem, "dataType"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPaymentRequest payLaterPaymentRequest](self->_paymentRequest, "payLaterPaymentRequest");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "showPeerPaymentBalance");
              objc_msgSend(v22, "setShowPeerPaymentBalance:", v21);
              objc_msgSend(v19, "setShowPeerPaymentBalance:", v21);

            }
          }
          goto LABEL_19;
        }
      }
    }
    objc_msgSend(v22, "setShowPeerPaymentBalance:", 0);
    objc_msgSend(v22, "setPeerPaymentBalance:", v8);
LABEL_19:

    goto LABEL_20;
  }
}

- (void)updatePeerPaymentPromotionForPeerPaymentQuote:(BOOL)a3
{
  PKPeerPaymentQuote *peerPaymentQuote;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;

  if (self->_supportsPreservePeerPaymentBalance)
  {
    peerPaymentQuote = self->_peerPaymentQuote;
    if (peerPaymentQuote)
    {
      v5 = a3;
      -[PKPeerPaymentQuote recipient](peerPaymentQuote, "recipient");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {

      }
      else
      {
        -[PKPaymentRequest peerPaymentRequest](self->_paymentRequest, "peerPaymentRequest");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "hasUndeterminedRecipient");

        if (!v8)
          return;
      }
      -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", +[PKPaymentCardDataItem dataType](PKPaymentCardDataItem, "dataType"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (-[PKPeerPaymentAccount supportsCardBalancePromotion](self->_peerPaymentAccount, "supportsCardBalancePromotion"))
      {
        -[PKSecureElementPass peerPaymentBalance](self->_peerPaymentPass, "peerPaymentBalance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0CB3598], "zero");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "amount");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "compare:", v11) == -1;

        }
        else
        {
          v12 = 0;
        }
        objc_msgSend(v13, "setShowPeerPaymentBalance:", v5 & v12);
        objc_msgSend(v13, "setPeerPaymentBalance:", v9);

      }
      else
      {
        objc_msgSend(v13, "setShowPeerPaymentBalance:", 0);
      }

    }
  }
}

- (BOOL)shouldShowPeerPaymentBalanceToggle
{
  PKPeerPaymentQuote *peerPaymentQuote;
  void *v4;
  char v5;
  void *v6;

  if (!self->_supportsPreservePeerPaymentBalance)
    return 0;
  peerPaymentQuote = self->_peerPaymentQuote;
  if (!peerPaymentQuote)
    return 0;
  -[PKPeerPaymentQuote recipient](peerPaymentQuote, "recipient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[PKPaymentRequest peerPaymentRequest](self->_paymentRequest, "peerPaymentRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "hasUndeterminedRecipient");

  }
  return v5;
}

- (id)enhancedMerchantInfoForPass:(id)a3
{
  PKAccountEnhancedMerchant *v4;

  if (objc_msgSend(a3, "isAppleCardPass"))
    v4 = self->_appleCardEnhancedMerchant;
  else
    v4 = 0;
  return v4;
}

- (void)setEnhancedMerchantInfo:(id)a3 forPass:(id)a4
{
  PKAccountEnhancedMerchant *v7;
  PKAccountEnhancedMerchant *appleCardEnhancedMerchant;
  _QWORD block[5];

  v7 = (PKAccountEnhancedMerchant *)a3;
  if (objc_msgSend(a4, "isAppleCardPass"))
  {
    appleCardEnhancedMerchant = self->_appleCardEnhancedMerchant;
    if (v7 && appleCardEnhancedMerchant)
    {
      if (-[PKAccountEnhancedMerchant isEqual:](appleCardEnhancedMerchant, "isEqual:", v7))
        goto LABEL_8;
      goto LABEL_7;
    }
    if (appleCardEnhancedMerchant != v7)
    {
LABEL_7:
      objc_storeStrong((id *)&self->_appleCardEnhancedMerchant, a3);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__PKPaymentAuthorizationDataModel_setEnhancedMerchantInfo_forPass___block_invoke;
      block[3] = &unk_1E2ABE120;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
LABEL_8:

}

uint64_t __67__PKPaymentAuthorizationDataModel_setEnhancedMerchantInfo_forPass___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyModelChanged");
}

- (void)_didSetItemForClass:(Class)a3
{
  id v5;

  -[PKPaymentAuthorizationDataModel _ensureItemForClass:](self, "_ensureItemForClass:");
  -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", -[objc_class dataType](a3, "dataType"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "status") == 1)
    -[PKPaymentAuthorizationDataModel setStatus:forItemWithType:notify:](self, "setStatus:forItemWithType:notify:", 0, objc_msgSend(v5, "type"), 0);

}

- (void)_ensureItemForClass:(Class)a3
{
  void *v5;
  id v6;

  -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", -[objc_class dataType](a3, "dataType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (id)objc_msgSend([a3 alloc], "initWithModel:", self);
    -[PKPaymentAuthorizationDataModel _setDataItem:](self, "_setDataItem:", v6);
    v5 = v6;
  }

}

- (void)_removeDataItem:(id)a3
{
  NSMutableArray *items;
  id v5;
  NSMutableDictionary *typeToItemMap;
  void *v7;
  uint64_t v8;
  id v9;

  if (a3)
  {
    items = self->_items;
    v5 = a3;
    -[NSMutableArray removeObject:](items, "removeObject:", v5);
    typeToItemMap = self->_typeToItemMap;
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = objc_msgSend(v5, "type");

    objc_msgSend(v7, "numberWithInteger:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](typeToItemMap, "removeObjectForKey:", v9);

  }
}

- (void)_ensurePaymentContentItems
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PKPaymentContentDataItem *v10;
  PKPaymentContentDataItem *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_paymentContentItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = [PKPaymentContentDataItem alloc];
        v11 = -[PKPaymentContentDataItem initWithContentItem:](v10, "initWithContentItem:", v9, (_QWORD)v12);
        -[PKPaymentDataItem setStatus:](v11, "setStatus:", 0);
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[PKPaymentAuthorizationDataModel _setPaymentContentDataItems:](self, "_setPaymentContentDataItems:", v3);
}

- (void)_ensurePlaceholderItems
{
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;

  -[PKPaymentRequest requiredShippingContactFields](self->_paymentRequest, "requiredShippingContactFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("post"));

  if (v4)
    -[PKPaymentAuthorizationDataModel _ensureItemForClass:](self, "_ensureItemForClass:", objc_opt_class());
  if (-[PKPaymentAuthorizationDataModel shouldUpdateContactDataItem](self, "shouldUpdateContactDataItem"))
    -[PKPaymentAuthorizationDataModel _ensureItemForClass:](self, "_ensureItemForClass:", objc_opt_class());
  -[PKPaymentRequest paymentSummaryItems](self->_paymentRequest, "paymentSummaryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 2)
    -[PKPaymentAuthorizationDataModel _ensureItemForClass:](self, "_ensureItemForClass:", objc_opt_class());
}

- (void)_notifyModelChanged
{
  void (**updateHandler)(void);

  updateHandler = (void (**)(void))self->_updateHandler;
  if (updateHandler)
  {
    if (!self->_holdPendingUpdatesCount)
      updateHandler[2]();
  }
}

- (id)_additionalEligiblePaymentPassesForPaymentRequest:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v10[16];

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_financingController && _os_feature_enabled_impl())
  {
    v5 = -[PKPayLaterFinancingController payLaterPassEligibility](self->_financingController, "payLaterPassEligibility");
    -[PKPayLaterFinancingController payLaterPass](self->_financingController, "payLaterPass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (v5 == 4 || v5 == 1))
    {
      PKLogFacilityTypeGetObject(7uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Adding pay later pass to accepted passes array", v10, 2u);
      }

      objc_msgSend(v4, "safelyAddObject:", v6);
    }

  }
  if (objc_msgSend(v4, "count"))
    v8 = (void *)objc_msgSend(v4, "copy");
  else
    v8 = 0;

  return v8;
}

- (id)_inAppPaymentPassesForPaymentRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PKPaymentAuthorizationDataModel _additionalEligiblePaymentPassesForPaymentRequest:](self, "_additionalEligiblePaymentPassesForPaymentRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel library](self, "library");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sortedPaymentPassesForPaymentRequest:additionalPaymentPasses:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentAuthorizationDataModel _filterAndProcessPaymentPassesUsingConfiguration:additionalPaymentPasses:](self, "_filterAndProcessPaymentPassesUsingConfiguration:additionalPaymentPasses:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_inAppPrivateLabelPaymentPasses
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *hostApplicationIdentifier;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!self->_hostApplicationIdentifier)
  {
    -[PKPaymentRequest originatingURL](self->_paymentRequest, "originatingURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      PKLogFacilityTypeGetObject(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Warning: %@ requested without a valid hostApplicationIdentifier. This is likely not what you want!", buf, 0xCu);

      }
    }
  }
  -[PKPaymentRequest originatingURL](self->_paymentRequest, "originatingURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentAuthorizationDataModel library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PKPaymentRequest originatingURL](self->_paymentRequest, "originatingURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest supportedCountries](self->_paymentRequest, "supportedCountries");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inAppPrivateLabelPaymentPassesForWebDomain:issuerCountryCodes:isMultiTokensRequest:", v10, v11, -[PKPaymentRequest isMultiTokenRequest](self->_paymentRequest, "isMultiTokenRequest"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    hostApplicationIdentifier = self->_hostApplicationIdentifier;
    -[PKPaymentRequest supportedCountries](self->_paymentRequest, "supportedCountries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inAppPrivateLabelPaymentPassesForApplicationIdentifier:issuerCountryCodes:isMultiTokensRequest:", hostApplicationIdentifier, v9, -[PKPaymentRequest isMultiTokenRequest](self->_paymentRequest, "isMultiTokenRequest"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("ingestedDate"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingDescriptors:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentAuthorizationDataModel _filterAndProcessPaymentPassesUsingConfiguration:additionalPaymentPasses:](self, "_filterAndProcessPaymentPassesUsingConfiguration:additionalPaymentPasses:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_filterAndProcessPaymentApplicationsUsingConfiguration:(id)a3 withPrimaryPaymentApplication:(id)a4 passHasAssociatedPeerPaymentAccount:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  PKPaymentWebService *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  if (-[PKPaymentRequest isPayLaterPaymentRequest](self->_paymentRequest, "isPayLaterPaymentRequest"))
    v11 = !v5;
  else
    v11 = 1;
  v12 = MEMORY[0x1E0C809B0];
  if (v11
    || (-[PKPaymentRequest payLaterPaymentRequest](self->_paymentRequest, "payLaterPaymentRequest"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "supportedRepaymentTypes"),
        v13,
        v15 = v10,
        (v14 & 4) == 0))
  {
    v36[0] = v12;
    v36[1] = 3221225472;
    v36[2] = __156__PKPaymentAuthorizationDataModel__filterAndProcessPaymentApplicationsUsingConfiguration_withPrimaryPaymentApplication_passHasAssociatedPeerPaymentAccount___block_invoke;
    v36[3] = &unk_1E2AC5D68;
    v36[4] = self;
    objc_msgSend(v10, "pk_objectsPassingTest:", v36);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PKPaymentRequest originatingURL](self->_paymentRequest, "originatingURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = self->_paymentWebService;
    -[PKPaymentWebService context](v17, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unsupportedWebPaymentConfigurations");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v34[0] = v12;
    v34[1] = 3221225472;
    v34[2] = __156__PKPaymentAuthorizationDataModel__filterAndProcessPaymentApplicationsUsingConfiguration_withPrimaryPaymentApplication_passHasAssociatedPeerPaymentAccount___block_invoke_2;
    v34[3] = &unk_1E2AC5D90;
    v34[4] = self;
    v35 = v20;
    v21 = v20;
    objc_msgSend(v15, "pk_objectsPassingTest:", v34);
    v22 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v22;
  }
  -[PKPaymentRequest remoteNetworkRequestPaymentTopicID](self->_paymentRequest, "remoteNetworkRequestPaymentTopicID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    +[PKWebServiceRemoteNetworkPaymentFeature remoteNetworkPaymentFeatureWithWebService:](PKWebServiceRemoteNetworkPaymentFeature, "remoteNetworkPaymentFeatureWithWebService:", self->_paymentWebService);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25 && !objc_msgSend(v25, "enabled"))
    {
      v27 = MEMORY[0x1E0C9AA60];
    }
    else
    {
      v32[0] = v12;
      v32[1] = 3221225472;
      v32[2] = __156__PKPaymentAuthorizationDataModel__filterAndProcessPaymentApplicationsUsingConfiguration_withPrimaryPaymentApplication_passHasAssociatedPeerPaymentAccount___block_invoke_3;
      v32[3] = &unk_1E2AC5D68;
      v33 = v26;
      objc_msgSend(v15, "pk_objectsPassingTest:", v32);
      v27 = objc_claimAutoreleasedReturnValue();

      v15 = v33;
    }

    v15 = (void *)v27;
  }
  PKSortedPaymentApplicationsByAID(v15, v9, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentRequest countryCode](self->_paymentRequest, "countryCode");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  PKSortedPaymentApplicationsBySupportedInAppMerchantCountryCode(v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

uint64_t __156__PKPaymentAuthorizationDataModel__filterAndProcessPaymentApplicationsUsingConfiguration_withPrimaryPaymentApplication_passHasAssociatedPeerPaymentAccount___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "paymentRequestSupportedQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "canProcessPayment:", v4);

  return v5;
}

uint64_t __156__PKPaymentAuthorizationDataModel__filterAndProcessPaymentApplicationsUsingConfiguration_withPrimaryPaymentApplication_passHasAssociatedPeerPaymentAccount___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v4, "supportsWebPaymentMode:withExclusionList:", objc_msgSend(v3, "requestedMode"), *(_QWORD *)(a1 + 40));

  return v5;
}

uint64_t __156__PKPaymentAuthorizationDataModel__filterAndProcessPaymentApplicationsUsingConfiguration_withPrimaryPaymentApplication_passHasAssociatedPeerPaymentAccount___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!*(_QWORD *)(a1 + 32))
    return 1;
  v3 = objc_msgSend(a2, "paymentNetworkIdentifier");
  objc_msgSend(*(id *)(a1 + 32), "unsupportedNetworks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;

  return v6;
}

- (id)_filterAndProcessPaymentPassesUsingConfiguration:(id)a3 additionalPaymentPasses:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  PKPaymentWebService *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  const __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, void *);
  void *v42;
  id v43;
  _QWORD v44[5];
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  uint64_t v50;
  uint8_t buf[4];
  unint64_t v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  v9 = objc_msgSend(v7, "count");
  PKLogFacilityTypeGetObject(7uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v34 = CFSTR("N");
    *(_DWORD *)buf = 134218498;
    v52 = v8;
    if (!v6)
      v34 = CFSTR("Y");
    v53 = 2112;
    v54 = v34;
    v55 = 2048;
    v56 = v9;
    _os_log_debug_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEBUG, "Pass filtering: Passes passed into _filterAndProcessPaymentPassesUsingConfiguration: %ld, isNil: %@, additionalPaymentPasses: %ld", buf, 0x20u);
  }

  objc_msgSend(v7, "pk_arrayByApplyingBlock:", &__block_literal_global_106_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentRequest originatingURL](self->_paymentRequest, "originatingURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v14 = (_QWORD *)&unk_190441000;
  if (v12)
  {
    v15 = v7;
    v16 = self->_paymentWebService;
    -[PKPaymentWebService context](v16, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "unsupportedWebPaymentConfigurations");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_mode == 2)
    {
      v20 = 2;
    }
    else if (self->_remoteDevice)
    {
      v20 = 2;
    }
    else
    {
      v20 = 1;
    }
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke_2;
    v47[3] = &unk_1E2AC5DB8;
    v49 = v19;
    v50 = v20;
    v48 = v11;
    v22 = v19;
    objc_msgSend(v6, "pk_objectsPassingTest:", v47);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v15;
    if (v8 > objc_msgSend(v21, "count"))
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v37 = objc_msgSend(v21, "count");
        *(_DWORD *)buf = 134217984;
        v52 = v8 - v37;
        _os_log_debug_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEBUG, "Pass filtering: Passes removed after payment mode filter: %ld", buf, 0xCu);
      }

    }
    v13 = MEMORY[0x1E0C809B0];
    v14 = &unk_190441000;
  }
  else
  {
    v21 = v6;
  }
  v45[0] = v13;
  v23 = v14[267];
  v45[1] = v23;
  v45[2] = __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke_108;
  v45[3] = &unk_1E2AC59E8;
  v24 = v11;
  v46 = v24;
  objc_msgSend(v21, "pk_objectsPassingTest:", v45);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 > objc_msgSend(v25, "count"))
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v35 = objc_msgSend(v25, "count");
      *(_DWORD *)buf = 134217984;
      v52 = v8 - v35;
      _os_log_debug_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEBUG, "Pass filtering: Passes removed after shell filter: %ld", buf, 0xCu);
    }

  }
  v44[0] = v13;
  v44[1] = v23;
  v44[2] = __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke_109;
  v44[3] = &unk_1E2AC59E8;
  v44[4] = self;
  objc_msgSend(v25, "pk_objectsPassingTest:", v44);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 > objc_msgSend(v26, "count"))
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v36 = objc_msgSend(v26, "count");
      *(_DWORD *)buf = 134217984;
      v52 = v8 - v36;
      _os_log_debug_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEBUG, "Pass filtering: Passes removed after MCC filter: %ld", buf, 0xCu);
    }

  }
  -[PKPaymentRequest remoteNetworkRequestPaymentTopicID](self->_paymentRequest, "remoteNetworkRequestPaymentTopicID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "length");

  if (v28)
  {
    +[PKWebServiceRemoteNetworkPaymentFeature remoteNetworkPaymentFeatureWithWebService:](PKWebServiceRemoteNetworkPaymentFeature, "remoteNetworkPaymentFeatureWithWebService:", self->_paymentWebService);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29 && !objc_msgSend(v29, "enabled"))
    {
      v31 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v39 = v13;
      v40 = v23;
      v41 = __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke_110;
      v42 = &unk_1E2AC59E8;
      v43 = v30;
      objc_msgSend(v26, "pk_objectsPassingTest:", &v39);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = v43;
    }

    if (v8 > objc_msgSend(v31, "count"))
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v38 = objc_msgSend(v31, "count");
        *(_DWORD *)buf = 134217984;
        v52 = v8 - v38;
        _os_log_debug_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEBUG, "Pass filtering: Passes removed after remote network payment filter: %ld", buf, 0xCu);
      }

    }
  }
  else
  {
    v31 = v26;
  }
  -[PKPaymentAuthorizationDataModel _populatePeerPaymentBalanceIfNecessaryForPasses:](self, "_populatePeerPaymentBalanceIfNecessaryForPasses:", v31, v39, v40, v41, v42);
  v32 = v31;

  return v32;
}

uint64_t __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueID");
}

uint64_t __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count")
    && (v4 = *(void **)(a1 + 32),
        objc_msgSend(v3, "uniqueID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5),
        v5,
        (v4 & 1) != 0))
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v3, "supportsWebPaymentMode:withExclusionList:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }

  return v6;
}

uint64_t __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke_108(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v3, "isShellPass") ^ 1 | v6;

  return v7;
}

uint64_t __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke_109(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "canSupportMerchantCategoryCodeAccordingToWebService:forPass:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384), a2);
}

uint64_t __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke_110(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "issuerCountryCode");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "unsupportedIssuerCardCountryCodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)v5;
    v19 = objc_msgSend(v6, "containsObject:", v5);

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "paymentApplications");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      LOBYTE(v10) = 0;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v7);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "paymentNetworkIdentifier");
          if ((v10 & 1) != 0)
          {
            v10 = 1;
          }
          else
          {
            v14 = v13;
            objc_msgSend(*(id *)(a1 + 32), "unsupportedNetworks");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v15, "containsObject:", v16);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    v17 = (v19 | v10) ^ 1u;
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (void)_populatePeerPaymentBalanceIfNecessaryForPasses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPeerPaymentAccount associatedPassSerialNumber](self->_peerPaymentAccount, "associatedPassSerialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_peerPaymentAccount)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __83__PKPaymentAuthorizationDataModel__populatePeerPaymentBalanceIfNecessaryForPasses___block_invoke;
    v12[3] = &unk_1E2AC44F0;
    v13 = v5;
    objc_msgSend(v4, "pk_firstObjectPassingTest:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      PKLogFacilityTypeGetObject(7uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v8;
        _os_log_debug_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEBUG, "Fetching peer payment balance for pass: %@", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_peerPaymentPass, v8);
      -[PKPeerPaymentService balanceForPass:](self->_peerPaymentService, "balanceForPass:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v10, "formattedStringValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v11;
        _os_log_debug_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEBUG, "Obtained peer payment balance: %@", buf, 0xCu);

      }
      objc_msgSend(v8, "setPeerPaymentBalance:", v10);
      -[PKPaymentAuthorizationDataModel _updatePeerPaymentPromotionAvailability](self, "_updatePeerPaymentPromotionAvailability");

    }
  }

}

uint64_t __83__PKPaymentAuthorizationDataModel__populatePeerPaymentBalanceIfNecessaryForPasses___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "serialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (void)_populateFinanceKitBalancesIfNecessaryForPasses:(id)a3
{
  id v4;
  NSObject *balancesProviderQueue;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (PKBankConnectEnabled())
  {
    objc_initWeak(&location, self);
    balancesProviderQueue = self->_balancesProviderQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__PKPaymentAuthorizationDataModel__populateFinanceKitBalancesIfNecessaryForPasses___block_invoke;
    block[3] = &unk_1E2ABE7B0;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_async(balancesProviderQueue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __83__PKPaymentAuthorizationDataModel__populateFinanceKitBalancesIfNecessaryForPasses___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = objc_alloc_init((Class)getFKBankConnectOsloProviderClass[0]());
    v5 = (void *)WeakRetained[15];
    WeakRetained[15] = v4;

    if (WeakRetained[15])
    {
      v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_111);
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
      v8 = (void *)WeakRetained[15];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __83__PKPaymentAuthorizationDataModel__populateFinanceKitBalancesIfNecessaryForPasses___block_invoke_3;
      v10[3] = &unk_1E2AC5DE0;
      objc_copyWeak(&v13, v2);
      v11 = *(id *)(a1 + 32);
      v9 = v7;
      v12 = v9;
      objc_msgSend(v8, "listenForAccountsWithPrimaryAccountIdentifiers:callback:", v9, v10);

      objc_destroyWeak(&v13);
    }
  }

}

uint64_t __83__PKPaymentAuthorizationDataModel__populateFinanceKitBalancesIfNecessaryForPasses___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "primaryAccountIdentifier");
}

void __83__PKPaymentAuthorizationDataModel__populateFinanceKitBalancesIfNecessaryForPasses___block_invoke_3(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__PKPaymentAuthorizationDataModel__populateFinanceKitBalancesIfNecessaryForPasses___block_invoke_4;
  v5[3] = &unk_1E2AC4A98;
  objc_copyWeak(&v9, a1 + 6);
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __83__PKPaymentAuthorizationDataModel__populateFinanceKitBalancesIfNecessaryForPasses___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    obj = *(id *)(a1 + 40);
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v16 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v7, "primaryAccountIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "accountForPrimaryIdentifier:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setBankConnectAccount:", v9);
          objc_msgSend(v7, "primaryAccountIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained[19], "primaryAccountIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqualToString:", v11);

          if (v12)
            objc_msgSend(WeakRetained[19], "setBankConnectAccount:", v9);

        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v4);
    }

    objc_msgSend(WeakRetained, "primaryAccountIdentifiersWithConnectedCardStateSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unionSet:", *(_QWORD *)(a1 + 48));

    objc_msgSend(WeakRetained, "_notifyModelChanged");
  }

}

- (id)_formatAddressContactIfNecessary:(id)a3
{
  id v4;
  void *v5;
  PKContactFormatValidator *contactFormatValidator;
  void *v7;
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
  void *v19;

  v4 = a3;
  v5 = v4;
  contactFormatValidator = self->_contactFormatValidator;
  v7 = v4;
  if (contactFormatValidator)
  {
    objc_msgSend(v4, "postalAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContactFormatValidator formatPostalAddress:](contactFormatValidator, "formatPostalAddress:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v5;
    if (v11)
    {
      v12 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v12, "postalAddresses");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "labeledValueBySettingValue:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "postalAddresses");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "mutableCopy");

      objc_msgSend(v17, "setObject:atIndexedSubscript:", v15, 0);
      v18 = (void *)objc_msgSend(v17, "copy");
      objc_msgSend(v12, "setPostalAddresses:", v18);

      v7 = (void *)objc_msgSend(v12, "copy");
      objc_msgSend(v5, "valueSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValueSource:", v19);

      objc_msgSend(v7, "setFormattingConstrained:", 1);
    }

  }
  return v7;
}

- (id)paymentErrorsFromLegacyStatus:(int64_t)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void **v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 4:
      v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v10 = *MEMORY[0x1E0CB2D50];
      v15[0] = CFSTR("PKPaymentErrorContactField");
      v15[1] = v10;
      v16[0] = CFSTR("contactInfo");
      v16[1] = &stru_1E2ADF4C0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), 1, v5);
      objc_msgSend(v6, "pk_paymentErrorWithLocalizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v7;
      v8 = &v17;
      goto LABEL_7;
    case 3:
      v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = *MEMORY[0x1E0CB2D50];
      v18[0] = CFSTR("PKPaymentErrorContactField");
      v18[1] = v12;
      v19[0] = CFSTR("post");
      v19[1] = &stru_1E2ADF4C0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), 1, v5);
      objc_msgSend(v6, "pk_paymentErrorWithLocalizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v7;
      v8 = &v20;
      goto LABEL_7;
    case 2:
      v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v4 = *MEMORY[0x1E0CB2D50];
      v21[0] = CFSTR("PKPaymentErrorContactField");
      v21[1] = v4;
      v22[0] = CFSTR("post");
      v22[1] = &stru_1E2ADF4C0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), 2, v5);
      objc_msgSend(v6, "pk_paymentErrorWithLocalizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v7;
      v8 = (void **)v23;
LABEL_7:
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      return v13;
  }
  return 0;
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKPaymentAuthorizationDataModel isValidWithError:errorStatus:](self, "isValidWithError:errorStatus:", a3, 0);
}

- (BOOL)isValidWithError:(id *)a3 errorStatus:(int64_t *)a4
{
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *items;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_mode == 1 && self->_remoteDevice)
  {
    v7 = (void *)MEMORY[0x1E0C99D20];
    -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithObjects:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    items = self->_items;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __64__PKPaymentAuthorizationDataModel_isValidWithError_errorStatus___block_invoke;
    v22[3] = &unk_1E2AC5E08;
    v22[4] = self;
    -[NSMutableArray pk_objectsPassingTest:](items, "pk_objectsPassingTest:", v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "isValidWithError:errorStatus:", a3, a4))
        {

          goto LABEL_17;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v13)
        continue;
      break;
    }
  }

  if (-[PKPaymentAuthorizationDataModel wantsInstructions](self, "wantsInstructions") && !self->_instructions)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3008, 0);
      v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_17:
      v16 = 0;
    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

uint64_t __64__PKPaymentAuthorizationDataModel_isValidWithError_errorStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
  switch(v5)
  {
    case 2:
      goto LABEL_4;
    case 1:
      if ((objc_msgSend(v3, "context") & 2) == 0)
        break;
      goto LABEL_7;
    case 0:
LABEL_4:
      if ((objc_msgSend(v3, "context") & 1) == 0)
        break;
LABEL_7:
      v6 = 1;
      goto LABEL_8;
  }
  v6 = 0;
LABEL_8:

  return v6;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPaymentPassWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PKPaymentAuthorizationDataModel library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "passWithPassTypeIdentifier:serialNumber:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentAuthorizationDataModel setPass:](self, "setPass:", v10);
  if (v10)
  {
    v12[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel _populatePeerPaymentBalanceIfNecessaryForPasses:](self, "_populatePeerPaymentBalanceIfNecessaryForPasses:", v11);

  }
}

- (void)setPass:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "devicePrimaryInAppPaymentApplication");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel setPass:withSelectedPaymentApplication:](self, "setPass:withSelectedPaymentApplication:", v4, v5);

}

- (void)setPass:(id)a3 withSelectedPaymentApplication:(id)a4
{
  id v7;
  PKPaymentApplication *v8;
  PKPaymentApplication *paymentApplication;
  PKBankAccountInformation *bankAccount;
  id v11;

  v11 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_pass, a3);
  objc_storeStrong((id *)&self->_paymentApplication, a4);
  if (!self->_paymentApplication)
  {
    -[PKPaymentAuthorizationDataModel defaultSelectedPaymentApplicationForPass:](self, "defaultSelectedPaymentApplicationForPass:", v11);
    v8 = (PKPaymentApplication *)objc_claimAutoreleasedReturnValue();
    paymentApplication = self->_paymentApplication;
    self->_paymentApplication = v8;

  }
  if (self->_pass)
  {
    bankAccount = self->_bankAccount;
    self->_bankAccount = 0;

  }
  -[PKPaymentAuthorizationDataModel updateBillingErrors](self, "updateBillingErrors");
  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  -[PKPaymentAuthorizationDataModel _updatePeerPaymentPromotionAvailability](self, "_updatePeerPaymentPromotionAvailability");
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");

}

- (void)setPaymentApplication:(id)a3
{
  objc_storeStrong((id *)&self->_paymentApplication, a3);
  -[PKPaymentAuthorizationDataModel updateBillingErrors](self, "updateBillingErrors");
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

- (PKRemoteDevice)remoteDevice
{
  if (self->_mode == 1)
    return self->_remoteDevice;
  -[NSMapTable objectForKey:](self->_instrumentToDeviceMap, "objectForKey:", self->_remotePaymentInstrument);
  return (PKRemoteDevice *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)remoteDevices
{
  return self->_allRemoteDevices;
}

- (NSArray)allNearbyRemoteDevices
{
  NSArray *allRemoteDevices;
  _QWORD v4[5];

  allRemoteDevices = self->_allRemoteDevices;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__PKPaymentAuthorizationDataModel_allNearbyRemoteDevices__block_invoke;
  v4[3] = &unk_1E2AC5E30;
  v4[4] = self;
  -[NSArray pk_objectsPassingTest:](allRemoteDevices, "pk_objectsPassingTest:", v4);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

BOOL __57__PKPaymentAuthorizationDataModel_allNearbyRemoteDevices__block_invoke(uint64_t a1, void *a2)
{
  int v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40);
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40))
    v2 = objc_msgSend(a2, "proximityState") == 0;
  return v2 != 0;
}

- (NSArray)allUnavailableRemoteDevices
{
  NSArray *allRemoteDevices;

  if (self->_ignoreProximity)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  allRemoteDevices = self->_allRemoteDevices;
  if (!allRemoteDevices)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  -[NSArray pk_objectsPassingTest:](allRemoteDevices, "pk_objectsPassingTest:", &__block_literal_global_116);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

BOOL __62__PKPaymentAuthorizationDataModel_allUnavailableRemoteDevices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proximityState") != 0;
}

- (void)setRemoteDevice:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_mode == 1)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_remoteDevice, a3);
    v5 = v6;
  }

}

- (void)setRemotePaymentInstrument:(id)a3 withSelectedPaymentApplication:(id)a4
{
  PKRemotePaymentInstrument *v6;
  PKPaymentApplication *v7;
  PKRemotePaymentInstrument *remotePaymentInstrument;
  PKRemotePaymentInstrument *v9;
  PKPaymentApplication *paymentApplication;
  PKPaymentApplication *v11;
  uint64_t v12;

  v6 = (PKRemotePaymentInstrument *)a3;
  v7 = (PKPaymentApplication *)a4;
  remotePaymentInstrument = self->_remotePaymentInstrument;
  self->_remotePaymentInstrument = v6;
  v9 = v6;

  paymentApplication = self->_paymentApplication;
  self->_paymentApplication = v7;
  v11 = v7;

  -[PKPaymentAuthorizationDataModel updateBillingErrors](self, "updateBillingErrors");
  v12 = objc_opt_class();

  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", v12);
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

- (void)setRemotePaymentInstrument:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentAuthorizationDataModel defaultSelectedPaymentApplicationForRemoteInstrument:](self, "defaultSelectedPaymentApplicationForRemoteInstrument:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDataModel setRemotePaymentInstrument:withSelectedPaymentApplication:](self, "setRemotePaymentInstrument:withSelectedPaymentApplication:", v4, v5);

}

- (void)updateRemoteDevices:(id)a3
{
  -[PKPaymentAuthorizationDataModel updateRemoteDevices:ignoreProximity:](self, "updateRemoteDevices:ignoreProximity:", a3, 1);
}

- (void)updateRemoteDevices:(id)a3 ignoreProximity:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *allRemoteDevices;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  PKRemotePaymentInstrument *v27;
  void *v28;
  void *v29;
  PKRemotePaymentInstrument *v30;
  PKRemotePaymentInstrument *v31;
  void *v32;
  PKRemotePaymentInstrument *remotePaymentInstrument;
  PKRemotePaymentInstrument *v34;
  PKPaymentApplication *v35;
  PKPaymentApplication *paymentApplication;
  PKRemotePaymentInstrument *v37;
  id v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _QWORD v48[5];
  uint8_t buf[4];
  PKRemotePaymentInstrument *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  PKRemotePaymentInstrument *v54;
  _BYTE v55[128];
  uint64_t v56;

  v4 = a4;
  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSMapTable removeAllObjects](self->_instrumentToDeviceMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_remoteDeviceToAcceptedInstruments, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_acceptedApplications, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(7uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v50 = (PKRemotePaymentInstrument *)v4;
    v51 = 2112;
    v52 = v6;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Updating remote devices for payment authorization model, ignoreProximity: %ld, remoteDevices: %@", buf, 0x16u);
  }

  v10 = MEMORY[0x1E0C809B0];
  self->_ignoreProximity = v4;
  v48[0] = v10;
  v48[1] = 3221225472;
  v48[2] = __71__PKPaymentAuthorizationDataModel_updateRemoteDevices_ignoreProximity___block_invoke;
  v48[3] = &unk_1E2AC5E30;
  v48[4] = self;
  objc_msgSend(v6, "pk_objectsPassingTest:", v48);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = v10;
  v45[1] = 3221225472;
  v45[2] = __71__PKPaymentAuthorizationDataModel_updateRemoteDevices_ignoreProximity___block_invoke_2;
  v45[3] = &unk_1E2AC5EA0;
  v45[4] = self;
  v39 = v7;
  v46 = v39;
  v38 = v8;
  v47 = v38;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v45);
  -[PKPaymentAuthorizationDataModel paymentRequestSupportedRemoteQuery](self, "paymentRequestSupportedRemoteQuery");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKRemoteDevice acceptedComparatorWithPaymentSupportedQuery:](PKRemoteDevice, "acceptedComparatorWithPaymentSupportedQuery:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v11;
  objc_msgSend(v11, "sortedArrayUsingComparator:", v13);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  allRemoteDevices = self->_allRemoteDevices;
  self->_allRemoteDevices = v14;

  objc_storeStrong((id *)&self->_allAcceptedRemotePaymentInstruments, v7);
  objc_storeStrong((id *)&self->_allUnavailableRemotePaymentInstruments, v8);
  -[PKPaymentRequest originatingURL](self->_paymentRequest, "originatingURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[NSArray firstObject](self->_allRemoteDevices, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "remotePaymentInstruments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v42 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        if (objc_msgSend(v24, "supportsAutomaticSelection"))
        {
          objc_msgSend(v24, "associatedWebDomains");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "containsObject:", v17);

          if (v26)
          {
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Found automatic selection remote instrument, promoting it", buf, 2u);
            }

            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v24, "description");
              v27 = (PKRemotePaymentInstrument *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v50 = v27;
              _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

            }
            objc_storeStrong((id *)&self->_remotePaymentInstrument, v24);
            goto LABEL_18;
          }
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
      if (v21)
        continue;
      break;
    }
  }
LABEL_18:

  if (!self->_remotePaymentInstrument || (objc_msgSend(v39, "containsObject:") & 1) == 0)
  {
    -[NSArray firstObject](self->_allRemoteDevices, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "remotePaymentInstruments");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v30 = (PKRemotePaymentInstrument *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v28, "deviceName");
      v31 = (PKRemotePaymentInstrument *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "uniqueID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v50 = v31;
      v51 = 2112;
      v52 = v32;
      v53 = 2112;
      v54 = v30;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Selecting default remote device name: %@, uniqueID: %@, payment instrument: %@", buf, 0x20u);

    }
    remotePaymentInstrument = self->_remotePaymentInstrument;
    self->_remotePaymentInstrument = v30;
    v34 = v30;

    -[PKPaymentAuthorizationDataModel defaultSelectedPaymentApplicationForRemoteInstrument:](self, "defaultSelectedPaymentApplicationForRemoteInstrument:", self->_remotePaymentInstrument);
    v35 = (PKPaymentApplication *)objc_claimAutoreleasedReturnValue();
    paymentApplication = self->_paymentApplication;
    self->_paymentApplication = v35;

    -[PKPaymentAuthorizationDataModel updateBillingErrors](self, "updateBillingErrors");
  }
  if (!self->_initialRemotePaymentInstrument)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v37 = self->_remotePaymentInstrument;
      *(_DWORD *)buf = 138412290;
      v50 = v37;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Selecting initial remote payment instrument: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&self->_initialRemotePaymentInstrument, self->_remotePaymentInstrument);
  }
  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");

}

uint64_t __71__PKPaymentAuthorizationDataModel_updateRemoteDevices_ignoreProximity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  char v6;

  v3 = a2;
  if (objc_msgSend(v3, "userDisabled"))
  {
    objc_msgSend(v3, "type");
    v4 = 0;
  }
  else
  {
    v5 = objc_msgSend(v3, "deviceDisabled");
    v6 = v5;
    v4 = v5 ^ 1u;
    if (!objc_msgSend(v3, "type") && (v6 & 1) == 0)
      v4 = objc_msgSend(v3, "isLocked") ^ 1;
  }
  if (objc_msgSend(v3, "type"))
  {
    if (objc_msgSend(v3, "type") == 1)
      v4 = v4;
    else
      v4 = 0;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "requestType") == 10)
    v4 = objc_msgSend(*(id *)(a1 + 32), "canSupportDisbursementsOnRemoteDevice:", v3);

  return v4;
}

void __71__PKPaymentAuthorizationDataModel_updateRemoteDevices_ignoreProximity___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BYTE *v12;
  int v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "defaultRemotePaymentInstrument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "paymentRequestSupportedRemoteQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKRemotePaymentInstrument sortDescriptorForDefaultPaymentInstrument:paymentSupportedQuery:](PKRemotePaymentInstrument, "sortDescriptorForDefaultPaymentInstrument:paymentSupportedQuery:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("ingestedDate"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remotePaymentInstruments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  v25[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setRemotePaymentInstruments:", v10);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a1[4];
  v13 = v12[40];
  if (!v12[40])
  {
    v13 = objc_msgSend(v3, "proximityState") == 0;
    v12 = a1[4];
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__PKPaymentAuthorizationDataModel_updateRemoteDevices_ignoreProximity___block_invoke_3;
  v19[3] = &unk_1E2AC5E78;
  v19[4] = v12;
  v20 = v3;
  v24 = v13 != 0;
  v21 = a1[5];
  v22 = v11;
  v23 = a1[6];
  v14 = v11;
  v15 = v3;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v19);
  v16 = (void *)*((_QWORD *)a1[4] + 9);
  v17 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v15, "uniqueID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v17, v18);

}

void __71__PKPaymentAuthorizationDataModel_updateRemoteDevices_ignoreProximity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", *(_QWORD *)(a1 + 40), v3);
  if (!*(_BYTE *)(a1 + 72)
    || objc_msgSend(v3, "hasAssociatedPeerPaymentAccount")
    && (!objc_msgSend(v3, "hasAssociatedPeerPaymentAccount")
     || objc_msgSend(v3, "peerPaymentAccountState") == 3))
  {
    goto LABEL_16;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "paymentApplications", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
  {
LABEL_13:

LABEL_16:
    v11 = (id *)(a1 + 64);
    goto LABEL_17;
  }
  v6 = v5;
  v7 = *(_QWORD *)v13;
LABEL_7:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
    objc_msgSend(*(id *)(a1 + 32), "paymentRequestSupportedRemoteQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v9, "canProcessPayment:", v10);

    if ((v9 & 1) != 0)
      break;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        goto LABEL_7;
      goto LABEL_13;
    }
  }

  if (!objc_msgSend(*(id *)(a1 + 32), "canSupportMerchantCategoryCodeAccordingToWebService:forPaymentInstrument:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384), v3))goto LABEL_16;
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
  v11 = (id *)(a1 + 56);
LABEL_17:
  objc_msgSend(*v11, "addObject:", v3);

}

- (NSArray)acceptedPasses
{
  NSArray *acceptedPasses;
  id *p_acceptedPasses;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  int v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  p_acceptedPasses = (id *)&self->_acceptedPasses;
  acceptedPasses = self->_acceptedPasses;
  if (!acceptedPasses)
  {
    PKLogFacilityTypeGetObject(7uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v24) = 0;
      _os_log_debug_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEBUG, "Pass filtering: Accepted passes unknown, determining...", (uint8_t *)&v24, 2u);
    }

    if (-[PKPaymentRequest requestType](self->_paymentRequest, "requestType") == 5
      || -[PKPaymentRequest requestType](self->_paymentRequest, "requestType") == 4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v24) = 0;
        _os_log_debug_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEBUG, "Pass filtering: Installment/Physical Card request", (uint8_t *)&v24, 2u);
      }

      +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "passWithUniqueID:", self->_relevantPassUniqueID);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "paymentPass");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v26[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *p_acceptedPasses;
        *p_acceptedPasses = (id)v9;

      }
    }
    else
    {
      v11 = -[PKPaymentRequest isPayLaterPaymentRequest](self->_paymentRequest, "isPayLaterPaymentRequest");
      v12 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
      if (v11)
      {
        if (v12)
        {
          LOWORD(v24) = 0;
          _os_log_debug_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEBUG, "Pass filtering: Pay Later request", (uint8_t *)&v24, 2u);
        }

        -[PKPaymentRequest payLaterPaymentRequest](self->_paymentRequest, "payLaterPaymentRequest");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentAuthorizationDataModel library](self, "library");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentAuthorizationDataModel peerPaymentAccount](self, "peerPaymentAccount");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "acceptedPassesWithPassLibrary:peerPaymentAccount:", v13, v14);
        v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v16 = self->_acceptedPasses;
        self->_acceptedPasses = v15;

        -[PKPaymentAuthorizationDataModel _populatePeerPaymentBalanceIfNecessaryForPasses:](self, "_populatePeerPaymentBalanceIfNecessaryForPasses:", self->_acceptedPasses);
      }
      else
      {
        if (v12)
        {
          LOWORD(v24) = 0;
          _os_log_debug_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEBUG, "Pass filtering: Other payment request type", (uint8_t *)&v24, 2u);
        }

        -[PKPaymentAuthorizationDataModel _inAppPaymentPassesForPaymentRequest:](self, "_inAppPaymentPassesForPaymentRequest:", self->_paymentRequest);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentRequest supportedNetworks](self->_paymentRequest, "supportedNetworks");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "containsObject:", CFSTR("PrivateLabel"));

        if (v18)
        {
          -[PKPaymentAuthorizationDataModel _inAppPrivateLabelPaymentPasses](self, "_inAppPrivateLabelPaymentPasses");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v8);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v19);
          v21 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v21;
        }
        objc_storeStrong(p_acceptedPasses, v8);
        -[PKPaymentAuthorizationDataModel _populatePeerPaymentBalanceIfNecessaryForPasses:](self, "_populatePeerPaymentBalanceIfNecessaryForPasses:", self->_acceptedPasses);
        if (!-[PKPaymentRequest requestType](self->_paymentRequest, "requestType"))
          -[PKPaymentAuthorizationDataModel _populateFinanceKitBalancesIfNecessaryForPasses:](self, "_populateFinanceKitBalancesIfNecessaryForPasses:", self->_acceptedPasses);
      }
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v23 = objc_msgSend(*p_acceptedPasses, "count");
      v24 = 134217984;
      v25 = v23;
      _os_log_debug_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEBUG, "Pass filtering: Accepted passes count: %ld", (uint8_t *)&v24, 0xCu);
    }

    acceptedPasses = (NSArray *)*p_acceptedPasses;
  }
  return acceptedPasses;
}

- (PKPaymentPass)appleCardPass
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PKPaymentAuthorizationDataModel acceptedPasses](self, "acceptedPasses", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "paymentPass");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isAppleCardPass") & 1) != 0)
        break;

      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v7 = 0;
  }

  return (PKPaymentPass *)v7;
}

- (id)paymentRequestSupportedRemoteQuery
{
  void *v3;
  void *v4;
  PKMerchantCapability v5;
  void *v6;
  void *v7;

  -[PKPaymentRequest supportedNetworks](self->_paymentRequest, "supportedNetworks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_arrayByApplyingBlock:", &__block_literal_global_122);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PKPaymentRequest merchantCapabilities](self->_paymentRequest, "merchantCapabilities");
  -[PKPaymentRequest countryCode](self->_paymentRequest, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentRequestSupportedQuery webQueryWithSupportedNetworkIDs:merchantCapabilities:merchantCountryCode:paymentMode:paymentApplicationStates:isMultiTokensRequest:webService:](PKPaymentRequestSupportedQuery, "webQueryWithSupportedNetworkIDs:merchantCapabilities:merchantCountryCode:paymentMode:paymentApplicationStates:isMultiTokensRequest:webService:", v4, v5, v6, 2, 0, -[PKPaymentRequest isMultiTokenRequest](self->_paymentRequest, "isMultiTokenRequest"), self->_paymentWebService);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __69__PKPaymentAuthorizationDataModel_paymentRequestSupportedRemoteQuery__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", PKPaymentCredentialTypeForPaymentNetworkName(a2));
}

- (id)paymentRequestSupportedQuery
{
  int64_t fundingMode;
  BOOL v4;
  void *v5;
  void *v6;
  PKMerchantCapability v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  PKPayLaterFinancingOption *selectedFinancingOption;
  PKPayLaterFinancingOption *v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v17;

  fundingMode = self->_fundingMode;
  if (fundingMode)
    v4 = fundingMode == 2;
  else
    v4 = 1;
  if (v4)
    goto LABEL_6;
  if (fundingMode != 1)
  {
    v11 = 0;
    return v11;
  }
  if (_os_feature_enabled_impl())
  {
LABEL_6:
    -[PKPaymentRequest supportedNetworks](self->_paymentRequest, "supportedNetworks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKPaymentCredentialTypesForPaymentNetworkNames(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKPaymentRequest merchantCapabilities](self->_paymentRequest, "merchantCapabilities");
    -[PKPaymentRequest countryCode](self->_paymentRequest, "countryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKPaymentAuthorizationDataModel requestedMode](self, "requestedMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKPaymentRequest requestType](self->_paymentRequest, "requestType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = -[PKPaymentRequest isMultiTokenRequest](self->_paymentRequest, "isMultiTokenRequest");
    +[PKPaymentRequestSupportedQuery inAppQueryWithSupportedNetworkIDs:merchantCapabilities:merchantCountryCode:paymentMode:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:webService:](PKPaymentRequestSupportedQuery, "inAppQueryWithSupportedNetworkIDs:merchantCapabilities:merchantCountryCode:paymentMode:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:webService:", v6, v7, v8, v9, 0, v10, v17, self->_paymentWebService);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    selectedFinancingOption = self->_selectedFinancingOption;
    if (!selectedFinancingOption)
      selectedFinancingOption = self->_previouslySelectedFinancingOption;
    v13 = selectedFinancingOption;
    -[PKPayLaterFinancingOption supportedRepaymentNetworks](v13, "supportedRepaymentNetworks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKPaymentCredentialTypesForPaymentNetworkNames(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (__rbit32(-[PKPayLaterFinancingOption supportedRepaymentTypes](v13, "supportedRepaymentTypes")) >> 28) & 0xC;
    -[PKPaymentRequest countryCode](self->_paymentRequest, "countryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKPaymentAuthorizationDataModel requestedMode](self, "requestedMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKPaymentRequest requestType](self->_paymentRequest, "requestType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = -[PKPaymentRequest isMultiTokenRequest](self->_paymentRequest, "isMultiTokenRequest");
    +[PKPaymentRequestSupportedQuery inAppQueryWithSupportedNetworkIDs:merchantCapabilities:merchantCountryCode:paymentMode:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:webService:](PKPaymentRequestSupportedQuery, "inAppQueryWithSupportedNetworkIDs:merchantCapabilities:merchantCountryCode:paymentMode:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:webService:", v6, v14, v8, v15, 0, v10, v17, self->_paymentWebService);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (int64_t)requestedMode
{
  if (self->_mode == 2)
    return 2;
  if (self->_remoteDevice)
    return 2;
  return 1;
}

- (id)acceptedPaymentApplicationsForPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKey:](self->_acceptedApplications, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v4, "deviceInAppPaymentApplications");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "devicePrimaryInAppPaymentApplication");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationDataModel _filterAndProcessPaymentApplicationsUsingConfiguration:withPrimaryPaymentApplication:passHasAssociatedPeerPaymentAccount:](self, "_filterAndProcessPaymentApplicationsUsingConfiguration:withPrimaryPaymentApplication:passHasAssociatedPeerPaymentAccount:", v8, v9, objc_msgSend(v4, "hasAssociatedPeerPaymentAccount"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary setObject:forKey:](self->_acceptedApplications, "setObject:forKey:", v6, v5);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)unavailablePaymentApplicationsForPass:(id)a3
{
  NSMutableDictionary *acceptedApplications;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;

  acceptedApplications = self->_acceptedApplications;
  v4 = a3;
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](acceptedApplications, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pk_arrayByApplyingBlock:", &__block_literal_global_125);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "deviceInAppPaymentApplications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __73__PKPaymentAuthorizationDataModel_unavailablePaymentApplicationsForPass___block_invoke_2;
  v17 = &unk_1E2AC5EE8;
  v18 = v7;
  v19 = &__block_literal_global_125;
  v10 = v7;
  objc_msgSend(v9, "indexesOfObjectsPassingTest:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectsAtIndexes:", v11, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __73__PKPaymentAuthorizationDataModel_unavailablePaymentApplicationsForPass___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "paymentType");

  PKPaymentMethodTypeToString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __73__PKPaymentAuthorizationDataModel_unavailablePaymentApplicationsForPass___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "containsObject:", v2) ^ 1;

  return v3;
}

- (id)defaultSelectedPaymentApplicationForPass:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[PKPaymentAuthorizationDataModel acceptedPaymentApplicationsForPass:](self, "acceptedPaymentApplicationsForPass:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel _defaultSelectedPaymentApplicationForPaymentApplications:](self, "_defaultSelectedPaymentApplicationForPaymentApplications:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)defaultSelectedPaymentApplicationForRemoteInstrument:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[PKPaymentAuthorizationDataModel acceptedPaymentApplicationsForRemoteInstrument:](self, "acceptedPaymentApplicationsForRemoteInstrument:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel _defaultSelectedPaymentApplicationForPaymentApplications:](self, "_defaultSelectedPaymentApplicationForPaymentApplications:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_defaultSelectedPaymentApplicationForPaymentApplications:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  PKPaymentAuthorizationDataModel *v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  id v23;
  id v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") <= 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  -[PKPaymentRequest supportedNetworks](self->_paymentRequest, "supportedNetworks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    v7 = -[PKPaymentRequest respectSupportedNetworksOrder](self->_paymentRequest, "respectSupportedNetworksOrder");
  else
    v7 = 0;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v25 = v4;
  v8 = v4;
  v28 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  v9 = 0;
  if (v28)
  {
    v27 = *(_QWORD *)v30;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    v26 = v7;
LABEL_8:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v27)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
      -[PKPaymentRequest countryCode](self->_paymentRequest, "countryCode", v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isRequiredForMerchantInCountry:", v13);

      if ((v14 & 1) != 0)
      {
        v5 = v12;

        goto LABEL_26;
      }
      if (v7)
      {
        PKPaymentNetworkNameForPaymentCredentialType(objc_msgSend(v12, "paymentNetworkIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v6, "indexOfObject:", v15);
        v17 = v16;
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_17;
        if (v16 < v10)
          goto LABEL_17;
        if (v16 == v10)
        {
          v18 = v8;
          v19 = self;
          v20 = v6;
          v21 = objc_msgSend(v12, "inAppPriority");
          v17 = v10;
          v22 = v21 <= objc_msgSend(v9, "inAppPriority");
          v6 = v20;
          self = v19;
          v8 = v18;
          v7 = v26;
          if (!v22)
          {
LABEL_17:
            v23 = v12;

            v9 = v23;
            v10 = v17;
          }
        }
      }
      else
      {
        if (v10 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v12, "inAppPriority") <= v10)
          goto LABEL_22;
        v10 = objc_msgSend(v12, "inAppPriority");
        v15 = v9;
        v9 = v12;
      }

LABEL_22:
      if (v28 == ++v11)
      {
        v28 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v28)
          goto LABEL_8;
        break;
      }
    }
  }

  v9 = v9;
  v5 = v9;
LABEL_26:

  v4 = v25;
LABEL_27:

  return v5;
}

- (id)acceptedRemotePaymentInstrumentsForRemoteDevice:(id)a3
{
  NSMutableDictionary *remoteDeviceToAcceptedInstruments;
  void *v4;
  void *v5;

  remoteDeviceToAcceptedInstruments = self->_remoteDeviceToAcceptedInstruments;
  objc_msgSend(a3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](remoteDeviceToAcceptedInstruments, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)acceptedPaymentApplicationsForRemoteInstrument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_acceptedApplications, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "paymentApplications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primaryPaymentApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel _filterAndProcessPaymentApplicationsUsingConfiguration:withPrimaryPaymentApplication:passHasAssociatedPeerPaymentAccount:](self, "_filterAndProcessPaymentApplicationsUsingConfiguration:withPrimaryPaymentApplication:passHasAssociatedPeerPaymentAccount:", v6, v7, objc_msgSend(v4, "hasAssociatedPeerPaymentAccount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKey:](self->_acceptedApplications, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (id)unavailablePaymentApplicationsForRemoteInstrument:(id)a3
{
  NSMutableDictionary *acceptedApplications;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  acceptedApplications = self->_acceptedApplications;
  v4 = a3;
  -[NSMutableDictionary objectForKey:](acceptedApplications, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_arrayByApplyingBlock:", &__block_literal_global_126);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "paymentApplications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __85__PKPaymentAuthorizationDataModel_unavailablePaymentApplicationsForRemoteInstrument___block_invoke_2;
  v15 = &unk_1E2AC5EE8;
  v16 = v6;
  v17 = &__block_literal_global_126;
  v8 = v6;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectsAtIndexes:", v9, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __85__PKPaymentAuthorizationDataModel_unavailablePaymentApplicationsForRemoteInstrument___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "paymentType");

  PKPaymentMethodTypeToString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __85__PKPaymentAuthorizationDataModel_unavailablePaymentApplicationsForRemoteInstrument___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "containsObject:", v2) ^ 1;

  return v3;
}

- (BOOL)canSupportMerchantCategoryCodeAccordingToWebService:(id)a3 forPass:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  char v14;

  v6 = a4;
  +[PKWebServiceMerchantCategoryCodesFeature merchantCategoryCodesFeatureWithWebService:](PKWebServiceMerchantCategoryCodesFeature, "merchantCategoryCodesFeatureWithWebService:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && -[PKPaymentRequest merchantCategoryCode](self->_paymentRequest, "merchantCategoryCode"))
  {
    objc_msgSend(v7, "appleCardUnsupportedMerchantCategoryCodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appleCashUnsupportedMerchantCategoryCodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKPaymentRequest merchantCategoryCode](self->_paymentRequest, "merchantCategoryCode");
    if (objc_msgSend(v6, "isPeerPaymentPass") && v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9;
    }
    else
    {
      v13 = 1;
      if (!objc_msgSend(v6, "isAppleCardPass") || !v8)
        goto LABEL_11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v8;
    }
    v14 = objc_msgSend(v12, "containsObject:", v11);

    v13 = v14 ^ 1;
LABEL_11:

    goto LABEL_12;
  }
  v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)canSupportMerchantCategoryCodeAccordingToWebService:(id)a3 forPaymentInstrument:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  char v16;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)(objc_msgSend(v7, "associatedAccountFeatureIdentifier") - 3) >= 0xFFFFFFFFFFFFFFFELL
    && -[PKPaymentRequest merchantCategoryCode](self->_paymentRequest, "merchantCategoryCode"))
  {
    +[PKWebServiceMerchantCategoryCodesFeature merchantCategoryCodesFeatureWithWebService:](PKWebServiceMerchantCategoryCodesFeature, "merchantCategoryCodesFeatureWithWebService:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      v15 = 1;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v8, "appleCardUnsupportedMerchantCategoryCodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appleCashUnsupportedMerchantCategoryCodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKPaymentRequest merchantCategoryCode](self->_paymentRequest, "merchantCategoryCode");
    if (objc_msgSend(v7, "associatedAccountFeatureIdentifier") == 1 && v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v11;
    }
    else
    {
      v15 = 1;
      if (objc_msgSend(v7, "associatedAccountFeatureIdentifier") != 2 || !v10)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v10;
    }
    v16 = objc_msgSend(v14, "containsObject:", v13);

    v15 = v16 ^ 1;
LABEL_13:

    goto LABEL_14;
  }
  v15 = 1;
LABEL_15:

  return v15;
}

- (BOOL)canSupportDisbursementsOnRemoteDevice:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "type") || objc_msgSend(v3, "majorOperatingSystemVersion") >= 11)
    && (objc_msgSend(v3, "type") != 1 || objc_msgSend(v3, "majorOperatingSystemVersion") >= 18);

  return v4;
}

- (NSArray)unavailablePasses
{
  NSArray *unavailablePasses;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSArray *v22;
  NSArray *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  unavailablePasses = self->_unavailablePasses;
  if (!unavailablePasses)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[PKPaymentRequest isPeerPaymentRequest](self->_paymentRequest, "isPeerPaymentRequest"))
    {
      -[PKPeerPaymentAccount associatedPassUniqueID](self->_peerPaymentAccount, "associatedPassUniqueID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "safelyAddObject:", v6);

    }
    if (-[PKPaymentRequest isPayLaterPaymentRequest](self->_paymentRequest, "isPayLaterPaymentRequest"))
    {
      -[PKPaymentRequest payLaterPaymentRequest](self->_paymentRequest, "payLaterPaymentRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "payLaterPassUniqueID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "safelyAddObject:", v8);

    }
    -[PKPaymentAuthorizationDataModel acceptedPasses](self, "acceptedPasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", CFSTR("uniqueID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentAuthorizationDataModel library](self, "library");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "passesOfType:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_financingController && _os_feature_enabled_impl())
    {
      -[PKPayLaterFinancingController payLaterPass](self->_financingController, "payLaterPass");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterFinancingController payLaterAccount](self->_financingController, "payLaterAccount");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        if ((objc_msgSend(v14, "hidePayLaterInPaymentSheet") & 1) == 0)
        {
          v16 = -[PKPayLaterFinancingController payLaterPassEligibility](self->_financingController, "payLaterPassEligibility");
          if (v16 == 5 || v16 == 2)
          {
            objc_msgSend(v13, "uniqueID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "safelyAddObject:", v17);

          }
        }
      }

    }
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __52__PKPaymentAuthorizationDataModel_unavailablePasses__block_invoke;
    v25[3] = &unk_1E2AC5F10;
    v26 = v10;
    v27 = v5;
    v28 = v4;
    v18 = v4;
    v19 = v5;
    v20 = v10;
    objc_msgSend(v12, "pk_objectsPassingTest:", v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sortedArrayUsingComparator:", &__block_literal_global_131);
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v23 = self->_unavailablePasses;
    self->_unavailablePasses = v22;

    unavailablePasses = self->_unavailablePasses;
  }
  return unavailablePasses;
}

uint64_t __52__PKPaymentAuthorizationDataModel_unavailablePasses__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(v3, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) != 0
    || ((objc_msgSend(v3, "isAccessPass") & 1) != 0
     || (objc_msgSend(v3, "isIdentityPass") & 1) != 0
     || objc_msgSend(v3, "isShellPass"))
    && (v6 = (void *)a1[5],
        objc_msgSend(v3, "uniqueID"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v6) = objc_msgSend(v6, "containsObject:", v7),
        v7,
        !(_DWORD)v6))
  {
    v10 = 0;
  }
  else
  {
    v8 = (void *)a1[6];
    objc_msgSend(v3, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsObject:", v9) ^ 1;

  }
  return v10;
}

uint64_t __52__PKPaymentAuthorizationDataModel_unavailablePasses__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "comparePassDatesToPass:searchOption:", a2, 3);
}

- (BOOL)wantsInstructions
{
  return 0;
}

- (BOOL)praguePolicyRequired
{
  return 0;
}

- (BOOL)pinRequired
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  BOOL v12;
  BOOL v14;

  -[PKPaymentAuthorizationDataModel paymentApplication](self, "paymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "inAppPINRequired"))
  {
    objc_msgSend(v3, "inAppPINRequiredCurrency");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel currencyCode](self, "currencyCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "caseInsensitiveCompare:", v5);

    objc_msgSend(v3, "inAppPINRequiredAmount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel transactionAmount](self, "transactionAmount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "compare:", v8);

    -[PKPaymentAuthorizationDataModel pass](self, "pass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKPaymentAuthorizationDataModel _statusForPass:](self, "_statusForPass:", v10);

    if (v6)
      v12 = 1;
    else
      v12 = v9 == -1;
    v14 = v12 || v11 == 3;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)setStatus:(int64_t)a3 forItemWithType:(int64_t)a4
{
  -[PKPaymentAuthorizationDataModel setStatus:forItemWithType:notify:](self, "setStatus:forItemWithType:notify:", a3, a4, 1);
}

- (void)setStatus:(int64_t)a3 forItemWithType:(int64_t)a4 notify:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  id v10;

  v5 = a5;
  -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStatus:", a3);
  if (a4 == 3)
  {
    objc_msgSend(v10, "pass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel _setStatus:forPass:](self, "_setStatus:forPass:", a3, v9);

  }
  if (v5)
    -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");

}

- (void)_setStatus:(int64_t)a3 forPass:(id)a4
{
  NSMutableDictionary *statusForPass;
  void *v6;
  id v7;
  void *v8;
  id v9;

  if (a4)
  {
    statusForPass = self->_statusForPass;
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = a4;
    objc_msgSend(v6, "numberWithInteger:", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKey:](statusForPass, "setObject:forKey:", v9, v8);
  }
}

- (int64_t)_statusForPass:(id)a3
{
  NSMutableDictionary *statusForPass;
  void *v4;
  void *v5;
  int64_t v6;

  statusForPass = self->_statusForPass;
  objc_msgSend(a3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](statusForPass, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "integerValue");
  else
    v6 = 0;

  return v6;
}

- (void)fallbackToBypassMode
{
  NSObject *v3;
  void *v4;
  NSMutableDictionary *statusForPass;
  PKPaymentPass *pass;
  PKPaymentApplication *paymentApplication;
  uint8_t v8[16];

  PKLogFacilityTypeGetObject(7uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Falling back to bypass mode", v8, 2u);
  }

  -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", +[PKPaymentCardDataItem dataType](PKPaymentCardDataItem, "dataType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSMutableArray removeObject:](self->_items, "removeObject:", v4);
  statusForPass = self->_statusForPass;
  self->_statusForPass = 0;

  pass = self->_pass;
  self->_pass = 0;

  paymentApplication = self->_paymentApplication;
  self->_paymentApplication = 0;

  self->_mode = 3;
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");

}

- (void)showPeerPaymentCardDataItem:(BOOL)a3 withCardDataItem:(BOOL)a4
{
  _BOOL4 v4;
  int v5;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  if (!a3)
  {
    -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[PKPaymentAuthorizationDataModel _removeDataItem:](self, "_removeDataItem:", v8);

    if (!v4)
      goto LABEL_3;
LABEL_9:
    -[PKPaymentAuthorizationDataModel _ensureItemForClass:](self, "_ensureItemForClass:", objc_opt_class());
    goto LABEL_10;
  }
  -[PKPaymentAuthorizationDataModel _ensureItemForClass:](self, "_ensureItemForClass:", objc_opt_class());
  if (v4)
    goto LABEL_9;
LABEL_3:
  -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[PKPaymentAuthorizationDataModel _removeDataItem:](self, "_removeDataItem:", v7);

LABEL_10:
  -[PKPaymentAuthorizationDataModel updatePeerPaymentPromotionForPeerPaymentQuote:](self, "updatePeerPaymentPromotionForPeerPaymentQuote:", v4 & ~v5);
}

- (void)setFinancingController:(id)a3
{
  objc_storeStrong((id *)&self->_financingController, a3);
  -[PKPaymentAuthorizationDataModel _recomputeHasAnyPayLaterOptions](self, "_recomputeHasAnyPayLaterOptions");
}

- (void)setSelectedFinancingOption:(id)a3
{
  PKPayLaterFinancingOption *v4;
  PKPayLaterFinancingOption *v5;
  PKPayLaterFinancingOption *selectedFinancingOption;
  BOOL v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  PKPayLaterFinancingOption *v15;
  PKPayLaterFinancingOption *v16;
  uint64_t v17;

  v4 = (PKPayLaterFinancingOption *)a3;
  v5 = v4;
  selectedFinancingOption = self->_selectedFinancingOption;
  if (selectedFinancingOption)
    v7 = selectedFinancingOption == v4;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = -[PKPayLaterFinancingOption isAmountDetailsEqualToFinancingOption:](v4, "isAmountDetailsEqualToFinancingOption:");
    selectedFinancingOption = self->_selectedFinancingOption;
    if (!v8)
    {
      objc_storeStrong((id *)&self->_previouslySelectedFinancingOption, self->_selectedFinancingOption);
      selectedFinancingOption = self->_selectedFinancingOption;
    }
  }
  -[PKPayLaterFinancingOption selectionIdentifier](selectedFinancingOption, "selectionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingOption selectionIdentifier](v5, "selectionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  v12 = v10;
  if (v11 == v12)
  {

  }
  else
  {
    v13 = v12;
    if (v11 && v12)
    {
      v14 = objc_msgSend(v11, "isEqualToString:", v12);

      if ((v14 & 1) != 0)
        goto LABEL_15;
    }
    else
    {

    }
    -[NSMutableDictionary removeAllObjects](self->_acceptedApplications, "removeAllObjects");
  }
LABEL_15:
  v15 = self->_selectedFinancingOption;
  self->_selectedFinancingOption = v5;
  v16 = v5;

  v17 = objc_opt_class();
  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", v17);
  -[PKPaymentAuthorizationDataModel _recomputeHasAnyPayLaterOptions](self, "_recomputeHasAnyPayLaterOptions");
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

- (void)setPreviouslySelectedFinancingOption:(id)a3
{
  PKPayLaterFinancingOption *v5;
  PKPayLaterFinancingOption *v6;

  v5 = (PKPayLaterFinancingOption *)a3;
  if (self->_previouslySelectedFinancingOption != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_previouslySelectedFinancingOption, a3);
    -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
    -[PKPaymentAuthorizationDataModel _recomputeHasAnyPayLaterOptions](self, "_recomputeHasAnyPayLaterOptions");
    -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
    v5 = v6;
  }

}

- (void)setAssessmentCollection:(id)a3
{
  PKPayLaterProductAssessmentCollection *v4;
  void (**v5)(void *, void *, void *);
  void *v6;
  void *v7;
  PKPayLaterProductAssessmentCollection *assessmentCollection;
  PKPayLaterProductAssessmentCollection *v9;
  _QWORD aBlock[5];

  v4 = (PKPayLaterProductAssessmentCollection *)a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPaymentAuthorizationDataModel_setAssessmentCollection___block_invoke;
  aBlock[3] = &unk_1E2AC5F78;
  aBlock[4] = self;
  v5 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  -[PKPayLaterProductAssessmentCollection productAssessmentForProductType:](v4, "productAssessmentForProductType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterProductAssessmentCollection productAssessmentForProductType:](self->_assessmentCollection, "productAssessmentForProductType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6, v7);
  assessmentCollection = self->_assessmentCollection;
  self->_assessmentCollection = v4;
  v9 = v4;

  -[PKPaymentAuthorizationDataModel _recomputeHasAnyPayLaterOptions](self, "_recomputeHasAnyPayLaterOptions");
  -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");

}

void __59__PKPaymentAuthorizationDataModel_setAssessmentCollection___block_invoke(uint64_t a1, void *a2, id a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (v5 && a3)
  {
    if ((objc_msgSend(v5, "isEqual:", a3) & 1) != 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (v5 != a3)
  {
LABEL_6:
    v13[0] = CFSTR("financingOptionsUpdated");
    v12[0] = CFSTR("eventType");
    v12[1] = CFSTR("productType");
    PKPayLaterAccountProductTypeToString(objc_msgSend(v6, "productType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v7;
    v12[2] = CFSTR("financingOptionType");
    objc_msgSend(v6, "analyticsFinancingOptionType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v8;
    v12[3] = CFSTR("financingEligibility");
    PKPayLaterFinancingEligibilityToString(objc_msgSend(v6, "financingEligibility"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v9;
    v12[4] = CFSTR("suppressionMode");
    PKApplePayLaterAvailabilityToString(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "applePayLaterAvailability"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[4] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("inApp"), v11);

  }
LABEL_7:

}

- (void)paymentOffersDidUpdate
{
  -[PKPaymentAuthorizationDataModel _recomputeHasAnyPayLaterOptions](self, "_recomputeHasAnyPayLaterOptions");
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

- (void)setSelectedPaymentOffer:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPaymentOffer, a3);
  -[PKPaymentAuthorizationDataModel _updatePaymentOfferDataItem](self, "_updatePaymentOfferDataItem");
  -[PKPaymentAuthorizationDataModel _recomputeHasAnyPayLaterOptions](self, "_recomputeHasAnyPayLaterOptions");
  -[PKPaymentAuthorizationDataModel _notifyModelChanged](self, "_notifyModelChanged");
}

- (void)_updatePaymentOfferDataItem
{
  void *v3;
  int v4;
  id v5;

  if (self->_selectedPaymentOffer
    || (-[PKPaymentOffersController selectedOfferDetails](self->_paymentOffersController, "selectedOfferDetails"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "requiresUserAction"),
        v3,
        v4))
  {
    -[PKPaymentAuthorizationDataModel _didSetItemForClass:](self, "_didSetItemForClass:", objc_opt_class());
  }
  else
  {
    -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", 17);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationDataModel _removeDataItem:](self, "_removeDataItem:", v5);

  }
}

- (void)setPaymentOffersController:(id)a3
{
  objc_storeStrong((id *)&self->_paymentOffersController, a3);
  -[PKPaymentAuthorizationDataModel _recomputeHasAnyPayLaterOptions](self, "_recomputeHasAnyPayLaterOptions");
}

- (void)_recomputeHasAnyPayLaterOptions
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[PKPayLaterFinancingController assessmentCollection](self->_financingController, "assessmentCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eligibleProductAssessments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    self->_hasAnyPayLaterOptions = 1;
  }
  else if (-[PKPaymentOffersController hasAnyEligiblePaymentOfferCriteriaOfType:](self->_paymentOffersController, "hasAnyEligiblePaymentOfferCriteriaOfType:", 1))
  {
    self->_hasAnyPayLaterOptions = 1;
  }
  else
  {
    self->_hasAnyPayLaterOptions = 0;
  }
}

- (unint64_t)connectedCardStateForPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  unint64_t v9;

  v4 = a3;
  -[PKPaymentAuthorizationDataModel primaryAccountIdentifiersWithConnectedCardStateSet](self, "primaryAccountIdentifiersWithConnectedCardStateSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryAccountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    objc_msgSend(v4, "bankConnectAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = 1;
    else
      v9 = 2;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)mode
{
  return self->_mode;
}

- (int64_t)fundingMode
{
  return self->_fundingMode;
}

- (PKPaymentRequest)paymentRequest
{
  return self->_paymentRequest;
}

- (NSArray)paymentContentItems
{
  return self->_paymentContentItems;
}

- (NSString)hostAppLocalizedName
{
  return self->_hostAppLocalizedName;
}

- (void)setHostAppLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_hostAppLocalizedName, a3);
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void)setHostApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)relevantPassUniqueID
{
  return self->_relevantPassUniqueID;
}

- (void)setRelevantPassUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_relevantPassUniqueID, a3);
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void)setTeamIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_teamIdentifier, a3);
}

- (NSString)billingAgreement
{
  return self->_billingAgreement;
}

- (NSString)couponCode
{
  return self->_couponCode;
}

- (unint64_t)numberOfOutstandingCouponCodeUpdates
{
  return self->_numberOfOutstandingCouponCodeUpdates;
}

- (CNContact)shippingEmail
{
  return self->_shippingEmail;
}

- (BOOL)isHideMyEmailLoading
{
  return self->_isHideMyEmailLoading;
}

- (void)setIsHideMyEmailLoading:(BOOL)a3
{
  self->_isHideMyEmailLoading = a3;
}

- (CNContact)shippingPhone
{
  return self->_shippingPhone;
}

- (CNContact)shippingName
{
  return self->_shippingName;
}

- (CNContact)shippingAddress
{
  return self->_shippingAddress;
}

- (CNContact)originalShippingAddress
{
  return self->_originalShippingAddress;
}

- (void)setOriginalShippingAddress:(id)a3
{
  objc_storeStrong((id *)&self->_originalShippingAddress, a3);
}

- (PKShippingMethod)shippingMethod
{
  return self->_shippingMethod;
}

- (NSString)shippingType
{
  return self->_shippingType;
}

- (void)setShippingType:(id)a3
{
  objc_storeStrong((id *)&self->_shippingType, a3);
}

- (BOOL)isShippingEditable
{
  return self->_shippingEditable;
}

- (void)setShippingEditable:(BOOL)a3
{
  self->_shippingEditable = a3;
}

- (NSString)shippingEditableMessage
{
  return self->_shippingEditableMessage;
}

- (NSArray)paymentErrors
{
  return self->_paymentErrors;
}

- (PKPayment)payment
{
  return self->_payment;
}

- (void)setPayment:(id)a3
{
  objc_storeStrong((id *)&self->_payment, a3);
}

- (NSArray)paymentContactFormatErrors
{
  return self->_paymentContactFormatErrors;
}

- (PKContactFormatValidator)contactFormatValidator
{
  return self->_contactFormatValidator;
}

- (void)setContactFormatValidator:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatValidator, a3);
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void)setRecents:(id)a3
{
  objc_storeStrong((id *)&self->_recents, a3);
}

- (void)setLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_library, a3);
}

- (PKPaymentWebService)paymentWebService
{
  return self->_paymentWebService;
}

- (void)setPaymentWebService:(id)a3
{
  objc_storeStrong((id *)&self->_paymentWebService, a3);
}

- (PKPeerPaymentService)peerPaymentService
{
  return self->_peerPaymentService;
}

- (PKPaymentPass)peerPaymentPass
{
  return self->_peerPaymentPass;
}

- (void)setPeerPaymentPass:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentPass, a3);
}

- (NSArray)pendingTransactions
{
  return self->_pendingTransactions;
}

- (void)setPendingTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTransactions, a3);
}

- (PKPaymentOrderDetails)pendingOrderDetails
{
  return self->_pendingOrderDetails;
}

- (void)setPendingOrderDetails:(id)a3
{
  objc_storeStrong((id *)&self->_pendingOrderDetails, a3);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (NSDecimalNumber)initialTransactionAmount
{
  return self->_initialTransactionAmount;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (void)setPeerPaymentAccount:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentAccount, a3);
}

- (PKPeerPaymentQuote)peerPaymentQuote
{
  return self->_peerPaymentQuote;
}

- (BOOL)supportsPreservePeerPaymentBalance
{
  return self->_supportsPreservePeerPaymentBalance;
}

- (void)setSupportsPreservePeerPaymentBalance:(BOOL)a3
{
  self->_supportsPreservePeerPaymentBalance = a3;
}

- (BOOL)usePeerPaymentBalance
{
  return self->_usePeerPaymentBalance;
}

- (void)setUsePeerPaymentBalance:(BOOL)a3
{
  self->_usePeerPaymentBalance = a3;
}

- (PKBankAccountInformation)bankAccount
{
  return self->_bankAccount;
}

- (PKCurrencyAmount)peerPaymentBalanceForAccountPayment
{
  return self->_peerPaymentBalanceForAccountPayment;
}

- (NSString)installmentBindToken
{
  return self->_installmentBindToken;
}

- (void)setInstallmentBindToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (NSString)installmentGroupIdentifier
{
  return self->_installmentGroupIdentifier;
}

- (void)setInstallmentGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (NSDecimalNumber)installmentAuthorizationAmount
{
  return self->_installmentAuthorizationAmount;
}

- (void)setInstallmentAuthorizationAmount:(id)a3
{
  objc_storeStrong((id *)&self->_installmentAuthorizationAmount, a3);
}

- (PKPaymentApplication)paymentApplication
{
  return self->_paymentApplication;
}

- (BOOL)canAddPasses
{
  return self->_canAddPasses;
}

- (void)setCanAddPasses:(BOOL)a3
{
  self->_canAddPasses = a3;
}

- (BOOL)supportsEmptyPass
{
  return self->_supportsEmptyPass;
}

- (void)setSupportsEmptyPass:(BOOL)a3
{
  self->_supportsEmptyPass = a3;
}

- (PKPaymentInstructions)instructions
{
  return self->_instructions;
}

- (void)setInstructions:(id)a3
{
  objc_storeStrong((id *)&self->_instructions, a3);
}

- (NSArray)allRemoteDevices
{
  return self->_allRemoteDevices;
}

- (PKRemotePaymentInstrument)remotePaymentInstrument
{
  return self->_remotePaymentInstrument;
}

- (PKRemotePaymentInstrument)initialRemotePaymentInstrument
{
  return self->_initialRemotePaymentInstrument;
}

- (void)setInitialRemotePaymentInstrument:(id)a3
{
  objc_storeStrong((id *)&self->_initialRemotePaymentInstrument, a3);
}

- (NSSet)allAcceptedRemotePaymentInstruments
{
  return self->_allAcceptedRemotePaymentInstruments;
}

- (NSSet)allUnavailableRemotePaymentInstruments
{
  return self->_allUnavailableRemotePaymentInstruments;
}

- (PKPayLaterFinancingOption)selectedFinancingOption
{
  return self->_selectedFinancingOption;
}

- (PKPayLaterFinancingOption)previouslySelectedFinancingOption
{
  return self->_previouslySelectedFinancingOption;
}

- (PKPayLaterProductAssessmentCollection)assessmentCollection
{
  return self->_assessmentCollection;
}

- (PKPayLaterFinancingController)financingController
{
  return self->_financingController;
}

- (BOOL)hasAnyPayLaterOptions
{
  return self->_hasAnyPayLaterOptions;
}

- (void)setHasAnyPayLaterOptions:(BOOL)a3
{
  self->_hasAnyPayLaterOptions = a3;
}

- (PKPaymentOffersController)paymentOffersController
{
  return self->_paymentOffersController;
}

- (PKSelectedPaymentOffer)selectedPaymentOffer
{
  return self->_selectedPaymentOffer;
}

- (CNContact)cachedRecentAddress
{
  return self->_cachedRecentAddress;
}

- (void)setCachedRecentAddress:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRecentAddress, a3);
}

- (NSMutableSet)primaryAccountIdentifiersWithConnectedCardStateSet
{
  return self->_primaryAccountIdentifiersWithConnectedCardStateSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccountIdentifiersWithConnectedCardStateSet, 0);
  objc_storeStrong((id *)&self->_cachedRecentAddress, 0);
  objc_storeStrong((id *)&self->_selectedPaymentOffer, 0);
  objc_storeStrong((id *)&self->_paymentOffersController, 0);
  objc_storeStrong((id *)&self->_financingController, 0);
  objc_storeStrong((id *)&self->_assessmentCollection, 0);
  objc_storeStrong((id *)&self->_previouslySelectedFinancingOption, 0);
  objc_storeStrong((id *)&self->_selectedFinancingOption, 0);
  objc_storeStrong((id *)&self->_allUnavailableRemotePaymentInstruments, 0);
  objc_storeStrong((id *)&self->_allAcceptedRemotePaymentInstruments, 0);
  objc_storeStrong((id *)&self->_initialRemotePaymentInstrument, 0);
  objc_storeStrong((id *)&self->_remotePaymentInstrument, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_installmentAuthorizationAmount, 0);
  objc_storeStrong((id *)&self->_installmentGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_installmentBindToken, 0);
  objc_storeStrong((id *)&self->_peerPaymentBalanceForAccountPayment, 0);
  objc_storeStrong((id *)&self->_bankAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentQuote, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_initialTransactionAmount, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_pendingOrderDetails, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
  objc_storeStrong((id *)&self->_peerPaymentPass, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
  objc_storeStrong((id *)&self->_paymentContactFormatErrors, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_paymentErrors, 0);
  objc_storeStrong((id *)&self->_shippingEditableMessage, 0);
  objc_storeStrong((id *)&self->_shippingType, 0);
  objc_storeStrong((id *)&self->_shippingMethod, 0);
  objc_storeStrong((id *)&self->_originalShippingAddress, 0);
  objc_storeStrong((id *)&self->_shippingAddress, 0);
  objc_storeStrong((id *)&self->_shippingName, 0);
  objc_storeStrong((id *)&self->_shippingPhone, 0);
  objc_storeStrong((id *)&self->_shippingEmail, 0);
  objc_storeStrong((id *)&self->_couponCode, 0);
  objc_storeStrong((id *)&self->_billingAgreement, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_relevantPassUniqueID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_hostAppLocalizedName, 0);
  objc_storeStrong((id *)&self->_paymentContentItems, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_clientErrors, 0);
  objc_storeStrong((id *)&self->_paymentApplicationIdentifierForErrors, 0);
  objc_storeStrong(&self->_bankConnectOsloProvider, 0);
  objc_storeStrong((id *)&self->_balancesProviderQueue, 0);
  objc_storeStrong((id *)&self->_appleCardEnhancedMerchant, 0);
  objc_storeStrong((id *)&self->_acceptedApplications, 0);
  objc_storeStrong((id *)&self->_statusForPass, 0);
  objc_storeStrong((id *)&self->_allRemoteDevices, 0);
  objc_storeStrong((id *)&self->_remoteDeviceToAcceptedInstruments, 0);
  objc_storeStrong((id *)&self->_instrumentToDeviceMap, 0);
  objc_storeStrong((id *)&self->_unavailablePasses, 0);
  objc_storeStrong((id *)&self->_acceptedPasses, 0);
  objc_storeStrong((id *)&self->_billingAddressForFundingSource, 0);
  objc_storeStrong((id *)&self->_typeToItemMap, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end

@implementation PKPaymentDefaultDataProvider

- (PKPaymentDefaultDataProvider)init
{
  PKSecureElement *v3;
  PKPaymentDefaultDataProvider *v4;
  PKPaymentService *v5;
  PKPaymentService *paymentService;

  v3 = objc_alloc_init(PKSecureElement);
  v4 = -[PKPaymentDefaultDataProvider initWithPaymentService:secureElement:](self, "initWithPaymentService:secureElement:", 0, v3);

  if (v4)
  {
    v5 = -[PKPaymentService initWithDelegate:]([PKPaymentService alloc], "initWithDelegate:", v4);
    paymentService = v4->_paymentService;
    v4->_paymentService = v5;

  }
  return v4;
}

- (PKPaymentDefaultDataProvider)initWithPaymentService:(id)a3 secureElement:(id)a4
{
  id v7;
  id v8;
  PKPaymentDefaultDataProvider *v9;
  PKPaymentDefaultDataProvider *v10;
  uint64_t v11;
  NSHashTable *delegates;
  dispatch_queue_t v13;
  OS_dispatch_queue *replyQueue;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentDefaultDataProvider;
  v9 = -[PKPaymentDefaultDataProvider init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_secureElement, a4);
    objc_storeStrong((id *)&v10->_paymentService, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v11 = objc_claimAutoreleasedReturnValue();
    delegates = v10->_delegates;
    v10->_delegates = (NSHashTable *)v11;

    v10->_delegateLock._os_unfair_lock_opaque = 0;
    v13 = dispatch_queue_create("com.apple.passkitcore.paymentdataprovider.replyQueue", 0);
    replyQueue = v10->_replyQueue;
    v10->_replyQueue = (OS_dispatch_queue *)v13;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPaymentService setDelegate:](self->_paymentService, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentDefaultDataProvider;
  -[PKPaymentDefaultDataProvider dealloc](&v3, sel_dealloc);
}

- (PKPaymentWebService)paymentWebService
{
  PKPaymentWebService *paymentWebService;
  PKPaymentWebService *v4;
  PKPaymentWebService *v5;

  paymentWebService = self->_paymentWebService;
  if (!paymentWebService)
  {
    +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
    v4 = (PKPaymentWebService *)objc_claimAutoreleasedReturnValue();
    v5 = self->_paymentWebService;
    self->_paymentWebService = v4;

    paymentWebService = self->_paymentWebService;
  }
  return paymentWebService;
}

- (int64_t)apiVersion
{
  return 2;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained != obj)
  {
    if (WeakRetained)
      -[PKPaymentDefaultDataProvider removeDelegate:](self, "removeDelegate:", WeakRetained);
    objc_storeWeak((id *)&self->_delegate, obj);
    if (obj)
      -[PKPaymentDefaultDataProvider addDelegate:](self, "addDelegate:");
  }

}

- (void)addDelegate:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_delegateLock);
    -[NSHashTable addObject:](self->_delegates, "addObject:", v4);
    os_unfair_lock_unlock(&self->_delegateLock);
  }

}

- (void)removeDelegate:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_delegateLock);
    -[NSHashTable removeObject:](self->_delegates, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_delegateLock);
  }

}

- (void)_accessDelegatesWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *replyQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_delegateLock);
    -[NSHashTable allObjects](self->_delegates, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_delegateLock);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__PKPaymentDefaultDataProvider__accessDelegatesWithHandler___block_invoke;
    v8[3] = &unk_1E2ABE058;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    dispatch_async(replyQueue, v8);

  }
}

void __60__PKPaymentDefaultDataProvider__accessDelegatesWithHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)isDeviceInRestrictedMode
{
  return -[PKSecureElement isInRestrictedMode](self->_secureElement, "isInRestrictedMode");
}

- (NSString)defaultPaymentPassIdentifier
{
  return -[PKPaymentService defaultPaymentPassUniqueIdentifier](self->_paymentService, "defaultPaymentPassUniqueIdentifier");
}

- (id)expressPassConfigurations
{
  return -[PKPaymentService expressPassConfigurations](self->_paymentService, "expressPassConfigurations");
}

- (NSString)secureElementIdentifier
{
  return -[PKSecureElement primarySecureElementIdentifier](self->_secureElement, "primarySecureElementIdentifier");
}

- (BOOL)secureElementIsProductionSigned
{
  return -[PKSecureElement isProductionSigned](self->_secureElement, "isProductionSigned");
}

- (id)transactionsAppLaunchTokenForPassWithUniqueIdentifier:(id)a3
{
  return -[PKPaymentService transactionsAppLaunchTokenForPassWithUniqueIdentifier:](self->_paymentService, "transactionsAppLaunchTokenForPassWithUniqueIdentifier:", a3);
}

- (id)defaultPaymentApplicationForPassUniqueIdentifier:(id)a3
{
  return -[PKPaymentService defaultPaymentApplicationForPassUniqueIdentifier:](self->_paymentService, "defaultPaymentApplicationForPassUniqueIdentifier:", a3);
}

- (PKOSVersionRequirement)deviceVersion
{
  return (PKOSVersionRequirement *)+[PKOSVersionRequirement fromDeviceVersion](PKOSVersionRequirement, "fromDeviceVersion");
}

- (void)setPaymentHandoffDisabled:(BOOL)a3
{
  PKSetHandoffPaymentsDisabled(a3);
}

- (void)setOrderManagementDisabled:(BOOL)a3
{
  PKSetOrderManagementDisabled(a3);
}

- (void)setOrderManagementNotificationsDisabled:(BOOL)a3
{
  PKSetOrderManagementNotificationsDisabled(a3);
}

- (void)setDefaultPaymentPassIdentifier:(id)a3
{
  -[PKPaymentService setDefaultPaymentPassUniqueIdentifier:](self->_paymentService, "setDefaultPaymentPassUniqueIdentifier:", a3);
}

- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4
{
  -[PKPaymentService conflictingExpressPassIdentifiersForPassConfiguration:withCompletion:](self->_paymentService, "conflictingExpressPassIdentifiersForPassConfiguration:withCompletion:", a3, a4);
}

- (void)setExpressWithPassConfiguration:(id)a3 credential:(id)a4 completion:(id)a5
{
  -[PKPaymentService setExpressWithPassConfiguration:credential:handler:](self->_paymentService, "setExpressWithPassConfiguration:credential:handler:", a3, a4, a5);
}

- (void)passUpgradeWithRequest:(id)a3 pass:(id)a4 visibleViewController:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a6;
  v9 = a4;
  v10 = a3;
  +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "targetDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "noteProvisioningDidBegin");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__PKPaymentDefaultDataProvider_passUpgradeWithRequest_pass_visibleViewController_completion___block_invoke;
  v15[3] = &unk_1E2AD2ED8;
  v16 = v12;
  v17 = v8;
  v13 = v12;
  v14 = v8;
  objc_msgSend(v13, "paymentWebService:requestPassUpgrade:pass:completion:", v11, v10, v9, v15);

}

uint64_t __93__PKPaymentDefaultDataProvider_passUpgradeWithRequest_pass_visibleViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "noteProvisioningDidEnd");
}

- (void)removeExpressPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService removeExpressPassWithUniqueIdentifier:completion:](self->_paymentService, "removeExpressPassWithUniqueIdentifier:completion:", a3, a4);
}

- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5
{
  -[PKPaymentService transitStateWithPassUniqueIdentifier:paymentApplication:completion:](self->_paymentService, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", a3, a4, a5);
}

- (void)credentialWithIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService credentialWithIdentifier:completion:](self->_paymentService, "credentialWithIdentifier:completion:", a3, a4);
}

- (void)setDefaultPaymentApplication:(id)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5
{
  -[PKPaymentService setDefaultPaymentApplication:forPassUniqueIdentifier:completion:](self->_paymentService, "setDefaultPaymentApplication:forPassUniqueIdentifier:completion:", a3, a4, a5);
}

- (void)peerPaymentCounterpartHandlesForTransactionSourceIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  -[PKPaymentService peerPaymentCounterpartHandlesForTransactionSourceIdentifier:startDate:endDate:completion:](self->_paymentService, "peerPaymentCounterpartHandlesForTransactionSourceIdentifier:startDate:endDate:completion:", a3, a4, a5, a6);
}

- (void)hasTransactionsForTransactionSourceIdentifiers:(id)a3 completion:(id)a4
{
  -[PKPaymentService hasTransactionsForTransactionSourceIdentifiers:completion:](self->_paymentService, "hasTransactionsForTransactionSourceIdentifiers:completion:", a3, a4);
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
  -[PKPaymentService transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:](self->_paymentService, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", a3, a4, a5, a6, a7, a8);
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10
{
  -[PKPaymentService transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:orderedByDate:limit:completion:](self->_paymentService, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:orderedByDate:limit:completion:", a3, a4, a5, a6, a7, a8);
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 limit:(int64_t)a6 completion:(id)a7
{
  -[PKPaymentService transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:limit:completion:](self->_paymentService, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:limit:completion:", a3, a4, a5, a6, a7);
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withPeerPaymentCounterpartHandles:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8
{
  -[PKPaymentService transactionsForTransactionSourceIdentifiers:withPeerPaymentCounterpartHandles:withTransactionSource:withBackingData:limit:completion:](self->_paymentService, "transactionsForTransactionSourceIdentifiers:withPeerPaymentCounterpartHandles:withTransactionSource:withBackingData:limit:completion:", a3, a4, a5, a6, a7, a8);
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 matchingMerchant:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8
{
  -[PKPaymentService transactionsForTransactionSourceIdentifiers:matchingMerchant:withTransactionSource:withBackingData:limit:completion:](self->_paymentService, "transactionsForTransactionSourceIdentifiers:matchingMerchant:withTransactionSource:withBackingData:limit:completion:", a3, a4, a5, a6, a7, a8);
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withMerchantCategory:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10
{
  -[PKPaymentService transactionsForTransactionSourceIdentifiers:withMerchantCategory:withTransactionSource:withBackingData:startDate:endDate:limit:completion:](self->_paymentService, "transactionsForTransactionSourceIdentifiers:withMerchantCategory:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", a3, a4, a5, a6, a7, a8);
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionType:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10
{
  -[PKPaymentService transactionsForTransactionSourceIdentifiers:withTransactionType:withTransactionSource:withBackingData:startDate:endDate:limit:completion:](self->_paymentService, "transactionsForTransactionSourceIdentifiers:withTransactionType:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", a3, a4, a5, a6, a7, a8);
}

- (void)pendingTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
  -[PKPaymentService pendingTransactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:](self->_paymentService, "pendingTransactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", a3, a4, a5, a6, a7, a8);
}

- (void)approvedTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
  -[PKPaymentService approvedTransactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:](self->_paymentService, "approvedTransactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", a3, a4, a5, a6, a7, a8);
}

- (void)transactionCountByPeriodForRequest:(id)a3 calendar:(id)a4 calendarUnit:(unint64_t)a5 includePurchaseTotal:(BOOL)a6 completion:(id)a7
{
  -[PKPaymentService transactionCountByPeriodForRequest:calendar:unit:includePurchaseTotal:completion:](self->_paymentService, "transactionCountByPeriodForRequest:calendar:unit:includePurchaseTotal:completion:", a3, a4, a5, a6, a7);
}

- (void)transactionsForRequest:(id)a3 completion:(id)a4
{
  -[PKPaymentService transactionsForRequest:completion:](self->_paymentService, "transactionsForRequest:completion:", a3, a4);
}

- (id)transactionsForRequest:(id)a3
{
  return -[PKPaymentService transactionsForRequest:](self->_paymentService, "transactionsForRequest:", a3);
}

- (void)transactionsTotalAmountForRequest:(id)a3 completion:(id)a4
{
  -[PKPaymentService transactionsTotalAmountForRequest:completion:](self->_paymentService, "transactionsTotalAmountForRequest:completion:", a3, a4);
}

- (void)transactionWithServiceIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService ambiguousTransactionWithServiceIdentifier:completion:](self->_paymentService, "ambiguousTransactionWithServiceIdentifier:completion:", a3, a4);
}

- (void)transactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5
{
  -[PKPaymentService transactionWithServiceIdentifier:transactionSourceIdentifier:completion:](self->_paymentService, "transactionWithServiceIdentifier:transactionSourceIdentifier:completion:", a3, a4, a5);
}

- (void)transactionWithReferenceIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService transactionWithReferenceIdentifier:completion:](self->_paymentService, "transactionWithReferenceIdentifier:completion:", a3, a4);
}

- (void)installmentTransactionsForInstallmentPlanIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService installmentTransactionsForInstallmentPlanIdentifier:completion:](self->_paymentService, "installmentTransactionsForInstallmentPlanIdentifier:completion:", a3, a4);
}

- (void)cashbackByPeriodForTransactionSourceIdentifiers:(id)a3 withStartDate:(id)a4 endDate:(id)a5 calendar:(id)a6 calendarUnit:(unint64_t)a7 type:(unint64_t)a8 completion:(id)a9
{
  -[PKPaymentService cashbackByPeriodForTransactionSourceIdentifiers:withStartDate:endDate:calendar:calendarUnit:type:completion:](self->_paymentService, "cashbackByPeriodForTransactionSourceIdentifiers:withStartDate:endDate:calendar:calendarUnit:type:completion:", a3, a4, a5, a6, a7, a8);
}

- (id)cashbackByPeriodForTransactionSourceIdentifiers:(id)a3 withStartDate:(id)a4 endDate:(id)a5 calendar:(id)a6 calendarUnit:(unint64_t)a7 type:(unint64_t)a8
{
  return -[PKPaymentService cashbackByPeriodForTransactionSourceIdentifiers:withStartDate:endDate:calendar:calendarUnit:type:](self->_paymentService, "cashbackByPeriodForTransactionSourceIdentifiers:withStartDate:endDate:calendar:calendarUnit:type:", a3, a4, a5, a6, a7, a8);
}

- (void)transactionsRequiringReviewForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService transactionsRequiringReviewForAccountWithIdentifier:completion:](self->_paymentService, "transactionsRequiringReviewForAccountWithIdentifier:completion:", a3, a4);
}

- (void)submitTransactionAnswerForTransaction:(id)a3 questionType:(unint64_t)a4 answer:(id)a5 completion:(id)a6
{
  -[PKPaymentService submitTransactionAnswerForTransaction:questionType:answer:completion:](self->_paymentService, "submitTransactionAnswerForTransaction:questionType:answer:completion:", a3, a4, a5, a6);
}

- (void)installmentPlansWithTransactionReferenceIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService installmentPlansWithTransactionReferennceIdentifier:completion:](self->_paymentService, "installmentPlansWithTransactionReferennceIdentifier:completion:", a3, a4);
}

- (void)installmentPlanTransactionsForTransactionSourceIdentifiers:(id)a3 accountIdentifier:(id)a4 redeemed:(BOOL)a5 withRedemptionType:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 completion:(id)a9
{
  -[PKPaymentService installmentPlanTransactionsForTransactionSourceIdentifiers:accountIdentifier:redeemed:withRedemptionType:startDate:endDate:completion:](self->_paymentService, "installmentPlanTransactionsForTransactionSourceIdentifiers:accountIdentifier:redeemed:withRedemptionType:startDate:endDate:completion:", a3, a4, a5, a6, a7, a8);
}

- (void)transactionReceiptWithUniqueID:(id)a3 completion:(id)a4
{
  -[PKPaymentService transactionReceiptWithUniqueID:completion:](self->_paymentService, "transactionReceiptWithUniqueID:completion:", a3, a4);
}

- (void)transactionReceiptForTransactionWithIdentifier:(id)a3 updateIfNecessary:(BOOL)a4 completion:(id)a5
{
  -[PKPaymentService transactionReceiptForTransactionWithIdentifier:updateIfNecessary:completion:](self->_paymentService, "transactionReceiptForTransactionWithIdentifier:updateIfNecessary:completion:", a3, a4, a5);
}

- (void)transactionTagsForTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService transactionTagsForTransactionWithIdentifier:completion:](self->_paymentService, "transactionTagsForTransactionWithIdentifier:completion:", a3, a4);
}

- (void)mapsMerchantsWithCompletion:(id)a3
{
  -[PKPaymentService mapsMerchantsWithCompletion:](self->_paymentService, "mapsMerchantsWithCompletion:", a3);
}

- (void)deletePaymentTransactionWithIdentifier:(id)a3
{
  -[PKPaymentService deletePaymentTransactionWithIdentifier:](self->_paymentService, "deletePaymentTransactionWithIdentifier:", a3);
}

- (void)deletePaymentTransactionsWithIdentifiers:(id)a3
{
  -[PKPaymentService deletePaymentTransactionsWithIdentifiers:](self->_paymentService, "deletePaymentTransactionsWithIdentifiers:", a3);
}

- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService balancesForPaymentPassWithUniqueIdentifier:completion:](self->_paymentService, "balancesForPaymentPassWithUniqueIdentifier:completion:", a3, a4);
}

- (void)plansForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService plansForPaymentPassWithUniqueIdentifier:completion:](self->_paymentService, "plansForPaymentPassWithUniqueIdentifier:completion:", a3, a4);
}

- (void)balanceReminderThresholdForBalance:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
  -[PKPaymentService balanceReminderThresholdForBalance:pass:withCompletion:](self->_paymentService, "balanceReminderThresholdForBalance:pass:withCompletion:", a3, a4, a5);
}

- (void)setBalanceReminder:(id)a3 forBalance:(id)a4 pass:(id)a5 completion:(id)a6
{
  -[PKPaymentService setBalanceReminder:forBalance:pass:completion:](self->_paymentService, "setBalanceReminder:forBalance:pass:completion:", a3, a4, a5, a6);
}

- (void)cancelAutoTopUpForPassWithUniqueIdentifier:(id)a3 balanceIdentifiers:(id)a4 completion:(id)a5
{
  -[PKPaymentService cancelAutoTopUpForPassWithUniqueIdentifier:balanceIdentifiers:completion:](self->_paymentService, "cancelAutoTopUpForPassWithUniqueIdentifier:balanceIdentifiers:completion:", a3, a4, a5);
}

- (void)commutePlanReminderForCommutePlan:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
  -[PKPaymentService commutePlanReminderForCommputePlan:pass:withCompletion:](self->_paymentService, "commutePlanReminderForCommputePlan:pass:withCompletion:", a3, a4, a5);
}

- (void)setCommutePlanReminder:(id)a3 forCommutePlan:(id)a4 pass:(id)a5 completion:(id)a6
{
  -[PKPaymentService setCommutePlanReminder:forCommutePlan:pass:completion:](self->_paymentService, "setCommutePlanReminder:forCommutePlan:pass:completion:", a3, a4, a5, a6);
}

- (void)messagesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService messagesForPaymentPassWithUniqueIdentifier:completion:](self->_paymentService, "messagesForPaymentPassWithUniqueIdentifier:completion:", a3, a4);
}

- (void)archiveMessageWithIdentifier:(id)a3
{
  -[PKPaymentService archiveMessageWithIdentifier:](self->_paymentService, "archiveMessageWithIdentifier:", a3);
}

- (id)messagesAppLaunchTokenForPassWithUniqueIdentifier:(id)a3
{
  return -[PKPaymentService messagesAppLaunchTokenForPassWithUniqueIdentifier:](self->_paymentService, "messagesAppLaunchTokenForPassWithUniqueIdentifier:", a3);
}

- (BOOL)supportsTransactionsForPass:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "secureElementPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isAccessPass") & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    -[PKPaymentWebService targetDevice](self->_paymentWebService, "targetDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "secureElementIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPrecursorPass:", v7) ^ 1;

  }
  return v5;
}

- (BOOL)supportsMessagesForPass:(id)a3
{
  return 1;
}

- (BOOL)supportsNotificationsForPass:(id)a3
{
  return 1;
}

- (BOOL)supportsInAppPaymentsForPass:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceInAppPaymentApplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3
{
  return +[PKSecureElement supportsExpressForAutomaticSelectionTechnologyType:](PKSecureElement, "supportsExpressForAutomaticSelectionTechnologyType:", a3);
}

- (BOOL)supportsAddingPaymentPasses
{
  return 1;
}

- (void)familyMembersWithCompletion:(id)a3
{
  -[PKPaymentService familyMembersWithCompletion:](self->_paymentService, "familyMembersWithCompletion:", a3);
}

- (void)photosForFamilyMembersWithDSIDs:(id)a3 completion:(id)a4
{
  -[PKPaymentService photosForFamilyMembersWithDSIDs:completion:](self->_paymentService, "photosForFamilyMembersWithDSIDs:completion:", a3, a4);
}

- (void)featureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService featureApplicationsForAccountIdentifier:completion:](self->_paymentService, "featureApplicationsForAccountIdentifier:completion:", a3, a4);
}

- (id)paymentRewardsBalanceWithIdentifier:(id)a3
{
  return -[PKPaymentService paymentRewardsBalanceWithIdentifier:](self->_paymentService, "paymentRewardsBalanceWithIdentifier:", a3);
}

- (id)paymentRewardsRedemptionForPaymentHash:(id)a3
{
  return -[PKPaymentService paymentRewardsRedemptionForPaymentHash:](self->_paymentService, "paymentRewardsRedemptionForPaymentHash:", a3);
}

- (void)tilesForPassWithUniqueIdentifier:(id)a3 context:(int64_t)a4 completion:(id)a5
{
  -[PKPaymentService tilesForPassWithUniqueIdentifier:context:completion:](self->_paymentService, "tilesForPassWithUniqueIdentifier:context:completion:", a3, a4, a5);
}

- (void)sharingCapabilitiesForPassIdentifier:(id)a3 outHasShares:(BOOL *)a4 outHasShareableEntitlements:(BOOL *)a5
{
  -[PKPaymentService sharingCapabilitiesForPassIdentifier:outHasShares:outHasShareableEntitlements:](self->_paymentService, "sharingCapabilitiesForPassIdentifier:outHasShares:outHasShareableEntitlements:", a3, a4, a5);
}

- (void)setHidePayLaterOptions:(BOOL)a3
{
  PKSetHidePayLaterOptions(a3);
}

- (void)setHideCardBenefitPayLater:(BOOL)a3
{
  PKSetHideCardBenefitPayLater(a3);
}

- (void)setHideCardBenefitRewards:(BOOL)a3
{
  PKSetHideCardBenefitRewards(a3);
}

- (void)didUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__PKPaymentDefaultDataProvider_didUpdateDefaultPaymentPassWithUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E2AD2F00;
  v7 = v4;
  v5 = v4;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v6);

}

void __80__PKPaymentDefaultDataProvider_didUpdateDefaultPaymentPassWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didUpdateDefaultPaymentPassWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke;
  v8[3] = &unk_1E2AD2F28;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v8);

}

void __88__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentPassWithUniqueIdentifier:didEnableMessageService:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveMessage:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didReceiveMessage___block_invoke;
  v10[3] = &unk_1E2AD2F50;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v10);

}

void __82__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didReceiveMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentPassWithUniqueIdentifier:didReceiveMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__PKPaymentDefaultDataProvider_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke;
  v12[3] = &unk_1E2AD2F78;
  v13 = v8;
  v14 = v9;
  v15 = a5;
  v10 = v9;
  v11 = v8;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v12);

}

void __83__PKPaymentDefaultDataProvider_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "passWithUniqueIdentifier:didUpdateTiles:forContext:", a1[4], a1[5], a1[6]);

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke;
  v8[3] = &unk_1E2AD2F28;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v8);

}

void __92__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentPassWithUniqueIdentifier:didEnableTransactionService:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__PKPaymentDefaultDataProvider_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  v10[3] = &unk_1E2AD2F50;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v10);

}

void __82__PKPaymentDefaultDataProvider_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transactionSourceIdentifier:didReceiveTransaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__PKPaymentDefaultDataProvider_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke;
  v10[3] = &unk_1E2AD2F50;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v10);

}

void __95__PKPaymentDefaultDataProvider_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transactionSourceIdentifier:didRemoveTransactionWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didRemoveTransactionsWithSourceIdentifierMapping:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__PKPaymentDefaultDataProvider_didRemoveTransactionsWithSourceIdentifierMapping___block_invoke;
  v6[3] = &unk_1E2AD2F00;
  v7 = v4;
  v5 = v4;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v6);

}

void __81__PKPaymentDefaultDataProvider_didRemoveTransactionsWithSourceIdentifierMapping___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didRemoveTransactionsWithSourceIdentifierMapping:", *(_QWORD *)(a1 + 32));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  v10[3] = &unk_1E2AD2F50;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v10);

}

void __99__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "paymentPassWithUniqueIdentifier:didUpdateWithTransitPassProperties:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "felicaProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paymentPassWithUniqueIdentifier:didUpdateWithFelicaPassProperties:", v3, v4);

  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  v10[3] = &unk_1E2AD2F50;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v10);

}

void __88__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentPassWithUniqueIdentifier:didReceiveBalanceUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
  v10[3] = &unk_1E2AD2F50;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v10);

}

void __85__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentPassWithUniqueIdentifier:didReceivePlanUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5
{
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

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __114__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalanceWithIdentifier___block_invoke;
  v14[3] = &unk_1E2AD2FA0;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v14);

}

void __114__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalanceWithIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentPassWithUniqueIdentifier:didUpdateBalanceReminder:forBalanceWithIdentifier:", a1[4], a1[5], a1[6]);

}

- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__PKPaymentDefaultDataProvider_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E2AD2F00;
  v7 = v4;
  v5 = v4;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v6);

}

void __83__PKPaymentDefaultDataProvider_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sharesDidUpdateWithPaymentPassWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)credential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __99__PKPaymentDefaultDataProvider_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke;
  v12[3] = &unk_1E2AD2F78;
  v13 = v8;
  v14 = v9;
  v15 = a5;
  v10 = v9;
  v11 = v8;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v12);

}

void __99__PKPaymentDefaultDataProvider_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "credential:forPaymentApplication:didUpdateRangingSuspensionReasons:", a1[4], a1[5], a1[6]);

}

- (void)transactionWithIdentifier:(id)a3 didDownloadTransactionReceipt:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__PKPaymentDefaultDataProvider_transactionWithIdentifier_didDownloadTransactionReceipt___block_invoke;
  v10[3] = &unk_1E2AD2F50;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v10);

}

void __88__PKPaymentDefaultDataProvider_transactionWithIdentifier_didDownloadTransactionReceipt___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transactionWithIdentifier:didDownloadTransactionReceipt:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)featureApplicationAdded:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PKPaymentDefaultDataProvider_featureApplicationAdded___block_invoke;
  v6[3] = &unk_1E2AD2F00;
  v7 = v4;
  v5 = v4;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v6);

}

void __56__PKPaymentDefaultDataProvider_featureApplicationAdded___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureApplicationAdded:", *(_QWORD *)(a1 + 32));

}

- (void)featureApplicationChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PKPaymentDefaultDataProvider_featureApplicationChanged___block_invoke;
  v6[3] = &unk_1E2AD2F00;
  v7 = v4;
  v5 = v4;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v6);

}

void __58__PKPaymentDefaultDataProvider_featureApplicationChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureApplicationChanged:", *(_QWORD *)(a1 + 32));

}

- (void)featureApplicationRemoved:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PKPaymentDefaultDataProvider_featureApplicationRemoved___block_invoke;
  v6[3] = &unk_1E2AD2F00;
  v7 = v4;
  v5 = v4;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v6);

}

void __58__PKPaymentDefaultDataProvider_featureApplicationRemoved___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureApplicationRemoved:", *(_QWORD *)(a1 + 32));

}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PKPaymentDefaultDataProvider_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E2AD2F00;
  v7 = v4;
  v5 = v4;
  -[PKPaymentDefaultDataProvider _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v6);

}

void __55__PKPaymentDefaultDataProvider_didUpdateFamilyMembers___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didUpdateFamilyMembers:", *(_QWORD *)(a1 + 32));

}

- (PKPaymentDataProviderDelegate)delegate
{
  return (PKPaymentDataProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end

@implementation PKSetupAssistantPeerPaymentAddAssociatedAccountViewController

+ (BOOL)bridgeSetupAssistantNeedsToRunReturningRequirements:(unint64_t *)a3
{
  PKBridgeSetupAssistantContext *v4;
  void *v5;

  v4 = -[PKSetupAssistantContext initWithSetupAssistant:]([PKBridgeSetupAssistantContext alloc], "initWithSetupAssistant:", 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D672C0]), "initWithSetupAssistantContext:", v4);
  LOBYTE(a3) = objc_msgSend(v5, "_setupAssistantNeedsToRunReturningRequirements:", a3);

  return (char)a3;
}

+ (BOOL)bridgeSetupAssistantNeedsToRunWithContext:(id)a3 returningRequirements:(unint64_t *)a4
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x1E0D672C0];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithSetupAssistantContext:", v6);

  LOBYTE(a4) = objc_msgSend(v7, "_setupAssistantNeedsToRunReturningRequirements:", a4);
  return (char)a4;
}

+ (BOOL)setupAssistantNeedsToRunReturningRequirements:(unint64_t *)a3
{
  return 0;
}

+ (id)defaultWebServiceForContext:(int64_t)a3
{
  if (PKPaymentSetupContextIsBridge())
    -[objc_class watchPeerPaymentWebService](getNPKCompanionAgentConnectionClass_5(), "watchPeerPaymentWebService");
  else
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PKSetupAssistantPeerPaymentAddAssociatedAccountViewController)initWithPairingFamilyMember:(id)a3 parentFamilyMember:(id)a4 webService:(id)a5 passLibraryDataProvider:(id)a6 delegate:(id)a7 context:(int64_t)a8
{
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  PKSetupAssistantPeerPaymentAddAssociatedAccountViewController *v24;
  objc_super v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v13 = a7;
  v14 = (objc_class *)MEMORY[0x1E0D66D80];
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend([v14 alloc], "initWithFAFamilyMember:", v18);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D80]), "initWithFAFamilyMember:", v17);
  v21 = objc_alloc(MEMORY[0x1E0D66D88]);
  v28[0] = v19;
  v28[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithFamilyMembers:", v22);

  v27.receiver = self;
  v27.super_class = (Class)PKSetupAssistantPeerPaymentAddAssociatedAccountViewController;
  v24 = -[PKPeerPaymentAddAssociatedAccountViewController initWithFamilyMember:familyCollection:webService:passLibraryDataProvider:delegate:context:setupType:](&v27, sel_initWithFamilyMember_familyCollection_webService_passLibraryDataProvider_delegate_context_setupType_, v19, v23, v16, v15, self, a8, 0);

  if (v24)
    objc_storeWeak((id *)&v24->_setupAssistantDelegate, v13);

  return v24;
}

- (void)preflightWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)addPeerPaymentAssociatedAccountSetupCompletedWithSucess:(BOOL)a3 updatedAccount:(id)a4 forFamilyMember:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id WeakRetained;
  int v12;
  void *v13;
  uint64_t v14;

  v5 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v5)
  {
    -[objc_class watchPeerPaymentWebService](getNPKCompanionAgentConnectionClass_5(), "watchPeerPaymentWebService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "targetDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Request register peer payment service targetDevice:%@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(v9, "peerPaymentReRegisterWithURL:pushToken:peerPaymentWebService:completion:", 0, 0, v8, &__block_literal_global_213);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupAssistantDelegate);
  objc_msgSend(WeakRetained, "peerPaymentAddAssociatedAccountViewController:didFinishWithSuccess:updatedPeerPaymentAccount:", self, v5, v7);

}

void __152__PKSetupAssistantPeerPaymentAddAssociatedAccountViewController_addPeerPaymentAssociatedAccountSetupCompletedWithSucess_updatedAccount_forFamilyMember___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (a2)
      v6 = CFSTR("YES");
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = a3;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Finish request register peer payment service success:%@ error:%@", (uint8_t *)&v7, 0x16u);
  }

}

- (void)addPeerPaymentAssociatedAccountDidSkipSetupForFamilyMember:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_setupAssistantDelegate);
  objc_msgSend(WeakRetained, "peerPaymentAddAssociatedAccountViewControllerDidSkipSetup:", self);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupAssistantDelegate);
}

@end

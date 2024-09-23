@implementation PKPayLaterSetupFlowController

- (PKPayLaterSetupFlowController)initWithFinancingController:(id)a3 controllerContext:(int64_t)a4 selectedFinancingOption:(id)a5 selectedPreliminaryAssessment:(id)a6 referrerIdentifier:(id)a7
{
  id v13;
  id v14;
  PKPayLaterPreliminaryAssessment *v15;
  id v16;
  PKPayLaterSetupFlowController *v17;
  PKPassSnapshotter *v18;
  PKPassSnapshotter *snapshotter;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v13 = a3;
  v14 = a5;
  v15 = (PKPayLaterPreliminaryAssessment *)a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PKPayLaterSetupFlowController;
  v17 = -[PKPayLaterSetupFlowController init](&v23, sel_init);
  if (v17)
  {
    v18 = objc_alloc_init(PKPassSnapshotter);
    snapshotter = v17->_snapshotter;
    v17->_snapshotter = v18;

    v17->_controllerContext = a4;
    objc_storeStrong((id *)&v17->_selectedFinancingOption, a5);
    v17->_selectedPreliminaryAssessment = v15;
    objc_storeStrong((id *)&v17->_financingController, a3);
    objc_storeStrong((id *)&v17->_referrerIdentifier, a7);
    -[PKPayLaterFinancingController setReferrerIdentifier:](v17->_financingController, "setReferrerIdentifier:", v17->_referrerIdentifier);
    if ((unint64_t)a4 <= 4)
      v17->_setupContext = qword_19DF14FF8[a4];
    v20 = *MEMORY[0x1E0D69918];
    objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D69918]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v17->_didBeginAnalyticsReporter = 1;
      objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v20);
    }
    -[PKPayLaterSetupFlowController _updatePayLaterPass](v17, "_updatePayLaterPass");
  }

  return v17;
}

+ (id)defaultPayLaterSetupFlowControllerForAccount:(id)a3 controllerContext:(int64_t)a4 referrerIdentifier:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v8 = (void *)MEMORY[0x1E0D673C8];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0D672B0]);
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "payLaterSetupFlowControllerForAccount:controllerContext:referrerIdentifier:paymentWebService:accountService:peerPaymentService:paymentService:passLibrary:", v10, a4, v9, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)payLaterSetupFlowControllerForAccount:(id)a3 controllerContext:(int64_t)a4 referrerIdentifier:(id)a5 paymentWebService:(id)a6 accountService:(id)a7 peerPaymentService:(id)a8 paymentService:(id)a9 passLibrary:(id)a10
{
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PKPayLaterSetupFlowController *v27;

  if ((unint64_t)a4 > 3)
    v15 = 0;
  else
    v15 = qword_19DF15020[a4];
  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a3;
  objc_msgSend(v22, "payLaterDetails");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "currencyCode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67000]), "initWithCurrencyCode:channel:", v24, v15);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FF8]), "initWithAccountService:paymentService:peerPaymentService:paymentWebService:passLibrary:payLaterAccount:configuration:", v19, v17, v18, v20, v16, v22, v25);

  v27 = -[PKPayLaterSetupFlowController initWithFinancingController:controllerContext:selectedFinancingOption:selectedPreliminaryAssessment:referrerIdentifier:]([PKPayLaterSetupFlowController alloc], "initWithFinancingController:controllerContext:selectedFinancingOption:selectedPreliminaryAssessment:referrerIdentifier:", v26, a4, 0, 0, v21);
  return v27;
}

- (void)fetchPayLaterDynamicContentWithCompletion:(id)a3
{
  -[PKPayLaterFinancingController fetchPayLaterDynamicContentForType:completion:](self->_financingController, "fetchPayLaterDynamicContentForType:completion:", (self->_controllerContext & 0xFFFFFFFFFFFFFFFELL) == 2, a3);
}

- (id)firstViewController
{
  uint64_t v3;
  void *v4;
  int64_t controllerContext;
  BOOL v6;
  PKNavigationController *v7;
  PKNavigationController *v8;

  -[PKPayLaterSetupFlowController _firstViewControllerWithoutNavController](self, "_firstViewControllerWithoutNavController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], -1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
    goto LABEL_9;
  }
  v4 = (void *)v3;
  controllerContext = self->_controllerContext;
  v6 = (unint64_t)(controllerContext - 3) < 2 || controllerContext == 1;
  if (v6 || !controllerContext && (PKOslo2024UIUpdatesEnabled() & 1) == 0)
  {
    v7 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v4);
LABEL_9:
    v8 = v7;

    v4 = v8;
  }
  return v4;
}

- (id)_firstViewControllerWithoutNavController
{
  PKPayLaterFinancingOption *selectedFinancingOption;
  PKPayLaterPreliminaryAssessment *selectedPreliminaryAssessment;
  int64_t controllerContext;
  __objc2_class *v7;
  unint64_t v8;

  selectedFinancingOption = self->_selectedFinancingOption;
  if (selectedFinancingOption)
  {
    if (-[PKPayLaterFinancingOption productType](selectedFinancingOption, "productType") == 1)
      return -[PKPayLaterPaymentScheduleViewController initWithSetupFlowController:dynamicContentPageType:]([PKPayLaterPaymentScheduleViewController alloc], "initWithSetupFlowController:dynamicContentPageType:", self, 4);
    return 0;
  }
  selectedPreliminaryAssessment = self->_selectedPreliminaryAssessment;
  if (selectedPreliminaryAssessment)
  {
    if (-[PKPayLaterPreliminaryAssessment productType](selectedPreliminaryAssessment, "productType") == 1)
    {
      controllerContext = self->_controllerContext;
      if ((unint64_t)(controllerContext - 1) < 3)
      {
LABEL_10:
        v7 = PKPayLaterLoadingViewController;
        return (id)objc_msgSend([v7 alloc], "initWithSetupFlowController:", self);
      }
      if (!controllerContext || controllerContext == 4)
      {
        if (-[PKPayLaterPreliminaryAssessment isReapplication](self->_selectedPreliminaryAssessment, "isReapplication"))goto LABEL_10;
LABEL_16:
        v7 = PKPayLaterExplanationViewController;
        return (id)objc_msgSend([v7 alloc], "initWithSetupFlowController:", self);
      }
    }
  }
  else
  {
    v8 = self->_controllerContext;
    if (v8 < 3 || v8 == 4)
      goto LABEL_16;
    if (v8 == 3)
    {
      v7 = PKPayLaterEnterAmountSetupViewController;
      return (id)objc_msgSend([v7 alloc], "initWithSetupFlowController:", self);
    }
  }
  return 0;
}

- (void)nextViewControllerFromState:(int64_t)a3 parentViewController:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  int64_t controllerContext;
  PKPayLaterFinancingController *financingController;
  PKPayLaterFinancingOption *selectedFinancingOption;
  int64_t v16;
  id v17;
  void *v18;
  PKPayLaterFinancingOption *v19;
  int64_t v20;
  uint64_t v21;
  int64_t v22;
  void *v23;
  PKPayLaterFinancingOption *v24;
  uint64_t v25;
  void *v26;
  id nextViewControllerCompletion;
  PKPayLaterPreliminaryAssessment *selectedPreliminaryAssessment;
  uint64_t v29;
  void *v30;
  PKPayLaterPreliminaryAssessment *v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD aBlock[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[5];
  id v52;
  uint8_t buf[4];
  const __CFString *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  PKLogFacilityTypeGetObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 0xA)
      v12 = CFSTR("unknown");
    else
      v12 = off_1E3E64480[a3];
    *(_DWORD *)buf = 138412290;
    v54 = v12;
    _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKPayLaterSetupFlowController nextViewControllerFromState: %@", buf, 0xCu);
  }

  if (v10)
  {
    objc_storeStrong((id *)&self->_parentViewController, a4);
    switch(a3)
    {
      case 0:
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke;
        v51[3] = &unk_1E3E642A8;
        v51[4] = self;
        v52 = v10;
        -[PKPayLaterSetupFlowController _checkSecurityCapabiltiesWithCompletion:](self, "_checkSecurityCapabiltiesWithCompletion:", v51);

        break;
      case 1:
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_2;
        v49[3] = &unk_1E3E642A8;
        v49[4] = self;
        v50 = v10;
        -[PKPayLaterSetupFlowController _checkSecurityCapabiltiesWithCompletion:](self, "_checkSecurityCapabiltiesWithCompletion:", v49);

        break;
      case 2:
        controllerContext = self->_controllerContext;
        if ((unint64_t)(controllerContext - 1) >= 3)
        {
          if (!controllerContext || controllerContext == 4)
            goto LABEL_22;
        }
        else
        {
          -[PKPayLaterSetupFlowController _viewControllerForState:completion:](self, "_viewControllerForState:completion:", 3, v10);
        }
        break;
      case 3:
        objc_initWeak((id *)buf, self);
        financingController = self->_financingController;
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_3;
        v46[3] = &unk_1E3E642D0;
        objc_copyWeak(&v48, (id *)buf);
        v47 = v10;
        -[PKPayLaterFinancingController updateFinancingOptionsWithCompletion:](financingController, "updateFinancingOptionsWithCompletion:", v46);

        objc_destroyWeak(&v48);
        objc_destroyWeak((id *)buf);
        break;
      case 4:
        selectedFinancingOption = self->_selectedFinancingOption;
        if (selectedFinancingOption)
        {
          v16 = self->_controllerContext;
          if ((unint64_t)(v16 - 1) >= 3)
          {
            if (!v16 || v16 == 4)
            {
              v33 = -[PKPayLaterFinancingOption productType](selectedFinancingOption, "productType");
              if (!v33)
                goto LABEL_22;
              if (v33 == 1)
                -[PKPayLaterSetupFlowController _viewControllerForState:completion:](self, "_viewControllerForState:completion:", 6, v10);
            }
          }
          else
          {
            -[PKPayLaterSetupFlowController _viewControllerForState:completion:](self, "_viewControllerForState:completion:", 9, v10);
          }
        }
        else
        {
          selectedPreliminaryAssessment = self->_selectedPreliminaryAssessment;
          if (selectedPreliminaryAssessment)
          {
            v29 = -[PKPayLaterPreliminaryAssessment productType](selectedPreliminaryAssessment, "productType");
            if (!v29)
              goto LABEL_22;
            if (v29 == 1)
            {
              -[PKPayLaterSetupFlowController _firstViewControllerWithoutNavController](self, "_firstViewControllerWithoutNavController");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v30, 0);

            }
          }
        }
        break;
      case 5:
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_5;
        aBlock[3] = &unk_1E3E642F8;
        v17 = v10;
        v45 = v17;
        v18 = _Block_copy(aBlock);
        v19 = self->_selectedFinancingOption;
        if (v19)
        {
          v20 = self->_controllerContext;
          if ((unint64_t)(v20 - 1) < 3)
          {
LABEL_18:
            -[PKPayLaterSetupFlowController _viewControllerForState:completion:](self, "_viewControllerForState:completion:", 9, v18);
            goto LABEL_65;
          }
          if (v20 && v20 != 4)
            goto LABEL_65;
          v34 = -[PKPayLaterFinancingOption productType](v19, "productType");
          if (v34)
          {
            if (v34 == 1)
              -[PKPayLaterSetupFlowController _viewControllerForState:completion:](self, "_viewControllerForState:completion:", 6, v18);
LABEL_65:

            break;
          }
        }
        else
        {
          v31 = self->_selectedPreliminaryAssessment;
          if (!v31)
            goto LABEL_65;
          v32 = self->_controllerContext;
          if ((unint64_t)(v32 - 1) < 3)
            goto LABEL_18;
          if (v32)
          {
            if (v32 != 4)
              goto LABEL_65;
          }
          else if ((unint64_t)-[PKPayLaterPreliminaryAssessment productType](v31, "productType") > 1)
          {
            goto LABEL_65;
          }
        }
        -[PKPayLaterSetupFlowController _genericError](self, "_genericError");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v17 + 2))(v17, 0, v37);

        goto LABEL_65;
      case 6:
        v21 = -[PKPayLaterFinancingOption productType](self->_selectedFinancingOption, "productType");
        if (!v21)
          goto LABEL_22;
        if (v21 == 1)
        {
          v22 = self->_controllerContext;
          if ((unint64_t)(v22 - 1) < 4)
            goto LABEL_22;
          if (!v22)
          {
            objc_initWeak((id *)buf, self);
            -[PKPayLaterFinancingOption termsDetails](self->_selectedFinancingOption, "termsDetails");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "installmentAgreementIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            v41[0] = MEMORY[0x1E0C809B0];
            v41[1] = 3221225472;
            v41[2] = __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_6;
            v41[3] = &unk_1E3E64320;
            objc_copyWeak(&v43, (id *)buf);
            v42 = v10;
            -[PKPayLaterSetupFlowController _acceptTermsIdentifier:completion:](self, "_acceptTermsIdentifier:completion:", v36, v41);

            objc_destroyWeak(&v43);
            objc_destroyWeak((id *)buf);
          }
        }
        break;
      case 7:
        v24 = self->_selectedFinancingOption;
        if (v24)
        {
          v25 = -[PKPayLaterFinancingOption productType](v24, "productType");
          if (!v25)
            goto LABEL_22;
          if (v25 == 1)
          {
            objc_initWeak((id *)buf, self);
            v38[0] = MEMORY[0x1E0C809B0];
            v38[1] = 3221225472;
            v38[2] = __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_7;
            v38[3] = &unk_1E3E64320;
            objc_copyWeak(&v40, (id *)buf);
            v39 = v10;
            v26 = _Block_copy(v38);
            nextViewControllerCompletion = self->_nextViewControllerCompletion;
            self->_nextViewControllerCompletion = v26;

            if (!-[PKPayLaterSetupFlowController _didStartPayLaterPassProvisioning](self, "_didStartPayLaterPassProvisioning"))-[PKPayLaterSetupFlowController _callNextViewControllerCompletionBlockWithError:](self, "_callNextViewControllerCompletionBlockWithError:", 0);
            objc_destroyWeak(&v40);
            objc_destroyWeak((id *)buf);
          }
        }
        break;
      case 8:
        if ((unint64_t)-[PKPayLaterFinancingOption productType](self->_selectedFinancingOption, "productType") <= 1)
        {
LABEL_22:
          -[PKPayLaterSetupFlowController _genericError](self, "_genericError");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v23);

        }
        break;
      case 9:
        -[PKPayLaterSetupFlowController _viewControllerForState:completion:](self, "_viewControllerForState:completion:", 10, v10);
        break;
      case 10:
        (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
        break;
      default:
        break;
    }
  }

}

void __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  id v21;

  v5 = a3;
  v21 = v5;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 10;
LABEL_3:
    objc_msgSend(v6, "_viewControllerForState:completion:", v8, v7);
    goto LABEL_6;
  }
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v9 + 152))
  {
    v10 = objc_msgSend(*(id *)(v9 + 152), "productType", 0);
    if (v10)
    {
      if (v10 != 1)
        goto LABEL_6;
      v6 = *(void **)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 6;
      goto LABEL_3;
    }
    goto LABEL_15;
  }
  if (*(_QWORD *)(v9 + 160))
  {
    v11 = objc_msgSend(*(id *)(v9 + 160), "productType", 0);
    if (v11)
    {
      if (v11 != 1)
        goto LABEL_6;
      v6 = *(void **)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 5;
      goto LABEL_3;
    }
LABEL_15:
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_genericError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

    goto LABEL_6;
  }
  v14 = *(_QWORD *)(v9 + 128);
  if ((unint64_t)(v14 - 1) >= 3)
  {
    if (v14)
      v18 = v14 == 4;
    else
      v18 = 1;
    if (v18)
    {
      v19 = *(_QWORD *)(a1 + 40);
      objc_msgSend((id)v9, "_genericError", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v20);

    }
  }
  else
  {
    objc_msgSend(*(id *)(v9 + 112), "dynamicContent", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dynamicContentPageForPageType:", 9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      v17 = 2;
    else
      v17 = 3;
    objc_msgSend(*(id *)(a1 + 32), "_viewControllerForState:completion:", v17, *(_QWORD *)(a1 + 40));

  }
LABEL_6:

}

void __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v5 = a3;
  v16 = v5;
  if (!a2)
  {
    if (v5)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_6;
    }
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 152);
    if (v10)
    {
      v11 = objc_msgSend(v10, "productType", 0);
      if (v11)
      {
        if (v11 != 1)
          goto LABEL_6;
        v6 = *(void **)(a1 + 32);
        v7 = *(_QWORD *)(a1 + 40);
        v8 = 6;
        goto LABEL_3;
      }
    }
    else
    {
      v12 = *(void **)(v9 + 160);
      if (!v12)
        goto LABEL_6;
      v13 = objc_msgSend(v12, "productType", 0);
      if (v13)
      {
        if (v13 != 1)
          goto LABEL_6;
        v6 = *(void **)(a1 + 32);
        v7 = *(_QWORD *)(a1 + 40);
        v8 = 5;
        goto LABEL_3;
      }
    }
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_genericError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

    goto LABEL_6;
  }
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = 10;
LABEL_3:
  objc_msgSend(v6, "_viewControllerForState:completion:", v8, v7);
LABEL_6:

}

void __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_4;
  block[3] = &unk_1E3E61B90;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v7 = v4;
  v8 = *(id *)(a1 + 32);
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
    else
      objc_msgSend(WeakRetained, "_viewControllerForState:completion:", 4, v3);
    WeakRetained = v4;
  }

}

void __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setPreviousViewControllerIsApplyFlow:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(_QWORD, _QWORD))(v5 + 16))(*(_QWORD *)(a1 + 32), 0);
    else
      objc_msgSend(WeakRetained, "_viewControllerForState:completion:", 7, v5);
  }

}

void __93__PKPayLaterSetupFlowController_nextViewControllerFromState_parentViewController_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id WeakRetained;
  _QWORD *v4;
  id v5;
  id v6;

  v6 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v5 = objc_loadWeakRetained((id *)WeakRetained + 13);
      objc_msgSend(v5, "payLaterSetupFlowController:didSelect:", v4, v4[19]);

      objc_msgSend(v4, "_viewControllerForState:completion:", 10, *(_QWORD *)(a1 + 32));
    }
  }

}

- (BOOL)hasPayLaterPass
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PKPayLaterSetupFlowController payLaterPassUniqueIdentifier](self, "payLaterPassUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKPayLaterFinancingController passLibrary](self->_financingController, "passLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "passWithUniqueID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)payLaterPassUniqueIdentifier
{
  void *v2;
  void *v3;

  -[PKPayLaterFinancingController payLaterAccount](self->_financingController, "payLaterAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "associatedPassUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)provisionPayLaterPassWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  id nextViewControllerCompletion;
  void *v7;
  _QWORD aBlock[4];
  void (**v9)(id, uint64_t, _QWORD);
  id v10;
  id location;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  if (v4)
  {
    if (-[PKPayLaterSetupFlowController hasPayLaterPass](self, "hasPayLaterPass"))
    {
      v4[2](v4, 1, 0);
    }
    else
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__PKPayLaterSetupFlowController_provisionPayLaterPassWithCompletion___block_invoke;
      aBlock[3] = &unk_1E3E64320;
      objc_copyWeak(&v10, &location);
      v9 = v4;
      v5 = _Block_copy(aBlock);
      nextViewControllerCompletion = self->_nextViewControllerCompletion;
      self->_nextViewControllerCompletion = v5;

      if (!-[PKPayLaterSetupFlowController _didStartPayLaterPassProvisioning](self, "_didStartPayLaterPassProvisioning"))
      {
        -[PKPayLaterSetupFlowController _genericError](self, "_genericError");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterSetupFlowController _callNextViewControllerCompletionBlockWithError:](self, "_callNextViewControllerCompletionBlockWithError:", v7);

      }
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }

}

void __69__PKPayLaterSetupFlowController_provisionPayLaterPassWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)_didStartPayLaterPassProvisioning
{
  BOOL v2;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  PKAccountFlowController *v11;
  PKAccountFlowController *accountFlowController;
  uint8_t v14[16];
  uint8_t buf[16];

  if (self->_payLaterPass)
    return 0;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Provisioning the pay later pass...", buf, 2u);
  }

  v5 = objc_alloc(MEMORY[0x1E0D67230]);
  -[PKPayLaterFinancingController paymentWebService](self->_financingController, "paymentWebService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithWebService:", v6);

  v8 = objc_alloc(MEMORY[0x1E0D66840]);
  -[PKPayLaterFinancingController payLaterAccount](self->_financingController, "payLaterAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithAccount:", v9);

  objc_msgSend(v10, "setPaymentPass:", self->_payLaterPass);
  v2 = v10 != 0;
  if (v10)
  {
    v11 = -[PKAccountFlowController initWithAccountCredential:provisioningController:setupDelegate:context:operations:]([PKAccountFlowController alloc], "initWithAccountCredential:provisioningController:setupDelegate:context:operations:", v10, v7, 0, self->_setupContext, 1);
    accountFlowController = self->_accountFlowController;
    self->_accountFlowController = v11;

    -[PKAccountFlowController setDelegate:](self->_accountFlowController, "setDelegate:", self);
    -[PKAccountFlowController performInitalOperations](self->_accountFlowController, "performInitalOperations");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Cannot present pay later provisioning flow with a nil account credential", v14, 2u);
    }

  }
  return v2;
}

- (void)_updatePayLaterPass
{
  void *v3;
  void *v4;
  void *v5;
  PKPaymentPass *v6;
  PKPaymentPass *payLaterPass;
  id v8;

  -[PKPayLaterFinancingController payLaterAccount](self->_financingController, "payLaterAccount");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingController passLibrary](self->_financingController, "passLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "associatedPassUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passWithUniqueID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paymentPass");
  v6 = (PKPaymentPass *)objc_claimAutoreleasedReturnValue();
  payLaterPass = self->_payLaterPass;
  self->_payLaterPass = v6;

  -[PKPayLaterFinancingController setPayLaterPass:](self->_financingController, "setPayLaterPass:", self->_payLaterPass);
}

- (id)snapshotForPass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PKPassSnapshotter *snapshotter;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "style");
    PKPassFrontFaceContentSize();
    PKSizeAspectFit();
    v9 = v8;
    v11 = v10;
    objc_initWeak(&location, self);
    snapshotter = self->_snapshotter;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__PKPayLaterSetupFlowController_snapshotForPass_completion___block_invoke;
    v14[3] = &unk_1E3E627D8;
    objc_copyWeak(&v16, &location);
    v15 = v7;
    -[PKPassSnapshotter snapshotWithPass:size:completion:](snapshotter, "snapshotWithPass:size:completion:", v6, v14, v9, v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return 0;
}

void __60__PKPayLaterSetupFlowController_snapshotForPass_completion___block_invoke(uint64_t a1, void *a2)
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
  block[2] = __60__PKPayLaterSetupFlowController_snapshotForPass_completion___block_invoke_2;
  block[3] = &unk_1E3E61478;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __60__PKPayLaterSetupFlowController_snapshotForPass_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      v4 = WeakRetained;
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
      WeakRetained = v4;
    }
  }

}

- (void)termsViewControllerForTermsIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PKAccountTermsAndConditionsController *v10;
  void *v11;
  PKAccountTermsAndConditionsController *v12;
  PKAccountTermsAndConditionsController *termsController;
  PKAccountTermsAndConditionsController *v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      -[PKPayLaterFinancingController payLaterAccount](self->_financingController, "payLaterAccount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = [PKAccountTermsAndConditionsController alloc];
      -[PKPayLaterFinancingController paymentWebService](self->_financingController, "paymentWebService");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PKAccountTermsAndConditionsController initWithAccount:webService:context:termsIdentifier:](v10, "initWithAccount:webService:context:termsIdentifier:", v9, v11, self->_setupContext, v6);
      termsController = self->_termsController;
      self->_termsController = v12;

      v14 = self->_termsController;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __82__PKPayLaterSetupFlowController_termsViewControllerForTermsIdentifier_completion___block_invoke;
      v15[3] = &unk_1E3E642F8;
      v16 = v8;
      -[PKAccountTermsAndConditionsController termsViewControllerWithCompletion:](v14, "termsViewControllerWithCompletion:", v15);

    }
    else
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }
  }

}

uint64_t __82__PKPayLaterSetupFlowController_termsViewControllerForTermsIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
    a2 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (void)_acceptTermsIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      -[PKPayLaterFinancingController payLaterAccount](self->_financingController, "payLaterAccount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = os_signpost_id_make_with_pointer(v9, self);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19D178000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "request:payLaterTerms", ", buf, 2u);
        }
      }

      -[PKPayLaterFinancingController accountService](self->_financingController, "accountService");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accountIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __67__PKPayLaterSetupFlowController__acceptTermsIdentifier_completion___block_invoke;
      v15[3] = &unk_1E3E64348;
      v15[4] = self;
      v16 = v7;
      objc_msgSend(v12, "termsWithIdentifier:accepted:withAccountIdentifier:completion:", v6, 1, v13, v15);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Errror: cannot accept terms for a nil terms identifier", buf, 2u);
      }

      -[PKPayLaterSetupFlowController _genericError](self, "_genericError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v8);
    }

  }
}

void __67__PKPayLaterSetupFlowController__acceptTermsIdentifier_completion___block_invoke(uint64_t a1, void *a2)
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
  block[2] = __67__PKPayLaterSetupFlowController__acceptTermsIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E3E61450;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __67__PKPayLaterSetupFlowController__acceptTermsIdentifier_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  os_signpost_id_t v4;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v2, OS_SIGNPOST_INTERVAL_END, v4, "request:payLaterTerms", ", v6, 2u);
    }
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)localizedBundle
{
  NSBundle *localizedBundle;
  void *v4;
  NSBundle *v5;
  NSBundle *v6;

  localizedBundle = self->_localizedBundle;
  if (!localizedBundle)
  {
    -[PKPayLaterFinancingController payLaterAccount](self->_financingController, "payLaterAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKApplyController localizationBundleForFeatureIdentifier:account:](PKApplyController, "localizationBundleForFeatureIdentifier:account:", objc_msgSend(v4, "feature"), v4);
    v5 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    v6 = self->_localizedBundle;
    self->_localizedBundle = v5;

    localizedBundle = self->_localizedBundle;
  }
  return localizedBundle;
}

- (id)preferredLanguage
{
  NSString *preferredLanguage;
  void *v4;
  NSString *v5;
  NSString *v6;

  preferredLanguage = self->_preferredLanguage;
  if (!preferredLanguage)
  {
    -[PKPayLaterFinancingController payLaterAccount](self->_financingController, "payLaterAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKApplyController preferredLanguageForFeatureIdentifier:account:](PKApplyController, "preferredLanguageForFeatureIdentifier:account:", objc_msgSend(v4, "feature"), v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_preferredLanguage;
    self->_preferredLanguage = v5;

    preferredLanguage = self->_preferredLanguage;
  }
  return preferredLanguage;
}

- (void)endSetupFlowFromViewController:(id)a3 shouldDismiss:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  id WeakRetained;
  char v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKPayLaterSetupFlowController endSetupFlow from %@, should dismiss: %@", (uint8_t *)&v12, 0x16u);
  }

  if (self->_didBeginAnalyticsReporter)
  {
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D69918]);
    self->_didBeginAnalyticsReporter = 0;
  }
  -[PKApplyController endApplyFlow](self->_applyController, "endApplyFlow");
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "payLaterSetupFlowControllerDidFinish:", self);
    }
    else
    {
      objc_msgSend(v6, "presentingViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, 0);
    }

  }
}

- (void)reportAnalyticsEventForPageTag:(id)a3 dictionary:(id)a4
{
  -[PKPayLaterSetupFlowController reportAnalyticsEventForPageTag:dictionary:additionalAnalyticsSubjects:](self, "reportAnalyticsEventForPageTag:dictionary:additionalAnalyticsSubjects:", a3, a4, 0);
}

- (void)reportAnalyticsEventForPageTag:(id)a3 dictionary:(id)a4 additionalAnalyticsSubjects:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  if (a3)
  {
    if (a4)
    {
      v8 = (objc_class *)MEMORY[0x1E0C99E08];
      v9 = a5;
      v10 = a4;
      v11 = a3;
      v12 = objc_alloc_init(v8);
      objc_msgSend(v12, "setObject:forKey:", v11, *MEMORY[0x1E0D68F50]);

      objc_msgSend(v12, "addEntriesFromDictionary:", v10);
      -[PKPayLaterSetupFlowController reportAnalyticsEvent:additionalAnalyticsSubjects:](self, "reportAnalyticsEvent:additionalAnalyticsSubjects:", v12, v9);

    }
  }
}

- (void)reportAnalyticsEvent:(id)a3
{
  -[PKPayLaterSetupFlowController reportAnalyticsEvent:additionalAnalyticsSubjects:](self, "reportAnalyticsEvent:additionalAnalyticsSubjects:", a3, 0);
}

- (void)reportAnalyticsEvent:(id)a3 additionalAnalyticsSubjects:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", *MEMORY[0x1E0D69918], v5);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v5, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)accountFlowController:(id)a3 requestsPresentationOfViewController:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__PKPayLaterSetupFlowController_accountFlowController_requestsPresentationOfViewController___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __92__PKPayLaterSetupFlowController_accountFlowController_requestsPresentationOfViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callNextViewControllerCompletionBlockWithError:", 0);
}

- (void)accountFlowController:(id)a3 requestsPresentationOfDisplayableError:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__PKPayLaterSetupFlowController_accountFlowController_requestsPresentationOfDisplayableError___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __94__PKPayLaterSetupFlowController_accountFlowController_requestsPresentationOfDisplayableError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callNextViewControllerCompletionBlockWithError:", *(_QWORD *)(a1 + 40));
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id v4;
  unint64_t lastFeatureApplicationState;
  void *v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  lastFeatureApplicationState = self->_lastFeatureApplicationState;
  if (!lastFeatureApplicationState)
  {
    -[PKApplyController featureApplication](self->_applyController, "featureApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    lastFeatureApplicationState = objc_msgSend(v6, "applicationState");

  }
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    PKFeatureApplicationStateToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Apply flow did terminate with final application state %@", (uint8_t *)&v10, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "payLaterSetupFlowController:didTerminateApplicationState:", self, lastFeatureApplicationState);

  -[PKPayLaterSetupFlowController endSetupFlowFromViewController:shouldDismiss:](self, "endSetupFlowFromViewController:shouldDismiss:", v4, 1);
}

- (unint64_t)selectedProductType
{
  unint64_t result;

  result = (unint64_t)self->_selectedFinancingOption;
  if (result)
    return objc_msgSend((id)result, "productType");
  result = (unint64_t)self->_selectedPreliminaryAssessment;
  if (result)
    return objc_msgSend((id)result, "productType");
  return result;
}

- (void)_viewControllerForState:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  __objc2_class *v8;
  PKPayLaterProductOptionsViewController *v9;
  PKPayLaterSetupFlowController *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v15 = v6;
    switch(a3)
    {
      case 0:
        v8 = PKPayLaterExplanationViewController;
        goto LABEL_12;
      case 1:
        v8 = PKPayLaterLoadingViewController;
        goto LABEL_12;
      case 2:
        v8 = PKPayLaterMoreInformationViewController;
        goto LABEL_12;
      case 3:
        v8 = PKPayLaterEnterAmountSetupViewController;
        goto LABEL_12;
      case 4:
        v9 = [PKPayLaterProductOptionsViewController alloc];
        v10 = self;
        v11 = 6;
        goto LABEL_15;
      case 5:
        -[PKPayLaterSetupFlowController _nextApplyViewControllerWithCompletion:](self, "_nextApplyViewControllerWithCompletion:", v6);
        goto LABEL_17;
      case 6:
        v9 = [PKPayLaterPaymentScheduleViewController alloc];
        v10 = self;
        v11 = 4;
        goto LABEL_15;
      case 7:
        v8 = PKPayLaterFundingSourceViewController;
        goto LABEL_12;
      case 8:
        v8 = PKPayLaterReviewPlanViewController;
LABEL_12:
        v12 = objc_msgSend([v8 alloc], "initWithSetupFlowController:", self);
        goto LABEL_16;
      case 9:
        v13 = -[PKPayLaterSetupFlowController selectedProductType](self, "selectedProductType", v6);
        v7 = v15;
        if (v13 != 1)
          break;
        v9 = [PKPayLaterPaymentScheduleViewController alloc];
        v10 = self;
        v11 = 11;
LABEL_15:
        v12 = -[PKPayLaterProductOptionsViewController initWithSetupFlowController:dynamicContentPageType:](v9, "initWithSetupFlowController:dynamicContentPageType:", v10, v11);
LABEL_16:
        v14 = (void *)v12;
        (*((void (**)(id, uint64_t, _QWORD))v15 + 2))(v15, v12, 0);

LABEL_17:
        v7 = v15;
        break;
      case 10:
        (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
        goto LABEL_17;
      default:
        break;
    }
  }

}

- (void)_checkSecurityCapabiltiesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  PKSecurityCapabilitiesController *securityCapabiltiesController;
  PKSecurityCapabilitiesController *v7;
  void *v8;
  PKSecurityCapabilitiesController *v9;
  PKSecurityCapabilitiesController *v10;
  PKSecurityCapabilitiesController *v11;
  PKSecurityCapabilitiesController *v12;
  UIViewController *parentViewController;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    if (self->_meetsSecurityCheck)
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "User meets pay later security capabailties.", buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    }
    else
    {
      securityCapabiltiesController = self->_securityCapabiltiesController;
      if (securityCapabiltiesController)
      {
        v7 = securityCapabiltiesController;
        v8 = self->_securityCapabiltiesController;
        self->_securityCapabiltiesController = v7;
      }
      else
      {
        v9 = [PKSecurityCapabilitiesController alloc];
        -[PKPayLaterFinancingController payLaterAccount](self->_financingController, "payLaterAccount");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[PKSecurityCapabilitiesController initWithRequirements:feature:context:](v9, "initWithRequirements:feature:context:", 4, objc_msgSend(v8, "feature"), self->_setupContext);
        v11 = self->_securityCapabiltiesController;
        self->_securityCapabiltiesController = v10;

      }
      v12 = self->_securityCapabiltiesController;
      parentViewController = self->_parentViewController;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __73__PKPayLaterSetupFlowController__checkSecurityCapabiltiesWithCompletion___block_invoke;
      v14[3] = &unk_1E3E64398;
      v14[4] = self;
      v15 = v4;
      -[PKSecurityCapabilitiesController presentSecurityRepairFlowWithPresentingViewController:completion:](v12, "presentSecurityRepairFlowWithPresentingViewController:completion:", parentViewController, v14);

    }
  }

}

void __73__PKPayLaterSetupFlowController__checkSecurityCapabiltiesWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__PKPayLaterSetupFlowController__checkSecurityCapabiltiesWithCompletion___block_invoke_2;
  v9[3] = &unk_1E3E64370;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v12 = a2;
  v9[4] = v6;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __73__PKPayLaterSetupFlowController__checkSecurityCapabiltiesWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t (*v2)(void);

  v1 = a1[7];
  if (v1 == 3)
  {
    v2 = *(uint64_t (**)(void))(a1[6] + 16);
    return v2();
  }
  if (!v1)
  {
    *(_BYTE *)(a1[4] + 80) = 1;
    v2 = *(uint64_t (**)(void))(a1[6] + 16);
    return v2();
  }
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], 0, a1[5]);
}

- (void)_nextApplyViewControllerWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  PKApplyControllerConfiguration *v15;
  PKApplyController *v16;
  PKApplyController *applyController;
  PKApplyController *v18;
  void *v19;
  PKApplyController *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  if (v4)
  {
    -[PKPayLaterFinancingController payLaterAccount](self->_financingController, "payLaterAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applyServiceURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKPayLaterSetupFlowController selectedProductType](self, "selectedProductType");
    if (v6)
    {
      v8 = v7;
      if (v7)
      {
        -[PKPayLaterFinancingController assessmentCollection](self->_financingController, "assessmentCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "productAssessmentForProductType:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "preliminaryAssessment");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = objc_alloc(MEMORY[0x1E0D67230]);
          -[PKPayLaterFinancingController paymentWebService](self->_financingController, "paymentWebService");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v12, "initWithWebService:", v13);

          objc_msgSend(v14, "setReferrerIdentifier:", self->_referrerIdentifier);
          v15 = -[PKApplyControllerConfiguration initWithSetupDelegate:context:provisioningController:]([PKApplyControllerConfiguration alloc], "initWithSetupDelegate:context:provisioningController:", self, self->_setupContext, v14);
          -[PKApplyControllerConfiguration setFeature:](v15, "setFeature:", objc_msgSend(v5, "feature"));
          -[PKApplyControllerConfiguration setFeatureProduct:](v15, "setFeatureProduct:", objc_msgSend(v11, "productType") == 1);
          -[PKApplyControllerConfiguration setAccount:](v15, "setAccount:", v5);
          self->_lastFeatureApplicationState = 0;
          v16 = -[PKApplyController initWithApplyConfiguration:]([PKApplyController alloc], "initWithApplyConfiguration:", v15);
          applyController = self->_applyController;
          self->_applyController = v16;

          -[PKApplyController setParentFlowController:](self->_applyController, "setParentFlowController:", self);
          -[PKApplyController setApplyServiceURL:](self->_applyController, "setApplyServiceURL:", v6);
          v18 = self->_applyController;
          objc_msgSend(v11, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKApplyController setPreliminaryAssessmentIdentifier:](v18, "setPreliminaryAssessmentIdentifier:", v19);

          v20 = self->_applyController;
          objc_msgSend(MEMORY[0x1E0D66820], "analyticsAccountTypeForAccount:", v5);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKApplyController setAnalyticsExistingAccountType:](v20, "setAnalyticsExistingAccountType:", v21);

          -[PKApplyController setPayLaterSetupController:](self->_applyController, "setPayLaterSetupController:", self);
          -[PKApplyController nextViewControllerWithCompletion:](self->_applyController, "nextViewControllerWithCompletion:", v4);

        }
        else
        {
          PKLogFacilityTypeGetObject();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            PKPayLaterAccountProductTypeToString();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 138412290;
            v28 = v25;
            _os_log_impl(&dword_19D178000, v24, OS_LOG_TYPE_DEFAULT, "Error: Cannot apply when there is no priminary assessment for product type %@", (uint8_t *)&v27, 0xCu);

          }
          -[PKPayLaterSetupFlowController _genericError](self, "_genericError");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, 0, v26);

        }
        goto LABEL_16;
      }
      PKLogFacilityTypeGetObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        v23 = "Error: Cannot apply when there is no selected product type";
        goto LABEL_10;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        v23 = "Error: Cannot create pay later controller without apply service URL";
LABEL_10:
        _os_log_impl(&dword_19D178000, v22, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v27, 2u);
      }
    }

    -[PKPayLaterSetupFlowController _genericError](self, "_genericError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v10);
LABEL_16:

  }
}

- (void)_callNextViewControllerCompletionBlockWithError:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[8];
  id location;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  if (!v4)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Force updating the pay later account after provisioning.", buf, 2u);
    }

    -[PKPayLaterFinancingController payLaterAccount](self->_financingController, "payLaterAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __81__PKPayLaterSetupFlowController__callNextViewControllerCompletionBlockWithError___block_invoke;
    v17[3] = &unk_1E3E64410;
    v17[4] = self;
    v10 = v9;
    v18 = v10;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v5, "addOperation:", v17);
    objc_destroyWeak(&v19);

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __81__PKPayLaterSetupFlowController__callNextViewControllerCompletionBlockWithError___block_invoke_4;
  v14[3] = &unk_1E3E64438;
  objc_copyWeak(&v16, &location);
  v14[4] = self;
  v12 = v4;
  v15 = v12;
  v13 = (id)objc_msgSend(v5, "evaluateWithInput:completion:", v11, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __81__PKPayLaterSetupFlowController__callNextViewControllerCompletionBlockWithError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "accountService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__PKPayLaterSetupFlowController__callNextViewControllerCompletionBlockWithError___block_invoke_2;
  v14[3] = &unk_1E3E643E8;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  v12 = v9;
  v16 = v12;
  v13 = v8;
  v15 = v13;
  objc_msgSend(v10, "updateAccountWithIdentifier:extended:completion:", v11, 0, v14);

  objc_destroyWeak(&v17);
}

void __81__PKPayLaterSetupFlowController__callNextViewControllerCompletionBlockWithError___block_invoke_2(id *a1, void *a2, void *a3)
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
  block[2] = __81__PKPayLaterSetupFlowController__callNextViewControllerCompletionBlockWithError___block_invoke_3;
  block[3] = &unk_1E3E643C0;
  objc_copyWeak(&v14, a1 + 6);
  v10 = v6;
  v11 = v5;
  v13 = a1[5];
  v12 = a1[4];
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v14);
}

void __81__PKPayLaterSetupFlowController__callNextViewControllerCompletionBlockWithError___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (!*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
      objc_msgSend(WeakRetained[14], "setPayLaterAccount:");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    WeakRetained = v3;
  }

}

void __81__PKPayLaterSetupFlowController__callNextViewControllerCompletionBlockWithError___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "_updatePayLaterPass");
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 96);
    *(_QWORD *)(v3 + 96) = 0;

    WeakRetained = v5;
  }

}

- (id)_genericError
{
  void *v2;
  void *v3;
  void *v4;

  PKLocalizedPaymentString(CFSTR("GENERIC_ERROR_TITLE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("GENERIC_ERROR_MESSAGE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKDisplayableErrorCustom();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  PKPayLaterFinancingController *financingController;
  _QWORD v10[5];
  id v11;
  id v12;
  id buf[2];

  v4 = a3;
  -[PKApplyController featureApplication](self->_applyController, "featureApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_lastFeatureApplicationState = objc_msgSend(v5, "applicationState");

  v6 = -[PKApplyController didEncounterError](self->_applyController, "didEncounterError");
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "The pay later apply flow encountered an error, not updating financing options", (uint8_t *)buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }
  else
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Updating financing options after a finished application.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    financingController = self->_financingController;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__PKPayLaterSetupFlowController_nextViewControllerWithCompletion___block_invoke;
    v10[3] = &unk_1E3E64460;
    objc_copyWeak(&v12, buf);
    v10[4] = self;
    v11 = v4;
    -[PKPayLaterFinancingController updateFinancingOptionsWithCompletion:](financingController, "updateFinancingOptionsWithCompletion:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }

}

void __66__PKPayLaterSetupFlowController_nextViewControllerWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  id *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = (id *)WeakRetained;
  if (!WeakRetained)
    goto LABEL_16;
  if (v4)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v4;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Error: updating the financing options %@", buf, 0xCu);
    }

    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "_genericError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);
    goto LABEL_6;
  }
  v10 = *((_QWORD *)WeakRetained + 11);
  if (v10 - 9 >= 8 && (v10 > 7 || ((1 << v10) & 0xA1) == 0))
  {
    v15 = objc_msgSend(*((id *)WeakRetained + 1), "featureProduct") == 1;
    objc_msgSend(v6[14], "assessmentCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "productAssessmentForProductType:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "financingOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      v18 = objc_msgSend(v9, "isEligible");

      if ((v18 & 1) != 0)
      {
        objc_msgSend(v9, "financingOptions");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        if (v20 == 1)
        {
          objc_msgSend(v9, "financingOptions");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "firstObject");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = *(_QWORD *)(a1 + 32);
          v24 = *(void **)(v23 + 152);
          *(_QWORD *)(v23 + 152) = v22;

        }
        v25 = *(void **)(a1 + 40);
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __66__PKPayLaterSetupFlowController_nextViewControllerWithCompletion___block_invoke_65;
        v31[3] = &unk_1E3E642F8;
        v32 = v25;
        objc_msgSend(v6, "nextViewControllerFromState:parentViewController:completion:", 5, v26, v31);
        v27 = v32;
LABEL_26:

LABEL_6:
        goto LABEL_16;
      }
    }
    else
    {

    }
    PKLogFacilityTypeGetObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6[1], "featureProduct");
      PKFeatureProductToString();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v29;
      _os_log_impl(&dword_19D178000, v28, OS_LOG_TYPE_DEFAULT, "Error: updating the financing options. The selected product %@ is not eligible anymore.", buf, 0xCu);

    }
    v30 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "_genericError");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v30 + 16))(v30, 0, v27);
    goto LABEL_26;
  }
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    PKFeatureApplicationStateToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v34 = v13;
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Application ended in state: %@. Completing pay later application flow", buf, 0xCu);

  }
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v14 + 16))(v14, 0, 0);
LABEL_16:

}

uint64_t __66__PKPayLaterSetupFlowController_nextViewControllerWithCompletion___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (PKPayLaterSetupFlowControllerDelegate)delegate
{
  return (PKPayLaterSetupFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPayLaterFinancingController)financingController
{
  return self->_financingController;
}

- (int64_t)setupContext
{
  return self->_setupContext;
}

- (int64_t)controllerContext
{
  return self->_controllerContext;
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (PKPaymentSetupViewControllerDelegate)setupViewControllerDelegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupViewControllerDelegate);
}

- (void)setSetupViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupViewControllerDelegate, a3);
}

- (PKPayLaterFinancingOption)selectedFinancingOption
{
  return self->_selectedFinancingOption;
}

- (void)setSelectedFinancingOption:(id)a3
{
  objc_storeStrong((id *)&self->_selectedFinancingOption, a3);
}

- (PKPayLaterPreliminaryAssessment)selectedPreliminaryAssessment
{
  return self->_selectedPreliminaryAssessment;
}

- (void)setSelectedPreliminaryAssessment:(id)a3
{
  self->_selectedPreliminaryAssessment = (PKPayLaterPreliminaryAssessment *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedFinancingOption, 0);
  objc_destroyWeak((id *)&self->_setupViewControllerDelegate);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_financingController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_nextViewControllerCompletion, 0);
  objc_storeStrong((id *)&self->_parentViewController, 0);
  objc_storeStrong((id *)&self->_securityCapabiltiesController, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_accountFlowController, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
  objc_storeStrong((id *)&self->_localizedBundle, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
  objc_storeStrong((id *)&self->_applyController, 0);
}

@end

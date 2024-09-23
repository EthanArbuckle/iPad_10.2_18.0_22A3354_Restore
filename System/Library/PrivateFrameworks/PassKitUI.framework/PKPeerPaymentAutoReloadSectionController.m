@implementation PKPeerPaymentAutoReloadSectionController

- (PKPeerPaymentAutoReloadSectionController)initWithDelegate:(id)a3 pass:(id)a4 context:(int64_t)a5 passLibraryDataProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKPeerPaymentAutoReloadSectionController *v13;
  PKPeerPaymentAutoReloadSectionController *v14;
  void *v15;
  uint64_t v16;
  PKPeerPaymentAccount *account;
  PKPeerPaymentThresholdTopUpController *v18;
  PKPeerPaymentThresholdTopUpController *controller;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentAutoReloadSectionController;
  v13 = -[PKPaymentPassDetailSectionController init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "account");
    v16 = objc_claimAutoreleasedReturnValue();
    account = v14->_account;
    v14->_account = (PKPeerPaymentAccount *)v16;

    objc_msgSend(v15, "registerObserver:", v14);
    v18 = -[PKPeerPaymentThresholdTopUpController initWithPeerPaymentAccount:pass:context:passLibraryDataProvider:delegate:]([PKPeerPaymentThresholdTopUpController alloc], "initWithPeerPaymentAccount:pass:context:passLibraryDataProvider:delegate:", v14->_account, v11, a5, v12, v14);
    controller = v14->_controller;
    v14->_controller = v18;

  }
  return v14;
}

- (id)allSectionIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PeerPaymentAutoReloadSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sectionIdentifiers
{
  void *v3;

  if (-[PKPaymentPassDetailSectionController currentSegment](self, "currentSegment")
    || !-[PKPeerPaymentAutoReloadSectionController _sectionAvailable](self, "_sectionAvailable"))
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PKPeerPaymentAutoReloadSectionController allSectionIdentifiers](self, "allSectionIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "hasAssociatedPeerPaymentAccount") && !objc_msgSend(v3, "passActivationState"))
    v6 = objc_msgSend(v5, "supportsThresholdTopUp");
  else
    v6 = 0;

  return v6;
}

- (void)preflight:(id)a3
{
  void *v4;
  void *v5;
  PKPeerPaymentAccount *v6;
  PKPeerPaymentAccount *account;
  id v8;

  v4 = (void *)MEMORY[0x1E0D67470];
  v8 = a3;
  objc_msgSend(v4, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (PKPeerPaymentAccount *)objc_claimAutoreleasedReturnValue();
  account = self->_account;
  self->_account = v6;

  -[PKPeerPaymentAutoReloadSectionController _updateRecurringPaymentsWithCompletion:](self, "_updateRecurringPaymentsWithCompletion:", v8);
}

- (void)_updateRecurringPaymentsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__PKPeerPaymentAutoReloadSectionController__updateRecurringPaymentsWithCompletion___block_invoke;
  v7[3] = &unk_1E3E63110;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "recurringPaymentsWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __83__PKPeerPaymentAutoReloadSectionController__updateRecurringPaymentsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(a2, "pk_firstObjectPassingTest:", &__block_literal_global_15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PKPeerPaymentAutoReloadSectionController__updateRecurringPaymentsWithCompletion___block_invoke_3;
  block[3] = &unk_1E3E61B90;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

BOOL __83__PKPeerPaymentAutoReloadSectionController__updateRecurringPaymentsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 3;
}

void __83__PKPeerPaymentAutoReloadSectionController__updateRecurringPaymentsWithCompletion___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_storeStrong(WeakRetained + 8, *(id *)(a1 + 32));
    v4 = objc_loadWeakRetained(v7 + 10);
    objc_msgSend(v7, "sectionIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadSections:", v5);

    v3 = v7;
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      (*(void (**)(void))(v6 + 16))();
      v3 = v7;
    }
  }

}

- (BOOL)_sectionAvailable
{
  PKPeerPaymentAccount *account;
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;

  if (-[PKPeerPaymentAccount supportsThresholdTopUp](self->_account, "supportsThresholdTopUp"))
  {
    account = self->_account;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "familyCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKPeerPaymentAccount isEligibleForThresholdTopUpForUser:](account, "isEligibleForThresholdTopUpForUser:", v6))v7 = PKIsVision() ^ 1;
    else
      LOBYTE(v7) = 0;

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return -[PKPeerPaymentAutoReloadSectionController _sectionAvailable](self, "_sectionAvailable", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("AutoReload"), a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("AutoReload"));
  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_autoReloadPayment)
  {
    PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_ENTRY_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v8);

    -[PKPeerPaymentRecurringPayment currency](self->_autoReloadPayment, "currency");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPayment amount](self->_autoReloadPayment, "amount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPayment threshold](self->_autoReloadPayment, "threshold");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = v9 == 0;
    else
      v12 = 1;
    if (!v12)
    {
      PKCurrencyAmountMake();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "minimalFormattedStringValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_ENTRY_SUBTITLE"), CFSTR("%@"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSecondaryText:", v15);

    }
    objc_msgSend(v7, "textProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setColor:", v17);

    if (v10 && v9)
    {
      PKCurrencyAmountMake();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "configurationByApplyingConfiguration:", v19);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v42);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v20);
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTintColor:", v22);

      objc_msgSend(v21, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      v24 = v23;
      v26 = v25;
      v27 = objc_alloc_init(MEMORY[0x1E0DC3990]);
      PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D8]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setFont:", v28);

      objc_msgSend(v41, "minimalFormattedStringValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setText:", v29);

      objc_msgSend(v27, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678A8]);
      objc_msgSend(v27, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      v31 = v30;
      v33 = v32;
      v34 = objc_alloc(MEMORY[0x1E0DC3CA8]);
      v43[0] = v27;
      v43[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v34, "initWithArrangedSubviews:", v35);

      objc_msgSend(v36, "setAxis:", 0);
      objc_msgSend(v36, "setAlignment:", 4);
      objc_msgSend(v36, "setSpacing:", 6.0);
      objc_msgSend(v36, "setFrame:", 0.0, 0.0, v24 + v31 + 6.0, fmax(v33, v26));
      objc_msgSend(v6, "setAccessoryView:", v36);

    }
    else
    {
      objc_msgSend(v6, "setAccessoryType:", 1);
    }

  }
  else
  {
    PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_SETUP_ACTION"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v37);

    objc_msgSend(v7, "textProperties");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setColor:", v39);

    objc_msgSend(v6, "setAccessoryView:", 0);
    objc_msgSend(v6, "setAccessoryType:", 0);
  }
  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678D8]);
  objc_msgSend(v6, "setContentConfiguration:", v7);

  return v6;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  void *v3;

  if (-[PKPeerPaymentAutoReloadSectionController _sectionAvailable](self, "_sectionAvailable", a3))
  {
    PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_SETUP_FOOTER"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7;
  id v8;

  v7 = a4;
  v8 = a3;
  -[PKPeerPaymentAutoReloadSectionController presentAutoReload](self, "presentAutoReload");
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (void)presentAutoReload
{
  -[PKPeerPaymentThresholdTopUpController presentTopUpFlowForRecurringPayment:](self->_controller, "presentTopUpFlowForRecurringPayment:", self->_autoReloadPayment);
}

- (void)recurringPaymentsChanged
{
  -[PKPeerPaymentAutoReloadSectionController _updateRecurringPaymentsWithCompletion:](self, "_updateRecurringPaymentsWithCompletion:", 0);
}

- (void)thresholdTopUpController:(id)a3 requestsDismissViewController:(id)a4
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pkui_frontMostViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)thresholdTopUpController:(id)a3 requestsPresentViewController:(id)a4
{
  PKPaymentPassDetailWrapperSectionControllerDelegate **p_delegate;
  id v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "pkui_frontMostViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)thresholdTopUpController:(id)a3 requestsPushViewController:(id)a4
{
  PKPaymentPassDetailWrapperSectionControllerDelegate **p_delegate;
  id v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

}

- (void)thresholdTopUpControllerCompletedSetup:(id)a3
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)presentationSceneIdentifierForTopUpController:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sceneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)thresholdTopUpController:(id)a3 requestsPopViewController:(id)a4
{
  void *v4;
  id v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_autoReloadPayment, 0);
}

@end

@implementation PKPaymentSetupPurchaseController

- (PKPaymentSetupPurchaseController)initWithProvisioningController:(id)a3 context:(int64_t)a4 purchaseControllerDelegate:(id)a5 product:(id)a6 provisioningMetadata:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPaymentSetupPurchaseController *v17;
  PKPaymentSetupPurchaseController *v18;
  objc_super v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentSetupPurchaseController;
  v17 = -[PKPaymentSetupPurchaseController init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_product, a6);
    objc_storeStrong((id *)&v18->_provisioningController, a3);
    v18->_setupContext = a4;
    objc_storeStrong((id *)&v18->_purchaseControllerDelegate, a5);
    objc_storeStrong((id *)&v18->_provisioningMethodMetadata, a7);
  }

  return v18;
}

- (void)presentAddCardAlert:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[4];
  id v31;
  PKPaymentSetupPurchaseController *v32;

  v4 = a3;
  v5 = objc_msgSend(v4, "merchantCapabilities") & 0xC;
  objc_msgSend(v4, "supportedNetworks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_PAYMENT_METHOD_REQUIRED_ALERT_TITLE"));
  v8 = objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_ADD_PAYMENT_METHOD_CANCEL_ACTION"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == 1)
  {
    v9 = CFSTR("SETUP_PURCHASE_ADD_SPECIFIC_CARD_ALERT_MESSAGE");
    if (v5 == 8)
    {
      v9 = CFSTR("SETUP_PURCHASE_ADD_SPECIFIC_DEBIT_CARD_ALERT_MESSAGE");
      v10 = CFSTR("SETUP_PURCHASE_ADD_PAYMENT_METHOD_ADD_SPECIFIC_DEBIT_CARD_ACTION");
    }
    else
    {
      v10 = CFSTR("SETUP_PURCHASE_ADD_PAYMENT_METHOD_ADD_SPECIFIC_CARD_ACTION");
    }
    v11 = v9;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKPaymentCredentialTypeForPaymentNetworkName();

    PKDisplayablePaymentNetworkNameForPaymentCredentialType();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(v11, CFSTR("%@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v10;
    PKDisplayablePaymentNetworkNameForPaymentCredentialType();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(v15, CFSTR("%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v5 == 8)
    {
      PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_ADD_DEBIT_PAYMENT_METHOD_ALERT_MESSAGE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("SETUP_PURCHASE_ADD_PAYMENT_METHOD_ADD_DEBIT_CARD_ACTION");
    }
    else
    {
      PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_ADD_PAYMENT_METHOD_ALERT_MESSAGE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("SETUP_PURCHASE_ADD_PAYMENT_METHOD_ADD_CARD_ACTION");
    }
    PKLocalizedPaymentString(&v18->isa);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, v14, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  if (self->_setupContext == 4)
  {
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v17, 0, &__block_literal_global_204);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAction:", v21);

  }
  else
  {
    objc_msgSend(v4, "supportedNetworks");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0DC3448];
    v30[0] = v20;
    v30[1] = 3221225472;
    v30[2] = __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_2;
    v30[3] = &unk_1E3E61D90;
    v31 = v22;
    v32 = self;
    v24 = v22;
    objc_msgSend(v23, "actionWithTitle:style:handler:", v17, 0, v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAction:", v25);

  }
  v29[0] = v20;
  v29[1] = 3221225472;
  v29[2] = __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_8;
  v29[3] = &unk_1E3E61D68;
  v29[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v27, 1, v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v26);

  -[PKPaymentSetupPurchaseControllerDelegate presentViewController:animated:completion:](self->_purchaseControllerDelegate, "presentViewController:animated:completion:", v19, 1, 0);
}

void __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("shoebox://"), *MEMORY[0x1E0D6BAE8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openURL:configuration:completionHandler:", v1, 0, 0);

}

void __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", v2);
  objc_msgSend(v3, "setAllowedPaymentNetworks:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "showSpinner:", 1);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_3;
  v6[3] = &unk_1E3E64E38;
  v4 = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  objc_msgSend(v5, "preflightWithCompletion:", v6);

}

void __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  PKPaymentSetupDismissibleNavigationController *v7;
  uint64_t v8;
  PKPaymentSetupDismissibleNavigationController *v9;
  PKPaymentSetupDismissibleNavigationController *v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[4];
  PKPaymentSetupDismissibleNavigationController *v14;
  id v15;
  _QWORD v16[5];
  PKPaymentSetupDismissibleNavigationController *v17;
  id location;

  v5 = a3;
  if (a2)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 8, *(_QWORD *)(a1 + 32), 0);
    v7 = -[PKPaymentSetupDismissibleNavigationController initWithContext:]([PKPaymentSetupDismissibleNavigationController alloc], "initWithContext:", 8);
    -[PKPaymentSetupDismissibleNavigationController useStandardPlatformPresentationStyle](v7, "useStandardPlatformPresentationStyle");
    objc_initWeak(&location, *(id *)(a1 + 40));
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_4;
    v16[3] = &unk_1E3E61388;
    v16[4] = *(_QWORD *)(a1 + 40);
    v9 = v7;
    v17 = v9;
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_6;
    v13[3] = &unk_1E3E61B68;
    objc_copyWeak(&v15, &location);
    v10 = v9;
    v14 = v10;
    +[PKProvisioningFlowBridge startProvisionToPurchaseFlowWithNavController:context:onFirstViewControllerShown:completion:](PKProvisioningFlowBridge, "startProvisionToPurchaseFlowWithNavController:context:onFirstViewControllerShown:completion:", v10, v6, v16, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "showSpinner:", 0);
    if (v5)
    {
      v11 = v5;
    }
    else
    {
      PKDisplayableErrorForCommonType();
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v11;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_7;
    v12[3] = &unk_1E3E612E8;
    v12[4] = *(_QWORD *)(a1 + 40);
    PKAlertForDisplayableErrorWithHandlers(v11, 0, v12, 0);
    v10 = (PKPaymentSetupDismissibleNavigationController *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "presentViewController:animated:completion:", v10, 1, 0);
  }

}

uint64_t __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "showSpinner:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, &__block_literal_global_72_1);
}

void __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_6(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[3], "paymentSetupDidFinish:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

uint64_t __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "showKeyPad");
  return result;
}

uint64_t __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "showKeyPad");
  return result;
}

- (void)presetPaymentRequest:(id)a3 forResultType:(int64_t)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;
  _QWORD v12[5];

  v6 = a3;
  if (a4 != 2)
  {
    if (a4 == 9)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __71__PKPaymentSetupPurchaseController_presetPaymentRequest_forResultType___block_invoke;
      v12[3] = &unk_1E3E612E8;
      v12[4] = self;
      v7 = PKCreateAlertControllerForWalletUninstalled(v12);
      -[PKPaymentSetupPurchaseControllerDelegate presentViewController:animated:completion:](self->_purchaseControllerDelegate, "presentViewController:animated:completion:", v7, 1, 0);

      goto LABEL_7;
    }
    if (a4 != 5)
    {
      -[PKPaymentSetupPurchaseControllerDelegate showSpinner:](self->_purchaseControllerDelegate, "showSpinner:", 1);
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __71__PKPaymentSetupPurchaseController_presetPaymentRequest_forResultType___block_invoke_2;
      v8[3] = &unk_1E3E625E8;
      objc_copyWeak(&v10, &location);
      v9 = v6;
      -[PKPaymentSetupPurchaseController presentTermsAndConditionsWithCompletion:](self, "presentTermsAndConditionsWithCompletion:", v8);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
      goto LABEL_7;
    }
  }
  -[PKPaymentSetupPurchaseController presentAddCardAlert:](self, "presentAddCardAlert:", v6);
LABEL_7:

}

uint64_t __71__PKPaymentSetupPurchaseController_presetPaymentRequest_forResultType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "showKeyPad");
  return result;
}

void __71__PKPaymentSetupPurchaseController_presetPaymentRequest_forResultType___block_invoke_2(uint64_t a1, int a2)
{
  id *WeakRetained;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[3], "showSpinner:", 0);
    WeakRetained = v6;
    if (a2)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67088]), "initWithPaymentRequest:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v5, "setDelegate:", v6[3]);
      objc_msgSend(v5, "_setPrivateDelegate:", v6[3]);
      objc_msgSend(v5, "presentWithCompletion:", 0);

      WeakRetained = v6;
    }
  }

}

- (id)paymentRequestForAmount:(id)a3
{
  id v4;
  uint64_t v5;
  const __CFString *v6;
  __CFString *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v4 = a3;
  v5 = -[PKPaymentProvisioningMethodMetadata depositType](self->_provisioningMethodMetadata, "depositType");
  v6 = CFSTR("SETUP_PURCHASE_REFUNDABLE_SERVICE_FEE_ITEM_LABEL");
  if (v5 == 2)
    v6 = CFSTR("SETUP_PURCHASE_NONREFUNDABLE_SERVICE_FEE_ITEM_LABEL");
  if (v5 == 1)
    v7 = CFSTR("SETUP_PURCHASE_REFUNDABLE_DEPOSIT_ITEM_LABEL");
  else
    v7 = (__CFString *)v6;
  v8 = v4;
  -[PKPaymentProvisioningMethodMetadata depositAmount](self->_provisioningMethodMetadata, "depositAmount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (uint64_t)v8;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "compare:", v9);

    v10 = (uint64_t)v8;
    if (v12 == -1)
    {
      objc_msgSend(v8, "decimalNumberByAdding:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

    }
  }
  -[PKPaymentProvisioningMethodMetadata digitalIssuanceMetadata](self->_provisioningMethodMetadata, "digitalIssuanceMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0D66EB0]);
  objc_msgSend(v13, "action");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setItemDescription:", v15);

  v16 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v13, "serviceProviderDict");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithDictionary:", v17);

  objc_msgSend(v18, "setObject:forKey:", v10, *MEMORY[0x1E0D6B598]);
  objc_msgSend(v14, "setServiceProviderData:", v18);
  objc_msgSend(v13, "serviceProviderIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setServiceProviderIdentifier:", v19);

  v44 = v18;
  v45 = (void *)v10;
  if (self->_setupContext == 4 && PKIsAltAccountPairedOrPairing())
  {
    PKPairedOrPairingDevice();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PKSerialNumberFromNRDevice();
    v21 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }
  v43 = (void *)v21;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67660]), "initWithServiceProviderOrder:targetDeviceSerialNumber:", v14, v21);
  objc_msgSend(v13, "serviceProviderAcceptedNetworks");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSupportedNetworks:", v23);

  objc_msgSend(v13, "serviceProviderCapabilities");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMerchantCapabilities:", PKMerchantCapabilityFromStrings());

  objc_msgSend(v13, "serviceProviderCountryCode");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCountryCode:", v25);

  -[PKPaymentProvisioningMethodMetadata currency](self->_provisioningMethodMetadata, "currency");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCurrencyCode:", v26);

  objc_msgSend(v13, "serviceProviderSupportedCountries");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSupportedCountries:", v27);

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  v29 = (void *)MEMORY[0x1E0D67358];
  PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_TRANSFER_ITEM_LABEL"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v8;
  objc_msgSend(v29, "summaryItemWithLabel:amount:", v30, v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "addObject:", v31);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "compare:", v9);

    if (v33 == -1)
    {
      v34 = (void *)MEMORY[0x1E0D67358];
      PKLocalizedPaymentString(&v7->isa);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "summaryItemWithLabel:amount:", v35, v9);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "addObject:", v36);
    }
  }
  objc_msgSend(v13, "serviceProviderLocalizedDisplayName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    v39 = v37;
  }
  else
  {
    -[PKPaymentSetupProduct displayName](self->_product, "displayName");
    v39 = (id)objc_claimAutoreleasedReturnValue();
  }
  v40 = v39;

  objc_msgSend(MEMORY[0x1E0D67358], "summaryItemWithLabel:amount:", v40, v45);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObject:", v41);
  objc_msgSend(v22, "setPaymentSummaryItems:", v28);

  return v22;
}

- (id)paymentRequestForProduct:(id)a3 serviceProviderProduct:(id)a4 productItem:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v56;
  NSString *p_isa;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  _QWORD v67[2];
  _QWORD v68[3];

  v68[2] = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(v6, "amount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentProvisioningMethodMetadata depositAmount](self->_provisioningMethodMetadata, "depositAmount");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = -[PKPaymentProvisioningMethodMetadata depositType](self->_provisioningMethodMetadata, "depositType");
  v10 = CFSTR("SETUP_PURCHASE_REFUNDABLE_SERVICE_FEE_ITEM_LABEL");
  if (v9 == 2)
    v10 = CFSTR("SETUP_PURCHASE_NONREFUNDABLE_SERVICE_FEE_ITEM_LABEL");
  if (v9 == 1)
    v10 = CFSTR("SETUP_PURCHASE_REFUNDABLE_DEPOSIT_ITEM_LABEL");
  p_isa = &v10->isa;
  v65 = (void *)v8;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "compare:", v8);

    if (v12 == -1)
    {
      objc_msgSend(v7, "decimalNumberByAdding:", v8);
      v13 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v13;
    }
  }
  -[PKPaymentProvisioningMethodMetadata digitalIssuanceMetadata](self->_provisioningMethodMetadata, "digitalIssuanceMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x1E0D66EB0]);
  objc_msgSend(v14, "action");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setItemDescription:", v16);

  v17 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v14, "serviceProviderDict");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithDictionary:", v18);

  objc_msgSend(v19, "setObject:forKey:", v7, *MEMORY[0x1E0D6B598]);
  v67[0] = CFSTR("identifier");
  objc_msgSend(v6, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = CFSTR("amount");
  v68[0] = v20;
  v68[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
  v21 = objc_claimAutoreleasedReturnValue();

  v61 = (void *)v21;
  v66 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:");
  v62 = v19;
  objc_msgSend(v15, "setServiceProviderData:", v19);
  objc_msgSend(v14, "serviceProviderIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setServiceProviderIdentifier:", v22);

  v64 = v7;
  if (self->_setupContext == 4 && PKIsAltAccountPairedOrPairing())
  {
    PKPairedOrPairingDevice();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PKSerialNumberFromNRDevice();
    v24 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }
  v63 = v15;
  v59 = (void *)v24;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67660]), "initWithServiceProviderOrder:targetDeviceSerialNumber:", v15, v24);
  objc_msgSend(v14, "serviceProviderAcceptedNetworks");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSupportedNetworks:", v26);

  objc_msgSend(v14, "serviceProviderCapabilities");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setMerchantCapabilities:", PKMerchantCapabilityFromStrings());

  objc_msgSend(v14, "serviceProviderCountryCode");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCountryCode:", v28);

  -[PKPaymentProvisioningMethodMetadata currency](self->_provisioningMethodMetadata, "currency");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCurrencyCode:", v29);

  objc_msgSend(v14, "serviceProviderSupportedCountries");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSupportedCountries:", v30);

  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  objc_msgSend(v6, "localizedDisplayName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedDescription");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  v58 = v32;
  if (v33)
  {
    v35 = objc_msgSend(v33, "length");

    if (v35)
    {
      v36 = v32;
      v37 = v34;
      if (v36 == v37)
      {

      }
      else
      {
        v38 = v37;
        if (!v36)
        {

LABEL_28:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v36, v38);
          goto LABEL_20;
        }
        v39 = objc_msgSend(v36, "isEqualToString:", v37);

        if (!v39)
          goto LABEL_28;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v32, v56);
LABEL_20:
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x1E0D67358];
  v42 = v6;
  objc_msgSend(v6, "amount");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "summaryItemWithLabel:amount:", v40, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "addObject:", v44);
  if (v65)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "compare:", v65);

    if (v46 == -1)
    {
      v47 = (void *)MEMORY[0x1E0D67358];
      PKLocalizedPaymentString(p_isa);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "summaryItemWithLabel:amount:", v48, v65);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "addObject:", v49);
    }
  }
  objc_msgSend(v14, "serviceProviderLocalizedDisplayName");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v50)
  {
    v52 = v50;
  }
  else
  {
    -[PKPaymentSetupProduct displayName](self->_product, "displayName");
    v52 = (id)objc_claimAutoreleasedReturnValue();
  }
  v53 = v52;

  objc_msgSend(MEMORY[0x1E0D67358], "summaryItemWithLabel:amount:", v53, v64);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v54);
  objc_msgSend(v25, "setPaymentSummaryItems:", v31);

  return v25;
}

- (void)presentTermsAndConditionsWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  RemoteUIController *v7;
  RemoteUIController *termsController;
  void *v9;
  PKPortraitNavigationController *v10;
  void *v11;
  void *v12;
  RemoteUIController *v13;
  PKPortraitNavigationController *v14;
  _QWORD v15[4];
  PKPortraitNavigationController *v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  id v19;
  id location;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (self->_acceptedTerms)
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }
  else
  {
    -[PKPaymentSetupProduct termsURL](self->_product, "termsURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (!self->_termsController)
      {
        v7 = (RemoteUIController *)objc_alloc_init(MEMORY[0x1E0D872F0]);
        termsController = self->_termsController;
        self->_termsController = v7;

        -[RemoteUIController setDelegate:](self->_termsController, "setDelegate:", self);
      }
      -[PKPaymentSetupPurchaseControllerDelegate resignFirstResponder](self->_purchaseControllerDelegate, "resignFirstResponder");
      -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc_init(PKPortraitNavigationController);
      -[PKPortraitNavigationController setModalInPresentation:](v10, "setModalInPresentation:", 1);
      -[RemoteUIController setNavigationController:](self->_termsController, "setNavigationController:", v10);
      -[RemoteUIController loader](self->_termsController, "loader");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAllowNonSecureHTTP:", objc_msgSend(v12, "devSigned"));

      objc_initWeak(&location, self);
      v13 = self->_termsController;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __76__PKPaymentSetupPurchaseController_presentTermsAndConditionsWithCompletion___block_invoke;
      v15[3] = &unk_1E3E77CA8;
      objc_copyWeak(&v19, &location);
      v14 = v10;
      v16 = v14;
      v18 = v5;
      v17 = v6;
      -[RemoteUIController loadURL:postBody:completion:](v13, "loadURL:postBody:completion:", v17, 0, v15);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);

    }
    else
    {
      v5[2](v5, 1, 0);
    }

  }
}

void __76__PKPaymentSetupPurchaseController_presentTermsAndConditionsWithCompletion___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__PKPaymentSetupPurchaseController_presentTermsAndConditionsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E3E6EBA0;
  objc_copyWeak(&v12, a1 + 7);
  v13 = a2;
  v8 = a1[4];
  v11 = a1[6];
  v9 = a1[5];
  v10 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v12);
}

void __76__PKPaymentSetupPurchaseController_presentTermsAndConditionsWithCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  int v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  char v16;
  _QWORD v17[4];
  id v18;
  id v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 64);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (WeakRetained && WeakRetained[3])
  {
    if (*(_BYTE *)(a1 + 72))
    {
      PKPaymentSetupApplyContextAppearance((uint64_t)WeakRetained[2], *(void **)(a1 + 32));
      v5 = objc_msgSend(*(id *)(a1 + 32), "pkui_userInterfaceIdiomSupportsLargeLayouts");
      v6 = v5;
      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "setModalPresentationStyle:", 3);
        objc_msgSend(v4[3], "presentViewController:withTransition:completion:", *(_QWORD *)(a1 + 32), 1, 0);
      }
      else
      {
        objc_msgSend(v4[3], "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);
      }
      v10 = v4[7];
      v11 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __76__PKPaymentSetupPurchaseController_presentTermsAndConditionsWithCompletion___block_invoke_3;
      v17[3] = &unk_1E3E63570;
      objc_copyWeak(&v19, v2);
      v20 = v6;
      v18 = *(id *)(a1 + 56);
      objc_msgSend(v10, "setHandlerForElementName:handler:", CFSTR("agree"), v17);
      v12 = v4[7];
      v13[0] = v11;
      v13[1] = 3221225472;
      v13[2] = __76__PKPaymentSetupPurchaseController_presentTermsAndConditionsWithCompletion___block_invoke_4;
      v13[3] = &unk_1E3E63570;
      objc_copyWeak(&v15, v2);
      v16 = v6;
      v14 = *(id *)(a1 + 56);
      objc_msgSend(v12, "setHandlerForElementName:handler:", CFSTR("disagree"), v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&v19);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = v8;
        v23 = 2112;
        v24 = v9;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Error loading terms UI at %@ with error: %@", buf, 0x16u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }

}

void __76__PKPaymentSetupPurchaseController_presentTermsAndConditionsWithCompletion___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setAcceptedTerms:", 1);
    v3 = (void *)v4[3];
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v3, "dismissViewControllerWithTransition:completion:", 1, 0);
    else
      objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v4;
  }

}

void __76__PKPaymentSetupPurchaseController_presentTermsAndConditionsWithCompletion___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[3];
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v3, "dismissViewControllerWithTransition:completion:", 2, 0);
    else
      objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4[3], "showKeyPad");

}

- (BOOL)acceptedTerms
{
  return self->_acceptedTerms;
}

- (void)setAcceptedTerms:(BOOL)a3
{
  self->_acceptedTerms = a3;
}

- (RemoteUIController)termsController
{
  return self->_termsController;
}

- (void)setTermsController:(id)a3
{
  objc_storeStrong((id *)&self->_termsController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_provisioningMethodMetadata, 0);
  objc_storeStrong((id *)&self->_purchaseControllerDelegate, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end

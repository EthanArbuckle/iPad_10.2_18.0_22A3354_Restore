@implementation PKPaymentSetupDevicePickerViewController

- (PKPaymentSetupDevicePickerViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 product:(id)a6 webService:(id)a7 nanoWebService:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKPaymentSetupDevicePickerViewController *v18;
  PKPaymentSetupDevicePickerViewController *v19;
  uint64_t v20;
  NSArray *webServices;
  id v23;
  id v24;
  objc_super v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v24 = a5;
  v23 = a6;
  v16 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentSetupDevicePickerViewController;
  v18 = -[PKDynamicCollectionViewController init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_provisioningController, a3);
    v19->_setupContext = a4;
    objc_storeStrong((id *)&v19->_setupDelegate, a5);
    objc_storeStrong((id *)&v19->_product, a6);
    objc_storeStrong((id *)&v19->_webService, a7);
    objc_storeStrong((id *)&v19->_nanoWebService, a8);
    v26[0] = v16;
    v26[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v20 = objc_claimAutoreleasedReturnValue();
    webServices = v19->_webServices;
    v19->_webServices = (NSArray *)v20;

  }
  return v19;
}

- (void)viewDidLoad
{
  void *v3;
  PKPaymentSetupProduct *product;
  void *v5;
  void *v6;
  PKPaymentSetupDevicePickerListSectionController *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupDevicePickerViewController;
  -[PKDynamicCollectionViewController viewDidLoad](&v9, sel_viewDidLoad);
  PKLocalizedPaymentString(CFSTR("ISSUER_ADD_CARD_WALLET"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  product = self->_product;
  if (product)
  {
    -[PKPaymentSetupProduct displayName](product, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("ISSUER_ADD_PICKER_DESCRIPTION"), CFSTR("%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PKLocalizedPaymentString(CFSTR("ISSUER_ADD_PICKER_DESCRIPTION_GENERIC"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = -[PKPaymentSetupDevicePickerListSectionController initWithWebServices:title:subtitle:image:]([PKPaymentSetupDevicePickerListSectionController alloc], "initWithWebServices:title:subtitle:image:", self->_webServices, v3, v6, self->_cardImage);
  -[PKPaymentSetupDevicePickerListSectionController setDelegate:](v7, "setDelegate:", self);
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicCollectionViewController setSections:animated:](self, "setSections:animated:", v8, 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupDevicePickerViewController;
  -[PKDynamicCollectionViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  PKPaymentSetupProduct *product;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  product = self->_product;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__PKPaymentSetupDevicePickerViewController_preflightWithCompletion___block_invoke;
  v8[3] = &unk_1E3E632B8;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = -[PKPaymentSetupProduct digitalCardCachedImage:](product, "digitalCardCachedImage:", v8);

}

void __68__PKPaymentSetupDevicePickerViewController_preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1120), a3);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112))
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 1056);
    *(_QWORD *)(v7 + 1056) = v6;

    v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "copy");
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 1088);
    *(_QWORD *)(v10 + 1088) = v9;

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "provisioningMethodTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setProvisioningMethodMetadata:forType:", 0, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }

    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(a1 + 40);
    v19 = *(void **)(v17 + 1056);
    v20 = *(_QWORD *)(v17 + 1088);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __68__PKPaymentSetupDevicePickerViewController_preflightWithCompletion___block_invoke_2;
    v22[3] = &unk_1E3E61590;
    v23 = v18;
    objc_msgSend(v19, "requestProvisioningMethodMetadataForProduct:completionHandler:", v20, v22);

  }
  else
  {
    v21 = *(_QWORD *)(a1 + 40);
    if (v21)
      (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v21, 1);
  }

}

uint64_t __68__PKPaymentSetupDevicePickerViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)didSelectWebService:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const __CFString *v14;
  void *v15;
  id WeakRetained;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = 6;
  if (self->_nanoWebService == a3)
  {
    v5 = 15;
    v6 = 16;
  }
  else
  {
    v6 = 9;
  }
  v7 = objc_retain(*(id *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR___PKPaymentSetupDevicePickerListSectionController__items[v5]));
  v8 = objc_retain(*(id *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR___PKPaymentSetupDevicePickerListSectionController__items[v6]));
  reporter = self->_reporter;
  v10 = *MEMORY[0x1E0D68AA0];
  v18[0] = *MEMORY[0x1E0D68B38];
  v11 = *MEMORY[0x1E0D68A30];
  v17[0] = v10;
  v17[1] = v11;
  objc_msgSend(a3, "targetDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceClass");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("iPhone")) & 1) != 0)
  {
    v14 = CFSTR("phone");
  }
  else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("iPad")) & 1) != 0)
  {
    v14 = CFSTR("pad");
  }
  else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("Watch")) & 1) != 0)
  {
    v14 = CFSTR("watch");
  }
  else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("Mac")) & 1) != 0)
  {
    v14 = CFSTR("mac");
  }
  else if (objc_msgSend(v13, "isEqualToString:", CFSTR("RealityDevice")))
  {
    v14 = CFSTR("vision");
  }
  else
  {
    v14 = CFSTR("unknown");
  }

  v18[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningAnalyticsSessionUIReporter reportEvent:](reporter, "reportEvent:", v15);

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  objc_msgSend(WeakRetained, "devicePickerViewController:didSelectProvisioningController:product:", self, v7, v8);

}

- (PKPaymentSetupDevicePickerViewControllerFlowDelegate)flowDelegate
{
  return (PKPaymentSetupDevicePickerViewControllerFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
}

- (void)setFlowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowDelegate, a3);
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong((id *)&self->_cardImage, 0);
  objc_storeStrong((id *)&self->_nanoWebService, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_webServices, 0);
  objc_storeStrong((id *)&self->_nanoProduct, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_setupDelegate, 0);
  objc_storeStrong((id *)&self->_bridgeProvisioningController, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end

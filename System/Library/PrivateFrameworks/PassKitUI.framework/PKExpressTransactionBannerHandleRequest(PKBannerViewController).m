@implementation PKExpressTransactionBannerHandleRequest(PKBannerViewController)

- (PKExpressTransactionBannerViewController)createBannerViewController
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  PKExpressTransactionBannerViewController *v5;
  id v6;
  PKExpressTransactionBannerViewController *v7;
  uint64_t v8;
  PKPaymentService *paymentService;
  PKPass *v10;
  PKPass *v11;
  uint64_t v12;
  PKTransitBalanceModel *transitBalanceModel;
  void *v14;
  void *v15;
  NSObject *v16;
  PKPaymentService *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  PKPaymentService *v21;
  NSObject *v22;
  _QWORD block[6];
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD *v28;
  _QWORD v29[4];
  id v30;
  PKPass *v31;
  NSObject *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  id location;
  objc_super v39;

  objc_msgSend(a1, "passUniqueIdentifier");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "passWithUniqueID:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = v3;
      objc_opt_self();
      v5 = [PKExpressTransactionBannerViewController alloc];
      v6 = v4;
      if (v5)
      {
        v39.receiver = v5;
        v39.super_class = (Class)PKExpressTransactionBannerViewController;
        v7 = (PKExpressTransactionBannerViewController *)objc_msgSendSuper2(&v39, sel_initWithNibName_bundle_, 0, 0);
        v5 = v7;
        if (v7)
        {
          objc_storeStrong((id *)&v7->_pass, v3);
          v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", v5);
          paymentService = v5->_paymentService;
          v5->_paymentService = (PKPaymentService *)v8;

          v5->_state = 0;
          v5->_activeLayoutMode = 0;
          v10 = 0;
          if (-[PKPass passType](v5->_pass, "passType") == PKPassTypeSecureElement)
          {
            v11 = v5->_pass;
            v10 = v11;
            if (v11)
            {
              if (-[PKPass isStoredValuePass](v11, "isStoredValuePass"))
              {
                v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67740]), "initWithPass:", v10);
                transitBalanceModel = v5->_transitBalanceModel;
                v5->_transitBalanceModel = (PKTransitBalanceModel *)v12;

                -[PKPass uniqueID](v5->_pass, "uniqueID");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKPass devicePrimaryPaymentApplication](v10, "devicePrimaryPaymentApplication");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = dispatch_group_create();
                objc_initWeak(&location, v5);
                v36[0] = 0;
                v36[1] = v36;
                v36[2] = 0x3032000000;
                v36[3] = __Block_byref_object_copy__63;
                v36[4] = __Block_byref_object_dispose__63;
                v37 = 0;
                v34[0] = 0;
                v34[1] = v34;
                v34[2] = 0x3032000000;
                v34[3] = __Block_byref_object_copy__63;
                v34[4] = __Block_byref_object_dispose__63;
                v35 = 0;
                dispatch_group_enter(v16);
                v17 = v5->_paymentService;
                v29[0] = MEMORY[0x1E0C809B0];
                v29[1] = 3221225472;
                v29[2] = __58__PKExpressTransactionBannerViewController__initWithPass___block_invoke;
                v29[3] = &unk_1E3E69088;
                v33 = v36;
                v18 = MEMORY[0x1E0C809B0];
                v19 = v15;
                v30 = v19;
                v10 = v10;
                v31 = v10;
                v20 = v16;
                v32 = v20;
                -[PKPaymentService transitStateWithPassUniqueIdentifier:paymentApplication:completion:](v17, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v14, v19, v29);
                dispatch_group_enter(v20);
                v21 = v5->_paymentService;
                v26[0] = v18;
                v26[1] = 3221225472;
                v26[2] = __58__PKExpressTransactionBannerViewController__initWithPass___block_invoke_2;
                v26[3] = &unk_1E3E690B0;
                v28 = v34;
                v22 = v20;
                v27 = v22;
                -[PKPaymentService balancesForPaymentPassWithUniqueIdentifier:completion:](v21, "balancesForPaymentPassWithUniqueIdentifier:completion:", v14, v26);
                block[0] = v18;
                block[1] = 3221225472;
                block[2] = __58__PKExpressTransactionBannerViewController__initWithPass___block_invoke_3;
                block[3] = &unk_1E3E6C9A8;
                objc_copyWeak(&v25, &location);
                block[4] = v36;
                block[5] = v34;
                dispatch_group_notify(v22, MEMORY[0x1E0C80D38], block);
                objc_destroyWeak(&v25);

                _Block_object_dispose(v34, 8);
                _Block_object_dispose(v36, 8);

                objc_destroyWeak(&location);
              }
            }
          }

        }
      }

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end

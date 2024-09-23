@implementation PKReprocessMerchantActivity

- (PKReprocessMerchantActivity)initWithTransaction:(id)a3 paymentPass:(id)a4
{
  id v7;
  id v8;
  PKReprocessMerchantActivity *v9;
  PKReprocessMerchantActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKReprocessMerchantActivity;
  v9 = -[UIActivity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transaction, a3);
    objc_storeStrong((id *)&v10->_paymentPass, a4);
  }

  return v10;
}

- (id)activityTitle
{
  return CFSTR("Reprocess Merchant");
}

- (id)activityImage
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("map.fill"));
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  -[PKPaymentPass devicePrimaryPaymentApplication](self->_paymentPass, "devicePrimaryPaymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67710]), "initWithTransaction:paymentApplication:", self->_transaction, v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66E68]), "initWithSource:", v4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PKReprocessMerchantActivity_performActivity__block_invoke;
  v7[3] = &unk_1E3E71E58;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "startLookupWithCompletion:", v7);

}

void __46__PKReprocessMerchantActivity_performActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];

  v3 = a2;
  if (objc_msgSend(v3, "result") == 2)
  {
    objc_msgSend(v3, "merchant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

LABEL_5:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "merchant");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "brand");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMapsBrand:", v7);

      objc_msgSend(v3, "merchant");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMapsMerchant:", v8);

      objc_msgSend(v6, "setMapsDataIsFromLocalMatch:", 0);
      v9 = objc_alloc_init(MEMORY[0x1E0D672B0]);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(v10 + 120);
      objc_msgSend(*(id *)(v10 + 128), "uniqueID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __46__PKReprocessMerchantActivity_performActivity__block_invoke_2;
      v14[3] = &unk_1E3E68110;
      v13 = *(_QWORD *)(a1 + 40);
      v14[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v9, "insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:", v11, v12, v13, v14);

      goto LABEL_6;
    }
    objc_msgSend(v3, "brand");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_5;
  }
LABEL_6:

}

void __46__PKReprocessMerchantActivity_performActivity__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PKReprocessMerchantActivity_performActivity__block_invoke_3;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __46__PKReprocessMerchantActivity_performActivity__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end

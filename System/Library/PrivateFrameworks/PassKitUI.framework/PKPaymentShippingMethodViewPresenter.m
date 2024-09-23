@implementation PKPaymentShippingMethodViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v7 = a5;
  v16 = a3;
  v10 = a4;
  objc_msgSend(v10, "shippingMethod");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v16, "setShowsSeparator:", v7);
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_METHOD"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pk_uppercaseAttributedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLabel:", v13);

    objc_msgSend(a1, "_valueForItem:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v16, "addValue:", v14);

  }
}

+ (id)_valueForItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "shippingMethod");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dateComponentsRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D66CA0]);
    objc_msgSend(v3, "dateComponentsRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDateComponentsRange:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("\n%@"), v10);

LABEL_5:
    goto LABEL_6;
  }
  objc_msgSend(v3, "detail");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "detail");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("\n%@"), v8);
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v6, "pk_uppercaseAttributedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end

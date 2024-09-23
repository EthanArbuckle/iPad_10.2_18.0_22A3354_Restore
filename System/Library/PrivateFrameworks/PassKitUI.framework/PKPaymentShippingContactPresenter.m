@implementation PKPaymentShippingContactPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "setShowsSeparator:", v7);
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_CONTACT"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pk_uppercaseAttributedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLabel:", v13);

  v20 = 0;
  LODWORD(v13) = objc_msgSend(v11, "isValidWithError:", &v20);
  v14 = v20;
  v15 = v14;
  if ((_DWORD)v13)
  {
    objc_msgSend(a1, "_valueForItem:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v10, "addValue:", v16);
  }
  else
  {
    objc_msgSend(v14, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pk_uppercaseAttributedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v10, "addValue:type:", v18, 1);

  }
}

+ (id)_valueForItem:(id)a3
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
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v6);

    objc_msgSend(v3, "phone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

LABEL_5:
      objc_msgSend(v4, "appendString:", CFSTR("\n"));
      goto LABEL_6;
    }
    objc_msgSend(v3, "email");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v3, "email");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "email");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v10);

    objc_msgSend(v3, "phone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v4, "appendString:", CFSTR("\n"));
  }
  objc_msgSend(v3, "phone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v3, "phone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v13);

  }
  objc_msgSend(v4, "pk_uppercaseAttributedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end

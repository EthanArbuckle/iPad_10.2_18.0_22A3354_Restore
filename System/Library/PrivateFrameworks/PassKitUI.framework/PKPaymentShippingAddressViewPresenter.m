@implementation PKPaymentShippingAddressViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = v9;
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "shippingType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("IN_APP_PAYMENT_%@"), v13);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "pk_uppercaseAttributedString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLabel:", v16);

  objc_msgSend(v11, "setShowsSeparator:", v7);
  objc_msgSend(v10, "formattedAddressString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  LODWORD(v14) = objc_msgSend(v10, "isValidWithError:", &v29);
  v18 = v29;
  if ((_DWORD)v14)
  {
    v19 = (id)objc_msgSend(v11, "addValue:", v17);
  }
  else
  {
    objc_msgSend(v10, "errors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      objc_msgSend(v11, "addValue:type:", v17, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setNumberOfLines:", 1);
      objc_msgSend(v22, "setLineBreakMode:", 4);
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTextColor:", v23);

      objc_msgSend(v18, "localizedDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "pk_uppercaseAttributedString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addValue:type:", v25, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "setNumberOfLines:", 1);
      objc_msgSend(v26, "setLineBreakMode:", 4);

    }
    else
    {
      objc_msgSend(v18, "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pk_uppercaseAttributedString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (id)objc_msgSend(v11, "addValue:type:", v27, 1);

    }
  }

}

@end

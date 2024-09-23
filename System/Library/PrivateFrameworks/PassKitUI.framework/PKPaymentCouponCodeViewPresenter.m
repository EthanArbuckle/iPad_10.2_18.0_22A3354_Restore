@implementation PKPaymentCouponCodeViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v22 = v8;
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_COUPON_CODE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pk_uppercaseAttributedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLabel:", v11);

  objc_msgSend(v22, "setShowsDisclosure:", 1);
  objc_msgSend(v22, "setShowsSeparator:", 1);
  v12 = v9;
  objc_msgSend(v12, "couponCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(v13, "pk_uppercaseAttributedString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_COUPON_CODE_PLACEHOLDER"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pk_uppercaseAttributedString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v22, "addValue:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLineBreakMode:", 4);
  objc_msgSend(v16, "setNumberOfLines:", 1);
  objc_msgSend(v12, "errors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "localizedDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pk_uppercaseAttributedString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addValue:type:", v20, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setLineBreakMode:", 4);
    objc_msgSend(v21, "setNumberOfLines:", 1);

  }
}

@end

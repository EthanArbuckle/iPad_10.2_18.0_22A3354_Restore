@implementation PKBankAccountViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  _BOOL8 v8;
  id v10;
  id v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  char v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  double v41;
  CGFloat v42;
  double v43;
  void *v44;
  void *v45;
  id v46;
  id v47;

  v8 = a5;
  v10 = a3;
  v11 = a4;
  v46 = a6;
  v12 = 1;
  objc_msgSend(v10, "setShowsDisclosure:", 1);
  objc_msgSend(v10, "setShowsSeparator:", v8);
  objc_msgSend(v10, "setLabelImage:", 0);
  v13 = v11;
  objc_msgSend(v13, "bankAccountInformation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bankName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "maskedAccountNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pk_uppercaseAttributedString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addValue:type:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setNumberOfLines:", 1);
  objc_msgSend(v18, "setLineBreakMode:", 4);
  v45 = v16;
  objc_msgSend(v16, "pk_uppercaseAttributedString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addValue:type:", v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setNumberOfLines:", 1);
  objc_msgSend(v20, "setLineBreakMode:", 4);
  objc_msgSend(v13, "peerPaymentBalance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "amount");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v22, "compare:", v23) != -1;

  }
  if (objc_msgSend(v46, "deviceSupportsPeerPaymentAccountPayment")
    && ((objc_msgSend(v46, "accountPaymentUsePeerPaymentBalance") | v12) & 1) == 0)
  {
    objc_msgSend(CFSTR(" "), "pk_uppercaseAttributedString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v10, "addValue:type:", v24, 0);

    objc_msgSend(v21, "amount");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "currency");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PKFormattedCurrencyStringFromNumber();
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_IN_APP_PROMOTION_BALANCE_FORMAT"), CFSTR("%@"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "pk_uppercaseAttributedString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addValue:type:", v30, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v32) = 1036831949;
    objc_msgSend(v31, "_setHyphenationFactor:", v32);
    objc_msgSend(v31, "setLineBreakMode:", 0);
    objc_msgSend(v31, "setNumberOfLines:", 0);

  }
  v47 = 0;
  v33 = objc_msgSend(v13, "isValidWithError:", &v47);
  v34 = v47;
  v35 = v34;
  if ((v33 & 1) == 0)
  {
    objc_msgSend(v34, "localizedDescription");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "pk_uppercaseAttributedString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (id)objc_msgSend(v10, "addValue:type:", v37, 1);

  }
  objc_msgSend(v10, "setAccessibilityLabel:", v15);
  PKPassKitUIBundle();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "URLForResource:withExtension:", CFSTR("Bank"), CFSTR("pdf"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  PKPassFrontFaceContentSize();
  PKFloatRoundToPixel();
  v42 = v41;
  v43 = PKUIScreenScale();
  PKUIImageFromPDF(v40, 41.0, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLabelImage:", v44);

}

@end

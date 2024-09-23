@implementation PKPaymentCardViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  int v19;
  __CFString *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  id v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __CFString *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  __CFString *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  _QWORD v79[4];
  id v80;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = v12;
  v16 = a6;
  objc_msgSend(v15, "setShowsSeparator:", v9);
  v17 = objc_msgSend(v16, "requestType");

  objc_msgSend(v15, "setShowsDisclosure:", v17 != 3);
  objc_msgSend(v13, "pass");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v13, "requiresBillingAddress");
  if (v19)
    v20 = CFSTR("IN_APP_PAYMENT_PAYMENT_CARD_AND_BILLING");
  else
    v20 = CFSTR("IN_APP_PAYMENT_PAYMENT_CARD");
  PKLocalizedPaymentString(&v20->isa);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityLabel:", v21);

  PKSanitizedPrimaryAccountRepresentationForPass();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v22;
  if (objc_msgSend(v22, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v22);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = CFSTR(" ");
  }
  objc_msgSend(v18, "localizedDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "peerPaymentBalance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v19 ^ 1;
  if (!v25)
    v26 = 1;
  v72 = a1;
  if ((v26 & 1) == 0)
  {
    objc_msgSend(v18, "localizedDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "peerPaymentBalance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "minimalFormattedStringValue");
    v29 = v23;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_CARD_NAME_WITH_BALANCE"), CFSTR("%@%@"), v27, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v24;
    v24 = (void *)v31;

    v23 = v29;
  }
  if (objc_msgSend(v13, "shouldShowCardArt"))
  {
    PKPassFrontFaceContentSize();
    PKFloatRoundToPixel();
    v34 = v33;
    +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __106__PKPaymentCardViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke;
    v79[3] = &unk_1E3E74140;
    v80 = v14;
    objc_msgSend(v35, "snapshotWithPass:size:completion:", v18, v79, 41.0, v34);

    if (!v19)
    {
LABEL_13:
      objc_msgSend(v24, "pk_uppercaseAttributedString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addValue:type:", v36, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "setNumberOfLines:", 1);
      v75 = v37;
      objc_msgSend(v37, "setLineBreakMode:", 4);
      goto LABEL_19;
    }
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_TO"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "pk_uppercaseAttributedString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLabel:", v39);

    if (!v19)
      goto LABEL_13;
  }
  if (-[__CFString length](v23, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v24, v23);
    v40 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = v24;
  }
  v41 = v40;
  objc_msgSend(v40, "pk_uppercaseAttributedString");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addValue:type:", v42, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "setNumberOfLines:", 1);
  v75 = v43;
  objc_msgSend(v43, "setLineBreakMode:", 5);

LABEL_19:
  v78 = 0;
  v44 = objc_msgSend(v13, "isValidWithError:", &v78);
  v45 = v78;
  v76 = v45;
  if (v44)
  {
    if (objc_msgSend(v13, "status") == 2 || objc_msgSend(v13, "status") == 3)
    {
      v46 = CFSTR("IN_APP_PAYMENT_ERROR_PIN_INCORRECT");
    }
    else
    {
      if (objc_msgSend(v13, "status") != 5)
      {
LABEL_26:
        if (v19)
        {
          objc_msgSend(v72, "_billingValueInCell:forItem:type:", v15, v13, 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v18, "peerPaymentBalance");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v51)
          {
            objc_msgSend(v18, "peerPaymentBalance");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "minimalFormattedStringValue");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_IN_APP_BALANCE_FORMAT"), CFSTR("%@"), v73);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "pk_uppercaseAttributedString");
            v54 = v18;
            v55 = v24;
            v56 = v23;
            v57 = v14;
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addValue:type:", v58, 0);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = v57;
            v23 = v56;
            v24 = v55;
            v18 = v54;

          }
          else
          {
            -[__CFString pk_uppercaseAttributedString](v23, "pk_uppercaseAttributedString");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addValue:type:", v52, 0);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend(v50, "setNumberOfLines:", 1);
          objc_msgSend(v50, "setLineBreakMode:", 4);
        }
        goto LABEL_34;
      }
      v46 = CFSTR("IN_APP_PAYMENT_ERROR_INSUFFICIENT_BALANCE");
    }
    PKLocalizedPaymentString(&v46->isa);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v45, "localizedDescription");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v48 = v47;
  objc_msgSend(v47, "pk_uppercaseAttributedString");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addValue:type:", v49, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v50)
    goto LABEL_26;
LABEL_34:
  objc_msgSend(v50, "setLineBreakMode:", 4);
  objc_msgSend(v50, "setNumberOfLines:", 1);
  objc_msgSend(v13, "peerPaymentBalance");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "showPeerPaymentBalance") && v59)
  {
    objc_msgSend(CFSTR(" "), "pk_uppercaseAttributedString");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (id)objc_msgSend(v15, "addValue:type:", v60, 0);

    objc_msgSend(v59, "amount");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "currency");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    PKFormattedCurrencyStringFromNumber();
    v74 = v18;
    v64 = v24;
    v65 = v23;
    v66 = v14;
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_IN_APP_PROMOTION_BALANCE_FORMAT"), CFSTR("%@"), v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v68, "pk_uppercaseAttributedString");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addValue:type:", v69, 2);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v71) = 1036831949;
    objc_msgSend(v70, "_setHyphenationFactor:", v71);
    objc_msgSend(v70, "setLineBreakMode:", 0);
    objc_msgSend(v70, "setNumberOfLines:", 0);

    v14 = v66;
    v23 = v65;
    v24 = v64;
    v18 = v74;

  }
}

void __106__PKPaymentCardViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __106__PKPaymentCardViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke_2;
  v6[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __106__PKPaymentCardViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke_2(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLabelImage:", *(_QWORD *)(a1 + 32));

}

+ (id)_billingValueInCell:(id)a3 forItem:(id)a4 type:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a3;
  objc_msgSend(a4, "billingAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pkSingleLineFormattedContactAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "pk_uppercaseAttributedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addValue:type:", v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end

@implementation PKPeerPaymentCardViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;

  v9 = a5;
  v11 = a3;
  v12 = a4;
  v35 = a7;
  v13 = a6;
  objc_msgSend(v11, "setShowsDisclosure:", objc_msgSend(v12, "shouldShowDisclosure"));
  objc_msgSend(v11, "setShowsSeparator:", v9);
  objc_msgSend(v11, "setSelectionStyle:", 0);
  objc_msgSend(v12, "pass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "quote");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentBalanceCurrency");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v15;
  objc_msgSend(v15, "currentBalance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v13, "requestType");

  if (((v18 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    objc_msgSend(v14, "peerPaymentBalance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currency");
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "amount");
    v21 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v21;
    v16 = (void *)v20;
  }
  v34 = v17;
  objc_msgSend(v14, "localizedDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  PKFormattedCurrencyStringFromNumber();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_IN_APP_BALANCE_FORMAT"), CFSTR("%@"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "pk_uppercaseAttributedString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addValue:type:", v25, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setNumberOfLines:", 1);
  objc_msgSend(v26, "setLineBreakMode:", 4);
  objc_msgSend(v24, "pk_uppercaseAttributedString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addValue:type:", v27, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "setNumberOfLines:", 1);
  objc_msgSend(v28, "setLineBreakMode:", 4);
  PKLocalizedPaymentString((NSString *)v22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityLabel:", v29);

  PKPassFrontFaceContentSize();
  PKFloatRoundToPixel();
  v31 = v30;
  +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __110__PKPeerPaymentCardViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke;
  v37[3] = &unk_1E3E74140;
  v38 = v35;
  v33 = v35;
  objc_msgSend(v32, "snapshotWithPass:size:completion:", v14, v37, 41.0, v31);

}

void __110__PKPeerPaymentCardViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __110__PKPeerPaymentCardViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke_2;
  v6[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __110__PKPeerPaymentCardViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke_2(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLabelImage:", *(_QWORD *)(a1 + 32));

}

@end

@implementation PKPaymentTransactionCellController

- (PKPaymentTransactionCellController)initWithContactResolver:(id)a3
{
  return -[PKPaymentTransactionCellController initWithContactResolver:context:](self, "initWithContactResolver:context:", a3, 0);
}

- (PKPaymentTransactionCellController)initWithContactResolver:(id)a3 context:(unint64_t)a4
{
  id v7;
  PKPaymentTransactionCellController *v8;
  PKPaymentTransactionCellController *v9;
  PKPaymentTransactionIconGenerator *v10;
  PKPaymentTransactionIconGenerator *iconGenerator;
  UIImage *v12;
  UIImage *emptyImage;
  PKPeerPaymentCounterpartImageResolver *v14;
  PKPeerPaymentCounterpartImageResolver *counterpartImageResolver;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentTransactionCellController;
  v8 = -[PKPaymentTransactionCellController init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contactResolver, a3);
    v10 = -[PKPaymentTransactionIconGenerator initWithCache:scale:]([PKPaymentTransactionIconGenerator alloc], "initWithCache:scale:", 1, PKUIScreenScale());
    iconGenerator = v9->_iconGenerator;
    v9->_iconGenerator = v10;

    v9->_context = a4;
    v12 = (UIImage *)objc_alloc_init(MEMORY[0x1E0DC3870]);
    emptyImage = v9->_emptyImage;
    v9->_emptyImage = v12;

    v14 = objc_alloc_init(PKPeerPaymentCounterpartImageResolver);
    counterpartImageResolver = v9->_counterpartImageResolver;
    v9->_counterpartImageResolver = v14;

  }
  return v9;
}

- (void)configureCell:(id)a3 forTransaction:(id)a4 transactionSource:(id)a5 familyMember:(id)a6 account:(id)a7 detailStyle:(int64_t)a8 deviceName:(id)a9 avatarViewDelegate:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  uint64_t v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void (**v60)(void *, void *);
  _BOOL4 v61;
  PKPeerPaymentCounterpartImageResolver *counterpartImageResolver;
  void *v63;
  int v64;
  PKContactResolver *contactResolver;
  void *v66;
  id *v67;
  char v68;
  char v69;
  PKPaymentTransactionIconGenerator *iconGenerator;
  id v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  _QWORD v87[4];
  id v88;
  id v89;
  id v90;
  id v91;
  _QWORD v92[4];
  id v93;
  id v94;
  PKPaymentTransactionCellController *v95;
  id v96;
  id v97;
  _QWORD v98[4];
  id v99;
  id v100;
  void (**v101)(void *, void *);
  _QWORD aBlock[4];
  id v103;
  id v104;
  id v105;
  id v106;
  id location[2];

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = v18;
  v22 = a9;
  v82 = a10;
  objc_msgSend(v17, "identifier");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setIdentifier:");
  v23 = objc_msgSend(v17, "transactionType");
  objc_msgSend(v17, "peerPaymentCounterpartHandle");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v21;
  v80 = v20;
  v81 = v19;
  v79 = v22;
  objc_msgSend(MEMORY[0x1E0D67390], "presentationInformationForTransaction:transactionSource:secondaryTransactionSource:familyMember:account:deviceName:context:", v17, v21, 0, v19, v20, v22, self->_context);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (a8 == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "shouldGrayValue"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
  objc_msgSend(v24, "valueString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28 = v27;
  v78 = (void *)v25;
  if (v25)
    v29 = (void *)v25;
  else
    v29 = v86;
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0DC1140]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0DC1100]);

  if (objc_msgSend(v24, "shouldStrikeValue"))
    objc_msgSend(v28, "setObject:forKeyedSubscript:", &unk_1E3FAD090, *MEMORY[0x1E0DC11A8]);
  v77 = v26;
  if (objc_msgSend(v26, "length"))
  {
    v31 = objc_alloc(MEMORY[0x1E0CB3498]);
    v32 = (void *)objc_msgSend(v28, "copy");
    v33 = objc_msgSend(v31, "initWithString:attributes:", v26, v32);

    v34 = (void *)v33;
  }
  else
  {
    v34 = 0;
  }
  objc_msgSend(v16, "transactionView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "primaryString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setPrimaryString:", v36);

  objc_msgSend(v24, "secondaryString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setSecondaryString:", v37);

  objc_msgSend(v24, "tertiaryString");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTertiaryString:", v38);

  objc_msgSend(v35, "setTransactionValueAttributedText:", v34);
  objc_msgSend(v24, "badgeString");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBadgeString:", v39);

  objc_msgSend(v35, "setShowsDisclosureView:", 0);
  objc_msgSend(v24, "secondaryBadgeSymbol");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setSecondaryBadgeSymbol:", v40);

  objc_msgSend(v35, "setPrimaryColor:", v86);
  if ((objc_msgSend(v24, "destructiveSecondaryString") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setSecondaryColor:", v41);

  if (self->_context)
    v42 = objc_msgSend(v17, "isBankConnectTransaction");
  else
    v42 = 1;
  if (v23 != 3 || !v42 || objc_msgSend(v17, "peerPaymentType") == 6)
  {
    if (!v42)
      goto LABEL_60;
    objc_msgSend(v35, "setShowsAvatarView:", 0);
    v43 = objc_msgSend(v84, "type");
    if ((unint64_t)(v43 - 1) < 3)
      goto LABEL_54;
    if (v43)
      goto LABEL_52;
    objc_msgSend(v84, "paymentPass");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "context");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "configuration");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v75, "issuerCountryCode");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v46, "paymentTransactionIconsEnabledForRegion:", v47);

    v48 = objc_msgSend(v75, "cardType");
    objc_msgSend(v75, "associatedAccountServiceAccountIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49
      || (v48 == 1 ? (v68 = v74) : (v68 = 0),
          (objc_msgSend(v75, "hasAssociatedPeerPaymentAccount") & 1) != 0
       || (v68 & 1) != 0
       || (objc_msgSend(v75, "isStoredValuePass") & 1) != 0))
    {

    }
    else
    {
      v69 = objc_msgSend(v75, "isIdentityPass");

      if ((v69 & 1) == 0)
      {
LABEL_52:
        if ((objc_msgSend(v17, "isBankConnectTransaction") & 1) == 0 && objc_msgSend(v17, "peerPaymentType") != 6)
          goto LABEL_60;
      }
    }
LABEL_54:
    objc_initWeak(location, self);
    iconGenerator = self->_iconGenerator;
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_6;
    v87[3] = &unk_1E3E6A798;
    objc_copyWeak(&v91, location);
    v88 = v16;
    v89 = v85;
    v71 = v35;
    v90 = v71;
    -[PKPaymentTransactionIconGenerator iconForTransaction:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForTransaction:size:ignoreLogoURL:requestType:iconHandler:", v17, 0, 0, v87, 45.0, 45.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
      objc_msgSend(v71, "setPrimaryImage:animated:", v53, 0);
    else
      objc_msgSend(v71, "setPrimaryImage:animated:", self->_emptyImage, 0);

    v67 = &v91;
    goto LABEL_58;
  }
  v76 = v34;
  objc_msgSend(v35, "setShowsAvatarView:", 1);
  objc_msgSend(v35, "setPrimaryImage:", 0);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "_supportsForceTouch");

  if (v51)
  {
    objc_msgSend(v35, "avatarView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setUserInteractionEnabled:", 1);
    objc_msgSend(v52, "setDelegate:", v82);
    objc_msgSend(v52, "setForcePressView:", v52);

  }
  objc_msgSend(v17, "peerPaymentCounterpartImageRecordIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v17, "peerPaymentPaymentMode");
  if (v53)
    v55 = v54 == 2;
  else
    v55 = 0;
  if (v54 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(v56, "scaledValueForValue:", 9.0);
    objc_msgSend(v57, "configurationWithPointSize:weight:", 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setSecondaryBadgeSymbolConfiguration:", v58);

  }
  if (!v55)
  {
    v64 = -[PKContactResolver hasCachedResultForHandle:](self->_contactResolver, "hasCachedResultForHandle:", v83);
    contactResolver = self->_contactResolver;
    if (v64)
    {
      -[PKContactResolver contactForHandle:](self->_contactResolver, "contactForHandle:", v83);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransactionCellController _updateAvatarOnTransactionCell:withTransaction:contact:](self, "_updateAvatarOnTransactionCell:withTransaction:contact:", v16, v17, v66);
      -[PKPaymentTransactionCellController _updatePrimaryLabelOnTransactionCell:withPeerPaymentCounterpartHandle:contact:transaction:](self, "_updatePrimaryLabelOnTransactionCell:withPeerPaymentCounterpartHandle:contact:transaction:", v16, v83, v66, v17);

    }
    else
    {
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_4;
      v92[3] = &unk_1E3E6A770;
      v93 = v16;
      v94 = v85;
      v95 = self;
      v96 = v17;
      v97 = v83;
      -[PKContactResolver contactForHandle:withCompletion:](contactResolver, "contactForHandle:withCompletion:", v97, v92);

    }
    v34 = v76;
    goto LABEL_59;
  }
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke;
  aBlock[3] = &unk_1E3E6A720;
  objc_copyWeak(&v106, location);
  v59 = v16;
  v103 = v59;
  v104 = v17;
  v105 = v83;
  v60 = (void (**)(void *, void *))_Block_copy(aBlock);
  v61 = -[PKPeerPaymentCounterpartImageResolver hasCachedImageDataForIdentifier:](self->_counterpartImageResolver, "hasCachedImageDataForIdentifier:", v53);
  v34 = v76;
  counterpartImageResolver = self->_counterpartImageResolver;
  if (v61)
  {
    -[PKPeerPaymentCounterpartImageResolver counterpartImageDataForIdentifier:](counterpartImageResolver, "counterpartImageDataForIdentifier:", v53);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v60[2](v60, v63);
  }
  else
  {
    v98[0] = MEMORY[0x1E0C809B0];
    v98[1] = 3221225472;
    v98[2] = __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_2;
    v98[3] = &unk_1E3E6A748;
    v99 = v59;
    v100 = v85;
    v101 = v60;
    -[PKPeerPaymentCounterpartImageResolver counterpartImageDataForIdentifier:completion:](counterpartImageResolver, "counterpartImageDataForIdentifier:completion:", v53, v98);

    v63 = v99;
  }

  v67 = &v106;
LABEL_58:
  objc_destroyWeak(v67);
  objc_destroyWeak(location);
LABEL_59:

LABEL_60:
  v72 = objc_msgSend(v24, "shouldShowDisclosure");
  if ((_DWORD)v72)
    v73 = 3;
  else
    v73 = 0;
  objc_msgSend(v35, "setShowsDisclosureView:", v72);
  objc_msgSend(v16, "setSelectionStyle:", v73);

}

void __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 7);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(v5, "setImageData:", v4);

  objc_msgSend(WeakRetained, "_updateAvatarOnTransactionCell:withTransaction:contact:", a1[4], a1[5], v5);
  objc_msgSend(WeakRetained, "_updatePrimaryLabelOnTransactionCell:withPeerPaymentCounterpartHandle:contact:transaction:", a1[4], a1[6], v5, a1[5]);

}

void __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_3;
  v5[3] = &unk_1E3E622D8;
  v6 = a1[4];
  v7 = a1[5];
  v8 = v3;
  v9 = a1[6];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  int v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v8 = v2;
  v4 = v3;
  if (v8 != v4)
  {
    if (v8)
      v5 = v4 == 0;
    else
      v5 = 1;
    if (v5)
    {

    }
    else
    {
      v6 = objc_msgSend(v8, "isEqualToString:", v4);

      if (v6)
        goto LABEL_10;
    }

    return;
  }

LABEL_10:
  v7 = *(_QWORD *)(a1 + 48);

  if (v7)
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_5;
  v8[3] = &unk_1E3E66A80;
  v9 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v13 = v3;
  v14 = *(id *)(a1 + 64);
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  int v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v7 = v2;
  v4 = v3;
  if (v7 == v4)
  {

LABEL_10:
    objc_msgSend(*(id *)(a1 + 48), "_updateAvatarOnTransactionCell:withTransaction:contact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 48), "_updatePrimaryLabelOnTransactionCell:withPeerPaymentCounterpartHandle:contact:transaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
    return;
  }
  if (v7)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
  {

    return;
  }
  v6 = objc_msgSend(v7, "isEqualToString:", v4);

  if (v6)
    goto LABEL_10;
}

void __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_6(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_7;
  block[3] = &unk_1E3E623E8;
  objc_copyWeak(&v10, a1 + 7);
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
}

void __148__PKPaymentTransactionCellController_configureCell_forTransaction_transactionSource_familyMember_account_detailStyle_deviceName_avatarViewDelegate___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  int v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    v5 = v3;
    v6 = v4;
    if (v5 == v6)
    {

      goto LABEL_11;
    }
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
    {

LABEL_12:
      WeakRetained = v10;
      goto LABEL_13;
    }
    v9 = objc_msgSend(v5, "isEqualToString:", v6);

    WeakRetained = v10;
    if (v9)
    {
LABEL_11:
      objc_msgSend(*(id *)(a1 + 48), "setPrimaryImage:animated:", *(_QWORD *)(a1 + 56), 1);
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (void)_updateAvatarOnTransactionCell:(id)a3 withTransaction:(id)a4 contact:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a3;
  objc_msgSend(a4, "peerPaymentCounterpartHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transactionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "avatarView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (v9)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v13, "setContactType:", 0);
    v14 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
LABEL_6:
      objc_msgSend(v11, "setContacts:", v12);

    }
  }
LABEL_7:

}

- (void)_updatePrimaryLabelOnTransactionCell:(id)a3 withPeerPaymentCounterpartHandle:(id)a4 contact:(id)a5 transaction:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  v12 = objc_msgSend(a6, "peerPaymentPaymentMode");
  v13 = v11;
  if (v12 != 2)
  {
    objc_msgSend(MEMORY[0x1E0D67400], "displayNameForCounterpartHandle:contact:", v11, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v15, "transactionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPrimaryString:", v13);

}

- (PKContactResolver)contactResolver
{
  return self->_contactResolver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_counterpartImageResolver, 0);
  objc_storeStrong((id *)&self->_emptyImage, 0);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
}

@end

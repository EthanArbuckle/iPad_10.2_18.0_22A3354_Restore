@implementation PKPassDetailsCardInfoSectionController

+ (BOOL)validForPaymentPass:(id)a3
{
  return 1;
}

+ (BOOL)canShowSectionForPaymentPass:(id)a3 expressPassController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isExpressModeSupportedForPass:", v6) & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v7, "hasEligibleExpressUpgradeRequestForPass:", v6);
  v9 = objc_msgSend(a1, "_countOfRowsForPass:detailViewStyle:sectionMode:expressMode:", v6, 0, 1, v8) != 0;

  return v9;
}

- (PKPassDetailsCardInfoSectionController)init
{

  return 0;
}

- (PKPassDetailsCardInfoSectionController)initWithPass:(id)a3 peerPaymentAccount:(id)a4 mode:(unint64_t)a5 detailViewStyle:(int64_t)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  PKPassDetailsCardInfoSectionController *v16;
  PKPassDetailsCardInfoSectionController *v17;
  uint64_t v18;
  PKPaymentApplication *paymentApplication;
  PKPassLibraryDefaultDataProvider *v20;
  PKPassLibraryDefaultDataProvider *passLibraryDataProvider;
  PKPaymentDefaultDataProvider *v22;
  PKPaymentDefaultDataProvider *paymentServiceDataProvider;
  uint64_t v24;
  PKExpressPassController *expressPassController;
  void *v26;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PKPassDetailsCardInfoSectionController;
  v16 = -[PKPaymentPassDetailSectionController init](&v28, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_sectionMode = a5;
    objc_storeStrong((id *)&v16->_pass, a3);
    -[PKPaymentPass devicePrimaryPaymentApplication](v17->_pass, "devicePrimaryPaymentApplication");
    v18 = objc_claimAutoreleasedReturnValue();
    paymentApplication = v17->_paymentApplication;
    v17->_paymentApplication = (PKPaymentApplication *)v18;

    objc_storeStrong((id *)&v17->_peerPaymentAccount, a4);
    v17->_detailViewStyle = a6;
    objc_storeWeak((id *)&v17->_delegate, v15);
    v20 = (PKPassLibraryDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E0D66F18]);
    passLibraryDataProvider = v17->_passLibraryDataProvider;
    v17->_passLibraryDataProvider = v20;

    v22 = (PKPaymentDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E0D67100]);
    paymentServiceDataProvider = v17->_paymentServiceDataProvider;
    v17->_paymentServiceDataProvider = v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66D50]), "initWithPaymentDataProvider:passLibraryDataProvider:isForWatch:", v17->_paymentServiceDataProvider, v17->_passLibraryDataProvider, v17->_detailViewStyle == 2);
    expressPassController = v17->_expressPassController;
    v17->_expressPassController = (PKExpressPassController *)v24;

    -[PKPassDetailsCardInfoSectionController _updateExpressPassInformation](v17, "_updateExpressPassInformation");
    if (-[PKPassDetailsCardInfoSectionController _showExpressDetails](v17, "_showExpressDetails"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObserver:selector:name:object:", v17, sel__expressPassDidChange, CFSTR("PKExpressPassesViewControllerExpressPassChangedNotification"), 0);

    }
  }

  return v17;
}

- (id)allSectionIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("CardInfoSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sectionIdentifiers
{
  void *v3;

  if (-[PKPaymentPassDetailSectionController currentSegment](self, "currentSegment"))
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PKPassDetailsCardInfoSectionController allSectionIdentifiers](self, "allSectionIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7;
  id v8;
  int v9;
  void *v10;
  id v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  v13 = 0;
  v9 = PKEqualObjects();
  v10 = 0;
  if (v9)
  {
    -[PKPassDetailsCardInfoSectionController _cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:](self, "_cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:", &v13, objc_msgSend(v8, "row"), v7);
    v10 = v13;
  }
  v11 = v10;

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  uint64_t v6;
  unint64_t v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  if (PKEqualObjects())
  {
    v6 = objc_msgSend(v9, "row");
    v7 = -[PKPassDetailsCardInfoSectionController _countOfRows](self, "_countOfRows");
    if (-[PKPassDetailsCardInfoSectionController _showExpressDetails](self, "_showExpressDetails"))
    {
      if (v6 >= 1 && v7 - 1 == v6)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "cardInfoSectionControllerDidSelectExpressPassSettings:", self);

      }
    }
  }

}

- (BOOL)shouldHighlightRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  BOOL v10;
  BOOL v11;

  v5 = a3;
  if (PKEqualObjects())
  {
    v6 = objc_msgSend(v5, "row");
    v7 = -[PKPassDetailsCardInfoSectionController _countOfRows](self, "_countOfRows");
    v8 = -[PKPassDetailsCardInfoSectionController _showExpressDetails](self, "_showExpressDetails");
    v10 = v6 > 0 && v7 - 1 == v6;
    v11 = v8 && v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)titleForHeaderInSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;

  v4 = a3;
  if (self->_hideSectionTitles
    || self->_peerPaymentAccount
    || (-[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_pass, "associatedAccountServiceAccountIdentifier"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "length"), v5, v6))
  {
    v7 = 0;
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("CARD_INFO_HEADER"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKPaymentPass supportsBarcodePayment](self->_pass, "supportsBarcodePayment"))
    {
      PKLocalizedAquamanString(CFSTR("PASS_INFO_HEADER"));
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
  }

  return v7;
}

- (int64_t)editingStyleForRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3D08], "configurationWithActions:", 0, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPerformsFirstActionWithFullSwipe:", 0);
  return v5;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5 sectionIdentifier:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  if (PKEqualObjects())
  {
    objc_msgSend(v8, "cellForRowAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reuseIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("PKTableViewCellReuseIdentifierCustomerServiceIdentifier"));

    if (v12)
    {
      -[PKPaymentPass customerServiceIdentifier](self->_pass, "customerServiceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length"))
      {
        -[PKPassDetailsCardInfoSectionController _contextMenuConfigurationForCopyingText:](self, "_contextMenuConfigurationForCopyingText:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(v10, "reuseIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("cardNumberCell"));

      if (!v16)
      {
        v14 = 0;
        goto LABEL_13;
      }
      -[PKPaymentApplication sanitizedDPAN](self->_paymentApplication, "sanitizedDPAN");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13
        && -[PKPassDetailsCardInfoSectionController _paymentApplicationShouldShowFullDPAN](self, "_paymentApplicationShouldShowFullDPAN"))
      {
        PKFormattedSanitizedPAN();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPassDetailsCardInfoSectionController _contextMenuConfigurationForCopyingText:](self, "_contextMenuConfigurationForCopyingText:", v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
    }
    v14 = 0;
    goto LABEL_11;
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (BOOL)shouldDrawTopSeparatorForSectionIdentifier:(id)a3
{
  return 1;
}

- (BOOL)shouldDrawBottomSeparatorForSectionIdentifier:(id)a3
{
  return 1;
}

- (unint64_t)_countOfRows
{
  if ((-[PKPaymentPass isAccessPass](self->_pass, "isAccessPass") & 1) != 0)
    return 0;
  else
    return -[PKPassDetailsCardInfoSectionController _cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:](self, "_cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:", 0, 0, 0);
}

+ (unint64_t)_countOfRowsForPass:(id)a3 detailViewStyle:(int64_t)a4 sectionMode:(unint64_t)a5 expressMode:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  unint64_t v11;

  v6 = a6;
  v10 = a3;
  if ((objc_msgSend(v10, "isAccessPass") & 1) != 0)
    v11 = 0;
  else
    v11 = objc_msgSend(a1, "_cardInfoSectionGenerateCellWithOutputForRowIndex:pass:detailViewStyle:sectionMode:expressMode:", 0, v10, a4, a5, v6);

  return v11;
}

+ (unint64_t)_cardInfoSectionGenerateCellWithOutputForRowIndex:(int64_t)a3 pass:(id)a4 detailViewStyle:(int64_t)a5 sectionMode:(unint64_t)a6 expressMode:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  void *v22;
  int v23;
  uint64_t v24;

  v7 = a7;
  v11 = a4;
  objc_msgSend(v11, "fieldForKey:", *MEMORY[0x1E0D6ADB0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v13 != 0;
  if ((objc_msgSend(v11, "isSuicaPass") & 1) != 0 || (objc_msgSend(v11, "isOctopusPass") & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v11, "primaryAccountNumberSuffix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15
    || (objc_msgSend(v11, "sanitizedPrimaryAccountNumber"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v11, "sanitizedPrimaryAccountName"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_7:
    if (v13)
      v14 = 2;
    else
      v14 = 1;
    goto LABEL_10;
  }
  objc_msgSend(v11, "devicePrimaryPaymentApplication");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(a1, "_paymentApplicationShouldShowFullDPANForPass:paymentApplication:", v11, v22);

  v24 = 1;
  if (v13)
    v24 = 2;
  if (v23)
    v14 = v24;
LABEL_10:
  objc_msgSend(v11, "customerServiceIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = v14 + 1;
  else
    v17 = v14;
  v18 = objc_msgSend((id)objc_opt_class(), "_showExpressDetailsForPass:expressMode:sectionMode:", v11, v7, a6);
  v19 = 1;
  if (!a5)
    v19 = 2;
  if (!v18)
    v19 = 0;
  v20 = v17 + v19;

  return v20;
}

- (unint64_t)_cardInfoSectionGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  int64_t detailViewStyle;
  unint64_t v39;
  void *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  int64_t v55;

  v8 = a5;
  if (self->_peerPaymentAccount)
  {
    v9 = 0;
    goto LABEL_37;
  }
  v55 = a4;
  -[PKPaymentPass fieldForKey:](self->_pass, "fieldForKey:", *MEMORY[0x1E0D6ADB0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = 1;
    if (a3 && !v55)
    {
      if (PKHandsOnDemoModeEnabled()
        && (PKFakeCardholderName(),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "length"),
            v13,
            v14))
      {
        PKFakeCardholderName();
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = v11;
      }
      v16 = v15;
      PKLocalizedPaymentString(CFSTR("CARD_INFO_NAME"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailSectionController infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v17, v16, objc_msgSend(v10, "cellStyle"), v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *a3;
      *a3 = v18;

      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }
  PKLocalizedPaymentString(CFSTR("CARD_INFO_NUMBER"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v11;
  v54 = v10;
  if (-[PKPaymentPass supportsBarcodePayment](self->_pass, "supportsBarcodePayment"))
  {
    -[PKPaymentPass organizationName](self->_pass, "organizationName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedAquamanString(CFSTR("PASS_INFO_ACCOUNT_NAME"), CFSTR("%@"), v21, v11, v10);
    v22 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v22;
  }
  if (!-[PKPaymentPass isSuicaPass](self->_pass, "isSuicaPass"))
  {
    if (!-[PKPaymentPass isOctopusPass](self->_pass, "isOctopusPass"))
      goto LABEL_20;
LABEL_19:
    PKSanitizedDeviceAccountNumberForPaymentApplication();
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  -[PKPaymentApplication sanitizedDPAN](self->_paymentApplication, "sanitizedDPAN");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
    goto LABEL_19;
  v24 = (void *)v23;
  v25 = -[PKPaymentPass isOctopusPass](self->_pass, "isOctopusPass");

  if ((v25 & 1) != 0)
    goto LABEL_19;
LABEL_20:
  -[PKPaymentPass primaryAccountNumberSuffix](self->_pass, "primaryAccountNumberSuffix");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27
    || (-[PKPaymentPass sanitizedPrimaryAccountNumber](self->_pass, "sanitizedPrimaryAccountNumber"),
        (v27 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_23:
    PKSanitizedPrimaryAccountRepresentationForPass();
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_24:
    v28 = (void *)v26;
    if (!v26)
      goto LABEL_29;
LABEL_25:
    if (a3 && v12 == v55)
    {
      -[PKPaymentPassDetailSectionController infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:](self, "infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:", v20, v28, 1, CFSTR("cardNumberCell"), v8);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "detailTextLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setAdjustsFontSizeToFitWidth:", 1);

      v31 = *a3;
      *a3 = v29;

    }
    ++v12;
    goto LABEL_29;
  }
  -[PKPaymentPass sanitizedPrimaryAccountName](self->_pass, "sanitizedPrimaryAccountName");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
    goto LABEL_23;
  if (!-[PKPassDetailsCardInfoSectionController _paymentApplicationShouldShowFullDPAN](self, "_paymentApplicationShouldShowFullDPAN"))
  {
    v28 = 0;
    goto LABEL_29;
  }
  -[PKPaymentApplication sanitizedDPAN](self->_paymentApplication, "sanitizedDPAN");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  PKFormattedSanitizedPAN();
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedPaymentString(CFSTR("CARD_INFO_DIGITAL_NUMBER"));
  v52 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)v52;
  if (v28)
    goto LABEL_25;
LABEL_29:
  -[PKPaymentPass customerServiceIdentifier](self->_pass, "customerServiceIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v9 = v12 + 1;
    if (a3)
    {
      v33 = v12 == v55;
      a4 = v55;
      if (v33)
      {
        PKPassLocalizedStringWithFormat();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentPassDetailSectionController infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:](self, "infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:", v34, v32, 1, CFSTR("PKTableViewCellReuseIdentifierCustomerServiceIdentifier"), v8, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v35, "detailTextLabel");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setAdjustsFontSizeToFitWidth:", 1);

        v37 = *a3;
        *a3 = v35;

      }
      goto LABEL_36;
    }
  }
  else
  {
    v9 = v12;
  }
  a4 = v55;
LABEL_36:

LABEL_37:
  if (!-[PKPassDetailsCardInfoSectionController _showExpressDetails](self, "_showExpressDetails"))
  {
    v39 = v9;
    goto LABEL_53;
  }
  detailViewStyle = self->_detailViewStyle;
  if (a3)
  {
    v39 = v9 + 1;
    if (v9 == a4)
    {
      PKLocalizedPaymentString(CFSTR("EXPRESS_TRANSIT_CELL_TITLE"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_expressModeEnabled)
        v41 = CFSTR("EXPRESS_MODE_STATE_ON");
      else
        v41 = CFSTR("EXPRESS_MODE_STATE_OFF");
      PKLocalizedPaymentString(&v41->isa);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailSectionController infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:](self, "infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:", v40, v42, 1, CFSTR("expressState"), v8);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = *a3;
      *a3 = v43;

      if (detailViewStyle)
      {
        objc_msgSend(*a3, "setAccessoryType:", 1);
        goto LABEL_53;
      }
    }
    else if (detailViewStyle)
    {
      goto LABEL_53;
    }
    if (v39 == a4)
    {
      PKLocalizedPaymentString(CFSTR("EXPRESS_TRANSIT_SETTINGS_CELL_TITLE"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailSectionController linkCellWithText:forTableView:](self, "linkCellWithText:forTableView:", v46, v8);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = *a3;
      *a3 = v47;

    }
    v39 = v9 + 2;
  }
  else
  {
    v45 = 1;
    if (!detailViewStyle)
      v45 = 2;
    v39 = v45 + v9;
  }
LABEL_53:

  return v39;
}

+ (BOOL)_showExpressDetailsForPass:(id)a3 expressMode:(BOOL)a4 sectionMode:(unint64_t)a5
{
  char v7;
  BOOL v8;

  v7 = objc_msgSend(a3, "isAccessPass");
  if (a5)
    v8 = 0;
  else
    v8 = a4;
  return (v7 & 1) == 0 && v8;
}

- (BOOL)_showExpressDetails
{
  return objc_msgSend((id)objc_opt_class(), "_showExpressDetailsForPass:expressMode:sectionMode:", self->_pass, self->_expressModeSupported, self->_sectionMode);
}

+ (BOOL)_paymentApplicationShouldShowFullDPANForPass:(id)a3 paymentApplication:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "sanitizedDPAN");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "appletDataFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((PKEqualObjects() & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v6, "appletDataFormat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((PKEqualObjects() & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        objc_msgSend(v6, "appletDataFormat");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((PKEqualObjects() & 1) != 0 || (objc_msgSend(v5, "isEMoneyPass") & 1) != 0)
          v9 = 1;
        else
          v9 = objc_msgSend(v5, "isSuicaPass");

      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_paymentApplicationShouldShowFullDPAN
{
  return objc_msgSend((id)objc_opt_class(), "_paymentApplicationShouldShowFullDPANForPass:paymentApplication:", self->_pass, self->_paymentApplication);
}

- (void)_expressPassDidChange
{
  void *v3;
  _BOOL4 v4;

  -[PKExpressPassController existingExpressPassConfigurationForPass:](self->_expressPassController, "existingExpressPassConfigurationForPass:", self->_pass);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  if (self->_expressModeEnabled != v4)
    self->_expressModeEnabled = v4;
}

- (void)_updateExpressPassInformation
{
  char v3;
  void *v4;

  if ((PKIsPad() & 1) == 0)
  {
    if ((-[PKExpressPassController isExpressModeSupportedForPass:](self->_expressPassController, "isExpressModeSupportedForPass:", self->_pass) & 1) != 0)v3 = 1;
    else
      v3 = -[PKExpressPassController hasEligibleExpressUpgradeRequestForPass:](self->_expressPassController, "hasEligibleExpressUpgradeRequestForPass:", self->_pass);
    self->_expressModeSupported = v3;
    -[PKExpressPassController existingExpressPassConfigurationForPass:](self->_expressPassController, "existingExpressPassConfigurationForPass:", self->_pass);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_expressModeEnabled = v4 != 0;

  }
}

- (id)_contextMenuConfigurationForCopyingText:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKPassDetailsCardInfoSectionController__contextMenuConfigurationForCopyingText___block_invoke;
  aBlock[3] = &unk_1E3E6D5A8;
  v9 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __82__PKPassDetailsCardInfoSectionController__contextMenuConfigurationForCopyingText___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
    return 0;
  v2 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedString(CFSTR("MENU_ACTION_COPY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__PKPassDetailsCardInfoSectionController__contextMenuConfigurationForCopyingText___block_invoke_2;
  v9[3] = &unk_1E3E6D580;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, 0, 0, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DC39D0];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuWithTitle:children:", &stru_1E3E7D690, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __82__PKPassDetailsCardInfoSectionController__contextMenuConfigurationForCopyingText___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setString:", *(_QWORD *)(a1 + 32));

}

- (PKPassDetailsCardInfoSectionControllerDelegate)delegate
{
  return (PKPassDetailsCardInfoSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)hideSectionTitles
{
  return self->_hideSectionTitles;
}

- (void)setHideSectionTitles:(BOOL)a3
{
  self->_hideSectionTitles = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_expressPassController, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end

@implementation PKTransactionDebugDetailsViewController

- (PKTransactionDebugDetailsViewController)initWithTransaction:(id)a3
{
  id v5;
  PKTransactionDebugDetailsViewController *v6;
  PKTransactionDebugDetailsViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionDebugDetailsViewController;
  v6 = -[PKTransactionDebugDetailsViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transaction, a3);
    v7->_inBridge = PKBridgeUsesDarkAppearance();
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKTransactionDebugDetailsViewController;
  -[PKTransactionDebugDetailsViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PKTransactionDebugDetailsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionTitleValueLabelCellReuseIdentifier"));

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;
  void *v9;

  v6 = a3;
  switch(a4)
  {
    case 0:
      -[PKTransactionDebugDetailsViewController transactionDetails](self, "transactionDetails");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      -[PKTransactionDebugDetailsViewController merchantDetails](self, "merchantDetails");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[PKTransactionDebugDetailsViewController mapsMerchantDetails](self, "mapsMerchantDetails");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "count") + 1;
      goto LABEL_8;
    case 3:
      -[PKTransactionDebugDetailsViewController mapsBrandDetails](self, "mapsBrandDetails");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v9 = v7;
      v8 = objc_msgSend(v7, "count");
LABEL_8:

      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 3)
    return 0;
  else
    return off_1E3E7B248[a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  if (objc_msgSend(v5, "section"))
  {
    if (objc_msgSend(v5, "section") == 1)
    {
      -[PKTransactionDebugDetailsViewController _merchantInfoCellForIndex:](self, "_merchantInfoCellForIndex:", objc_msgSend(v5, "row"));
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = objc_msgSend(v5, "section");
      v8 = objc_msgSend(v5, "row");
      if (v7 == 2)
        -[PKTransactionDebugDetailsViewController _mapsMerchantInfoCellForIndex:](self, "_mapsMerchantInfoCellForIndex:", v8);
      else
        -[PKTransactionDebugDetailsViewController _mapsBrandInfoCellForIndex:](self, "_mapsBrandInfoCellForIndex:", v8);
      v6 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[PKTransactionDebugDetailsViewController _transactionInfoCellForIndex:](self, "_transactionInfoCellForIndex:", objc_msgSend(v5, "row"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  int v18;
  void *v19;
  void *v20;
  PKMapsMerchantStylingInfoViewController *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section") == 2 && !objc_msgSend(v6, "row"))
  {
    -[PKPaymentTransaction merchant](self->_transaction, "merchant");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "mapsMerchant");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[PKTransactionDebugDetailsViewController _didSelectMap](self, "_didSelectMap");
      goto LABEL_20;
    }
  }
  if (objc_msgSend(v6, "section") == 2)
  {
    objc_msgSend(v25, "cellForRowAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "keyLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v9;
      v11 = v10;
      if (v10 == CFSTR("stylingInfo")
        || v10
        && (v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("stylingInfo")), v11, v12))
      {
        -[PKPaymentTransaction merchant](self->_transaction, "merchant");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "mapsMerchant");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
        v19 = v14;
        objc_msgSend(v14, "stylingInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v21 = -[PKMapsMerchantStylingInfoViewController initWithStylingInfo:]([PKMapsMerchantStylingInfoViewController alloc], "initWithStylingInfo:", v20);
          -[PKTransactionDebugDetailsViewController navigationController](self, "navigationController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "pushViewController:animated:", v21, 1);

        }
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (objc_msgSend(v6, "section") == 3)
  {
    objc_msgSend(v25, "cellForRowAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "keyLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v16;
      v11 = v17;
      if (v17 == CFSTR("stylingInfo")
        || v17
        && (v18 = -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("stylingInfo")), v11, v18))
      {
        -[PKPaymentTransaction merchant](self->_transaction, "merchant");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "mapsBrand");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
LABEL_18:

    }
LABEL_19:

  }
LABEL_20:

}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4, a5.x, a5.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || objc_msgSend(v5, "accessoryType") == 1)
    goto LABEL_19;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "keyLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueLabel");
  }
  else
  {
    objc_msgSend(v6, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "detailTextLabel");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length"))
  {

    v8 = 0;
  }
  if (objc_msgSend(v11, "length"))
  {
    v12 = v8 != 0;
    if (v8 && v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ : %@"), v8, v11);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  else
  {

    v11 = 0;
    v12 = v8 != 0;
  }
  if (v12)
    v14 = v8;
  else
    v14 = v11;
  v13 = v14;
LABEL_17:
  v15 = v13;

  if (!v15)
  {
LABEL_19:
    v18 = 0;
    goto LABEL_20;
  }
  v16 = (void *)MEMORY[0x1E0DC36B8];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __101__PKTransactionDebugDetailsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
  v20[3] = &unk_1E3E6D5A8;
  v21 = v15;
  v17 = v15;
  objc_msgSend(v16, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v18;
}

id __101__PKTransactionDebugDetailsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedString(CFSTR("MENU_ACTION_COPY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__PKTransactionDebugDetailsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v10[3] = &unk_1E3E6D580;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC39D0];
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "menuWithTitle:children:", &stru_1E3E7D690, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __101__PKTransactionDebugDetailsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setString:", *(_QWORD *)(a1 + 32));

}

- (id)_stringForTransactionStatus:(int64_t)a3
{
  void *v3;
  void *v4;

  PKPaymentTransactionStatusToString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capitalizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_stringForTransactionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x15)
    return CFSTR("Purchase");
  else
    return off_1E3E7B268[a3 - 1];
}

- (id)_stringForTechnologyType:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return &stru_1E3E7D690;
  else
    return off_1E3E7B318[a3];
}

- (id)_stringForTransactionSource:(unint64_t)a3
{
  if (a3 > 8)
    return &stru_1E3E7D690;
  else
    return off_1E3E7B330[a3];
}

- (id)_stringForCreditDebitIndicator:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("Credit");
  if (a3 == 2)
    return CFSTR("Debit");
  else
    return (id)v3;
}

- (NSDictionary)transactionDetails
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  double v32;
  uint64_t v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  const __CFString *v39;
  const __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  uint64_t v61;
  const __CFString *v62;
  void *v63;
  const __CFString *v64;
  uint64_t v65;
  const __CFString *v66;
  uint64_t v67;
  const __CFString *v68;
  uint64_t v69;
  const __CFString *v70;
  uint64_t v71;
  const __CFString *v72;
  uint64_t v73;
  void *v74;
  const __CFString *v75;
  uint64_t v76;
  void *v77;
  const __CFString *v78;
  uint64_t v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  const __CFString *v91;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  _QWORD v151[48];
  _QWORD v152[50];

  v152[48] = *MEMORY[0x1E0C80C00];
  v151[0] = CFSTR("identifier");
  -[PKPaymentTransaction identifier](self->_transaction, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v150 = (void *)v3;
  if (v3)
    v4 = (const __CFString *)v3;
  else
    v4 = CFSTR("nil");
  v152[0] = v4;
  v151[1] = CFSTR("amount");
  -[PKPaymentTransaction amount](self->_transaction, "amount");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "stringValue");
  v5 = objc_claimAutoreleasedReturnValue();
  v148 = (void *)v5;
  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = CFSTR("nil");
  v152[1] = v6;
  v151[2] = CFSTR("currencyCode");
  -[PKPaymentTransaction currencyCode](self->_transaction, "currencyCode");
  v7 = objc_claimAutoreleasedReturnValue();
  v147 = (void *)v7;
  if (v7)
    v8 = (const __CFString *)v7;
  else
    v8 = CFSTR("nil");
  v152[2] = v8;
  v151[3] = CFSTR("transactionDate");
  -[PKPaymentTransaction transactionDate](self->_transaction, "transactionDate");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "description");
  v9 = objc_claimAutoreleasedReturnValue();
  v145 = (void *)v9;
  if (v9)
    v10 = (const __CFString *)v9;
  else
    v10 = CFSTR("nil");
  v152[3] = v10;
  v151[4] = CFSTR("accountType");
  -[PKPaymentTransaction accountType](self->_transaction, "accountType");
  PKPaymentTransactionAccountTypeToString();
  v11 = objc_claimAutoreleasedReturnValue();
  v144 = (void *)v11;
  if (v11)
    v12 = (const __CFString *)v11;
  else
    v12 = CFSTR("nil");
  v152[4] = v12;
  v151[5] = CFSTR("displayLocation");
  -[PKPaymentTransaction displayLocation](self->_transaction, "displayLocation");
  v13 = objc_claimAutoreleasedReturnValue();
  v143 = (void *)v13;
  if (v13)
    v14 = (const __CFString *)v13;
  else
    v14 = CFSTR("nil");
  v152[5] = v14;
  v151[6] = CFSTR("serviceIdentifier");
  -[PKPaymentTransaction serviceIdentifier](self->_transaction, "serviceIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();
  v142 = (void *)v15;
  if (v15)
    v16 = (const __CFString *)v15;
  else
    v16 = CFSTR("nil");
  v152[6] = v16;
  v151[7] = CFSTR("paymentHash");
  -[PKPaymentTransaction paymentHash](self->_transaction, "paymentHash");
  v17 = objc_claimAutoreleasedReturnValue();
  v141 = (void *)v17;
  if (v17)
    v18 = (const __CFString *)v17;
  else
    v18 = CFSTR("nil");
  v152[7] = v18;
  v151[8] = CFSTR("locality");
  -[PKPaymentTransaction locality](self->_transaction, "locality");
  v19 = objc_claimAutoreleasedReturnValue();
  v140 = (void *)v19;
  if (v19)
    v20 = (const __CFString *)v19;
  else
    v20 = CFSTR("nil");
  v152[8] = v20;
  v151[9] = CFSTR("administrativeArea");
  -[PKPaymentTransaction administrativeArea](self->_transaction, "administrativeArea");
  v21 = objc_claimAutoreleasedReturnValue();
  v139 = (void *)v21;
  if (v21)
    v22 = (const __CFString *)v21;
  else
    v22 = CFSTR("nil");
  v152[9] = v22;
  v151[10] = CFSTR("location");
  -[PKPaymentTransaction location](self->_transaction, "location");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "description");
  v23 = objc_claimAutoreleasedReturnValue();
  v137 = (void *)v23;
  if (v23)
    v24 = (const __CFString *)v23;
  else
    v24 = CFSTR("nil");
  v152[10] = v24;
  v151[11] = CFSTR("locationDate");
  -[PKPaymentTransaction locationDate](self->_transaction, "locationDate");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "description");
  v25 = objc_claimAutoreleasedReturnValue();
  v135 = (void *)v25;
  if (v25)
    v26 = (const __CFString *)v25;
  else
    v26 = CFSTR("nil");
  v152[11] = v26;
  v151[12] = CFSTR("timeZone");
  -[PKPaymentTransaction timeZone](self->_transaction, "timeZone");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "name");
  v27 = objc_claimAutoreleasedReturnValue();
  v133 = (void *)v27;
  if (v27)
    v28 = (const __CFString *)v27;
  else
    v28 = CFSTR("nil");
  v152[12] = v28;
  v151[13] = CFSTR("statusChangeDate");
  -[PKPaymentTransaction transactionStatusChangedDate](self->_transaction, "transactionStatusChangedDate");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "description");
  v29 = objc_claimAutoreleasedReturnValue();
  v131 = (void *)v29;
  if (v29)
    v30 = (const __CFString *)v29;
  else
    v30 = CFSTR("nil");
  v152[13] = v30;
  v151[14] = CFSTR("locationLat/Long");
  v31 = (void *)MEMORY[0x1E0CB3940];
  -[PKPaymentTransaction locationLatitude](self->_transaction, "locationLatitude");
  v33 = (uint64_t)v32;
  -[PKPaymentTransaction locationLongitude](self->_transaction, "locationLongitude");
  objc_msgSend(v31, "stringWithFormat:", CFSTR("%ld, %ld"), v33, (uint64_t)v34);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v152[14] = v130;
  v151[15] = CFSTR("horizontalAccuracy");
  v35 = (void *)MEMORY[0x1E0CB3940];
  -[PKPaymentTransaction location](self->_transaction, "location");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "horizontalAccuracy");
  objc_msgSend(v35, "stringWithFormat:", CFSTR("%1.f"), v36);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v152[15] = v128;
  v151[16] = CFSTR("verticalAccuracy");
  v37 = (void *)MEMORY[0x1E0CB3940];
  -[PKPaymentTransaction location](self->_transaction, "location");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "verticalAccuracy");
  objc_msgSend(v37, "stringWithFormat:", CFSTR("%1.f"), v38);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v152[16] = v126;
  v151[17] = CFSTR("transactionStatus");
  -[PKTransactionDebugDetailsViewController _stringForTransactionStatus:](self, "_stringForTransactionStatus:", -[PKPaymentTransaction transactionStatus](self->_transaction, "transactionStatus"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v152[17] = v125;
  v151[18] = CFSTR("transactionType");
  -[PKTransactionDebugDetailsViewController _stringForTransactionType:](self, "_stringForTransactionType:", -[PKPaymentTransaction transactionType](self->_transaction, "transactionType"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v152[18] = v124;
  v151[19] = CFSTR("transactionTechnologyType");
  -[PKTransactionDebugDetailsViewController _stringForTechnologyType:](self, "_stringForTechnologyType:", -[PKPaymentTransaction technologyType](self->_transaction, "technologyType"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v152[19] = v123;
  v151[20] = CFSTR("transactionSource");
  -[PKTransactionDebugDetailsViewController _stringForTransactionSource:](self, "_stringForTransactionSource:", -[PKPaymentTransaction transactionSource](self->_transaction, "transactionSource"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v152[20] = v122;
  v151[21] = CFSTR("hasNotificationServiceSource");
  if (-[PKPaymentTransaction hasNotificationServiceData](self->_transaction, "hasNotificationServiceData"))v39 = CFSTR("YES");
  else
    v39 = CFSTR("NO");
  v152[21] = v39;
  v151[22] = CFSTR("hasAssociatedPaymentApplication");
  if (-[PKPaymentTransaction hasAssociatedPaymentApplication](self->_transaction, "hasAssociatedPaymentApplication"))v40 = CFSTR("YES");
  else
    v40 = CFSTR("NO");
  v152[22] = v40;
  v151[23] = CFSTR("cardType");
  -[PKTransactionDebugDetailsViewController _stringForTransactionSource:](self, "_stringForTransactionSource:", -[PKPaymentTransaction cardType](self->_transaction, "cardType"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v152[23] = v121;
  v151[24] = CFSTR("accountIdentifier");
  -[PKPaymentTransaction accountIdentifier](self->_transaction, "accountIdentifier");
  v41 = objc_claimAutoreleasedReturnValue();
  v120 = (void *)v41;
  if (v41)
    v42 = (const __CFString *)v41;
  else
    v42 = CFSTR("nil");
  v152[24] = v42;
  v151[25] = CFSTR("rewardsTotal");
  -[PKPaymentTransaction rewardsTotalAmount](self->_transaction, "rewardsTotalAmount");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "stringValue");
  v43 = objc_claimAutoreleasedReturnValue();
  v118 = (void *)v43;
  if (v43)
    v44 = (const __CFString *)v43;
  else
    v44 = CFSTR("nil");
  v152[25] = v44;
  v151[26] = CFSTR("rewardsCurrency");
  -[PKPaymentTransaction rewardsTotalCurrencyCode](self->_transaction, "rewardsTotalCurrencyCode");
  v45 = objc_claimAutoreleasedReturnValue();
  v117 = (void *)v45;
  if (v45)
    v46 = (const __CFString *)v45;
  else
    v46 = CFSTR("nil");
  v152[26] = v46;
  v151[27] = CFSTR("rewardsEligibility");
  -[PKPaymentTransaction rewardsEligibilityReason](self->_transaction, "rewardsEligibilityReason");
  PKPaymentTransactionRewardsEligibilityReasonToString();
  v47 = objc_claimAutoreleasedReturnValue();
  v116 = (void *)v47;
  if (v47)
    v48 = (const __CFString *)v47;
  else
    v48 = CFSTR("nil");
  v152[27] = v48;
  v151[28] = CFSTR("lifecycleIdentifier");
  -[PKPaymentTransaction lifecycleIdentifier](self->_transaction, "lifecycleIdentifier");
  v49 = objc_claimAutoreleasedReturnValue();
  v115 = (void *)v49;
  if (v49)
    v50 = (const __CFString *)v49;
  else
    v50 = CFSTR("nil");
  v152[28] = v50;
  v151[29] = CFSTR("authNetworkData");
  -[PKPaymentTransaction authNetworkData](self->_transaction, "authNetworkData");
  v51 = objc_claimAutoreleasedReturnValue();
  v114 = (void *)v51;
  if (v51)
    v52 = (const __CFString *)v51;
  else
    v52 = CFSTR("nil");
  v152[29] = v52;
  v151[30] = CFSTR("clearingNetworkData");
  -[PKPaymentTransaction clearingNetworkData](self->_transaction, "clearingNetworkData");
  v53 = objc_claimAutoreleasedReturnValue();
  v113 = (void *)v53;
  if (v53)
    v54 = (const __CFString *)v53;
  else
    v54 = CFSTR("nil");
  v152[30] = v54;
  v151[31] = CFSTR("cardIdentifier");
  -[PKPaymentTransaction cardIdentifier](self->_transaction, "cardIdentifier");
  v55 = objc_claimAutoreleasedReturnValue();
  v112 = (void *)v55;
  if (v55)
    v56 = (const __CFString *)v55;
  else
    v56 = CFSTR("nil");
  v152[31] = v56;
  v151[32] = CFSTR("referenceIdentifier");
  -[PKPaymentTransaction referenceIdentifier](self->_transaction, "referenceIdentifier");
  v57 = objc_claimAutoreleasedReturnValue();
  v111 = (void *)v57;
  if (v57)
    v58 = (const __CFString *)v57;
  else
    v58 = CFSTR("nil");
  v152[32] = v58;
  v151[33] = CFSTR("originatedByDevice");
  if (-[PKPaymentTransaction originatedByDevice](self->_transaction, "originatedByDevice"))
    v59 = CFSTR("YES");
  else
    v59 = CFSTR("NO");
  v152[33] = v59;
  v151[34] = CFSTR("requiresMerchantReprocessing");
  if (-[PKPaymentTransaction requiresMerchantReprocessing](self->_transaction, "requiresMerchantReprocessing"))v60 = CFSTR("YES");
  else
    v60 = CFSTR("NO");
  v152[34] = v60;
  v151[35] = CFSTR("lastMerchantReprocessingDate");
  -[PKPaymentTransaction lastMerchantReprocessingDate](self->_transaction, "lastMerchantReprocessingDate");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "description");
  v61 = objc_claimAutoreleasedReturnValue();
  v109 = (void *)v61;
  if (v61)
    v62 = (const __CFString *)v61;
  else
    v62 = CFSTR("nil");
  v152[35] = v62;
  v151[36] = CFSTR("releasedDataElements");
  v63 = (void *)MEMORY[0x1E0CB37E8];
  -[PKPaymentTransaction releasedData](self->_transaction, "releasedData");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "elements");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "numberWithUnsignedInteger:", objc_msgSend(v107, "count"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "stringValue");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v152[36] = v105;
  v151[37] = CFSTR("isBankConnectTransaction");
  if (-[PKPaymentTransaction isBankConnectTransaction](self->_transaction, "isBankConnectTransaction"))
    v64 = CFSTR("YES");
  else
    v64 = CFSTR("NO");
  v152[37] = v64;
  v151[38] = CFSTR("bankConnectCreditDebitIndicator");
  -[PKTransactionDebugDetailsViewController _stringForCreditDebitIndicator:](self, "_stringForCreditDebitIndicator:", -[PKPaymentTransaction bankConnectCreditDebitIndicator](self->_transaction, "bankConnectCreditDebitIndicator"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v152[38] = v104;
  v151[39] = CFSTR("bankConnectDigitalServicingURL");
  -[PKPaymentTransaction bankConnectDigitalServicingURL](self->_transaction, "bankConnectDigitalServicingURL");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "absoluteString");
  v65 = objc_claimAutoreleasedReturnValue();
  v102 = (void *)v65;
  if (v65)
    v66 = (const __CFString *)v65;
  else
    v66 = CFSTR("nil");
  v152[39] = v66;
  v151[40] = CFSTR("bankConnectPayNowURL");
  -[PKPaymentTransaction bankConnectPayNowURL](self->_transaction, "bankConnectPayNowURL");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "absoluteString");
  v67 = objc_claimAutoreleasedReturnValue();
  v100 = (void *)v67;
  if (v67)
    v68 = (const __CFString *)v67;
  else
    v68 = CFSTR("nil");
  v152[40] = v68;
  v151[41] = CFSTR("bankConnectTransferFundsURL");
  -[PKPaymentTransaction bankConnectTransferFundsURL](self->_transaction, "bankConnectTransferFundsURL");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "absoluteString");
  v69 = objc_claimAutoreleasedReturnValue();
  v98 = (void *)v69;
  if (v69)
    v70 = (const __CFString *)v69;
  else
    v70 = CFSTR("nil");
  v152[41] = v70;
  v151[42] = CFSTR("bankConnectPostInstallmentURL");
  -[PKPaymentTransaction bankConnectPostInstallmentURL](self->_transaction, "bankConnectPostInstallmentURL");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "absoluteString");
  v71 = objc_claimAutoreleasedReturnValue();
  v96 = (void *)v71;
  if (v71)
    v72 = (const __CFString *)v71;
  else
    v72 = CFSTR("nil");
  v152[42] = v72;
  v151[43] = CFSTR("bankConnectRedeemRewardsURL");
  -[PKPaymentTransaction bankConnectRedeemRewardsURL](self->_transaction, "bankConnectRedeemRewardsURL");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "absoluteString");
  v73 = objc_claimAutoreleasedReturnValue();
  v74 = (void *)v73;
  if (v73)
    v75 = (const __CFString *)v73;
  else
    v75 = CFSTR("nil");
  v152[43] = v75;
  v151[44] = CFSTR("transactionSourceIdentifier");
  -[PKPaymentTransaction transactionSourceIdentifier](self->_transaction, "transactionSourceIdentifier");
  v76 = objc_claimAutoreleasedReturnValue();
  v77 = (void *)v76;
  if (v76)
    v78 = (const __CFString *)v76;
  else
    v78 = CFSTR("nil");
  v152[44] = v78;
  v151[45] = CFSTR("rewards");
  -[PKPaymentTransaction rewards](self->_transaction, "rewards");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "description");
  v79 = objc_claimAutoreleasedReturnValue();
  v80 = (void *)v79;
  if (v79)
    v81 = (const __CFString *)v79;
  else
    v81 = CFSTR("nil");
  v152[45] = v81;
  v151[46] = CFSTR("paymentIdentifier");
  -[PKPaymentTransaction payments](self->_transaction, "payments");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "firstObject");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "identifier");
  v84 = objc_claimAutoreleasedReturnValue();
  v85 = (void *)v84;
  if (v84)
    v86 = (const __CFString *)v84;
  else
    v86 = CFSTR("nil");
  v152[46] = v86;
  v151[47] = CFSTR("paymentReferenceIdentifier");
  -[PKPaymentTransaction payments](self->_transaction, "payments");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "firstObject");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "referenceIdentifier");
  v89 = objc_claimAutoreleasedReturnValue();
  v90 = (void *)v89;
  if (v89)
    v91 = (const __CFString *)v89;
  else
    v91 = CFSTR("nil");
  v152[47] = v91;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v152, v151, 48);
  v93 = (id)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v93;
}

- (NSDictionary)merchantDetails
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  int v39;
  const __CFString *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[16];
  _QWORD v51[18];

  v51[16] = *MEMORY[0x1E0C80C00];
  -[PKPaymentTransaction merchant](self->_transaction, "merchant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = CFSTR("industryCode");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v2, "industryCode"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v49;
  v50[1] = CFSTR("industryCategory");
  objc_msgSend(v2, "industryCategory");
  v3 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)v3;
  if (v3)
    v4 = (const __CFString *)v3;
  else
    v4 = CFSTR("nil");
  v51[1] = v4;
  v50[2] = CFSTR("name");
  objc_msgSend(v2, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)v5;
  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = CFSTR("nil");
  v51[2] = v6;
  v50[3] = CFSTR("rawName");
  objc_msgSend(v2, "rawName");
  v7 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v7;
  if (v7)
    v8 = (const __CFString *)v7;
  else
    v8 = CFSTR("nil");
  v51[3] = v8;
  v50[4] = CFSTR("rawCANL");
  objc_msgSend(v2, "rawCANL");
  v9 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v9;
  if (v9)
    v10 = (const __CFString *)v9;
  else
    v10 = CFSTR("nil");
  v51[4] = v10;
  v50[5] = CFSTR("rawCity");
  objc_msgSend(v2, "rawCity");
  v11 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v11;
  if (v11)
    v12 = (const __CFString *)v11;
  else
    v12 = CFSTR("nil");
  v51[5] = v12;
  v50[6] = CFSTR("rawState");
  objc_msgSend(v2, "rawState");
  v13 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v13;
  if (v13)
    v14 = (const __CFString *)v13;
  else
    v14 = CFSTR("nil");
  v51[6] = v14;
  v50[7] = CFSTR("rawCountry");
  objc_msgSend(v2, "rawCountry");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = CFSTR("nil");
  v51[7] = v17;
  v50[8] = CFSTR("city");
  objc_msgSend(v2, "city");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = CFSTR("nil");
  v51[8] = v20;
  v50[9] = CFSTR("state");
  objc_msgSend(v2, "state");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (const __CFString *)v21;
  else
    v23 = CFSTR("nil");
  v51[9] = v23;
  v50[10] = CFSTR("zip");
  objc_msgSend(v2, "zip");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (const __CFString *)v24;
  else
    v26 = CFSTR("nil");
  v51[10] = v26;
  v50[11] = CFSTR("displayName");
  objc_msgSend(v2, "displayName");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
    v29 = (const __CFString *)v27;
  else
    v29 = CFSTR("nil");
  v51[11] = v29;
  v50[12] = CFSTR("merchantIdentifier");
  objc_msgSend(v2, "merchantIdentifier");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (v30)
    v32 = (const __CFString *)v30;
  else
    v32 = CFSTR("nil");
  v51[12] = v32;
  v50[13] = CFSTR("fallbackCategory");
  objc_msgSend(v2, "fallbackcategory");
  PKMerchantCategoryToString();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if (v33)
    v35 = (const __CFString *)v33;
  else
    v35 = CFSTR("nil");
  v51[13] = v35;
  v50[14] = CFSTR("fallbackDetailedCategory");
  objc_msgSend(v2, "fallbackDetailedCategory");
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v36;
  if (v36)
    v38 = (const __CFString *)v36;
  else
    v38 = CFSTR("nil");
  v51[14] = v38;
  v50[15] = CFSTR("localMatch");
  v39 = objc_msgSend(v2, "mapsDataIsFromLocalMatch");
  v40 = CFSTR("NO");
  if (v39)
    v40 = CFSTR("YES");
  v51[15] = v40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 16);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v41;
}

- (NSDictionary)mapsMerchantDetails
{
  void *v2;
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[11];
  _QWORD v43[13];

  v43[11] = *MEMORY[0x1E0C80C00];
  -[PKPaymentTransaction merchant](self->_transaction, "merchant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapsMerchant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v42[0] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3, "identifier"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringValue");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v40;
  v42[1] = CFSTR("resultProviderIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "resultProviderIdentifier"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringValue");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v38;
  v42[2] = CFSTR("name");
  objc_msgSend(v3, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v4;
  if (v4)
    v5 = (const __CFString *)v4;
  else
    v5 = CFSTR("nil");
  v43[2] = v5;
  v42[3] = CFSTR("phoneNumber");
  objc_msgSend(v3, "phoneNumber");
  v6 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v6;
  if (v6)
    v7 = (const __CFString *)v6;
  else
    v7 = CFSTR("nil");
  v43[3] = v7;
  v42[4] = CFSTR("url");
  objc_msgSend(v3, "url");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "absoluteString");
  v8 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v8;
  if (v8)
    v9 = (const __CFString *)v8;
  else
    v9 = CFSTR("nil");
  v43[4] = v9;
  v42[5] = CFSTR("location");
  objc_msgSend(v3, "location");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "description");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("nil");
  v43[5] = v12;
  v42[6] = CFSTR("postalAddress");
  objc_msgSend(v3, "postalAddress");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "description");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = CFSTR("nil");
  v43[6] = v15;
  v42[7] = CFSTR("category");
  objc_msgSend(v3, "category");
  PKMerchantCategoryToString();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = CFSTR("nil");
  v43[7] = v18;
  v42[8] = CFSTR("detailedCategory");
  objc_msgSend(v3, "detailedCategory");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = CFSTR("nil");
  v43[8] = v21;
  v42[9] = CFSTR("heroImageURL");
  objc_msgSend(v3, "heroImageURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "absoluteString");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = (const __CFString *)v23;
  else
    v25 = CFSTR("nil");
  v43[9] = v25;
  v42[10] = CFSTR("stylingInfo");
  objc_msgSend(v3, "stylingInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "description");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
    v29 = (const __CFString *)v27;
  else
    v29 = CFSTR("nil");
  v43[10] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 11);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v30;
}

- (id)mapsBrandDetails
{
  void *v2;
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[9];
  _QWORD v35[11];

  v35[9] = *MEMORY[0x1E0C80C00];
  -[PKPaymentTransaction merchant](self->_transaction, "merchant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapsBrand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3, "identifier"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringValue");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v32;
  v34[1] = CFSTR("resultProviderIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "resultProviderIdentifier"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringValue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v30;
  v34[2] = CFSTR("name");
  objc_msgSend(v3, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v4;
  if (v4)
    v5 = (const __CFString *)v4;
  else
    v5 = CFSTR("nil");
  v35[2] = v5;
  v34[3] = CFSTR("phoneNumber");
  objc_msgSend(v3, "phoneNumber");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("nil");
  v35[3] = v8;
  v34[4] = CFSTR("url");
  objc_msgSend(v3, "url");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "absoluteString");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("nil");
  v35[4] = v11;
  v34[5] = CFSTR("logoURL");
  objc_msgSend(v3, "logoURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteString");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = CFSTR("nil");
  v35[5] = v15;
  v34[6] = CFSTR("category");
  objc_msgSend(v3, "category");
  PKMerchantCategoryToString();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = CFSTR("nil");
  v35[6] = v18;
  v34[7] = CFSTR("detailedCategory");
  objc_msgSend(v3, "detailedCategory");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = CFSTR("nil");
  v35[7] = v21;
  v34[8] = CFSTR("stylingInfo");
  objc_msgSend(v3, "stylingInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "description");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = (const __CFString *)v23;
  else
    v25 = CFSTR("nil");
  v35[8] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)_transactionInfoCellForIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PKTransactionDebugDetailsViewController transactionDetails](self, "transactionDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionDebugDetailsViewController transactionDetails](self, "transactionDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionDebugDetailsViewController _cellWithPrimaryText:infoText:](self, "_cellWithPrimaryText:infoText:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_merchantInfoCellForIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PKTransactionDebugDetailsViewController merchantDetails](self, "merchantDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionDebugDetailsViewController merchantDetails](self, "merchantDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionDebugDetailsViewController _cellWithPrimaryText:infoText:](self, "_cellWithPrimaryText:infoText:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_mapsMerchantInfoCellForIndex:(int64_t)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v4 = a3;
    -[PKTransactionDebugDetailsViewController mapsMerchantDetails](self, "mapsMerchantDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", --v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKTransactionDebugDetailsViewController mapsMerchantDetails](self, "mapsMerchantDetails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKTransactionDebugDetailsViewController _cellWithPrimaryText:infoText:](self, "_cellWithPrimaryText:infoText:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKTransactionDebugDetailsViewController _mapsCell](self, "_mapsCell");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (id)_mapsBrandInfoCellForIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PKTransactionDebugDetailsViewController mapsBrandDetails](self, "mapsBrandDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTransactionDebugDetailsViewController mapsBrandDetails](self, "mapsBrandDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTransactionDebugDetailsViewController _cellWithPrimaryText:infoText:](self, "_cellWithPrimaryText:infoText:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_mapsCell
{
  UITableViewCell *mapsCell;
  UITableViewCell *v4;
  UITableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;

  mapsCell = self->_mapsCell;
  if (!mapsCell)
  {
    v4 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_mapsCell;
    self->_mapsCell = v4;

    -[UITableViewCell setAccessoryType:](self->_mapsCell, "setAccessoryType:", 1);
    -[UITableViewCell textLabel](self->_mapsCell, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", CFSTR("View in Maps"));

    -[UITableViewCell textLabel](self->_mapsCell, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v8);

    mapsCell = self->_mapsCell;
  }
  return mapsCell;
}

- (id)_cellWithPrimaryText:(id)a3 infoText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  -[PKTransactionDebugDetailsViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionTitleValueLabelCellReuseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSelectionStyle:", 0);
  -[PKTransactionDebugDetailsViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "separatorInset");
  v12 = v11;

  objc_msgSend(v9, "setLayoutMargins:", 0.0, v12, 0.0, v12);
  objc_msgSend(v9, "keyLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v14);

  if (self->_inBridge)
  {
    PKBridgeTextColor();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v15);

  }
  objc_msgSend(v9, "valueLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v6);

  return v9;
}

- (void)_didSelectMap
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[PKPaymentTransaction merchant](self->_transaction, "merchant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapsMerchant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0CC1808]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setMuids:", v7);

  if (objc_msgSend(v4, "resultProviderIdentifier"))
    objc_msgSend(v5, "_setResultProviderID:", objc_msgSend(v4, "resultProviderIdentifier"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v8, "startAnimating");
  -[UITableViewCell setAccessoryView:](self->_mapsCell, "setAccessoryView:", v8);
  -[UITableViewCell setUserInteractionEnabled:](self->_mapsCell, "setUserInteractionEnabled:", 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC17F0]), "initWithRequest:", v5);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__PKTransactionDebugDetailsViewController__didSelectMap__block_invoke;
  v11[3] = &unk_1E3E7B228;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "startWithCompletionHandler:", v11);

}

void __56__PKTransactionDebugDetailsViewController__didSelectMap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  PKMerchantMapViewController *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setAccessoryView:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setUserInteractionEnabled:", 1);
  if (!v6)
  {
    objc_msgSend(v5, "mapItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = [PKMerchantMapViewController alloc];
      objc_msgSend(v5, "mapItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[PKMerchantMapViewController initWithMapItem:configOptions:](v12, "initWithMapItem:configOptions:", v14, 1);

      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString pushViewController:animated:](v9, "pushViewController:animated:", v7, 1);
LABEL_9:

      goto LABEL_10;
    }
  }
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "identifier");
    if (v6)
    {
      objc_msgSend(v6, "localizedDescription");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = CFSTR("no map items.");
    }
    v15 = 134218242;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKTransactionDebugDetailsViewController: MKLocalSearch could not resolve merchant maps for mapsID: %llu. Error: %@", (uint8_t *)&v15, 0x16u);
    if (v6)
      goto LABEL_9;
  }
LABEL_10:

}

- (void)setTransactionDetails:(id)a3
{
  objc_storeStrong((id *)&self->_transactionDetails, a3);
}

- (void)setMerchantDetails:(id)a3
{
  objc_storeStrong((id *)&self->_merchantDetails, a3);
}

- (void)setMapsMerchantDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsMerchantDetails, 0);
  objc_storeStrong((id *)&self->_merchantDetails, 0);
  objc_storeStrong((id *)&self->_transactionDetails, 0);
  objc_storeStrong((id *)&self->_mapsCell, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end

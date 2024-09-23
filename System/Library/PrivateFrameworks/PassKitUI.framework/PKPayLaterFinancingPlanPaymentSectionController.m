@implementation PKPayLaterFinancingPlanPaymentSectionController

- (PKPayLaterFinancingPlanPaymentSectionController)initWithFinancingPlan:(id)a3 payment:(id)a4 payLaterAccount:(id)a5 paymentIntentController:(id)a6 merchantIcon:(id)a7 delegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  PKPayLaterFinancingPlanPaymentSectionController *v19;
  PKPayLaterFinancingPlanPaymentSectionController *v20;
  void **p_resizedMerchantIcon;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  PKPaymentPass *payLaterPass;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSDateFormatter *v34;
  NSDateFormatter *paymentDateFormatter;
  NSDateFormatter *v36;
  void *v37;
  id v39;
  objc_super v40;

  v15 = a3;
  v39 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v40.receiver = self;
  v40.super_class = (Class)PKPayLaterFinancingPlanPaymentSectionController;
  v19 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v40, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, v16, 0, a8);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_financingPlan, a3);
    objc_storeStrong((id *)&v20->_payment, a4);
    objc_storeStrong((id *)&v20->_paymentIntentController, a6);
    objc_storeStrong((id *)&v20->_merchantIcon, a7);
    p_resizedMerchantIcon = (void **)&v20->_resizedMerchantIcon;
    objc_storeStrong((id *)&v20->_resizedMerchantIcon, v20->_merchantIcon);
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "associatedPassUniqueID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "passWithUniqueID:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "paymentPass");
    v25 = objc_claimAutoreleasedReturnValue();
    payLaterPass = v20->_payLaterPass;
    v20->_payLaterPass = (PKPaymentPass *)v25;

    if (v20->_merchantIcon)
    {
      -[UIImage size](v20->_merchantIcon, "size");
      if (v28 != 45.0 || v27 != 45.0)
      {
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66DF8]), "initWithCGImage:scale:orientation:", -[UIImage CGImage](v20->_merchantIcon, "CGImage"), 1, PKUIScreenScale());
        objc_msgSend(MEMORY[0x1E0D66E08], "constraintsWithAspectFillToSize:", 45.0, 45.0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "resizedImageWithConstraints:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v31);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = *p_resizedMerchantIcon;
        *p_resizedMerchantIcon = (void *)v32;

      }
    }
    v34 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    paymentDateFormatter = v20->_paymentDateFormatter;
    v20->_paymentDateFormatter = v34;

    v36 = v20->_paymentDateFormatter;
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v36, "setCalendar:", v37);

    -[NSDateFormatter setDateStyle:](v20->_paymentDateFormatter, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](v20->_paymentDateFormatter, "setTimeStyle:", 1);
  }

  return v20;
}

- (id)identifiers
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("kPaymentSummarySection");
  v3[1] = CFSTR("kReportIssueSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v11;
  __CFString *v12;
  int v13;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == CFSTR("kPaymentSummarySection"))
    goto LABEL_4;
  if (v7)
  {
    v9 = objc_msgSend(CFSTR("kPaymentSummarySection"), "isEqualToString:", v7);

    if (v9)
    {
LABEL_4:
      -[PKPayLaterFinancingPlanPaymentSectionController _configurePaymentSummarySection:](self, "_configurePaymentSummarySection:", v6);
      goto LABEL_5;
    }
    v11 = v8;
    if (v11 == CFSTR("kReportIssueSection")
      || (v12 = v11, v13 = objc_msgSend(CFSTR("kReportIssueSection"), "isEqualToString:", v11), v12, v13))
    {
      -[PKPayLaterFinancingPlanPaymentSectionController _configureReportIssueSection:](self, "_configureReportIssueSection:", v6);
    }
  }
LABEL_5:

  return v6;
}

- (Class)headerViewClassForSectionIdentifier:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  int v5;
  void *v6;

  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 == CFSTR("kPaymentSummarySection")
    || v3 && (v5 = objc_msgSend(CFSTR("kPaymentSummarySection"), "isEqualToString:", v3), v4, v5))
  {
    objc_opt_class();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (Class)v6;
}

- (void)configureHeaderView:(id)a3 forSectionIdentifier:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  NSDateFormatter *paymentDateFormatter;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = (__CFString *)a4;
  v7 = v6;
  if (v6 == CFSTR("kPaymentSummarySection")
    || v6 && (v8 = objc_msgSend(CFSTR("kPaymentSummarySection"), "isEqualToString:", v6), v7, v8))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "headerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterPayment amount](self->_payment, "amount");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "formattedStringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[PKPayLaterPayment type](self->_payment, "type") == 1
         || -[PKPayLaterPayment type](self->_payment, "type") == 5;
      -[PKPayLaterPayment amount](self->_payment, "amount");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "amount");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "pk_isPositiveNumber");

      if (objc_msgSend(v11, "length") && !v12 && v15)
      {
        PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v11);
        v16 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v16;
      }
      objc_msgSend(v9, "setAmountText:", v11);
      PKLocalizedCocoonString(CFSTR("APPLE_PAY_LATER"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSubtitleText:", v17);

      paymentDateFormatter = self->_paymentDateFormatter;
      -[PKPayLaterPayment postedDate](self->_payment, "postedDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](paymentDateFormatter, "stringFromDate:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSecondarySubtitleText:", v20);

    }
  }

}

- (void)_configurePaymentSummarySection:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  __CFString *v18;
  void *v19;
  PKPayLaterTitleDetailValueRow *v20;
  void *v21;
  void *v22;
  PKPayLaterTitleDetailValueRow *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  void *v28;
  __objc2_class **v29;
  id v30;
  PKMultiKeyValueCellKeyValueSource *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PKMultiKeyValueCellKeyValueSource *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  PKMultiKeyValueCellKeyValueSource *v46;
  void *v47;
  PKMultiKeyValueCellKeyValueSource *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  _QWORD v62[5];

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v61 = objc_alloc_init(v4);
  -[PKPayLaterPayment amount](self->_payment, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formattedStringValue");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PKPayLaterPayment type](self->_payment, "type") == 1 || -[PKPayLaterPayment type](self->_payment, "type") == 5;
  -[PKPayLaterPayment amount](self->_payment, "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "amount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pk_isPositiveNumber");

  if (objc_msgSend(v60, "length") && !v7 && v10)
  {
    PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v60);
    v11 = objc_claimAutoreleasedReturnValue();

    v60 = (void *)v11;
  }
  -[PKPayLaterFinancingPlan disputes](self->_financingPlan, "disputes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __83__PKPayLaterFinancingPlanPaymentSectionController__configurePaymentSummarySection___block_invoke;
  v62[3] = &unk_1E3E6A4B8;
  v62[4] = self;
  v13 = objc_msgSend(v12, "pk_containsObjectPassingTest:", v62);

  -[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayNamePurchase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = v15;
  }
  else
  {
    PKLocalizedCocoonString(CFSTR("INSTALLMENT_WITHOUT_MERCHANT_NAME"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  switch(-[PKPayLaterPayment type](self->_payment, "type"))
  {
    case 0:
    case 1:
    case 5:
      v18 = CFSTR("APPLE_PAY_LATER");
      goto LABEL_19;
    case 2:
      v18 = CFSTR("FINANCING_PLAN_PAYMENT_TEMPORARY_CREDIT_ADJUSTMENT");
      goto LABEL_19;
    case 3:
      if (v13)
      {
        v18 = CFSTR("FINANCING_PLAN_PAYMENT_CREDIT_ADJUSTMENT");
LABEL_19:
        PKLocalizedCocoonString(&v18->isa);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        PKLocalizedCocoonString(CFSTR("FINANCING_PLAN_PAYMENT_REFUND_ADJUSTMENT"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[PKPayLaterPayment subtype](self->_payment, "subtype") == 1)
        {
          PKLocalizedCocoonString(CFSTR("FINANCING_PLAN_PAYMENT_CREDIT_ADJUSTMENT"));
          v54 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)v54;
        }
      }
LABEL_20:
      v58 = v19;
      v20 = -[PKPayLaterTitleDetailValueRow initWithTitle:detail:value:accessory:selectionHandler:]([PKPayLaterTitleDetailValueRow alloc], "initWithTitle:detail:value:accessory:selectionHandler:", v19, v17, 0, 0, 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterTitleDetailValueRow setDetailColor:](v20, "setDetailColor:", v21);

      -[PKPayLaterTitleDetailValueRow setLabelPadding:](v20, "setLabelPadding:", 2.0);
      -[PKPayLaterTitleDetailValueRow setAxID:](v20, "setAxID:", *MEMORY[0x1E0D68118]);
      objc_msgSend(v61, "safelyAddObject:", v20);
      +[PKPayLaterFinancingPlanPaymentScheduleComposer detailTextForPayment:financingPlan:](PKPayLaterFinancingPlanPaymentScheduleComposer, "detailTextForPayment:financingPlan:", self->_payment, self->_financingPlan);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v22;
      if (objc_msgSend(v22, "length"))
      {
        v23 = -[PKPayLaterTitleDetailValueRow initWithTitle:detail:value:accessory:selectionHandler:]([PKPayLaterTitleDetailValueRow alloc], "initWithTitle:detail:value:accessory:selectionHandler:", 0, v22, 0, 0, 0);
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterTitleDetailValueRow setDetailColor:](v23, "setDetailColor:", v24);

        -[PKPayLaterTitleDetailValueRow setAxID:](v23, "setAxID:", *MEMORY[0x1E0D67C08]);
        objc_msgSend(v61, "safelyAddObject:", v23);

      }
      v25 = -[PKPayLaterPayment type](self->_payment, "type");
      v59 = v17;
      if (v25 == 1)
      {
        v26 = CFSTR("FINANCING_PLAN_PAYMENT_STATUS_CLEARED");
        goto LABEL_26;
      }
      if (v25 == 5)
      {
        v26 = CFSTR("FINANCING_PLAN_PAYMENT_STATUS_DECLINED");
LABEL_26:
        v27 = v5;
        PKLocalizedCocoonString(&v26->isa);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
      v28 = 0;
      v27 = v5;
LABEL_28:
      v29 = off_1E3E1B000;
      if (objc_msgSend(v28, "length"))
      {
        v55 = v15;
        v56 = v27;
        v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v31 = -[PKMultiKeyValueCellKeyValueSource initWithTitle:subtitle:]([PKMultiKeyValueCellKeyValueSource alloc], "initWithTitle:subtitle:", v28, 0);
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMultiKeyValueCellKeyValueSource setSubtitleTextColor:](v31, "setSubtitleTextColor:", v32);

        -[PKMultiKeyValueCellKeyValueSource setBold:](v31, "setBold:", 1);
        objc_msgSend(v30, "addObject:", v31);
        -[PKPayLaterPayment fundingSources](self->_payment, "fundingSources");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "displayName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKPayLaterPayment fundingSources](self->_payment, "fundingSources");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "firstObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "panSuffix");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          if (v38)
          {
            PKLocalizedCocoonString(CFSTR("FINANCING_PLAN_PAYMENT_PAN_SUFFIX"), CFSTR("%@"), v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v39 = 0;
          }
          v40 = -[PKMultiKeyValueCellKeyValueSource initWithTitle:subtitle:]([PKMultiKeyValueCellKeyValueSource alloc], "initWithTitle:subtitle:", v35, v39);
          objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKMultiKeyValueCellKeyValueSource setSubtitleTextColor:](v40, "setSubtitleTextColor:", v41);

          objc_msgSend(v30, "addObject:", v40);
          v29 = off_1E3E1B000;
        }
        v42 = objc_alloc(v29[253]);
        v43 = (void *)objc_msgSend(v30, "copy");
        v44 = (void *)objc_msgSend(v42, "initKeyValueSources:", v43);

        objc_msgSend(v44, "setAxID:", *MEMORY[0x1E0D680C0]);
        objc_msgSend(v61, "addObject:", v44);

        v15 = v55;
        v27 = v56;
      }
      v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v46 = [PKMultiKeyValueCellKeyValueSource alloc];
      PKLocalizedCocoonString(CFSTR("TOTAL"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = -[PKMultiKeyValueCellKeyValueSource initWithTitle:subtitle:](v46, "initWithTitle:subtitle:", v47, v60);

      -[PKMultiKeyValueCellKeyValueSource setBold:](v48, "setBold:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMultiKeyValueCellKeyValueSource setSubtitleTextColor:](v48, "setSubtitleTextColor:", v49);

      objc_msgSend(v45, "addObject:", v48);
      -[PKPayLaterFinancingPlan productType](self->_financingPlan, "productType");
      v50 = objc_alloc(v29[253]);
      v51 = (void *)objc_msgSend(v45, "copy");
      v52 = (void *)objc_msgSend(v50, "initKeyValueSources:", v51);

      objc_msgSend(v52, "setAxID:", *MEMORY[0x1E0D68120]);
      objc_msgSend(v61, "addObject:", v52);
      v53 = (void *)objc_msgSend(v61, "copy");
      objc_msgSend(v27, "appendItems:", v53);

      return;
    case 4:
      v18 = CFSTR("FINANCING_PLAN_PAYMENT_CREDIT_REVOKED_ADJUSTMENT");
      goto LABEL_19;
    case 6:
      v18 = CFSTR("FINANCING_PLAN_PAYMENT_REFUND_REVOKED_ADJUSTMENT");
      goto LABEL_19;
    default:
      v19 = 0;
      goto LABEL_20;
  }
}

uint64_t __83__PKPayLaterFinancingPlanPaymentSectionController__configurePaymentSummarySection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  objc_msgSend(a2, "appliedPayments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__PKPayLaterFinancingPlanPaymentSectionController__configurePaymentSummarySection___block_invoke_2;
  v6[3] = &unk_1E3E6A490;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __83__PKPayLaterFinancingPlanPaymentSectionController__configurePaymentSummarySection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "paymentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "paymentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (void)_configureReportIssueSection:(id)a3
{
  id v4;
  id v5;
  PKPayLaterButtonRow *v6;
  void *v7;
  PKPayLaterButtonRow *v8;
  PKPayLaterButtonRow *reportIssueButton;
  _QWORD v10[5];
  id v11;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  v6 = [PKPayLaterButtonRow alloc];
  PKLocalizedCocoonString(CFSTR("REPORT_AN_ISSUE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke;
  v10[3] = &unk_1E3E61B68;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  v8 = -[PKPayLaterButtonRow initWithTitle:selectionHandler:](v6, "initWithTitle:selectionHandler:", v7, v10);
  reportIssueButton = self->_reportIssueButton;
  self->_reportIssueButton = v8;

  objc_msgSend(v5, "addObject:", self->_reportIssueButton);
  objc_msgSend(v4, "appendItems:", v5);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  PKPayLaterBusinessChatTopicComposer *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16[2];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0D68858];
    v18[0] = *MEMORY[0x1E0D688A0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportAnalyticsEvent:", v6);

    objc_msgSend(v4[12], "setShowSpinner:", 1);
    objc_msgSend(v4, "dynamicCollectionDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadItem:animated:", v4[12], 1);

    v8 = [PKPayLaterBusinessChatTopicComposer alloc];
    objc_msgSend(v4, "payLaterAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKPayLaterBusinessChatTopicComposer initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:](v8, "initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:", v9, v4[14], v4[21], 0, v4[22]);
    v12 = *(_QWORD *)(a1 + 32);
    v11 = a1 + 32;
    v13 = *(void **)(v12 + 160);
    *(_QWORD *)(v12 + 160) = v10;

    v14 = *(void **)(*(_QWORD *)v11 + 160);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke_2;
    v15[3] = &unk_1E3E65C98;
    objc_copyWeak(v16, v2);
    v15[4] = *(_QWORD *)v11;
    v16[1] = (id)3;
    objc_msgSend(v14, "releventTopicsForContext:completion:", 3, v15);
    objc_destroyWeak(v16);
  }

}

void __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9[2];

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke_3;
  v6[3] = &unk_1E3E65C70;
  objc_copyWeak(v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v9[1] = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(v9);
}

void __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  PKPayLaterBusinessChatTopicsViewController *v3;
  void *v4;
  PKPayLaterBusinessChatTopicsViewController *v5;
  PKNavigationController *v6;
  void *v7;
  void *v8;
  id v9;
  PKBusinessChatController *v10;
  id v11;
  PKBusinessChatPayLaterContext *v12;
  void *v13;
  id v14;
  void *v15;
  PKBusinessChatPayLaterContext *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v3 = [PKPayLaterBusinessChatTopicsViewController alloc];
      objc_msgSend(WeakRetained, "payLaterAccount");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[PKPayLaterBusinessChatTopicsViewController initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:topics:businessChatContext:](v3, "initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:topics:businessChatContext:", v4, WeakRetained[14], WeakRetained[21], 0, WeakRetained[22], *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

      v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);
      objc_msgSend(WeakRetained, "dynamicCollectionDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentViewController:animated:completion:", v6, 1, 0);

      objc_msgSend(WeakRetained[12], "setShowSpinner:", 0);
      objc_msgSend(WeakRetained, "dynamicCollectionDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reloadItem:animated:", WeakRetained[12], 1);

    }
    else
    {
      v9 = WeakRetained[17];
      if (v9)
        v10 = (PKBusinessChatController *)v9;
      else
        v10 = objc_alloc_init(PKBusinessChatController);
      v11 = WeakRetained[17];
      WeakRetained[17] = v10;

      objc_initWeak(&location, *(id *)(a1 + 40));
      v12 = [PKBusinessChatPayLaterContext alloc];
      objc_msgSend(WeakRetained, "payLaterAccount");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = WeakRetained[14];
      objc_msgSend(MEMORY[0x1E0D66FD8], "genericBusinessChatTopicForContext:", *(_QWORD *)(a1 + 56));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PKBusinessChatPayLaterContext initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:](v12, "initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:", v13, v14, v15, WeakRetained[21], 0, WeakRetained[22], 0);

      v17 = WeakRetained[17];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke_4;
      v18[3] = &unk_1E3E61DB8;
      objc_copyWeak(&v19, &location);
      objc_msgSend(v17, "openBusinessChatWithContext:completion:", v16, v18);
      objc_destroyWeak(&v19);

      objc_destroyWeak(&location);
    }
  }

}

void __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke_5;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      PKAccountDisplayableError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

      v5 = v9;
      if (v4)
      {
        objc_msgSend(v9, "dynamicCollectionDelegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "presentViewController:animated:completion:", v4, 1, 0);

        v5 = v9;
      }
      objc_msgSend(v5, "dynamicCollectionDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentViewController:animated:completion:", v4, 1, 0);

    }
    objc_msgSend(v9[12], "setShowSpinner:", 0);
    objc_msgSend(v9, "dynamicCollectionDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadItem:animated:", v9[12], 1);

    WeakRetained = v9;
  }

}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (void)setFinancingPlan:(id)a3
{
  objc_storeStrong((id *)&self->_financingPlan, a3);
}

- (PKPayLaterPayment)payment
{
  return self->_payment;
}

- (void)setPayment:(id)a3
{
  objc_storeStrong((id *)&self->_payment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_topicsComposer, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_paymentDateFormatter, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_resizedMerchantIcon, 0);
  objc_storeStrong((id *)&self->_merchantIcon, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_financingPlanRow, 0);
  objc_storeStrong((id *)&self->_reportIssueButton, 0);
}

@end

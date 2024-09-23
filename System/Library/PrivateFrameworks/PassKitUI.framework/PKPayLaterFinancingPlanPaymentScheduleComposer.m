@implementation PKPayLaterFinancingPlanPaymentScheduleComposer

- (PKPayLaterFinancingPlanPaymentScheduleComposer)initWithDelegate:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  PKPayLaterFinancingPlanPaymentScheduleComposer *v8;
  PKPayLaterFinancingPlanPaymentScheduleComposer *v9;
  PKConnectedCollectionViewCell *v10;
  PKConnectedCollectionViewCell *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  double *v15;
  double *v16;
  double v17;
  uint64_t v18;
  UIFont *font;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKPayLaterFinancingPlanPaymentScheduleComposer;
  v8 = -[PKPayLaterFinancingPlanPaymentScheduleComposer init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_dataSource, v7);
    v10 = [PKConnectedCollectionViewCell alloc];
    v11 = -[PKConnectedCollectionViewCell initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(CFSTR(" "), "pk_attributedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKConnectedCollectionViewCell setPrimaryText:](v11, "setPrimaryText:", v12);

    objc_msgSend(CFSTR(" "), "pk_attributedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKConnectedCollectionViewCell setSecondaryText:](v11, "setSecondaryText:", v13);

    -[PKConnectedCollectionViewCell setShowChevron:](v11, "setShowChevron:", 1);
    v14 = PKUIGetMinScreenType();
    v15 = (double *)((char *)&unk_19DF15B98 + 8 * v14);
    v16 = (double *)((char *)&unk_19DF15C28 + 8 * v14);
    if (v14 >= 0x12)
    {
      v16 = (double *)(MEMORY[0x1E0C9D820] + 8);
      v15 = (double *)MEMORY[0x1E0C9D820];
    }
    -[PKConnectedCollectionViewCell sizeThatFits:](v11, "sizeThatFits:", *v15, *v16);
    v9->_minimumCellHeight = v17;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
    v18 = objc_claimAutoreleasedReturnValue();
    font = v9->_font;
    v9->_font = (UIFont *)v18;

  }
  return v9;
}

+ (id)mediumDateFormatter
{
  if (qword_1ED06C6F0 != -1)
    dispatch_once(&qword_1ED06C6F0, &__block_literal_global_71);
  return (id)_MergedGlobals_673;
}

uint64_t __69__PKPayLaterFinancingPlanPaymentScheduleComposer_mediumDateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_673;
  _MergedGlobals_673 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_673;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCalendar:", v3);

  objc_msgSend((id)_MergedGlobals_673, "setDateStyle:", 2);
  return objc_msgSend((id)_MergedGlobals_673, "setTimeStyle:", 0);
}

+ (id)shortDateFormatter
{
  if (qword_1ED06C700 != -1)
    dispatch_once(&qword_1ED06C700, &__block_literal_global_12);
  return (id)qword_1ED06C6F8;
}

uint64_t __68__PKPayLaterFinancingPlanPaymentScheduleComposer_shortDateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ED06C6F8;
  qword_1ED06C6F8 = (uint64_t)v0;

  v2 = (void *)qword_1ED06C6F8;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCalendar:", v3);

  return objc_msgSend((id)qword_1ED06C6F8, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d"));
}

+ (id)numberFormatter
{
  if (qword_1ED06C710 != -1)
    dispatch_once(&qword_1ED06C710, &__block_literal_global_15);
  return (id)qword_1ED06C708;
}

uint64_t __65__PKPayLaterFinancingPlanPaymentScheduleComposer_numberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)qword_1ED06C708;
  qword_1ED06C708 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED06C708, "setNumberStyle:", 1);
}

+ (id)attributedStringWithText:(id)a3 strikethrough:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v4 = a4;
  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    if (v4)
    {
      v9 = *MEMORY[0x1E0DC11A8];
      v10[0] = &unk_1E3FAD078;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)composeFinancingPlanPaymentScheduleLineItemsForPlan:(id)a3 payLaterAccount:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v11;
  PKPayLaterFinancingPlanPaymentScheduleComposerItemList *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_msgSend(v6, "state");
  if ((unint64_t)(v9 - 1) < 4 || v9 == 6)
  {
    v12 = -[PKPayLaterFinancingPlanPaymentScheduleComposerItemList initWithFinancingPlan:]([PKPayLaterFinancingPlanPaymentScheduleComposerItemList alloc], "initWithFinancingPlan:", v6);
    if (v12)
    {
      -[PKPayLaterFinancingPlanPaymentScheduleComposer _formRowsWithList:financingPlan:payLaterAccount:](self, "_formRowsWithList:financingPlan:payLaterAccount:", v12, v6, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v11);

    }
  }
  else
  {
    v12 = 0;
  }
  -[PKPayLaterFinancingPlanPaymentScheduleComposer _updateRowConnectorsForRows:](self, "_updateRowConnectorsForRows:", v8);
  PKLogFacilityTypeGetObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "planIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterFinancingPlanPaymentScheduleComposerItemList items](v12, "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v14;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Payment schedule rows for plan %@: %@", (uint8_t *)&v18, 0x16u);

  }
  v16 = (void *)objc_msgSend(v8, "copy");

  return v16;
}

+ (id)detailTextForPayment:(id)a3 financingPlan:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = 0;
  switch(objc_msgSend(v6, "type"))
  {
    case 1:
      objc_msgSend(a1, "_detailTextForPaymentWithPaymentType:financingPlan:", v6, v7);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      objc_msgSend(a1, "_detailTextForPaymentWithTemporaryCreditType:financingPlan:", v6, v7);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend(v7, "disputes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __85__PKPayLaterFinancingPlanPaymentScheduleComposer_detailTextForPayment_financingPlan___block_invoke;
      v14[3] = &unk_1E3E6A4B8;
      v11 = v6;
      v15 = v11;
      v12 = objc_msgSend(v10, "pk_containsObjectPassingTest:", v14);

      if (v12)
        objc_msgSend(a1, "_detailTextForPaymentWithDisputeCreditType:financingPlan:", v11, v7);
      else
        objc_msgSend(a1, "_detailTextForPaymentWithRefundType:financingPlan:", v11, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 4:
      objc_msgSend(a1, "_detailTextForPaymentWithCreditRevokedType:financingPlan:", v6, v7);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 6:
      objc_msgSend(a1, "_detailTextForPaymentWithRefundRevokedType:financingPlan:", v6, v7);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 7:
      objc_msgSend(a1, "_detailTextForPaymentWithAdjustmentType:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v8 = (void *)v9;
      break;
    default:
      break;
  }

  return v8;
}

uint64_t __85__PKPayLaterFinancingPlanPaymentScheduleComposer_detailTextForPayment_financingPlan___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "appliedPayments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__PKPayLaterFinancingPlanPaymentScheduleComposer_detailTextForPayment_financingPlan___block_invoke_2;
  v6[3] = &unk_1E3E6A490;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __85__PKPayLaterFinancingPlanPaymentScheduleComposer_detailTextForPayment_financingPlan___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "paymentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "paymentIdentifier");
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

+ (id)_detailTextForPaymentWithPaymentType:(id)a3 financingPlan:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "_scheduleComposerDetailTypeForPayment:financingPlan:", v6, v7);
  objc_msgSend(v7, "scheduleSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "paymentIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "amount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "formattedStringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fundingSources");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "panSuffix");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "refundAmount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "amount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "pk_isPositiveNumber"))
  {
    objc_msgSend(v14, "refundAmount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  objc_msgSend(v17, "formattedStringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v10;
  objc_msgSend(v9, "firstInstallmentIdentifierAffectedByPaymentIdentifier:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paymentIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currencyAmountOfPaymentIdentifierAffectingOtherInstallments:relativeInstallmentIdentifier:installmentsAreInOrder:countOfInstallments:", v20, v19, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "formattedStringValue");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  switch(v8)
  {
    case 1:
    case 6:
      v29 = v12;
      v24 = CFSTR("INSTALLMENT_PAYMENT_APPLIED_ONE_INSTALLMENT_PAYMENT");
      goto LABEL_10;
    case 2:
    case 7:
      v30 = v12;
      v32 = v18;
      v25 = CFSTR("INSTALLMENT_PAYMENT_APPLIED_ONE_INSTALLMENT_CREDIT_NO_FUNDING_SOURCE_PAYMENT");
      goto LABEL_13;
    case 3:
    case 8:
      v33 = v18;
      v34 = v36;
      v31 = v12;
      v26 = CFSTR("INSTALLMENT_PAYMENT_APPLIED_ONE_INSTALLMENT_CREDIT_WITH_FUNDING_SOURCE_PAYMENT");
      goto LABEL_15;
    case 4:
      v29 = v12;
      v24 = CFSTR("INSTALLMENT_PAYMENT_CREDIT_NO_FUNDING_SOURCE_PAYMENT");
LABEL_10:
      PKLocalizedCocoonString(&v24->isa, CFSTR("%@"), v29);
      goto LABEL_17;
    case 5:
      v30 = v12;
      v32 = v36;
      v25 = CFSTR("INSTALLMENT_PAYMENT_CREDIT_WITH_FUNDING_SOURCE_PAYMENT");
      goto LABEL_13;
    case 9:
      v30 = v12;
      v32 = (void *)v22;
      v25 = CFSTR("INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_PAYMENT");
LABEL_13:
      PKLocalizedCocoonString(&v25->isa, CFSTR("%1$@%2$@"), v30, v32);
      goto LABEL_17;
    case 10:
      v33 = (void *)v22;
      v34 = v18;
      v31 = v12;
      v26 = CFSTR("INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_CREDIT_NO_FUNDING_SOURCE_PAYMENT");
LABEL_15:
      PKLocalizedCocoonString(&v26->isa, CFSTR("%1$@%2$@%3$@"), v31, v33, v34);
      goto LABEL_17;
    case 11:
      PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_CREDIT_WITH_FUNDING_SOURCE_PAYMENT"), CFSTR("%1$@%2$@%3$@%4$@"), v12, v22, v18, v36);
LABEL_17:
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v27 = 0;
      break;
  }

  return v27;
}

+ (id)_detailTextForPaymentWithCreditRevokedType:(id)a3 financingPlan:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = objc_msgSend(a1, "_scheduleComposerDetailTypeForPayment:financingPlan:", v6, a4);
  objc_msgSend(v6, "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "absoluteValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "formattedStringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v7 <= 0xB && ((1 << v7) & 0xFCE) != 0)
  {
    PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_APPLIED_CREDIT_REVOKED"), CFSTR("%@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)_detailTextForPaymentWithRefundRevokedType:(id)a3 financingPlan:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formattedStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_APPLIED_REFUND_REVOKED"), CFSTR("%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_detailTextForPaymentWithTemporaryCreditType:(id)a3 financingPlan:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;

  v6 = a3;
  v7 = objc_msgSend(a1, "_scheduleComposerDetailTypeForPayment:financingPlan:", v6, a4);
  objc_msgSend(v6, "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "formattedStringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fundingSources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "panSuffix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "refundAmount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "amount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "pk_isPositiveNumber"))
  {
    objc_msgSend(v11, "refundAmount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  objc_msgSend(v15, "formattedStringValue");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  switch(v7)
  {
    case 1:
      v22 = v9;
      v18 = CFSTR("INSTALLMENT_PAYMENT_APPLIED_LAST_PAYMENT_TEMPORARY_CREDIT");
      goto LABEL_13;
    case 2:
      v23 = v9;
      v24 = (void *)v16;
      v19 = CFSTR("INSTALLMENT_PAYMENT_APPLIED_LAST_PAYMENT_CREDIT_NO_FUNDING_SOURCE_TEMPORARY_CREDIT");
      goto LABEL_15;
    case 3:
      PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_APPLIED_LAST_PAYMENT_CREDIT_WITH_FUNDING_SOURCE_TEMPORARY_CREDIT"), CFSTR("%1$@%2$@%3$@$@"), v9, v16, v12);
      goto LABEL_16;
    case 4:
      v22 = v9;
      v18 = CFSTR("INSTALLMENT_PAYMENT_CREDIT_NO_FUNDING_SOURCE_TEMPORARY_CREDIT");
      goto LABEL_13;
    case 5:
      v23 = v9;
      v24 = v12;
      v19 = CFSTR("INSTALLMENT_PAYMENT_CREDIT_WITH_FUNDING_SOURCE_TEMPORARY_CREDIT");
      goto LABEL_15;
    case 6:
    case 9:
      v22 = v9;
      v18 = CFSTR("INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_TEMPORARY_CREDIT");
LABEL_13:
      PKLocalizedCocoonString(&v18->isa, CFSTR("%@"), v22);
      goto LABEL_16;
    case 7:
    case 10:
      v23 = v9;
      v24 = (void *)v16;
      v19 = CFSTR("INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_CREDIT_NO_FUNDING_SOURCE_TEMPORARY_CREDIT");
LABEL_15:
      PKLocalizedCocoonString(&v19->isa, CFSTR("%1$@%2$@"), v23, v24);
      goto LABEL_16;
    case 8:
    case 11:
      PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_CREDIT_WITH_FUNDING_SOURCE_TEMPORARY_CREDIT"), CFSTR("%1$@%2$@%3$@"), v9, v16, v12);
LABEL_16:
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v20 = 0;
      break;
  }

  return v20;
}

+ (id)_detailTextForPaymentWithDisputeCreditType:(id)a3 financingPlan:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;

  v6 = a3;
  v7 = objc_msgSend(a1, "_scheduleComposerDetailTypeForPayment:financingPlan:", v6, a4);
  objc_msgSend(v6, "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "formattedStringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fundingSources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "panSuffix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "refundAmount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "amount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "pk_isPositiveNumber"))
  {
    objc_msgSend(v11, "refundAmount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  objc_msgSend(v15, "formattedStringValue");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  switch(v7)
  {
    case 1:
      v22 = v9;
      v18 = CFSTR("INSTALLMENT_PAYMENT_APPLIED_LAST_PAYMENT_DISPUTE_CREDIT");
      goto LABEL_13;
    case 2:
      v23 = v9;
      v24 = (void *)v16;
      v19 = CFSTR("INSTALLMENT_PAYMENT_APPLIED_LAST_PAYMENT_CREDIT_NO_FUNDING_SOURCE_DISPUTE_CREDIT");
      goto LABEL_15;
    case 3:
      PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_APPLIED_LAST_PAYMENT_CREDIT_WITH_FUNDING_SOURCE_DISPUTE_CREDIT"), CFSTR("%1$@%2$@%3$@$@"), v9, v16, v12);
      goto LABEL_16;
    case 4:
      v22 = v9;
      v18 = CFSTR("INSTALLMENT_PAYMENT_CREDIT_NO_FUNDING_SOURCE_DISPUTE_CREDIT");
      goto LABEL_13;
    case 5:
      v23 = v9;
      v24 = v12;
      v19 = CFSTR("INSTALLMENT_PAYMENT_CREDIT_WITH_FUNDING_SOURCE_DISPUTE_CREDIT");
      goto LABEL_15;
    case 6:
    case 9:
      v22 = v9;
      v18 = CFSTR("INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_DISPUTE_CREDIT");
LABEL_13:
      PKLocalizedCocoonString(&v18->isa, CFSTR("%@"), v22);
      goto LABEL_16;
    case 7:
    case 10:
      v23 = v9;
      v24 = (void *)v16;
      v19 = CFSTR("INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_CREDIT_NO_FUNDING_SOURCE_DISPUTE_CREDIT");
LABEL_15:
      PKLocalizedCocoonString(&v19->isa, CFSTR("%1$@%2$@"), v23, v24);
      goto LABEL_16;
    case 8:
    case 11:
      PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_CREDIT_WITH_FUNDING_SOURCE_DISPUTE_CREDIT"), CFSTR("%1$@%2$@%3$@"), v9, v16, v12);
LABEL_16:
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v20 = 0;
      break;
  }

  return v20;
}

+ (id)_detailTextForPaymentWithRefundType:(id)a3 financingPlan:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  _QWORD v32[4];
  id v33;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "subtype") == 1)
  {
    objc_msgSend(a1, "_detailTextForPaymentWithRefundCreditType:financingPlan:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_msgSend(a1, "_scheduleComposerDetailTypeForPayment:financingPlan:", v6, v7);
    objc_msgSend(v6, "amount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "formattedStringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "fundingSources");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    switch(v9)
    {
      case 1:
        PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_APPLIED_LAST_PAYMENT_REFUND"), CFSTR("%@"), v12);
        goto LABEL_13;
      case 2:
      case 3:
        objc_msgSend(v6, "paymentIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "scheduleSummary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "installmentsAffectedByPaymentIdentifier:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "lastObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "appliedPayments");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __100__PKPayLaterFinancingPlanPaymentScheduleComposer__detailTextForPaymentWithRefundType_financingPlan___block_invoke;
        v32[3] = &unk_1E3E6A490;
        v33 = v19;
        v31 = v19;
        objc_msgSend(v23, "pk_firstObjectPassingTest:", v32);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "fundingSources");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "amountApplied");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_detailTextForRefundFundingSources:appliedPaymentAmount:isAppliedToFinalPayment:", v25, v26, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_REFUND_FORMAT"), CFSTR("%1$@%2$@"), v12, v27);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      case 4:
        PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_CREDIT_NO_FUNDING_SOURCE_REFUND"), CFSTR("%@"), v12);
        goto LABEL_13;
      case 5:
        if ((unint64_t)objc_msgSend(v13, "count") < 2)
        {
          objc_msgSend(v14, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "unmaskedPanSuffix");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_CREDIT_WITH_FUNDING_SOURCE_REFUND"), CFSTR("%1$@%2$@"), v12, v29);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
        }
        else
        {
          objc_msgSend(v6, "fundingSources");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_detailTextForRefundFundingSources:appliedPaymentAmount:isAppliedToFinalPayment:", v28, 0, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_REFUND_FORMAT"), CFSTR("%1$@%2$@"), v12, v16);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

        }
LABEL_16:

        break;
      case 6:
      case 9:
        PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_REFUND"), CFSTR("%@"), v12);
LABEL_13:
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 7:
      case 8:
      case 10:
      case 11:
        objc_msgSend(v6, "paymentIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_amountAppliedToInstallmentsWithPaymentIdentifier:financingPlan:", v15, v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "fundingSources");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_detailTextForRefundFundingSources:appliedPaymentAmount:isAppliedToFinalPayment:", v17, v16, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_REFUND_FORMAT"), CFSTR("%1$@%2$@"), v12, v18);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_5;
      default:
        v8 = 0;
        goto LABEL_16;
    }
  }

  return v8;
}

uint64_t __100__PKPayLaterFinancingPlanPaymentScheduleComposer__detailTextForPaymentWithRefundType_financingPlan___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "paymentIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKEqualObjects();

  return v3;
}

+ (id)_detailTextForPaymentWithRefundCreditType:(id)a3 financingPlan:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  _QWORD v36[4];
  id v37;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "_scheduleComposerDetailTypeForPayment:financingPlan:", v6, v7);
  objc_msgSend(v6, "amount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "formattedStringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fundingSources");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "unmaskedPanSuffix");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "refundAmount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "amount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "pk_isPositiveNumber"))
  {
    objc_msgSend(v13, "refundAmount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  objc_msgSend(v17, "formattedStringValue");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  switch(v8)
  {
    case 1:
      v30 = v11;
      v20 = CFSTR("INSTALLMENT_PAYMENT_APPLIED_LAST_PAYMENT_REFUND_CREDIT");
      goto LABEL_13;
    case 2:
      objc_msgSend(v6, "paymentIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scheduleSummary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "installmentsAffectedByPaymentIdentifier:", v23);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "lastObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "appliedPayments");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __106__PKPayLaterFinancingPlanPaymentScheduleComposer__detailTextForPaymentWithRefundCreditType_financingPlan___block_invoke;
      v36[3] = &unk_1E3E6A490;
      v37 = v23;
      v34 = v23;
      objc_msgSend(v26, "pk_firstObjectPassingTest:", v36);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "amountApplied");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "formattedStringValue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_APPLIED_LAST_PAYMENT_CREDIT_NO_FUNDING_SOURCE_REFUND_CREDIT"), CFSTR("%1$@%2$@%3$@$@"), v11, v28, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 3:
      PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_APPLIED_LAST_PAYMENT_CREDIT_WITH_FUNDING_SOURCE_REFUND_CREDIT"), CFSTR("%1$@%2$@%3$@$@"), v11, v18, v14);
      goto LABEL_16;
    case 4:
      v30 = v11;
      v20 = CFSTR("INSTALLMENT_PAYMENT_CREDIT_NO_FUNDING_SOURCE_REFUND_CREDIT");
      goto LABEL_13;
    case 5:
      v31 = v11;
      v32 = v14;
      v21 = CFSTR("INSTALLMENT_PAYMENT_CREDIT_WITH_FUNDING_SOURCE_REFUND_CREDIT");
      goto LABEL_15;
    case 6:
    case 9:
      v30 = v11;
      v20 = CFSTR("INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_REFUND_CREDIT");
LABEL_13:
      PKLocalizedCocoonString(&v20->isa, CFSTR("%@"), v30);
      goto LABEL_16;
    case 7:
    case 10:
      v31 = v11;
      v32 = (void *)v18;
      v21 = CFSTR("INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_CREDIT_NO_FUNDING_SOURCE_REFUND_CREDIT");
LABEL_15:
      PKLocalizedCocoonString(&v21->isa, CFSTR("%1$@%2$@"), v31, v32);
      goto LABEL_16;
    case 8:
    case 11:
      PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_CREDIT_WITH_FUNDING_SOURCE_REFUND_CREDIT"), CFSTR("%1$@%2$@%3$@"), v11, v18, v14);
LABEL_16:
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v22 = 0;
      break;
  }

  return v22;
}

uint64_t __106__PKPayLaterFinancingPlanPaymentScheduleComposer__detailTextForPaymentWithRefundCreditType_financingPlan___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "paymentIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKEqualObjects();

  return v3;
}

+ (id)_detailTextForRefundFundingSources:(id)a3 appliedPaymentAmount:(id)a4 isAppliedToFinalPayment:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v5 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v8)
  {
    objc_msgSend(v8, "formattedStringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v11 = CFSTR("INSTALLMENT_PAYMENT_FUNDING_SOURCE_APPLIED_LAST_PAYMENT_REFUND");
    else
      v11 = CFSTR("INSTALLMENT_PAYMENT_FUNDING_SOURCE_APPLIED_REMAINING_PAYMENTS_REFUND");
    PKLocalizedCocoonString(&v11->isa, CFSTR("%1$@"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v12);

  }
  v31 = v8;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v17);
        objc_msgSend(v18, "unmaskedPanSuffix");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "displayName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "refundAmount");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "formattedStringValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          if (v19)
          {
            v28 = v22;
            v30 = v19;
            v23 = CFSTR("INSTALLMENT_PAYMENT_FUNDING_SOURCE_CARD_SUFFIX_REFUND");
            goto LABEL_16;
          }
          if (v20)
          {
            v28 = v22;
            v30 = v20;
            v23 = CFSTR("INSTALLMENT_PAYMENT_FUNDING_SOURCE_CARD_NAME_REFUND");
LABEL_16:
            PKLocalizedCocoonString(&v23->isa, CFSTR("%1$@%2$@"), v28, v30);
          }
          else
          {
            PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_FUNDING_SOURCE_PAYMENT_METHOD_REFUND"), CFSTR("%1$@"), v22, v29);
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v24);

        }
        ++v17;
      }
      while (v15 != v17);
      v25 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v15 = v25;
    }
    while (v25);
  }

  objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)_amountAppliedToInstallmentsWithPaymentIdentifier:(id)a3 financingPlan:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id obj;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "scheduleSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "installmentsAffectedByPaymentIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "appliedPayments");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __114__PKPayLaterFinancingPlanPaymentScheduleComposer__amountAppliedToInstallmentsWithPaymentIdentifier_financingPlan___block_invoke;
        v20[3] = &unk_1E3E6A490;
        v21 = v5;
        objc_msgSend(v13, "pk_firstObjectPassingTest:", v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "amountApplied");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v10)
        {
          objc_msgSend(v10, "currencyAmountByAddingCurrencyAmount:", v15);
          v17 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v17;
        }
        else
        {
          v10 = (void *)v15;
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __114__PKPayLaterFinancingPlanPaymentScheduleComposer__amountAppliedToInstallmentsWithPaymentIdentifier_financingPlan___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "paymentIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKEqualObjects();

  return v3;
}

+ (id)_detailTextForPaymentWithAdjustmentType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formattedStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "postedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPayLaterFinancingPlanPaymentScheduleComposer shortDateFormatter](PKPayLaterFinancingPlanPaymentScheduleComposer, "shortDateFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "subtype");

  if ((unint64_t)(v10 - 2) > 2)
  {
    v11 = 0;
  }
  else
  {
    PKLocalizedCocoonString(&off_1E3E6A538[v10 - 2]->isa, CFSTR("%@%@"), v6, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (unint64_t)_scheduleComposerDetailTypeForPayment:(id)a3 financingPlan:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v25;
  void *v26;
  void *v27;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "type") != 1)
  {
    objc_msgSend(v5, "paymentIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheduleSummary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fundingSources");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pk_objectsPassingTest:", &__block_literal_global_133);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pk_objectsPassingTest:", &__block_literal_global_134);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v11;
    v25 = objc_msgSend(v11, "count");
    v13 = objc_msgSend(v12, "count");
    v27 = (void *)v8;
    objc_msgSend(v9, "installmentsAffectedByPaymentIdentifier:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "installmentIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v9, "installmentNumberForInstallmentIdentifier:", v16);

    if (objc_msgSend(v14, "count") == 1)
    {
      objc_msgSend(v9, "installments");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19 == v17 + 1)
      {
        v20 = 2;
        if (v25)
          v20 = 3;
        if (v13)
          v7 = v20;
        else
          v7 = 1;
        goto LABEL_25;
      }
    }
    if (objc_msgSend(v14, "count") == 1)
    {
      v21 = 7;
      if (v25)
        v21 = 8;
      v22 = v13 == 0;
      v23 = 6;
    }
    else
    {
      if (!objc_msgSend(v14, "count") && v13)
      {
        if (v25)
          v7 = 5;
        else
          v7 = 4;
        goto LABEL_25;
      }
      v21 = 10;
      if (v25)
        v21 = 11;
      v22 = v13 == 0;
      v23 = 9;
    }
    if (v22)
      v7 = v23;
    else
      v7 = v21;
LABEL_25:

    goto LABEL_26;
  }
  v7 = 0;
LABEL_26:

  return v7;
}

BOOL __102__PKPayLaterFinancingPlanPaymentScheduleComposer__scheduleComposerDetailTypeForPayment_financingPlan___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "panSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pk_stringIfNotEmpty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

uint64_t __102__PKPayLaterFinancingPlanPaymentScheduleComposer__scheduleComposerDetailTypeForPayment_financingPlan___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "refundAmount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pk_isPositiveNumber");

  return v4;
}

- (id)_formRowsWithList:(id)a3 financingPlan:(id)a4 payLaterAccount:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = v8;
  objc_msgSend(v8, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v13 = 0;
    do
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterFinancingPlanPaymentScheduleComposer _paymentForItem:](self, "_paymentForItem:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterFinancingPlanPaymentScheduleComposer _commonRowWithRowIndex:](self, "_commonRowWithRowIndex:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "populateRow:", v16);
      objc_msgSend(v16, "primaryText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        if (objc_msgSend(v16, "showChevron"))
        {
          -[PKPayLaterFinancingPlanPaymentScheduleComposer _selectionBlockForPayment:financingPlan:payLaterAccount:](self, "_selectionBlockForPayment:financingPlan:payLaterAccount:", v15, v9, v10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setSelectionHandler:", v18);

        }
        objc_msgSend(v11, "addObject:", v16);
      }

      ++v13;
    }
    while (v13 < objc_msgSend(v12, "count"));
  }
  v19 = (void *)objc_msgSend(v11, "copy");

  return v19;
}

- (id)_paymentForItem:(id)a3
{
  id v3;
  unint64_t v4;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  if (v4 > 4 || ((1 << v4) & 0x1A) == 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "payment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)_updateRowConnectorsForRows:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  PKGradientVerticalConnector *v16;
  PKGradientVerticalConnector *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  PKGradientVerticalConnector *v39;
  void *v40;
  void *v41;
  PKGradientVerticalConnector *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PKPayLaterPaymentScheduleVerticalConnectorGreenColor();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  PKPayLaterPaymentScheduleOrangeColor();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v50;
LABEL_3:
    v9 = v4;
    v10 = 0;
    while (2)
    {
      v11 = v7;
      if (*(_QWORD *)v50 != v8)
        objc_enumerationMutation(v9);
      v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v10);
      v13 = 0;
      v14 = 0;
      switch(objc_msgSend(v12, "targetType"))
      {
        case 0:
        case 6:
          objc_msgSend(v11, "setBottomConnector:", 0);
          v13 = 0;
          v14 = 0;
          if (v11)
            goto LABEL_16;
          goto LABEL_17;
        case 1:
          goto LABEL_15;
        case 2:
          v15 = v47;
          goto LABEL_14;
        case 3:
        case 4:
          v14 = v48;
          v13 = v47;
          if (!v11)
            goto LABEL_17;
          goto LABEL_16;
        case 5:
          v15 = v48;
          goto LABEL_14;
        case 7:
          v15 = v46;
LABEL_14:
          v13 = v15;
          v14 = v13;
LABEL_15:
          if (v11)
            goto LABEL_16;
          goto LABEL_17;
        default:
          v14 = 0;
          if (!v11)
            goto LABEL_17;
LABEL_16:
          if (objc_msgSend(v11, "targetType"))
          {
LABEL_17:
            v16 = 0;
            if (v14 && v13)
            {
              v17 = -[PKGradientVerticalConnector initWithTopGradientColor:bottomGradientColor:]([PKGradientVerticalConnector alloc], "initWithTopGradientColor:bottomGradientColor:", v14, v14);
              v16 = -[PKGradientVerticalConnector initWithTopGradientColor:bottomGradientColor:]([PKGradientVerticalConnector alloc], "initWithTopGradientColor:bottomGradientColor:", v13, v13);
            }
            else
            {
              v17 = 0;
            }
          }
          else
          {

            v14 = 0;
            v16 = 0;
            v17 = 0;
          }
          objc_msgSend(v12, "setTopConnector:", v17);
          objc_msgSend(v12, "setBottomConnector:", v16);
          v7 = v12;

          if (v6 != ++v10)
            continue;
          v4 = v9;
          v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
          v6 = v18;
          if (v18)
            goto LABEL_3;

          break;
      }
      break;
    }
  }

  if (objc_msgSend(v4, "count"))
  {
    v19 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v19 + 1;
      if (v19 + 1 >= objc_msgSend(v4, "count"))
      {
        v21 = 0;
        if (!v19)
        {
LABEL_34:
          v22 = 0;
          goto LABEL_35;
        }
      }
      else
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v45);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
          goto LABEL_34;
      }
      objc_msgSend(v4, "objectAtIndexedSubscript:", v19 - 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:
      objc_msgSend(v20, "topConnector");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bottomConnector");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bottomGradientColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "topGradientColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v22;
      objc_msgSend(v22, "bottomConnector");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bottomGradientColor");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      if (v28)
        v30 = (void *)v28;
      else
        v30 = v26;
      v31 = v30;

      v44 = v21;
      objc_msgSend(v21, "topConnector");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "topGradientColor");
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v33;
      if (v33)
        v35 = (void *)v33;
      else
        v35 = v25;
      v36 = v35;

      if (v25 && v26)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "pkui_blendFromColor:toColor:withProgress:", v31, v26, 0.5);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[PKGradientVerticalConnector initWithTopGradientColor:bottomGradientColor:]([PKGradientVerticalConnector alloc], "initWithTopGradientColor:bottomGradientColor:", v37, v26);

        objc_msgSend(MEMORY[0x1E0DC3658], "pkui_blendFromColor:toColor:withProgress:", v25, v36, 0.5);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[PKGradientVerticalConnector initWithTopGradientColor:bottomGradientColor:]([PKGradientVerticalConnector alloc], "initWithTopGradientColor:bottomGradientColor:", v25, v38);

        v23 = v42;
        v24 = v39;
      }
      objc_msgSend(v20, "setTopConnector:", v23);
      objc_msgSend(v20, "setBottomConnector:", v24);

      v19 = v45;
    }
    while (v45 < objc_msgSend(v4, "count"));
  }
  objc_msgSend(v4, "firstObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTopConnector:", 0);
  objc_msgSend(v4, "lastObject");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setBottomConnector:", 0);

}

- (id)_selectionBlockForPayment:(id)a3 financingPlan:(id)a4 payLaterAccount:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __106__PKPayLaterFinancingPlanPaymentScheduleComposer__selectionBlockForPayment_financingPlan_payLaterAccount___block_invoke;
  v16[3] = &unk_1E3E62460;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  v14 = _Block_copy(v16);

  return v14;
}

void __106__PKPayLaterFinancingPlanPaymentScheduleComposer__selectionBlockForPayment_financingPlan_payLaterAccount___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  PKPayLaterFinancingPlanPaymentViewController *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  PKPayLaterFinancingPlanPaymentViewController *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  v14 = *MEMORY[0x1E0D68858];
  v15[0] = *MEMORY[0x1E0D68890];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reportAnalyticsEvent:", v3);

  v4 = [PKPayLaterFinancingPlanPaymentViewController alloc];
  v5 = a1[6];
  v6 = a1[7];
  v7 = a1[5];
  v8 = objc_loadWeakRetained((id *)(a1[4] + 32));
  objc_msgSend(v8, "paymentIntentController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained((id *)(a1[4] + 32));
  objc_msgSend(v10, "merchantIcon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKPayLaterFinancingPlanPaymentViewController initWithFinancingPlan:payment:payLaterAccount:paymentIntentController:merchantIcon:](v4, "initWithFinancingPlan:payment:payLaterAccount:paymentIntentController:merchantIcon:", v7, v5, v6, v9, v11);

  v13 = objc_loadWeakRetained((id *)(a1[4] + 24));
  objc_msgSend(v13, "pushViewController:animated:", v12, 1);

}

- (id)_commonRowWithRowIndex:(int64_t)a3
{
  PKPayLaterProgressRow *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[PKPayLaterProgressRow initWithRowIndex:selectionHandler:]([PKPayLaterProgressRow alloc], "initWithRowIndex:selectionHandler:", a3, 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterProgressRow setSecondaryTextColor:](v4, "setSecondaryTextColor:", v5);

  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)*MEMORY[0x1E0DC48D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterProgressRow setSecondaryFont:](v4, "setSecondaryFont:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterProgressRow setTertiaryTextColor:](v4, "setTertiaryTextColor:", v7);

  -[PKPayLaterProgressRow setPrimaryFont:](v4, "setPrimaryFont:", self->_font);
  -[PKPayLaterProgressRow setAmountFont:](v4, "setAmountFont:", self->_font);
  -[PKPayLaterProgressRow setMinimumHeight:](v4, "setMinimumHeight:", self->_minimumCellHeight);
  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_font, 0);
}

@end

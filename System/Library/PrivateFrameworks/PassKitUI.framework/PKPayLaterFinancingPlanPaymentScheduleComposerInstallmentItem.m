@implementation PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem

- (PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem)initWithFinancingPlan:(id)a3 installment:(id)a4
{
  id v7;
  id v8;
  PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem *v9;
  PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem;
  v9 = -[PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_financingPlan, a3);
    objc_storeStrong((id *)&v10->_installment, a4);
  }

  return v10;
}

- (void)populateRow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  id v50;

  v50 = a3;
  -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextDueInstallment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayLaterInstallment installmentIdentifier](self->_installment, "installmentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPayLaterFinancingPlanPaymentScheduleComposer mediumDateFormatter](PKPayLaterFinancingPlanPaymentScheduleComposer, "mediumDateFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterInstallment dueDate](self->_installment, "dueDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "primaryTextColor");
  v10 = objc_claimAutoreleasedReturnValue();
  -[PKPayLaterInstallment currentBalance](self->_installment, "currentBalance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "formattedStringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:strikethrough:](PKPayLaterFinancingPlanPaymentScheduleComposer, "attributedStringWithText:strikethrough:", v12, 0);
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "amountTextColor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "secondaryTextColor");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "installmentIdentifier");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v6;
  v46 = (void *)v13;
  v49 = (void *)v14;
  if (v15 == v16)
  {
    v18 = (void *)v10;
    v19 = v5;
    v17 = 1;
  }
  else
  {
    v17 = 0;
    v18 = (void *)v10;
    v19 = v5;
    if (v16 && v15)
      v17 = objc_msgSend(v15, "isEqualToString:", v16);
  }
  v47 = v17;

  -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "installments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "installmentIdentifier");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = v16;
  v25 = v24;
  if (v23 == v24)
  {
    v26 = 1;
  }
  else
  {
    v26 = 0;
    if (v24 && v23)
      v26 = objc_msgSend(v23, "isEqualToString:", v24);
  }

  v27 = -[PKPayLaterInstallment status](self->_installment, "status");
  if (v27 == 4)
  {
    PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_PAST_DUE"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v33 = v49;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v9;
    v30 = v19;
  }
  else
  {
    if (v27 != 1
      || (v28 = -[PKPayLaterInstallment interval](self->_installment, "interval"),
          -[PKPayLaterFinancingPlan state](self->_financingPlan, "state"),
          !PKPayLaterFinancingPlanStateIsPending()))
    {
      v31 = 0;
      v30 = v19;
      v32 = v46;
      goto LABEL_23;
    }
    PKLocalizedCocoonString(CFSTR("IN_NUMBER_WEEKS"), CFSTR("%ld"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v19;
    if (v26)
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;

    v35 = v34;
    v48 = v35;
    if (v26)
    {

      -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v33, "installmentNumberForInstallmentIdentifier:", v25);
      objc_msgSend(v33, "installments");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v35;
      v38 = objc_msgSend(v37, "count");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v36 + 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCocoonString(CFSTR("PLAN_PAYMENT_NUMBER"), CFSTR("%@%@"), v39, v40);
      v41 = objc_claimAutoreleasedReturnValue();

      PKLocalizedCocoonString(CFSTR("PLAN_PENDING_MERCHANT_PROCESSING"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)v41;
    }
    else
    {
      v31 = 0;
      v18 = v35;
    }
  }
  v32 = v46;

  v9 = v29;
LABEL_23:
  objc_msgSend(v9, "pk_attributedString");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setPrimaryText:", v42);

  if ((v47 & 1) != 0)
  {
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 3;
  }
  else
  {
    objc_msgSend(v50, "primaryFont");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 2;
  }
  objc_msgSend(v50, "setPrimaryFont:", v43);

  objc_msgSend(v50, "setPrimaryTextColor:", v18);
  objc_msgSend(v31, "pk_attributedString");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setSecondaryText:", v45);

  objc_msgSend(v50, "setSecondaryTextColor:", v49);
  objc_msgSend(v50, "setAmountText:", v32);
  objc_msgSend(v50, "setAmountTextColor:", v48);
  objc_msgSend(v50, "setTargetType:", v44);

}

- (unint64_t)type
{
  return 2;
}

- (id)installmentIdentifier
{
  return (id)-[PKPayLaterInstallment installmentIdentifier](self->_installment, "installmentIdentifier");
}

- (id)paymentIdentifier
{
  return 0;
}

- (id)date
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[PKPayLaterInstallment status](self->_installment, "status") != 4)
    goto LABEL_5;
  -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterInstallment dueDate](self->_installment, "dueDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentsAfterInstallmentDueDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

LABEL_5:
    -[PKPayLaterInstallment dueDate](self->_installment, "dueDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    return v9;
  }
  v7 = v6;
  objc_msgSend(v6, "postedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<installmentItem; "));
  -[PKPayLaterInstallment installmentIdentifier](self->_installment, "installmentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentIdentifier: '%@'; "), v4);

  -[PKPayLaterInstallment dueDate](self->_installment, "dueDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("dueDate: '%@'; "), v5);

  -[PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("date: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (PKPayLaterInstallment)installment
{
  return self->_installment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end

@implementation PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem

- (PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem)initWithFinancingPlan:(id)a3 payment:(id)a4
{
  id v7;
  id v8;
  PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem *v9;
  PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem;
  v9 = -[PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_financingPlan, a3);
    objc_storeStrong((id *)&v10->_payment, a4);
  }

  return v10;
}

- (void)populateRow:(id)a3
{
  PKPayLaterPayment *payment;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  const __CFString *v26;
  char v27;
  BOOL v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[5];

  payment = self->_payment;
  v5 = a3;
  -[PKPayLaterPayment amount](payment, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formattedStringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayLaterPayment postedDate](self->_payment, "postedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPayLaterFinancingPlanPaymentScheduleComposer shortDateFormatter](PKPayLaterFinancingPlanPaymentScheduleComposer, "shortDateFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 5;
  v13 = -[PKPayLaterPayment type](self->_payment, "type") - 1;
  v14 = 0;
  v15 = 0;
  switch(v13)
  {
    case 0:
      PKLocalizedCocoonString(CFSTR("PARTIAL_PAYMENT"));
      v44 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringFromDate:", v8);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAID_DATE"), CFSTR("%@"), v35);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:strikethrough:](PKPayLaterFinancingPlanPaymentScheduleComposer, "attributedStringWithText:strikethrough:", v7, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v44;
      v12 = 5;
      goto LABEL_32;
    case 1:
    case 2:
    case 3:
    case 5:
      v42 = v10;
      v16 = v9;
      v17 = v8;
      v18 = v7;
      -[PKPayLaterFinancingPlan disputes](self->_financingPlan, "disputes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __73__PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem_populateRow___block_invoke;
      v46[3] = &unk_1E3E6A4B8;
      v46[4] = self;
      v20 = objc_msgSend(v19, "pk_containsObjectPassingTest:", v46);

      v21 = -[PKPayLaterPayment type](self->_payment, "type");
      v22 = -[PKPayLaterPayment type](self->_payment, "type");
      v23 = -[PKPayLaterPayment type](self->_payment, "type");
      v24 = -[PKPayLaterPayment type](self->_payment, "type");
      PKLocalizedCocoonString(CFSTR("PAYMENT_REFUND"));
      v43 = (id)objc_claimAutoreleasedReturnValue();
      if (v21 == 2)
      {
        v25 = CFSTR("TEMPORARY_CREDIT");
        v12 = 5;
LABEL_21:
        PKLocalizedCocoonString(&v25->isa);
        v29 = objc_claimAutoreleasedReturnValue();

        v43 = (id)v29;
        v7 = v18;
        goto LABEL_22;
      }
      v26 = CFSTR("PAYMENT_REFUND_REVOKED");
      if (v20)
        v26 = CFSTR("DISPUTE_CREDIT");
      if (v22 == 4)
        v27 = 1;
      else
        v27 = v20;
      if (v22 == 4)
        v25 = CFSTR("CREDIT_REVOKED");
      else
        v25 = (__CFString *)v26;
      if (v22 == 4)
        v12 = 7;
      else
        v12 = 5;
      if ((v27 & 1) != 0 || v23 == 6)
        goto LABEL_21;
      v28 = v24 == 3;
      v7 = v18;
      if (v28)
      {
        v12 = 5;
        if (-[PKPayLaterPayment subtype](self->_payment, "subtype") == 1)
        {
          v25 = CFSTR("DISPUTE_CREDIT");
          goto LABEL_21;
        }
      }
      else
      {
        v12 = 5;
      }
LABEL_22:
      v8 = v17;
      objc_msgSend(v16, "stringFromDate:", v17);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCocoonString(CFSTR("PAYMENT_ISSUED_DATE"), CFSTR("%@"), v30);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPayLaterPayment amount](self->_payment, "amount");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "amount");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "pk_isPositiveNumber");

      if (v33)
      {
        PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v7);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:strikethrough:](PKPayLaterFinancingPlanPaymentScheduleComposer, "attributedStringWithText:strikethrough:", v34, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:strikethrough:](PKPayLaterFinancingPlanPaymentScheduleComposer, "attributedStringWithText:strikethrough:", v7, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v9 = v16;
      v10 = v42;
      goto LABEL_31;
    case 4:
      goto LABEL_32;
    case 6:
      PKLocalizedCocoonString(CFSTR("LOAN_ADJUSTMENT"));
      v43 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringFromDate:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterPayment amount](self->_payment, "amount");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "amount");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "pk_isPositiveNumber");

      if (v38)
      {
        PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v7);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:strikethrough:](PKPayLaterFinancingPlanPaymentScheduleComposer, "attributedStringWithText:strikethrough:", v39, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:strikethrough:](PKPayLaterFinancingPlanPaymentScheduleComposer, "attributedStringWithText:strikethrough:", v7, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v12 = 5;
LABEL_31:
      v15 = v43;
      goto LABEL_32;
    default:
      v14 = 0;
      v15 = 0;
LABEL_32:
      v45 = v15;
      objc_msgSend(v15, "pk_attributedString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPrimaryText:", v40);

      objc_msgSend(v14, "pk_attributedString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSecondaryText:", v41);

      objc_msgSend(v5, "setAmountText:", v11);
      objc_msgSend(v5, "setAmountTextColor:", v10);
      objc_msgSend(v5, "setTargetType:", v12);
      objc_msgSend(v5, "setShowChevron:", 1);

      return;
  }
}

uint64_t __73__PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem_populateRow___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  objc_msgSend(a2, "appliedPayments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem_populateRow___block_invoke_2;
  v6[3] = &unk_1E3E6A490;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __73__PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem_populateRow___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "paymentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "paymentIdentifier");
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

- (unint64_t)type
{
  return 1;
}

- (id)installmentIdentifier
{
  return 0;
}

- (id)paymentIdentifier
{
  return (id)-[PKPayLaterPayment paymentIdentifier](self->_payment, "paymentIdentifier");
}

- (id)date
{
  return (id)-[PKPayLaterPayment postedDate](self->_payment, "postedDate");
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<paymentItem; "));
  -[PKPayLaterPayment paymentIdentifier](self->_payment, "paymentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentIdentifier: '%@'; "), v4);

  -[PKPayLaterPayment amount](self->_payment, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formattedStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("amount: '%@'; "), v6);

  -[PKPayLaterPayment postedDate](self->_payment, "postedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("postedDate: '%@'; "), v7);

  -[PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("date: '%@'; "), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (PKPayLaterPayment)payment
{
  return self->_payment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end

@implementation PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem

- (PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem)initWithFinancingPlan:(id)a3 installment:(id)a4 payment:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem *v12;
  PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem;
  v12 = -[PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_financingPlan, a3);
    objc_storeStrong((id *)&v13->_installment, a4);
    objc_storeStrong((id *)&v13->_payment, a5);
  }

  return v13;
}

- (void)populateRow:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  int v17;
  void *v18;
  PKPayLaterPayment *payment;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  int v26;
  _BOOL4 v27;
  unint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  unsigned int v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[4];
  id v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "installments");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v74, "count");
  -[PKPayLaterInstallment installmentIdentifier](self->_installment, "installmentIdentifier");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterPayment paymentIdentifier](self->_payment, "paymentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPayLaterFinancingPlanPaymentScheduleComposer mediumDateFormatter](PKPayLaterFinancingPlanPaymentScheduleComposer, "mediumDateFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterInstallment dueDate](self->_installment, "dueDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = v9;
  objc_msgSend(v9, "pk_attributedString");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryTextColor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "installmentsAffectedByPaymentIdentifier:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = v11;
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterPayment postedDate](self->_payment, "postedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v12;
  objc_msgSend(v12, "dueDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "compare:", v14);

  if (self->_payment)
  {
    v16 = -[PKPayLaterFinancingPlan installmentWasPaidEarly:](self->_financingPlan, "installmentWasPaidEarly:", self->_installment);
    if (v15 == 1)
      v17 = 1;
    else
      v17 = v16;
  }
  else
  {
    v17 = 0;
  }
  +[PKPayLaterFinancingPlanPaymentScheduleComposer shortDateFormatter](PKPayLaterFinancingPlanPaymentScheduleComposer, "shortDateFormatter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  payment = self->_payment;
  v67 = v18;
  if (!payment)
  {
    v76 = 0;
    goto LABEL_34;
  }
  -[PKPayLaterPayment postedDate](payment, "postedDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringFromDate:", v20);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_payment)
  {
    payment = 0;
LABEL_34:
    -[PKPayLaterPayment amount](payment, "amount");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "formattedStringValue");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
    {
      v40 = v38;
    }
    else
    {
      -[PKPayLaterInstallment currentBalance](self->_installment, "currentBalance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "formattedStringValue");
      v40 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[PKPayLaterPayment postedDate](self->_payment, "postedDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterInstallment dueDate](self->_installment, "dueDate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "compare:", v43) == 1)
    {
      -[PKPayLaterInstallment payments](self->_installment, "payments");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v44, "count") == 1)
      {
        v45 = objc_msgSend(v75, "count");

        if (v45 != 1)
          goto LABEL_43;
        -[PKPayLaterInstallment totalAmount](self->_installment, "totalAmount");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "formattedStringValue");
        v43 = v40;
        v40 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {

      }
    }

LABEL_43:
    +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:strikethrough:](PKPayLaterFinancingPlanPaymentScheduleComposer, "attributedStringWithText:strikethrough:", v40, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_payment)
      goto LABEL_46;
    -[PKPayLaterInstallment dueDate](self->_installment, "dueDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    PKDateIgnoringTime();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterPayment postedDate](self->_payment, "postedDate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    PKDateIgnoringTime();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v48, "compare:", v50);

    if (v51)
    {
      PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAID_DATE"), CFSTR("%@"), v76);
      v52 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_46:
      PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAID"));
      v52 = objc_claimAutoreleasedReturnValue();
    }
    v53 = (void *)v52;

    v54 = 1;
    v55 = 5;
    v57 = v68;
    v56 = v70;
    goto LABEL_48;
  }
  objc_msgSend(v77, "firstInstallmentIdentifierAffectedByPaymentIdentifier:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterInstallment installmentIdentifier](self->_installment, "installmentIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21;
  v24 = v22;
  v25 = v24;
  if (v23 == v24)
  {

  }
  else
  {
    if (!v23 || !v24)
    {

LABEL_18:
      v27 = 1;
      goto LABEL_19;
    }
    v26 = objc_msgSend(v23, "isEqualToString:", v24);

    if (!v26)
      goto LABEL_18;
  }
  v27 = -[PKPayLaterPayment type](self->_payment, "type") != 1;
LABEL_19:

  payment = self->_payment;
  if (!payment || (v17 & v27) != 1)
    goto LABEL_34;
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __81__PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem_populateRow___block_invoke;
  v82[3] = &unk_1E3E6FF58;
  v83 = v73;
  v28 = objc_msgSend(v74, "indexOfObjectPassingTest:", v82);
  v29 = 0;
  if (v28 != 0x7FFFFFFFFFFFFFFFLL && v28 < v5 - 1)
  {
    objc_msgSend(v74, "subarrayWithRange:", v28 + 1, v5 - (v28 + 1));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v30 = v29;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v79;
    while (2)
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v79 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        if (!-[PKPayLaterFinancingPlan installmentWasPaidEarly:](self->_financingPlan, "installmentWasPaidEarly:", v35)|| !objc_msgSend(v35, "paymentIdentitiferContributedToInstallment:", v6))
        {
          v36 = 0;
          goto LABEL_54;
        }
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
      v36 = 1;
      if (v32)
        continue;
      break;
    }
  }
  else
  {
    v36 = 1;
  }
LABEL_54:

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v61 = objc_claimAutoreleasedReturnValue();

  -[PKPayLaterInstallment dueDate](self->_installment, "dueDate");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v77, "hasPaymentsOrInstallmentsAfterInstallmentDueDate:", v62);

  if (v63)
    v64 = 5;
  else
    v64 = 0;
  if (v36)
    v55 = v64;
  else
    v55 = 5;
  +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:strikethrough:](PKPayLaterFinancingPlanPaymentScheduleComposer, "attributedStringWithText:strikethrough:", v72, 1);
  v69 = objc_claimAutoreleasedReturnValue();

  -[PKPayLaterInstallment totalAmount](self->_installment, "totalAmount");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "formattedStringValue");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:strikethrough:](PKPayLaterFinancingPlanPaymentScheduleComposer, "attributedStringWithText:strikethrough:", v66, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0;
  v53 = 0;
  v57 = (void *)v61;
  v56 = (void *)v69;
LABEL_48:
  objc_msgSend(v4, "setPrimaryText:", v56);
  objc_msgSend(v53, "pk_attributedString");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryText:", v58);

  objc_msgSend(v4, "setAmountText:", v46);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAmountTextColor:", v59);

  objc_msgSend(v4, "setPrimaryTextColor:", v57);
  objc_msgSend(v4, "setTargetType:", v55);
  if (self->_payment)
    v60 = v54;
  else
    v60 = 0;
  objc_msgSend(v4, "setShowChevron:", v60);

}

uint64_t __81__PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem_populateRow___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "installmentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
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
  return 4;
}

- (id)installmentIdentifier
{
  return (id)-[PKPayLaterInstallment installmentIdentifier](self->_installment, "installmentIdentifier");
}

- (id)paymentIdentifier
{
  return (id)-[PKPayLaterPayment paymentIdentifier](self->_payment, "paymentIdentifier");
}

- (id)date
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  if (-[PKPayLaterPayment type](self->_payment, "type") != 1)
    goto LABEL_12;
  -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterPayment paymentIdentifier](self->_payment, "paymentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installmentsAffectedByPaymentIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "installmentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterInstallment installmentIdentifier](self->_installment, "installmentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  if (v9 == v10)
  {

  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
    {

      goto LABEL_11;
    }
    v12 = objc_msgSend(v9, "isEqualToString:", v10);

    if ((v12 & 1) == 0)
      goto LABEL_11;
  }
  -[PKPayLaterInstallment payoffDate](self->_installment, "payoffDate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_11:

LABEL_12:
    -[PKPayLaterInstallment dueDate](self->_installment, "dueDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    return v16;
  }
  v14 = (void *)v13;
  -[PKPayLaterInstallment dueDate](self->_installment, "dueDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PKEarlierDate();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<installmentPaidItem; "));
  -[PKPayLaterInstallment installmentIdentifier](self->_installment, "installmentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentIdentifier: '%@'; "), v4);

  -[PKPayLaterPayment paymentIdentifier](self->_payment, "paymentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentIdentifier: '%@'; "), v5);

  -[PKPayLaterInstallment dueDate](self->_installment, "dueDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("dueDate: '%@'; "), v6);

  -[PKPayLaterInstallment payoffDate](self->_installment, "payoffDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("payoffDate: '%@'; "), v7);

  -[PKPayLaterPayment postedDate](self->_payment, "postedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("postedDate: '%@'; "), v8);

  -[PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem date](self, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("date: '%@'; "), v9);

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

- (PKPayLaterPayment)payment
{
  return self->_payment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end

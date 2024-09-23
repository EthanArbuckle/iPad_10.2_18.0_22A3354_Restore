@implementation PKPayLaterFinancingPlanScheduleSummary

- (PKPayLaterFinancingPlanScheduleSummary)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterFinancingPlanScheduleSummary *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKPayLaterInstallment *v14;
  uint64_t v15;
  NSArray *installments;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  PKPayLaterPayment *v25;
  uint64_t v26;
  NSArray *payments;
  __CFString *v28;
  __CFString *v29;
  char v30;
  uint64_t v31;
  __CFString *v32;
  __CFString *v33;
  char v34;
  __CFString *v35;
  __CFString *v36;
  char v37;
  __CFString *v38;
  __CFString *v39;
  char v40;
  __CFString *v41;
  __CFString *v42;
  char v43;
  __CFString *v44;
  __CFString *v45;
  char v46;
  __CFString *v47;
  __CFString *v48;
  char v49;
  __CFString *v50;
  __CFString *v51;
  char v52;
  __CFString *v53;
  __CFString *v54;
  int v55;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  objc_super v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)PKPayLaterFinancingPlanScheduleSummary;
  v5 = -[PKPayLaterFinancingPlanScheduleSummary init](&v66, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKArrayForKey:", CFSTR("installments"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v8 = v6;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v63;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v63 != v12)
              objc_enumerationMutation(v9);
            v14 = -[PKPayLaterInstallment initWithDictionary:]([PKPayLaterInstallment alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v13));
            objc_msgSend(v7, "safelyAddObject:", v14);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
        }
        while (v11);
      }

      v15 = objc_msgSend(v7, "copy");
      installments = v5->_installments;
      v5->_installments = (NSArray *)v15;

      v6 = v8;
    }
    objc_msgSend(v4, "PKArrayForKey:", CFSTR("payments"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      v57 = v6;
      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v19 = v17;
      v20 = v17;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v59;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v59 != v23)
              objc_enumerationMutation(v20);
            v25 = -[PKPayLaterPayment initWithDictionary:]([PKPayLaterPayment alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v24));
            objc_msgSend(v18, "safelyAddObject:", v25);

            ++v24;
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
        }
        while (v22);
      }

      v26 = objc_msgSend(v18, "copy");
      payments = v5->_payments;
      v5->_payments = (NSArray *)v26;

      v6 = v57;
      v17 = v19;
    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("scheduleSummaryReason"));
    v28 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28 == CFSTR("disasterRecovery"))
      goto LABEL_23;
    if (v28)
    {
      v30 = -[__CFString isEqualToString:](v28, "isEqualToString:", CFSTR("disasterRecovery"));

      if ((v30 & 1) != 0)
      {
LABEL_23:
        v31 = 1;
LABEL_49:

        v5->_scheduleSummaryReason = v31;
        goto LABEL_50;
      }
      v32 = v29;
      if (v32 == CFSTR("activeMilitary")
        || (v33 = v32,
            v34 = -[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("activeMilitary")),
            v33,
            (v34 & 1) != 0))
      {
        v31 = 2;
        goto LABEL_49;
      }
      v35 = v33;
      if (v35 == CFSTR("hardshipBenefitorPlan")
        || (v36 = v35,
            v37 = -[__CFString isEqualToString:](v35, "isEqualToString:", CFSTR("hardshipBenefitorPlan")),
            v36,
            (v37 & 1) != 0))
      {
        v31 = 3;
        goto LABEL_49;
      }
      v38 = v36;
      if (v38 == CFSTR("overPayment")
        || (v39 = v38,
            v40 = -[__CFString isEqualToString:](v38, "isEqualToString:", CFSTR("overPayment")),
            v39,
            (v40 & 1) != 0))
      {
        v31 = 4;
        goto LABEL_49;
      }
      v41 = v39;
      if (v41 == CFSTR("earlyPayment")
        || (v42 = v41,
            v43 = -[__CFString isEqualToString:](v41, "isEqualToString:", CFSTR("earlyPayment")),
            v42,
            (v43 & 1) != 0))
      {
        v31 = 5;
        goto LABEL_49;
      }
      v44 = v42;
      if (v44 == CFSTR("RAPDeferral")
        || (v45 = v44,
            v46 = -[__CFString isEqualToString:](v44, "isEqualToString:", CFSTR("RAPDeferral")),
            v45,
            (v46 & 1) != 0))
      {
        v31 = 7;
        goto LABEL_49;
      }
      v47 = v45;
      if (v47 == CFSTR("interestCreditLateCapture")
        || (v48 = v47,
            v49 = -[__CFString isEqualToString:](v47, "isEqualToString:", CFSTR("interestCreditLateCapture")),
            v48,
            (v49 & 1) != 0))
      {
        v31 = 8;
        goto LABEL_49;
      }
      v50 = v48;
      if (v50 == CFSTR("latePayment")
        || (v51 = v50,
            v52 = -[__CFString isEqualToString:](v50, "isEqualToString:", CFSTR("latePayment")),
            v51,
            (v52 & 1) != 0))
      {
        v31 = 6;
        goto LABEL_49;
      }
      v53 = v51;
      if (v53 == CFSTR("paymentReversal")
        || (v54 = v53,
            v55 = -[__CFString isEqualToString:](v53, "isEqualToString:", CFSTR("paymentReversal")),
            v54,
            v55))
      {
        v31 = 9;
        goto LABEL_49;
      }
    }
    v31 = 0;
    goto LABEL_49;
  }
LABEL_50:

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSArray pk_arrayBySafelyApplyingBlock:](self->_installments, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_133);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("installments"));

  -[NSArray pk_arrayBySafelyApplyingBlock:](self->_payments, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_18_2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("payments"));

  v6 = self->_scheduleSummaryReason - 1;
  if (v6 > 8)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E2AD29D8[v6];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("scheduleSummaryReason"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

uint64_t __66__PKPayLaterFinancingPlanScheduleSummary_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __66__PKPayLaterFinancingPlanScheduleSummary_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (id)lastPayment
{
  void *v2;
  void *v3;

  -[NSArray sortedArrayUsingComparator:](self->_payments, "sortedArrayUsingComparator:", &__block_literal_global_20_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __53__PKPayLaterFinancingPlanScheduleSummary_lastPayment__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "postedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)paymentsOfType:(unint64_t)a3
{
  NSArray *payments;
  _QWORD v5[5];

  payments = self->_payments;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PKPayLaterFinancingPlanScheduleSummary_paymentsOfType___block_invoke;
  v5[3] = &__block_descriptor_40_e34_B32__0__PKPayLaterPayment_8Q16_B24l;
  v5[4] = a3;
  -[NSArray pk_objectsPassingTest:](payments, "pk_objectsPassingTest:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __57__PKPayLaterFinancingPlanScheduleSummary_paymentsOfType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

- (id)paymentsWithIdentifier:(id)a3
{
  id v4;
  NSArray *payments;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  payments = self->_payments;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__PKPayLaterFinancingPlanScheduleSummary_paymentsWithIdentifier___block_invoke;
  v9[3] = &unk_1E2AC9438;
  v10 = v4;
  v6 = v4;
  -[NSArray pk_firstObjectPassingTest:](payments, "pk_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __65__PKPayLaterFinancingPlanScheduleSummary_paymentsWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "paymentIdentifier");
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

- (int64_t)countOfInstallmentsAffectedByPaymentIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_installments;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "payments");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v10;
        v14[1] = 3221225472;
        v14[2] = __89__PKPayLaterFinancingPlanScheduleSummary_countOfInstallmentsAffectedByPaymentIdentifier___block_invoke;
        v14[3] = &unk_1E2AC86C0;
        v15 = v4;
        v8 += objc_msgSend(v12, "pk_countObjectsPassingTest:", v14);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __89__PKPayLaterFinancingPlanScheduleSummary_countOfInstallmentsAffectedByPaymentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "paymentIdentifier");
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

- (id)installmentsAffectedByPaymentIdentifier:(id)a3
{
  id v4;
  NSArray *installments;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  installments = self->_installments;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__PKPayLaterFinancingPlanScheduleSummary_installmentsAffectedByPaymentIdentifier___block_invoke;
  v9[3] = &unk_1E2AC8678;
  v10 = v4;
  v6 = v4;
  -[NSArray pk_objectsPassingTest:](installments, "pk_objectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __82__PKPayLaterFinancingPlanScheduleSummary_installmentsAffectedByPaymentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "appliedPayments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__PKPayLaterFinancingPlanScheduleSummary_installmentsAffectedByPaymentIdentifier___block_invoke_2;
  v6[3] = &unk_1E2AC9410;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __82__PKPayLaterFinancingPlanScheduleSummary_installmentsAffectedByPaymentIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "paymentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    v8 = 1;
  }
  else
  {
    if (v4)
      v7 = v5 == 0;
    else
      v7 = 1;
    if (v7)
      v8 = 0;
    else
      v8 = objc_msgSend(v4, "isEqualToString:", v5);
  }

  return v8;
}

- (BOOL)paymentIdentifierDidPayoffFinancingPlan:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPayLaterFinancingPlanScheduleSummary paymentsWithIdentifier:](self, "paymentsWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = self->_installments;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v12, "paymentIdentitiferContributedToInstallment:", v4, (_QWORD)v17))
          {
            if (!v9)
              v9 = v12;
            if (objc_msgSend(v12, "status") != 3
              || (objc_msgSend(v12, "payments"),
                  v13 = (void *)objc_claimAutoreleasedReturnValue(),
                  v14 = objc_msgSend(v13, "count"),
                  v13,
                  v14 != 1))
            {
LABEL_17:

              v15 = 0;
              goto LABEL_21;
            }
          }
          else if (v9)
          {
            goto LABEL_17;
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v9 = 0;
    }

    v15 = v9 != 0;
LABEL_21:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)firstInstallmentIdentifierAffectedByPaymentIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_installments;
  v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "paymentIdentitiferContributedToInstallment:", v4, (_QWORD)v11) & 1) != 0)
        {
          objc_msgSend(v9, "installmentIdentifier");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)hasPaymentsOrInstallmentsAfterInstallmentDueDate:(id)a3
{
  id v4;
  NSArray *payments;
  uint64_t v6;
  id v7;
  char v8;
  NSArray *installments;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  payments = self->_payments;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__PKPayLaterFinancingPlanScheduleSummary_hasPaymentsOrInstallmentsAfterInstallmentDueDate___block_invoke;
  v13[3] = &unk_1E2AC9438;
  v7 = v4;
  v14 = v7;
  if (-[NSArray pk_containsObjectPassingTest:](payments, "pk_containsObjectPassingTest:", v13))
  {
    v8 = 1;
  }
  else
  {
    installments = self->_installments;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __91__PKPayLaterFinancingPlanScheduleSummary_hasPaymentsOrInstallmentsAfterInstallmentDueDate___block_invoke_2;
    v11[3] = &unk_1E2AD2990;
    v12 = v7;
    v8 = -[NSArray pk_containsObjectPassingTest:](installments, "pk_containsObjectPassingTest:", v11);

  }
  return v8;
}

BOOL __91__PKPayLaterFinancingPlanScheduleSummary_hasPaymentsOrInstallmentsAfterInstallmentDueDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "postedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 32)) == 1;

  return v4;
}

BOOL __91__PKPayLaterFinancingPlanScheduleSummary_hasPaymentsOrInstallmentsAfterInstallmentDueDate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "dueDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 32)) == 1;

  return v4;
}

- (id)paymentsAfterInstallmentDueDate:(id)a3
{
  id v4;
  NSArray *payments;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  payments = self->_payments;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__PKPayLaterFinancingPlanScheduleSummary_paymentsAfterInstallmentDueDate___block_invoke;
  v10[3] = &unk_1E2AC86C0;
  v11 = v4;
  v6 = v4;
  -[NSArray pk_objectsPassingTest:](payments, "pk_objectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __74__PKPayLaterFinancingPlanScheduleSummary_paymentsAfterInstallmentDueDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "postedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 32)) == 1;

  return v4;
}

uint64_t __74__PKPayLaterFinancingPlanScheduleSummary_paymentsAfterInstallmentDueDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "postedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)currencyAmountOfPaymentIdentifierAffectingOtherInstallments:(id)a3 relativeInstallmentIdentifier:(id)a4 installmentsAreInOrder:(BOOL *)a5 countOfInstallments:(int64_t *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  void *v30;
  uint64_t v31;
  BOOL v32;
  BOOL *v34;
  int64_t *v35;
  _QWORD v36[4];
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = a5;
  v35 = a6;
  v13 = 0;
  if (-[NSArray count](self->_installments, "count"))
  {
    for (i = 0; i < -[NSArray count](self->_installments, "count"); ++i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_installments, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "installmentIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v11;
      v18 = v16;
      if (v18 == v17)
      {

      }
      else
      {
        v19 = v18;
        if (v11 && v18)
        {
          v20 = objc_msgSend(v17, "isEqualToString:", v18);

          if ((v20 & 1) != 0)
            goto LABEL_16;
        }
        else
        {

        }
        objc_msgSend(v15, "appliedPayments");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __175__PKPayLaterFinancingPlanScheduleSummary_currencyAmountOfPaymentIdentifierAffectingOtherInstallments_relativeInstallmentIdentifier_installmentsAreInOrder_countOfInstallments___block_invoke;
        v36[3] = &unk_1E2AC9410;
        v37 = v10;
        objc_msgSend(v21, "pk_firstObjectPassingTest:", v36);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v23);

          objc_msgSend(v22, "amountApplied");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = (void *)v24;
          if (v13)
          {
            objc_msgSend(v13, "currencyAmountByAddingCurrencyAmount:", v24);
            v26 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)v26;
          }
          else
          {
            v13 = (void *)v24;
          }
        }

        v17 = v37;
      }

LABEL_16:
    }
  }
  v27 = -[PKPayLaterFinancingPlanScheduleSummary installmentNumberForInstallmentIdentifier:](self, "installmentNumberForInstallmentIdentifier:", v11);
  if (objc_msgSend(v12, "count"))
  {
    v28 = 0;
    v29 = v27 + 1;
    do
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "integerValue");

      v32 = v29 + v28 == v31;
      if (v29 + v28 != v31)
        break;
      ++v28;
    }
    while (v28 < objc_msgSend(v12, "count"));
  }
  else
  {
    v32 = 1;
  }
  if (v34)
    *v34 = v32;
  if (v35)
    *v35 = objc_msgSend(v12, "count");

  return v13;
}

uint64_t __175__PKPayLaterFinancingPlanScheduleSummary_currencyAmountOfPaymentIdentifierAffectingOtherInstallments_relativeInstallmentIdentifier_installmentsAreInOrder_countOfInstallments___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "paymentIdentifier");
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

- (id)nextDueInstallment
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_installments;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "status", (_QWORD)v12);
        if (v8 <= 4 && ((1 << v8) & 0x16) != 0)
        {
          v10 = v7;
          goto LABEL_15;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
    }
    while (v4);
  }
  else
  {
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (int64_t)installmentNumberForInstallmentIdentifier:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;

  v4 = a3;
  if (-[NSArray count](self->_installments, "count"))
  {
    v5 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_installments, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "installmentIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v4;
      v9 = v7;
      if (v9 == v8)
        break;
      v10 = v9;
      if (v4 && v9)
      {
        v11 = objc_msgSend(v8, "isEqualToString:", v9);

        if ((v11 & 1) != 0)
          goto LABEL_12;
      }
      else
      {

      }
      if (++v5 >= -[NSArray count](self->_installments, "count"))
        goto LABEL_10;
    }

  }
  else
  {
LABEL_10:
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_12:

  return v5;
}

- (id)relevantInstallmentsFromDueDateStart:(id)a3 dueDateEnd:(id)a4 statues:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSArray *installments;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  installments = self->_installments;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __98__PKPayLaterFinancingPlanScheduleSummary_relevantInstallmentsFromDueDateStart_dueDateEnd_statues___block_invoke;
  v17[3] = &unk_1E2AD29B8;
  v18 = v10;
  v19 = v8;
  v20 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  -[NSArray pk_objectsPassingTest:](installments, "pk_objectsPassingTest:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

BOOL __98__PKPayLaterFinancingPlanScheduleSummary_relevantInstallmentsFromDueDateStart_dueDateEnd_statues___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 IsBetweenDates;

  v3 = a2;
  objc_msgSend(v3, "dueDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v3, "status");

  objc_msgSend(v6, "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v8))
    IsBetweenDates = PKDateIsBetweenDates(v4, *(void **)(a1 + 40), *(void **)(a1 + 48), 1);
  else
    IsBetweenDates = 0;

  return IsBetweenDates;
}

- (id)relevantInstallmentsFromPayoffDateStart:(id)a3 payoffDateEnd:(id)a4 statues:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSArray *installments;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  installments = self->_installments;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __104__PKPayLaterFinancingPlanScheduleSummary_relevantInstallmentsFromPayoffDateStart_payoffDateEnd_statues___block_invoke;
  v17[3] = &unk_1E2AD29B8;
  v18 = v10;
  v19 = v8;
  v20 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  -[NSArray pk_objectsPassingTest:](installments, "pk_objectsPassingTest:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

BOOL __104__PKPayLaterFinancingPlanScheduleSummary_relevantInstallmentsFromPayoffDateStart_payoffDateEnd_statues___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 IsBetweenDates;

  v3 = a2;
  objc_msgSend(v3, "payoffDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v3, "status");

  objc_msgSend(v6, "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v8))
    IsBetweenDates = PKDateIsBetweenDates(v4, *(void **)(a1 + 40), *(void **)(a1 + 48), 1);
  else
    IsBetweenDates = 0;

  return IsBetweenDates;
}

+ (id)totalPaidForInstallments:(id)a3 fallbackAmount:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSDecimalNumber *v14;
  NSString *v15;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((unint64_t)(objc_msgSend(v12, "status") - 1) <= 3)
        {
          objc_msgSend(v12, "amountPaid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            if (!v9)
            {
              objc_msgSend(MEMORY[0x1E0CB3598], "zero");
              v14 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "currency");
              v15 = (NSString *)objc_claimAutoreleasedReturnValue();
              PKCurrencyAmountCreate(v14, v15, 0);
              v9 = (void *)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(v13, "currencyAmountByAddingCurrencyAmount:", v9);
            v16 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v16;
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  if (v9)
    v17 = v9;
  else
    v17 = v6;
  v18 = v17;

  return v18;
}

+ (id)totalDueForInstallments:(id)a3 fallbackAmount:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v15;
  NSDecimalNumber *v16;
  NSString *v17;
  uint64_t v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "status");
        if (v13 == 4 || v13 == 1)
        {
          objc_msgSend(v12, "currentBalance");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            if (!v9)
            {
              objc_msgSend(MEMORY[0x1E0CB3598], "zero");
              v16 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "currency");
              v17 = (NSString *)objc_claimAutoreleasedReturnValue();
              PKCurrencyAmountCreate(v16, v17, 0);
              v9 = (void *)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(v15, "currencyAmountByAddingCurrencyAmount:", v9);
            v18 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v18;
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  if (v9)
    v19 = v9;
  else
    v19 = v6;
  v20 = v19;

  return v20;
}

+ (id)totalAmountForInstallments:(id)a3 fallbackAmount:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  void *v14;
  NSDecimalNumber *v15;
  NSString *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "status");
        if (v12 <= 4 && ((1 << v12) & 0x1A) != 0)
        {
          objc_msgSend(v11, "totalAmount");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            if (!v8)
            {
              objc_msgSend(MEMORY[0x1E0CB3598], "zero");
              v15 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "currency");
              v16 = (NSString *)objc_claimAutoreleasedReturnValue();
              PKCurrencyAmountCreate(v15, v16, 0);
              v8 = (void *)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(v14, "currencyAmountByAddingCurrencyAmount:", v8);
            v17 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v17;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  if (v8)
    v18 = v8;
  else
    v18 = v21;
  v19 = v18;

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterFinancingPlanScheduleSummary *v4;
  PKPayLaterFinancingPlanScheduleSummary *v5;
  BOOL v6;

  v4 = (PKPayLaterFinancingPlanScheduleSummary *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterFinancingPlanScheduleSummary isEqualToPayLaterScheduleSummary:](self, "isEqualToPayLaterScheduleSummary:", v5);

  return v6;
}

- (BOOL)isEqualToPayLaterScheduleSummary:(id)a3
{
  _QWORD *v4;
  NSArray *installments;
  NSArray *v6;
  BOOL v7;
  NSArray *payments;
  NSArray *v9;
  BOOL v10;

  v4 = a3;
  if (!v4)
    goto LABEL_15;
  installments = self->_installments;
  v6 = (NSArray *)v4[1];
  if (installments)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (installments != v6)
      goto LABEL_15;
  }
  else if ((-[NSArray isEqual:](installments, "isEqual:") & 1) == 0)
  {
    goto LABEL_15;
  }
  payments = self->_payments;
  v9 = (NSArray *)v4[2];
  if (!payments || !v9)
  {
    if (payments == v9)
      goto LABEL_13;
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  if ((-[NSArray isEqual:](payments, "isEqual:") & 1) == 0)
    goto LABEL_15;
LABEL_13:
  v10 = self->_scheduleSummaryReason == v4[3];
LABEL_16:

  return v10;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_installments);
  objc_msgSend(v3, "safelyAddObject:", self->_payments);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_scheduleSummaryReason - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3;
  unint64_t v4;
  const __CFString *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v4 = self->_scheduleSummaryReason - 1;
  if (v4 > 8)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD29D8[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("scheduleSummaryReason: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("installments: '%@'; "), self->_installments);
  objc_msgSend(v3, "appendFormat:", CFSTR("payments: '%@'; "), self->_payments);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingPlanScheduleSummary)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterFinancingPlanScheduleSummary *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *installments;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *payments;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterFinancingPlanScheduleSummary;
  v5 = -[PKPayLaterFinancingPlanScheduleSummary init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("installments"));
    v9 = objc_claimAutoreleasedReturnValue();
    installments = v5->_installments;
    v5->_installments = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("payments"));
    v14 = objc_claimAutoreleasedReturnValue();
    payments = v5->_payments;
    v5->_payments = (NSArray *)v14;

    v5->_scheduleSummaryReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scheduleSummaryReason"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *installments;
  id v5;

  installments = self->_installments;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", installments, CFSTR("installments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payments, CFSTR("payments"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_scheduleSummaryReason, CFSTR("scheduleSummaryReason"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterFinancingPlanScheduleSummary *v5;
  uint64_t v6;
  NSArray *installments;
  uint64_t v8;
  NSArray *payments;

  v5 = -[PKPayLaterFinancingPlanScheduleSummary init](+[PKPayLaterFinancingPlanScheduleSummary allocWithZone:](PKPayLaterFinancingPlanScheduleSummary, "allocWithZone:"), "init");
  v6 = -[NSArray copyWithZone:](self->_installments, "copyWithZone:", a3);
  installments = v5->_installments;
  v5->_installments = (NSArray *)v6;

  v8 = -[NSArray copyWithZone:](self->_payments, "copyWithZone:", a3);
  payments = v5->_payments;
  v5->_payments = (NSArray *)v8;

  v5->_scheduleSummaryReason = self->_scheduleSummaryReason;
  return v5;
}

- (NSArray)installments
{
  return self->_installments;
}

- (void)setInstallments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)scheduleSummaryReason
{
  return self->_scheduleSummaryReason;
}

- (void)setScheduleSummaryReason:(unint64_t)a3
{
  self->_scheduleSummaryReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_installments, 0);
}

@end

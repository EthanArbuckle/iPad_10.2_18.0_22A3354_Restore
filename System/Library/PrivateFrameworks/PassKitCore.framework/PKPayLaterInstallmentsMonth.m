@implementation PKPayLaterInstallmentsMonth

- (PKPayLaterInstallmentsMonth)initWithFinancingPlans:(id)a3 fallbackAmount:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKPayLaterInstallmentsMonth *v15;
  PKPayLaterInstallmentsMonth *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKPayLaterInstallmentsMonth;
  v15 = -[PKPayLaterInstallmentsMonth init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fallbackAmount, a4);
    objc_storeStrong((id *)&v16->_financingPlans, a3);
    objc_storeStrong((id *)&v16->_startDate, a5);
    objc_storeStrong((id *)&v16->_endDate, a6);
    -[PKPayLaterInstallmentsMonth _updateValues](v16, "_updateValues");
  }

  return v16;
}

- (id)totalDue
{
  return self->_totalDue;
}

- (id)totalPaid
{
  return self->_totalPaid;
}

- (id)financingPlanForInstallmentIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_financingPlanByInstallmentIdentifier, "objectForKeyedSubscript:", a3);
}

- (id)installmentsDueInDate:(id)a3
{
  NSMutableDictionary *installmentsByDate;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  installmentsByDate = self->_installmentsByDate;
  PKStartOfDay(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](installmentsByDate, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (objc_msgSend(v6, "count"))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate description](self->_startDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("startDate: '%@'; "), v4);

  -[NSDate description](self->_endDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("endDate: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("totalDue: '%@'; "), self->_totalDue);
  objc_msgSend(v3, "appendFormat:", CFSTR("%ld plans; "), -[NSArray count](self->_financingPlans, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("financingPlans: '%@'; "), self->_financingPlans);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (void)_updateValues
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  PKCurrencyAmount *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v12;
  NSDate *startDate;
  NSDate *endDate;
  void *v15;
  NSDate *v16;
  NSDate *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSDecimalNumber *v35;
  NSString *v36;
  uint64_t v37;
  uint64_t v38;
  NSDecimalNumber *v39;
  NSString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSArray *v45;
  NSArray *activeInstallments;
  NSArray *v47;
  NSArray *paidInstallments;
  NSArray *v49;
  NSArray *allInstallments;
  NSDictionary *v51;
  NSDictionary *financingPlanByInstallmentIdentifier;
  PKCurrencyAmount *fallbackAmount;
  PKCurrencyAmount *v54;
  NSMutableDictionary *v55;
  NSMutableDictionary *installmentsByDate;
  NSArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  unint64_t v63;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  NSArray *v69;
  PKPayLaterInstallmentsMonth *v70;
  id v71;
  id v72;
  uint64_t v73;
  PKCurrencyAmount *v74;
  void *v75;
  uint64_t v76;
  PKCurrencyAmount *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v82 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v72 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v81 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v3 = self->_financingPlans;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v74 = 0;
    v7 = *(_QWORD *)v92;
    v69 = v3;
    v70 = self;
    v68 = *(_QWORD *)v92;
    do
    {
      v8 = 0;
      v73 = v5;
      do
      {
        if (*(_QWORD *)v92 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v8);
        v10 = objc_msgSend(v9, "state");
        if (v10 > 8 || ((1 << v10) & 0x10C) == 0)
        {
          v76 = v8;
          v77 = v6;
          objc_msgSend(v9, "scheduleSummary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          startDate = self->_startDate;
          endDate = self->_endDate;
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E2C3F0A0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "relevantInstallmentsFromPayoffDateStart:payoffDateEnd:statues:", startDate, endDate, v15);
          v78 = objc_claimAutoreleasedReturnValue();

          v16 = self->_startDate;
          v17 = self->_endDate;
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E2C3F0B8, &unk_1E2C3F0D0, &unk_1E2C3F0E8, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "relevantInstallmentsFromDueDateStart:dueDateEnd:statues:", v16, v17, v18);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E2C3F0A0, &unk_1E2C3F0B8, &unk_1E2C3F0D0, &unk_1E2C3F0E8, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 0u;
          v88 = 0u;
          v89 = 0u;
          v90 = 0u;
          v75 = v12;
          objc_msgSend(v12, "installments");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v88;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v88 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v25, "status"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v19, "containsObject:", v26);

                if (v27)
                {
                  objc_msgSend(v25, "installmentIdentifier");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v81, "safelySetObject:forKey:", v9, v28);

                  objc_msgSend(v82, "addObject:", v25);
                }
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
            }
            while (v22);
          }

          v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v30 = (void *)v78;
          objc_msgSend(v29, "pk_safelyAddObjectsFromArray:", v78);
          objc_msgSend(v29, "pk_safelyAddObjectsFromArray:", v80);
          objc_msgSend(v71, "addObjectsFromArray:", v78);
          objc_msgSend(v72, "addObjectsFromArray:", v80);
          self = v70;
          +[PKPayLaterFinancingPlanScheduleSummary totalDueForInstallments:fallbackAmount:](PKPayLaterFinancingPlanScheduleSummary, "totalDueForInstallments:fallbackAmount:", v29, v70->_fallbackAmount);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKPayLaterFinancingPlanScheduleSummary totalPaidForInstallments:fallbackAmount:](PKPayLaterFinancingPlanScheduleSummary, "totalPaidForInstallments:fallbackAmount:", v29, v70->_fallbackAmount);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            v33 = v77;
            v34 = v74;
            if (!v74)
            {
              objc_msgSend(MEMORY[0x1E0CB3598], "zero");
              v35 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "currency");
              v36 = (NSString *)objc_claimAutoreleasedReturnValue();
              PKCurrencyAmountCreate(v35, v36, 0);
              v37 = objc_claimAutoreleasedReturnValue();

              v30 = (void *)v78;
              v34 = (void *)v37;
            }
            objc_msgSend(v34, "currencyAmountByAddingCurrencyAmount:", v31);
            v38 = objc_claimAutoreleasedReturnValue();

            if (!v77)
            {
              objc_msgSend(MEMORY[0x1E0CB3598], "zero");
              v39 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "currency");
              v40 = (NSString *)objc_claimAutoreleasedReturnValue();
              PKCurrencyAmountCreate(v39, v40, 0);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              v30 = (void *)v78;
            }
            objc_msgSend(v33, "currencyAmountByAddingCurrencyAmount:", v32);
            v6 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();

            v74 = (PKCurrencyAmount *)v38;
          }
          else
          {
            v6 = v77;
          }
          v7 = v68;
          v3 = v69;

          v5 = v73;
          v8 = v76;
        }
        ++v8;
      }
      while (v8 != v5);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v74 = 0;
  }

  objc_msgSend(v71, "sortedArrayUsingComparator:", &__block_literal_global_25);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "mutableCopy");

  objc_msgSend(v72, "sortedArrayUsingComparator:", &__block_literal_global_25);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "mutableCopy");

  v79 = v44;
  if (objc_msgSend(v44, "count"))
  {
    v45 = (NSArray *)objc_msgSend(v44, "copy");
    activeInstallments = self->_activeInstallments;
    self->_activeInstallments = v45;
  }
  else
  {
    activeInstallments = self->_activeInstallments;
    self->_activeInstallments = 0;
  }

  if (objc_msgSend(v42, "count"))
  {
    v47 = (NSArray *)objc_msgSend(v42, "copy");
    paidInstallments = self->_paidInstallments;
    self->_paidInstallments = v47;
  }
  else
  {
    paidInstallments = self->_paidInstallments;
    self->_paidInstallments = 0;
  }

  if (objc_msgSend(v82, "count"))
  {
    v49 = (NSArray *)objc_msgSend(v82, "copy");
    allInstallments = self->_allInstallments;
    self->_allInstallments = v49;
  }
  else
  {
    allInstallments = self->_allInstallments;
    self->_allInstallments = 0;
  }

  if (objc_msgSend(v81, "count"))
  {
    v51 = (NSDictionary *)objc_msgSend(v81, "copy");
    financingPlanByInstallmentIdentifier = self->_financingPlanByInstallmentIdentifier;
    self->_financingPlanByInstallmentIdentifier = v51;
  }
  else
  {
    financingPlanByInstallmentIdentifier = self->_financingPlanByInstallmentIdentifier;
    self->_financingPlanByInstallmentIdentifier = 0;
  }

  fallbackAmount = v74;
  if (!v74)
    fallbackAmount = self->_fallbackAmount;
  objc_storeStrong((id *)&self->_totalDue, fallbackAmount);
  v54 = v6;
  if (!v6)
    v54 = self->_fallbackAmount;
  objc_storeStrong((id *)&self->_totalPaid, v54);
  v55 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  installmentsByDate = self->_installmentsByDate;
  self->_installmentsByDate = v55;

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v57 = self->_allInstallments;
  v58 = -[NSArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v84;
    do
    {
      for (j = 0; j != v59; ++j)
      {
        if (*(_QWORD *)v84 != v60)
          objc_enumerationMutation(v57);
        v62 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
        v63 = objc_msgSend(v62, "status");
        if (v63 <= 4 && ((1 << v63) & 0x1A) != 0)
        {
          objc_msgSend(v62, "dueDate");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          PKStartOfDay(v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary objectForKey:](self->_installmentsByDate, "objectForKey:", v66);
          v67 = (id)objc_claimAutoreleasedReturnValue();
          if (!v67)
            v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v67, "addObject:", v62);
          -[NSMutableDictionary setObject:forKey:](self->_installmentsByDate, "setObject:forKey:", v67, v66);

        }
      }
      v59 = -[NSArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
    }
    while (v59);
  }

}

uint64_t __44__PKPayLaterInstallmentsMonth__updateValues__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "dueDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dueDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSArray)financingPlans
{
  return self->_financingPlans;
}

- (NSArray)paidInstallments
{
  return self->_paidInstallments;
}

- (NSArray)activeInstallments
{
  return self->_activeInstallments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeInstallments, 0);
  objc_storeStrong((id *)&self->_paidInstallments, 0);
  objc_storeStrong((id *)&self->_financingPlans, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_installmentsByDate, 0);
  objc_storeStrong((id *)&self->_financingPlanByInstallmentIdentifier, 0);
  objc_storeStrong((id *)&self->_allInstallments, 0);
  objc_storeStrong((id *)&self->_fallbackAmount, 0);
  objc_storeStrong((id *)&self->_totalPaid, 0);
  objc_storeStrong((id *)&self->_totalDue, 0);
}

@end

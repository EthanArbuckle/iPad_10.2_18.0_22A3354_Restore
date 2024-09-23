@implementation PKPayLaterFinancingPlanPaymentScheduleComposerItemList

- (PKPayLaterFinancingPlanPaymentScheduleComposerItemList)initWithFinancingPlan:(id)a3
{
  id v4;
  PKPayLaterFinancingPlanPaymentScheduleComposerItemList *v5;
  PKPayLaterFinancingPlanPaymentScheduleComposerItemList *v6;
  uint64_t v7;
  NSArray *items;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPayLaterFinancingPlanPaymentScheduleComposerItemList;
  v5 = -[PKPayLaterFinancingPlanPaymentScheduleComposerItemList init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKPayLaterFinancingPlanPaymentScheduleComposerItemList _itemsFromFinancingPlan:](v5, "_itemsFromFinancingPlan:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    items = v6->_items;
    v6->_items = (NSArray *)v7;

  }
  return v6;
}

- (id)_itemsFromFinancingPlan:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  void *v20;
  PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem *v21;
  void *v22;
  void *v23;
  PKPayLaterFinancingPlanPaymentScheduleComposerDeclinedInstallmentItem *v24;
  PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem *v46;
  void *v47;
  id obj;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "scheduleSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v5;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
  if (v51)
  {
    v50 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v74 != v50)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "status");
        if ((unint64_t)(v10 - 1) >= 2)
        {
          if (v10 == 3)
          {
            objc_msgSend(v9, "payments");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "lastObject");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v27;
            v58 = i;
            v54 = v9;
            if (objc_msgSend(v27, "type") == 1)
            {
              objc_msgSend(v26, "pk_arrayByRemovingObject:", v27);
              v28 = objc_claimAutoreleasedReturnValue();

              v26 = (void *)v28;
            }
            v67 = 0u;
            v68 = 0u;
            v65 = 0u;
            v66 = 0u;
            v14 = v26;
            v29 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v66;
              do
              {
                for (j = 0; j != v30; ++j)
                {
                  if (*(_QWORD *)v66 != v31)
                    objc_enumerationMutation(v14);
                  v33 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
                  objc_msgSend(v33, "paymentIdentifier");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v7, "containsObject:", v34) & 1) == 0)
                  {
                    objc_msgSend(v7, "addObject:", v34);
                    v35 = -[PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem initWithFinancingPlan:payment:]([PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem alloc], "initWithFinancingPlan:payment:", v3, v33);
                    objc_msgSend(v6, "addObject:", v35);

                  }
                }
                v30 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
              }
              while (v30);
            }

            v22 = v56;
            if (v56)
            {
              objc_msgSend(v56, "paymentIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v36);

            }
            v25 = -[PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem initWithFinancingPlan:installment:payment:]([PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem alloc], "initWithFinancingPlan:installment:payment:", v3, v54, v56);
            i = v58;
            goto LABEL_40;
          }
          if (v10 != 4)
            continue;
        }
        objc_msgSend(v9, "payments");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v12;
        v57 = i;
        v52 = objc_msgSend(v12, "type");
        v53 = v9;
        if (v52 == 5)
        {
          objc_msgSend(v11, "pk_arrayByRemovingObject:", v12);
          v13 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v13;
        }
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v14 = v11;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v70;
          do
          {
            for (k = 0; k != v16; ++k)
            {
              if (*(_QWORD *)v70 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * k);
              objc_msgSend(v19, "paymentIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v7, "containsObject:", v20) & 1) == 0)
              {
                objc_msgSend(v7, "addObject:", v20);
                v21 = -[PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem initWithFinancingPlan:payment:]([PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem alloc], "initWithFinancingPlan:payment:", v3, v19);
                objc_msgSend(v6, "addObject:", v21);

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
          }
          while (v16);
        }

        v22 = v55;
        if (v55)
        {
          objc_msgSend(v55, "paymentIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v23);

        }
        i = v57;
        if (v52 == 5)
          v24 = -[PKPayLaterFinancingPlanPaymentScheduleComposerDeclinedInstallmentItem initWithFinancingPlan:installment:payment:]([PKPayLaterFinancingPlanPaymentScheduleComposerDeclinedInstallmentItem alloc], "initWithFinancingPlan:installment:payment:", v3, v53, v55);
        else
          v24 = -[PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem initWithFinancingPlan:installment:]([PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem alloc], "initWithFinancingPlan:installment:", v3, v53);
        v25 = (PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem *)v24;
LABEL_40:
        objc_msgSend(v6, "addObject:", v25);

      }
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
    }
    while (v51);
  }

  objc_msgSend(v3, "scheduleSummary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "payments");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __82__PKPayLaterFinancingPlanPaymentScheduleComposerItemList__itemsFromFinancingPlan___block_invoke;
  v63[3] = &unk_1E3E6FEF0;
  v39 = v7;
  v64 = v39;
  objc_msgSend(v38, "pk_objectsPassingTest:", v63);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v41 = v40;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v59, v77, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v60;
    do
    {
      for (m = 0; m != v43; ++m)
      {
        if (*(_QWORD *)v60 != v44)
          objc_enumerationMutation(v41);
        v46 = -[PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem initWithFinancingPlan:payment:]([PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem alloc], "initWithFinancingPlan:payment:", v3, *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * m));
        objc_msgSend(v6, "addObject:", v46);

      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v59, v77, 16);
    }
    while (v43);
  }

  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_128);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

uint64_t __82__PKPayLaterFinancingPlanPaymentScheduleComposerItemList__itemsFromFinancingPlan___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "paymentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __82__PKPayLaterFinancingPlanPaymentScheduleComposerItemList__itemsFromFinancingPlan___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end

@implementation PKSpendingSummaryGenerator

+ (id)generateSummaryOfType:(unint64_t)a3 startingAt:(id)a4 withSegmentLimit:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "generateSummaryOfType:startingAt:withSegmentLimit:generateBeyondCurrentDay:", a3, a4, a5, 0);
}

+ (id)generateSummaryOfType:(unint64_t)a3 startingAt:(id)a4 withSegmentLimit:(unint64_t)a5 generateBeyondCurrentDay:(BOOL)a6
{
  int v6;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id *v13;
  id *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  double v25;
  unint64_t v26;
  PKPaymentTransactionGroup *v27;
  NSDecimalNumber *v28;
  void *v29;
  PKSpendingSummary *v30;
  void *v31;
  NSDecimalNumber *v32;
  void *v33;
  unint64_t v34;
  PKSpendingSummary *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSDecimalNumber *v40;
  void *v41;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  _BOOL4 v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  _QWORD v55[2];

  v49 = a6;
  v6 = a5;
  v50 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFirstWeekday:", 2);
  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3 == 2)
  {
    v45 = 8;
    v9 = v50;
    objc_msgSend(v8, "rangeOfUnit:inUnit:forDate:", 8, 4, v50);
    v11 = v17;
    v12 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v53 = v12;
    v13 = &v53;
    v14 = &v53;
    v15 = v8;
    v16 = 4;
  }
  else if (a3 == 1)
  {
    v45 = 4096;
    v9 = v50;
    objc_msgSend(v8, "rangeOfUnit:inUnit:forDate:", 4096, 8, v50);
    v11 = v18;
    v12 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v54 = v12;
    v13 = &v54;
    v14 = &v54;
    v15 = v8;
    v16 = 8;
  }
  else
  {
    if (a3)
    {
      v46 = objc_alloc_init(MEMORY[0x1E0C99D68]);
      goto LABEL_21;
    }
    v45 = 512;
    v9 = v50;
    objc_msgSend(v8, "rangeOfUnit:inUnit:forDate:", 512, 0x2000, v50);
    v11 = v10;
    v12 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v55[0] = v12;
    v13 = (id *)v55;
    v14 = (id *)v55;
    v15 = v8;
    v16 = 0x2000;
  }
  objc_msgSend(v15, "rangeOfUnit:startDate:interval:forDate:", v16, v14, 0, v9);
  v46 = *v13;

  if (!v11)
  {
LABEL_21:
    v34 = 0;
    goto LABEL_22;
  }
  v43 = a3;
  v19 = 0;
  v20 = 0.0;
  v21 = MEMORY[0x1E0C9AA60];
  v44 = v11;
  do
  {
    v48 = v19;
    objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", v45);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = 0;
    v25 = 0.0;
    do
    {
      if (v24)
      {
        if ((objc_msgSend(v8, "compareDate:toDate:toUnitGranularity:", v22, v50, 16) != 1 || v49)
          && arc4random_uniform(3u))
        {
          v26 = arc4random_uniform(v6 + 1);
        }
        else
        {
          v26 = 0;
        }
        v25 = v25 + (double)v26;
        v27 = objc_alloc_init(PKPaymentTransactionGroup);
        -[PKPaymentTransactionGroup setTransactions:](v27, "setTransactions:", v21);
        -[PKPaymentTransactionGroup setTransactionCount:](v27, "setTransactionCount:", 0);
        -[PKPaymentTransactionGroup setMerchantCategory:](v27, "setMerchantCategory:", v24);
        -[PKPaymentTransactionGroup setType:](v27, "setType:", 0);
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v26, 0, 0);
        v28 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        PKCurrencyAmountCreate(v28, CFSTR("USD"), 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentTransactionGroup setTotalAmount:](v27, "setTotalAmount:", v29);

        objc_msgSend(v23, "addObject:", v27);
      }
      ++v24;
    }
    while (v24 != 8);
    v30 = objc_alloc_init(PKSpendingSummary);
    -[PKSpendingSummary setStartDate:](v30, "setStartDate:", v22);
    -[PKSpendingSummary setEndDate:](v30, "setEndDate:", v22);
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __105__PKSpendingSummaryGenerator_generateSummaryOfType_startingAt_withSegmentLimit_generateBeyondCurrentDay___block_invoke;
    v51[3] = &unk_1E2AD46E0;
    v52 = &unk_1E2C3E380;
    objc_msgSend(v23, "sortedArrayUsingComparator:", v51);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSpendingSummary setOrderedSpendingCategories:](v30, "setOrderedSpendingCategories:", v31);

    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", (unint64_t)v25, 0, 0);
    v32 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v32, CFSTR("USD"), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSpendingSummary setTotalSpending:](v30, "setTotalSpending:", v33);

    objc_msgSend(v47, "addObject:", v30);
    v20 = v20 + v25;

    v19 = v48 + 1;
  }
  while (v48 + 1 != v44);
  v34 = (unint64_t)v20;
  a3 = v43;
LABEL_22:
  v35 = objc_alloc_init(PKSpendingSummary);
  -[PKSpendingSummary setSummaryType:](v35, "setSummaryType:", a3);
  objc_msgSend(v47, "firstObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "startDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummary setStartDate:](v35, "setStartDate:", v37);

  objc_msgSend(v47, "lastObject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "endDate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummary setEndDate:](v35, "setEndDate:", v39);

  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v34, 0, 0);
  v40 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v40, CFSTR("USD"), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummary setTotalSpending:](v35, "setTotalSpending:", v41);

  -[PKSpendingSummary setSpendingsPerCalendarUnit:](v35, "setSpendingsPerCalendarUnit:", v47);
  return v35;
}

uint64_t __105__PKSpendingSummaryGenerator_generateSummaryOfType_startingAt_withSegmentLimit_generateBeyondCurrentDay___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(a2, "merchantCategory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "indexOfObject:", v8);

  v10 = *(void **)(a1 + 32);
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend(v7, "merchantCategory");

  objc_msgSend(v11, "numberWithInteger:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "indexOfObject:", v13);

  if (v9 < v14)
    return -1;
  else
    return v9 > v14;
}

@end

@implementation PKPayLaterFinancingPlanGenerator

+ (id)payLaterMerchantForType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  PKPayLaterMerchant *v5;

  switch(a3)
  {
    case 0uLL:
      v5 = objc_alloc_init(PKPayLaterMerchant);
      break;
    case 1uLL:
      objc_msgSend(a1, "_testMerchant", v3, v4);
      v5 = (PKPayLaterMerchant *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      objc_msgSend(a1, "_bestBuyMerchant", v3, v4);
      v5 = (PKPayLaterMerchant *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      objc_msgSend(a1, "_nikeMerchant", v3, v4);
      v5 = (PKPayLaterMerchant *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      objc_msgSend(a1, "_saksMerchant", v3, v4);
      v5 = (PKPayLaterMerchant *)objc_claimAutoreleasedReturnValue();
      break;
    case 5uLL:
      objc_msgSend(a1, "_macysMerchant", v3, v4);
      v5 = (PKPayLaterMerchant *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

+ (id)_testMerchant
{
  PKPayLaterMerchant *v2;

  v2 = objc_alloc_init(PKPayLaterMerchant);
  -[PKPayLaterMerchant setRawName:](v2, "setRawName:", CFSTR("Test Merchant"));
  return v2;
}

+ (id)_bestBuyMerchant
{
  PKPayLaterMerchant *v2;

  v2 = objc_alloc_init(PKPayLaterMerchant);
  -[PKPayLaterMerchant setMerchantCategoryCode:](v2, "setMerchantCategoryCode:", 5732);
  -[PKPayLaterMerchant setMerchantCategory:](v2, "setMerchantCategory:", 2);
  -[PKPayLaterMerchant setIndustryCategory:](v2, "setIndustryCategory:", CFSTR("Electronics Stores"));
  -[PKPayLaterMerchant setRawName:](v2, "setRawName:", CFSTR("BEST BUY #986"));
  return v2;
}

+ (id)_nikeMerchant
{
  PKPayLaterMerchant *v2;

  v2 = objc_alloc_init(PKPayLaterMerchant);
  -[PKPayLaterMerchant setMerchantCategoryCode:](v2, "setMerchantCategoryCode:", 5655);
  -[PKPayLaterMerchant setMerchantCategory:](v2, "setMerchantCategory:", 2);
  -[PKPayLaterMerchant setIndustryCategory:](v2, "setIndustryCategory:", CFSTR("Sports and Riding Apparel Stores"));
  -[PKPayLaterMerchant setRawName:](v2, "setRawName:", CFSTR("NIKE STORE SF"));
  return v2;
}

+ (id)_saksMerchant
{
  PKPayLaterMerchant *v2;

  v2 = objc_alloc_init(PKPayLaterMerchant);
  -[PKPayLaterMerchant setMerchantCategoryCode:](v2, "setMerchantCategoryCode:", 5311);
  -[PKPayLaterMerchant setMerchantCategory:](v2, "setMerchantCategory:", 2);
  -[PKPayLaterMerchant setIndustryCategory:](v2, "setIndustryCategory:", CFSTR("DEPARTMENT STORES"));
  -[PKPayLaterMerchant setRawName:](v2, "setRawName:", CFSTR("SAKS FIFTH AVENUE #835"));
  return v2;
}

+ (id)_macysMerchant
{
  PKPayLaterMerchant *v2;

  v2 = objc_alloc_init(PKPayLaterMerchant);
  -[PKPayLaterMerchant setMerchantCategoryCode:](v2, "setMerchantCategoryCode:", 5311);
  -[PKPayLaterMerchant setMerchantCategory:](v2, "setMerchantCategory:", 2);
  -[PKPayLaterMerchant setIndustryCategory:](v2, "setIndustryCategory:", CFSTR("DEPARTMENT STORES"));
  -[PKPayLaterMerchant setRawName:](v2, "setRawName:", CFSTR("MACY'S    4333 LA JOLL"));
  return v2;
}

+ (id)minimumPrincipalAmountForProductType:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("50"));
      a1 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)maximumPrincipalAmountForProductType:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("1000"));
      a1 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)minimumAPRForProductType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero", v3, v4);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)maximumAPRForProductType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero", v3, v4);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (int64_t)minimumInstallmentCountForProductType:(unint64_t)a3
{
  return 4 * (a3 == 1);
}

+ (int64_t)maximumInstallmentCountForProductType:(unint64_t)a3
{
  return 4 * (a3 == 1);
}

+ (id)financingPlanWithConfiguration:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSDecimalNumber *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  NSDecimalNumber *v18;
  uint64_t v19;
  NSDecimalNumber *v20;
  NSDecimalNumber *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  NSDecimalNumber *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSDecimalNumber *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  unint64_t v44;
  PKPayLaterFinancingPlan *v45;
  void *v46;
  PKPayLaterFinancingPlanSummary *v47;
  void *v48;
  NSDecimalNumber *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  PKPayLaterFinancingPlanScheduleSummary *v74;
  PKPayLaterFinancingPlan *v75;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  char v86;
  NSDecimalNumber *v87;
  NSDecimalNumber *v88;
  NSDecimalNumber *v89;
  NSDecimalNumber *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSDecimalNumber *v96;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  NSDecimalNumber *v103;
  NSString *v104;
  void *v105;
  uint64_t v106;
  NSDecimalNumber *v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[2];
  int v114;
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v100 = objc_msgSend(v3, "productType");
  v4 = objc_msgSend(v3, "installmentCount");
  v85 = objc_msgSend(v3, "daysSinceTransactionStart");
  objc_msgSend(v3, "currency");
  v104 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3598];
  v106 = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "decimalValue");
  }
  else
  {
    v113[0] = 0;
    v113[1] = 0;
    v114 = 0;
  }
  objc_msgSend(v5, "decimalNumberWithDecimal:", v113);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("0"));
  v8 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  objc_msgSend(v3, "payments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v109, v115, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v110;
LABEL_6:
    v13 = 0;
    while (2)
    {
      if (*(_QWORD *)v110 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v13);
      switch(objc_msgSend(v14, "paymentType"))
      {
        case 2:
        case 3:
          goto LABEL_12;
        case 4:
        case 6:
          goto LABEL_10;
        case 7:
          v17 = objc_msgSend(v14, "paymentSubtype");
          if (v17 < 4)
          {
LABEL_12:
            objc_msgSend(v14, "amount");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDecimalNumber decimalNumberBySubtracting:](v8, "decimalNumberBySubtracting:", v15);
            v16 = objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
          if (v17 == 4)
          {
LABEL_10:
            objc_msgSend(v14, "amount");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDecimalNumber decimalNumberByAdding:](v8, "decimalNumberByAdding:", v15);
            v16 = objc_claimAutoreleasedReturnValue();
LABEL_13:
            v18 = (NSDecimalNumber *)v16;

            v8 = v18;
          }
LABEL_14:
          if (v11 != ++v13)
            continue;
          v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v109, v115, 16);
          v11 = v19;
          if (!v19)
            goto LABEL_19;
          goto LABEL_6;
        default:
          goto LABEL_14;
      }
    }
  }
LABEL_19:

  objc_msgSend(v3, "totalPrincipal");
  v20 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  -[NSDecimalNumber decimalNumberByAdding:](v20, "decimalNumberByAdding:", v8);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "apr");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_installmentAmountWithInterestForAPR:totalPrincipal:installmentCount:", v105, v20, v4);
  v21 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  -[NSDecimalNumber decimalNumberByMultiplyingBy:](v21, "decimalNumberByMultiplyingBy:", v98);
  v103 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v96 = v20;
  -[NSDecimalNumber decimalNumberByDividingBy:](v20, "decimalNumberByDividingBy:", v98);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "decimalNumberByMultiplyingBy:", v98);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDecimalNumber decimalNumberBySubtracting:](v21, "decimalNumberBySubtracting:", v102);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "decimalNumberByMultiplyingBy:", v98);
  v107 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0CB3940];
  PKPayLaterAccountProductTypeToString(v100);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@-%@"), v23, v25);
  v26 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dateByAddingTimeInterval:", (double)v85 * -86400.0);
  v28 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_installmentDueDatesForInstallmentCount:productType:transactionDate:", v4, v100, v28);
  v29 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payments");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v3;
  v108 = 0;
  LOBYTE(v77) = objc_msgSend(v3, "ignoreFuturePayments");
  v92 = (void *)v28;
  objc_msgSend(a1, "_paymentsForConfigs:installmentDueDates:planIdentifier:transactionDate:installmentAmountWithInterest:installmentAmountWithoutInterest:installmentInterest:totalAmountWithInterest:totalAmountWithoutInterest:totalInterest:currency:ignoreFutureDates:paymentIdentifiersForDispute:", v30, v29, v26, v28, v21, v102, v101, v103, v94, v107, v104, v77, &v108);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v108;

  v82 = v32;
  objc_msgSend(a1, "_disputesForPayments:paymentIdentifiersForDispute:planIdentifier:", v31, v32, v26);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = (void *)v31;
  v33 = v31;
  v93 = (void *)v26;
  v83 = (void *)v29;
  v34 = v21;
  objc_msgSend(a1, "_installmentsWithPayments:planIdentifier:productType:installmentDueDates:installmentAmountWithInterest:currency:disputes:", v33, v26, v100, v29, v21, v104, v81);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "pk_firstObjectPassingTest:", &__block_literal_global_66);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "pk_firstObjectPassingTest:", &__block_literal_global_20_0);
  v36 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_installmentAmountWithInterestForAPR:totalPrincipal:installmentCount:", v105, v95, v106);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "decimalNumberByMultiplyingBy:", v98);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_currentBalanceForPlanWithTotalAmount:installments:", v37, v35);
  v38 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v78 = v37;
  objc_msgSend(v37, "decimalNumberBySubtracting:", v38);
  v90 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_principalPaidToDateForInstallments:installmentAmountWithoutInterest:", v35, v102);
  v89 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_interestPaidToDateForInstallments:installmentInterest:", v35, v101);
  v88 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  -[NSDecimalNumber decimalNumberBySubtracting:](v107, "decimalNumberBySubtracting:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDecimalNumber decimalNumberBySubtracting:](v38, "decimalNumberBySubtracting:", v39);
  v87 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

  v80 = (void *)v36;
  if (v85 >= 31 && !objc_msgSend(v99, "count"))
  {
    v42 = 1;
    v43 = 3;
    v40 = 5;
    goto LABEL_29;
  }
  if (!v36)
  {
    if ((-[NSDecimalNumber pk_isZeroNumber](v38, "pk_isZeroNumber") & 1) != 0)
    {
      v86 = 0;
      v40 = 3;
      v41 = 6;
      goto LABEL_30;
    }
    v42 = 0;
    v40 = 2;
    if (objc_msgSend(v99, "count"))
    {
      v41 = 1;
      v44 = 0x1E0C99000;
      v86 = 0;
      goto LABEL_31;
    }
    v43 = 2;
LABEL_29:
    v86 = v42;

    v35 = 0;
    v99 = 0;
    v41 = v40;
    v40 = v43;
    goto LABEL_30;
  }
  v86 = 0;
  v40 = 2;
  v41 = 4;
LABEL_30:
  v44 = 0x1E0C99000uLL;
LABEL_31:
  v45 = objc_alloc_init(PKPayLaterFinancingPlan);
  -[PKPayLaterFinancingPlan setPlanIdentifier:](v45, "setPlanIdentifier:", v26);
  -[PKPayLaterFinancingPlan setProductType:](v45, "setProductType:", v100);
  objc_msgSend(*(id *)(v44 + 3432), "date");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan setLastUpdated:](v45, "setLastUpdated:", v46);

  -[PKPayLaterFinancingPlan setState:](v45, "setState:", v41);
  -[PKPayLaterFinancingPlan setStateReason:](v45, "setStateReason:", v40);
  -[PKPayLaterFinancingPlan setPlanChannel:](v45, "setPlanChannel:", 1);
  v47 = objc_alloc_init(PKPayLaterFinancingPlanSummary);
  -[PKPayLaterFinancingPlanSummary setApr:](v47, "setApr:", v105);
  -[PKPayLaterFinancingPlanSummary setHasAPR:](v47, "setHasAPR:", objc_msgSend(v105, "pk_isPositiveNumber"));
  -[PKPayLaterFinancingPlanSummary setInstallmentCount:](v47, "setInstallmentCount:", v106);
  -[NSDecimalNumber decimalNumberByAdding:](v96, "decimalNumberByAdding:", v8);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "decimalNumberByAdding:", v107);
  v49 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

  PKCurrencyAmountCreate(v49, v104, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanSummary setTotalAmount:](v47, "setTotalAmount:", v50);

  PKCurrencyAmountCreate(v103, v104, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanSummary setInitialAmount:](v47, "setInitialAmount:", v51);

  PKCurrencyAmountCreate(v38, v104, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanSummary setCurrentBalance:](v47, "setCurrentBalance:", v52);

  PKCurrencyAmountCreate(v87, v104, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanSummary setPayoffAmount:](v47, "setPayoffAmount:", v53);

  PKCurrencyAmountCreate(v90, v104, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanSummary setPaymentAmountToDate:](v47, "setPaymentAmountToDate:", v54);

  PKCurrencyAmountCreate(v107, v104, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanSummary setTotalInterest:](v47, "setTotalInterest:", v55);

  PKCurrencyAmountCreate(v34, v104, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanSummary setInstallmentAmount:](v47, "setInstallmentAmount:", v56);

  PKCurrencyAmountCreate(v96, v104, 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanSummary setTotalPrincipal:](v47, "setTotalPrincipal:", v57);

  PKCurrencyAmountCreate(v8, v104, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanSummary setTotalAdjustments:](v47, "setTotalAdjustments:", v58);

  PKCurrencyAmountCreate(v89, v104, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanSummary setPrincipalPaidToDate:](v47, "setPrincipalPaidToDate:", v59);

  PKCurrencyAmountCreate(v88, v104, 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanSummary setInterestPaidToDate:](v47, "setInterestPaidToDate:", v60);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random_uniform(0x270Fu));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "stringValue");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanSummary setPanSuffix:](v47, "setPanSuffix:", v62);

  -[PKPayLaterFinancingPlanSummary setTransactionDate:](v47, "setTransactionDate:", v92);
  objc_msgSend(v35, "firstObject");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "dueDate");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanSummary setStartInstallmentDate:](v47, "setStartInstallmentDate:", v64);

  objc_msgSend(v91, "dueDate");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanSummary setNextInstallmentDueDate:](v47, "setNextInstallmentDueDate:", v65);

  objc_msgSend(v35, "lastObject");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "dueDate");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanSummary setEndInstallmentDate:](v47, "setEndInstallmentDate:", v67);

  if ((v86 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterFinancingPlanSummary setCancellationDate:](v47, "setCancellationDate:", v68);

  }
  else
  {
    -[PKPayLaterFinancingPlanSummary setCancellationDate:](v47, "setCancellationDate:", 0);
  }
  -[PKPayLaterFinancingPlan setPlanSummary:](v45, "setPlanSummary:", v47);
  -[PKPayLaterFinancingPlan setDisputes:](v45, "setDisputes:", v81);
  objc_msgSend(a1, "payLaterMerchantForType:", objc_msgSend(v84, "merchant"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan setMerchant:](v45, "setMerchant:", v69);

  objc_msgSend(a1, "payLaterFinancingPlanFundingSourcesForOptions:", objc_msgSend(v84, "fundingSources"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "firstObject");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan setFundingSource:](v45, "setFundingSource:", v71);

  -[PKPayLaterFinancingPlan fundingSource](v45, "fundingSource");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setAutoPayment:", objc_msgSend(v84, "autoPayment"));

  objc_msgSend(a1, "_termsDetailsForPlanIdentifier:", v93);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan setTermsDetails:](v45, "setTermsDetails:", v73);

  v74 = objc_alloc_init(PKPayLaterFinancingPlanScheduleSummary);
  -[PKPayLaterFinancingPlanScheduleSummary setInstallments:](v74, "setInstallments:", v35);
  -[PKPayLaterFinancingPlanScheduleSummary setPayments:](v74, "setPayments:", v99);
  -[PKPayLaterFinancingPlanScheduleSummary setScheduleSummaryReason:](v74, "setScheduleSummaryReason:", objc_msgSend(v84, "scheduleSummaryReason"));
  -[PKPayLaterFinancingPlan setScheduleSummary:](v45, "setScheduleSummary:", v74);
  v75 = v45;

  return v75;
}

BOOL __67__PKPayLaterFinancingPlanGenerator_financingPlanWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "status") == 1 || objc_msgSend(v2, "status") == 4;

  return v3;
}

BOOL __67__PKPayLaterFinancingPlanGenerator_financingPlanWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "status") == 4;
}

+ (id)_installmentsWithPayments:(id)a3 planIdentifier:(id)a4 productType:(unint64_t)a5 installmentDueDates:(id)a6 installmentAmountWithInterest:(id)a7 currency:(id)a8 disputes:(id)a9
{
  id v14;
  NSString *v15;
  void *v16;
  id v17;
  unint64_t v18;
  void *v19;
  id v20;
  id v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _BOOL4 v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  PKPayLaterAppliedPayment *v50;
  NSDecimalNumber *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSDecimalNumber *v57;
  void *v58;
  void *v59;
  NSDecimalNumber *v60;
  NSDecimalNumber *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  id v76;
  id v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  id v83;
  void *v84;
  NSString *v85;
  void *v86;
  _QWORD v87[4];
  id v88;

  v14 = a3;
  v15 = (NSString *)a8;
  v77 = a9;
  v83 = a1;
  v85 = v15;
  objc_msgSend(a1, "_createInstallmentsWithDueDates:installmentAmountWithInterest:currency:planIdentifier:", a6, a7, v15, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v16, "count"))
  {
    v18 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v19);

      ++v18;
    }
    while (v18 < objc_msgSend(v16, "count"));
  }
  v80 = v16;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v86 = v20;
  if (objc_msgSend(v14, "count"))
  {
    v22 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v23);

      objc_msgSend(v14, "objectAtIndexedSubscript:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "amount");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "amount");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "pk_absoluteValue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "paymentIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "safelySetObject:forKey:", v27, v28);

      v20 = v86;
      ++v22;
    }
    while (v22 < objc_msgSend(v14, "count"));
  }
  v29 = v21;
  v30 = v80;
  if (objc_msgSend(v17, "count"))
  {
    v76 = v14;
    v78 = v17;
    v82 = v21;
    while (objc_msgSend(v20, "count", v76))
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "integerValue");

      objc_msgSend(v14, "objectAtIndexedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "paymentIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKey:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v33, "type"))
      {
        case 0:
          goto LABEL_36;
        case 1:
        case 5:
          v81 = v32;
          v84 = v34;
          objc_msgSend(v17, "firstObject");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "integerValue");
          v38 = 0;
          goto LABEL_18;
        case 2:
          v81 = v32;
          v84 = v34;
          objc_msgSend(v17, "lastObject");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "integerValue");
          v38 = 1;
          goto LABEL_18;
        case 3:
          v81 = v32;
          v87[0] = MEMORY[0x1E0C809B0];
          v87[1] = 3221225472;
          v87[2] = __157__PKPayLaterFinancingPlanGenerator__installmentsWithPayments_planIdentifier_productType_installmentDueDates_installmentAmountWithInterest_currency_disputes___block_invoke;
          v87[3] = &unk_1E2AC86E8;
          v39 = v33;
          v88 = v39;
          objc_msgSend(v77, "pk_firstObjectPassingTest:", v87);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v40 != 0;
          if (v40)
          {
            v84 = v34;
            objc_msgSend(v78, "lastObject");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v41, "integerValue");

          }
          else
          {
            v70 = objc_msgSend(v39, "subtype");
            if ((unint64_t)(v70 - 2) < 3)
              goto LABEL_45;
            if (!v70)
            {
              v72 = 0x7FFFFFFFFFFFFFFFLL;
              goto LABEL_44;
            }
            if (v70 == 1)
            {
              objc_msgSend(v78, "firstObject");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = objc_msgSend(v71, "integerValue");

LABEL_44:
              objc_msgSend(v83, "_processLoanAdjustmentWithPayment:installmentIndex:installments:disputes:currency:", v39, v72, v80, v77, v85);
LABEL_45:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v81);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "removeObject:", v73);

              v42 = v88;
              v17 = v78;
              v30 = v80;
              goto LABEL_37;
            }
            v84 = v34;
            v37 = 0x7FFFFFFFFFFFFFFFLL;
          }

          v36 = v88;
          v30 = v80;
LABEL_18:

LABEL_19:
          objc_msgSend(v30, "objectAtIndexedSubscript:", v37);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "currentBalance");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "amount");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v42, "appliedPayments");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)objc_msgSend(v45, "mutableCopy");
          v47 = v46;
          v79 = v37;
          if (v46)
            v48 = v46;
          else
            v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v49 = v48;

          v50 = objc_alloc_init(PKPayLaterAppliedPayment);
          objc_msgSend(v83, "_minimumNumber:number2:", v35, v44);
          v51 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "paymentIdentifier");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPayLaterAppliedPayment setPaymentIdentifier:](v50, "setPaymentIdentifier:", v52);

          PKCurrencyAmountCreate(v51, v85, 0);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPayLaterAppliedPayment setAmountApplied:](v50, "setAmountApplied:", v53);

          objc_msgSend(v49, "addObject:", v50);
          v54 = (void *)objc_msgSend(v49, "copy");
          objc_msgSend(v42, "setAppliedPayments:", v54);

          if (v38)
          {
            objc_msgSend(v42, "totalAmount");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "amount");
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v56, "decimalNumberBySubtracting:", v51);
            v57 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
            PKCurrencyAmountCreate(v57, v85, 0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setTotalAmount:", v58);

          }
          objc_msgSend(v35, "decimalNumberBySubtracting:", v51);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v82, "setObject:forKey:", v59, v84);
          v60 = v44;
          v61 = v60;
          if (objc_msgSend(v33, "type") != 5)
          {
            objc_msgSend(MEMORY[0x1E0CB3598], "zero");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDecimalNumber decimalNumberBySubtracting:](v60, "decimalNumberBySubtracting:", v51);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "_maximumNumber:number2:", v62, v63);
            v61 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

          }
          PKCurrencyAmountCreate(v61, v85, 0);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setCurrentBalance:", v64);

          objc_msgSend(v42, "currentBalance");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "amount");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v66, "pk_isZeroNumber") & 1) != 0)
            v67 = 3;
          else
            v67 = objc_msgSend(v42, "status");
          objc_msgSend(v42, "setStatus:", v67);

          if (!v59 || objc_msgSend(v59, "pk_isZeroNumber"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v81);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "removeObject:", v68);

          }
          v17 = v78;
          if (objc_msgSend(v42, "status") == 3)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v79);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "removeObject:", v69);

          }
          v35 = v59;
          v14 = v76;
          v30 = v80;
          v20 = v86;
          v29 = v82;
          v34 = v84;
LABEL_37:

          if (!objc_msgSend(v17, "count"))
            goto LABEL_47;
          break;
        case 4:
          objc_msgSend(v83, "_processCreditRevokedWithPayment:installments:payments:disputes:currency:", v33, v30, v14, v77, v85);
          goto LABEL_36;
        case 6:
        case 7:
          objc_msgSend(v83, "_processLoanAdjustmentWithPayment:installmentIndex:installments:disputes:currency:", v33, 0x7FFFFFFFFFFFFFFFLL, v30, v77, v85);
LABEL_36:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "removeObject:", v42);
          goto LABEL_37;
        default:
          v81 = v32;
          v84 = v34;
          v38 = 0;
          v37 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_19;
      }
    }
  }
LABEL_47:
  v74 = (void *)objc_msgSend(v30, "copy");

  return v74;
}

uint64_t __157__PKPayLaterFinancingPlanGenerator__installmentsWithPayments_planIdentifier_productType_installmentDueDates_installmentAmountWithInterest_currency_disputes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "appliedPayments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __157__PKPayLaterFinancingPlanGenerator__installmentsWithPayments_planIdentifier_productType_installmentDueDates_installmentAmountWithInterest_currency_disputes___block_invoke_2;
  v6[3] = &unk_1E2AC9410;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __157__PKPayLaterFinancingPlanGenerator__installmentsWithPayments_planIdentifier_productType_installmentDueDates_installmentAmountWithInterest_currency_disputes___block_invoke_2(uint64_t a1, void *a2)
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

+ (void)_processCreditRevokedWithPayment:(id)a3 installments:(id)a4 payments:(id)a5 disputes:(id)a6 currency:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  BOOL v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSDecimalNumber *v46;
  PKPayLaterAppliedPayment *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSDecimalNumber *v53;
  void *v54;
  void *v55;
  void *v56;
  NSDecimalNumber *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  id v67;
  void *v68;
  NSString *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[4];
  id v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v76 = a5;
  v13 = a6;
  v70 = (NSString *)a7;
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __109__PKPayLaterFinancingPlanGenerator__processCreditRevokedWithPayment_installments_payments_disputes_currency___block_invoke;
  v86[3] = &unk_1E2AC86E8;
  v77 = v11;
  v87 = v77;
  objc_msgSend(v13, "pk_firstObjectPassingTest:", v86);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
    goto LABEL_46;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  objc_msgSend(v14, "appliedPayments");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
  if (!v17)
  {
    v29 = v16;
    goto LABEL_45;
  }
  v18 = v17;
  v66 = v15;
  v67 = v13;
  v68 = v12;
  v19 = *(_QWORD *)v83;
  while (2)
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v83 != v19)
        objc_enumerationMutation(v16);
      objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * i), "paymentIdentifier", v66, v67);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "paymentIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v21;
      v24 = v22;
      if (v23 == v24)
      {

        goto LABEL_17;
      }
      v25 = v24;
      if (v23)
        v26 = v24 == 0;
      else
        v26 = 1;
      if (v26)
      {

      }
      else
      {
        v27 = objc_msgSend(v23, "isEqualToString:", v24);

        if ((v27 & 1) != 0)
          goto LABEL_17;
      }
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __109__PKPayLaterFinancingPlanGenerator__processCreditRevokedWithPayment_installments_payments_disputes_currency___block_invoke_3;
      v80[3] = &unk_1E2AC9438;
      v28 = v23;
      v81 = v28;
      objc_msgSend(v76, "pk_firstObjectPassingTest:", v80);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {

        objc_msgSend(v29, "paymentIdentifier");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "amount");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "amount");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "pk_absoluteValue");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v68;
        v33 = objc_msgSend(v68, "count");
        if (v33 - 1 >= 0)
        {
          v34 = v33;
          while (1)
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", --v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "appliedPayments");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v78[0] = MEMORY[0x1E0C809B0];
            v78[1] = 3221225472;
            v78[2] = __109__PKPayLaterFinancingPlanGenerator__processCreditRevokedWithPayment_installments_payments_disputes_currency___block_invoke_4;
            v78[3] = &unk_1E2AC9410;
            v79 = v71;
            objc_msgSend(v36, "pk_firstObjectPassingTest:", v78);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v37)
            {
              objc_msgSend(v35, "appliedPayments");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = (void *)objc_msgSend(v38, "mutableCopy");
              v40 = v39;
              v75 = v34;
              if (v39)
                v41 = v39;
              else
                v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v43 = v41;

              v74 = v37;
              objc_msgSend(v37, "amountApplied");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "amount");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "_minimumNumber:number2:", v32, v45);
              v46 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

              v47 = objc_alloc_init(PKPayLaterAppliedPayment);
              objc_msgSend(v77, "paymentIdentifier");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPayLaterAppliedPayment setPaymentIdentifier:](v47, "setPaymentIdentifier:", v48);

              PKCurrencyAmountCreate(v46, v70, 0);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPayLaterAppliedPayment setAmountApplied:](v47, "setAmountApplied:", v49);

              objc_msgSend(v43, "addObject:", v47);
              v73 = v43;
              v50 = (void *)objc_msgSend(v43, "copy");
              objc_msgSend(v35, "setAppliedPayments:", v50);

              objc_msgSend(v35, "totalAmount");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "amount");
              v52 = (void *)objc_claimAutoreleasedReturnValue();

              v72 = v52;
              objc_msgSend(v52, "decimalNumberByAdding:", v46);
              v53 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
              PKCurrencyAmountCreate(v53, v70, 0);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setTotalAmount:", v54);

              objc_msgSend(v32, "decimalNumberBySubtracting:", v46);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v35, "currentBalance");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "amount");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "decimalNumberByAdding:", v46);
              v57 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

              PKCurrencyAmountCreate(v57, v70, 0);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setCurrentBalance:", v58);

              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "dueDate");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = objc_msgSend(v59, "compare:", v60);

              if (v61 == 1)
              {
                v62 = 4;
              }
              else
              {
                objc_msgSend(v35, "currentBalance");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "amount");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v64, "pk_isPositiveNumber") & 1) != 0)
                  v62 = 1;
                else
                  v62 = objc_msgSend(v35, "status");

              }
              objc_msgSend(v35, "setStatus:", v62);
              v34 = v75;
              if (v42)
              {
                if (objc_msgSend(v42, "pk_isZeroNumber"))
                  v65 = 4;
                else
                  v65 = 0;
              }
              else
              {
                v65 = 4;
              }

              v12 = v68;
              if (v65)
                goto LABEL_43;
            }
            else
            {

              v42 = v32;
            }
            v32 = v42;
            if (v34 <= 0)
              goto LABEL_43;
          }
        }
        v42 = v32;
LABEL_43:

        goto LABEL_44;
      }
LABEL_17:

    }
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
    if (v18)
      continue;
    break;
  }
  v29 = v16;
  v12 = v68;
LABEL_44:
  v15 = v66;
  v13 = v67;
LABEL_45:

LABEL_46:
}

uint64_t __109__PKPayLaterFinancingPlanGenerator__processCreditRevokedWithPayment_installments_payments_disputes_currency___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "appliedPayments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __109__PKPayLaterFinancingPlanGenerator__processCreditRevokedWithPayment_installments_payments_disputes_currency___block_invoke_2;
  v6[3] = &unk_1E2AC9410;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __109__PKPayLaterFinancingPlanGenerator__processCreditRevokedWithPayment_installments_payments_disputes_currency___block_invoke_2(uint64_t a1, void *a2)
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

BOOL __109__PKPayLaterFinancingPlanGenerator__processCreditRevokedWithPayment_installments_payments_disputes_currency___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  int v10;
  _BOOL8 v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "paymentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  v8 = v7;
  if (v6 != v7)
  {
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {

    }
    else
    {
      v10 = objc_msgSend(v6, "isEqualToString:", v7);

      if (v10)
        goto LABEL_10;
    }
    v11 = 0;
    goto LABEL_12;
  }

LABEL_10:
  v11 = objc_msgSend(v3, "type") == 2;
LABEL_12:

  return v11;
}

uint64_t __109__PKPayLaterFinancingPlanGenerator__processCreditRevokedWithPayment_installments_payments_disputes_currency___block_invoke_4(uint64_t a1, void *a2)
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

+ (void)_processRefundRevokedWithPayment:(id)a3 installments:(id)a4 payments:(id)a5 currency:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSDecimalNumber *v28;
  PKPayLaterAppliedPayment *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSDecimalNumber *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  id v45;
  id v46;
  NSString *v48;
  id v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;

  v49 = a3;
  v9 = a4;
  v10 = a5;
  v48 = (NSString *)a6;
  objc_msgSend(v10, "pk_firstObjectPassingTest:", &__block_literal_global_30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v44 = v11;
    v45 = v10;
    objc_msgSend(v11, "paymentIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "amount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "amount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pk_absoluteValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v9, "count");
    if (v15 - 1 >= 0)
    {
      v16 = v15;
      v46 = v9;
      while (1)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", --v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "appliedPayments");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __100__PKPayLaterFinancingPlanGenerator__processRefundRevokedWithPayment_installments_payments_currency___block_invoke_2;
        v52[3] = &unk_1E2AC9410;
        v53 = v50;
        objc_msgSend(v18, "pk_firstObjectPassingTest:", v52);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v17, "appliedPayments");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v20, "mutableCopy");
          v22 = v21;
          if (v21)
            v23 = v21;
          else
            v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v25 = v23;

          objc_msgSend(v19, "amountApplied");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "amount");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_minimumNumber:number2:", v14, v27);
          v28 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

          v29 = objc_alloc_init(PKPayLaterAppliedPayment);
          objc_msgSend(v49, "paymentIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPayLaterAppliedPayment setPaymentIdentifier:](v29, "setPaymentIdentifier:", v30);

          PKCurrencyAmountCreate(v28, v48, 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPayLaterAppliedPayment setAmountApplied:](v29, "setAmountApplied:", v31);

          objc_msgSend(v25, "addObject:", v29);
          v51 = v25;
          v32 = (void *)objc_msgSend(v25, "copy");
          objc_msgSend(v17, "setAppliedPayments:", v32);

          objc_msgSend(v14, "decimalNumberBySubtracting:", v28);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "currentBalance");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "amount");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "decimalNumberByAdding:", v28);
          v35 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

          PKCurrencyAmountCreate(v35, v48, 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setCurrentBalance:", v36);

          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "dueDate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v37, "compare:", v38);

          if (v39 == 1)
          {
            v40 = 4;
          }
          else
          {
            objc_msgSend(v17, "currentBalance");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "amount");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v42, "pk_isPositiveNumber") & 1) != 0)
              v40 = 1;
            else
              v40 = objc_msgSend(v17, "status");

          }
          objc_msgSend(v17, "setStatus:", v40);
          if (v24)
          {
            if (objc_msgSend(v24, "pk_isZeroNumber"))
              v43 = 2;
            else
              v43 = 0;
          }
          else
          {
            v43 = 2;
          }
          v9 = v46;

          if (v43)
            goto LABEL_24;
        }
        else
        {

          v24 = v14;
        }
        v14 = v24;
        if (v16 <= 0)
          goto LABEL_24;
      }
    }
    v24 = v14;
LABEL_24:

    v11 = v44;
    v10 = v45;
  }

}

BOOL __100__PKPayLaterFinancingPlanGenerator__processRefundRevokedWithPayment_installments_payments_currency___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 3;
}

uint64_t __100__PKPayLaterFinancingPlanGenerator__processRefundRevokedWithPayment_installments_payments_currency___block_invoke_2(uint64_t a1, void *a2)
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

+ (void)_processLoanAdjustmentWithPayment:(id)a3 installmentIndex:(int64_t)a4 installments:(id)a5 disputes:(id)a6 currency:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSDecimalNumber *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  NSDecimalNumber *v44;
  NSString *v45;
  NSDecimalNumber *v46;
  NSString *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  PKPayLaterAppliedPayment *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id v72;
  id v73;
  void *v75;
  id obj;
  uint64_t v77;
  uint64_t v78;
  NSString *v79;
  void *v80;
  void *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[2];
  int v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v79 = (NSString *)a7;
  v75 = v11;
  if (v11)
  {
    v72 = v13;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v12, "pk_objectsPassingTest:", &__block_literal_global_33);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(v12, "objectAtIndexedSubscript:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "arrayWithObject:", v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v11, "amount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "amount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = v18;
    objc_msgSend(v18, "floatValue");
    v20 = v19;
    v21 = objc_msgSend(v14, "count");
    v22 = (void *)MEMORY[0x1E0CB3598];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (float)(v20 / (float)v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "decimalValue");
    }
    else
    {
      v87[0] = 0;
      v87[1] = 0;
      v88 = 0;
    }
    v73 = v12;
    objc_msgSend(v22, "decimalNumberWithDecimal:", v87);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    obj = v14;
    v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
    if (v78)
    {
      v77 = *(_QWORD *)v84;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v84 != v77)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v27);
          objc_msgSend(v28, "totalAmount");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "amount");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "decimalNumberByAdding:", v82);
          v31 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

          v80 = v29;
          if (!-[NSDecimalNumber pk_isPositiveNumber](v31, "pk_isPositiveNumber"))
          {
            objc_msgSend(v29, "amount");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "currentBalance");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "amount");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "decimalNumberBySubtracting:", v39);
            v40 = objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          }
          PKCurrencyAmountCreate(v31, v79, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setTotalAmount:", v32);

          objc_msgSend(v28, "appliedPayments");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            objc_msgSend(v29, "amount");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "currentBalance");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "amount");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "decimalNumberBySubtracting:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v37, "decimalNumberBySubtracting:", v31);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v25 + 1432), "zero");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_maximumNumber:number2:", v38, v39);
            v40 = objc_claimAutoreleasedReturnValue();
LABEL_17:
            v41 = (void *)v40;

            v26 = v41;
          }
          objc_msgSend(v28, "currentBalance");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "amount");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v43, "decimalNumberByAdding:", v82);
          v44 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
          v45 = v79;
          if ((-[NSDecimalNumber pk_isNegativeNumber](v44, "pk_isNegativeNumber") & 1) != 0
            || -[NSDecimalNumber pk_isZeroNumber](v44, "pk_isZeroNumber"))
          {
            v46 = v43;
          }
          else
          {
            if (!-[NSDecimalNumber pk_isPositiveNumber](v44, "pk_isPositiveNumber"))
            {
              v81 = v26;
              goto LABEL_30;
            }
            objc_msgSend(*(id *)(v25 + 1432), "zero");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v26, "compare:", v52);

            if (v53 != -1)
            {
              v81 = v26;
              v45 = v79;
              goto LABEL_30;
            }
            objc_msgSend(a1, "_minimumNumber:number2:", v44, v26);
            v46 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "decimalNumberBySubtracting:", v46);
            v69 = objc_claimAutoreleasedReturnValue();

            v26 = (void *)v69;
            v45 = v79;
          }
          v81 = v26;
          if (v46)
          {
            v47 = v45;
            objc_msgSend(v28, "appliedPayments");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = (void *)objc_msgSend(v48, "mutableCopy");
            v50 = v49;
            if (v49)
              v51 = v49;
            else
              v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v54 = v51;

            v55 = objc_alloc_init(PKPayLaterAppliedPayment);
            objc_msgSend(v75, "paymentIdentifier");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPayLaterAppliedPayment setPaymentIdentifier:](v55, "setPaymentIdentifier:", v56);

            PKCurrencyAmountCreate(v46, v47, 0);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPayLaterAppliedPayment setAmountApplied:](v55, "setAmountApplied:", v57);

            objc_msgSend(v54, "addObject:", v55);
            v58 = (void *)objc_msgSend(v54, "copy");
            objc_msgSend(v28, "setAppliedPayments:", v58);

            objc_msgSend(v43, "decimalNumberBySubtracting:", v46);
            v59 = objc_claimAutoreleasedReturnValue();

            v45 = v47;
            v44 = (NSDecimalNumber *)v59;
            v25 = 0x1E0CB3000;
          }
LABEL_30:
          PKCurrencyAmountCreate(v44, v45, 0);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setCurrentBalance:", v60);

          objc_msgSend(*(id *)(v25 + 1432), "zero");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = -[NSDecimalNumber compare:](v44, "compare:", v61);

          if (!v62)
            objc_msgSend(v28, "setStatus:", 3);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "dueDate");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v63, "compare:", v64);

          if (v65 == 1)
          {
            v66 = 4;
          }
          else
          {
            objc_msgSend(v28, "currentBalance");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "amount");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v68, "pk_isPositiveNumber") & 1) != 0)
              v66 = 1;
            else
              v66 = objc_msgSend(v28, "status");

          }
          objc_msgSend(v28, "setStatus:", v66);

          ++v27;
          v26 = v81;
        }
        while (v78 != v27);
        v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
        v78 = v70;
      }
      while (v70);
    }

    v13 = v72;
    v12 = v73;
  }

}

BOOL __118__PKPayLaterFinancingPlanGenerator__processLoanAdjustmentWithPayment_installmentIndex_installments_disputes_currency___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "status") != 3;
}

+ (id)_paymentsForConfigs:(id)a3 installmentDueDates:(id)a4 planIdentifier:(id)a5 transactionDate:(id)a6 installmentAmountWithInterest:(id)a7 installmentAmountWithoutInterest:(id)a8 installmentInterest:(id)a9 totalAmountWithInterest:(id)a10 totalAmountWithoutInterest:(id)a11 totalInterest:(id)a12 currency:(id)a13 ignoreFutureDates:(BOOL)a14 paymentIdentifiersForDispute:(id *)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSString *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSDecimalNumber *v40;
  NSDecimalNumber *v41;
  NSDecimalNumber *v42;
  void *v43;
  void *v44;
  NSDecimalNumber *v45;
  NSDecimalNumber *v46;
  void *v47;
  void *v48;
  void *v49;
  NSDecimalNumber *v50;
  NSDecimalNumber *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSDecimalNumber *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  NSDecimalNumber *v63;
  uint64_t v64;
  uint64_t v65;
  NSDecimalNumber *v66;
  uint64_t v67;
  void *v68;
  PKPayLaterPayment *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSDecimalNumber *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  NSDecimalNumber *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i;
  void *v90;
  void *v91;
  PKPayLaterPayment *v92;
  NSDecimalNumber *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  unint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  id v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  NSDecimalNumber *v114;
  uint64_t v116;
  uint64_t v117;
  id v118;
  id v119;
  id v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  PKPayLaterPayment *v127;
  NSDecimalNumber *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  NSDecimalNumber *v133;
  id v134;
  id v135;
  NSDecimalNumber *v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _QWORD v141[2];
  int v142;
  _QWORD v143[2];
  int v144;
  _BYTE v145[128];
  uint64_t v146;

  v146 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v108 = a5;
  v107 = a6;
  v122 = a7;
  v120 = a8;
  v119 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = (NSString *)a13;
  v26 = v22;
  v27 = v23;
  v28 = v24;
  v134 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v135 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v109 = v28;
  v110 = v27;
  v124 = v27;
  v126 = v28;
  v111 = v26;
  v29 = v26;
  v123 = v21;
  if (objc_msgSend(v20, "count"))
  {
    v30 = v21;
    v31 = 0;
    v29 = v111;
    v124 = v27;
    v126 = v28;
    v118 = v20;
    while (1)
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "relativeToInstallmentNumber");
      v34 = objc_msgSend(v32, "daysPriorToRelativeInstallmentNumber");
      if ((v33 & 0x8000000000000000) != 0)
        goto LABEL_51;
      v35 = v34;
      if (v33 >= objc_msgSend(v30, "count"))
        goto LABEL_51;
      v131 = v35;
      v36 = v29;
      objc_msgSend(v32, "amount");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v37;
      v39 = v122;
      if (v37)
        v39 = (void *)v37;
      v40 = v39;

      v41 = (NSDecimalNumber *)v120;
      v42 = (NSDecimalNumber *)v119;
      if (objc_msgSend(v32, "payOffRestOfLoanBalance"))
        break;
      v136 = v40;
      v133 = v42;
      if (objc_msgSend(v32, "installmentAmountMultiple") >= 2)
      {
        v47 = (void *)MEMORY[0x1E0CB3598];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v32, "installmentAmountMultiple"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v48;
        v50 = v41;
        if (v48)
        {
          objc_msgSend(v48, "decimalValue");
        }
        else
        {
          v143[0] = 0;
          v143[1] = 0;
          v144 = 0;
        }
        objc_msgSend(v47, "decimalNumberWithDecimal:", v143);
        v54 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v122, "decimalNumberByMultiplyingBy:", v54);
        v128 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

        -[NSDecimalNumber decimalNumberByMultiplyingBy:](v50, "decimalNumberByMultiplyingBy:", v54);
        v55 = objc_claimAutoreleasedReturnValue();
        v56 = v50;
        v45 = (NSDecimalNumber *)v55;

        -[NSDecimalNumber decimalNumberByMultiplyingBy:](v133, "decimalNumberByMultiplyingBy:", v54);
        v46 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

        v43 = (void *)v54;
        v44 = v36;
        goto LABEL_15;
      }
      v51 = v41;
      v52 = v123;
      v44 = v36;
      v53 = v131;
LABEL_16:
      v57 = v52;
      objc_msgSend(v52, "objectAtIndexedSubscript:", v33);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "dateByAddingTimeInterval:", (double)v53 * -86400.0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      PKStartOfDay(v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v59, "dateByAddingTimeInterval:", (double)(60 * v31));
      v60 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = (void *)v60;
      v62 = objc_msgSend(v61, "compare:", v60);

      if (v62 != -1 || !a14)
      {
        v64 = objc_msgSend(v32, "paymentType");
        v65 = objc_msgSend(v32, "paymentSubtype");
        v63 = v133;
        if ((unint64_t)(v64 - 2) < 2 || v64 == 7 && (unint64_t)(v65 - 1) < 3)
        {
          v66 = v136;
        }
        else
        {
          v66 = v136;
          objc_msgSend(v44, "decimalNumberBySubtracting:", v136);
          v67 = objc_claimAutoreleasedReturnValue();

          v44 = (void *)v67;
        }
        objc_msgSend(v124, "decimalNumberBySubtracting:", v51);
        v117 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v126, "decimalNumberBySubtracting:", v133);
        v116 = objc_claimAutoreleasedReturnValue();

        v130 = v44;
        if (objc_msgSend(v44, "compare:", v66) != -1)
        {
          v30 = v57;
          goto LABEL_28;
        }
        v30 = v57;
        if (v31 + 1 == objc_msgSend(v20, "count"))
        {
          -[NSDecimalNumber decimalNumberBySubtracting:](v136, "decimalNumberBySubtracting:", v130);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_28:
          v68 = 0;
        }
        v125 = objc_msgSend(v32, "fundingSources");
        v69 = objc_alloc_init(PKPayLaterPayment);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tempID-%ld"), v31);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterPayment setPaymentIdentifier:](v69, "setPaymentIdentifier:", v70);

        -[PKPayLaterPayment setType:](v69, "setType:", objc_msgSend(v32, "paymentType"));
        -[PKPayLaterPayment setSubtype:](v69, "setSubtype:", objc_msgSend(v32, "paymentSubtype"));
        -[PKPayLaterPayment setPostedDate:](v69, "setPostedDate:", v132);
        v71 = -[PKPayLaterPayment type](v69, "type");
        v127 = v69;
        v72 = -[PKPayLaterPayment subtype](v69, "subtype");
        if ((unint64_t)(v71 - 2) < 2 || v71 == 7 && (unint64_t)(v72 - 1) <= 2)
        {
          -[NSDecimalNumber pk_negativeValue](v136, "pk_negativeValue");
          v73 = objc_claimAutoreleasedReturnValue();

          v74 = (NSDecimalNumber *)v73;
        }
        else
        {
          v74 = v136;
        }
        v136 = v74;
        PKCurrencyAmountCreate(v74, v25, 0);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterPayment setAmount:](v69, "setAmount:", v75);

        PKCurrencyAmountCreate(v133, v25, 0);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterPayment setInterestPaid:](v69, "setInterestPaid:", v76);

        PKCurrencyAmountCreate(v51, v25, 0);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterPayment setPrincipalPaid:](v69, "setPrincipalPaid:", v77);

        objc_msgSend(a1, "payLaterPaymentFundingSourcesForOptions:", v125);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v78;
        v29 = v130;
        v121 = v78;
        if (v78 && v68)
        {
          v80 = (void *)MEMORY[0x1E0CB3598];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v78, "count"));
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = v81;
          v114 = v51;
          if (v81)
          {
            objc_msgSend(v81, "decimalValue");
          }
          else
          {
            v141[0] = 0;
            v141[1] = 0;
            v142 = 0;
          }
          objc_msgSend(v80, "decimalNumberWithDecimal:", v141);
          v83 = objc_claimAutoreleasedReturnValue();

          v112 = (void *)v83;
          v113 = v68;
          objc_msgSend(v68, "decimalNumberByDividingBy:", v83);
          v84 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
          v137 = 0u;
          v138 = 0u;
          v139 = 0u;
          v140 = 0u;
          v85 = v121;
          v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v137, v145, 16);
          if (v86)
          {
            v87 = v86;
            v88 = *(_QWORD *)v138;
            do
            {
              for (i = 0; i != v87; ++i)
              {
                if (*(_QWORD *)v138 != v88)
                  objc_enumerationMutation(v85);
                v90 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * i);
                PKCurrencyAmountCreate(v84, v25, 0);
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "setRefundAmount:", v91);

              }
              v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v137, v145, 16);
            }
            while (v87);
          }

          v20 = v118;
          v30 = v123;
          v29 = v130;
          v63 = v133;
          v68 = v113;
          v51 = v114;
          v79 = v121;
        }
        v92 = v127;
        -[PKPayLaterPayment setFundingSources:](v127, "setFundingSources:", v79);
        -[PKPayLaterPayment setAssociatedTransactionPaymentHash:](v127, "setAssociatedTransactionPaymentHash:", (unint64_t)CFSTR("pay-later-plan-payment-apple-cash-payment-hash") & (v125 << 61 >> 63));
        objc_msgSend(v135, "safelyAddObject:", v127);
        if (objc_msgSend(v32, "forDispute"))
        {
          -[PKPayLaterPayment paymentIdentifier](v127, "paymentIdentifier");
          v93 = v51;
          v94 = v68;
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "addObject:", v95);

          v68 = v94;
          v51 = v93;
          v92 = v127;
        }

        v124 = (void *)v117;
        v126 = (void *)v116;
        goto LABEL_50;
      }
      v63 = v133;
      v29 = v44;
      v30 = v57;
LABEL_50:

LABEL_51:
      if (++v31 >= (unint64_t)objc_msgSend(v20, "count"))
        goto LABEL_52;
    }
    v43 = v42;
    v44 = v36;
    v128 = v36;

    v45 = v124;
    v46 = v126;
LABEL_15:
    v53 = v131;

    v133 = v46;
    v51 = v45;
    v136 = v128;
    v52 = v123;
    v20 = v118;
    goto LABEL_16;
  }
LABEL_52:
  v96 = v135;
  objc_msgSend(v135, "sortUsingComparator:", &__block_literal_global_38);
  v97 = v134;
  if (objc_msgSend(v135, "count"))
  {
    v98 = 0;
    do
    {
      objc_msgSend(v96, "objectAtIndexedSubscript:", v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "paymentIdentifier");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("payment-%ld-planID-%@"), v98, v108);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "setPaymentIdentifier:", v101);

      v102 = objc_msgSend(v97, "indexOfObject:", v100);
      if (v102 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v103 = v102;
        objc_msgSend(v99, "paymentIdentifier");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "replaceObjectAtIndex:withObject:", v103, v104);

        v97 = v134;
      }

      ++v98;
      v96 = v135;
    }
    while (v98 < objc_msgSend(v135, "count"));
  }
  if (a15)
    *a15 = (id)objc_msgSend(v97, "copy");
  v105 = (void *)objc_msgSend(v96, "copy");

  return v105;
}

uint64_t __311__PKPayLaterFinancingPlanGenerator__paymentsForConfigs_installmentDueDates_planIdentifier_transactionDate_installmentAmountWithInterest_installmentAmountWithoutInterest_installmentInterest_totalAmountWithInterest_totalAmountWithoutInterest_totalInterest_currency_ignoreFutureDates_paymentIdentifiersForDispute___block_invoke(uint64_t a1, void *a2, void *a3)
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

+ (id)_disputesForPayments:(id)a3 paymentIdentifiersForDispute:(id)a4 planIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  __objc2_class **v14;
  unint64_t v15;
  __objc2_class **v16;
  unint64_t v17;
  void *v18;
  void *v19;
  PKPayLaterFinancingPlanDispute *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  PKPayLaterAppliedPayment *v34;
  void *v35;
  void *v36;
  PKPayLaterAppliedPayment *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  _QWORD v67[4];
  id v68;

  v7 = a3;
  v64 = a4;
  v8 = a5;
  objc_msgSend(v7, "pk_objectsPassingTest:", &__block_literal_global_42);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v7;
  objc_msgSend(v7, "pk_objectsPassingTest:", &__block_literal_global_43_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (uint64_t)fmax((double)(unint64_t)objc_msgSend(v9, "count"), (double)(unint64_t)objc_msgSend(v10, "count"));
  v12 = 0x1E0C99000uLL;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = off_1E2A9F000;
  v15 = 0x1E0CB3000;
  v16 = off_1E2A9F000;
  v62 = v11;
  v63 = v10;
  v65 = v8;
  v66 = v13;
  v60 = v9;
  if (v11 >= 1)
  {
    v17 = 0;
    while (1)
    {
      if (v17 >= objc_msgSend(v9, "count"))
      {
        v18 = 0;
      }
      else
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v17 >= objc_msgSend(v10, "count"))
      {
        v19 = 0;
      }
      else
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v20 = objc_alloc_init(PKPayLaterFinancingPlanDispute);
      if (v18)
      {
        if (!v19)
          break;
      }
      if (v18 && v19)
      {
        objc_msgSend(v19, "amount");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "amount");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "pk_absoluteValue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "amount");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "amount");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "pk_absoluteValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v23, "compare:", v26);

        v12 = 0x1E0C99000uLL;
        v9 = v60;

        v8 = v65;
        if (v27)
          v21 = 5;
        else
          v21 = 4;
        goto LABEL_17;
      }
LABEL_20:

      ++v17;
      v10 = v63;
      v15 = 0x1E0CB3000uLL;
      if (v62 == v17)
        goto LABEL_21;
    }
    v21 = 1;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dispute-%ld-loanID-%@"), v17, v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterFinancingPlanDispute setIdentifier:](v20, "setIdentifier:", v28);

    -[PKPayLaterFinancingPlanDispute setState:](v20, "setState:", v21);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dateByAddingTimeInterval:", 604800.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterFinancingPlanDispute setDeadlineDate:](v20, "setDeadlineDate:", v30);

    -[PKPayLaterFinancingPlanDispute setEmailAddress:](v20, "setEmailAddress:", CFSTR("example@apple.com"));
    objc_msgSend(v18, "postedDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterFinancingPlanDispute setOpenDate:](v20, "setOpenDate:", v31);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterFinancingPlanDispute setLastUpdated:](v20, "setLastUpdated:", v32);

    v33 = objc_alloc_init(*(Class *)(v12 + 3560));
    v16 = off_1E2A9F000;
    v34 = objc_alloc_init(PKPayLaterAppliedPayment);
    objc_msgSend(v18, "amount");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterAppliedPayment setAmountApplied:](v34, "setAmountApplied:", v35);

    objc_msgSend(v18, "paymentIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterAppliedPayment setPaymentIdentifier:](v34, "setPaymentIdentifier:", v36);

    objc_msgSend(v33, "safelyAddObject:", v34);
    if (v19)
    {
      v37 = objc_alloc_init(PKPayLaterAppliedPayment);
      objc_msgSend(v19, "amount");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterAppliedPayment setAmountApplied:](v37, "setAmountApplied:", v38);

      objc_msgSend(v19, "paymentIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterAppliedPayment setPaymentIdentifier:](v37, "setPaymentIdentifier:", v39);

      objc_msgSend(v33, "safelyAddObject:", v37);
    }
    v40 = (void *)objc_msgSend(v33, "copy");
    -[PKPayLaterFinancingPlanDispute setAppliedPayments:](v20, "setAppliedPayments:", v40);

    v13 = v66;
    objc_msgSend(v66, "addObject:", v20);

    v12 = 0x1E0C99000;
    v14 = off_1E2A9F000;
    goto LABEL_20;
  }
LABEL_21:
  v41 = v64;
  if (objc_msgSend(v64, "count"))
  {
    v42 = 0;
    do
    {
      v43 = objc_msgSend(v13, "count") + v42;
      objc_msgSend(v41, "objectAtIndexedSubscript:", v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __101__PKPayLaterFinancingPlanGenerator__disputesForPayments_paymentIdentifiersForDispute_planIdentifier___block_invoke_3;
      v67[3] = &unk_1E2AC9438;
      v68 = v44;
      v45 = v44;
      objc_msgSend(v59, "pk_firstObjectPassingTest:", v67);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_alloc_init(v14[105]);
      objc_msgSend(*(id *)(v15 + 2368), "stringWithFormat:", CFSTR("dispute-%ld-loanID-%@"), v43, v8);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setIdentifier:", v48);

      objc_msgSend(v47, "setState:", 3);
      objc_msgSend(v46, "postedDate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "dateByAddingTimeInterval:", -604800.0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setOpenDate:", v50);

      v41 = v64;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setLastUpdated:", v51);

      v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v53 = objc_alloc_init(v16[87]);
      objc_msgSend(v46, "amount");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setAmountApplied:", v54);

      objc_msgSend(v46, "paymentIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setPaymentIdentifier:", v55);

      objc_msgSend(v52, "safelyAddObject:", v53);
      v56 = (void *)objc_msgSend(v52, "copy");
      objc_msgSend(v47, "setAppliedPayments:", v56);

      v13 = v66;
      objc_msgSend(v66, "addObject:", v47);

      v8 = v65;
      v15 = 0x1E0CB3000;

      v14 = off_1E2A9F000;
      ++v42;
    }
    while (v42 < objc_msgSend(v64, "count"));
  }
  if (objc_msgSend(v13, "count"))
    v57 = (void *)objc_msgSend(v13, "copy");
  else
    v57 = 0;

  return v57;
}

BOOL __101__PKPayLaterFinancingPlanGenerator__disputesForPayments_paymentIdentifiersForDispute_planIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 2;
}

BOOL __101__PKPayLaterFinancingPlanGenerator__disputesForPayments_paymentIdentifiersForDispute_planIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 4;
}

uint64_t __101__PKPayLaterFinancingPlanGenerator__disputesForPayments_paymentIdentifiersForDispute_planIdentifier___block_invoke_3(uint64_t a1, void *a2)
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

+ (id)_createInstallmentsWithDueDates:(id)a3 installmentAmountWithInterest:(id)a4 currency:(id)a5 planIdentifier:(id)a6
{
  id v9;
  NSDecimalNumber *v10;
  NSString *v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PKPayLaterInstallment *v18;
  PKPayLaterInstallment *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v9 = a3;
  v10 = (NSDecimalNumber *)a4;
  v11 = (NSString *)a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v9, "count"))
  {
    v14 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "compare:", v15);

      v18 = objc_alloc_init(PKPayLaterInstallment);
      v19 = v18;
      if (v17 == 1)
        v20 = 4;
      else
        v20 = 1;
      -[PKPayLaterInstallment setStatus:](v18, "setStatus:", v20);
      -[PKPayLaterInstallment setDueDate:](v19, "setDueDate:", v15);
      -[PKPayLaterInstallment setPlanIdentifier:](v19, "setPlanIdentifier:", v12);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("intallment-%ld-planID-%@"), v14, v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterInstallment setInstallmentIdentifier:](v19, "setInstallmentIdentifier:", v21);

      PKCurrencyAmountCreate(v10, v11, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterInstallment setTotalAmount:](v19, "setTotalAmount:", v22);

      PKCurrencyAmountCreate(v10, v11, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterInstallment setCurrentBalance:](v19, "setCurrentBalance:", v23);

      objc_msgSend(v13, "addObject:", v19);
      ++v14;
    }
    while (v14 < objc_msgSend(v9, "count"));
  }
  objc_msgSend(v13, "sortUsingComparator:", &__block_literal_global_53);
  v24 = (void *)objc_msgSend(v13, "copy");

  return v24;
}

uint64_t __122__PKPayLaterFinancingPlanGenerator__createInstallmentsWithDueDates_installmentAmountWithInterest_currency_planIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
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

+ (id)_currentBalanceForPlanWithTotalAmount:(id)a3 installments:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v22 = a1;
  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  v24 = v7;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      v12 = v7;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
        objc_msgSend(v13, "totalAmount", v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "amount");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "currentBalance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "amount");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumberBySubtracting:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "decimalNumberBySubtracting:", v18);
        v7 = (id)objc_claimAutoreleasedReturnValue();

        ++v11;
        v12 = v7;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }
  objc_msgSend(MEMORY[0x1E0CB3598], "zero", v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_maximumNumber:number2:", v7, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)_installmentDueDatesForInstallmentCount:(int64_t)a3 productType:(unint64_t)a4 transactionDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  PKEndOfDayWithTimeZone(v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safelyAddObject:", v10);

  if (a3 >= 2)
  {
    v11 = 0;
    v12 = a3 - 1;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_nextDateWithProductType:referenceDate:", a4, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safelyAddObject:", v14);

      ++v11;
    }
    while (v12 != v11);
  }
  v15 = (void *)objc_msgSend(v9, "copy");

  return v15;
}

+ (id)_principalPaidToDateForInstallments:(id)a3 installmentAmountWithoutInterest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      v12 = v7;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
        objc_msgSend(v13, "totalAmount");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "amount");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "currentBalance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "amount");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumberBySubtracting:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "_minimumNumber:number2:", v6, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "decimalNumberByAdding:", v19);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        ++v11;
        v12 = v7;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  return v7;
}

+ (id)_interestPaidToDateForInstallments:(id)a3 installmentInterest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "status", (_QWORD)v15) == 3)
        {
          objc_msgSend(v7, "decimalNumberByAdding:", v6);
          v13 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v13;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)_nextDateWithProductType:(unint64_t)a3 referenceDate:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a3 != 1)
    return 0;
  objc_msgSend(a4, "dateByAddingTimeInterval:", 1209600.0, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_termsDetailsForPlanIdentifier:(id)a3
{
  id v3;
  PKPayLaterFinancingPlanTermsDetails *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(PKPayLaterFinancingPlanTermsDetails);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("installmentAgreementIdentifier-%@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayLaterFinancingPlanTermsDetails setInstallmentAgreementIdentifier:](v4, "setInstallmentAgreementIdentifier:", v5);
  return v4;
}

+ (id)_minimumNumber:(id)a3 number2:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "compare:", v5) == 1)
    v7 = v5;
  else
    v7 = v6;
  v8 = v7;

  return v8;
}

+ (id)_maximumNumber:(id)a3 number2:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "compare:", v5) == 1)
    v7 = v6;
  else
    v7 = v5;
  v8 = v7;

  return v8;
}

+ (id)_installmentAmountWithInterestForAPR:(id)a3 totalPrincipal:(id)a4 installmentCount:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  double v13;
  float v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  int v24;
  _QWORD v25[2];
  int v26;

  v7 = a3;
  v8 = a4;
  if (v7 && !objc_msgSend(v7, "pk_isZeroNumber"))
  {
    objc_msgSend(v7, "floatValue");
    v13 = v12;
    objc_msgSend(v8, "floatValue");
    v15 = v14;
    v16 = pow(v13 / 12.0 + 1.0, (double)a5);
    if (v16 == 1.0)
      v17 = v15 / (double)a5;
    else
      v17 = v13 / 12.0 * (v16 * v15) / (v16 + -1.0);
    v20 = (void *)MEMORY[0x1E0CB3598];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v21;
    if (v21)
    {
      objc_msgSend(v21, "decimalValue");
    }
    else
    {
      v23[0] = 0;
      v23[1] = 0;
      v24 = 0;
    }
    objc_msgSend(v20, "decimalNumberWithDecimal:", v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3598];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "decimalValue");
    }
    else
    {
      v25[0] = 0;
      v25[1] = 0;
      v26 = 0;
    }
    objc_msgSend(v9, "decimalNumberWithDecimal:", v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "decimalNumberByDividingBy:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

+ (id)payLaterFinancingPlanFundingSourcesForOptions:(unint64_t)a3
{
  char v3;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(a1, "_bankOfAmericaDebitPlanSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(a1, "_chaseDebitPlanSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(a1, "_appleCashPlanSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v12);

  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  objc_msgSend(a1, "_wellsFargoACHPlanSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v13);

  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    objc_msgSend(a1, "_bankOfTheWestACHPlanSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
LABEL_7:
  if (objc_msgSend(v5, "count"))
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

+ (id)payLaterPaymentFundingSourcesForOptions:(unint64_t)a3
{
  char v3;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(a1, "_bankOfAmericaDebitPaymentSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(a1, "_chaseDebitPaymentSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(a1, "_appleCashPaymentSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v12);

  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  objc_msgSend(a1, "_wellsFargoACHPaymentSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v13);

  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    objc_msgSend(a1, "_bankOfTheWestACHPaymentSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
LABEL_7:
  if (objc_msgSend(v5, "count"))
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

+ (id)_bankOfAmericaDebitPlanSource
{
  PKPayLaterFinancingPlanFundingSource *v2;
  PKPayLaterFundingSourcePaymentPassDetails *v3;

  v2 = objc_alloc_init(PKPayLaterFinancingPlanFundingSource);
  -[PKPayLaterFinancingPlanFundingSource setIdentifier:](v2, "setIdentifier:", CFSTR("bank-of-america-debit"));
  -[PKPayLaterFinancingPlanFundingSource setType:](v2, "setType:", 1);
  v3 = objc_alloc_init(PKPayLaterFundingSourcePaymentPassDetails);
  -[PKPayLaterFundingSourcePaymentPassDetails setType:](v3, "setType:", 1);
  -[PKPayLaterFundingSourcePaymentPassDetails setCardName:](v3, "setCardName:", CFSTR("Bank of America Visa Debit Card"));
  -[PKPayLaterFundingSourcePaymentPassDetails setCardNetwork:](v3, "setCardNetwork:", 4);
  -[PKPayLaterFundingSourcePaymentPassDetails setCardSuffix:](v3, "setCardSuffix:", CFSTR("4923"));
  -[PKPayLaterFundingSourcePaymentPassDetails setCardType:](v3, "setCardType:", 1);
  -[PKPayLaterFundingSourcePaymentPassDetails setDpanIdentifier:](v3, "setDpanIdentifier:", CFSTR("DNITHE302132306071944346"));
  -[PKPayLaterFundingSourcePaymentPassDetails setFpanIdentifier:](v3, "setFpanIdentifier:", CFSTR("V-5820240768500153262398"));
  -[PKPayLaterFinancingPlanFundingSource setDetails:](v2, "setDetails:", v3);

  return v2;
}

+ (id)_appleCashPlanSource
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKPayLaterFinancingPlanFundingSource *v9;
  PKPayLaterFundingSourcePaymentPassDetails *v10;
  void *v11;
  void *v12;

  +[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "associatedPassUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passWithUniqueID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paymentPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "devicePrimaryPaymentApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(PKPayLaterFinancingPlanFundingSource);
  -[PKPayLaterFinancingPlanFundingSource setIdentifier:](v9, "setIdentifier:", CFSTR("peer-payment-account"));
  -[PKPayLaterFinancingPlanFundingSource setType:](v9, "setType:", 1);
  v10 = objc_alloc_init(PKPayLaterFundingSourcePaymentPassDetails);
  -[PKPayLaterFundingSourcePaymentPassDetails setType:](v10, "setType:", 1);
  -[PKPayLaterFundingSourcePaymentPassDetails setCardName:](v10, "setCardName:", CFSTR("Apple Cash"));
  -[PKPayLaterFundingSourcePaymentPassDetails setCardNetwork:](v10, "setCardNetwork:", objc_msgSend(v8, "paymentNetworkIdentifier"));
  -[PKPayLaterFundingSourcePaymentPassDetails setCardType:](v10, "setCardType:", 1);
  objc_msgSend(v8, "dpanIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFundingSourcePaymentPassDetails setDpanIdentifier:](v10, "setDpanIdentifier:", v11);

  objc_msgSend(v7, "primaryAccountIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFundingSourcePaymentPassDetails setFpanIdentifier:](v10, "setFpanIdentifier:", v12);

  -[PKPayLaterFinancingPlanFundingSource setDetails:](v9, "setDetails:", v10);
  return v9;
}

+ (id)_chaseDebitPlanSource
{
  PKPayLaterFinancingPlanFundingSource *v2;
  PKPayLaterFundingSourcePaymentPassDetails *v3;

  v2 = objc_alloc_init(PKPayLaterFinancingPlanFundingSource);
  -[PKPayLaterFinancingPlanFundingSource setIdentifier:](v2, "setIdentifier:", CFSTR("chase-debit"));
  -[PKPayLaterFinancingPlanFundingSource setType:](v2, "setType:", 1);
  v3 = objc_alloc_init(PKPayLaterFundingSourcePaymentPassDetails);
  -[PKPayLaterFundingSourcePaymentPassDetails setType:](v3, "setType:", 1);
  -[PKPayLaterFundingSourcePaymentPassDetails setCardName:](v3, "setCardName:", CFSTR("Chase Debit Card"));
  -[PKPayLaterFundingSourcePaymentPassDetails setCardNetwork:](v3, "setCardNetwork:", 4);
  -[PKPayLaterFundingSourcePaymentPassDetails setCardSuffix:](v3, "setCardSuffix:", CFSTR("9842"));
  -[PKPayLaterFundingSourcePaymentPassDetails setCardType:](v3, "setCardType:", 1);
  -[PKPayLaterFundingSourcePaymentPassDetails setDpanIdentifier:](v3, "setDpanIdentifier:", CFSTR("dpan-id-chase-debit"));
  -[PKPayLaterFundingSourcePaymentPassDetails setFpanIdentifier:](v3, "setFpanIdentifier:", CFSTR("dpan-id-chase-debit"));
  -[PKPayLaterFinancingPlanFundingSource setDetails:](v2, "setDetails:", v3);

  return v2;
}

+ (id)_wellsFargoACHPlanSource
{
  PKPayLaterFinancingPlanFundingSource *v2;
  PKPayLaterFundingSourceBankDetails *v3;

  v2 = objc_alloc_init(PKPayLaterFinancingPlanFundingSource);
  -[PKPayLaterFinancingPlanFundingSource setIdentifier:](v2, "setIdentifier:", CFSTR("wells-fargo-ACH"));
  -[PKPayLaterFinancingPlanFundingSource setType:](v2, "setType:", 2);
  v3 = objc_alloc_init(PKPayLaterFundingSourceBankDetails);
  -[PKPayLaterFundingSourceBankDetails setType:](v3, "setType:", 2);
  -[PKPayLaterFundingSourceBankDetails setBankName:](v3, "setBankName:", CFSTR("Wells Fargo Bank"));
  -[PKPayLaterFundingSourceBankDetails setAccountNumberSuffix:](v3, "setAccountNumberSuffix:", CFSTR("5547"));
  -[PKPayLaterFinancingPlanFundingSource setDetails:](v2, "setDetails:", v3);

  return v2;
}

+ (id)_bankOfTheWestACHPlanSource
{
  PKPayLaterFinancingPlanFundingSource *v2;
  PKPayLaterFundingSourceBankDetails *v3;

  v2 = objc_alloc_init(PKPayLaterFinancingPlanFundingSource);
  -[PKPayLaterFinancingPlanFundingSource setIdentifier:](v2, "setIdentifier:", CFSTR("bank-of-west-ACH"));
  -[PKPayLaterFinancingPlanFundingSource setType:](v2, "setType:", 2);
  v3 = objc_alloc_init(PKPayLaterFundingSourceBankDetails);
  -[PKPayLaterFundingSourceBankDetails setType:](v3, "setType:", 2);
  -[PKPayLaterFundingSourceBankDetails setBankName:](v3, "setBankName:", CFSTR("Bank of the West"));
  -[PKPayLaterFundingSourceBankDetails setAccountNumberSuffix:](v3, "setAccountNumberSuffix:", CFSTR("8452"));
  -[PKPayLaterFinancingPlanFundingSource setDetails:](v2, "setDetails:", v3);

  return v2;
}

+ (id)_bankOfAmericaDebitPaymentSource
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_bankOfAmericaDebitPlanSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_paymentFundingSourceFromPlanFundingSource:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_appleCashPaymentSource
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_appleCashPlanSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_paymentFundingSourceFromPlanFundingSource:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_chaseDebitPaymentSource
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_chaseDebitPlanSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_paymentFundingSourceFromPlanFundingSource:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_wellsFargoACHPaymentSource
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_wellsFargoACHPlanSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_paymentFundingSourceFromPlanFundingSource:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_bankOfTheWestACHPaymentSource
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_bankOfAmericaDebitPlanSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_paymentFundingSourceFromPlanFundingSource:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_paymentFundingSourceFromPlanFundingSource:(id)a3
{
  id v3;
  PKPayLaterPaymentFundingSource *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(PKPayLaterPaymentFundingSource);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterPaymentFundingSource setIdentifier:](v4, "setIdentifier:", v5);

  -[PKPayLaterPaymentFundingSource setType:](v4, "setType:", objc_msgSend(v3, "type"));
  objc_msgSend(v3, "details");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayLaterPaymentFundingSource setDetails:](v4, "setDetails:", v6);
  return v4;
}

+ (id)generatePayLaterAccountForFinancingPlans:(id)a3
{
  id v4;
  void *v5;
  NSDecimalNumber *v6;
  NSDecimalNumber *v7;
  NSDecimalNumber *v8;
  NSDecimalNumber *v9;
  NSDecimalNumber *v10;
  NSDecimalNumber *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  NSDecimalNumber *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v4 = a3;
  objc_msgSend(a1, "_boilerPlateAccount");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "payLaterDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = 0;
  v33 = 0;
  v31 = 0;
  v32 = 0;
  v29 = 0;
  v30 = 0;
  v27 = 0;
  v28 = 0;
  objc_msgSend(a1, "_calculateCurrentBalanceForFinancingPlans:currentBalance:bnplCurrentBalance:loanCurrentBalance:amountPaid:bnplAmountPaid:loanAmountPaid:totalFinanced:bnplTotalFinanced:loanTotalFinanced:", v4, &v35, &v34, &v33, &v32, &v31, &v30, &v29, &v28, &v27);
  v23 = (NSDecimalNumber *)v35;
  v6 = (NSDecimalNumber *)v34;
  v25 = v33;
  v7 = (NSDecimalNumber *)v32;
  v8 = (NSDecimalNumber *)v31;
  v24 = v30;
  v9 = (NSDecimalNumber *)v29;
  v10 = (NSDecimalNumber *)v28;
  v22 = v27;
  objc_msgSend(a1, "_nextDueAmountForFinancingPlans:", v4);
  v11 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

  PKCurrencyAmountCreate(v23, CFSTR("USD"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentBalance:", v12);

  PKCurrencyAmountCreate(v9, CFSTR("USD"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTotalFinanced:", v13);

  PKCurrencyAmountCreate(v7, CFSTR("USD"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAmountPaid:", v14);

  PKCurrencyAmountCreate(v11, CFSTR("USD"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNextDueAmount:", v15);

  objc_msgSend(v5, "productForProductType:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "productDetails");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  PKCurrencyAmountCreate(v6, CFSTR("USD"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCurrentBalance:", v18);

  PKCurrencyAmountCreate(v10, CFSTR("USD"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTotalFinanced:", v19);

  PKCurrencyAmountCreate(v8, CFSTR("USD"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setAmountPaid:", v20);
  return v26;
}

+ (void)insertAndUpdateAccountWithNewPlanType:(unint64_t)a3 installmentCount:(int64_t)a4 principalAmount:(id)a5 apr:(id)a6 daysSinceTransactionStart:(int64_t)a7 merchant:(unint64_t)a8 completion:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v15 = a9;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a4 >= 1)
  {
    v17 = 0;
    do
    {
      +[PKPayLaterFinancingPlanGeneratorPaymentConfiguration paymentConfigurationForDefaultInstallmentNumber:](PKPayLaterFinancingPlanGeneratorPaymentConfiguration, "paymentConfigurationForDefaultInstallmentNumber:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v18);

      ++v17;
    }
    while (a4 != v17);
  }
  +[PKPayLaterFinancingPlanGeneratorConfiguration configurationWithProductType:apr:totalPrincipal:installmentCount:daysSinceTransactionStart:merchant:fundingSources:payments:](PKPayLaterFinancingPlanGeneratorConfiguration, "configurationWithProductType:apr:totalPrincipal:installmentCount:daysSinceTransactionStart:merchant:fundingSources:payments:", a3, v14, v13, a4, a7, a8, 1, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setIgnoreFuturePayments:", 1);
  +[PKPayLaterFinancingPlanGenerator financingPlanWithConfiguration:](PKPayLaterFinancingPlanGenerator, "financingPlanWithConfiguration:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "insertAndUpdateAccountWithAdditionalFinancingPlans:completion:", v21, v15);

}

+ (void)insertAndUpdateAccountWithAdditionalFinancingPlans:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKAsyncUnaryOperationComposer *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__68;
  v42[4] = __Block_byref_object_dispose__68;
  v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__68;
  v40[4] = __Block_byref_object_dispose__68;
  v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__68;
  v38[4] = __Block_byref_object_dispose__68;
  v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v6);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__68;
  v36[4] = __Block_byref_object_dispose__68;
  v37 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke;
  v33[3] = &unk_1E2AC7148;
  v11 = v9;
  v34 = v11;
  v35 = v38;
  -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v33);
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_4;
  v28[3] = &unk_1E2AD86C0;
  v31 = v38;
  v32 = a1;
  v30 = v42;
  v12 = v11;
  v29 = v12;
  -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v28);
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_7;
  v23[3] = &unk_1E2AD86E8;
  v13 = v12;
  v24 = v13;
  v25 = v38;
  v26 = v42;
  v27 = v36;
  -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v23);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_10;
  v17[3] = &unk_1E2AD8710;
  v19 = v42;
  v20 = v40;
  v21 = v38;
  v22 = v36;
  v15 = v7;
  v18 = v15;
  v16 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v8, "evaluateWithInput:completion:", v14, v17);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

}

void __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  PKAccountServicePayLaterFinancingPlanQuery *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = -[PKAccountServicePayLaterFinancingPlanQuery initWithAccountIdentifier:queryItems:]([PKAccountServicePayLaterFinancingPlanQuery alloc], "initWithAccountIdentifier:queryItems:", CFSTR("pay-later-account-001"), 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_2;
  v13[3] = &unk_1E2AD8670;
  v10 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v15 = v7;
  v16 = v9;
  v14 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v10, "financingPlansWithQuery:completion:", v8, v13);

}

void __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_3;
  block[3] = &unk_1E2AD2498;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "relevantFinancingPlans");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 56), "generatePayLaterAccountForFinancingPlans:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v12 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(*(_QWORD *)(v11 + 8) + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_5;
  v16[3] = &unk_1E2AD8698;
  v18 = v7;
  v19 = v11;
  v17 = v6;
  v14 = v6;
  v15 = v7;
  objc_msgSend(v12, "insertOrUpdateLocalAccount:completion:", v13, v16);

}

void __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_6;
  block[3] = &unk_1E2AD2498;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_6(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  return (*(uint64_t (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) == 0);
}

void __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_7(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)a1[4];
  v9 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "accountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_8;
  v14[3] = &unk_1E2AD0088;
  v11 = a1[7];
  v16 = v7;
  v17 = v11;
  v15 = v6;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v8, "insertOrUpdateLocalFinancingPlans:accountIdentifier:completion:", v9, v10, v14);

}

void __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_9;
  block[3] = &unk_1E2AD2498;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_9(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __107__PKPayLaterFinancingPlanGenerator_Account__insertAndUpdateAccountWithAdditionalFinancingPlans_completion___block_invoke_10(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString **v11;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "count");
    if (v8 == objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "count"))
      goto LABEL_6;
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19 = CFSTR("Could not add financing plans");
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = &v19;
    v12 = &v18;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("Could not form pay later account");
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = (const __CFString **)v21;
    v12 = &v20;
  }
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

LABEL_6:
  v17 = a1[4];
  if (v17)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v17 + 16))(v17, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

}

+ (void)deleteMockAccountWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__PKPayLaterFinancingPlanGenerator_Account__deleteMockAccountWithCompletion___block_invoke;
  v6[3] = &unk_1E2ABD9C8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "deleteLocalAccountWithIdentifier:completion:", CFSTR("pay-later-account-001"), v6);

}

void __77__PKPayLaterFinancingPlanGenerator_Account__deleteMockAccountWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__PKPayLaterFinancingPlanGenerator_Account__deleteMockAccountWithCompletion___block_invoke_2;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __77__PKPayLaterFinancingPlanGenerator_Account__deleteMockAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

+ (void)_calculateCurrentBalanceForFinancingPlans:(id)a3 currentBalance:(id *)a4 bnplCurrentBalance:(id *)a5 loanCurrentBalance:(id *)a6 amountPaid:(id *)a7 bnplAmountPaid:(id *)a8 loanAmountPaid:(id *)a9 totalFinanced:(id *)a10 bnplTotalFinanced:(id *)a11 loanTotalFinanced:(id *)a12
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v37;
  id v40;
  id v41;
  id obj;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v12;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v47)
  {
    v43 = *(_QWORD *)v50;
    do
    {
      v16 = 0;
      v17 = v15;
      v18 = v14;
      v19 = v13;
      do
      {
        if (*(_QWORD *)v50 != v43)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v16);
        objc_msgSend(v20, "planSummary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "currentBalance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "amount");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "planSummary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "paymentAmountToDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "amount");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "planSummary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "totalAmount");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "amount");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "decimalNumberByAdding:", v23);
        v48 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "decimalNumberByAdding:", v26);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "decimalNumberByAdding:", v29);
        v30 = objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v20, "productType") == 1)
        {
          objc_msgSend(v46, "decimalNumberByAdding:", v23);
          v31 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v45, "decimalNumberByAdding:", v26);
          v32 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v44, "decimalNumberByAdding:", v29);
          v33 = objc_claimAutoreleasedReturnValue();

          v44 = (id)v33;
          v45 = (id)v32;
          v46 = (id)v31;
        }

        ++v16;
        v17 = (void *)v30;
        v18 = v14;
        v13 = v48;
        v19 = v48;
      }
      while (v47 != v16);
      v15 = (void *)v30;
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v47);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v13);
  if (a5)
    *a5 = objc_retainAutorelease(v46);
  if (a6)
    *a6 = objc_retainAutorelease(v41);
  if (a7)
    *a7 = objc_retainAutorelease(v14);
  if (a8)
    *a8 = objc_retainAutorelease(v45);
  if (a9)
    *a9 = objc_retainAutorelease(v40);
  if (a10)
    *a10 = objc_retainAutorelease(v15);
  if (a11)
    *a11 = objc_retainAutorelease(v44);
  if (a12)
    *a12 = objc_retainAutorelease(v37);

}

+ (id)_nextDueAmountForFinancingPlans:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v26;
    while (1)
    {
      v10 = 0;
      v24 = v7;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v10), "scheduleSummary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "nextDueInstallment");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v12, "dueDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          PKDateIgnoringSmallerUnitsWithTimeZone(v13, 16, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "currentBalance");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "amount");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            if (objc_msgSend(v14, "compare:", v8) != -1)
            {
              if (!objc_msgSend(v14, "compare:", v8))
              {
                objc_msgSend(v4, "decimalNumberByAdding:", v16);
                v17 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_12;
              }
LABEL_15:

              goto LABEL_16;
            }
            v19 = v9;
            v20 = v4;
            v21 = v5;
            v22 = v14;

            v18 = v16;
            v8 = v22;
            v5 = v21;
            v4 = v20;
            v9 = v19;
            v7 = v24;
          }
          else
          {
            v8 = v14;
            v17 = v16;
LABEL_12:
            v18 = v17;
          }

          v4 = v18;
          goto LABEL_15;
        }
LABEL_16:

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (!v7)
        goto LABEL_20;
    }
  }
  v8 = 0;
LABEL_20:

  return v4;
}

+ (id)_boilerPlateAccount
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PKAccount *v8;
  void *v9;
  void *v10;
  PKPayLaterAccountDetails *v11;
  PKPayLaterAccountUserInfo *v12;
  PKPayLaterAccountUserInfoValue *v13;
  void *v14;
  PKPayLaterAccountUserInfoValue *v15;
  PKPayLaterAccountUserInfoValue *v16;
  PKPayLaterAccountUserInfoValue *v17;
  NSDecimalNumber *v18;
  void *v19;
  PKPayLaterAccountProductDetails *v20;
  void *v21;
  NSDecimalNumber *v22;
  void *v23;
  NSDecimalNumber *v24;
  void *v25;
  PKPayLaterAccountProduct *v26;
  PKPayLaterAccountProductDetails *v27;
  void *v28;
  NSDecimalNumber *v29;
  void *v30;
  NSDecimalNumber *v31;
  void *v32;
  void *v33;
  PKAccountDetails *v34;
  PKPayLaterAccountProduct *v36;
  PKPayLaterAccountUserInfoValue *v37;
  PKPayLaterAccountUserInfoValue *v38;
  PKPayLaterAccountUserInfoValue *v39;
  PKPayLaterAccountUserInfoValue *v40;
  PKPayLaterAccountUserInfoValue *v41;
  PKPayLaterAccountUserInfoValue *v42;
  PKPayLaterAccountUserInfoValue *v43;
  void *v44;
  id v45;
  PKPayLaterAccountUserInfoValue *v46;
  PKPayLaterAccountUserInfoValue *v47;
  PKPayLaterAccountUserInfoValue *v48;
  PKAccount *v49;
  PKPayLaterAccountTermsDetails *v50;
  PKPayLaterAccountFeatureDescriptor *v51;
  PKPayLaterAccountFeatureDescriptor *v52;
  PKAccountAdditionalPushTopics *v53;
  PKAccountFetchPeriods *v54;
  void *v55;
  void *v56;

  PKAccountServiceOverrideURL();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://example.apple.com/fps"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("v1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("accounts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("pay-later-account-001"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(PKAccount);
  -[PKAccount setAccountIdentifier:](v8, "setAccountIdentifier:", CFSTR("pay-later-account-001"));
  v56 = v5;
  -[PKAccount setAccountBaseURL:](v8, "setAccountBaseURL:", v5);
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("paymentservices"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount setPaymentServicesBaseURL:](v8, "setPaymentServicesBaseURL:", v9);

  -[PKAccount setPaymentServicesBaseURL:](v8, "setPaymentServicesBaseURL:", v55);
  -[PKAccount setFeature:](v8, "setFeature:", 3);
  -[PKAccount setType:](v8, "setType:", 2);
  -[PKAccount setState:](v8, "setState:", 1);
  -[PKAccount setStateReason:](v8, "setStateReason:", 0);
  -[PKAccount setAccessLevel:](v8, "setAccessLevel:", 1);
  v54 = objc_alloc_init(PKAccountFetchPeriods);
  -[PKAccountFetchPeriods setFinancingPlansFetchPeriod:](v54, "setFinancingPlansFetchPeriod:", 86400.0);
  -[PKAccountFetchPeriods setAccountFetchPeriod:](v54, "setAccountFetchPeriod:", 76400.0);
  -[PKAccountFetchPeriods setFundingSourcesFetchPeriod:](v54, "setFundingSourcesFetchPeriod:", 66400.0);
  v49 = v8;
  -[PKAccount setFetchPeriods:](v8, "setFetchPeriods:", v54);
  v53 = objc_alloc_init(PKAccountAdditionalPushTopics);
  -[PKAccountAdditionalPushTopics setFinancingPlans:](v53, "setFinancingPlans:", CFSTR("financingPlans"));
  -[PKAccountAdditionalPushTopics setFundingSources:](v53, "setFundingSources:", CFSTR("fundingSources"));
  -[PKAccountAdditionalPushTopics setAccount:](v53, "setAccount:", CFSTR("accountPushTopic"));
  v52 = objc_alloc_init(PKPayLaterAccountFeatureDescriptor);
  -[PKAccountFeatureDescriptor setIdentifier:](v52, "setIdentifier:", CFSTR("showNotifications"));
  v51 = objc_alloc_init(PKPayLaterAccountFeatureDescriptor);
  -[PKAccountFeatureDescriptor setIdentifier:](v51, "setIdentifier:", CFSTR("provisioningAllowed"));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v52, v51, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount setSupportedFeatures:](v8, "setSupportedFeatures:", v10);

  v11 = objc_alloc_init(PKPayLaterAccountDetails);
  -[PKPayLaterAccountDetails setCountryCode:](v11, "setCountryCode:", CFSTR("US"));
  -[PKPayLaterAccountDetails setAssociatedPassSerialNumber:](v11, "setAssociatedPassSerialNumber:", CFSTR("wallettest.cocoon.serialnumber"));
  -[PKPayLaterAccountDetails setAssociatedPassTypeIdentifier:](v11, "setAssociatedPassTypeIdentifier:", CFSTR("paymentpass.com.apple.wallet.dev"));
  -[PKPayLaterAccountDetails setCardNetwork:](v11, "setCardNetwork:", 3);
  -[PKPayLaterAccountDetails setAvailableLanguages:](v11, "setAvailableLanguages:", &unk_1E2C3E3C8);
  -[PKPayLaterAccountDetails setRequiresGenericMessaging:](v11, "setRequiresGenericMessaging:", 0);
  v50 = objc_alloc_init(PKPayLaterAccountTermsDetails);
  -[PKPayLaterAccountTermsDetails setTermsIdentifier:](v50, "setTermsIdentifier:", CFSTR("cocoon-terms-financing-option-identifier"));
  -[PKPayLaterAccountTermsDetails setTermsAcceptanceRequired:](v50, "setTermsAcceptanceRequired:", 0);
  -[PKPayLaterAccountDetails setTermsDetails:](v11, "setTermsDetails:", v50);
  v12 = objc_alloc_init(PKPayLaterAccountUserInfo);
  v48 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  -[PKPayLaterAccountUserInfoValue setText:](v48, "setText:", CFSTR("kabeles@icloud.com"));
  -[PKPayLaterAccountUserInfoValue setOdiAttribute:](v48, "setOdiAttribute:", CFSTR("emailAddress"));
  -[PKPayLaterAccountUserInfo setEmailAddress:](v12, "setEmailAddress:", v48);
  v47 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  -[PKPayLaterAccountUserInfoValue setText:](v47, "setText:", CFSTR("Katie"));
  -[PKPayLaterAccountUserInfoValue setOdiAttribute:](v47, "setOdiAttribute:", CFSTR("firstName"));
  -[PKPayLaterAccountUserInfo setFirstName:](v12, "setFirstName:", v47);
  v46 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  -[PKPayLaterAccountUserInfoValue setText:](v46, "setText:", CFSTR("Abeles"));
  -[PKPayLaterAccountUserInfoValue setOdiAttribute:](v46, "setOdiAttribute:", CFSTR("lastName"));
  -[PKPayLaterAccountUserInfo setLastName:](v12, "setLastName:", v46);
  v13 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  v45 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setCalendar:", v14);

  objc_msgSend(v45, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  objc_msgSend(v45, "dateFromString:", CFSTR("1993-19-03"));
  v43 = v13;
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterAccountUserInfoValue setDate:](v13, "setDate:", v44);
  -[PKPayLaterAccountUserInfoValue setOdiAttribute:](v13, "setOdiAttribute:", CFSTR("dateOfBirth"));
  -[PKPayLaterAccountUserInfo setDateOfBirth:](v12, "setDateOfBirth:", v13);
  v42 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  -[PKPayLaterAccountUserInfoValue setText:](v42, "setText:", CFSTR("(574)-555-0164"));
  -[PKPayLaterAccountUserInfoValue setOdiAttribute:](v42, "setOdiAttribute:", CFSTR("phoneNumber"));
  -[PKPayLaterAccountUserInfo setPhoneNumber:](v12, "setPhoneNumber:", v42);
  v41 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  -[PKPayLaterAccountUserInfoValue setText:](v41, "setText:", CFSTR("311 Sharon Lane"));
  -[PKPayLaterAccountUserInfoValue setOdiAttribute:](v41, "setOdiAttribute:", CFSTR("street1"));
  -[PKPayLaterAccountUserInfo setStreet1:](v12, "setStreet1:", v41);
  v40 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  -[PKPayLaterAccountUserInfoValue setText:](v40, "setText:", &stru_1E2ADF4C0);
  -[PKPayLaterAccountUserInfoValue setOdiAttribute:](v40, "setOdiAttribute:", CFSTR("street2"));
  -[PKPayLaterAccountUserInfo setStreet2:](v12, "setStreet2:", v40);
  v39 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  -[PKPayLaterAccountUserInfoValue setText:](v39, "setText:", CFSTR("South Bend"));
  -[PKPayLaterAccountUserInfoValue setOdiAttribute:](v39, "setOdiAttribute:", CFSTR("city"));
  -[PKPayLaterAccountUserInfo setCity:](v12, "setCity:", v39);
  v15 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  -[PKPayLaterAccountUserInfoValue setText:](v15, "setText:", CFSTR("IN"));
  -[PKPayLaterAccountUserInfoValue setOdiAttribute:](v15, "setOdiAttribute:", CFSTR("state"));
  -[PKPayLaterAccountUserInfo setState:](v12, "setState:", v15);
  v16 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  -[PKPayLaterAccountUserInfoValue setText:](v16, "setText:", CFSTR("46601"));
  -[PKPayLaterAccountUserInfoValue setOdiAttribute:](v16, "setOdiAttribute:", CFSTR("postalCode"));
  -[PKPayLaterAccountUserInfo setPostalCode:](v12, "setPostalCode:", v16);
  v38 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  -[PKPayLaterAccountUserInfoValue setHasHiddenValue:](v16, "setHasHiddenValue:", 1);
  -[PKPayLaterAccountUserInfo setSsn:](v12, "setSsn:", v38);
  v17 = objc_alloc_init(PKPayLaterAccountUserInfoValue);
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("100000"));
  v18 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v18, CFSTR("USD"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v17;
  -[PKPayLaterAccountUserInfoValue setCurrencyAmount:](v17, "setCurrencyAmount:", v19);

  -[PKPayLaterAccountUserInfoValue setOdiAttribute:](v15, "setOdiAttribute:", CFSTR("yearlyIncome"));
  -[PKPayLaterAccountUserInfo setYearlyIncome:](v12, "setYearlyIncome:", v17);
  -[PKPayLaterAccountDetails setUserInfo:](v11, "setUserInfo:", v12);
  v36 = objc_alloc_init(PKPayLaterAccountProduct);
  -[PKPayLaterAccountProduct setProductType:](v36, "setProductType:", 1);
  v20 = objc_alloc_init(PKPayLaterAccountProductDetails);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("America/New_York"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterAccountProductDetails setProductTimeZone:](v20, "setProductTimeZone:", v21);

  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("50"));
  v22 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v22, CFSTR("USD"), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterAccountProductDetails setMinimumSinglePurchaseAmount:](v20, "setMinimumSinglePurchaseAmount:", v23);

  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("1000"));
  v24 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v24, CFSTR("USD"), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterAccountProductDetails setMaximumSinglePurchaseAmount:](v20, "setMaximumSinglePurchaseAmount:", v25);

  v26 = objc_alloc_init(PKPayLaterAccountProduct);
  -[PKPayLaterAccountProduct setProductType:](v26, "setProductType:", 1);
  v27 = objc_alloc_init(PKPayLaterAccountProductDetails);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("America/New_York"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterAccountProductDetails setProductTimeZone:](v27, "setProductTimeZone:", v28);

  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("300"));
  v29 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v29, CFSTR("USD"), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterAccountProductDetails setMinimumSinglePurchaseAmount:](v27, "setMinimumSinglePurchaseAmount:", v30);

  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("10000"));
  v31 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v31, CFSTR("USD"), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterAccountProductDetails setMaximumSinglePurchaseAmount:](v27, "setMaximumSinglePurchaseAmount:", v32);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v36, v26, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterAccountDetails setProducts:](v11, "setProducts:", v33);

  v34 = -[PKAccountDetails initWithPayLaterDetails:]([PKAccountDetails alloc], "initWithPayLaterDetails:", v11);
  -[PKAccount setDetails:](v49, "setDetails:", v34);

  return v49;
}

@end

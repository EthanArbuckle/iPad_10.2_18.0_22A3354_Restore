@implementation PKCompoundInterestCalculator

- (PKCompoundInterestCalculator)initWithConfiguration:(id)a3
{
  id v5;
  PKCompoundInterestCalculator *v6;
  PKCompoundInterestCalculator *v7;
  uint64_t v8;
  NSCalendar *calendar;
  uint64_t v10;
  NSMutableDictionary *toDateCache;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCompoundInterestCalculator;
  v6 = -[PKCompoundInterestCalculator init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v8 = objc_claimAutoreleasedReturnValue();
    calendar = v7->_calendar;
    v7->_calendar = (NSCalendar *)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    toDateCache = v7->_toDateCache;
    v7->_toDateCache = (NSMutableDictionary *)v10;

  }
  return v7;
}

- (id)compoundInterest
{
  return -[PKCompoundInterestCalculator compoundInterestWithPaymentOfAmount:](self, "compoundInterestWithPaymentOfAmount:", 0);
}

- (id)compoundInterestWithPaymentOfAmount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCompoundInterestCalculator compoundInterestForPaymentOfAmount:onDate:](self, "compoundInterestForPaymentOfAmount:onDate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_interestCanBeCalculated
{
  PKCompoundInterestCalculatorConfiguration *configuration;
  BOOL v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  unsigned int v13;

  configuration = self->_configuration;
  if (!configuration)
    return 0;
  v4 = -[PKCompoundInterestCalculatorConfiguration isInDisasterRecovery](configuration, "isInDisasterRecovery");
  -[PKCompoundInterestCalculatorConfiguration apr](self->_configuration, "apr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKCompoundInterestCalculatorConfiguration compoundingPeriods](self->_configuration, "compoundingPeriods");
  -[PKCompoundInterestCalculatorConfiguration periodStartDate](self->_configuration, "periodStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCompoundInterestCalculatorConfiguration periodEndDate](self->_configuration, "periodEndDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCompoundInterestCalculatorConfiguration periodStartingBalance](self->_configuration, "periodStartingBalance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", v10) & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (v6 > 0) & ~objc_msgSend(v9, "isEqual:", v12);
      if (!v7)
        LOBYTE(v13) = 0;
      if (!v8)
        LOBYTE(v13) = 0;
      v11 = v13 & !v4;

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)compoundInterestForPaymentOfAmount:(id)a3 onDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PKCompoundInterestCalculatorConfiguration *configuration;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  PKCompoundInterestCalculator *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  _BOOL4 v30;
  uint64_t v31;
  PKCompoundInterestCalculator *v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v38;
  void *v39;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  if (-[PKCompoundInterestCalculator _interestCanBeCalculated](self, "_interestCanBeCalculated"))
  {
    -[PKCompoundInterestCalculatorConfiguration remainingPeriodStartingBalanceForGracePurposes](self->_configuration, "remainingPeriodStartingBalanceForGracePurposes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "compare:", v10);

    configuration = self->_configuration;
    if (v11 != 1)
    {
      -[PKCompoundInterestCalculatorConfiguration unpostedInterest](configuration, "unpostedInterest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_38;
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v14, "compare:", v19);

      if (v20 != 1)
        goto LABEL_38;
      PKRoundDecimalNumberToPlaces(v14, 2);
      v21 = v8;
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
    v13 = -[PKCompoundInterestCalculatorConfiguration inGrace](configuration, "inGrace");
    -[PKCompoundInterestCalculatorConfiguration unpostedInterest](self->_configuration, "unpostedInterest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCompoundInterestCalculatorConfiguration unpostedInterestTimestamp](self->_configuration, "unpostedInterestTimestamp");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v9;
    objc_msgSend(v9, "decimalNumberBySubtracting:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "compare:", v16);

    if (v13)
    {
      if (v17 != 1)
      {
        if (!v14
          || (objc_msgSend(MEMORY[0x1E0CB3598], "zero"),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              v27 = objc_msgSend(v14, "compare:", v26),
              v26,
              v27 != 1))
        {
          v21 = (void *)v38;
          v9 = v39;
          goto LABEL_37;
        }
        v28 = v14;
LABEL_31:
        v36 = v28;
        v21 = (void *)v38;
        v9 = v39;
LABEL_36:

        v8 = v36;
        goto LABEL_37;
      }
      v18 = -[PKCompoundInterestCalculatorConfiguration calculationMethod](self->_configuration, "calculationMethod");
    }
    else
    {
      v18 = -[PKCompoundInterestCalculatorConfiguration calculationMethod](self->_configuration, "calculationMethod");
      if (v17 != 1)
      {
        if (v18 != 1)
        {
          v21 = (void *)v38;
          v9 = v39;
          if (!v18)
          {
            if (v14)
            {
              objc_msgSend(MEMORY[0x1E0CB3598], "zero");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v14, "compare:", v29) == 1 && v38)
              {
                v30 = -[PKCompoundInterestCalculator _date:isApplicableForProcessingDate:](self, "_date:isApplicableForProcessingDate:", v7, v38);

                if (v30)
                {
                  PKRoundDecimalNumberToPlaces(v14, 2);
                  v31 = objc_claimAutoreleasedReturnValue();
LABEL_35:
                  v36 = (id)v31;
                  goto LABEL_36;
                }
              }
              else
              {

              }
            }
            v22 = self;
            v23 = v6;
            v24 = v7;
            v25 = 0;
LABEL_34:
            -[PKCompoundInterestCalculator _rawCompoundInterestForPaymentOfAmount:onDate:includeNewBalance:](v22, "_rawCompoundInterestForPaymentOfAmount:onDate:includeNewBalance:", v23, v24, v25);
            v31 = objc_claimAutoreleasedReturnValue();
            goto LABEL_35;
          }
LABEL_37:

LABEL_38:
          goto LABEL_39;
        }
        v32 = self;
        v33 = v6;
        v34 = v7;
        v35 = 0;
        goto LABEL_30;
      }
    }
    if (v18 != 1)
    {
      v21 = (void *)v38;
      v9 = v39;
      if (!v18)
      {
        v22 = self;
        v23 = v6;
        v24 = v7;
        v25 = 1;
        goto LABEL_34;
      }
      goto LABEL_37;
    }
    v32 = self;
    v33 = v6;
    v34 = v7;
    v35 = 1;
LABEL_30:
    -[PKCompoundInterestCalculator _rawUnpostedInterestCalculationForPaymentOfAmount:onDate:includeNewPurchases:](v32, "_rawUnpostedInterestCalculationForPaymentOfAmount:onDate:includeNewPurchases:", v33, v34, v35);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
LABEL_39:

  return v8;
}

- (id)_rawCompoundInterestForPaymentOfAmount:(id)a3 onDate:(id)a4 includeNewBalance:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  id v32;
  id v33;
  _BOOL4 v34;
  void *v35;
  void *v36;

  v34 = a5;
  v32 = a3;
  v7 = a4;
  -[PKCompoundInterestCalculatorConfiguration periodStartingBalance](self->_configuration, "periodStartingBalance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCompoundInterestCalculatorConfiguration periodStartDate](self->_configuration, "periodStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCompoundInterestCalculatorConfiguration periodEndDate](self->_configuration, "periodEndDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKCompoundInterestCalculatorConfiguration inGrace](self->_configuration, "inGrace"))
  {
    -[PKCompoundInterestCalculatorConfiguration periodStartDate](self->_configuration, "periodStartDate");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  v14 = v8;
  v15 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v15, "setDay:", 1);
  v31 = v13;
  v35 = v14;
  if (-[NSCalendar compareDate:toDate:toUnitGranularity:](self->_calendar, "compareDate:toDate:toUnitGranularity:", v13, v36, 16) == NSOrderedAscending)
  {
    v33 = v7;
    do
    {
      v17 = v14;
      v18 = v12;
      -[PKCompoundInterestCalculator _creditsForProcessingDate:](self, "_creditsForProcessingDate:", v13, v31);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "decimalNumberByAdding:", v19);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "decimalNumberBySubtracting:", v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        -[PKCompoundInterestCalculator _additionalBalanceForProcessingDate:](self, "_additionalBalanceForProcessingDate:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "decimalNumberByAdding:", v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v14 = (id)v21;
      }
      if (-[PKCompoundInterestCalculator _date:isApplicableForProcessingDate:](self, "_date:isApplicableForProcessingDate:", v7, v13))
      {
        objc_msgSend(v14, "decimalNumberBySubtracting:", v32);
        v22 = objc_claimAutoreleasedReturnValue();

        v7 = v33;
        objc_msgSend(v12, "decimalNumberByAdding:", v32);
        v23 = objc_claimAutoreleasedReturnValue();

        v14 = (id)v22;
        v12 = (void *)v23;
      }
      if (objc_msgSend(v12, "compare:", v35) == -1)
      {
        objc_msgSend(v14, "decimalNumberByAdding:", v11);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKCompoundInterestCalculatorConfiguration apr](self->_configuration, "apr");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        PKCompoundInterestForPrincipal(v24, 1, v25, -[PKCompoundInterestCalculatorConfiguration compoundingPeriods](self->_configuration, "compoundingPeriods"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        PKRoundDecimalNumberToPlaces(v26, 7);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "decimalNumberByAdding:", v27);
        v28 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v28;
        v7 = v33;
      }
      -[NSCalendar dateByAddingComponents:toDate:options:](self->_calendar, "dateByAddingComponents:toDate:options:", v15, v13, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v16;
    }
    while (-[NSCalendar compareDate:toDate:toUnitGranularity:](self->_calendar, "compareDate:toDate:toUnitGranularity:", v16, v36, 16) == NSOrderedAscending);
  }
  else
  {
    v16 = v13;
  }
  PKRoundDecimalNumberToPlaces(v11, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)_rawUnpostedInterestCalculationForPaymentOfAmount:(id)a3 onDate:(id)a4 includeNewPurchases:(BOOL)a5
{
  void *v5;
  _BOOL4 v6;
  PKCompoundInterestCalculator *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  PKCompoundInterestCalculator *v17;
  void *v18;
  _BOOL4 v19;
  BOOL v20;
  PKCompoundInterestCalculator *v21;
  PKCompoundInterestCalculator *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  PKCompoundInterestCalculator *v31;
  PKCompoundInterestCalculator *v32;
  NSCalendar *calendar;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSCalendar *v38;
  NSCalendar *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSCalendar *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  PKCompoundInterestCalculator *v48;
  PKCompoundInterestCalculator *v49;
  PKCompoundInterestCalculator *v50;
  void *v51;
  PKCompoundInterestCalculator *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  PKCompoundInterestCalculator *v57;
  uint64_t v58;
  PKCompoundInterestCalculator *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  PKCompoundInterestCalculator *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  PKCompoundInterestCalculator *v93;
  void *v94;
  uint64_t v95;
  _BOOL4 v96;
  void *v97;
  PKCompoundInterestCalculator *v98;
  PKCompoundInterestCalculator *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t i;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  id v123;
  void *v125;
  PKCompoundInterestCalculator *v126;
  PKCompoundInterestCalculator *v127;
  PKCompoundInterestCalculator *v128;
  id v129;
  id v130;
  void *v131;
  PKCompoundInterestCalculator *v132;
  id v133;
  PKCompoundInterestCalculator *v134;
  void *v135;
  _BOOL4 obj;
  id obja;
  PKCompoundInterestCalculator *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _BYTE v147[128];
  uint64_t v148;

  v6 = a5;
  v148 = *MEMORY[0x1E0C80C00];
  v9 = (PKCompoundInterestCalculator *)a3;
  v10 = a4;
  -[PKCompoundInterestCalculatorConfiguration remainingPeriodStartingBalance](self->_configuration, "remainingPeriodStartingBalance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCompoundInterestCalculatorConfiguration remainingPeriodMinimumPayment](self->_configuration, "remainingPeriodMinimumPayment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = 0x1E0CB3000uLL;
  if (v12)
  {
    v133 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v133 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[PKCompoundInterestCalculatorConfiguration remainingPeriodMinimumPaymentExcludedFromInterestCalculation](self->_configuration, "remainingPeriodMinimumPaymentExcludedFromInterestCalculation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v129 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v129 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[PKCompoundInterestCalculatorConfiguration periodStartDate](self->_configuration, "periodStartDate");
  v17 = (PKCompoundInterestCalculator *)objc_claimAutoreleasedReturnValue();
  -[PKCompoundInterestCalculatorConfiguration periodEndDate](self->_configuration, "periodEndDate");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = objc_msgSend(v18, "day");

  v19 = -[PKCompoundInterestCalculatorConfiguration inGrace](self->_configuration, "inGrace");
  v20 = v19;
  v127 = v17;
  if (v19)
  {
    v17 = v17;

    v10 = v17;
  }
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v138 = (PKCompoundInterestCalculator *)objc_claimAutoreleasedReturnValue();
  v132 = v11;
  v128 = v9;
  if (v9)
  {
    v21 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v22 = (PKCompoundInterestCalculator *)(id)objc_claimAutoreleasedReturnValue();

    v21 = v22;
  }
  v23 = v133;
  v126 = v21;
  v131 = v132;
  if ((-[PKCompoundInterestCalculator pk_isGreaterThanOrEqualTo:](v21, "pk_isGreaterThanOrEqualTo:", v133) & 1) == 0)
  {
    v17 = v126;
    if (-[PKCompoundInterestCalculator pk_isLessThan:](v126, "pk_isLessThan:", v133)
      && (objc_msgSend(v133, "decimalNumberBySubtracting:", v129),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = -[PKCompoundInterestCalculator pk_isGreaterThan:](v126, "pk_isGreaterThan:", v24),
          v24,
          v23 = v133,
          v25))
    {
      objc_msgSend(v133, "decimalNumberBySubtracting:", v126);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v132;
      -[PKCompoundInterestCalculator decimalNumberBySubtracting:](v132, "decimalNumberBySubtracting:", v26);
      v131 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v23, "decimalNumberBySubtracting:", v129);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[PKCompoundInterestCalculator pk_isLessThanOrEqualTo:](v126, "pk_isLessThanOrEqualTo:", v27);

      v23 = v133;
      v131 = v132;
      if (!v28)
        goto LABEL_19;
      v26 = v132;
      -[PKCompoundInterestCalculator decimalNumberBySubtracting:](v132, "decimalNumberBySubtracting:", v129);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v23 = v133;
  }
LABEL_19:
  v134 = self;
  v130 = v10;
  if (v20)
  {
    -[PKCompoundInterestCalculatorConfiguration apr](self->_configuration, "apr");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PKCompoundInterestForPrincipal(v131, v142 + 1, v29, -[PKCompoundInterestCalculatorConfiguration compoundingPeriods](self->_configuration, "compoundingPeriods"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v138;
    -[PKCompoundInterestCalculator decimalNumberByAdding:](v138, "decimalNumberByAdding:", v30);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v128;
  }
  else
  {
    calendar = self->_calendar;
    -[PKCompoundInterestCalculatorConfiguration unpostedInterestTimestamp](self->_configuration, "unpostedInterestTimestamp");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar components:fromDate:toDate:options:](calendar, "components:fromDate:toDate:options:", 16, v34, v10, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "day");
    v37 = v142 + 1;
    if (v36 <= v142)
    {
      v38 = self->_calendar;
      -[PKCompoundInterestCalculatorConfiguration unpostedInterestTimestamp](self->_configuration, "unpostedInterestTimestamp");
      v17 = (PKCompoundInterestCalculator *)objc_claimAutoreleasedReturnValue();
      -[NSCalendar components:fromDate:toDate:options:](v38, "components:fromDate:toDate:options:", 16, v17, v130, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v5, "day");
    }
    obj = v6;
    if (v37 < 1)
    {
      v42 = 0;
    }
    else
    {
      v39 = self->_calendar;
      -[PKCompoundInterestCalculatorConfiguration unpostedInterestTimestamp](self->_configuration, "unpostedInterestTimestamp");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCalendar components:fromDate:toDate:options:](v39, "components:fromDate:toDate:options:", 16, v40, v130, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v142 + 1;
      if (objc_msgSend(v41, "day") <= v142)
      {
        v43 = self->_calendar;
        -[PKCompoundInterestCalculatorConfiguration unpostedInterestTimestamp](self->_configuration, "unpostedInterestTimestamp");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCalendar components:fromDate:toDate:options:](v43, "components:fromDate:toDate:options:", 16, v44, v130, 0);
        self = v17;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v45, "day");

        v17 = self;
      }

      v14 = 0x1E0CB3000;
    }
    if (v36 <= v142)
    {

    }
    -[PKCompoundInterestCalculatorConfiguration apr](v134->_configuration, "apr");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    PKCompoundInterestForPrincipal(v129, v42, v46, -[PKCompoundInterestCalculatorConfiguration compoundingPeriods](v134->_configuration, "compoundingPeriods"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKCompoundInterestCalculator decimalNumberBySubtracting:](v138, "decimalNumberBySubtracting:", v47);
    v48 = (PKCompoundInterestCalculator *)objc_claimAutoreleasedReturnValue();

    -[PKCompoundInterestCalculatorConfiguration unpostedInterest](v134->_configuration, "unpostedInterest");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCompoundInterestCalculatorConfiguration unpostedInterestTimestamp](v134->_configuration, "unpostedInterestTimestamp");
    v49 = (PKCompoundInterestCalculator *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    v51 = v127;
    if (!v49
      || -[PKCompoundInterestCalculator compare:](v49, "compare:", v127) == -1
      || -[PKCompoundInterestCalculator compare:](v50, "compare:", v141) == 1)
    {
      v52 = v127;

      objc_msgSend(*(id *)(v14 + 1432), "zero");
      v53 = objc_claimAutoreleasedReturnValue();

      v30 = (void *)v53;
      v50 = v52;
    }
    if (!v30
      || (objc_msgSend(*(id *)(v14 + 1432), "zero"),
          v54 = (void *)objc_claimAutoreleasedReturnValue(),
          v55 = objc_msgSend(v30, "compare:", v54),
          v54,
          v55 == -1))
    {
      objc_msgSend(*(id *)(v14 + 1432), "zero");
      v58 = objc_claimAutoreleasedReturnValue();

      v59 = v127;
      v57 = v50;
      v30 = (void *)v58;
      v50 = v59;
    }
    else
    {
      -[PKCompoundInterestCalculator decimalNumberByAdding:](v48, "decimalNumberByAdding:", v30);
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = v48;
      v48 = (PKCompoundInterestCalculator *)v56;
    }

    -[NSCalendar components:fromDate:toDate:options:](v134->_calendar, "components:fromDate:toDate:options:", 16, v50, v141, 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "day");
    v62 = v142 + 1;
    if (v61 < v142)
    {
      -[NSCalendar components:fromDate:toDate:options:](v134->_calendar, "components:fromDate:toDate:options:", 16, v50, v141, 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v51, "day") + 1;
    }
    if (v62 < 1)
    {
      v31 = v50;
      v64 = 0;
    }
    else
    {
      v31 = v50;
      -[NSCalendar components:fromDate:toDate:options:](v134->_calendar, "components:fromDate:toDate:options:", 16, v50, v141, 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v142 + 1;
      if (objc_msgSend(v63, "day") < v142)
      {
        -[NSCalendar components:fromDate:toDate:options:](v134->_calendar, "components:fromDate:toDate:options:", 16, v31, v141, 0);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v65, "day") + 1;

      }
    }
    if (v61 < v142)

    objc_msgSend(v131, "decimalNumberByAdding:", v30);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCompoundInterestCalculatorConfiguration apr](v134->_configuration, "apr");
    v17 = (PKCompoundInterestCalculator *)objc_claimAutoreleasedReturnValue();
    PKCompoundInterestForPrincipal(v66, v64, v17, -[PKCompoundInterestCalculatorConfiguration compoundingPeriods](v134->_configuration, "compoundingPeriods"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKCompoundInterestCalculator decimalNumberByAdding:](v48, "decimalNumberByAdding:", v67);
    v135 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0x1E0CB3000;
    v32 = v128;
    if (v128)
    {
      v6 = obj;
      if (-[PKCompoundInterestCalculator compare:](v128, "compare:", v132) != -1)
      {
        -[NSCalendar components:fromDate:toDate:options:](v134->_calendar, "components:fromDate:toDate:options:", 16, v130, v141, 0);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v68, "day");
        v70 = v142 + 1;
        if (v69 < v142)
        {
          -[NSCalendar components:fromDate:toDate:options:](v134->_calendar, "components:fromDate:toDate:options:", 16, v130, v141, 0);
          v32 = (PKCompoundInterestCalculator *)objc_claimAutoreleasedReturnValue();
          v70 = -[PKCompoundInterestCalculator day](v32, "day") + 1;
        }
        v71 = v31;
        if (v70 < 1)
        {
          v73 = 0;
        }
        else
        {
          -[NSCalendar components:fromDate:toDate:options:](v134->_calendar, "components:fromDate:toDate:options:", 16, v130, v141, 0);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v142 + 1;
          if (objc_msgSend(v72, "day") < v142)
          {
            -[NSCalendar components:fromDate:toDate:options:](v134->_calendar, "components:fromDate:toDate:options:", 16, v130, v141, 0);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v74, "day") + 1;

          }
        }
        if (v69 < v142)

        -[PKCompoundInterestCalculatorConfiguration apr](v134->_configuration, "apr");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        PKCompoundInterestForPrincipal(v30, v73, v75, -[PKCompoundInterestCalculatorConfiguration compoundingPeriods](v134->_configuration, "compoundingPeriods"));
        v76 = objc_claimAutoreleasedReturnValue();

        v125 = (void *)v76;
        objc_msgSend(v135, "decimalNumberBySubtracting:", v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSCalendar components:fromDate:toDate:options:](v134->_calendar, "components:fromDate:toDate:options:", 16, v71, v130, 0);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v78, "day");
        v80 = v142 + 1;
        if (v79 <= v142)
        {
          -[NSCalendar components:fromDate:toDate:options:](v134->_calendar, "components:fromDate:toDate:options:", 16, v71, v130, 0);
          self = (PKCompoundInterestCalculator *)objc_claimAutoreleasedReturnValue();
          v80 = -[PKCompoundInterestCalculator day](self, "day");
        }
        v139 = v73;
        if (v80 < 1)
        {
          v31 = v71;
          v82 = 0;
        }
        else
        {
          v31 = v71;
          -[NSCalendar components:fromDate:toDate:options:](v134->_calendar, "components:fromDate:toDate:options:", 16, v71, v130, 0);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = v142 + 1;
          if (objc_msgSend(v81, "day") <= v142)
          {
            -[NSCalendar components:fromDate:toDate:options:](v134->_calendar, "components:fromDate:toDate:options:", 16, v31, v130, 0);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = objc_msgSend(v83, "day");

          }
        }
        if (v79 <= v142)

        objc_msgSend(v131, "decimalNumberByAdding:", v30);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKCompoundInterestCalculatorConfiguration apr](v134->_configuration, "apr");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        PKCompoundInterestForPrincipal(v84, v82, v85, -[PKCompoundInterestCalculatorConfiguration compoundingPeriods](v134->_configuration, "compoundingPeriods"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKCompoundInterestCalculatorConfiguration apr](v134->_configuration, "apr");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        PKCompoundInterestForPrincipal(v86, v139, v87, -[PKCompoundInterestCalculatorConfiguration compoundingPeriods](v134->_configuration, "compoundingPeriods"));
        v17 = (PKCompoundInterestCalculator *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v77, "decimalNumberBySubtracting:", v17);
        v135 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = obj;
        v14 = 0x1E0CB3000uLL;
        v32 = v128;
      }
    }
    else
    {
      v6 = obj;
    }

    v10 = v130;
    v23 = v133;
    self = v134;
  }

  if (v32)
  {
    objc_msgSend(*(id *)(v14 + 1432), "zero");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = -[PKCompoundInterestCalculator compare:](v32, "compare:", v88);

    if (v89 == 1)
    {
      -[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v10, v141, 0);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v90, "day");
      v92 = v142 + 1;
      if (v91 < v142)
      {
        -[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v10, v141, 0);
        v17 = (PKCompoundInterestCalculator *)objc_claimAutoreleasedReturnValue();
        v92 = -[PKCompoundInterestCalculator day](v17, "day") + 1;
      }
      v93 = v32;
      if (v92 < 1)
      {
        v95 = 0;
      }
      else
      {
        -[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v10, v141, 0);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = v142 + 1;
        if (objc_msgSend(v94, "day") < v142)
        {
          -[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v10, v141, 0);
          v96 = v6;
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = objc_msgSend(v97, "day") + 1;

          v6 = v96;
        }

      }
      if (v91 < v142)

      if (-[PKCompoundInterestCalculator compare:](v93, "compare:", v132) == 1)
        v98 = v132;
      else
        v98 = v93;
      v99 = v98;
      -[PKCompoundInterestCalculatorConfiguration apr](self->_configuration, "apr");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = -[PKCompoundInterestCalculatorConfiguration compoundingPeriods](self->_configuration, "compoundingPeriods");
      v102 = v95;
      v32 = v93;
      PKCompoundInterestForPrincipal(v99, v102, v100, v101);
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v135, "decimalNumberBySubtracting:", v103);
      v104 = objc_claimAutoreleasedReturnValue();

      v135 = (void *)v104;
    }
    v23 = v133;
  }
  if (v6)
  {
    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    -[PKCompoundInterestCalculatorConfiguration periodTransactions](self->_configuration, "periodTransactions");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v143, v147, 16);
    if (v105)
    {
      v106 = v105;
      v140 = *(_QWORD *)v144;
      do
      {
        for (i = 0; i != v106; ++i)
        {
          if (*(_QWORD *)v144 != v140)
            objc_enumerationMutation(obja);
          v108 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * i);
          objc_msgSend(v108, "transactionStatusChangedDate");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = v109;
          if (v109)
          {
            v111 = v109;
          }
          else
          {
            objc_msgSend(v108, "transactionDate");
            v111 = (id)objc_claimAutoreleasedReturnValue();

          }
          -[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v111, v141, 0);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v113 = objc_msgSend(v112, "day");
          v114 = v142 + 1;
          if (v113 < v142)
          {
            -[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v111, v141, 0);
            v10 = (id)objc_claimAutoreleasedReturnValue();
            v114 = objc_msgSend(v10, "day") + 1;
          }
          if (v114 < 1)
          {
            v116 = 0;
          }
          else
          {
            -[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v111, v141, 0);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            v116 = v142 + 1;
            if (objc_msgSend(v115, "day") < v142)
            {
              -[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v111, v141, 0);
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              v116 = objc_msgSend(v117, "day") + 1;

              self = v134;
            }

          }
          if (v113 < v142)

          if (!objc_msgSend(v108, "transactionType") && objc_msgSend(v108, "transactionStatus") == 1)
          {
            objc_msgSend(v108, "amount");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKCompoundInterestCalculatorConfiguration apr](self->_configuration, "apr");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            PKCompoundInterestForPrincipal(v118, v116, v119, -[PKCompoundInterestCalculatorConfiguration compoundingPeriods](self->_configuration, "compoundingPeriods"));
            v120 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v135, "decimalNumberByAdding:", v120);
            v121 = objc_claimAutoreleasedReturnValue();

            v135 = (void *)v121;
          }

        }
        v106 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v143, v147, 16);
      }
      while (v106);
    }

    v32 = v128;
    v10 = v130;
    v23 = v133;
  }
  PKRoundDecimalNumberToPlaces(v135, 2);
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  v123 = v122;
  return v123;
}

- (id)_additionalBalanceForProcessingDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  PKCompoundInterestCalculator *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[PKCompoundInterestCalculatorConfiguration periodTransactions](self->_configuration, "periodTransactions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v30)
  {
    v7 = *(_QWORD *)v32;
    v29 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v9, "transactionStatusChangedDate", v29);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = v10;
        }
        else
        {
          objc_msgSend(v9, "transactionDate");
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v13 = v12;

        if (-[PKCompoundInterestCalculator _date:isApplicableForProcessingDate:](self, "_date:isApplicableForProcessingDate:", v13, v4))
        {
          if (!objc_msgSend(v9, "transactionType") && objc_msgSend(v9, "transactionStatus") == 1)
          {
            objc_msgSend(v9, "amount");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "decimalNumberByAdding:", v14);
            v15 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v15;
          }
          if (objc_msgSend(v9, "transactionType") == 4)
          {
            objc_msgSend(v9, "amount");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "decimalNumberByAdding:", v16);
            v17 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v17;
          }
          if (objc_msgSend(v9, "transactionType") == 7)
          {
            v18 = v6;
            v19 = self;
            v20 = v4;
            objc_msgSend(v9, "amount");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3598], "zero");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v21, "compare:", v22);

            if (v23 == 1)
            {
              objc_msgSend(v9, "amount");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "decimalNumberByAdding:", v24);
              v25 = objc_claimAutoreleasedReturnValue();

              v5 = (void *)v25;
            }
            v4 = v20;
            self = v19;
            v6 = v18;
            v7 = v29;
          }
          if (objc_msgSend(v9, "transactionType") == 11)
          {
            objc_msgSend(v9, "amount");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "decimalNumberByAdding:", v26);
            v27 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v27;
          }
        }

      }
      v30 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v30);
  }

  return v5;
}

- (id)_creditsForProcessingDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v41;
  id obj;
  id obja;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[PKCompoundInterestCalculatorConfiguration periodTransactions](self->_configuration, "periodTransactions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  obj = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (obj)
  {
    v7 = *(_QWORD *)v49;
    v41 = v4;
    do
    {
      for (i = 0; i != obj; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "transactionStatusChangedDate", v41);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = v10;
        }
        else
        {
          objc_msgSend(v9, "transactionDate");
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v13 = v12;

        if (-[PKCompoundInterestCalculatorConfiguration inGrace](self->_configuration, "inGrace"))
        {
          -[PKCompoundInterestCalculatorConfiguration periodStartDate](self->_configuration, "periodStartDate");
          v14 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v14;
        }
        if (-[PKCompoundInterestCalculator _date:isApplicableForProcessingDate:](self, "_date:isApplicableForProcessingDate:", v13, v4))
        {
          if (objc_msgSend(v9, "transactionType") == 1
            && (objc_msgSend(v9, "transactionStatus") == 1 || objc_msgSend(v9, "transactionStatus") == 3))
          {
            objc_msgSend(v9, "amount");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "decimalNumberByAdding:", v15);
            v16 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v16;
          }
          if (objc_msgSend(v9, "transactionType") == 7)
          {
            v17 = v7;
            v18 = v6;
            objc_msgSend(v9, "amount");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3598], "zero");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "compare:", v20);

            if (v21 == -1)
            {
              objc_msgSend(v9, "amount");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v5;
              objc_msgSend(v5, "decimalNumberByAdding:", v22);
              v5 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v6 = v18;
            v7 = v17;
            v4 = v41;
          }
          if (objc_msgSend(v9, "transactionType") == 9)
          {
            objc_msgSend(v9, "amount");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "decimalNumberByAdding:", v24);
            v25 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v25;
          }
          if (objc_msgSend(v9, "transactionType") == 10)
          {
            objc_msgSend(v9, "amount");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "decimalNumberByAdding:", v26);
            v27 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v27;
          }
        }

      }
      obj = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (obj);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[PKCompoundInterestCalculatorConfiguration futurePayments](self->_configuration, "futurePayments");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v45 != v30)
          objc_enumerationMutation(obja);
        v32 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v32, "paymentDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[PKCompoundInterestCalculatorConfiguration inGrace](self->_configuration, "inGrace"))
        {
          -[PKCompoundInterestCalculatorConfiguration periodStartDate](self->_configuration, "periodStartDate");
          v34 = objc_claimAutoreleasedReturnValue();

          v33 = (void *)v34;
        }
        if (-[PKCompoundInterestCalculator _date:isApplicableForProcessingDate:](self, "_date:isApplicableForProcessingDate:", v33, v4))
        {
          objc_msgSend(v32, "currencyAmount");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "amount");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
            objc_msgSend(MEMORY[0x1E0CB3598], "zero");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v36, "compare:", v37);

            if (v38 == 1)
            {
              objc_msgSend(v5, "decimalNumberBySubtracting:", v36);
              v39 = objc_claimAutoreleasedReturnValue();

              v5 = (void *)v39;
            }
          }

        }
      }
      v29 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v29);
  }

  return v5;
}

- (BOOL)_date:(id)a3 isApplicableForProcessingDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  if (_MergedGlobals_203 != -1)
    dispatch_once(&_MergedGlobals_203, &__block_literal_global_32);
  v8 = v7;
  -[NSMutableDictionary objectForKey:](self->_toDateCache, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[NSCalendar dateByAddingComponents:toDate:options:](self->_calendar, "dateByAddingComponents:toDate:options:", qword_1ECF222F0, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_toDateCache, "setObject:forKey:", v9, v8);
  }
  v10 = objc_msgSend(v8, "compare:", v6);
  v11 = objc_msgSend(v9, "compare:", v6);
  v13 = v10 != 1 && v11 == 1;

  return v13;
}

uint64_t __68__PKCompoundInterestCalculator__date_isApplicableForProcessingDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v1 = (void *)qword_1ECF222F0;
  qword_1ECF222F0 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ECF222F0, "setDay:", 1);
}

- (PKCompoundInterestCalculatorConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_toDateCache, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end

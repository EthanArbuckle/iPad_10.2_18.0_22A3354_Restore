@implementation PKPayLaterMockUtilities

+ (id)assessmentCollection
{
  PKPayLaterProductAssessmentCollection *v3;
  void *v4;
  PKPayLaterProductAssessmentCollection *v5;

  v3 = [PKPayLaterProductAssessmentCollection alloc];
  objc_msgSend(a1, "_assessmentCollectionArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPayLaterProductAssessmentCollection initWithArray:](v3, "initWithArray:", v4);

  return v5;
}

+ (id)bnplFinancingOption
{
  PKPayLaterFinancingOption *v3;
  void *v4;
  PKPayLaterFinancingOption *v5;

  v3 = [PKPayLaterFinancingOption alloc];
  objc_msgSend(a1, "_bnplFinancingOptionsDictionaryWithRelevantDates:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPayLaterFinancingOption initWithDictionary:productType:](v3, "initWithDictionary:productType:", v4, 1);

  return v5;
}

+ (id)bnplFinancingOptionWithRelativeDates
{
  PKPayLaterFinancingOption *v3;
  void *v4;
  PKPayLaterFinancingOption *v5;

  v3 = [PKPayLaterFinancingOption alloc];
  objc_msgSend(a1, "_bnplFinancingOptionsDictionaryWithRelevantDates:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPayLaterFinancingOption initWithDictionary:productType:](v3, "initWithDictionary:productType:", v4, 1);

  return v5;
}

+ (id)bnplPreliminaryAssessment
{
  PKPayLaterPreliminaryAssessment *v3;
  void *v4;
  PKPayLaterPreliminaryAssessment *v5;

  v3 = [PKPayLaterPreliminaryAssessment alloc];
  objc_msgSend(a1, "_bnplPreliminaryAssessmentDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPayLaterPreliminaryAssessment initWithDictionary:productType:](v3, "initWithDictionary:productType:", v4, 1);

  return v5;
}

+ (id)assessmentCollection2
{
  PKPayLaterProductAssessmentCollection *v3;
  void *v4;
  PKPayLaterProductAssessmentCollection *v5;

  v3 = [PKPayLaterProductAssessmentCollection alloc];
  objc_msgSend(a1, "_assessmentCollection2Array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPayLaterProductAssessmentCollection initWithArray:](v3, "initWithArray:", v4);

  return v5;
}

+ (id)bnplFinancingPlan
{
  PKPayLaterFinancingPlan *v3;
  void *v4;
  PKPayLaterFinancingPlan *v5;

  v3 = [PKPayLaterFinancingPlan alloc];
  objc_msgSend(a1, "_bnplFinancingPlan1WithRelevantDates:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPayLaterFinancingPlan initWithDictionary:](v3, "initWithDictionary:", v4);

  return v5;
}

+ (id)bnplFinancingPlanWithRelativeDates
{
  PKPayLaterFinancingPlan *v3;
  void *v4;
  PKPayLaterFinancingPlan *v5;

  v3 = [PKPayLaterFinancingPlan alloc];
  objc_msgSend(a1, "_bnplFinancingPlan1WithRelevantDates:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPayLaterFinancingPlan initWithDictionary:](v3, "initWithDictionary:", v4);

  return v5;
}

+ (id)bnplFinancingPlanDictionary
{
  return (id)objc_msgSend(a1, "_bnplFinancingPlan1WithRelevantDates:", 1);
}

+ (id)_assessmentCollectionArray
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_loanProductAssessmentDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(a1, "_bnplProductAssessmentDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_assessmentCollection2Array
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_loanProductAssessmentDictionary2");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(a1, "_bnplProductAssessmentDictionary2");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_loanProductAssessmentDictionary
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("productType");
  v5[1] = CFSTR("financingEligibility");
  v6[0] = CFSTR("loan");
  v6[1] = CFSTR("eligible");
  v6[2] = MEMORY[0x1E0C9AA60];
  v5[2] = CFSTR("financingOptions");
  v5[3] = CFSTR("preliminaryAssessment");
  objc_msgSend(a1, "_loanPreliminaryAssessmentDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_loanProductAssessmentDictionary2
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("productType");
  v5[1] = CFSTR("financingEligibility");
  v6[0] = CFSTR("loan");
  v6[1] = CFSTR("eligible");
  v6[2] = MEMORY[0x1E0C9AA60];
  v5[2] = CFSTR("financingOptions");
  v5[3] = CFSTR("preliminaryAssessment");
  objc_msgSend(a1, "_loanPreliminaryAssessmentDictionary2");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_bnplProductAssessmentDictionary2
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("productType");
  v5[1] = CFSTR("financingEligibility");
  v6[0] = CFSTR("bnpl");
  v6[1] = CFSTR("eligible");
  v6[2] = MEMORY[0x1E0C9AA60];
  v5[2] = CFSTR("financingOptions");
  v5[3] = CFSTR("preliminaryAssessment");
  objc_msgSend(a1, "_bnplPreliminaryAssessmentDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_bnplProductAssessmentDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("productType");
  v7[1] = CFSTR("financingEligibility");
  v8[0] = CFSTR("bnpl");
  v8[1] = CFSTR("eligible");
  v7[2] = CFSTR("financingOptions");
  objc_msgSend(a1, "_bnplFinancingOptionsDictionaryWithRelevantDates:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = CFSTR("preliminaryAssessment");
  v8[2] = v3;
  v8[3] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_bnplPreliminaryAssessmentDictionary
{
  return &unk_1E2C3FA68;
}

+ (id)_bnplFinancingOptionsDictionaryWithRelevantDates:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[4];
  _QWORD v44[16];
  _QWORD v45[18];

  v3 = a3;
  v45[16] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setDay:", 14);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, v8, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v33 = v5;
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, v9, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = CFSTR("identifier");
  v44[1] = CFSTR("installmentCount");
  v45[0] = CFSTR("paylater-swallowtail-financingOption1");
  v45[1] = &unk_1E2C3EDD0;
  v44[2] = CFSTR("hasAPR");
  v44[3] = CFSTR("apr");
  v45[2] = MEMORY[0x1E0C9AAA0];
  v45[3] = CFSTR("0");
  v44[4] = CFSTR("autoPayment");
  v44[5] = CFSTR("totalAmount");
  v45[4] = CFSTR("optional");
  v45[5] = &unk_1E2C3FA90;
  v44[6] = CFSTR("totalFees");
  v44[7] = CFSTR("authAmount");
  v45[6] = &unk_1E2C3FAB8;
  v45[7] = &unk_1E2C3FAE0;
  v44[8] = CFSTR("dueNow");
  v44[9] = CFSTR("installmentAmount");
  v45[8] = &unk_1E2C3FB08;
  v45[9] = &unk_1E2C3FB30;
  v45[10] = &unk_1E2C3FB58;
  v44[10] = CFSTR("installmentFees");
  v44[11] = CFSTR("installments");
  v41[0] = CFSTR("dueDate");
  v32 = (void *)v7;
  if (v3)
  {
    objc_msgSend(a1, "_dateFormatter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringFromDate:", v7);
    v10 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("2020-10-07T17:10:31+0000");
  }
  v41[1] = CFSTR("dueAmount");
  v42[0] = v10;
  v42[1] = &unk_1E2C3FB80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v29 = v10;
  v30 = objc_claimAutoreleasedReturnValue();
  v43[0] = v30;
  v39[0] = CFSTR("dueDate");
  if (v3)
  {
    objc_msgSend(a1, "_dateFormatter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringFromDate:", v8);
    v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("2020-10-21T17:10:31+0000");
  }
  v31 = (void *)v8;
  v39[1] = CFSTR("dueAmount");
  v40[0] = v11;
  v28 = (__CFString *)v11;
  v40[1] = &unk_1E2C3FBA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v12;
  v37[0] = CFSTR("dueDate");
  if (v3)
  {
    objc_msgSend(a1, "_dateFormatter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringFromDate:", v9);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = CFSTR("2020-11-04T17:10:31+0000");
  }
  v37[1] = CFSTR("dueAmount");
  v38[0] = v13;
  v38[1] = &unk_1E2C3FBD0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v14;
  v35[0] = CFSTR("dueDate");
  if (v3)
  {
    v15 = a1;
    v16 = (void *)v9;
    objc_msgSend(v15, "_dateFormatter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringFromDate:", v34);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)v9;
    v17 = CFSTR("2020-11-18T17:10:31+0000");
  }
  v35[1] = CFSTR("dueAmount");
  v36[0] = v17;
  v36[1] = &unk_1E2C3FBF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45[11] = v19;
  v45[12] = &unk_1E2C3FC20;
  v44[12] = CFSTR("termsDetails");
  v44[13] = CFSTR("supportedRepaymentNetworks");
  v45[13] = &unk_1E2C3DFF0;
  v45[14] = &unk_1E2C3E008;
  v44[14] = CFSTR("supportedRepaymentTypes");
  v44[15] = CFSTR("financingOptionData");
  v45[15] = &unk_1E2C3FC48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {

    v12 = (void *)v29;
    v14 = (void *)v30;
    v21 = v32;
    v22 = v27;
  }
  else
  {
    v22 = (void *)v30;
    v21 = v32;
  }

  return v20;
}

+ (id)_loanPreliminaryAssessmentDictionary
{
  return &unk_1E2C3FD60;
}

+ (id)_loanPreliminaryAssessmentDictionary2
{
  return &unk_1E2C3FDD8;
}

+ (id)_loanFinancingOptionDictionaryWithRelevantDates:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  const __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];
  _QWORD v34[16];
  _QWORD v35[18];

  v3 = a3;
  v35[16] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setMonth:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, v8, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, v9, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = CFSTR("identifier");
  v34[1] = CFSTR("installmentCount");
  v35[0] = CFSTR("loan-a2df46d8-d07f-483e-b416-f0ff8872f03e");
  v35[1] = &unk_1E2C3EDE8;
  v34[2] = CFSTR("hasAPR");
  v34[3] = CFSTR("apr");
  v35[2] = MEMORY[0x1E0C9AAB0];
  v35[3] = &unk_1E2C41660;
  v35[4] = CFSTR("optional");
  v34[4] = CFSTR("autoPayment");
  v34[5] = CFSTR("installments");
  v31[0] = CFSTR("dueDate");
  v25 = (void *)v8;
  if (v3)
  {
    objc_msgSend(a1, "_dateFormatter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringFromDate:", v8);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("2021-03-10T00:29:34.349Z");
  }
  v31[1] = CFSTR("dueAmount");
  v32[0] = v10;
  v32[1] = &unk_1E2C3FE00;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v11;
  v29[0] = CFSTR("dueDate");
  v24 = (void *)v9;
  if (v3)
  {
    objc_msgSend(a1, "_dateFormatter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringFromDate:", v9);
    v12 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("2021-04-09T23:29:34.349Z");
  }
  v29[1] = CFSTR("dueAmount");
  v30[0] = v12;
  v23 = (__CFString *)v12;
  v30[1] = &unk_1E2C3FE28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v33[1] = v13;
  v27[0] = CFSTR("dueDate");
  if (v3)
  {
    objc_msgSend(a1, "_dateFormatter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringFromDate:", v26);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("2021-05-09T23:29:34.349Z");
  }
  v27[1] = CFSTR("dueAmount");
  v28[0] = v14;
  v28[1] = &unk_1E2C3FE50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v16;
  v35[6] = &unk_1E2C3FE78;
  v34[6] = CFSTR("dueNow");
  v34[7] = CFSTR("installmentAmount");
  v35[7] = &unk_1E2C3FEA0;
  v35[8] = &unk_1E2C3FEC8;
  v34[8] = CFSTR("totalAmount");
  v34[9] = CFSTR("totalFees");
  v35[9] = &unk_1E2C3FEF0;
  v35[10] = &unk_1E2C3FF18;
  v34[10] = CFSTR("installmentFees");
  v34[11] = CFSTR("authAmount");
  v35[11] = &unk_1E2C3FF40;
  v35[12] = &unk_1E2C3FF68;
  v34[12] = CFSTR("termsDetails");
  v34[13] = CFSTR("supportedRepaymentNetworks");
  v35[13] = &unk_1E2C3E050;
  v35[14] = &unk_1E2C3E068;
  v34[14] = CFSTR("supportedRepaymentTypes");
  v34[15] = CFSTR("financingOptionData");
  v35[15] = &unk_1E2C3FF90;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {

    v18 = v25;
    v11 = v22;
  }
  else
  {
    v10 = v13;
    v18 = v25;
  }

  return v17;
}

+ (id)_bnplFinancingPlan1WithRelevantDates:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
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
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  __CFString *v56;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  __CFString *v60;
  __CFString *v61;
  __CFString *v62;
  const __CFString *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _BOOL4 v79;
  _QWORD v80[6];
  _QWORD v81[6];
  _QWORD v82[6];
  _QWORD v83[6];
  _QWORD v84[3];
  _QWORD v85[3];
  void *v86;
  _QWORD v87[10];
  _QWORD v88[10];
  void *v89;
  _QWORD v90[6];
  _QWORD v91[6];
  _QWORD v92[6];
  _QWORD v93[6];
  _QWORD v94[6];
  _QWORD v95[6];
  _QWORD v96[6];
  _QWORD v97[6];
  _QWORD v98[4];
  _QWORD v99[3];
  _QWORD v100[3];
  _QWORD v101[3];
  const __CFString *v102;
  const __CFString *v103;
  const __CFString *v104;
  const __CFString *v105;
  const __CFString *v106;
  _QWORD v107[2];
  const __CFString *v108;
  const __CFString *v109;
  const __CFString *v110;
  void *v111;
  const __CFString *v112;
  void *v113;
  __CFString *v114;
  _QWORD v115[13];
  const __CFString *v116;
  const __CFString *v117;
  const __CFString *v118;
  const __CFString *v119;
  _QWORD v120[12];
  const __CFString *v121;
  const __CFString *v122;
  const __CFString *v123;
  const __CFString *v124;
  const __CFString *v125;
  _QWORD v126[11];
  _QWORD v127[13];

  v3 = a3;
  v127[11] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setDay:", 14);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, v8, 0);
  v75 = v6;
  v76 = v5;
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v126[0] = CFSTR("planIdentifier");
  v126[1] = CFSTR("productType");
  v127[0] = CFSTR("9d1106d3-e625-4cb4-b280-470156494160");
  v127[1] = CFSTR("bnpl");
  v126[2] = CFSTR("lastUpdated");
  if (v3)
  {
    objc_msgSend(a1, "_dateFormatter");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "stringFromDate:", v7);
    v9 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("2020-9-20T00:00:00-08:00");
  }
  v127[2] = v9;
  v127[3] = CFSTR("active");
  v126[3] = CFSTR("state");
  v126[4] = CFSTR("stateReason");
  v127[4] = CFSTR("currentSettled");
  v127[5] = CFSTR("inApp");
  v126[5] = CFSTR("planChannel");
  v126[6] = CFSTR("planSummary");
  v115[0] = CFSTR("apr");
  v115[1] = CFSTR("hasAPR");
  v120[0] = CFSTR("0");
  v120[1] = MEMORY[0x1E0C9AAA0];
  v115[2] = CFSTR("daysPastDue");
  v115[3] = CFSTR("pastDueAmount");
  v120[2] = &unk_1E2C3EE48;
  v120[3] = &unk_1E2C3FFB8;
  v115[4] = CFSTR("installmentCount");
  v115[5] = CFSTR("panSuffix");
  v120[4] = &unk_1E2C3EDD0;
  v120[5] = CFSTR("1234");
  v115[6] = CFSTR("totalAmount");
  v115[7] = CFSTR("paymentAmountToDate");
  v120[6] = &unk_1E2C3FFE0;
  v120[7] = &unk_1E2C40008;
  v115[8] = CFSTR("currentBalance");
  v115[9] = CFSTR("totalInterest");
  v120[8] = &unk_1E2C40030;
  v120[9] = &unk_1E2C40058;
  v115[10] = CFSTR("interestPaidToDate");
  v115[11] = CFSTR("payoffAmount");
  v120[10] = &unk_1E2C40080;
  v120[11] = &unk_1E2C400A8;
  v115[12] = CFSTR("transactionDate");
  if (v3)
  {
    objc_msgSend(a1, "_dateFormatter");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stringFromDate:", v7);
    v53 = objc_claimAutoreleasedReturnValue();
    v121 = (const __CFString *)v53;
    v116 = CFSTR("startInstallmentDate");
    objc_msgSend(a1, "_dateFormatter");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "stringFromDate:", v7);
    v51 = objc_claimAutoreleasedReturnValue();
    v122 = (const __CFString *)v51;
    v117 = CFSTR("nextInstallmentDueDate");
    objc_msgSend(a1, "_dateFormatter");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "stringFromDate:", v8);
    v49 = objc_claimAutoreleasedReturnValue();
    v123 = (const __CFString *)v49;
    v118 = CFSTR("endInstallmentDate");
    objc_msgSend(a1, "_dateFormatter");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "stringFromDate:", v78);
    v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v124 = v47;
    v119 = CFSTR("cancellationDate");
    objc_msgSend(a1, "_dateFormatter");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "stringFromDate:", v7);
    v10 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v121 = CFSTR("2020-9-20T00:00:00-08:00");
    v122 = CFSTR("2019-05-01T18:05:10-08:00");
    v116 = CFSTR("startInstallmentDate");
    v117 = CFSTR("nextInstallmentDueDate");
    v123 = CFSTR("2019-05-10T18:05:10-08:00");
    v124 = CFSTR("2020-05-31T18:05:10-08:00");
    v118 = CFSTR("endInstallmentDate");
    v119 = CFSTR("cancellationDate");
    v10 = CFSTR("2020-05-30T18:05:10-08:00");
  }
  v62 = (__CFString *)v10;
  v125 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, v115, 17);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v127[6] = v72;
  v127[7] = &unk_1E2C400D0;
  v126[7] = CFSTR("merchantSummary");
  v126[8] = CFSTR("disputes");
  v101[0] = CFSTR("identifier");
  v101[1] = CFSTR("state");
  v107[0] = CFSTR("dispute-id-1");
  v107[1] = CFSTR("evidenceRequired");
  v101[2] = CFSTR("openDate");
  v63 = v9;
  if (v3)
  {
    objc_msgSend(a1, "_dateFormatter");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringFromDate:", v7);
    v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v108 = v44;
    v102 = CFSTR("lastUpdated");
    objc_msgSend(a1, "_dateFormatter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringFromDate:", v7);
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v109 = v42;
    v103 = CFSTR("deadlineDate");
    objc_msgSend(a1, "_dateFormatter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringFromDate:", v8);
    v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v108 = CFSTR("2020-9-20T00:00:00-08:00");
    v109 = CFSTR("2020-9-20T00:00:00-08:00");
    v102 = CFSTR("lastUpdated");
    v103 = CFSTR("deadlineDate");
    v11 = CFSTR("2019-05-10T18:05:10-08:00");
  }
  v61 = (__CFString *)v11;
  v110 = v11;
  v111 = &unk_1E2C3E080;
  v104 = CFSTR("appliedPayments");
  v105 = CFSTR("emailAddress");
  v106 = CFSTR("requiredDocuments");
  v112 = CFSTR("example@apple.com");
  v113 = &unk_1E2C3E098;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v101, 8);
  v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v114 = v71;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v127[8] = v70;
  v127[9] = &unk_1E2C401C0;
  v126[9] = CFSTR("fundingSource");
  v126[10] = CFSTR("scheduleSummary");
  v100[0] = CFSTR("activeMilitary");
  v99[0] = CFSTR("scheduleSummaryReason");
  v99[1] = CFSTR("installments");
  v96[0] = CFSTR("installmentIdentifier");
  v96[1] = CFSTR("status");
  v97[0] = CFSTR("0f31ec57-6108-4cf6-afa5-c1208927edc5");
  v97[1] = CFSTR("paid");
  v96[2] = CFSTR("totalAmount");
  v96[3] = CFSTR("currentBalance");
  v97[2] = &unk_1E2C401E8;
  v97[3] = &unk_1E2C40210;
  v96[4] = CFSTR("dueDate");
  v79 = v3;
  if (v3)
  {
    objc_msgSend(a1, "_dateFormatter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringFromDate:", v7);
    v12 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("2020-10-15T18:05:10-08:00");
  }
  v96[5] = CFSTR("appliedPayments");
  v60 = (__CFString *)v12;
  v97[4] = v12;
  v97[5] = &unk_1E2C3E0B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 6);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v69;
  v94[0] = CFSTR("installmentIdentifier");
  v94[1] = CFSTR("status");
  v95[0] = CFSTR("0f31ec57-6108-4cf6-afa5-c1208927edc4");
  v95[1] = CFSTR("open");
  v94[2] = CFSTR("totalAmount");
  v94[3] = CFSTR("currentBalance");
  v95[2] = &unk_1E2C40288;
  v95[3] = &unk_1E2C402B0;
  v94[4] = CFSTR("dueDate");
  v73 = (void *)v8;
  if (v3)
  {
    objc_msgSend(a1, "_dateFormatter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringFromDate:", v8);
    v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = CFSTR("2020-10-30T18:05:10-08:00");
  }
  v94[5] = CFSTR("appliedPayments");
  v14 = MEMORY[0x1E0C9AA60];
  v59 = (__CFString *)v13;
  v95[4] = v13;
  v95[5] = MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 6);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v98[1] = v68;
  v92[0] = CFSTR("installmentIdentifier");
  v92[1] = CFSTR("status");
  v93[0] = CFSTR("0f31ec57-6108-4cf6-afa5-c1208927edc3");
  v93[1] = CFSTR("open");
  v92[2] = CFSTR("totalAmount");
  v92[3] = CFSTR("currentBalance");
  v93[2] = &unk_1E2C402D8;
  v93[3] = &unk_1E2C40300;
  v92[4] = CFSTR("dueDate");
  if (v3)
  {
    objc_msgSend(a1, "_dateFormatter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringFromDate:", v77);
    v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("2020-11-15T18:05:10-08:00");
  }
  v92[5] = CFSTR("appliedPayments");
  v58 = (__CFString *)v15;
  v93[4] = v15;
  v93[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 6);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v98[2] = v67;
  v90[0] = CFSTR("installmentIdentifier");
  v90[1] = CFSTR("status");
  v91[0] = CFSTR("0f31ec57-6108-4cf6-afa5-c1208927edc2");
  v91[1] = CFSTR("open");
  v90[2] = CFSTR("totalAmount");
  v90[3] = CFSTR("currentBalance");
  v91[2] = &unk_1E2C40328;
  v91[3] = &unk_1E2C40350;
  v90[4] = CFSTR("dueDate");
  if (v3)
  {
    objc_msgSend(a1, "_dateFormatter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringFromDate:", v78);
    v16 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = CFSTR("2020-11-30T18:05:10-08:00");
  }
  v90[5] = CFSTR("appliedPayments");
  v57 = (__CFString *)v16;
  v91[4] = v16;
  v91[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 6);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v98[3] = v66;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 4);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v100[1] = v65;
  v99[2] = CFSTR("payments");
  v87[0] = CFSTR("paymentIdentifier");
  v87[1] = CFSTR("type");
  v88[0] = CFSTR("111");
  v88[1] = CFSTR("payment");
  v87[2] = CFSTR("scheduledDate");
  v74 = (void *)v7;
  if (v3)
  {
    objc_msgSend(a1, "_dateFormatter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringFromDate:", v7);
    v17 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("2019-05-01T18:05:10-08:00");
  }
  v56 = (__CFString *)v17;
  v88[2] = v17;
  v88[3] = &unk_1E2C40378;
  v87[3] = CFSTR("amount");
  v87[4] = CFSTR("interestPaid");
  v88[4] = &unk_1E2C403A0;
  v88[5] = &unk_1E2C403C8;
  v87[5] = CFSTR("principalPaid");
  v87[6] = CFSTR("fundingSources");
  v84[0] = CFSTR("refundAmount");
  v84[1] = CFSTR("sourceType");
  v85[0] = &unk_1E2C403F0;
  v85[1] = CFSTR("paymentPass");
  v84[2] = CFSTR("sourceDetails");
  v82[0] = CFSTR("fpanIdentifier");
  v82[1] = CFSTR("dpanIdentifier");
  v83[0] = CFSTR("V-3814224667917919787953");
  v83[1] = CFSTR("00000011111122222333333AAAAA");
  v82[2] = CFSTR("cardName");
  v82[3] = CFSTR("cardType");
  v83[2] = CFSTR("BofA Visa Debit Card");
  v83[3] = CFSTR("debit");
  v82[4] = CFSTR("cardNetwork");
  v82[5] = CFSTR("cardSuffix");
  v83[4] = CFSTR("Visa");
  v83[5] = CFSTR("2046");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v85[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v88[6] = v20;
  v88[7] = &unk_1E2C40418;
  v87[7] = CFSTR("fundingSourceRefundAmount");
  v87[8] = CFSTR("sourceType");
  v88[8] = CFSTR("paymentPass");
  v87[9] = CFSTR("sourceDetails");
  v80[0] = CFSTR("fpanIdentifier");
  v80[1] = CFSTR("dpanIdentifier");
  v81[0] = CFSTR("V-3814224667917919787953");
  v81[1] = CFSTR("00000011111122222333333AAAAA");
  v80[2] = CFSTR("cardName");
  v80[3] = CFSTR("cardType");
  v81[2] = CFSTR("BofA Visa Debit Card");
  v81[3] = CFSTR("debit");
  v80[4] = CFSTR("cardNetwork");
  v80[5] = CFSTR("cardSuffix");
  v81[4] = CFSTR("Visa");
  v81[5] = CFSTR("2046");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v88[9] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v100[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v127[10] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v127, v126, 11);
  v64 = (id)objc_claimAutoreleasedReturnValue();

  if (v79)
  {

    v26 = v73;
    v25 = (void *)v7;
    v28 = v54;
    v27 = v55;
    v29 = (__CFString *)v63;
    v31 = v52;
    v30 = (void *)v53;
    v33 = v50;
    v32 = (void *)v51;
    v34 = (void *)v49;
  }
  else
  {
    v34 = v65;
    v33 = v66;
    v32 = v67;
    v31 = v68;
    v30 = v69;
    v28 = v70;
    v29 = v71;
    v27 = v72;
    v26 = v73;
    v25 = v74;
  }

  return v64;
}

+ (id)_dateFormatter
{
  if (qword_1ECF22520 != -1)
    dispatch_once(&qword_1ECF22520, &__block_literal_global_94);
  return (id)_MergedGlobals_228;
}

uint64_t __41__PKPayLaterMockUtilities__dateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_228;
  _MergedGlobals_228 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_228;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCalendar:", v3);

  return objc_msgSend((id)_MergedGlobals_228, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
}

@end

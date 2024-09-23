@implementation PKSavingsMockUtilities

+ (id)savingsAccountDictionary
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[8];
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("accountIdentifier");
  v6[1] = CFSTR("featureIdentifier");
  v7[0] = CFSTR("1111111111");
  v7[1] = CFSTR("savings");
  v7[2] = CFSTR("savings");
  v6[2] = CFSTR("accountType");
  v6[3] = CFSTR("accountDetails");
  objc_msgSend((id)objc_opt_class(), "savingsAccountDetailsDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v2;
  v7[4] = CFSTR("active");
  v6[4] = CFSTR("state");
  v6[5] = CFSTR("accessLevel");
  v7[5] = CFSTR("primary");
  v6[6] = CFSTR("supportedFeatures");
  +[PKSavingsMockUtilities supportedSavingsAccountFeaturesArray](PKSavingsMockUtilities, "supportedSavingsAccountFeaturesArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[7] = CFSTR("accountBaseURL");
  v7[6] = v3;
  v7[7] = CFSTR("https://localhost:3000/firebrand");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)savingsAccountDictionaryUpdated
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend((id)objc_opt_class(), "savingsAccountSummaryDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("47"), CFSTR("currentBalance"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("1000"), CFSTR("pendingBalance"));
  objc_msgSend((id)objc_opt_class(), "savingsAccountDetailsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR("accountSummary"));
  objc_msgSend((id)objc_opt_class(), "savingsAccountDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("accountDetails"));
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

+ (id)savingsAccountDictionary2
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[9];
  _QWORD v7[10];

  v7[9] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("accountIdentifier");
  v6[1] = CFSTR("featureIdentifier");
  v7[0] = CFSTR("2222222222");
  v7[1] = CFSTR("savings");
  v7[2] = CFSTR("savings");
  v6[2] = CFSTR("accountType");
  v6[3] = CFSTR("accountDetails");
  objc_msgSend((id)objc_opt_class(), "savingsAccountDetailsDictionary2");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v2;
  v7[4] = CFSTR("restricted");
  v6[4] = CFSTR("state");
  v6[5] = CFSTR("blockNotifications");
  v7[5] = MEMORY[0x1E0C9AAB0];
  v7[6] = CFSTR("primary");
  v6[6] = CFSTR("accessLevel");
  v6[7] = CFSTR("supportedFeatures");
  objc_msgSend((id)objc_opt_class(), "supportedSavingsAccountFeaturesArray2");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[8] = CFSTR("accountBaseURL");
  v7[7] = v3;
  v7[8] = CFSTR("https://localhost:3000/firebrand");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)savingsAccountDetailsDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[17];
  _QWORD v8[18];

  v8[17] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("lastUpdatedDate");
  objc_msgSend((id)objc_opt_class(), "date1");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("createdDate");
  objc_msgSend((id)objc_opt_class(), "date2");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v8[2] = CFSTR("US");
  v7[2] = CFSTR("countryCode");
  v7[3] = CFSTR("currencyCode");
  v8[3] = CFSTR("USD");
  v8[4] = CFSTR("America/New_York");
  v7[4] = CFSTR("productTimeZone");
  v7[5] = CFSTR("moreInfoRequired");
  v8[5] = MEMORY[0x1E0C9AAB0];
  v8[6] = MEMORY[0x1E0C9AAB0];
  v7[6] = CFSTR("termsAcceptanceRequired");
  v7[7] = CFSTR("termsIdentifier");
  v8[7] = CFSTR("someTermsIdentifier");
  v8[8] = CFSTR("http://someurl.com/coolURL");
  v7[8] = CFSTR("termsURL");
  v7[9] = CFSTR("privacyPolicyURL");
  v8[9] = CFSTR("www.apple.com/privacy");
  v8[10] = CFSTR("bd404f8a-d4db-4bee-a134-1ea61e2241b3");
  v7[10] = CFSTR("businessChatIdentifier");
  v7[11] = CFSTR("contactWebsite");
  v8[11] = CFSTR("www.apple.com/");
  v8[12] = CFSTR("1-877-255-5923");
  v7[12] = CFSTR("contactNumber");
  v7[13] = CFSTR("routingNumber");
  v8[13] = CFSTR("121202211");
  v8[14] = CFSTR("927392017351");
  v7[14] = CFSTR("accountNumber");
  v7[15] = CFSTR("fccStepUpRequired");
  v8[15] = MEMORY[0x1E0C9AAA0];
  v7[16] = CFSTR("accountSummary");
  objc_msgSend((id)objc_opt_class(), "savingsAccountSummaryDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[16] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)savingsAccountDetailsDictionary2
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[18];
  _QWORD v9[19];

  v9[18] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("lastUpdatedDate");
  objc_msgSend((id)objc_opt_class(), "date1");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("createdDate");
  objc_msgSend((id)objc_opt_class(), "date2");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v9[2] = CFSTR("JP");
  v8[2] = CFSTR("countryCode");
  v8[3] = CFSTR("currencyCode");
  v9[3] = CFSTR("JPY");
  v9[4] = CFSTR("America/New_York");
  v8[4] = CFSTR("productTimeZone");
  v8[5] = CFSTR("moreInfoRequired");
  v9[5] = MEMORY[0x1E0C9AAA0];
  v9[6] = MEMORY[0x1E0C9AAA0];
  v8[6] = CFSTR("termsAcceptanceRequired");
  v8[7] = CFSTR("termsIdentifier");
  v9[7] = CFSTR("termsID");
  v9[8] = CFSTR("http://someurl.com/coolURL2");
  v8[8] = CFSTR("termsURL");
  v8[9] = CFSTR("privacyPolicyURL");
  v9[9] = CFSTR("www.apple.com/privacy1");
  v9[10] = CFSTR("bd404f8a-d4db-4bee-a134-1ea61e2241c3");
  v8[10] = CFSTR("businessChatIdentifier");
  v8[11] = CFSTR("contactWebsite");
  v9[11] = CFSTR("www.apple.com/contact");
  v9[12] = CFSTR("1-877-255-5923");
  v8[12] = CFSTR("contactNumber");
  v8[13] = CFSTR("routingNumber");
  v9[13] = CFSTR("121202211");
  v9[14] = CFSTR("927392017351");
  v8[14] = CFSTR("accountNumber");
  v8[15] = CFSTR("fccStepUpRequired");
  v9[15] = MEMORY[0x1E0C9AAB0];
  v8[16] = CFSTR("fccStepUpDetails");
  objc_msgSend((id)objc_opt_class(), "savingsAccountFCCStepUpDetailsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[16] = v4;
  v8[17] = CFSTR("accountSummary");
  objc_msgSend((id)objc_opt_class(), "savingsAccountSummaryDictionary2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[17] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)savingsAccountSummaryDictionary
{
  return &unk_1E2C41200;
}

+ (id)savingsAccountSummaryDictionary2
{
  return &unk_1E2C41228;
}

+ (id)savingsAccountFCCStepUpDetailsDictionary
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("thresholdExceeded");
  v5[1] = CFSTR("neededBy");
  v6[0] = &unk_1E2C3F6D0;
  objc_msgSend((id)objc_opt_class(), "date2");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)savingsAccountStatementsArray
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[12];
  _QWORD v23[12];
  _QWORD v24[12];
  _QWORD v25[12];
  _QWORD v26[12];
  _QWORD v27[12];
  _QWORD v28[12];
  _QWORD v29[12];
  _QWORD v30[12];
  _QWORD v31[12];
  _QWORD v32[12];
  _QWORD v33[12];
  _QWORD v34[8];

  v34[6] = *MEMORY[0x1E0C80C00];
  v32[0] = CFSTR("identifier");
  v32[1] = CFSTR("currencyCode");
  v33[0] = CFSTR("84019385-0249851-02984");
  v33[1] = CFSTR("USD");
  v32[2] = CFSTR("openingDate");
  objc_msgSend((id)objc_opt_class(), "date1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v21;
  v32[3] = CFSTR("closingDate");
  objc_msgSend((id)objc_opt_class(), "date2");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v20;
  v33[4] = CFSTR("95");
  v32[4] = CFSTR("openingBalance");
  v32[5] = CFSTR("closingBalance");
  v33[5] = CFSTR("100");
  v33[6] = CFSTR("12.3");
  v32[6] = CFSTR("interestEarned");
  v32[7] = CFSTR("totalDeposits");
  v33[7] = CFSTR("12.3");
  v33[8] = CFSTR("12.3");
  v32[8] = CFSTR("totalDailyCashDeposits");
  v32[9] = CFSTR("totalWithdrawn");
  v33[9] = CFSTR("5.6");
  v33[10] = CFSTR("1.05");
  v32[10] = CFSTR("apy");
  v32[11] = CFSTR("statementPeriodDays");
  v33[11] = &unk_1E2C3F6E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v19;
  v30[0] = CFSTR("identifier");
  v30[1] = CFSTR("currencyCode");
  v31[0] = CFSTR("84019385-0249851-02985");
  v31[1] = CFSTR("USD");
  v30[2] = CFSTR("openingDate");
  objc_msgSend((id)objc_opt_class(), "date2");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v18;
  v30[3] = CFSTR("closingDate");
  objc_msgSend((id)objc_opt_class(), "date3");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v17;
  v31[4] = CFSTR("100");
  v30[4] = CFSTR("openingBalance");
  v30[5] = CFSTR("closingBalance");
  v31[5] = CFSTR("200");
  v31[6] = CFSTR("12.3");
  v30[6] = CFSTR("interestEarned");
  v30[7] = CFSTR("totalDeposits");
  v31[7] = CFSTR("100");
  v31[8] = CFSTR("76.3");
  v30[8] = CFSTR("totalDailyCashDeposits");
  v30[9] = CFSTR("totalWithdrawn");
  v31[9] = CFSTR("12.3");
  v31[10] = CFSTR("1.05");
  v30[10] = CFSTR("apy");
  v30[11] = CFSTR("statementPeriodDays");
  v31[11] = &unk_1E2C3F700;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v16;
  v28[0] = CFSTR("identifier");
  v28[1] = CFSTR("currencyCode");
  v29[0] = CFSTR("84019385-0249851-02986");
  v29[1] = CFSTR("USD");
  v28[2] = CFSTR("openingDate");
  objc_msgSend((id)objc_opt_class(), "date3");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v15;
  v28[3] = CFSTR("closingDate");
  objc_msgSend((id)objc_opt_class(), "date4");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v14;
  v29[4] = CFSTR("200");
  v28[4] = CFSTR("openingBalance");
  v28[5] = CFSTR("closingBalance");
  v29[5] = CFSTR("500");
  v29[6] = CFSTR("12.3");
  v28[6] = CFSTR("interestEarned");
  v28[7] = CFSTR("totalDeposits");
  v29[7] = CFSTR("300");
  v29[8] = CFSTR("46.2");
  v28[8] = CFSTR("totalDailyCashDeposits");
  v28[9] = CFSTR("totalWithdrawn");
  v29[9] = CFSTR("12.3");
  v29[10] = CFSTR("1.05");
  v28[10] = CFSTR("apy");
  v28[11] = CFSTR("statementPeriodDays");
  v29[11] = &unk_1E2C3F6E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v13;
  v26[0] = CFSTR("identifier");
  v26[1] = CFSTR("currencyCode");
  v27[0] = CFSTR("84019385-0249851-02987");
  v27[1] = CFSTR("USD");
  v26[2] = CFSTR("openingDate");
  objc_msgSend((id)objc_opt_class(), "date4");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v12;
  v26[3] = CFSTR("closingDate");
  objc_msgSend((id)objc_opt_class(), "date5");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v11;
  v27[4] = CFSTR("500");
  v26[4] = CFSTR("openingBalance");
  v26[5] = CFSTR("closingBalance");
  v27[5] = CFSTR("600");
  v27[6] = CFSTR("12.3");
  v26[6] = CFSTR("interestEarned");
  v26[7] = CFSTR("totalDeposits");
  v27[7] = CFSTR("100");
  v27[8] = CFSTR("20.2");
  v26[8] = CFSTR("totalDailyCashDeposits");
  v26[9] = CFSTR("totalWithdrawn");
  v27[9] = CFSTR("12.3");
  v27[10] = CFSTR("1.05");
  v26[10] = CFSTR("apy");
  v26[11] = CFSTR("statementPeriodDays");
  v27[11] = &unk_1E2C3F700;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v10;
  v24[0] = CFSTR("identifier");
  v24[1] = CFSTR("currencyCode");
  v25[0] = CFSTR("84019385-0249851-02988");
  v25[1] = CFSTR("USD");
  v24[2] = CFSTR("openingDate");
  objc_msgSend((id)objc_opt_class(), "date6");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v2;
  v24[3] = CFSTR("closingDate");
  objc_msgSend((id)objc_opt_class(), "date7");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v3;
  v25[4] = CFSTR("600");
  v24[4] = CFSTR("openingBalance");
  v24[5] = CFSTR("closingBalance");
  v25[5] = CFSTR("600");
  v25[6] = CFSTR("12.3");
  v24[6] = CFSTR("interestEarned");
  v24[7] = CFSTR("totalDeposits");
  v25[7] = CFSTR("100");
  v25[8] = CFSTR("20.2");
  v24[8] = CFSTR("totalDailyCashDeposits");
  v24[9] = CFSTR("totalWithdrawn");
  v25[9] = CFSTR("12.3");
  v25[10] = CFSTR("1.05");
  v24[10] = CFSTR("apy");
  v24[11] = CFSTR("statementPeriodDays");
  v25[11] = &unk_1E2C3F6E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v4;
  v22[0] = CFSTR("identifier");
  v22[1] = CFSTR("currencyCode");
  v23[0] = CFSTR("84019385-0249851-02989");
  v23[1] = CFSTR("USD");
  v22[2] = CFSTR("openingDate");
  objc_msgSend((id)objc_opt_class(), "date7");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v5;
  v22[3] = CFSTR("closingDate");
  objc_msgSend((id)objc_opt_class(), "date8");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v6;
  v23[4] = CFSTR("600");
  v22[4] = CFSTR("openingBalance");
  v22[5] = CFSTR("closingBalance");
  v23[5] = CFSTR("600");
  v23[6] = CFSTR("12.3");
  v22[6] = CFSTR("interestEarned");
  v22[7] = CFSTR("totalDeposits");
  v23[7] = CFSTR("100");
  v23[8] = CFSTR("20.2");
  v22[8] = CFSTR("totalDailyCashDeposits");
  v22[9] = CFSTR("totalWithdrawn");
  v23[9] = CFSTR("12.3");
  v23[10] = CFSTR("1.05");
  v22[10] = CFSTR("apy");
  v22[11] = CFSTR("statementPeriodDays");
  v23[11] = &unk_1E2C3F700;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)savingsAccountStatementsArray2
{
  uint64_t v2;
  float v3;
  float v4;
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[11];
  _QWORD v27[13];

  v27[11] = *MEMORY[0x1E0C80C00];
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2 = -6;
  v3 = 0.0;
  v4 = 1000.0;
  v5 = 7;
  do
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v6, "setMonth:", v2);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v6;
    objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v6, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0C99E08]);
    v27[0] = CFSTR("USD");
    v26[0] = CFSTR("currencyCode");
    v26[1] = CFSTR("openingDate");
    PKStartOfMonth(v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PKISO8601DateStringFromDate(v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v22;
    v26[2] = CFSTR("closingDate");
    v24 = v9;
    PKEndOfMonth(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKISO8601DateStringFromDate(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v12;
    v26[3] = CFSTR("openingBalance");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.3f"), v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v13;
    v26[4] = CFSTR("closingBalance");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.3f"), v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[4] = v14;
    v26[5] = CFSTR("interestEarned");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.3f"), (float)(v4 + (float)(v4 / -1.012)));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[5] = v15;
    v27[6] = CFSTR("5.5");
    v26[6] = CFSTR("totalDeposits");
    v26[7] = CFSTR("totalDailyCashDeposits");
    v27[7] = CFSTR("14.5");
    v27[8] = CFSTR("20.0");
    v26[8] = CFSTR("totalWithdrawn");
    v26[9] = CFSTR("apy");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.3f"), 0x3FF3333340000000);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[10] = CFSTR("statementPeriodDays");
    v27[9] = v16;
    v27[10] = &unk_1E2C3F6E8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v10, "initWithDictionary:", v17);

    if (v5 != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), v5 - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("identifier"));

    }
    objc_msgSend(v21, "addObject:", v18);

    --v5;
    ++v2;
    v3 = v4;
    v4 = v4 * 1.012;
  }
  while (v5 > 1);
  return v21;
}

+ (id)savingsAccountTaxFormsArray
{
  return &unk_1E2C3E488;
}

+ (id)savingsAccountTaxFormsArray2
{
  uint64_t v2;
  unint64_t i;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2 = -3;
  for (i = 4; i > 1; --i)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v4, "setYear:", v2);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v4, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc(MEMORY[0x1E0C99E08]);
    v19[0] = CFSTR("1099-int");
    v18[0] = CFSTR("taxFormType");
    v18[1] = CFSTR("openingDate");
    PKStartOfYear(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKISO8601DateStringFromDate(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v10;
    v18[2] = CFSTR("closingDate");
    PKEndOfYear(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKISO8601DateStringFromDate(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v8, "initWithDictionary:", v13);

    if (i != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), i - 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("identifier"));

    }
    objc_msgSend(v17, "addObject:", v14);

    ++v2;
  }
  return v17;
}

+ (id)supportedSavingsAccountFeaturesArray
{
  return &unk_1E2C3E518;
}

+ (id)supportedSavingsAccountFeaturesArray2
{
  return &unk_1E2C3E560;
}

+ (id)savingsStatementDictionary
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[12];
  _QWORD v7[13];

  v7[12] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("identifier");
  v6[1] = CFSTR("currencyCode");
  v7[0] = CFSTR("84019385-0249851-02984");
  v7[1] = CFSTR("USD");
  v6[2] = CFSTR("openingDate");
  objc_msgSend((id)objc_opt_class(), "date2");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  v6[3] = CFSTR("closingDate");
  objc_msgSend((id)objc_opt_class(), "date3");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  v7[4] = CFSTR("101");
  v6[4] = CFSTR("openingBalance");
  v6[5] = CFSTR("closingBalance");
  v7[5] = CFSTR("123");
  v7[6] = CFSTR("12.3");
  v6[6] = CFSTR("interestEarned");
  v6[7] = CFSTR("totalDeposits");
  v7[7] = CFSTR("8.5");
  v7[8] = CFSTR("1.3");
  v6[8] = CFSTR("totalDailyCashDeposits");
  v6[9] = CFSTR("totalWithdrawn");
  v7[9] = CFSTR("2.8");
  v7[10] = CFSTR("2.05");
  v6[10] = CFSTR("apy");
  v6[11] = CFSTR("statementPeriodDays");
  v7[11] = &unk_1E2C3F700;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)savingsStatementDictionary2
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[11];
  _QWORD v7[12];

  v7[11] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("EUR");
  v6[0] = CFSTR("currencyCode");
  v6[1] = CFSTR("openingDate");
  objc_msgSend((id)objc_opt_class(), "date1");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v2;
  v6[2] = CFSTR("closingDate");
  objc_msgSend((id)objc_opt_class(), "date2");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  v7[3] = CFSTR("123");
  v6[3] = CFSTR("openingBalance");
  v6[4] = CFSTR("closingBalance");
  v7[4] = CFSTR("456");
  v7[5] = CFSTR("2.3");
  v6[5] = CFSTR("interestEarned");
  v6[6] = CFSTR("totalDeposits");
  v7[6] = CFSTR("10.5");
  v7[7] = CFSTR("5.0");
  v6[7] = CFSTR("totalDailyCashDeposits");
  v6[8] = CFSTR("totalWithdrawn");
  v7[8] = CFSTR("9.9");
  v7[9] = CFSTR("2.5");
  v6[9] = CFSTR("apy");
  v6[10] = CFSTR("statementPeriodDays");
  v7[10] = &unk_1E2C3F6E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)transfer
{
  PKAccountTransfer *v2;
  NSDecimalNumber *v3;
  void *v4;
  PKAccountTransferExternalAccount *v5;
  void *v6;
  void *v7;
  PKAccountPaymentFundingDetailsBankAccount *v8;
  PKAccountTransferScheduleDetails *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v2 = objc_alloc_init(PKAccountTransfer);
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", arc4random_uniform(0x186A0u), 4294967294, 0);
  v3 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v3, CFSTR("USD"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountTransfer setCurrencyAmount:](v2, "setCurrencyAmount:", v4);

  -[PKAccountTransfer setType:](v2, "setType:", 2);
  -[PKAccountTransfer setState:](v2, "setState:", 1);
  v5 = -[PKAccountPaymentFundingSource initWithType:]([PKAccountTransferExternalAccount alloc], "initWithType:", 1);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountPaymentFundingSource setIdentifier:](v5, "setIdentifier:", v7);

  -[PKAccountPaymentFundingSource setAccountSuffix:](v5, "setAccountSuffix:", CFSTR("7890"));
  v8 = objc_alloc_init(PKAccountPaymentFundingDetailsBankAccount);
  -[PKAccountPaymentFundingDetailsBankAccount setName:](v8, "setName:", CFSTR("Bank of Cupertino"));
  -[PKAccountPaymentFundingSource setFundingDetails:](v5, "setFundingDetails:", v8);
  v9 = objc_alloc_init(PKAccountTransferScheduleDetails);
  -[PKAccountTransferScheduleDetails setFrequency:](v9, "setFrequency:", 2);
  -[PKAccountTransfer setScheduleDetails:](v2, "setScheduleDetails:", v9);
  -[PKAccountTransfer setExternalAccount:](v2, "setExternalAccount:", v5);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountTransfer setIdentifier:](v2, "setIdentifier:", v11);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountTransfer setReferenceIdentifier:](v2, "setReferenceIdentifier:", v13);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountTransfer setClientReferenceIdentifier:](v2, "setClientReferenceIdentifier:", v15);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 604800.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountTransfer setTransferDate:](v2, "setTransferDate:", v16);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountTransfer setTransferStatusDate:](v2, "setTransferStatusDate:", v17);

  -[PKAccountTransfer setCancellable:](v2, "setCancellable:", 1);
  return v2;
}

+ (id)date1
{
  return CFSTR("2018-07-01T00:00:00+00:00");
}

+ (id)date2
{
  return CFSTR("2018-08-01T00:00:00+00:00");
}

+ (id)date3
{
  return CFSTR("2018-09-01T00:00:00+00:00");
}

+ (id)date4
{
  return CFSTR("2018-10-01T00:00:00+00:00");
}

+ (id)date5
{
  return CFSTR("2018-11-01T00:00:00+00:00");
}

+ (id)date6
{
  return CFSTR("2017-01-01T00:00:00+00:00");
}

+ (id)date7
{
  return CFSTR("2017-02-01T00:00:00+00:00");
}

+ (id)date8
{
  return CFSTR("2017-03-01T00:00:00+00:00");
}

@end

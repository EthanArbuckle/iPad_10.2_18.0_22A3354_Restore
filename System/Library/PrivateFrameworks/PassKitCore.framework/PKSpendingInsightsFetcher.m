@implementation PKSpendingInsightsFetcher

- (PKSpendingInsightsFetcher)init
{
  PKSpendingInsightsFetcher *v2;
  FHSearchSuggestionController *v3;
  FHSearchSuggestionController *searchSuggestionController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSpendingInsightsFetcher;
  v2 = -[PKSpendingInsightsFetcher init](&v6, sel_init);
  if (v2)
  {
    v3 = (FHSearchSuggestionController *)objc_alloc_init((Class)getFHSearchSuggestionControllerClass[0]());
    searchSuggestionController = v2->_searchSuggestionController;
    v2->_searchSuggestionController = v3;

    v2->_foundInsightsDiscrepancy = 0;
  }
  return v2;
}

- (void)fetchInsightTrendsForSummary:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  FHSearchSuggestionController *searchSuggestionController;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(id, _QWORD, void *);
  id v24;
  id location;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (self->_foundInsightsDiscrepancy)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKSpendingInsightErrorDomain"), 3, 0);
    v7[2](v7, 0, v8);

  }
  else
  {
    v9 = objc_msgSend(v6, "summaryType");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "compare:", v10) == -1)
      v12 = v11;
    else
      v12 = v10;
    v13 = v12;

    objc_initWeak(&location, self);
    searchSuggestionController = self->_searchSuggestionController;
    _MergedGlobals_186();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v15;
    off_1ECF21C58();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 1;
    if (v9 == 1)
      v18 = 2;
    if (v9 == 2)
      v19 = 3;
    else
      v19 = v18;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __69__PKSpendingInsightsFetcher_fetchInsightTrendsForSummary_completion___block_invoke;
    v21[3] = &unk_1E2ADDBE8;
    v22 = v6;
    objc_copyWeak(&v24, &location);
    v23 = v7;
    -[FHSearchSuggestionController allFeatureInsightsWithStartDate:endDate:insightTypeItems:trendWindow:completion:](searchSuggestionController, "allFeatureInsightsWithStartDate:endDate:insightTypeItems:trendWindow:completion:", v20, v13, v17, v19, v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
}

void __69__PKSpendingInsightsFetcher_fetchInsightTrendsForSummary_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _BYTE *WeakRetained;
  PKSpendingInsightTrendCollection *v8;
  uint64_t v9;
  PKSpendingInsightTrendCollection *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0xEuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v3;
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Received FH insights: %@\n\nfor summary with startDate %@ and endDate %@", (uint8_t *)&v15, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      v8 = -[PKSpendingInsightTrendCollection initWithFHFeatureInsights:]([PKSpendingInsightTrendCollection alloc], "initWithFHFeatureInsights:", v3);
      if (objc_msgSend(WeakRetained, "_validateTrends:againstSummary:", v8, *(_QWORD *)(a1 + 32)))
      {
        v9 = *(_QWORD *)(a1 + 40);
        if (v9)
        {
          v10 = -[PKSpendingInsightTrendCollection initWithFHFeatureInsights:]([PKSpendingInsightTrendCollection alloc], "initWithFHFeatureInsights:", v3);
          (*(void (**)(uint64_t, PKSpendingInsightTrendCollection *, _QWORD))(v9 + 16))(v9, v10, 0);
LABEL_15:

        }
      }
      else
      {
        WeakRetained[16] = 1;
        v14 = *(_QWORD *)(a1 + 40);
        if (v14)
        {
          v10 = (PKSpendingInsightTrendCollection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKSpendingInsightErrorDomain"), 3, 0);
          (*(void (**)(uint64_t, _QWORD, PKSpendingInsightTrendCollection *))(v14 + 16))(v14, 0, v10);
          goto LABEL_15;
        }
      }
LABEL_16:

      goto LABEL_17;
    }
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v13 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v13 = -1;
LABEL_12:
      v8 = (PKSpendingInsightTrendCollection *)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("PKSpendingInsightErrorDomain"), v13, 0);
      (*(void (**)(uint64_t, _QWORD, PKSpendingInsightTrendCollection *))(v11 + 16))(v11, 0, v8);
      goto LABEL_16;
    }
  }
LABEL_17:

}

- (BOOL)_validateTrends:(id)a3 againstSummary:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(void *, id);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  BOOL v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void (**v51)(void *, id);
  void (**v52)(void *, id);
  id obj;
  uint64_t v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  id v62;
  _QWORD aBlock[5];
  id v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PKSpendingInsightsFetcher__validateTrends_againstSummary___block_invoke_2;
  aBlock[3] = &unk_1E2ADDC10;
  aBlock[4] = self;
  v8 = v7;
  v64 = v8;
  v9 = (void (**)(void *, id))_Block_copy(aBlock);
  objc_msgSend(v6, "overallSpendingTrend");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "totalSpending");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "amount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "totalSpending");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v13, "amount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = 0;
  LOBYTE(v13) = __60__PKSpendingInsightsFetcher__validateTrends_againstSummary___block_invoke(v12, v14, &v62);
  v15 = v62;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v6, "overallSpendingTrend");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "previousTotalSpending");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "amount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "previousTotalSpending");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "amount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "isCurrentPeriod") & 1) == 0)
    {
      v61 = v15;
      v21 = v20;
      v22 = v18;
      v23 = v21;
      v24 = __60__PKSpendingInsightsFetcher__validateTrends_againstSummary___block_invoke(v18, v21, &v61);
      v25 = v61;

      if (!v24)
      {
        PKLogFacilityTypeGetObject(0xEuLL);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "startDate");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "endDate");
          v52 = v9;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v66 = v45;
          v67 = 2114;
          v68 = v46;
          v69 = 2112;
          v70 = v22;
          v71 = 2112;
          v72 = v23;
          _os_log_impl(&dword_18FC92000, v44, OS_LOG_TYPE_DEFAULT, "Rejecting trends for dates [%{public}@ to %{public}@]\nbecause previous spending %@\ndoes not match summary previous spending %@. No further insights will be generated for this session.", buf, 0x2Au);

          v9 = v52;
        }

        v9[2](v9, v25);
        v36 = 0;
        v15 = v25;
        v18 = v22;
        v20 = v23;
LABEL_26:

        goto LABEL_27;
      }
      v15 = v25;
      v18 = v22;
      v20 = v23;
    }
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(v8, "orderedSpendingCategories");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
    if (v26)
    {
      v27 = v26;
      v48 = v20;
      v49 = v18;
      v50 = v8;
      v51 = v9;
      v54 = *(_QWORD *)v58;
      v55 = v6;
      while (2)
      {
        v28 = 0;
        v29 = v15;
        v30 = v14;
        v31 = v12;
        do
        {
          if (*(_QWORD *)v58 != v54)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v28);
          objc_msgSend(v55, "spendingTrendForMerchantCategory:", objc_msgSend(v32, "merchantCategory", v48, v49));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "totalSpending");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "amount");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "totalAmount");
          v35 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v35, "amount");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v56 = v29;
          LOBYTE(v35) = __60__PKSpendingInsightsFetcher__validateTrends_againstSummary___block_invoke(v12, v14, &v56);
          v15 = v56;

          if ((v35 & 1) == 0)
          {
            PKLogFacilityTypeGetObject(0xEuLL);
            v40 = objc_claimAutoreleasedReturnValue();
            v8 = v50;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v50, "startDate");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "endDate");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              PKMerchantCategoryToString(objc_msgSend(v32, "merchantCategory"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v66 = v41;
              v67 = 2114;
              v68 = v42;
              v69 = 2112;
              v70 = v43;
              v71 = 2112;
              v72 = v12;
              v73 = 2112;
              v74 = v14;
              _os_log_impl(&dword_18FC92000, v40, OS_LOG_TYPE_DEFAULT, "Rejecting trends for dates [%{public}@ to %{public}@]\nbecause spending for merchant category %@ %@\ndoes not match summary spending %@. No further insights will be generated for this session.", buf, 0x34u);

            }
            v9 = v51;
            v51[2](v51, v15);
            v36 = 0;
            v6 = v55;
            goto LABEL_20;
          }
          ++v28;
          v29 = v15;
          v30 = v14;
          v31 = v12;
        }
        while (v27 != v28);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
        if (v27)
          continue;
        break;
      }
      v36 = 1;
      v6 = v55;
      v8 = v50;
      v9 = v51;
LABEL_20:
      v20 = v48;
      v18 = v49;
    }
    else
    {
      v36 = 1;
    }

    goto LABEL_26;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "startDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v66 = v38;
    v67 = 2114;
    v68 = v39;
    v69 = 2112;
    v70 = v12;
    v71 = 2112;
    v72 = v14;
    _os_log_impl(&dword_18FC92000, v37, OS_LOG_TYPE_DEFAULT, "Rejecting trends for dates [%{public}@ to %{public}@]\nbecause total spending %@\ndoes not match summary total spending %@. No further insights will be generated for this session.", buf, 0x2Au);

  }
  v9[2](v9, v15);
  v36 = 0;
LABEL_27:

  return v36;
}

BOOL __60__PKSpendingInsightsFetcher__validateTrends_againstSummary___block_invoke(void *a1, void *a2, _QWORD *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x1E0CB35A0];
  v6 = a2;
  v7 = a1;
  objc_msgSend(v5, "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, 2, 0, 1, 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decimalNumberByRoundingAccordingToBehavior:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "decimalNumberByRoundingAccordingToBehavior:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "compare:", v10);
  v12 = v11;
  if (a3 && v11)
  {
    objc_msgSend(v9, "decimalNumberBySubtracting:", v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12 == 0;
}

void __60__PKSpendingInsightsFetcher__validateTrends_againstSummary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int has_internal_ui;
  id v5;
  PKAutoBugCaptureReporter *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  has_internal_ui = os_variant_has_internal_ui();
  if (v3 && has_internal_ui && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v5, "setMaximumFractionDigits:", 2);
    v6 = objc_alloc_init(PKAutoBugCaptureReporter);
    v13[0] = CFSTR("insightDifferenceFromSummary");
    objc_msgSend(v5, "stringFromNumber:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v13[1] = CFSTR("startDate");
    objc_msgSend(*(id *)(a1 + 40), "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v9;
    v13[2] = CFSTR("endDate");
    objc_msgSend(*(id *)(a1 + 40), "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAutoBugCaptureReporter reportIssueWithDomain:type:subtype:subtypeContext:payload:](v6, "reportIssueWithDomain:type:subtype:subtypeContext:payload:", CFSTR("Wallet"), CFSTR("PKSpendingInsightsFetcher"), CFSTR("SpendingDiscrepancy"), 0, v12);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSuggestionController, 0);
}

@end

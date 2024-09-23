@implementation PSSuggestionFromTextPredictor

BOOL __98___PSSuggestionFromTextPredictor_suggestionFromContactPriors_priorScoreThreshold_bundleID_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  float v5;
  _BOOL8 v6;

  v3 = a2;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __98___PSSuggestionFromTextPredictor_suggestionFromContactPriors_priorScoreThreshold_bundleID_reason___block_invoke_cold_1(v3, a1, v4);

  objc_msgSend(v3, "priorScore");
  v6 = v5 >= *(float *)(a1 + 32);

  return v6;
}

BOOL __98___PSSuggestionFromTextPredictor_suggestionFromContactPriors_priorScoreThreshold_bundleID_reason___block_invoke_51(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSInteractionStoreUtils someInteractionWithMatchingIdentifier:store:bundleIds:afterStartDate:](_PSInteractionStoreUtils, "someInteractionWithMatchingIdentifier:store:bundleIds:afterStartDate:", v4, *(_QWORD *)(a1[4] + 16), a1[5], a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "contactIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1A07F4000, v6, OS_LOG_TYPE_DEFAULT, "Contact %@ hasn't been interacted with recently enough", (uint8_t *)&v9, 0xCu);

    }
  }

  return v5 != 0;
}

_PSRecipient *__98___PSSuggestionFromTextPredictor_suggestionFromContactPriors_priorScoreThreshold_bundleID_reason___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _PSRecipient *v17;
  void *v18;
  _PSRecipient *v19;
  NSObject *v20;
  void *v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_PSContactCache sharedInstance](_PSContactCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getContactForHandle:handleType:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "contactIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v21;
      _os_log_impl(&dword_1A07F4000, v20, OS_LOG_TYPE_DEFAULT, "Unable to match contact for identifier %@", (uint8_t *)&v23, 0xCu);

    }
    goto LABEL_9;
  }
  v7 = (void *)MEMORY[0x1E0D15890];
  objc_msgSend(v6, "phoneNumbers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "normalizedStringFromContactString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = (void *)MEMORY[0x1E0D15890];
    objc_msgSend(v6, "emailAddresses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "normalizedStringFromContactString:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v6, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
LABEL_9:
        v19 = 0;
        goto LABEL_10;
      }
    }
  }
  v17 = [_PSRecipient alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "stringFromContact:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[_PSRecipient initWithIdentifier:handle:displayName:contact:](v17, "initWithIdentifier:handle:displayName:contact:", v12, v12, v18, v6);

LABEL_10:
  return v19;
}

uint64_t __118___PSSuggestionFromTextPredictor_suggestionsFromIncompleteRemindersWithContext_startDate_endDate_priorScoreThreshold___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

id __118___PSSuggestionFromTextPredictor_suggestionsFromIncompleteRemindersWithContext_startDate_endDate_priorScoreThreshold___block_invoke_61(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "titleAsString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = v5;
  objc_msgSend(v3, "suggestionFromText:priorScoreThreshold:bundleID:reason:", v4, v6, CFSTR("Reminder Title"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __125___PSSuggestionFromTextPredictor_suggestionsFromPortraitExtractionsWithContext_startDate_endDate_priorScoreThreshold_reason___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactsContactIdentifierWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __125___PSSuggestionFromTextPredictor_suggestionsFromPortraitExtractionsWithContext_startDate_endDate_priorScoreThreshold_reason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setContactIdentifier:", v3);

  v5 = *(void **)(a1 + 32);
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_DWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = v7;
  objc_msgSend(v5, "suggestionFromContactPriors:priorScoreThreshold:bundleID:reason:", v6, v8, *(_QWORD *)(a1 + 48), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __125___PSSuggestionFromTextPredictor_suggestionsFromUnstructuredCalendarEventsWithContext_startDate_endDate_priorScoreThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (+[_PSSuggestionFromTextPredictor isEligibleUnstructuredEvent:](_PSSuggestionFromTextPredictor, "isEligibleUnstructuredEvent:"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

}

id __125___PSSuggestionFromTextPredictor_suggestionsFromUnstructuredCalendarEventsWithContext_startDate_endDate_priorScoreThreshold___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = v5;
  objc_msgSend(v3, "suggestionFromText:priorScoreThreshold:bundleID:reason:", v4, v6, CFSTR("Calendar Event Title (Siri Vocabulary)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __98___PSSuggestionFromTextPredictor_suggestionFromContactPriors_priorScoreThreshold_bundleID_reason___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  double v7;
  float v8;
  int v9;
  void *v10;
  __int16 v11;
  double v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "priorScore");
  v7 = *(float *)(a2 + 32);
  v9 = 138412802;
  v10 = v6;
  v11 = 2048;
  v12 = v8;
  v13 = 2048;
  v14 = v7;
  _os_log_debug_impl(&dword_1A07F4000, a3, OS_LOG_TYPE_DEBUG, "Contact %@ has prior score %f, thresholding with %f", (uint8_t *)&v9, 0x20u);

}

@end

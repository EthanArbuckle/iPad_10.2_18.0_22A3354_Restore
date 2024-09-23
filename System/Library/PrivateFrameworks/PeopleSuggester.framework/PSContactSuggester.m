@implementation PSContactSuggester

void __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_94(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __150___PSContactSuggester_gameCenterSuggestionsWithMaxSuggestions_interactionDomains_appleUsersOnly_includeGroupSuggestions_excludeContactsByIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (objc_msgSend(v2, "state") == 1)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __150___PSContactSuggester_gameCenterSuggestionsWithMaxSuggestions_interactionDomains_appleUsersOnly_includeGroupSuggestions_excludeContactsByIdentifiers___block_invoke_cold_1(v2, v3);

  }
}

void __150___PSContactSuggester_gameCenterSuggestionsWithMaxSuggestions_interactionDomains_appleUsersOnly_includeGroupSuggestions_excludeContactsByIdentifiers___block_invoke_119(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "eventBody");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v5, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

uint64_t __150___PSContactSuggester_gameCenterSuggestionsWithMaxSuggestions_interactionDomains_appleUsersOnly_includeGroupSuggestions_excludeContactsByIdentifiers___block_invoke_124(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a2, "recipients", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9) & 1) != 0)
            v7 = 0;
          else
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1;
  }

  objc_msgSend(*(id *)(a1 + 32), "unionSet:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
  return v7 & 1;
}

uint64_t __151___PSContactSuggester_contactSuggestionsWithMaxSuggestions_interactionDomains_referenceDate_appleUsersOnly_includeGroups_excludeContactsByIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v15;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "regularityScore");
  v7 = v6;
  objc_msgSend(v5, "regularityScore");
  if (v7 > v8)
  {
LABEL_5:
    v12 = -1;
    goto LABEL_6;
  }
  objc_msgSend(v4, "regularityScore");
  v10 = v9;
  objc_msgSend(v5, "regularityScore");
  if (v10 >= v11)
  {
    v13 = objc_msgSend(v4, "totalFrequency");
    if (v13 <= objc_msgSend(v5, "totalFrequency"))
    {
      v15 = objc_msgSend(v4, "totalFrequency");
      v12 = v15 < objc_msgSend(v5, "totalFrequency");
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v12 = 1;
LABEL_6:

  return v12;
}

uint64_t __128___PSContactSuggester_computeContactPriorsForContactIdentifiers_withTimeConstant_withInteractionMechanisms_asOf_overLookbackOf___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;

  v4 = a3;
  objc_msgSend(a2, "priorScore");
  v6 = v5;
  objc_msgSend(v4, "priorScore");
  v8 = v7;

  if (v6 <= v8)
    return 1;
  else
    return -1;
}

void __56___PSContactSuggester_computeAndSaveContactPriorArchive__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _PSContactSuggesterArchive *v4;
  void *v5;
  _PSContactSuggesterArchive *v6;

  v2 = (void *)MEMORY[0x1A1AFCA24]();
  objc_msgSend(*(id *)(a1 + 32), "computeContactPriorsForContactIdentifiers:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [_PSContactSuggesterArchive alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_PSContactSuggesterArchive initWithArchiveDate:contactPriorDictionary:](v4, "initWithArchiveDate:contactPriorDictionary:", v5, v3);

  objc_msgSend(*(id *)(a1 + 32), "writeArchive:", v6);
  objc_autoreleasePoolPop(v2);
}

void __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "XPC Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __150___PSContactSuggester_gameCenterSuggestionsWithMaxSuggestions_interactionDomains_appleUsersOnly_includeGroupSuggestions_excludeContactsByIdentifiers___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_ERROR, "Finalizing local events failed: %@", v4, 0xCu);

}

@end

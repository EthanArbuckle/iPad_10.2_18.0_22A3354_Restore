@implementation PSMessagesPinningSuggester

void __77___PSMessagesPinningSuggester_chatGuidsForMessagesPinningWithMaxSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __77___PSMessagesPinningSuggester_chatGuidsForMessagesPinningWithMaxSuggestions___block_invoke_112(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __147___PSMessagesPinningSuggester_chatGuidsBasedOnRegularityAndIntensityWithMaxSuggestions_referenceDate_minimumDaysOfHistory_maxInteractionsForQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  objc_msgSend(a2, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v8 = v7;
  objc_msgSend(v6, "doubleValue");
  if (v8 >= v9)
  {
    objc_msgSend(v5, "doubleValue");
    v12 = v11;
    objc_msgSend(v6, "doubleValue");
    if (v12 <= v13)
      v10 = 0;
    else
      v10 = -1;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

void __62___PSMessagesPinningSuggester_provideMessagesPinningFeedback___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __61___PSMessagesPinningSuggester_submitMessagesPinningFeedback___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[_PSLogging messagePinningChannel](_PSLogging, "messagePinningChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __61___PSMessagesPinningSuggester_submitMessagesPinningFeedback___block_invoke_cold_1();

  }
}

id __61___PSMessagesPinningSuggester_submitMessagesPinningFeedback___block_invoke_157(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __61___PSMessagesPinningSuggester_submitMessagesPinningFeedback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Error while donating to Tips: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

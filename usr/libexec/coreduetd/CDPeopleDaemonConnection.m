@implementation CDPeopleDaemonConnection

- (void)rankedMessagesPinsWithMaxSuggestions:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v6[2](v6, 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v7, "rankedMessagesPinsWithMaxSuggestions:reply:", v8, v6);

  }
}

- (void)contactSuggestionsWithMaxSuggestions:(id)a3 excludedContactIds:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "contactSuggestionsWithMaxSuggestions:excludedContactIds:reply:", v11, v8, v9);

  }
}

- (void)setQueryInteractionsOnlyAuthorization:(BOOL)a3
{
  self->_queryInteractionsOnlyAuthorization = a3;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (BOOL)queryInteractionsOnlyAuthorization
{
  return self->_queryInteractionsOnlyAuthorization;
}

- (CDPeopleDaemon)daemon
{
  return self->_daemon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemon, 0);
}

- (id)unauthorizedClientError
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSErrorUserInfoKey v6;
  const __CFString *v7;

  v2 = _DKErrorDomain;
  v6 = NSLocalizedDescriptionKey;
  v7 = CFSTR("unauthorized client");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v2, 9, v3));

  return v4;
}

- (void)recordInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  void (**v10)(id, _QWORD);
  void *v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v12 = a3;
  v10 = (void (**)(id, _QWORD))a6;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v10[2](v10, 0);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v11, "recordInteractions:enforceDataLimits:enforcePrivacy:reply:", v12, v8, v7, v10);

  }
}

- (void)updateInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  void (**v10)(id, _QWORD);
  void *v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v12 = a3;
  v10 = (void (**)(id, _QWORD))a6;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v10[2](v10, 0);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v11, "updateInteractions:enforceDataLimits:enforcePrivacy:reply:", v12, v8, v7, v10);

  }
}

- (void)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
  objc_msgSend(v13, "queryInteractionsUsingPredicate:sortDescriptors:limit:reply:", v12, v11, a5, v10);

}

- (void)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a6;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v11[2](v11, 0, v12);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v12, "queryContactsUsingPredicate:sortDescriptors:limit:reply:", v13, v10, a5, v11);
  }

}

- (void)countInteractionsUsingPredicate:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v6[2](v6, 0, v7);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v7, "countInteractionsUsingPredicate:reply:", v8, v6);
  }

}

- (void)countContactsUsingPredicate:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v6[2](v6, 0, v7);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v7, "countContactsUsingPredicate:reply:", v8, v6);
  }

}

- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a6;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v11[2](v11, 0, v12);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v12, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:reply:", v13, v10, a5, v11);
  }

}

- (void)deleteInteractionsWithBundleId:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v6[2](v6, 0, v7);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v7, "deleteInteractionsWithBundleId:reply:", v8, v6);
  }

}

- (void)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v9[2](v9, 0, v10);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "deleteInteractionsWithBundleId:account:reply:", v11, v8, v9);
  }

}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v9[2](v9, 0, v10);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "deleteInteractionsWithBundleId:domainIdentifier:reply:", v11, v8, v9);
  }

}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v9[2](v9, 0, v10);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "deleteInteractionsWithBundleId:domainIdentifiers:reply:", v11, v8, v9);
  }

}

- (void)rankCandidateContacts:(id)a3 usingSettings:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "rankCandidateContacts:usingSettings:reply:", v11, v8, v9);

  }
}

- (void)adviseInteractionsUsingSettings:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  unsigned int v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v7 = -[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization");
  if (!v9 || v7)
  {
    v6[2](v6, 0);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v8, "adviseInteractionsUsingSettings:reply:", v9, v6);

  }
}

- (void)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "adviseInteractionsForDate:usingSettings:reply:", v11, v8, v9);

  }
}

- (void)adviseSocialInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
    v12[2](v12, 0);
  else
    -[CDPeopleDaemonConnection adviseSocialInteractionsForDate:andSeedContacts:usingSettings:reply:](self, "adviseSocialInteractionsForDate:andSeedContacts:usingSettings:reply:", v13, v10, v11, v12);

}

- (void)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "adviseInteractionsForKeywordsInString:usingSettings:reply:", v11, v8, v9);

  }
}

- (void)tuneSocialAdvisorUsingSettings:(id)a3 heartBeatHandler:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "tuneSocialAdvisorUsingSettings:heartBeatHandler:reply:", v11, v8, v9);

  }
}

- (void)suggestInteractionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5
{
  void (**v8)(id, void *, id);
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = (void (**)(id, void *, id))a5;
  v9 = a3;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    objc_msgSend(v9, "setSuggestionPath:", CFSTR("suggestionPathQueryInteractionsOnlyAuthorization"));
    v8[2](v8, &__NSArray0__struct, v9);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "suggestInteractionsFromContext:maxSuggestions:reply:", v9, v11, v8);

    v8 = (void (**)(id, void *, id))v9;
    v9 = v10;
  }

}

- (void)shareExtensionSuggestionsFromContext:(id)a3 reply:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, void *))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v6[2](v6, &__NSArray0__struct);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v7, "shareExtensionSuggestionsFromContext:reply:", v8, v6);

  }
}

- (void)candidatesForShareSheetRanking:(id)a3
{
  void (**v4)(_QWORD);
  NSSet *v5;

  v4 = (void (**)(_QWORD))a3;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v5 = objc_opt_new(NSSet);
    v4[2](v4);
  }
  else
  {
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    -[NSSet candidatesForShareSheetRanking:](v5, "candidatesForShareSheetRanking:", v4);
  }

}

- (void)validateCoreMLScoringModelWithRawInput:(id)a3 predictionContext:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, id);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, id))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, v8);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "validateCoreMLScoringModelWithRawInput:predictionContext:reply:", v11, v8, v9);

  }
}

- (void)computeShareSheetEphemeralFeaturesWithPredictionContext:(id)a3 reply:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, void *))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v6[2](v6, &__NSDictionary0__struct);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v7, "computeShareSheetEphemeralFeaturesWithPredictionContext:reply:", v8, v6);

  }
}

- (void)mapsSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "mapsSuggestionsFromContext:maxSuggestions:reply:", v11, v8, v9);

  }
}

- (void)zkwSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "zkwSuggestionsFromContext:maxSuggestions:reply:", v11, v8, v9);

  }
}

- (void)autocompleteSearchResultsWithPredictionContext:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v6[2](v6, 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v7, "autocompleteSearchResultsWithPredictionContext:reply:", v8, v6);

  }
}

- (void)saveFeedbackInCoreDuetd:(id)a3 forSessionId:(id)a4 feedbackActionType:(int64_t)a5 isFallbackFetch:(BOOL)a6 reply:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a6;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
  objc_msgSend(v15, "saveFeedbackInCoreDuetd:forSessionId:feedbackActionType:isFallbackFetch:reply:", v14, v13, a5, v7, v12);

}

- (void)provideFeedbackForContactsAutocompleteSuggestions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
  objc_msgSend(v5, "provideFeedbackForContactsAutocompleteSuggestions:", v4);

}

- (void)rankedNameSuggestionsFromContext:(id)a3 name:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "rankedNameSuggestionsFromContext:name:reply:", v11, v8, v9);

  }
}

- (void)rankedAutocompleteSuggestionsFromContext:(id)a3 candidates:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "rankedAutocompleteSuggestionsFromContext:candidates:reply:", v11, v8, v9);

  }
}

- (void)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(id)a5 reply:(id)a6
{
  _BOOL8 v8;
  id v10;
  void (**v11)(id, _QWORD);
  void *v12;
  id v13;

  v8 = a4;
  v13 = a3;
  v10 = a5;
  v11 = (void (**)(id, _QWORD))a6;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v11[2](v11, 0);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v12, "rankedGlobalSuggestionsFromContext:contactsOnly:maxSuggestions:reply:", v13, v8, v10, v11);

  }
}

- (void)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(id)a5 excludeBackfillSuggestions:(BOOL)a6 reply:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  id v15;

  v8 = a6;
  v10 = a4;
  v15 = a3;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a7;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v13[2](v13, 0);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v14, "rankedGlobalSuggestionsFromContext:contactsOnly:maxSuggestions:excludeBackfillSuggestions:reply:", v15, v10, v12, v8, v13);

  }
}

- (void)provideMessagesPinningFeedback:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
  objc_msgSend(v5, "provideMessagesPinningFeedback:", v4);

}

- (void)rankedFamilySuggestionsWithReply:(id)a3
{
  void *v4;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v5[2](v5, 0);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v4, "rankedFamilySuggestionsWithReply:", v5);

  }
}

- (void)familyRecommendedSuggestionsWithPredictionContext:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v6[2](v6, 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v7, "familyRecommendedSuggestionsWithPredictionContext:reply:", v8, v6);

  }
}

- (void)photosRelationshipSuggestionsWithPredictionContext:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v6[2](v6, 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v7, "photosRelationshipSuggestionsWithPredictionContext:reply:", v8, v6);

  }
}

- (void)photosContactInferencesSuggestionsWithPredictionContext:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v6[2](v6, 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v7, "photosContactInferencesSuggestionsWithPredictionContext:reply:", v8, v6);

  }
}

- (void)rankedSiriMLCRHandlesFromContext:(id)a3 handles:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "rankedSiriMLCRHandlesFromContext:handles:reply:", v11, v8, v9);

  }
}

- (void)rankedHandlesFromCandidateHandles:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v6[2](v6, 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v7, "rankedHandlesFromCandidateHandles:reply:", v8, v6);

  }
}

- (void)relativeAppUsageProbabilitiesForCandidateBundleIds:(id)a3 daysAgo:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "relativeAppUsageProbabilitiesForCandidateBundleIds:daysAgo:reply:", v11, v8, v9);

  }
}

- (void)rankedSiriNLContactSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 interactionId:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v12[2](v12, 0);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v13, "rankedSiriNLContactSuggestionsFromContext:maxSuggestions:interactionId:reply:", v14, v10, v11, v12);

  }
}

@end

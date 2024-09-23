@implementation _PSSiriNLLogger

- (void)logPeopleSuggesterDataWithSessionId:(id)a3
{
  void *v3;
  _PSPredictionContext *v4;
  const __CFString *v5;
  id v6;
  __CFString *v7;

  v7 = (__CFString *)a3;
  +[_PSSuggester suggesterWithDaemon](_PSSuggester, "suggesterWithDaemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(_PSPredictionContext);
  if (v7)
    v5 = v7;
  else
    v5 = &stru_1E4402490;
  v6 = (id)objc_msgSend(v3, "rankedSiriNLContactSuggestionsFromContext:maxSuggestions:interactionId:", v4, &unk_1E442AF40, v5);

}

@end

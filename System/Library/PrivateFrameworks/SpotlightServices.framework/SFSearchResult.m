@implementation SFSearchResult

void __47__SFSearchResult_SPFeedback__objectForFeedback__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  NSClassFromString(CFSTR("ATXSearchResult"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)objectForFeedback_atxAppClass;
  objectForFeedback_atxAppClass = v0;

  NSClassFromString(CFSTR("ATXActionSearchResult"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)objectForFeedback_atxResultClass;
  objectForFeedback_atxResultClass = v2;

  NSClassFromString(CFSTR("ATXSuggestionSearchResult"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)objectForFeedback_atxSuggestionResultClass;
  objectForFeedback_atxSuggestionResultClass = v4;

}

@end

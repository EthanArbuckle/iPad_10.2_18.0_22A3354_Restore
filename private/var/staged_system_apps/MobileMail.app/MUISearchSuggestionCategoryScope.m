@implementation MUISearchSuggestionCategoryScope

+ (id)genericSpotlightScope
{
  id v2;

  v2 = objc_alloc_init((Class)MUISearchSuggestionCategoryScope);
  objc_msgSend(v2, "setPredicateApplier:", &stru_100522C40);
  objc_msgSend(v2, "setParsecScope:", MSSearchScopeMessage);
  return v2;
}

@end

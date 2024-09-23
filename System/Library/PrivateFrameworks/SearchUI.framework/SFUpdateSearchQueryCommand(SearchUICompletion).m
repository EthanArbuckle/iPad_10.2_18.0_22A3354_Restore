@implementation SFUpdateSearchQueryCommand(SearchUICompletion)

- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion
{
  return +[SearchUICompletion localizedSearchString](SearchUICompletion, "localizedSearchString");
}

@end

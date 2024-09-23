@implementation SFPerformEntityQueryCommand(SearchUICompletion)

- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion
{
  return +[SearchUICompletion localizedShowMoreString](SearchUICompletion, "localizedShowMoreString");
}

@end

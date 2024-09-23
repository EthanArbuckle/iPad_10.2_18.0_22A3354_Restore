@implementation SFShareItem(SearchUIShareCommand)

- (uint64_t)searchUI_fetchShareableItemWithCompletionHandler:()SearchUIShareCommand
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, 0);
}

@end

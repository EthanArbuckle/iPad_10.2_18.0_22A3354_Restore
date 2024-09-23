@implementation SFURLShareItem(SearchUIShareCommand)

- (void)searchUI_fetchShareableItemWithCompletionHandler:()SearchUIShareCommand
{
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v5 = a3;
  objc_msgSend(a1, "urlValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))a3)[2](v5, v6);

}

@end

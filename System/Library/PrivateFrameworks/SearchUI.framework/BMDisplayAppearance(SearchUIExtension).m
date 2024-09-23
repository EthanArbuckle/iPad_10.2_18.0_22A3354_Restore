@implementation BMDisplayAppearance(SearchUIExtension)

- (void)getEnabledStatusWithCompletion:()SearchUIExtension
{
  id v5;

  v5 = a3;
  ((void (**)(id, BOOL))a3)[2](v5, objc_msgSend(a1, "state") == 2);

}

@end

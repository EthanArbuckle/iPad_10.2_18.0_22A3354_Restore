@implementation TUApplicationContentSizeCategoryProvider

- (TUApplicationContentSizeCategoryProvider)init
{
  return (TUApplicationContentSizeCategoryProvider *)ApplicationContentSizeCategoryProvider.init()();
}

- (NSString)currentContentSizeCategory
{
  TUApplicationContentSizeCategoryProvider *v2;
  id v3;

  v2 = self;
  v3 = ApplicationContentSizeCategoryProvider.currentContentSizeCategory.getter();

  return (NSString *)v3;
}

@end

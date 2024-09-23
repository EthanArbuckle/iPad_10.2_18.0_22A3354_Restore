@implementation PXLemonadeSearchViewControllerFactory

+ (void)presentLocationPickerWithPhotoLibrary:(id)a3 completion:(id)a4
{
  void *v4;

  v4 = _Block_copy(a4);
  _Block_release(v4);
}

+ (void)presentDatePickerWithCompletion:(id)a3
{
  void *v3;

  v3 = _Block_copy(a3);
  _Block_release(v3);
}

- (PXLemonadeSearchViewControllerFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXLemonadeSearchViewControllerFactory;
  return -[PXLemonadeSearchViewControllerFactory init](&v3, sel_init);
}

@end

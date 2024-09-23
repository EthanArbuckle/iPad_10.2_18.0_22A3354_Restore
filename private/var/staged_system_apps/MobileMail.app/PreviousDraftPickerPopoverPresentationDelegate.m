@implementation PreviousDraftPickerPopoverPresentationDelegate

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_alloc((Class)UINavigationController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
  v7 = objc_msgSend(v5, "initWithRootViewController:", v6);

  return v7;
}

@end

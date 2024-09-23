@implementation UIViewController(WelcomeController)

- (BOOL)ob_isFormSheet
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "modalPresentationStyle");

  }
  else
  {
    v4 = objc_msgSend(a1, "modalPresentationStyle");
  }
  return v4 == 2;
}

@end

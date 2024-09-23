@implementation UIViewController_UITraitCollection

- (id)view
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  void *v6;

  objc_msgSend_tmlParent(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end

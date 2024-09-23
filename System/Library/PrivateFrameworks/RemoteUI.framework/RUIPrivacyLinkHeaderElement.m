@implementation RUIPrivacyLinkHeaderElement

- (void)configureView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v7;
    -[RUIElement pageElement](self, "pageElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "page");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configureInPage:", v6);

  }
}

@end

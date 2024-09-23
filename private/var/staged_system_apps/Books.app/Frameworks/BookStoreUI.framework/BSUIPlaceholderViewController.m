@implementation BSUIPlaceholderViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUIPlaceholderViewController;
  -[BSUIPlaceholderViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration loadingConfiguration](UIContentUnavailableConfiguration, "loadingConfiguration"));
  -[BSUIPlaceholderViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v3);

  -[BSUIPlaceholderViewController bc_setNavBarVisible:](self, "bc_setNavBarVisible:", 1);
}

- (CGSize)expectedContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIPlaceholderViewController view](self, "view"));
  objc_msgSend(v3, "frame");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIPlaceholderViewController view](self, "view"));
  objc_msgSend(v6, "sizeThatFits:", v5, 3.40282347e38);
  v8 = v7;

  v9 = v8 + 32.0;
  v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v2, "userInterfaceIdiom") == (char *)&dword_0 + 1)
    v3 = 30;
  else
    v3 = 2;

  return v3;
}

@end

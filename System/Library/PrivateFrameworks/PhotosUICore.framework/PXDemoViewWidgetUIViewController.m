@implementation PXDemoViewWidgetUIViewController

- (PXDemoViewWidgetUIViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDemoViewWidgetUIViewController;
  return -[PXDemoViewWidgetUIViewController init](&v3, sel_init);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXDemoViewWidgetUIViewController;
  -[PXDemoViewWidgetUIViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PXDemoViewWidgetUIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[UIViewController px_enableBarAppearance](self, "px_enableBarAppearance");
  -[UIViewController px_barAppearance](self, "px_barAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performChangesWithAnimationOptions:changes:", 0, &__block_literal_global_190837);

}

void __47__PXDemoViewWidgetUIViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPrefersStatusBarVisible:", 1);
  objc_msgSend(v2, "setPrefersNavigationBarVisible:", 1);
  objc_msgSend(v2, "setPrefersToolbarVisible:", 0);
  objc_msgSend(v2, "setPrefersTabBarVisible:", 0);

}

@end

@implementation WFActionButtonConfigurationViewController

- (WFActionButtonConfigurationViewController)initWithConfigurationContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFActionButtonConfigurationViewController;
  return -[WFSystemActionConfigurationViewController initWithConfigurationContext:](&v4, sel_initWithConfigurationContext_, a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFActionButtonConfigurationViewController;
  -[WFActionButtonConfigurationViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[WFActionButtonConfigurationViewController sheetPresentationController](self, "sheetPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInterfaceStyle:", 2);

  -[WFActionButtonConfigurationViewController sheetPresentationController](self, "sheetPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrefersGrabberVisible:", 1);

}

@end

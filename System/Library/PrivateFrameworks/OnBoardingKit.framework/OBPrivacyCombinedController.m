@implementation OBPrivacyCombinedController

- (OBPrivacyCombinedController)init
{
  return -[OBPrivacyCombinedController initWithBundles:](self, "initWithBundles:", 0);
}

- (OBPrivacyCombinedController)initWithBundles:(id)a3
{
  id v4;
  OBPrivacyCombinedController_iOS *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (-[OBPrivacyCombinedController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[OBPrivacyCombinedController_iOS initWithBundles:]([OBPrivacyCombinedController_iOS alloc], "initWithBundles:", v4);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)OBPrivacyCombinedController;
    v5 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v8, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, &stru_1E37AB0D0, 0, 0, 1);
  }
  -[OBWelcomeController setTemplateType:](v5, "setTemplateType:", 1);
  +[OBCapabilities sharedCapabilities](OBCapabilities, "sharedCapabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyCombinedController setAllowsOpeningSafari:](v5, "setAllowsOpeningSafari:", objc_msgSend(v6, "preventOpeningSafari") ^ 1);

  return &v5->super;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBPrivacyCombinedController;
  -[OBWelcomeController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (-[OBPrivacyCombinedController isMovingToParentViewController](self, "isMovingToParentViewController"))
  {
    +[OBAnalyticsManager sharedManager](OBAnalyticsManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logPresentationOfPrivacyUnifiedAbout");

  }
}

+ (void)presentPrivacyCombinedControllerOverController:(id)a3 dismissHandler:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[OBPrivacyPresenter presenterForPrivacyUnifiedAbout](OBPrivacyPresenter, "presenterForPrivacyUnifiedAbout");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDismissHandler:", v5);

  objc_msgSend(v7, "setPresentingViewController:", v6);
  objc_msgSend(v7, "setModalPresentationStyle:", 0);
  objc_msgSend(v7, "present");

}

- (UIColor)customTintColor
{
  return self->_customTintColor;
}

- (void)setCustomTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_customTintColor, a3);
}

- (BOOL)underlineLinks
{
  return self->_underlineLinks;
}

- (void)setUnderlineLinks:(BOOL)a3
{
  self->_underlineLinks = a3;
}

- (BOOL)allowsOpeningSafari
{
  return self->_allowsOpeningSafari;
}

- (void)setAllowsOpeningSafari:(BOOL)a3
{
  self->_allowsOpeningSafari = a3;
}

- (NSString)displayLanguage
{
  return (NSString *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setDisplayLanguage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1240);
}

- (BOOL)presentedFromPrivacyPane
{
  return self->_presentedFromPrivacyPane;
}

- (void)setPresentedFromPrivacyPane:(BOOL)a3
{
  self->_presentedFromPrivacyPane = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLanguage, 0);
  objc_storeStrong((id *)&self->_customTintColor, 0);
}

void __50__OBPrivacyCombinedController_iOS_viewWillAppear___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deselectRowAtIndexPath:animated:", *(_QWORD *)(a1 + 40), 1);

}

void __50__OBPrivacyCombinedController_iOS_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  if (objc_msgSend(a2, "isCancelled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectRowAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 0, 0);

  }
}

@end

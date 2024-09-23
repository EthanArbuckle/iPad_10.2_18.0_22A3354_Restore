@implementation SBSUIRemoteAlertItemContentViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSUIRemoteAlertItemContentViewController;
  -[SBSUIRemoteAlertItemContentViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[SBSUIRemoteAlertItemContentViewController invalidatePreferredContentSize](self, "invalidatePreferredContentSize");
}

- (void)invalidatePreferredContentSize
{
  id v3;

  -[SBSUIRemoteAlertItemContentViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSUIRemoteAlertItemContentViewController preferredContentSize](self, "preferredContentSize");
  objc_msgSend(v3, "setPreferredContentSize:");

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSUIRemoteAlertItemContentViewController;
  -[SBSUIRemoteAlertItemContentViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SBSUIRemoteAlertItemContentViewController invalidatePreferredContentSize](self, "invalidatePreferredContentSize");
}

- (void)getPreferredContentSizeWithReplyBlock:(id)a3
{
  id v5;

  if (a3)
  {
    v5 = a3;
    -[SBSUIRemoteAlertItemContentViewController preferredContentSize](self, "preferredContentSize");
    (*((void (**)(id))a3 + 2))(v5);

  }
}

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7D2BE8);
}

+ (id)_exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7B6A18);
}

@end

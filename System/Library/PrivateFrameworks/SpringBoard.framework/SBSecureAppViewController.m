@implementation SBSecureAppViewController

- (BOOL)handleEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 13)
  {
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      -[SBDashBoardHostedAppViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "secureAppViewControllerDidAuthenticate:", self);

    }
  }
  v10.receiver = self;
  v10.super_class = (Class)SBSecureAppViewController;
  v8 = -[SBDashBoardHostedAppViewController handleEvent:](&v10, sel_handleEvent_, v4);

  return v8;
}

- (void)_updateDisplayLayoutElementForActivation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSecureAppViewController;
  v3 = a3;
  -[SBDashBoardHostedAppViewController _updateDisplayLayoutElementForActivation:](&v7, sel__updateDisplayLayoutElementForActivation_, v3);
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance", v7.receiver, v7.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coverSheetWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "level");
  objc_msgSend(v3, "setLevel:", (uint64_t)v6);

}

@end

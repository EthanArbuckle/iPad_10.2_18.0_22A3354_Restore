@implementation SBDashBoardViewExternalControllerBase

- (id)coverSheetViewController
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardViewExternalControllerBase;
  -[CSCoverSheetExternalViewControllerBase coverSheetViewController](&v5, sel_coverSheetViewController);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "coverSheetViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

@end

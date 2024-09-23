@implementation SBLockScreenTemperatureWarningViewController

- (SBLockScreenTemperatureWarningViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBLockScreenTemperatureWarningViewController;
  return -[SBLockScreenTemperatureWarningViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
}

- (void)loadView
{
  SBLockScreenTemperatureWarningView *warningView;
  SBLockScreenTemperatureWarningView *v4;
  void *v5;
  SBLockScreenTemperatureWarningView *v6;
  SBLockScreenTemperatureWarningView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  warningView = self->_warningView;
  if (!warningView)
  {
    v4 = [SBLockScreenTemperatureWarningView alloc];
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = -[SBLockScreenTemperatureWarningView initWithFrame:](v4, "initWithFrame:");
    v7 = self->_warningView;
    self->_warningView = v6;

    -[SBUILockOverlayView titleLabel](self->_warningView, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("IPHONE_TOO_HOT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v10);

    -[SBUILockOverlayView subtitleLabel](self->_warningView, "subtitleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("THERMAL_ALERT_STRING"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v14);

    warningView = self->_warningView;
  }
  -[SBLockScreenTemperatureWarningViewController setView:](self, "setView:", warningView);
}

- (NSString)slideToUnlockText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AWAY_LOCK_EMERGENCY_LABEL"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warningView, 0);
}

@end

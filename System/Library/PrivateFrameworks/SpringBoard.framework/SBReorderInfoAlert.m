@implementation SBReorderInfoAlert

- (SBReorderInfoAlert)init
{
  SBReorderInfoAlert *v2;
  void *v3;
  uint64_t v4;
  NSString *title;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  NSString *body;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBReorderInfoAlert;
  v2 = -[SBAlertItem init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("REORDER_INFO_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v4 = objc_claimAutoreleasedReturnValue();
    title = v2->super.super._title;
    v2->super.super._title = (NSString *)v4;

    v6 = SBFEffectiveHomeButtonType();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 == 2)
    {
      v9 = CFSTR("REORDER_INFO_BODY_NO_HOME_BUTTON");
      v10 = CFSTR("Late_Fall_2017_iOS_Strings");
    }
    else
    {
      v9 = CFSTR("REORDER_INFO_BODY");
      v10 = CFSTR("SpringBoard");
    }
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E8EC7EC0, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    body = v2->super.super._body;
    v2->super.super._body = (NSString *)v11;

  }
  return v2;
}

- (void)didDeactivateForReason:(int)a3
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBReorderInfoAlert;
  -[SBAlertItem didDeactivateForReason:](&v5, sel_didDeactivateForReason_);
  if (SBAlertItemIsUserDeactivate())
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "iconDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDidShowIconReorderAlert:", 1);

  }
}

@end

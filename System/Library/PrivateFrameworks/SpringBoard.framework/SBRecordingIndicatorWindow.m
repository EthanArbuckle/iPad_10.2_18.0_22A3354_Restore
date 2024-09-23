@implementation SBRecordingIndicatorWindow

- (SBRecordingIndicatorWindow)initWithWindowScene:(id)a3 debugName:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBRecordingIndicatorWindow *v13;
  objc_super v15;

  v6 = (void *)MEMORY[0x1E0CEA950];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "displayIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@"), v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15.receiver = self;
  v15.super_class = (Class)SBRecordingIndicatorWindow;
  v13 = -[SBWindow initWithWindowScene:rootViewController:layoutStrategy:role:debugName:](&v15, sel_initWithWindowScene_rootViewController_layoutStrategy_role_debugName_, v8, 0, 0, CFSTR("SBTraitsParticipantRoleRecordingIndicator"), v12);

  return v13;
}

- (BOOL)isActive
{
  return 0;
}

@end

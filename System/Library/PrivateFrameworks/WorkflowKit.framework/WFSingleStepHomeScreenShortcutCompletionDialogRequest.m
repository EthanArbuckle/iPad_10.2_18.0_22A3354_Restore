@implementation WFSingleStepHomeScreenShortcutCompletionDialogRequest

- (WFSingleStepHomeScreenShortcutCompletionDialogRequest)initWithShortcutName:(id)a3 applicationBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  WFSingleStepHomeScreenShortcutCompletionDialogRequest *v16;
  WFSingleStepHomeScreenShortcutCompletionDialogRequest *v17;
  WFSingleStepHomeScreenShortcutCompletionDialogRequest *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasSystemAperture");

  if ((v9 & 1) != 0 || !objc_msgSend(v6, "length"))
  {
    if (objc_msgSend(v6, "length"))
    {
      v13 = v6;
    }
    else
    {
      WFLocalizedString(CFSTR("Shortcuts"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v13;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("%@ │ Shortcuts"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7978]), "initWithBundleIdentifier:", v7);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AD0]), "initWithTitle:icon:", v12, v14);
  v20.receiver = self;
  v20.super_class = (Class)WFSingleStepHomeScreenShortcutCompletionDialogRequest;
  v16 = -[WFDialogRequest initWithAttribution:prompt:](&v20, sel_initWithAttribution_prompt_, v15, 0);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_applicationBundleIdentifier, a4);
    v17->_requiresRunningShortcut = 0;
    v18 = v17;
  }

  return v17;
}

- (BOOL)requiresRunningShortcut
{
  return 0;
}

- (void)setRequiresRunningShortcut:(BOOL)a3
{
  self->_requiresRunningShortcut = a3;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

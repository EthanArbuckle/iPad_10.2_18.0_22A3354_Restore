@implementation VCSleepOpenAppAction

- (VCSleepOpenAppAction)initWithBundleIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  VCSleepOpenAppAction *v18;
  VCSleepOpenAppAction *v19;
  VCSleepOpenAppAction *v20;
  void *v22;
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCSleepOpenAppAction.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 1, 0);
  v7 = v6;
  if (v6
    && (objc_msgSend(v6, "applicationState"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isInstalled"),
        v8,
        v9))
  {
    objc_msgSend(v7, "localizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("Open %@"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithApplicationRecord:", v7);
    v24[0] = CFSTR("WFAppName");
    v24[1] = CFSTR("WFSelectedApp");
    v25[0] = v10;
    objc_msgSend(v14, "serializedRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[VCSleepAction identifierForWorkflowActionIdentifier:serializedParameters:](VCSleepAction, "identifierForWorkflowActionIdentifier:serializedParameters:", CFSTR("is.workflow.actions.openapp"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23.receiver = self;
    v23.super_class = (Class)VCSleepOpenAppAction;
    v18 = -[VCSleepAction initWithIdentifier:workflowActionIdentifier:sourceAppBundleIdentifier:bundleIdentifierForDisplay:title:subtitle:serializedParameters:shortcutAvailability:](&v23, sel_initWithIdentifier_workflowActionIdentifier_sourceAppBundleIdentifier_bundleIdentifierForDisplay_title_subtitle_serializedParameters_shortcutAvailability_, v17, CFSTR("is.workflow.actions.openapp"), v5, v5, v13, 0, v16, 0);
    self = v18;
    if (v18)
      v19 = v18;

    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end

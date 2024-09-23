@implementation VCSleepHomeAccessoryAction

- (VCSleepHomeAccessoryAction)initWithTriggerActionSetsBuilder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  VCSleepHomeAccessoryAction *v19;
  VCSleepHomeAccessoryAction *v20;
  VCSleepHomeAccessoryAction *v21;
  void *v23;
  void *v24;
  objc_super v25;
  const __CFString *v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCSleepHomeAccessoryAction.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerActionSetsBuilder"));

  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Set %@"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionSetsSummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "summaryText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allActionSets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "if_map:", &__block_literal_global_9096);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = CFSTR("WFHFTriggerActionSetsBuilderParameterStateActionSets");
  v28[1] = CFSTR("WFHFTriggerActionSetsBuilderParameterStateHome");
  v29[0] = v12;
  objc_msgSend(v10, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = CFSTR("WFHomeTriggerActionSets");
  v27 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCSleepAction identifierForWorkflowActionIdentifier:serializedParameters:](VCSleepAction, "identifierForWorkflowActionIdentifier:serializedParameters:", CFSTR("is.workflow.actions.homeaccessory"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)VCSleepHomeAccessoryAction;
  v19 = -[VCSleepAction initWithIdentifier:workflowActionIdentifier:sourceAppBundleIdentifier:bundleIdentifierForDisplay:title:subtitle:serializedParameters:shortcutAvailability:](&v25, sel_initWithIdentifier_workflowActionIdentifier_sourceAppBundleIdentifier_bundleIdentifierForDisplay_title_subtitle_serializedParameters_shortcutAvailability_, v17, CFSTR("is.workflow.actions.homeaccessory"), CFSTR("com.apple.Home"), CFSTR("com.apple.Home"), v24, v18, v16, 0);
  v20 = v19;
  if (v19)
    v21 = v19;

  return v20;
}

uint64_t __63__VCSleepHomeAccessoryAction_initWithTriggerActionSetsBuilder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortcutsDictionaryRepresentation");
}

@end

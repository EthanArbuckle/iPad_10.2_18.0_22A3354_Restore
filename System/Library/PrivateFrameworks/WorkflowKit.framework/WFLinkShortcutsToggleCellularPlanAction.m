@implementation WFLinkShortcutsToggleCellularPlanAction

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D13EE0];
  v5 = a3;
  objc_msgSend(v4, "toggleLineLocation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a5;
  WFLocalizedString(CFSTR("Allow “%1$@” to toggle a cellular plan?"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)smartPromptSubtitleWithPreviousContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  return WFLocalizedString(CFSTR("Toggling the status of a cellular plan may lead to unexpected charges."));
}

@end

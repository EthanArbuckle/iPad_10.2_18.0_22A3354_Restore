@implementation UIColor(WorkflowEditor)

+ (id)wf_workflowEditorColorNamed:()WorkflowEditor
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorNamed:inBundle:compatibleWithTraitCollection:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)wf_actionDrawerBackgroundColor
{
  return objc_msgSend(a1, "wf_workflowEditorColorNamed:", CFSTR("ActionDrawerBackground"));
}

+ (uint64_t)wf_actionDrawerSuggestionImageBackgroundColor
{
  return objc_msgSend(a1, "wf_workflowEditorColorNamed:", CFSTR("ActionDrawerSuggestionImageBackground"));
}

+ (id)wf_moduleBorderColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEBD4B8], "linkColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)wf_moduleCellColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemGroupedBackgroundColor");
}

+ (uint64_t)wf_moduleCellHighlightedColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellDefaultSelectionTintColor");
}

+ (uint64_t)wf_modulesViewBodyButtonBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "wf_workflowEditorColorNamed:", CFSTR("EditorBodyButtonBackground"));
}

+ (uint64_t)wf_moduleCellShadowColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "wf_workflowEditorColorNamed:", CFSTR("ActionShadow"));
}

+ (uint64_t)wf_moduleCellRunningShadowColor
{
  return objc_msgSend(a1, "colorWithDynamicProvider:", &__block_literal_global_6367);
}

+ (uint64_t)wf_moduleCellRunningColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "wf_workflowEditorColorNamed:", CFSTR("ProgressBackground"));
}

+ (uint64_t)wf_moduleCellBorderColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
}

+ (uint64_t)wf_moduleCellTitleColor
{
  return objc_msgSend(a1, "colorWithDynamicProvider:", &__block_literal_global_123);
}

+ (uint64_t)wf_moduleCommentCellColor
{
  return objc_msgSend(a1, "colorWithDynamicProvider:", &__block_literal_global_124);
}

+ (uint64_t)wf_moduleCommentParametersSeparatorColor
{
  return objc_msgSend(a1, "colorWithDynamicProvider:", &__block_literal_global_125);
}

+ (uint64_t)wf_moduleCommentParametersBackgroundColor
{
  return objc_msgSend(a1, "colorWithDynamicProvider:", &__block_literal_global_126);
}

+ (uint64_t)wf_moduleCommentHeadingButtonColor
{
  return objc_msgSend(a1, "colorWithDynamicProvider:", &__block_literal_global_127);
}

+ (uint64_t)wf_moduleConnectionColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "wf_workflowEditorColorNamed:", CFSTR("Connector"));
}

+ (uint64_t)wf_galleryModuleConnectionColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.811764717, 1.0);
}

+ (uint64_t)wf_moduleHeadingButtonColor
{
  return objc_msgSend(a1, "colorWithDynamicProvider:", &__block_literal_global_130);
}

+ (uint64_t)wf_moduleSeparatorColor
{
  return objc_msgSend(a1, "colorWithDynamicProvider:", &__block_literal_global_131);
}

+ (uint64_t)wf_moduleWarningBackgroundColor
{
  return objc_msgSend(a1, "colorWithDynamicProvider:", &__block_literal_global_132);
}

+ (uint64_t)wf_moduleWarningTitleColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
}

@end

@implementation WFWorkflowIconDrawer(HomeScreenIcon)

- (void)initWithHomeScreenIcon:()HomeScreenIcon
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFWorkflowIconDrawer+HomeScreenIcon.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("icon"));

  }
  objc_msgSend(v5, "workflowIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(a1, "initWithIcon:", v6);

  if (v7)
  {
    objc_msgSend(v5, "customImageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "setCustomImageData:", v8);
      objc_msgSend(v7, "setUseCustomImage:", 1);
    }
    v9 = v7;

  }
  return v7;
}

@end

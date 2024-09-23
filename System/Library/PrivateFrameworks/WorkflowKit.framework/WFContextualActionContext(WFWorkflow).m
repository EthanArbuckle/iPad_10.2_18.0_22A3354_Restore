@implementation WFContextualActionContext(WFWorkflow)

+ (id)contextForEditingWorkflow:()WFWorkflow inSurface:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContextualActionContext+WFWorkflow.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflow"));

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7A58]), "initWithSurface:", a4);
  objc_msgSend(v7, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", CFSTR("identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHistoricalActionIdentifiers:", v10);

  return v8;
}

@end

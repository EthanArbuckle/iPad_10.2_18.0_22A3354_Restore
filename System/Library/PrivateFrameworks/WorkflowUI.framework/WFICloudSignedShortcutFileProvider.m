@implementation WFICloudSignedShortcutFileProvider

- (WFICloudSignedShortcutFileProvider)initWithWorkflow:(id)a3 userInterface:(id)a4
{
  id v6;
  WFICloudSignedShortcutFileProvider *v7;
  id v8;
  void *v9;
  void *v10;
  WFICloudSignedShortcutFileProvider *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFICloudSignedShortcutFileProvider;
  v7 = -[WFSignedShortcutFileProvider initWithWorkflow:userInterface:](&v13, sel_initWithWorkflow_userInterface_, v6, a4);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BEC4200]);
    v9 = (void *)objc_opt_new();
    v10 = (void *)objc_msgSend(v8, "initWithWorkflow:sharingOptions:", v6, v9);
    -[WFWorkflowItemProvider setShortcutExporter:](v7, "setShortcutExporter:", v10);

    v11 = v7;
  }

  return v7;
}

- (id)shareShortcutEventForActivityType:(id)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFICloudSignedShortcutFileProvider;
  -[WFWorkflowItemProvider shareShortcutEventForActivityType:](&v5, sel_shareShortcutEventForActivityType_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSharingMode:", *MEMORY[0x24BEC4688]);
  return v3;
}

@end

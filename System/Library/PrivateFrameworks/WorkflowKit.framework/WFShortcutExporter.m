@implementation WFShortcutExporter

- (WFShortcutExporter)initWithWorkflow:(id)a3 sharingOptions:(id)a4
{
  void *v5;
  WFShortcutExporter *v6;

  objc_msgSend(a3, "prepareForSharingWithOptions:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFShortcutExporter initWithWorkflowRecord:](self, "initWithWorkflowRecord:", v5);

  return v6;
}

- (WFShortcutExporter)initWithWorkflowRecord:(id)a3
{
  id v5;
  WFShortcutExporter *v6;
  WFShortcutExporter *v7;
  WFShortcutExporter *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFShortcutExporter;
  v6 = -[WFShortcutExporter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workflowRecord, a3);
    v8 = v7;
  }

  return v7;
}

- (WFWorkflowRecord)workflowRecord
{
  return self->_workflowRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowRecord, 0);
}

@end

@implementation WFSwitchParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v5 = objc_alloc(MEMORY[0x24BEC3B18]);
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[WFModuleSummaryEditor initialState](self, "initialState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "number");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(v8, "BOOLValue") ^ 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithNumber:", v9);

  -[WFModuleSummaryEditor stageState:](self, "stageState:", v10);
  v11 = dispatch_time(0, 50000000);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __84__WFSwitchParameterSummaryEditor_beginEditingSlotWithIdentifier_presentationAnchor___block_invoke;
  v13[3] = &unk_24EE252E0;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  dispatch_after(v11, MEMORY[0x24BDAC9B8], v13);

}

uint64_t __84__WFSwitchParameterSummaryEditor_beginEditingSlotWithIdentifier_presentationAnchor___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "commitState:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "completeEditing");
}

@end

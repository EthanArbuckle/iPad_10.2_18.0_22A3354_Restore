@implementation WFStandaloneModuleSummaryPresenter

- (WFStandaloneModuleSummaryPresenter)initWithParameter:(id)a3 slotIdentifier:(id)a4 initialState:(id)a5 isProcessing:(BOOL)a6 variableProvider:(id)a7 variableUIDelegate:(id)a8 presentationAnchor:(id)a9 allowsPickingVariables:(BOOL)a10
{
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  WFStandaloneModuleSummaryPresenter *v20;
  objc_class *v21;
  objc_class *v22;
  void *v23;
  WFStandaloneModuleSummaryPresenter *v24;
  id v26;
  id v27;
  objc_super v28;

  v12 = a6;
  v16 = a3;
  v27 = a4;
  v26 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v28.receiver = self;
  v28.super_class = (Class)WFStandaloneModuleSummaryPresenter;
  v20 = -[WFStandaloneModuleSummaryPresenter init](&v28, sel_init);
  if (v20 && (v21 = (objc_class *)objc_opt_class(), (v22 = WFModuleSummaryEditorClassForParameterClass(v21)) != 0))
  {
    v23 = (void *)objc_msgSend([v22 alloc], "initWithParameter:arrayIndex:processing:", v16, 0x7FFFFFFFFFFFFFFFLL, v12);
    objc_msgSend(v23, "setDelegate:", v20);
    objc_msgSend(v23, "setVariableProvider:", v17);
    objc_msgSend(v23, "setVariableUIDelegate:", v18);
    objc_msgSend(v23, "setAllowsPickingVariables:", a10);
    -[WFStandaloneModuleSummaryPresenter setEditor:](v20, "setEditor:", v23);
    objc_storeStrong((id *)&v20->_initialState, a5);
    objc_storeStrong((id *)&v20->_slotIdentifier, a4);
    objc_storeStrong((id *)&v20->_presentationAnchor, a9);
    v24 = v20;

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)present
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFStandaloneModuleSummaryPresenter presentationAnchor](self, "presentationAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFStandaloneModuleSummaryPresenter editor](self, "editor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFStandaloneModuleSummaryPresenter slotIdentifier](self, "slotIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFStandaloneModuleSummaryPresenter presentationAnchor](self, "presentationAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginEditingSlotWithIdentifier:presentationAnchor:", v5, v6);

    -[WFStandaloneModuleSummaryPresenter retainDelegate](self, "retainDelegate");
  }
}

- (void)dismiss
{
  void *v3;

  -[WFStandaloneModuleSummaryPresenter editor](self, "editor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelEditingWithCompletionHandler:", &__block_literal_global_1903);

  -[WFStandaloneModuleSummaryPresenter setEditor:](self, "setEditor:", 0);
  -[WFStandaloneModuleSummaryPresenter releaseDelegate](self, "releaseDelegate");
}

- (id)menu
{
  void *v3;
  void *v4;
  void *v5;

  -[WFStandaloneModuleSummaryPresenter editor](self, "editor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStandaloneModuleSummaryPresenter slotIdentifier](self, "slotIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "menuForSlotWithIdentifier:style:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[WFStandaloneModuleSummaryPresenter retainDelegate](self, "retainDelegate");
  return v5;
}

- (void)retainDelegate
{
  id v3;

  -[WFStandaloneModuleSummaryPresenter delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WFStandaloneModuleSummaryPresenter setRetainedDelegate:](self, "setRetainedDelegate:", v3);

}

- (void)releaseDelegate
{
  -[WFStandaloneModuleSummaryPresenter setRetainedDelegate:](self, "setRetainedDelegate:", 0);
}

- (void)summaryEditor:(id)a3 didStageParameterState:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[WFStandaloneModuleSummaryPresenter delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFStandaloneModuleSummaryPresenter delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "moduleSummaryPresenter:didStageParameterState:", self, v8);

  }
}

- (void)summaryEditor:(id)a3 didCommitParameterState:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[WFStandaloneModuleSummaryPresenter delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "moduleSummaryPresenter:didCommitParameterState:", self, v5);

}

- (void)summaryEditorDidFinish:(id)a3 returnToKeyboard:(BOOL)a4 withTextAttachmentToEdit:(id)a5
{
  void *v6;

  -[WFStandaloneModuleSummaryPresenter setEditor:](self, "setEditor:", 0, a4, a5);
  -[WFStandaloneModuleSummaryPresenter delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "moduleSummaryPresenterDidFinish:", self);

  -[WFStandaloneModuleSummaryPresenter releaseDelegate](self, "releaseDelegate");
}

- (void)summaryEditorDidRequestTextEntry:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  getWFGeneralLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = 136315138;
    v5 = "-[WFStandaloneModuleSummaryPresenter summaryEditorDidRequestTextEntry:]";
    _os_log_impl(&dword_226666000, v3, OS_LOG_TYPE_FAULT, "%s Text entry isn't supported in old-UI parameters represented as buttons", (uint8_t *)&v4, 0xCu);
  }

}

- (WFStandaloneModuleSummaryPresenterDelegate)delegate
{
  return (WFStandaloneModuleSummaryPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFModuleSummaryEditor)editor
{
  return self->_editor;
}

- (void)setEditor:(id)a3
{
  objc_storeStrong((id *)&self->_editor, a3);
}

- (WFParameterState)initialState
{
  return self->_initialState;
}

- (WFSlotIdentifier)slotIdentifier
{
  return self->_slotIdentifier;
}

- (WFModalPresentationAnchor)presentationAnchor
{
  return self->_presentationAnchor;
}

- (void)setPresentationAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_presentationAnchor, a3);
}

- (WFStandaloneModuleSummaryPresenterDelegate)retainedDelegate
{
  return self->_retainedDelegate;
}

- (void)setRetainedDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_retainedDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedDelegate, 0);
  objc_storeStrong((id *)&self->_presentationAnchor, 0);
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
  objc_storeStrong((id *)&self->_initialState, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

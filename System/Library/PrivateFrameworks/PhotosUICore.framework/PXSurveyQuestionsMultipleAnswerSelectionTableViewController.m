@implementation PXSurveyQuestionsMultipleAnswerSelectionTableViewController

- (PXSurveyQuestionsMultipleAnswerSelectionTableViewController)initWithTitle:(id)a3 message:(id)a4 reasons:(id)a5 currentlySelectedReasons:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PXSurveyQuestionsMultipleAnswerSelectionTableViewController *v17;
  void *v18;
  id completionBlock;
  void *v20;
  PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *dataSource;
  PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)PXSurveyQuestionsMultipleAnswerSelectionTableViewController;
  v17 = -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController initWithStyle:](&v32, sel_initWithStyle_, 0);
  if (v17)
  {
    v18 = _Block_copy(v16);
    completionBlock = v17->_completionBlock;
    v17->_completionBlock = v18;

    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController tableView](v17, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAllowsMultipleSelection:", 1);

    v21 = [PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource alloc];
    v22 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(","));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithArray:", v23);
    v25 = -[PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource initWithReasons:currentlySelected:](v21, "initWithReasons:currentlySelected:", v14, v24);
    dataSource = v17->_dataSource;
    v17->_dataSource = (PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)v25;

    v27 = v17->_dataSource;
    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController tableView](v17, "tableView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDataSource:", v27);

    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController _setupNavigationBar:message:](v17, "_setupNavigationBar:message:", v12, v13);
    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController doneButton](v17, "doneButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController dataSource](v17, "dataSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setEnabled:", objc_msgSend(v30, "selectedReasonsCount") != 0);

  }
  return v17;
}

- (void)_setupNavigationBar:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v7);

  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrompt:", v6);

  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController cancelButton](self, "cancelButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLeftBarButtonItem:", v10);

  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController doneButton](self, "doneButton");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRightBarButtonItem:", v13);

}

- (void)viewDidDisappear:(BOOL)a3
{
  PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *dataSource;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSurveyQuestionsMultipleAnswerSelectionTableViewController;
  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  dataSource = self->_dataSource;
  self->_dataSource = 0;

}

- (UIBarButtonItem)cancelButton
{
  UIBarButtonItem *cancelButton;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  cancelButton = self->_cancelButton;
  if (!cancelButton)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__handleCancel);
    v5 = self->_cancelButton;
    self->_cancelButton = v4;

    cancelButton = self->_cancelButton;
  }
  return cancelButton;
}

- (UIBarButtonItem)doneButton
{
  UIBarButtonItem *doneButton;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  doneButton = self->_doneButton;
  if (!doneButton)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__handleDone);
    v5 = self->_doneButton;
    self->_doneButton = v4;

    doneButton = self->_doneButton;
  }
  return doneButton;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v6 = a3;
  objc_msgSend(v6, "cellForRowAtIndexPath:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "accessoryType") == 3)
  {
    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v16, 1);

    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController tableView:didDeselectRowAtIndexPath:](self, "tableView:didDeselectRowAtIndexPath:", v9, v16);

    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deselect:", v12);

  }
  else
  {
    objc_msgSend(v7, "setAccessoryType:", 3);
    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "select:", v15);

    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController doneButton](self, "doneButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", 1);
  }

  objc_msgSend(v6, "reloadData");
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "cellForRowAtIndexPath:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessoryType:", 0);
  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deselect:", v9);

  objc_msgSend(v13, "indexPathsForSelectedRows");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController doneButton](self, "doneButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEnabled:", 0);

  }
  objc_msgSend(v13, "reloadData");

}

- (void)_handleCancel
{
  void (**v3)(_QWORD, _QWORD, _QWORD);

  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController completionBlock](self, "completionBlock");
  v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, 0, 0);

  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_handleDone
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedReasons");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController completionBlock](self, "completionBlock");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, uint64_t))v5)[2](v5, v4, 1);

  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end

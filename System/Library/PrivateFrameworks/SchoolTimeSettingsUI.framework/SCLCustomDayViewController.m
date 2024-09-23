@implementation SCLCustomDayViewController

- (SCLCustomDayViewController)initWithViewModel:(id)a3 title:(id)a4
{
  id v7;
  id v8;
  SCLCustomDayViewController *v9;
  SCLCustomDayViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCLCustomDayViewController;
  v9 = -[SCLListViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    -[SCLListViewController setWantsEditingMode:](v10, "setWantsEditingMode:", 1);
    -[SCLCustomDayViewController setTitle:](v10, "setTitle:", v8);
  }

  return v10;
}

- (void)loadSpecifierSource
{
  void *v3;
  SCLCustomDayEditorSource *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SCLCustomDayEditorSource *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  -[SCLCustomDayViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repeatSchedule");
  SCLEnumerateDaysInRepeatSchedule();

  v4 = [SCLCustomDayEditorSource alloc];
  -[SCLCustomDayViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10[3];
  -[SCLCustomDayViewController title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SCLCustomDayEditorSource initWithListController:viewModel:day:title:](v4, "initWithListController:viewModel:day:title:", self, v5, v6, v7);

  -[SCLSpecifierDataSource setActive:](v8, "setActive:", 1);
  -[SCLListViewController setSpecifierSource:](self, "setSpecifierSource:", v8);

  _Block_object_dispose(&v9, 8);
}

uint64_t __49__SCLCustomDayViewController_loadSpecifierSource__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)willMoveToParentViewController:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCLCustomDayViewController;
  -[SCLCustomDayViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_);
  if (!a3)
  {
    -[SCLCustomDayViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "customDayViewControllerWillDismiss:", self);

  }
}

- (SCLSettingsViewModel)viewModel
{
  return self->_viewModel;
}

- (SCLCustomDayViewControllerDelegate)delegate
{
  return (SCLCustomDayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end

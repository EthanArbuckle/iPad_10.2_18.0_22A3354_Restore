@implementation PKEditGroupViewController

- (PKEditGroupViewController)initWithGroup:(id)a3 existingGroupsController:(id)a4 style:(int64_t)a5 placeholders:(id)a6 isForWatch:(BOOL)a7 delegate:(id)a8
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  PKEditGroupViewController *v19;
  PKEditGroupViewController *v20;
  PKPass *viewingPass;
  CGFloat v22;
  CGFloat v23;
  objc_super v25;

  v9 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PKEditGroupViewController;
  v19 = -[PKEditTableViewController initWithStyle:placeholders:isForWatch:](&v25, sel_initWithStyle_placeholders_isForWatch_, 0, v17, v9);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_group, a3);
    v20->_isForWatch = v9;
    -[PKEditTableViewController setExistingGroupsController:](v20, "setExistingGroupsController:", v16);
    -[PKEditTableViewController setPlaceholders:](v20, "setPlaceholders:", v17);
    -[PKGroup addGroupObserver:](v20->_group, "addGroupObserver:", v20);
    viewingPass = v20->_viewingPass;
    v20->_viewingPass = 0;

    +[PKEditPassesTableViewCell imageSizeNeeded](PKEditPassesTableViewCell, "imageSizeNeeded");
    v20->_imageSizeNeeded.width = v22;
    v20->_imageSizeNeeded.height = v23;
    v20->_editStyle = a5;
    objc_storeWeak((id *)&v20->_delegate, v18);
  }

  return v20;
}

- (void)dealloc
{
  objc_super v3;

  -[PKGroup removeGroupObserver:](self->_group, "removeGroupObserver:", self);
  -[PKEditGroupViewController setToolbarItems:](self, "setToolbarItems:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PKEditGroupViewController;
  -[PKEditGroupViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  UITableView *v3;
  UITableView *tableView;
  UITableView *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  BOOL v13;
  unint64_t v14;
  void *v15;
  id v16;
  void *v17;
  UIBarButtonItem *v18;
  UIBarButtonItem *deleteToolbarItem;
  UIBarButtonItem *v20;
  void *v21;
  UIBarButtonItem *v22;
  UIBarButtonItem *flexibleSpace;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  _QWORD v27[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)PKEditGroupViewController;
  -[PKEditTableViewController viewDidLoad](&v32, sel_viewDidLoad);
  -[PKEditGroupViewController tableView](self, "tableView");
  v3 = (UITableView *)objc_claimAutoreleasedReturnValue();
  tableView = self->_tableView;
  self->_tableView = v3;

  v5 = self->_tableView;
  +[PKEditPassesTableViewCell separatorInset](PKEditPassesTableViewCell, "separatorInset");
  -[UITableView setSeparatorInset:](v5, "setSeparatorInset:");
  -[PKGroup passes](self->_group, "passes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v26, "count");
  v7 = -[PKEditTableViewController visibleRowsCount](self, "visibleRowsCount");
  v24 = v7;
  v25 = v6;
  if (v7 >= v6)
    v8 = v6;
  else
    v8 = v7;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  if (v8)
  {
    v9 = 0;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      objc_msgSend(v26, "objectAtIndex:", v9, v24, v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v10;
      v27[1] = 3221225472;
      v27[2] = __40__PKEditGroupViewController_viewDidLoad__block_invoke;
      v27[3] = &unk_1E3E6ECF0;
      v27[5] = v8;
      v27[6] = v9;
      v27[4] = &v28;
      -[PKEditTableViewController imageForPass:stacked:synchronously:placeholder:completion:](self, "imageForPass:stacked:synchronously:placeholder:completion:", v11, 0, 1, 0, v27);
      v12 = *((unsigned __int8 *)v29 + 24);

      if (v12)
        v13 = 1;
      else
        v13 = v8 - 1 == v9;
      ++v9;
    }
    while (!v13);
  }
  if (v24 < v25)
  {
    if (6 * v24 >= v25 - 1)
      v14 = v25 - 1;
    else
      v14 = 6 * v24;
    while (v14 > v8)
    {
      objc_msgSend(v26, "objectAtIndex:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKEditTableViewController preemptivelyCacheImagesForPass:stacked:](self, "preemptivelyCacheImagesForPass:stacked:", v15, 0);

      --v14;
    }
  }
  if (!self->_editStyle)
  {
    v16 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedString(CFSTR("PASS_EDITING_DELETE_ALL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (UIBarButtonItem *)objc_msgSend(v16, "initWithTitle:style:target:action:", v17, 0, self, sel__deleteButtonPressed);
    deleteToolbarItem = self->_deleteToolbarItem;
    self->_deleteToolbarItem = v18;

    v20 = self->_deleteToolbarItem;
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTintColor:](v20, "setTintColor:", v21);

    v22 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    flexibleSpace = self->_flexibleSpace;
    self->_flexibleSpace = v22;

  }
  _Block_object_dispose(&v28, 8);

}

_QWORD *__40__PKEditGroupViewController_viewDidLoad__block_invoke(_QWORD *result, double a2)
{
  if ((double)(unint64_t)(result[5] - result[6]) * a2 > 0.3)
    *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 1;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  PKPass *viewingPass;
  UIBarButtonItem *deleteToolbarItem;
  void *v9;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PKEditGroupViewController;
  -[PKEditGroupViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[PKEditGroupViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_editStyle == 1)
  {
    PKLocalizedString(CFSTR("PASS_GROUP_EDITING_TITLE_EDITING"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEditGroupViewController setTitle:](self, "setTitle:", v5);
  }
  else
  {
    -[PKEditTableViewController mostRecentPassInGroup:](self, "mostRecentPassInGroup:", self->_group);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEditGroupViewController setTitle:](self, "setTitle:", v6);

  }
  viewingPass = self->_viewingPass;
  self->_viewingPass = 0;

  if (!self->_editStyle)
  {
    deleteToolbarItem = self->_deleteToolbarItem;
    v11[0] = self->_flexibleSpace;
    v11[1] = deleteToolbarItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEditGroupViewController setToolbarItems:](self, "setToolbarItems:", v9);

    objc_msgSend(v4, "setToolbarHidden:animated:", 0, 0);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKEditGroupViewController;
  -[PKEditGroupViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if ((-[PKEditTableViewController performanceTest](self, "performanceTest") | 2) == 3)
  {
    if (-[PKGroup passCount](self->_group, "passCount"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKEditGroupViewController tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", self->_tableView, v4);

    }
  }
}

- (void)_deleteButtonPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  PKLocalizedString(CFSTR("REMOVE_SHEET_CANCEL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedString(CFSTR("PASS_EDITING_DELETE_CONFIRMATION"), CFSTR("%lu"), -[PKGroup passCount](self->_group, "passCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v3, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v6);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PKEditGroupViewController__deleteButtonPressed__block_invoke;
  v8[3] = &unk_1E3E61D68;
  v8[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v4, 2, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v7);

  -[PKEditGroupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

uint64_t __49__PKEditGroupViewController__deleteButtonPressed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteAllPassesInGroup");
}

- (void)_deleteAllPassesInGroup
{
  PKEditGroupViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  UIBarButtonItem *deleteToolbarItem;
  void *v10;
  void *v11;
  id v12;

  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D682F8], 0);
  -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", 0);
  -[UITableView setAllowsSelectionDuringEditing:](self->_tableView, "setAllowsSelectionDuringEditing:", 0);
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "groupViewController:isDeletingGroup:", self, self->_group);

    }
  }
  deleteToolbarItem = self->_deleteToolbarItem;
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTintColor:](deleteToolbarItem, "setTintColor:", v10);

  -[UIBarButtonItem setEnabled:](self->_deleteToolbarItem, "setEnabled:", 0);
  if (self->_isForWatch)
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstanceWithRemoteLibrary");
  else
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PKGroup passes](self->_group, "passes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removePasses:", v11);

}

- (void)group:(id)a3 didUpdatePass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6
{
  UITableView *tableView;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[PKEditTableViewController clearImageCacheForPass:](self, "clearImageCacheForPass:", a4);
  tableView = self->_tableView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](tableView, "reloadRowsAtIndexPaths:withRowAnimation:", v10, 0);

}

- (void)group:(id)a3 didInsertPass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6
{
  UITableView *tableView;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[UITableView beginUpdates](self->_tableView, "beginUpdates", a3, a4, a5);
  tableView = self->_tableView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView insertRowsAtIndexPaths:withRowAnimation:](tableView, "insertRowsAtIndexPaths:withRowAnimation:", v10, 2);

  -[UITableView endUpdates](self->_tableView, "endUpdates");
  if (!a6 && self->_editStyle == 1)
  {
    -[PKGroup passAtIndex:](self->_group, "passAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEditGroupViewController _presentAlertForUpdatedExpressPass:](self, "_presentAlertForUpdatedExpressPass:", v11);

  }
}

- (void)group:(id)a3 didRemovePass:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  UITableView *tableView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[PKEditTableViewController clearImageCacheForPass:](self, "clearImageCacheForPass:", v7);
  -[UITableView beginUpdates](self->_tableView, "beginUpdates");
  tableView = self->_tableView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](tableView, "deleteRowsAtIndexPaths:withRowAnimation:", v10, 2);

  -[UITableView endUpdates](self->_tableView, "endUpdates");
  if (!a5)
  {
    -[PKGroup passAtIndex:](self->_group, "passAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      -[PKEditGroupViewController _presentAlertForUpdatedExpressPass:](self, "_presentAlertForUpdatedExpressPass:", v11);

  }
  objc_msgSend(v7, "uniqueID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass uniqueID](self->_viewingPass, "uniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__PKEditGroupViewController_group_didRemovePass_atIndex___block_invoke;
    v18[3] = &unk_1E3E612E8;
    v18[4] = self;
    objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v18);
    -[PKEditGroupViewController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "popToViewController:animated:", self, 1);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  if (-[PKGroup passCount](self->_group, "passCount") == 1 && self->_editStyle == 1)
  {
    -[PKEditGroupViewController navigationController](self, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

uint64_t __57__PKEditGroupViewController_group_didRemovePass_atIndex___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "performanceTest");
  if (result == 3)
    return objc_msgSend(*(id *)(a1 + 32), "passedTest");
  return result;
}

- (void)group:(id)a3 didMovePassFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  UITableView *tableView;
  void *v9;
  void *v10;

  if (a4 != a5)
  {
    -[UITableView beginUpdates](self->_tableView, "beginUpdates", a3);
    tableView = self->_tableView;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView moveRowAtIndexPath:toIndexPath:](tableView, "moveRowAtIndexPath:toIndexPath:", v9, v10);

    -[UITableView endUpdates](self->_tableView, "endUpdates");
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[PKGroup passCount](self->_group, "passCount", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[PKEditTableViewController tableView:cellWithIdentifier:](self, "tableView:cellWithIdentifier:", a3, CFSTR("cellPassEditIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKGroup passAtIndex:](self->_group, "passAtIndex:", objc_msgSend(v6, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEditGroupViewController configureCell:atIndexPath:withPass:](self, "configureCell:atIndexPath:withPass:", v7, v6, v8);

  return v7;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withPass:(id)a5
{
  id v7;
  id v8;
  int64_t editStyle;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "setPass:", v8);
    -[PKEditTableViewController loadContentAndImageSetFromExistingPassForPass:](self, "loadContentAndImageSetFromExistingPassForPass:", v8);
    editStyle = self->_editStyle;
    objc_msgSend(v7, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (editStyle == 1)
    {
      objc_msgSend(v8, "fieldForKey:", *MEMORY[0x1E0D6ADB0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v12);

      objc_msgSend(v7, "detailTextLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v14);

      objc_msgSend(v7, "setShowsReorderControl:", 1);
      objc_msgSend(v7, "setAccessoryType:", 0);
      objc_msgSend(v7, "setEditingAccessoryType:", 0);
    }
    else
    {
      objc_msgSend(v8, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v15);

      objc_msgSend(v8, "ingestedDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PKRelativeDateStringWithFullDateForUnits();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedString(CFSTR("PASS_EDITING_ADDED_AGO"), CFSTR("%lu%@"), 1, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "detailTextLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pk_uppercaseFirstStringForPreferredLocale");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", v20);

      objc_msgSend(v7, "setShowsReorderControl:", 0);
      objc_msgSend(v7, "setAccessoryType:", 1);
      objc_msgSend(v7, "setEditingAccessoryType:", 1);

    }
    v21 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __64__PKEditGroupViewController_configureCell_atIndexPath_withPass___block_invoke;
    v25[3] = &unk_1E3E61428;
    v26 = v7;
    v27 = v8;
    v22[0] = v21;
    v22[1] = 3221225472;
    v22[2] = __64__PKEditGroupViewController_configureCell_atIndexPath_withPass___block_invoke_2;
    v22[3] = &unk_1E3E6ED18;
    v23 = v26;
    v24 = v27;
    -[PKEditTableViewController imageForPass:stacked:synchronously:placeholder:completion:](self, "imageForPass:stacked:synchronously:placeholder:completion:", v24, 0, 0, v25, v22);

  }
}

uint64_t __64__PKEditGroupViewController_configureCell_atIndexPath_withPass___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:forPass:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __64__PKEditGroupViewController_configureCell_atIndexPath_withPass___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:forPass:", a2, *(_QWORD *)(a1 + 40));
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return self->_editStyle == 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  PKPass *v7;
  PKPass *viewingPass;
  void *v9;
  id v10;

  if (self->_editStyle == 1)
  {
    v6 = a4;
    objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
    -[PKEditGroupViewController viewControllerForRowAtIndexPath:](self, "viewControllerForRowAtIndexPath:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (!self->_viewingPass)
    {
      objc_msgSend(v10, "pass");
      v7 = (PKPass *)objc_claimAutoreleasedReturnValue();
      viewingPass = self->_viewingPass;
      self->_viewingPass = v7;

      -[PKEditGroupViewController navigationController](self, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pushViewController:animated:", v10, 1);

    }
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = *MEMORY[0x1E0D68310];
  v7 = a5;
  MEMORY[0x1A1AE3A74](v6, 0);
  v8 = objc_msgSend(v7, "row");

  -[PKGroup passAtIndex:](self->_group, "passAtIndex:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_isForWatch)
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstanceWithRemoteLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_remoteLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removePass:", v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removePass:", v13);
  }

  -[PKEditTableViewController existingGroupsController](self, "existingGroupsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uniqueID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleUserPassDelete:", v12);

}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[PKEditGroupViewController passAtIndexPath:](self, "passAtIndexPath:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEditTableViewController existingGroupsController](self, "existingGroupsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "suppressRemoteUpdates:", 1);
  objc_msgSend(v9, "movePass:inGroup:toIndex:", v8, self->_group, objc_msgSend(v7, "row"));
  objc_msgSend(v9, "enableRemoteUpdates");
  if (v11 != v7
    && (!objc_msgSend(v7, "row") && self->_editStyle == 1 || !objc_msgSend(v11, "row") && self->_editStyle == 1))
  {
    -[PKGroup passAtIndex:](self->_group, "passAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEditGroupViewController _presentAlertForUpdatedExpressPass:](self, "_presentAlertForUpdatedExpressPass:", v10);

  }
}

- (void)_presentAlertForUpdatedExpressPass:(id)a3
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0C99E08];
    v4 = a3;
    v12 = objc_alloc_init(v3);
    v5 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D6BC20]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D6BC18]);
    objc_msgSend(v4, "fieldForKey:", *MEMORY[0x1E0D6ADB0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(CFSTR("SELECT_EXPRESS_PASS_SUCCESS"), CFSTR("%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0C9B800]);

    if (PKPearlIsAvailable())
      v9 = CFSTR("SELECT_EXPRESS_PASS_DESCRIPTION_FACE_ID");
    else
      v9 = CFSTR("SELECT_EXPRESS_PASS_DESCRIPTION_TOUCH_ID");
    PKLocalizedShareableCredentialString(&v9->isa);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C9B810]);

    PKLocalizedShareableCredentialString(CFSTR("SELECT_EXPRESS_PASS_OK_BUTTON"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0C9B838]);

    objc_msgSend(MEMORY[0x1E0D67760], "presentNotificationWithParameters:responseHandler:", v12, &__block_literal_global_116);
  }
}

- (id)viewControllerForRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  PKEditSinglePassViewController *v6;
  void *v7;
  int64_t v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_editStyle != 1)
  {
    -[PKGroup passAtIndex:](self->_group, "passAtIndex:", objc_msgSend(v4, "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKEditSinglePassViewController initWithGroup:pass:]([PKEditSinglePassViewController alloc], "initWithGroup:pass:", self->_group, v7);
    v8 = -[PKEditTableViewController performanceTest](self, "performanceTest");
    if (v8)
    {
      -[PKEditSinglePassViewController setPerformanceTest:](v6, "setPerformanceTest:", v8);
      -[PKEditTableViewController performanceTestName](self, "performanceTestName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKEditSinglePassViewController setPerformanceTestName:](v6, "setPerformanceTestName:", v9);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)passAtIndexPath:(id)a3
{
  return (id)-[PKGroup passAtIndex:](self->_group, "passAtIndex:", objc_msgSend(a3, "row"));
}

- (void)prefetchItemsAtIndexPaths:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PKGroup passes](self->_group, "passes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v10, "count");
  if (v5 - 1 >= 0)
  {
    v6 = v5;
    do
    {
      objc_msgSend(v10, "objectAtIndex:", --v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "row");
      if (objc_msgSend(v4, "count") > v8)
      {
        -[PKGroup passAtIndex:](self->_group, "passAtIndex:", objc_msgSend(v7, "row"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKEditTableViewController loadContentAndImageSetFromExistingPassForPass:](self, "loadContentAndImageSetFromExistingPassForPass:", v9);
        -[PKEditTableViewController preemptivelyCacheImagesForPass:stacked:](self, "preemptivelyCacheImagesForPass:stacked:", v9, 0);

      }
    }
    while (v6 > 0);
  }

}

- (BOOL)passExistsWithUniqueIdentifier:(id)a3
{
  return -[PKGroup indexForPassUniqueID:](self->_group, "indexForPassUniqueID:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)group
{
  return self->_group;
}

- (id)pass
{
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_viewingPass, 0);
  objc_storeStrong((id *)&self->_flexibleSpace, 0);
  objc_storeStrong((id *)&self->_deleteToolbarItem, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end

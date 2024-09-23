@implementation PKEditGroupsViewController

- (id)initInEditingMode:(BOOL)a3 existingGroupsController:(id)a4 isForWatch:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  PKEditGroupsViewController *v9;
  PKEditGroupsViewController *v10;
  CGFloat v11;
  CGFloat v12;
  uint64_t v13;
  PKGroupsController *groupsController;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  PKPass *viewingPass;
  PKGroup *viewingGroup;
  PKGroup *deletingGroup;
  NSMutableArray *v23;
  NSMutableArray *actions;
  NSMutableArray *v25;
  PKEditGroupsAction *v26;
  void *v27;
  PKEditGroupsAction *v28;
  NSMutableArray *v29;
  PKEditGroupsAction *v30;
  void *v31;
  PKEditGroupsAction *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v38.receiver = self;
  v38.super_class = (Class)PKEditGroupsViewController;
  v9 = -[PKEditTableViewController initWithStyle:placeholders:isForWatch:](&v38, sel_initWithStyle_placeholders_isForWatch_, 1, 0, v5);
  v10 = v9;
  if (v9)
  {
    v9->_editingMode = a3;
    -[PKEditTableViewController setExistingGroupsController:](v9, "setExistingGroupsController:", v8);
    +[PKEditPassesTableViewCell imageSizeNeeded](PKEditPassesTableViewCell, "imageSizeNeeded");
    v10->_imageSizeNeeded.width = v11;
    v10->_imageSizeNeeded.height = v12;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66DB8]), "initWithPassTypeMask:passFilters:allowedPassUniqueIDs:", 1, 0, 0);
    groupsController = v10->_groupsController;
    v10->_groupsController = (PKGroupsController *)v13;

    -[PKGroupsController setDelegate:](v10->_groupsController, "setDelegate:", v10);
    -[PKGroupsController loadGroupsSynchronously](v10->_groupsController, "loadGroupsSynchronously");
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[PKGroupsController groups](v10->_groupsController, "groups", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "addGroupObserver:", v10);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v17);
    }

    viewingPass = v10->_viewingPass;
    v10->_viewingPass = 0;

    viewingGroup = v10->_viewingGroup;
    v10->_viewingGroup = 0;

    deletingGroup = v10->_deletingGroup;
    v10->_deletingGroup = 0;

    v10->_isForWatch = v5;
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    actions = v10->_actions;
    v10->_actions = v23;

    if (PKRearCameraIsAllowed())
    {
      v25 = v10->_actions;
      v26 = [PKEditGroupsAction alloc];
      PKLocalizedString(CFSTR("SCAN_CODE"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[PKEditGroupsAction initWithLabel:type:](v26, "initWithLabel:type:", v27, CFSTR("ScanCode"));
      -[NSMutableArray addObject:](v25, "addObject:", v28);

    }
    v29 = v10->_actions;
    v30 = [PKEditGroupsAction alloc];
    PKLocalizedString(CFSTR("APP_STORE"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[PKEditGroupsAction initWithLabel:type:](v30, "initWithLabel:type:", v31, CFSTR("FindApps"));
    -[NSMutableArray addObject:](v29, "addObject:", v32);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PKGroupsController groups](self->_groupsController, "groups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeGroupObserver:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)PKEditGroupsViewController;
  -[PKEditGroupsViewController dealloc](&v8, sel_dealloc);
}

- (void)viewDidLoad
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  void *v14;
  void *v15;
  UITableView *v16;
  UITableView *tableView;
  unint64_t v18;
  unint64_t v19;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PKEditGroupsViewController;
  -[PKEditTableViewController viewDidLoad](&v25, sel_viewDidLoad);
  -[PKEditTableViewController setEditing:animated:](self, "setEditing:animated:", self->_editingMode, 0);
  v3 = -[PKEditTableViewController visibleRowsCount](self, "visibleRowsCount");
  -[PKGroupsController groups](self->_groupsController, "groups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v18 = v5;
  v19 = v3;
  if (v3 >= v5)
    v6 = v5;
  else
    v6 = v3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  if (v6)
  {
    v7 = 0;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      objc_msgSend(v4, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKEditTableViewController mostRecentPassInGroup:](self, "mostRecentPassInGroup:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "passCount");
      v20[0] = v8;
      v20[1] = 3221225472;
      v20[2] = __41__PKEditGroupsViewController_viewDidLoad__block_invoke;
      v20[3] = &unk_1E3E6ECF0;
      v20[5] = v6;
      v20[6] = v7;
      v20[4] = &v21;
      -[PKEditTableViewController imageForPass:stacked:synchronously:placeholder:completion:](self, "imageForPass:stacked:synchronously:placeholder:completion:", v10, v11 > 1, 1, 0, v20);

      LODWORD(v10) = *((unsigned __int8 *)v22 + 24);
      if ((_DWORD)v10)
        v12 = 1;
      else
        v12 = v6 - 1 == v7;
      ++v7;
    }
    while (!v12);
  }
  if (v19 < v18)
  {
    if (6 * v19 >= v18 - 1)
      v13 = v18 - 1;
    else
      v13 = 6 * v19;
    while (v13 > v6)
    {
      objc_msgSend(v4, "objectAtIndex:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKEditTableViewController mostRecentPassInGroup:](self, "mostRecentPassInGroup:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKEditTableViewController preemptivelyCacheImagesForPass:stacked:](self, "preemptivelyCacheImagesForPass:stacked:", v15, (unint64_t)objc_msgSend(v14, "passCount") > 1);

      --v13;
    }
  }
  -[PKEditGroupsViewController tableView](self, "tableView");
  v16 = (UITableView *)objc_claimAutoreleasedReturnValue();
  tableView = self->_tableView;
  self->_tableView = v16;

  -[PKEditTableViewController setCachingDelegate:](self, "setCachingDelegate:", self);
  -[UITableView reloadData](self->_tableView, "reloadData");
  -[PKEditGroupsViewController _showNoPassesViewIfNoGroupsToShow](self, "_showNoPassesViewIfNoGroupsToShow");
  _Block_object_dispose(&v21, 8);

}

_QWORD *__41__PKEditGroupsViewController_viewDidLoad__block_invoke(_QWORD *result, double a2)
{
  if ((double)(unint64_t)(result[5] - result[6]) * a2 > 0.3)
    *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 1;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  PKGroup *viewingGroup;
  PKPass *viewingPass;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKEditGroupsViewController;
  -[PKEditGroupsViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[PKEditGroupsViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:animated:", 1, 1);
  viewingGroup = self->_viewingGroup;
  self->_viewingGroup = 0;

  viewingPass = self->_viewingPass;
  self->_viewingPass = 0;

}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKEditGroupsViewController;
  -[PKEditGroupsViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (-[PKEditTableViewController performanceTest](self, "performanceTest") == 1)
  {
    v4 = -[PKEditTableViewController testIteration](self, "testIteration");
    if (v4 > 9)
    {
      -[PKEditTableViewController passedTest](self, "passedTest");
    }
    else
    {
      -[PKEditTableViewController setTestIteration:](self, "setTestIteration:", v4 + 1);
      -[PKEditTableViewController selectFirstRowOrFailTest](self, "selectFirstRowOrFailTest");
    }
  }
}

- (void)_showNoPassesViewIfNoGroupsToShow
{
  -[PKEditTableViewController showNoPassesView:](self, "showNoPassesView:", -[PKGroupsController groupCount](self->_groupsController, "groupCount") == 0);
}

- (void)group:(id)a3 didInsertPass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6
{
  id v9;
  id v10;
  PKGroup *deletingGroup;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  deletingGroup = self->_deletingGroup;
  if (!deletingGroup
    || (-[PKGroup groupID](deletingGroup, "groupID"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "groupID"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v12 != v13))
  {
    -[PKEditGroupsViewController indexPathForGroup:](self, "indexPathForGroup:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        -[PKEditGroupsViewController configureCell:atIndexPath:withGroup:](self, "configureCell:atIndexPath:withGroup:", v15, v14, v16);

    }
  }

}

- (void)group:(id)a3 didRemovePass:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  PKGroup *deletingGroup;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  PKGroup *viewingGroup;
  PKPass *viewingPass;
  id v20;

  v20 = a3;
  v7 = a4;
  -[PKEditTableViewController clearImageCacheForPass:](self, "clearImageCacheForPass:", v7);
  deletingGroup = self->_deletingGroup;
  if (!deletingGroup
    || (-[PKGroup groupID](deletingGroup, "groupID"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v20, "groupID"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v9 != v10))
  {
    -[PKEditGroupsViewController indexPathForGroup:](self, "indexPathForGroup:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        -[PKEditGroupsViewController configureCell:atIndexPath:withGroup:](self, "configureCell:atIndexPath:withGroup:", v12, v11, v20);

    }
  }
  if (self->_viewingPass)
  {
    objc_msgSend(v7, "uniqueID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPass uniqueID](self->_viewingPass, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if (v15)
    {
      -[PKEditGroupsViewController navigationController](self, "navigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (id)objc_msgSend(v16, "popToViewController:animated:", self, 1);

      viewingGroup = self->_viewingGroup;
      self->_viewingGroup = 0;

      viewingPass = self->_viewingPass;
      self->_viewingPass = 0;

    }
  }

}

- (void)group:(id)a3 didUpdatePass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6
{
  id v9;
  id v10;
  PKGroup *deletingGroup;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  deletingGroup = self->_deletingGroup;
  if (!deletingGroup
    || (-[PKGroup groupID](deletingGroup, "groupID"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "groupID"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v12 != v13))
  {
    -[PKEditGroupsViewController indexPathForGroup:](self, "indexPathForGroup:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        -[PKEditGroupsViewController configureCell:atIndexPath:withGroup:](self, "configureCell:atIndexPath:withGroup:", v15, v14, v16);

    }
  }

}

- (void)group:(id)a3 didMovePassFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  id v6;
  PKGroup *deletingGroup;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  deletingGroup = self->_deletingGroup;
  v12 = v6;
  if (!deletingGroup
    || (-[PKGroup groupID](deletingGroup, "groupID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "groupID"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v6 = v12,
        v8 != v9))
  {
    -[PKEditGroupsViewController indexPathForGroup:](self, "indexPathForGroup:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        -[PKEditGroupsViewController configureCell:atIndexPath:withGroup:](self, "configureCell:atIndexPath:withGroup:", v11, v10, v12);

    }
    v6 = v12;
  }

}

- (void)groupsController:(id)a3 didInsertGroup:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  id v8;
  UITableView *tableView;
  void *v10;
  void *v11;
  uint64_t v12;
  UITableView *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "addGroupObserver:", self);
  -[UITableView beginUpdates](self->_tableView, "beginUpdates");
  tableView = self->_tableView;
  -[PKEditGroupsViewController indexPathForGroup:](self, "indexPathForGroup:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView insertRowsAtIndexPaths:withRowAnimation:](tableView, "insertRowsAtIndexPaths:withRowAnimation:", v11, 2);

  v12 = objc_msgSend(v8, "groupCount");
  if (v12 == 1)
  {
    v13 = self->_tableView;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView reloadSections:withRowAnimation:](v13, "reloadSections:withRowAnimation:", v14, 2);

    -[PKEditGroupsViewController _showNoPassesViewIfNoGroupsToShow](self, "_showNoPassesViewIfNoGroupsToShow");
  }
  -[UITableView endUpdates](self->_tableView, "endUpdates");
}

- (void)groupsController:(id)a3 didRemoveGroup:(id)a4 atIndex:(unint64_t)a5
{
  PKGroup *v8;
  id v9;
  void *v10;
  PKGroup *viewingGroup;
  void *v12;
  id v13;
  PKGroup *v14;
  PKPass *viewingPass;
  UITableView *tableView;
  void *v17;
  void *v18;
  uint64_t v19;
  UITableView *v20;
  void *v21;
  PKGroup *deletingGroup;
  _QWORD v23[5];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = (PKGroup *)a4;
  v9 = a3;
  -[PKGroup removeGroupObserver:](v8, "removeGroupObserver:", self);
  -[PKEditGroupsViewController _showNoPassesViewIfNoGroupsToShow](self, "_showNoPassesViewIfNoGroupsToShow");
  -[PKEditTableViewController mostRecentPassInGroup:](self, "mostRecentPassInGroup:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEditTableViewController clearImageCacheForPass:](self, "clearImageCacheForPass:", v10);

  viewingGroup = self->_viewingGroup;
  if (viewingGroup == v8)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __70__PKEditGroupsViewController_groupsController_didRemoveGroup_atIndex___block_invoke;
    v23[3] = &unk_1E3E612E8;
    v23[4] = self;
    objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v23);
    -[PKEditGroupsViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "popToViewController:animated:", self, 1);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    v14 = self->_viewingGroup;
    self->_viewingGroup = 0;

    viewingPass = self->_viewingPass;
    self->_viewingPass = 0;

  }
  -[UITableView beginUpdates](self->_tableView, "beginUpdates");
  tableView = self->_tableView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a5, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](tableView, "deleteRowsAtIndexPaths:withRowAnimation:", v18, 1);

  v19 = objc_msgSend(v9, "groupCount");
  if (!v19)
  {
    v20 = self->_tableView;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView reloadSections:withRowAnimation:](v20, "reloadSections:withRowAnimation:", v21, 1);

  }
  -[UITableView endUpdates](self->_tableView, "endUpdates");
  deletingGroup = self->_deletingGroup;
  self->_deletingGroup = 0;

}

uint64_t __70__PKEditGroupsViewController_groupsController_didRemoveGroup_atIndex___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "performanceTest");
  if (result == 3)
    return objc_msgSend(*(id *)(a1 + 32), "passedTest");
  return result;
}

- (void)groupsController:(id)a3 didMoveGroup:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  void *v9;
  id v10;

  -[UITableView beginUpdates](self->_tableView, "beginUpdates", a3, a4);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a5, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView moveRowAtIndexPath:toIndexPath:](self->_tableView, "moveRowAtIndexPath:toIndexPath:", v10, v9);
  -[UITableView endUpdates](self->_tableView, "endUpdates");

}

- (void)groupsController:(id)a3 didUpdateGroup:(id)a4
{
  id v6;
  id v7;
  PKGroup *deletingGroup;
  void *v9;
  void *v10;
  void *v11;
  UITableView *tableView;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  deletingGroup = self->_deletingGroup;
  if (!deletingGroup
    || (-[PKGroup groupID](deletingGroup, "groupID"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "groupID"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v9 != v10))
  {
    -[PKEditGroupsViewController indexPathForGroup:](self, "indexPathForGroup:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView beginUpdates](self->_tableView, "beginUpdates");
    tableView = self->_tableView;
    v14[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](tableView, "reloadRowsAtIndexPaths:withRowAnimation:", v13, 0);

    -[UITableView endUpdates](self->_tableView, "endUpdates");
  }

}

- (void)groupViewController:(id)a3 isDeletingGroup:(id)a4
{
  objc_storeStrong((id *)&self->_deletingGroup, a4);
}

- (id)groupAtIndexPath:(id)a3
{
  return (id)-[PKGroupsController groupAtIndex:](self->_groupsController, "groupAtIndex:", objc_msgSend(a3, "row"));
}

- (id)indexPathForGroup:(id)a3
{
  uint64_t v3;

  v3 = -[PKGroupsController indexOfGroup:](self->_groupsController, "indexOfGroup:", a3);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  uint64_t v7;
  int64_t v8;

  v6 = a3;
  if (a4 == 1)
  {
    if (-[PKGroupsController groupCount](self->_groupsController, "groupCount"))
    {
      v7 = -[NSMutableArray count](self->_actions, "count");
      goto LABEL_6;
    }
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  if (a4)
    goto LABEL_7;
  v7 = -[PKGroupsController groupCount](self->_groupsController, "groupCount");
LABEL_6:
  v8 = v7;
LABEL_8:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableArray *actions;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "section"))
  {
    -[PKEditTableViewController tableView:cellWithIdentifier:](self, "tableView:cellWithIdentifier:", v7, CFSTR("cellActionEditIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    actions = self->_actions;
    v10 = objc_msgSend(v6, "row");

    -[NSMutableArray objectAtIndex:](actions, "objectAtIndex:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLabel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v12);

  }
  else
  {
    -[PKEditTableViewController tableView:cellWithIdentifier:](self, "tableView:cellWithIdentifier:", v7, CFSTR("cellPassEditIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKEditGroupsViewController groupAtIndexPath:](self, "groupAtIndexPath:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEditGroupsViewController configureCell:atIndexPath:withGroup:](self, "configureCell:atIndexPath:withGroup:", v8, v6, v11);
  }

  return v8;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[3];
  char v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKEditTableViewController mostRecentPassInGroup:](self, "mostRecentPassInGroup:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPass:", v11);
    v12 = objc_msgSend(v10, "passCount");
    -[PKEditTableViewController loadContentAndImageSetFromExistingPassForPass:](self, "loadContentAndImageSetFromExistingPassForPass:", v11);
    objc_msgSend(v8, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v14);

    objc_msgSend(v11, "ingestedDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PKRelativeDateStringWithFullDateForUnits();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedString(CFSTR("PASS_EDITING_ADDED_AGO"), CFSTR("%lu%@"), v12, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pk_uppercaseFirstStringForPreferredLocale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v10, "passCount") < 2)
    {
      objc_msgSend(v8, "detailTextLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setText:", v18);
    }
    else
    {
      PKLocalizedString(CFSTR("PASS_EDITING_PASSES_DETAILS"), CFSTR("%lu%@"), v12, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pk_uppercaseFirstStringForPreferredLocale");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "detailTextLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setText:", v20);

    }
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v35 = 0;
    v22 = objc_msgSend(v10, "passCount");
    v23 = MEMORY[0x1E0C809B0];
    v24 = v22 > 1;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __66__PKEditGroupsViewController_configureCell_atIndexPath_withGroup___block_invoke;
    v30[3] = &unk_1E3E71908;
    v33 = v34;
    v31 = v8;
    v32 = v11;
    v26[0] = v23;
    v26[1] = 3221225472;
    v26[2] = __66__PKEditGroupsViewController_configureCell_atIndexPath_withGroup___block_invoke_2;
    v26[3] = &unk_1E3E71930;
    v29 = v34;
    v27 = v31;
    v25 = v32;
    v28 = v25;
    -[PKEditTableViewController imageForPass:stacked:synchronously:placeholder:completion:](self, "imageForPass:stacked:synchronously:placeholder:completion:", v25, v24, 0, v30, v26);

    _Block_object_dispose(v34, 8);
  }

}

uint64_t __66__PKEditGroupsViewController_configureCell_atIndexPath_withGroup___block_invoke(uint64_t result, uint64_t a2)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
    return objc_msgSend(*(id *)(result + 32), "setImage:forPass:", a2, *(_QWORD *)(result + 40));
  return result;
}

uint64_t __66__PKEditGroupsViewController_configureCell_atIndexPath_withGroup___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "setImage:forPass:", a2, *(_QWORD *)(a1 + 40));
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "section", a3) == 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  void *v7;
  PKGroup *v8;
  PKGroup *viewingGroup;
  PKPass *v10;
  PKPass *viewingPass;
  void *v12;
  id v13;

  v13 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v13, 1);
  v6 = objc_msgSend(v13, "section");
  if (v6 == 1)
  {
    -[NSMutableArray objectAtIndex:](self->_actions, "objectAtIndex:", objc_msgSend(v13, "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("FindApps")))
    {
      -[PKEditTableViewController findApps](self, "findApps");
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("ScanCode")))
    {
      -[PKEditTableViewController scanCode](self, "scanCode");
    }
    goto LABEL_9;
  }
  if (!v6 && !self->_viewingGroup)
  {
    -[PKEditGroupsViewController viewControllerForRowAtIndexPath:](self, "viewControllerForRowAtIndexPath:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "group");
    v8 = (PKGroup *)objc_claimAutoreleasedReturnValue();
    viewingGroup = self->_viewingGroup;
    self->_viewingGroup = v8;

    objc_msgSend(v7, "pass");
    v10 = (PKPass *)objc_claimAutoreleasedReturnValue();
    viewingPass = self->_viewingPass;
    self->_viewingPass = v10;

    -[PKEditGroupsViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v7, 1);
LABEL_9:

  }
}

- (BOOL)shouldShowPreviewForRowAtIndexPath:(id)a3
{
  return a3 && objc_msgSend(a3, "section") == 0;
}

- (id)viewControllerForRowAtIndexPath:(id)a3
{
  id v4;
  PKEditSinglePassViewController *v5;
  void *v7;
  void *v8;
  PKEditGroupViewController *v9;
  void *v10;
  int64_t v11;
  void *v12;

  v4 = a3;
  if (-[PKEditGroupsViewController shouldShowPreviewForRowAtIndexPath:](self, "shouldShowPreviewForRowAtIndexPath:", v4)&& !objc_msgSend(v4, "section"))
  {
    -[PKEditGroupsViewController groupAtIndexPath:](self, "groupAtIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addGroupObserver:", self);
    if (objc_msgSend(v7, "passCount") == 1)
    {
      objc_msgSend(v7, "passAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[PKEditSinglePassViewController initWithGroup:pass:]([PKEditSinglePassViewController alloc], "initWithGroup:pass:", v7, v8);
    }
    else
    {
      v9 = [PKEditGroupViewController alloc];
      -[PKEditTableViewController existingGroupsController](self, "existingGroupsController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKEditTableViewController placeholders](self, "placeholders");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[PKEditGroupViewController initWithGroup:existingGroupsController:style:placeholders:isForWatch:delegate:](v9, "initWithGroup:existingGroupsController:style:placeholders:isForWatch:delegate:", v7, v8, 0, v10, self->_isForWatch, self);

    }
    v11 = -[PKEditTableViewController performanceTest](self, "performanceTest");
    if (v11)
    {
      -[PKEditSinglePassViewController setPerformanceTest:](v5, "setPerformanceTest:", v11);
      -[PKEditTableViewController performanceTestName](self, "performanceTestName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKEditSinglePassViewController setPerformanceTestName:](v5, "setPerformanceTestName:", v12);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  void *v4;
  __CFString *v5;
  void *v6;

  -[PKEditGroupsViewController groupAtIndexPath:](self, "groupAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "passCount") == 1)
    v5 = CFSTR("PASS_EDITING_DELETE");
  else
    v5 = CFSTR("PASS_EDITING_DELETE_ALL");
  PKLocalizedString(&v5->isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  unint64_t v4;

  v4 = objc_msgSend(a4, "section", a3);
  if (v4 > 2)
    return 0;
  else
    return qword_19DF16C78[v4];
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  PKGroupsController *groupsController;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68300], 0);
  -[PKEditGroupsViewController groupAtIndexPath:](self, "groupAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_deletingGroup, v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "passCount"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v7, "passes", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "uniqueID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  groupsController = self->_groupsController;
  v16 = (void *)objc_msgSend(v8, "copy");
  -[PKGroupsController handleUserPassesDelete:](groupsController, "handleUserPassesDelete:", v16);

}

- (id)passAtIndexPath:(id)a3
{
  void *v4;
  void *v5;

  -[PKGroupsController groupAtIndex:](self->_groupsController, "groupAtIndex:", objc_msgSend(a3, "row"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKEditTableViewController mostRecentPassInGroup:](self, "mostRecentPassInGroup:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)prefetchItemsAtIndexPaths:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PKGroupsController groups](self->_groupsController, "groups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v11, "count");
  if (v5 - 1 >= 0)
  {
    v6 = v5;
    do
    {
      objc_msgSend(v11, "objectAtIndex:", --v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "row");
      if (objc_msgSend(v4, "count") > v8)
      {
        objc_msgSend(v4, "objectAtIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKEditTableViewController mostRecentPassInGroup:](self, "mostRecentPassInGroup:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKEditTableViewController loadContentAndImageSetFromExistingPassForPass:](self, "loadContentAndImageSetFromExistingPassForPass:", v10);
        -[PKEditTableViewController preemptivelyCacheImagesForPass:stacked:](self, "preemptivelyCacheImagesForPass:stacked:", v10, (unint64_t)objc_msgSend(v9, "passCount") > 1);

      }
    }
    while (v6 > 0);
  }

}

- (BOOL)passExistsWithUniqueIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[PKGroupsController passWithUniqueID:](self->_groupsController, "passWithUniqueID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_deletingGroup, 0);
  objc_storeStrong((id *)&self->_viewingGroup, 0);
  objc_storeStrong((id *)&self->_viewingPass, 0);
  objc_storeStrong((id *)&self->_groupsController, 0);
}

@end

@implementation SUTableViewController

- (SUTableViewController)init
{
  SUTableViewController *v2;
  SUTableViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUTableViewController;
  v2 = -[SUViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    v2->_disappearOrientation = -[SUViewController interfaceOrientation](v2, "interfaceOrientation");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SUTableDataSource setCellReuseSource:](self->_dataSource, "setCellReuseSource:", 0);

  self->_dataSource = 0;
  self->_firstTapIndexPath = 0;
  -[SUTableView setDataSource:](self->_tableView, "setDataSource:", 0);
  -[SUTableView setDelegate:](self->_tableView, "setDelegate:", 0);

  self->_tableView = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTableViewController;
  -[SUViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)canSelectRowAtIndexPath:(id)a3
{
  return 1;
}

- (int)clippedCornersForIndexPath:(id)a3
{
  uint64_t v5;

  if (self->_tableViewStyle != 1)
    return 0;
  v5 = objc_msgSend(a3, "row");
  if (v5 == -[SUTableDataSource numberOfRowsInSection:](self->_dataSource, "numberOfRowsInSection:", objc_msgSend(a3, "section"))- 1)return (v5 == 0) | 4;
  else
    return v5 == 0;
}

- (BOOL)deleteRowAtIndexPath:(id)a3
{
  uint64_t v5;
  _BOOL4 v6;
  UITableView *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = -[SUTableDataSource numberOfSections](self->_dataSource, "numberOfSections");
  v6 = -[SUTableDataSource deleteIndexPath:](self->_dataSource, "deleteIndexPath:", a3);
  if (v6)
  {
    v7 = -[SUTableViewController tableView](self, "tableView");
    -[SUTableViewController reloadForChangedRowCount:](self, "reloadForChangedRowCount:", -[SUTableViewController numberOfRows](self, "numberOfRows") - 1);
    -[UITableView beginUpdates](v7, "beginUpdates");
    if (v5 >= 2 && v5 > -[SUTableDataSource numberOfSections](self->_dataSource, "numberOfSections"))
      -[UITableView deleteSections:withRowAnimation:](v7, "deleteSections:withRowAnimation:", objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", objc_msgSend(a3, "section")), 1);
    -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](v7, "deleteRowsAtIndexPaths:withRowAnimation:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a3, 0), 1);
    -[UITableView endUpdates](v7, "endUpdates");
    v8 = -[UITableView indexPathsForVisibleRows](v7, "indexPathsForVisibleRows");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          -[SUTableDataSource configureCell:forIndexPath:](self->_dataSource, "configureCell:forIndexPath:", -[UITableView cellForRowAtIndexPath:](v7, "cellForRowAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12)), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
  }
  return v6;
}

- (BOOL)handleSelectionForIndexPath:(id)a3 tapCount:(int64_t)a4
{
  return 0;
}

- (BOOL)indexPathIsPlaceholder:(id)a3
{
  int64_t v5;
  int64_t v6;

  if (self->_placeholderRowCount < 1)
    return 0;
  v5 = -[SUTableViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", self->_tableView);
  if (objc_msgSend(a3, "section") != v5 - 1)
    return 0;
  v6 = -[SUTableViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", self->_tableView, objc_msgSend(a3, "section"));
  return objc_msgSend(a3, "row") >= v6 - self->_placeholderRowCount;
}

- (id)newTableView
{
  SUTableView *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = [SUTableView alloc];
  objc_msgSend((id)-[SUTableViewController view](self, "view"), "bounds");
  return -[SUTableView initWithFrame:style:](v3, "initWithFrame:style:", -[SUTableViewController tableViewStyle](self, "tableViewStyle"), v4, v5, v6, v7);
}

- (void)reloadData
{
  NSString *v3;
  CGPoint v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;

  -[SUTableDataSource reloadData](self->_dataSource, "reloadData");
  -[SUTableView setAllowsHeaderAndFooterToFloat:](self->_tableView, "setAllowsHeaderAndFooterToFloat:", objc_msgSend(-[SUTableViewController sectionIndexTitlesForTableView:](self, "sectionIndexTitlesForTableView:", self->_tableView), "count") != 0);
  -[SUTableView reloadData](self->_tableView, "reloadData");
  -[SUTableViewController _reloadPlaceholderCells](self, "_reloadPlaceholderCells");
  if (-[SUTableDataSource numberOfSections](self->_dataSource, "numberOfSections") >= 1)
  {
    v3 = -[SUViewControllerContext valueForMetadataKey:](-[SUViewController _restoredContext](self, "_restoredContext"), "valueForMetadataKey:", CFSTR("offset"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = CGPointFromString(v3);
      -[SUTableView contentOffset](self->_tableView, "contentOffset");
      if (v4.x != v6 || v4.y != v5)
      {
        -[SUTableView contentSize](self->_tableView, "contentSize");
        v9 = v8;
        -[SUTableView frame](self->_tableView, "frame");
        if (v4.y <= v9 - v10)
        {
          -[SUTableView setContentOffset:](self->_tableView, "setContentOffset:", v4.x, v4.y);
          -[SUTableView flashScrollIndicators](self->_tableView, "flashScrollIndicators");
        }
      }
    }
    -[SUViewController resetRestoredContext](self, "resetRestoredContext");
  }
  -[SUTableViewController reloadForChangedRowCount:](self, "reloadForChangedRowCount:", -[SUTableViewController numberOfRows](self, "numberOfRows"));
}

- (void)scrollToRowAtIndexPath:(id)a3 atScrollPosition:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  UITableView *v8;
  uint64_t v9;
  void *v10;
  double v11;

  v5 = a5;
  v8 = -[SUTableViewController tableView](self, "tableView");
  -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](v8, "scrollToRowAtIndexPath:atScrollPosition:animated:", a3, 1, v5);
  v9 = -[UITableView delegate](v8, "delegate");
  if (a4 == 1)
  {
    v10 = (void *)v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "tableView:heightForHeaderInSection:", v8, 0);
      if (v11 > 0.00000011920929)
      {
        -[UITableView contentOffset](v8, "contentOffset");
        -[UITableView setContentOffset:animated:](v8, "setContentOffset:animated:", v5);
      }
    }
  }
}

- (void)setTableViewStyle:(int64_t)a3
{
  if (self->_tableViewStyle != a3)
  {
    self->_tableViewStyle = a3;
    -[SUTableViewController _resetTableView](self, "_resetTableView");
  }
}

- (id)copyArchivableContext
{
  id v3;
  SUTableView *tableView;
  NSString *v5;
  objc_super v7;
  CGPoint v8;

  v7.receiver = self;
  v7.super_class = (Class)SUTableViewController;
  v3 = -[SUViewController copyArchivableContext](&v7, sel_copyArchivableContext);
  if (!-[SUViewController shouldExcludeFromNavigationHistory](self, "shouldExcludeFromNavigationHistory"))
  {
    tableView = self->_tableView;
    if (tableView)
    {
      -[SUTableView contentOffset](tableView, "contentOffset");
      v5 = NSStringFromCGPoint(v8);
LABEL_6:
      objc_msgSend(v3, "setValue:forMetadataKey:", v5, CFSTR("offset"));
      return v3;
    }
    if (-[SUViewController _restoredContext](self, "_restoredContext"))
    {
      v5 = -[SUViewControllerContext valueForMetadataKey:](-[SUViewController _restoredContext](self, "_restoredContext"), "valueForMetadataKey:", CFSTR("offset"));
      goto LABEL_6;
    }
  }
  return v3;
}

- (id)copyDefaultScriptProperties
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUTableViewController;
  v2 = -[SUViewController copyDefaultScriptProperties](&v4, sel_copyDefaultScriptProperties);
  objc_msgSend(v2, "setScrollingDisabled:", 0);
  objc_msgSend(v2, "setShowsBackgroundShadow:", 0);
  return v2;
}

- (id)copyScriptProperties
{
  id v3;
  SUTableView *tableView;

  v3 = -[SUTableViewController copyDefaultScriptProperties](self, "copyDefaultScriptProperties");
  tableView = self->_tableView;
  if (tableView)
  {
    objc_msgSend(v3, "setBackgroundColor:", -[SUTableView backgroundColor](tableView, "backgroundColor"));
    objc_msgSend(v3, "setScrollingDisabled:", -[SUTableView isScrollEnabled](self->_tableView, "isScrollEnabled") ^ 1);
    objc_msgSend(v3, "setShowsBackgroundShadow:", -[SUTableView _showsBackgroundShadow](self->_tableView, "_showsBackgroundShadow"));
    objc_msgSend(v3, "setTopExtensionColor:", -[UIScrollView topExtensionViewColor](self->_tableView, "topExtensionViewColor"));
  }
  return v3;
}

- (void)didReceiveMemoryWarning
{
  objc_super v3;

  -[SUTableDataSource resetCaches](self->_dataSource, "resetCaches");
  v3.receiver = self;
  v3.super_class = (Class)SUTableViewController;
  -[SUViewController didReceiveMemoryWarning](&v3, sel_didReceiveMemoryWarning);
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUTableViewController;
  -[SUViewController loadView](&v3, sel_loadView);
  self->_preferUserInteractionWhileScrolling = MGGetBoolAnswer() ^ 1;
  -[SUTableViewController _resetTableView](self, "_resetTableView");
  -[SUTableViewController reloadData](self, "reloadData");
}

- (void)setScriptProperties:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUTableViewController;
  -[SUViewController setScriptProperties:](&v5, sel_setScriptProperties_);
  if (objc_msgSend(a3, "backgroundColor"))
    -[SUTableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", objc_msgSend(a3, "backgroundColor"));
  -[SUTableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", objc_msgSend(a3, "isScrollingDisabled") ^ 1);
  -[SUTableView _setShowsBackgroundShadow:](self->_tableView, "_setShowsBackgroundShadow:", objc_msgSend(a3, "showsBackgroundShadow"));
  if (objc_msgSend(a3, "topExtensionColor"))
    -[UIScrollView setTopExtensionViewColor:](self->_tableView, "setTopExtensionViewColor:", objc_msgSend(a3, "topExtensionColor"));
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUTableView flashScrollIndicators](self->_tableView, "flashScrollIndicators");
  v5.receiver = self;
  v5.super_class = (Class)SUTableViewController;
  -[SUViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  int64_t disappearOrientation;
  objc_super v6;

  v3 = a3;
  disappearOrientation = self->_disappearOrientation;
  if (disappearOrientation == objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "statusBarOrientation"))
  {
    -[SUTableViewController _reloadPlaceholderCells](self, "_reloadPlaceholderCells");
    -[SUTableView deselectRowAtIndexPath:animated:](self->_tableView, "deselectRowAtIndexPath:animated:", -[SUTableView indexPathForSelectedRow](self->_tableView, "indexPathForSelectedRow"), v3);
  }
  else
  {
    -[SUTableDataSource resetLayoutCaches](self->_dataSource, "resetLayoutCaches");
    -[SUTableViewController reloadData](self, "reloadData");
  }
  v6.receiver = self;
  v6.super_class = (Class)SUTableViewController;
  -[SUViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  self->_disappearOrientation = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "statusBarOrientation");
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__doubleTapTimeout, 0);
  v5.receiver = self;
  v5.super_class = (Class)SUTableViewController;
  -[SUViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  objc_super v7;

  -[SUTableDataSource resetLayoutCaches](self->_dataSource, "resetLayoutCaches");
  -[SUTableViewController reloadData](self, "reloadData");
  v7.receiver = self;
  v7.super_class = (Class)SUTableViewController;
  -[SUViewController willAnimateRotationToInterfaceOrientation:duration:](&v7, sel_willAnimateRotationToInterfaceOrientation_duration_, a3, a4);
}

- (unint64_t)numberOfRows
{
  UITableView *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t i;

  v2 = -[SUTableViewController tableView](self, "tableView");
  v3 = -[UITableView numberOfSections](v2, "numberOfSections");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  for (i = 0; i != v4; ++i)
    v5 += -[UITableView numberOfRowsInSection:](v2, "numberOfRowsInSection:", i);
  return v5;
}

- (void)setDataSource:(id)a3
{
  SUTableDataSource *dataSource;
  SUTableDataSource *v6;
  SUTableDataSource *v7;

  dataSource = self->_dataSource;
  if (dataSource != a3)
  {
    -[SUTableDataSource setCellReuseSource:](dataSource, "setCellReuseSource:", 0);

    v6 = (SUTableDataSource *)a3;
    self->_dataSource = v6;
    -[SUTableDataSource setCellReuseSource:](v6, "setCellReuseSource:", self->_tableView);
    v7 = self->_dataSource;
    if (v7)
      -[SUTableViewController setTableViewStyle:](self, "setTableViewStyle:", -[SUTableDataSource tableViewStyle](v7, "tableViewStyle"));
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4 && self->_preferUserInteractionWhileScrolling)
    -[SUTableDataSource endPreferringUserInteraction](self->_dataSource, "endPreferringUserInteraction", a3);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_preferUserInteractionWhileScrolling)
    -[SUTableDataSource endPreferringUserInteraction](self->_dataSource, "endPreferringUserInteraction", a3);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if (self->_preferUserInteractionWhileScrolling)
    -[SUTableDataSource beginPreferringUserInteraction](self->_dataSource, "beginPreferringUserInteraction", a3);
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  return -[SUTableDataSource sectionIndexTitles](self->_dataSource, "sectionIndexTitles", a3);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  _BOOL4 v6;
  SUTableDataSource *dataSource;
  id v8;
  void *v9;

  v6 = -[SUTableViewController indexPathIsPlaceholder:](self, "indexPathIsPlaceholder:", a4);
  dataSource = self->_dataSource;
  if (v6)
    v8 = -[SUTableDataSource placeholderCellForIndexPath:](dataSource, "placeholderCellForIndexPath:", a4);
  else
    v8 = -[SUTableDataSource cellForIndexPath:](dataSource, "cellForIndexPath:", a4);
  v9 = v8;
  objc_msgSend(v8, "setClipCorners:", -[SUTableViewController clippedCornersForIndexPath:](self, "clippedCornersForIndexPath:", a4));
  return v9;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
    -[SUTableViewController deleteRowAtIndexPath:](self, "deleteRowAtIndexPath:", a5);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v7;
  int64_t v8;
  int64_t placeholderRowCount;

  v7 = -[SUTableDataSource numberOfRowsInSection:](self->_dataSource, "numberOfRowsInSection:", a4);
  v8 = -[SUTableViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", a3);
  placeholderRowCount = self->_placeholderRowCount;
  if (v8 - 1 != a4 || placeholderRowCount <= 0)
    placeholderRowCount = 0;
  return placeholderRowCount + v7;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  return -[SUTableDataSource sectionIndexForIndexTitle:atIndex:](self->_dataSource, "sectionIndexForIndexTitle:atIndex:", a4, a5);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[SUTableDataSource titleForHeaderInSection:](self->_dataSource, "titleForHeaderInSection:", a4);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  _BOOL4 v8;
  SUTableDataSource *dataSource;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v8 = -[SUTableViewController indexPathIsPlaceholder:](self, "indexPathIsPlaceholder:", a5);
  dataSource = self->_dataSource;
  if (v8)
    -[SUTableDataSource configurePlaceholderCell:forIndexPath:](dataSource, "configurePlaceholderCell:forIndexPath:", a4, a5);
  else
    -[SUTableDataSource configureCell:forIndexPath:](dataSource, "configureCell:forIndexPath:", a4, a5);
  v10 = (void *)objc_msgSend(a4, "accessoryView");
  if (!v10)
  {
    v13 = objc_msgSend(a4, "isUserInteractionEnabled");
    goto LABEL_9;
  }
  v11 = objc_msgSend(v10, "isUserInteractionEnabled");
  v12 = objc_msgSend(a4, "isUserInteractionEnabled");
  if ((_DWORD)v12 && (v11 & 1) == 0)
  {
    v13 = -[SUTableViewController canSelectRowAtIndexPath:](self, "canSelectRowAtIndexPath:", a5);
LABEL_9:
    v12 = v13;
  }
  objc_msgSend(a4, "setUserInteractionEnabled:", v12);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t result;

  result = -[SUTableDataSource numberOfSections](self->_dataSource, "numberOfSections", a3);
  if (result <= 1)
    return 1;
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  NSIndexPath *v7;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__doubleTapTimeout, 0);
  v7 = self->_firstTapIndexPath;

  self->_firstTapIndexPath = 0;
  if (v7 && (-[NSIndexPath isEqual:](v7, "isEqual:", a4) & 1) != 0)
  {
    v6 = 2;
LABEL_7:
    -[SUTableViewController _deliverTapCount:forIndexPath:](self, "_deliverTapCount:forIndexPath:", v6, a4);
    goto LABEL_8;
  }
  if (!-[SUTableDataSource canDoubleTapIndexPath:](self->_dataSource, "canDoubleTapIndexPath:", a4))
  {
    v6 = 1;
    goto LABEL_7;
  }
  self->_firstTapIndexPath = (NSIndexPath *)a4;
  -[SUTableViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__doubleTapTimeout, 0, 0.349999994);
LABEL_8:

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  if (-[SUTableViewController indexPathIsPlaceholder:](self, "indexPathIsPlaceholder:", a4))
    return 0;
  else
    return -[SUTableDataSource canDeleteIndexPath:](self->_dataSource, "canDeleteIndexPath:", a4);
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result;

  -[SUTableDataSource heightForFooterInSection:](self->_dataSource, "heightForFooterInSection:", a4);
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v7;
  double v8;
  double result;

  v7 = -[SUTableDataSource headerViewForSection:](self->_dataSource, "headerViewForSection:", a4);
  if (v7)
  {
    objc_msgSend(v7, "frame");
    return v8;
  }
  else if (-[SUTableDataSource titleForHeaderInSection:](self->_dataSource, "titleForHeaderInSection:", a4))
  {
    objc_msgSend(a3, "sectionHeaderHeight");
  }
  else
  {
    return *MEMORY[0x24BDF7DE0];
  }
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  _BOOL4 v6;
  SUTableDataSource *dataSource;
  double v8;

  if (self->_dataSource)
  {
    v6 = -[SUTableViewController indexPathIsPlaceholder:](self, "indexPathIsPlaceholder:", a4);
    dataSource = self->_dataSource;
    if (v6)
      -[SUTableDataSource heightForPlaceholderCells](dataSource, "heightForPlaceholderCells");
    else
      -[SUTableDataSource cellHeightForIndexPath:](dataSource, "cellHeightForIndexPath:", a4);
  }
  else
  {
    v8 = 45.0;
  }
  return fmax(v8, 1.0);
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return -[SUTableDataSource titleForDeleteConfirmationForIndexPath:](self->_dataSource, "titleForDeleteConfirmationForIndexPath:", a4);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return -[SUTableDataSource headerViewForSection:](self->_dataSource, "headerViewForSection:", a4);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  void *v6;
  SUTableDataSource *dataSource;
  BOOL v8;

  v6 = (void *)objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  if ((!v6 || objc_msgSend(v6, "isUserInteractionEnabled"))
    && ((dataSource = self->_dataSource) == 0
     || -[SUTableDataSource canSelectIndexPath:](dataSource, "canSelectIndexPath:", a4))
    && (v8 = -[SUTableViewController canSelectRowAtIndexPath:](self, "canSelectRowAtIndexPath:", a4), a4)
    && v8)
  {
    return a4;
  }
  else
  {
    return (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (void)_doubleTapTimeout
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  if (self->_firstTapIndexPath)
  {
    -[SUTableViewController _deliverTapCount:forIndexPath:](self, "_deliverTapCount:forIndexPath:", 1);

    self->_firstTapIndexPath = 0;
  }
}

- (void)_deliverTapCount:(int64_t)a3 forIndexPath:(id)a4
{
  if (!-[SUTableViewController handleSelectionForIndexPath:tapCount:](self, "handleSelectionForIndexPath:tapCount:", a4, a3))-[UITableView deselectRowAtIndexPath:animated:](-[SUTableViewController tableView](self, "tableView"), "deselectRowAtIndexPath:animated:", a4, 1);
}

- (void)_reloadPlaceholderCells
{
  SUTableView *tableView;
  double v4;
  double v5;
  int64_t placeholderRowCount;
  SUTableDataSource *dataSource;
  double v8;
  double v9;
  SUTableView *v10;
  double v11;
  double v12;
  double v13;
  int64_t v15;

  tableView = self->_tableView;
  if (tableView)
  {
    -[SUTableView bounds](tableView, "bounds");
    v5 = v4;
  }
  else
  {
    v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  if (v5 > 0.00000011920929)
  {
    placeholderRowCount = self->_placeholderRowCount;
    dataSource = self->_dataSource;
    if (dataSource)
    {
      -[SUTableDataSource heightForPlaceholderCells](dataSource, "heightForPlaceholderCells");
      v9 = v8;
    }
    else
    {
      v9 = -1.0;
    }
    v10 = self->_tableView;
    if (v10)
      -[SUTableView contentSize](v10, "contentSize");
    else
      v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v12 = floor(v9 * (double)placeholderRowCount);
    if (v9 <= 0.00000011920929)
      v12 = 0.0;
    v13 = v11 - v12;
    if (v13 >= v5 || v9 < 0.00000011920929)
      v15 = 0;
    else
      v15 = vcvtmd_s64_f64((v5 - v13) / v9);
    if (self->_placeholderRowCount != v15)
    {
      self->_placeholderRowCount = v15;
      -[SUTableView reloadData](self->_tableView, "reloadData");
    }
  }
}

- (void)_resetTableView
{
  SUTableView *v3;

  if (self->_tableView)
  {
    -[SUTableDataSource setCellReuseSource:](self->_dataSource, "setCellReuseSource:", 0);
    -[SUTableView setDataSource:](self->_tableView, "setDataSource:", 0);
    -[SUTableView setDelegate:](self->_tableView, "setDelegate:", 0);
    -[SUTableView removeFromSuperview](self->_tableView, "removeFromSuperview");

    self->_tableView = 0;
  }
  if (-[SUTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = -[SUTableViewController newTableView](self, "newTableView");
    self->_tableView = v3;
    -[SUTableView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    -[SUTableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[SUTableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[SUTableDataSource setCellReuseSource:](self->_dataSource, "setCellReuseSource:", self->_tableView);
    objc_msgSend((id)-[SUTableViewController view](self, "view"), "addSubview:", self->_tableView);
  }
}

- (SUTableDataSource)dataSource
{
  return self->_dataSource;
}

- (UITableView)tableView
{
  return &self->_tableView->super;
}

- (int64_t)tableViewStyle
{
  return self->_tableViewStyle;
}

@end

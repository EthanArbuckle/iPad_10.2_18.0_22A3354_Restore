@implementation THNotesDetailTableViewController

- (THNotesDetailTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  THNotesDetailTableViewController *v4;
  THNotesViewAnnotationRenderer *v5;
  THNotesViewAnnotationRenderer *mAnnotationRenderer;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THNotesDetailTableViewController;
  v4 = -[THNotesDetailTableViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = -[THNotesViewAnnotationRenderer initWithDelegate:]([THNotesViewAnnotationRenderer alloc], "initWithDelegate:", v4);
    mAnnotationRenderer = v4->mAnnotationRenderer;
    v4->mAnnotationRenderer = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v8 = -[THNotesDetailTableViewController registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v7, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v4;
}

- (THNotesDetailTableViewController)initWithCoder:(id)a3
{
  THNotesDetailTableViewController *v3;
  THNotesViewAnnotationRenderer *v4;
  THNotesViewAnnotationRenderer *mAnnotationRenderer;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THNotesDetailTableViewController;
  v3 = -[THNotesDetailTableViewController initWithCoder:](&v7, "initWithCoder:", a3);
  if (v3)
  {
    v4 = -[THNotesViewAnnotationRenderer initWithDelegate:]([THNotesViewAnnotationRenderer alloc], "initWithDelegate:", v3);
    mAnnotationRenderer = v3->mAnnotationRenderer;
    v3->mAnnotationRenderer = v4;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  id WeakRetained;
  NSArray *mSections;
  NSMutableArray *mSectionSelections;
  NSMutableDictionary *mSelectedNotes;
  TSUNoCopyDictionary *mCellHeights;
  TSUNoCopyDictionary *mRenderedAnnotations;
  THNotesViewAnnotationRenderer *mAnnotationRenderer;
  UINib *mTableCellNIB;
  objc_super v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIApplicationWillEnterForegroundNotification, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(WeakRetained, "setDragDelegate:", 0);

  mSections = self->mSections;
  self->mSections = 0;

  mSectionSelections = self->mSectionSelections;
  self->mSectionSelections = 0;

  mSelectedNotes = self->mSelectedNotes;
  self->mSelectedNotes = 0;

  mCellHeights = self->mCellHeights;
  self->mCellHeights = 0;

  mRenderedAnnotations = self->mRenderedAnnotations;
  self->mRenderedAnnotations = 0;

  -[THNotesViewAnnotationRenderer setDelegate:](self->mAnnotationRenderer, "setDelegate:", 0);
  mAnnotationRenderer = self->mAnnotationRenderer;
  self->mAnnotationRenderer = 0;

  mTableCellNIB = self->mTableCellNIB;
  self->mTableCellNIB = 0;

  v12.receiver = self;
  v12.super_class = (Class)THNotesDetailTableViewController;
  -[THNotesDetailTableViewController dealloc](&v12, "dealloc");
}

- (void)setBookViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    if (obj)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "documentViewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reflowablePaginationController"));
      objc_msgSend(v7, "registerObserver:", self);
    }
    else
    {
      v6 = objc_loadWeakRetained((id *)&self->mBookViewController);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "documentViewController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reflowablePaginationController"));
      objc_msgSend(v8, "unregisterObserver:", self);

    }
    objc_storeWeak((id *)&self->mBookViewController, obj);
    v5 = obj;
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)THNotesDetailTableViewController;
  v7 = a4;
  -[THNotesDetailTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  -[THNotesDetailTableViewController setInSizeTransition:](self, "setInSizeTransition:", 1);
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_EF8FC;
  v9[3] = &unk_4291E8;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_EF904;
  v8[3] = &unk_4291E8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  NSUInteger v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THNotesDetailTableViewController;
  -[THNotesDetailTableViewController viewDidLayoutSubviews](&v8, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "frame");
  if (v5 == self->mRenderedAnnotationsSize.width && v4 == self->mRenderedAnnotationsSize.height)
  {

  }
  else
  {
    v7 = -[NSArray count](self->mSections, "count");

    if (v7)
      -[THNotesDetailTableViewController clearAndReloadAnnotations](self, "clearAndReloadAnnotations");
  }
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(a4, "userInterfaceStyle", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[THNotesDetailTableViewController clearAndReloadAnnotations](self, "clearAndReloadAnnotations");
}

- (void)clearAndReloadAnnotations
{
  id v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  id WeakRetained;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->mSections;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8), "notes", (_QWORD)v15));
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  -[TSUNoCopyDictionary removeAllObjects](self->mRenderedAnnotations, "removeAllObjects");
  -[TSUNoCopyDictionary removeAllObjects](self->mCellHeights, "removeAllObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "safeAreaLayoutGuide"));
  objc_msgSend(v11, "layoutFrame");
  self->mRenderedAnnotationsSize.width = v12;
  self->mRenderedAnnotationsSize.height = v13;

  if (objc_msgSend(v3, "count"))
  {
    -[THNotesDetailTableViewController _renderAnnotationsForTheme:](self, "_renderAnnotationsForTheme:", v3);
    WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    objc_msgSend(WeakRetained, "tableViewController:renderingInProgress:", self, 1);

  }
  -[THNotesDetailTableViewController p_reload](self, "p_reload", (_QWORD)v15);

}

- (unint64_t)numberOfNotes
{
  NSArray *v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->mSections;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "notes", (_QWORD)v10));
        v5 += (unint64_t)objc_msgSend(v8, "count");

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)reloadWithSections:(id)a3 force:(BOOL)a4
{
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *mSections;
  NSMutableArray *v10;
  NSMutableArray *mSectionSelections;
  id v12;
  NSArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  void *v20;
  void *v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  void *v26;
  id WeakRetained;
  NSArray *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v6 = (NSArray *)a3;
  v7 = v6;
  if (a4 || self->mSections != v6 && !-[NSArray isEqualToArray:](v6, "isEqualToArray:"))
  {
    if (self->mSections != v7)
    {
      v8 = (NSArray *)-[NSArray copy](v7, "copy");
      mSections = self->mSections;
      self->mSections = v8;

    }
    v28 = v7;
    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mSectionSelections = self->mSectionSelections;
    self->mSectionSelections = v10;

    v12 = objc_alloc_init((Class)NSMutableArray);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = self->mSections;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v17), "notes"));
          objc_msgSend(v12, "addObjectsFromArray:", v18);

          v19 = self->mSectionSelections;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
          -[NSMutableArray addObject:](v19, "addObject:", v20);

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v15);
    }

    -[TSUNoCopyDictionary tsu_removeObjectsWithoutKeys:](self->mRenderedAnnotations, "tsu_removeObjectsWithoutKeys:", v12);
    -[TSUNoCopyDictionary tsu_removeObjectsWithoutKeys:](self->mCellHeights, "tsu_removeObjectsWithoutKeys:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController view](self, "view"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "safeAreaLayoutGuide"));
    objc_msgSend(v22, "layoutFrame");
    self->mRenderedAnnotationsSize.width = v23;
    self->mRenderedAnnotationsSize.height = v24;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TSUNoCopyDictionary allKeys](self->mRenderedAnnotations, "allKeys"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tsu_arrayByRemovingObjectsInArray:", v25));

    if (objc_msgSend(v26, "count"))
    {
      -[THNotesDetailTableViewController _renderAnnotationsForTheme:](self, "_renderAnnotationsForTheme:", v26);
      WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
      objc_msgSend(WeakRetained, "tableViewController:renderingInProgress:", self, 1);

    }
    -[THNotesDetailTableViewController p_reload](self, "p_reload");

    v7 = v28;
  }

}

- (void)reloadWithSections:(id)a3
{
  -[THNotesDetailTableViewController reloadWithSections:force:](self, "reloadWithSections:force:", a3, 0);
}

- (void)scrollToTop
{
  void *v3;
  THNotesViewAnnotationRenderer *mAnnotationRenderer;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setContentOffset:", CGPointZero.x, CGPointZero.y);
  mAnnotationRenderer = self->mAnnotationRenderer;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_F0040;
  v6[3] = &unk_4298A8;
  v7 = v3;
  v5 = v3;
  -[THNotesViewAnnotationRenderer waitWithTimeout:forCondition:](mAnnotationRenderer, "waitWithTimeout:forCondition:", v6, 0.5);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THNotesDetailTableViewController;
  -[THNotesDetailTableViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 1);
  objc_msgSend(v3, "setAllowsMultipleSelectionDuringEditing:", 0);
  objc_msgSend(v3, "setSeparatorStyle:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(THNotesDetailTableViewHeaderView), CFSTR("notesHeaderCell"));
  objc_msgSend(v3, "setDragDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController view](self, "view"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "applicationWillEnterForeground:", UIApplicationWillEnterForegroundNotification, 0);

}

- (void)applicationWillEnterForeground:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  NSUInteger v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController tableView](self, "tableView", a3));
  objc_msgSend(v9, "contentSize");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController view](self, "view"));
  objc_msgSend(v6, "frame");
  if (v5 >= v7)
  {

  }
  else
  {
    v8 = -[NSArray count](self->mSections, "count");

    if (v8 >= 2)
      -[THNotesDetailTableViewController clearAndReloadAnnotations](self, "clearAndReloadAnnotations");
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  unint64_t v7;
  NSMutableArray *mSectionSelections;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *mSelectedNotes;
  id v15;

  v4 = a4;
  v5 = a3;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController tableView](self, "tableView"));
  objc_msgSend(v15, "setAllowsMultipleSelectionDuringEditing:", v5);
  objc_msgSend(v15, "setEditing:animated:", v5, v4);
  if (-[NSMutableArray count](self->mSectionSelections, "count"))
  {
    v7 = 0;
    do
    {
      mSectionSelections = self->mSectionSelections;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
      -[NSMutableArray replaceObjectAtIndex:withObject:](mSectionSelections, "replaceObjectAtIndex:withObject:", v7, v9);

      v10 = objc_opt_class(THNotesDetailTableViewHeaderView);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "headerViewForSection:", v7));
      TSUDynamicCast(v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

      if (v13)
        objc_msgSend(v13, "setEditing:", v5);

      ++v7;
    }
    while (v7 < (unint64_t)-[NSMutableArray count](self->mSectionSelections, "count"));
  }
  mSelectedNotes = self->mSelectedNotes;
  self->mSelectedNotes = 0;

}

- (BOOL)areAllNotesSelected
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForSelectedRows"));
  v5 = -[NSArray count](self->mSections, "count");
  if (v5 < 1)
  {
    v8 = 1;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = objc_msgSend(v3, "numberOfRowsInSection:", v7);
      if ((uint64_t)v9 >= 1)
      {
        v10 = v9;
        v11 = 0;
        while (1)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v11, v7));
          v13 = objc_msgSend(v4, "containsObject:", v12);

          if ((v13 & 1) == 0)
            break;
          if (v10 == (id)++v11)
            goto LABEL_9;
        }
        v8 = 0;
      }
LABEL_9:
      ++v7;
    }
    while (v7 != v6);
  }

  return v8 & 1;
}

- (BOOL)selectAllNotes
{
  void *v3;
  char v4;
  uint64_t i;
  char *v6;
  char *v7;
  char *j;
  void *v9;
  void *v10;
  NSMutableArray *mSectionSelections;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSUInteger v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController tableView](self, "tableView"));
  v18 = -[NSArray count](self->mSections, "count");
  v4 = 0;
  if (v18)
  {
    for (i = 0; i != v18; ++i)
    {
      v6 = (char *)objc_msgSend(v3, "numberOfRowsInSection:", i);
      if (v6)
      {
        v7 = v6;
        for (j = 0; j != v7; ++j)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", j, i));
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mSelectedNotes, "objectForKey:", v9));
          objc_msgSend(v3, "selectRowAtIndexPath:animated:scrollPosition:", v9, 0, 0);
          if (!v10)
            -[NSMutableDictionary setObject:forKey:](self->mSelectedNotes, "setObject:forKey:", v9, v9);

        }
        mSectionSelections = self->mSectionSelections;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
        -[NSMutableArray replaceObjectAtIndex:withObject:](mSectionSelections, "replaceObjectAtIndex:withObject:", i, v12);

        v13 = objc_opt_class(THNotesDetailTableViewHeaderView);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "headerViewForSection:", i));
        TSUDynamicCast(v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

        if (v16)
          objc_msgSend(v16, "setSelected:", 1);

        v4 = 1;
      }
    }
  }

  return v4 & 1;
}

- (void)deselectAllNotes
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t i;
  char *v6;
  char *v7;
  char *j;
  void *v9;
  void *v10;
  NSMutableArray *mSectionSelections;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = (id)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController tableView](self, "tableView"));
  v3 = -[NSArray count](self->mSections, "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      v6 = (char *)objc_msgSend(v20, "numberOfRowsInSection:", i);
      if (v6)
      {
        v7 = v6;
        for (j = 0; j != v7; ++j)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", j, i));
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mSelectedNotes, "objectForKey:", v9));
          objc_msgSend(v20, "deselectRowAtIndexPath:animated:", v9, 0);
          if (v10)
            -[NSMutableDictionary removeObjectForKey:](self->mSelectedNotes, "removeObjectForKey:", v9);

        }
        mSectionSelections = self->mSectionSelections;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
        -[NSMutableArray replaceObjectAtIndex:withObject:](mSectionSelections, "replaceObjectAtIndex:withObject:", i, v12);

        v13 = objc_opt_class(THNotesDetailTableViewHeaderView);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "headerViewForSection:", i));
        TSUDynamicCast(v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

        if (v16)
          objc_msgSend(v16, "setSelected:", 0);

      }
    }
  }
  if (-[THNotesDetailTableViewController countOfItemsToDelete](self, "countOfItemsToDelete"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController deselectAllNotes]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"));
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, v19, 407, CFSTR("We should note have any more items to delete"));

  }
  -[NSMutableDictionary removeAllObjects](self->mSelectedNotes, "removeAllObjects");

}

- (BOOL)isLastRowInSectionForIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 >= (id)-[NSArray count](self->mSections, "count"))
  {
    v9 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->mSections, "objectAtIndex:", objc_msgSend(v4, "section")));
    if (v6)
    {
      v7 = objc_msgSend(v4, "row");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notes"));
      v9 = v7 == objc_msgSend(v8, "count");

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)-[NSArray count](self->mSections, "count", a3) + 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[THNotesDetailTableViewController p_numberOfRowsInSection:](self, "p_numberOfRowsInSection:", a4);
}

- (int64_t)p_numberOfRowsInSection:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[NSArray count](self->mSections, "count") == a3)
    return -[THNotesViewAnnotationRenderer doneRendering](self->mAnnotationRenderer, "doneRendering") ^ 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->mSections, "objectAtIndex:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notes"));
  if (-[NSIndexPath section](self->mLastInsertedRow, "section") >= a3 && objc_msgSend(v7, "count"))
  {
    if (-[NSIndexPath section](self->mLastInsertedRow, "section") <= a3)
    {
      v5 = -[NSIndexPath row](self->mLastInsertedRow, "row");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notes"));
      v5 = objc_msgSend(v8, "count");

    }
  }
  else
  {
    v5 = 0;
  }

  return (int64_t)v5;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  double v7;
  id WeakRetained;
  double v9;
  void *v10;
  void *v11;
  float v12;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  if (v6 != (id)-[NSArray count](self->mSections, "count"))
  {
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController cachedAnnotationForIndexPath:](self, "cachedAnnotationForIndexPath:", v5));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TSUNoCopyDictionary objectForKey:](self->mCellHeights, "objectForKey:", WeakRetained));
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v7 = v12;
    }
    else
    {
      v7 = 60.0;
    }

    goto LABEL_8;
  }
  v7 = 0.0;
  if (!-[THNotesViewAnnotationRenderer doneRendering](self->mAnnotationRenderer, "doneRendering"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    objc_msgSend(WeakRetained, "activityIndicatorCellHeight");
    v7 = v9;
LABEL_8:

  }
  return v7;
}

- (void)p_cacheCellHeight:(id)a3 annotation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  TSUNoCopyDictionary *mCellHeights;
  TSUNoCopyDictionary *v10;
  TSUNoCopyDictionary *v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewWithTag:", 12));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewWithTag:", 9));

  mCellHeights = self->mCellHeights;
  if (!mCellHeights)
  {
    v10 = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v11 = self->mCellHeights;
    self->mCellHeights = v10;

    mCellHeights = self->mCellHeights;
  }
  objc_msgSend(v15, "frame");
  *(float *)&v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13));
  -[TSUNoCopyDictionary setObject:forUncopiedKey:](mCellHeights, "setObject:forUncopiedKey:", v14, v6);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  id WeakRetained;
  double v11;
  void *v12;
  void *v13;
  float v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 != (id)-[NSArray count](self->mSections, "count"))
  {
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController cachedAnnotationForIndexPath:](self, "cachedAnnotationForIndexPath:", v7));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TSUNoCopyDictionary objectForKey:](self->mCellHeights, "objectForKey:", WeakRetained));
    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController p_annotationCellForIndexPath:withTableView:](self, "p_annotationCellForIndexPath:withTableView:", v7, v6));
      -[THNotesDetailTableViewController p_cacheCellHeight:annotation:](self, "p_cacheCellHeight:annotation:", v13, WeakRetained);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TSUNoCopyDictionary objectForKey:](self->mCellHeights, "objectForKey:", WeakRetained));

    }
    objc_msgSend(v12, "floatValue");
    v9 = v14;

    goto LABEL_7;
  }
  v9 = 0.0;
  if (!-[THNotesViewAnnotationRenderer doneRendering](self->mAnnotationRenderer, "doneRendering"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    objc_msgSend(WeakRetained, "activityIndicatorCellHeight");
    v9 = v11;
LABEL_7:

  }
  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v6;
  void *v7;
  void *v8;
  THNotesDetailTableViewControllerDelegate **p_mDelegate;
  id WeakRetained;
  double v11;
  double v12;
  id v13;
  double v14;
  void *v15;
  double v16;

  v6 = 0.0;
  if (-[NSArray count](self->mSections, "count", a3) > a4
    && -[THNotesDetailTableViewController p_numberOfRowsInSection:](self, "p_numberOfRowsInSection:", a4) >= 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->mSections, "objectAtIndex:", a4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chapterTitle"));

    if (v8)
    {
      p_mDelegate = &self->mDelegate;
      WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
      objc_msgSend(WeakRetained, "chapterTitleHeightForAllChapters");
      v12 = v11;
      v13 = objc_loadWeakRetained((id *)p_mDelegate);
      objc_msgSend(v13, "sectionTitleHeightForAllChapters");
      v6 = v12 + v14;

    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));

      if (!v15)
      {
LABEL_8:

        return v6;
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
      objc_msgSend(WeakRetained, "sectionTitleHeight");
      v6 = v16;
    }

    goto LABEL_8;
  }
  return v6;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  THNotesDetailTableViewHeaderView *v7;
  THNotesDetailTableViewHeaderView *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  _UNKNOWN **v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;

  v6 = a3;
  if (-[NSArray count](self->mSections, "count") <= a4)
  {
    v8 = 0;
    goto LABEL_12;
  }
  if (-[THNotesDetailTableViewController inSizeTransition](self, "inSizeTransition"))
  {
    v7 = objc_alloc_init(THNotesDetailTableViewHeaderView);
LABEL_7:
    v8 = v7;
    goto LABEL_8;
  }
  v8 = (THNotesDetailTableViewHeaderView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("notesHeaderCell")));
  if (!v8)
  {
    v7 = -[THNotesDetailTableViewHeaderView initWithReuseIdentifier:]([THNotesDetailTableViewHeaderView alloc], "initWithReuseIdentifier:", CFSTR("notesHeaderCell"));
    goto LABEL_7;
  }
LABEL_8:
  -[THNotesDetailTableViewHeaderView setDelegate:](v8, "setDelegate:", self);
  -[THNotesDetailTableViewHeaderView setSection:](v8, "setSection:", a4);
  -[THNotesDetailTableViewHeaderView setEditing:animated:](v8, "setEditing:animated:", objc_msgSend(v6, "isEditing"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->mSectionSelections, "objectAtIndexedSubscript:", a4));
  -[THNotesDetailTableViewHeaderView setSelected:](v8, "setSelected:", objc_msgSend(v9, "BOOLValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->mSections, "objectAtIndex:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chapterTitle"));

  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v13 = WeakRetained;
  v14 = TSDGroupInfo_ptr;
  if (v11)
  {
    objc_msgSend(WeakRetained, "sectionTitleHeightForAllChapters");
    v16 = v15;

    objc_msgSend(v6, "frame");
    v18 = v17;
    v19 = objc_loadWeakRetained((id *)&self->mDelegate);
    objc_msgSend(v19, "sectionTitleHeightForAllChapters");
    v21 = v20;
    v22 = objc_loadWeakRetained((id *)&self->mDelegate);
    objc_msgSend(v22, "chapterTitleHeightForAllChapters");
    v24 = v21 + v23;

    -[THNotesDetailTableViewHeaderView setFrame:](v8, "setFrame:", 0.0, 0.0, v18, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chapterTitle"));
    v26 = objc_loadWeakRetained((id *)&self->mDelegate);
    objc_msgSend(v26, "chapterTitleHeightForAllChapters");
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController p_labelWithText:frame:textColor:tag:](self, "p_labelWithText:frame:textColor:tag:", v25, v29, 14, 0.0, 5.0, v18, v28));

    v14 = TSDGroupInfo_ptr;
    -[THNotesDetailTableViewHeaderView addChapterLabel:](v8, "addChapterLabel:", v30);
    v31 = objc_loadWeakRetained((id *)&self->mDelegate);
    objc_msgSend(v31, "chapterTitleHeightForAllChapters");
    v33 = v32 + 0.0;

  }
  else
  {
    objc_msgSend(WeakRetained, "sectionTitleHeight");
    v16 = v34;

    objc_msgSend(v6, "frame");
    v18 = v35;
    v36 = objc_loadWeakRetained((id *)&self->mDelegate);
    objc_msgSend(v36, "sectionTitleHeight");
    v38 = v37;

    v33 = 0.0;
    -[THNotesDetailTableViewHeaderView setFrame:](v8, "setFrame:", 0.0, 0.0, v18, v38);
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14[150], "bc_booksLabelColor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController p_labelWithText:frame:textColor:tag:](self, "p_labelWithText:frame:textColor:tag:", v39, v40, 8, 0.0, v33, v18, v16));

  -[THNotesDetailTableViewHeaderView addSectionLabel:](v8, "addSectionLabel:", v41);
LABEL_12:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == (id)-[NSArray count](self->mSections, "count"))
  {
    if (-[THNotesViewAnnotationRenderer doneRendering](self->mAnnotationRenderer, "doneRendering"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController tableView:cellForRowAtIndexPath:]"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"));
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 621, CFSTR("shouldn't show spinner cell when done rendering"));

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController p_activityIndicatorCell:](self, "p_activityIndicatorCell:", v6));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController p_annotationCellForIndexPath:withTableView:](self, "p_annotationCellForIndexPath:withTableView:", v7, v6));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
    objc_msgSend(v12, "setBackgroundColor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedBackgroundView"));
    objc_msgSend(v14, "setHidden:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController cachedAnnotationForIndexPath:](self, "cachedAnnotationForIndexPath:", v7));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSUNoCopyDictionary objectForKey:](self->mCellHeights, "objectForKey:", v15));
    if (!v16)
      -[THNotesDetailTableViewController p_cacheCellHeight:annotation:](self, "p_cacheCellHeight:annotation:", v12, v15);

  }
  return v12;
}

- (BOOL)p_sectionHasUnrenderedAnnotations:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = -[THNotesDetailTableViewController p_numberOfRenderedAnnotationsInSection:](self, "p_numberOfRenderedAnnotationsInSection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "notes"));

  LOBYTE(v5) = v5 != objc_msgSend(v6, "count");
  return (char)v5;
}

- (unint64_t)p_numberOfRenderedAnnotationsInSection:(id)a3
{
  id v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "notes"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      v10 = (unint64_t)v6 + v7;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TSUNoCopyDictionary objectForKey:](self->mRenderedAnnotations, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), (_QWORD)v13));

        if (!v11)
        {
          v10 = (unint64_t)v9 + v7;
          goto LABEL_12;
        }
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 = v10;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_12:

  return v10;
}

- (id)p_labelWithText:(id)a3 frame:(CGRect)a4 textColor:(id)a5 tag:(int64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id WeakRetained;
  double v23;
  double v24;
  double v25;
  id v26;
  double v27;
  double v28;
  double v29;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a5;
  v14 = a3;
  v15 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", x, y, width, height);
  objc_msgSend(v15, "setText:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 17.0));
  objc_msgSend(v15, "setFont:", v16);

  objc_msgSend(v15, "setTextColor:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v15, "setBackgroundColor:", v17);

  objc_msgSend(v15, "setAdjustsFontSizeToFitWidth:", 0);
  objc_msgSend(v15, "setAutoresizingMask:", 32);
  objc_msgSend(v15, "setLineBreakMode:", 4);
  objc_msgSend(v15, "sizeToFit");
  objc_msgSend(v15, "frame");
  objc_msgSend(v15, "textRectForBounds:limitedToNumberOfLines:", 1);
  v19 = v18;
  v21 = v20;
  self = (THNotesDetailTableViewController *)((char *)self + 96);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  objc_msgSend(WeakRetained, "cellMargin");
  v24 = v23;
  v25 = y + round((height - v21) * 0.5);

  v26 = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  objc_msgSend(v26, "cellMargin");
  v28 = width - (v27 + 15.0);

  if (v19 <= v28)
    v29 = v19;
  else
    v29 = v28;
  objc_msgSend(v15, "setFrame:", v24, v25, v29, v21);
  objc_msgSend(v15, "setTag:", a6);
  return v15;
}

- (id)p_activityIndicatorCell:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  id WeakRetained;
  double v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("ActivityIndicatorCell"));
  objc_msgSend(v4, "frame");
  v7 = v6;

  self = (THNotesDetailTableViewController *)((char *)self + 96);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  objc_msgSend(WeakRetained, "activityIndicatorCellHeight");
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v7, v9);

  v10 = objc_alloc((Class)UIActivityIndicatorView);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
  objc_msgSend(v11, "frame");
  v13 = v12;
  v14 = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  objc_msgSend(v14, "activityIndicatorCellHeight");
  v16 = objc_msgSend(v10, "initWithFrame:", 0.0, 0.0, v13, v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
  objc_msgSend(v17, "center");
  objc_msgSend(v16, "setCenter:");

  objc_msgSend(v16, "setAutoresizingMask:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
  objc_msgSend(v16, "setColor:", v18);

  objc_msgSend(v16, "startAnimating");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
  objc_msgSend(v19, "addSubview:", v16);

  return v5;
}

- (id)p_annotationCellForIndexPath:(id)a3 withTableView:(id)a4
{
  id v6;
  id v7;
  THNotesDetailTableViewCell *v8;
  void *v9;
  THNotesDetailTableViewCell *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = [THNotesDetailTableViewCell alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController delegate](self, "delegate"));
  v10 = -[THNotesDetailTableViewCell initWithStyle:reuseIdentifier:tableView:sizingDelegate:](v8, "initWithStyle:reuseIdentifier:tableView:sizingDelegate:", 3, CFSTR("notesMainCell"), v7, v9);

  -[THNotesDetailTableViewCell setMyTableViewController:](v10, "setMyTableViewController:", self);
  -[THNotesDetailTableViewCell setIndexPath:](v10, "setIndexPath:", v6);
  v11 = -[THNotesDetailTableViewController p_makeViewForAnnotationAtIndexPath:cell:](self, "p_makeViewForAnnotationAtIndexPath:cell:", v6, v10);

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *mSectionSelections;
  id v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  if (-[THNotesDetailTableViewController p_isTableViewInEditMode:](self, "p_isTableViewInEditMode:", v20))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mSelectedNotes, "objectForKey:", v6));
    if (!v7)
      -[NSMutableDictionary setObject:forKey:](self->mSelectedNotes, "setObject:forKey:", v6, v6);
    v8 = objc_msgSend(v20, "numberOfRowsInSection:", objc_msgSend(v6, "section"));
    if ((uint64_t)v8 < 1)
    {
LABEL_8:
      v13 = objc_opt_class(THNotesDetailTableViewHeaderView);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "headerViewForSection:", objc_msgSend(v6, "section")));
      TSUDynamicCast(v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

      if (v16)
        objc_msgSend(v16, "setSelected:", 1);
      mSectionSelections = self->mSectionSelections;
      v18 = objc_msgSend(v6, "section");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      -[NSMutableArray replaceObjectAtIndex:withObject:](mSectionSelections, "replaceObjectAtIndex:withObject:", v18, v19);

    }
    else
    {
      v9 = v8;
      v10 = 0;
      while (1)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v10, objc_msgSend(v6, "section")));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mSelectedNotes, "objectForKey:", v11));

        if (!v12)
          break;
        if (v9 == (id)++v10)
          goto LABEL_8;
      }
    }
    -[THNotesDetailTableViewController p_notifySelectionDidChange](self, "p_notifySelectionDidChange");

  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *mSectionSelections;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (-[THNotesDetailTableViewController p_isTableViewInEditMode:](self, "p_isTableViewInEditMode:", v15))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mSelectedNotes, "objectForKey:", v6));
    if (v7)
      -[NSMutableDictionary removeObjectForKey:](self->mSelectedNotes, "removeObjectForKey:", v6);
    v8 = objc_opt_class(THNotesDetailTableViewHeaderView);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "headerViewForSection:", objc_msgSend(v6, "section")));
    TSUDynamicCast(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    if (v11)
      objc_msgSend(v11, "setSelected:", 0);
    mSectionSelections = self->mSectionSelections;
    v13 = objc_msgSend(v6, "section");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    -[NSMutableArray replaceObjectAtIndex:withObject:](mSectionSelections, "replaceObjectAtIndex:withObject:", v13, v14);

    -[THNotesDetailTableViewController p_notifySelectionDidChange](self, "p_notifySelectionDidChange");
  }

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)p_notifySelectionDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  objc_msgSend(WeakRetained, "tableViewControllerDidChangeSelection:", self);

}

- (unint64_t)countOfItemsToDelete
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->mSelectedNotes, "allKeys"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (unint64_t)countOfUserNotesToDelete
{
  NSMutableDictionary *mSelectedNotes;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  mSelectedNotes = self->mSelectedNotes;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_F1D24;
  v5[3] = &unk_4298D0;
  v5[4] = self;
  v5[5] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mSelectedNotes, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)cachedAnnotationForIndexPath:(id)a3
{
  NSArray *mSections;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  mSections = self->mSections;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](mSections, "objectAtIndex:", objc_msgSend(v4, "section")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "notes"));
  v7 = objc_msgSend(v4, "row");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v7));
  return v8;
}

- (id)sectionTitleForIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->mSections, "objectAtIndex:", objc_msgSend(a3, "section")));
  v4 = v3;
  if (v3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  else
    v5 = 0;

  return v5;
}

- (void)deleteSelectedNotes
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->mSelectedNotes, "allKeys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingComparator:", &stru_4298F0));
  -[THNotesDetailTableViewController p_deleteNotesAtIndexPaths:](self, "p_deleteNotesAtIndexPaths:", v3);
  -[THNotesDetailTableViewController p_reload](self, "p_reload");

}

- (void)p_deleteNotesAtIndexPaths:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v6 = (void *)objc_opt_new(NSMutableArray, v5);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController cachedAnnotationForIndexPath:](self, "cachedAnnotationForIndexPath:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v11), (_QWORD)v17));
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "documentViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "documentRoot"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "annotationController"));
    objc_msgSend(v16, "destroyAnnotations:undoContext:", v6, 0);

  }
}

- (void)p_reload
{
  NSIndexPath *mLastInsertedRow;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSIndexPath *v12;
  NSIndexPath *v13;
  id v14;

  mLastInsertedRow = self->mLastInsertedRow;
  self->mLastInsertedRow = 0;

  if (-[NSArray count](self->mSections, "count"))
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->mSections, "objectAtIndex:", v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notes"));
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
        v5 = -[THNotesDetailTableViewController p_numberOfRenderedAnnotationsInSection:](self, "p_numberOfRenderedAnnotationsInSection:", v7);
        ++v6;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notes"));
        v11 = objc_msgSend(v10, "count");

        if ((id)v5 != v11)
        {

          v4 = v6;
          goto LABEL_11;
        }
        v4 = v6;
      }
      else
      {
        ++v6;
      }

    }
    while (v6 < -[NSArray count](self->mSections, "count"));
    if (!v4)
      goto LABEL_12;
LABEL_11:
    v12 = (NSIndexPath *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v5, v4 - 1));
    v13 = self->mLastInsertedRow;
    self->mLastInsertedRow = v12;

  }
LABEL_12:
  v14 = (id)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController tableView](self, "tableView"));
  objc_msgSend(v14, "reloadData");

}

- (void)p_reloadFromBottom
{
  void *v3;
  NSIndexPath *mLastInsertedRow;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSIndexPath *v15;
  NSIndexPath *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  unsigned int v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  mLastInsertedRow = self->mLastInsertedRow;
  if (mLastInsertedRow)
  {
    v5 = -[NSIndexPath section](mLastInsertedRow, "section");
    if (v5 < (char *)-[NSArray count](self->mSections, "count"))
    {
      while (1)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->mSections, "objectAtIndex:", v5));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notes"));
        v8 = objc_msgSend(v7, "count");

        if (v8)
        {
          v9 = -[THNotesDetailTableViewController p_numberOfRenderedAnnotationsInSection:](self, "p_numberOfRenderedAnnotationsInSection:", v6);
          if (v5 == (char *)-[NSIndexPath section](self->mLastInsertedRow, "section"))
            v10 = -[NSIndexPath row](self->mLastInsertedRow, "row");
          else
            v10 = 0;
          if (v10 < v9)
          {
            do
            {
              v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v10, v5));
              objc_msgSend(v3, "addObject:", v11);

              ++v10;
            }
            while (v9 != v10);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notes"));
          v13 = objc_msgSend(v12, "count");

          if ((id)v9 != v13)
            break;
        }

        if (++v5 >= (char *)-[NSArray count](self->mSections, "count"))
          goto LABEL_13;
      }

    }
  }
LABEL_13:
  if (objc_msgSend(v3, "count"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v30, "row") + 1, objc_msgSend(v30, "section")));
    v15 = (NSIndexPath *)objc_msgSend(v14, "copy");
    v16 = self->mLastInsertedRow;
    self->mLastInsertedRow = v15;

    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController tableView](self, "tableView"));
    objc_msgSend(v17, "beginUpdates");
    objc_msgSend(v17, "insertRowsAtIndexPaths:withRowAnimation:", v3, 5);
    if (-[THNotesViewAnnotationRenderer doneRendering](self->mAnnotationRenderer, "doneRendering"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, -[NSArray count](self->mSections, "count")));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v18));
      objc_msgSend(v17, "deleteRowsAtIndexPaths:withRowAnimation:", v19, 5);

      WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
      objc_msgSend(WeakRetained, "tableViewController:renderingInProgress:", self, 0);

    }
    objc_msgSend(v17, "endUpdates");
    +[CATransaction commit](CATransaction, "commit");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController tableView](self, "tableView"));
    v22 = objc_msgSend(v21, "isEditing");

    if (v22)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v23 = v3;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(_QWORD *)v32 != v25)
              objc_enumerationMutation(v23);
            v27 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mSelectedNotes, "objectForKey:", v27));

            if (v28)
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController tableView](self, "tableView"));
              objc_msgSend(v29, "selectRowAtIndexPath:animated:scrollPosition:", v27, 0, 0);

            }
          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v24);
      }

    }
  }

}

- (BOOL)p_isTableViewInEditMode:(id)a3
{
  return objc_msgSend(a3, "isEditing");
}

- (void)startEditing
{
  NSMutableDictionary *mSelectedNotes;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;

  mSelectedNotes = self->mSelectedNotes;
  if (mSelectedNotes)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController startEditing]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"));
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 1069, CFSTR("expected nil value for '%s'"), "mSelectedNotes");

    mSelectedNotes = self->mSelectedNotes;
  }
  self->mSelectedNotes = 0;

  v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 10);
  v8 = self->mSelectedNotes;
  self->mSelectedNotes = v7;

}

- (void)paginationController:(id)a3 paginationCompleteStateChangedTo:(BOOL)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);

  if (WeakRetained)
    -[THNotesDetailTableViewController p_reload](self, "p_reload");
}

- (double)highlightWidthForAnnotationRenderer:(id)a3
{
  void *v4;
  void *v5;
  double Width;
  void *v7;
  double v8;
  THNotesDetailTableViewControllerDelegate **p_mDelegate;
  id WeakRetained;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  CGRect v17;
  CGRect v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController view](self, "view", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "safeAreaLayoutGuide"));
  objc_msgSend(v5, "layoutFrame");
  Width = CGRectGetWidth(v17);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController tableView](self, "tableView"));
  objc_msgSend(v7, "frame");
  v8 = CGRectGetWidth(v18);

  if (Width >= v8)
    Width = v8;
  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_mDelegate);
  objc_msgSend(WeakRetained, "highlightLeftInset");
  v12 = Width - v11;
  v13 = objc_loadWeakRetained((id *)p_mDelegate);
  objc_msgSend(v13, "highlightRightInset");
  v15 = v12 - v14;

  return v15;
}

- (double)editingHighlightWidthForAnnotationRenderer:(id)a3
{
  double v4;
  double v5;
  id WeakRetained;
  double v7;
  double v8;

  -[THNotesDetailTableViewController highlightWidthForAnnotationRenderer:](self, "highlightWidthForAnnotationRenderer:", a3);
  v5 = v4;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  objc_msgSend(WeakRetained, "highlightEditingWidthAdjustment");
  v8 = v5 - v7;

  return v8;
}

- (unint64_t)maxLinesForAnnotationRenderer:(id)a3
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v4 = objc_msgSend(WeakRetained, "maxLines");

  return (unint64_t)v4;
}

- (id)annotationRenderer:(id)a3 contentNodeForAnnotation:(id)a4
{
  THBookViewController **p_mBookViewController;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  p_mBookViewController = &self->mBookViewController;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_mBookViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "documentViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "documentRoot"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "annotationController"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentNodeForAnnotation:", v5));
  return v10;
}

- (id)annotationRenderer:(id)a3 storageForAnnotationLocation:(id)a4
{
  THBookViewController **p_mBookViewController;
  id v5;
  id WeakRetained;
  void *v7;

  if (a4)
  {
    p_mBookViewController = &self->mBookViewController;
    v5 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_mBookViewController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "storageForCFI:", v5));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)accessControllerForAnnotationRenderer:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "documentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "documentRoot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessController"));

  return v6;
}

- (void)annotationRenderer:(id)a3 didLoadContentNode:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;

  v5 = a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController annotationRenderer:didLoadContentNode:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"));
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 1132, CFSTR("This operation must only be performed on the main thread."));

  }
  if (!v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController annotationRenderer:didLoadContentNode:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"));
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 1133, CFSTR("invalid nil value for '%s'"), "contentNode");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  objc_msgSend(WeakRetained, "tableViewController:didLoadContentNode:", self, v5);

}

- (void)annotationRenderer:(id)a3 didRenderAnnotation:(id)a4 withResult:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  TSUNoCopyDictionary *mRenderedAnnotations;
  TSUNoCopyDictionary *v12;
  TSUNoCopyDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a4;
  v7 = a5;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController annotationRenderer:didRenderAnnotation:withResult:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"));
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 1140, CFSTR("This operation must only be performed on the main thread."));

  }
  if (!v24)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController annotationRenderer:didRenderAnnotation:withResult:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"));
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, v20, 1141, CFSTR("invalid nil value for '%s'"), "annotation");

    if (v7)
      goto LABEL_12;
LABEL_11:
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController annotationRenderer:didRenderAnnotation:withResult:]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"));
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, v23, 1142, CFSTR("invalid nil value for '%s'"), "renderedAnnotation");

    goto LABEL_12;
  }
  if (!v7)
    goto LABEL_11;
  mRenderedAnnotations = self->mRenderedAnnotations;
  if (!mRenderedAnnotations)
  {
    v12 = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v13 = self->mRenderedAnnotations;
    self->mRenderedAnnotations = v12;

    mRenderedAnnotations = self->mRenderedAnnotations;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TSUNoCopyDictionary objectForKey:](mRenderedAnnotations, "objectForKey:", v24));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController annotationRenderer:didRenderAnnotation:withResult:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"));
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 1151, CFSTR("already rendered this annotation"));

  }
  -[TSUNoCopyDictionary setObject:forUncopiedKey:](self->mRenderedAnnotations, "setObject:forUncopiedKey:", v7, v24);
  -[THNotesDetailTableViewController p_reloadFromBottom](self, "p_reloadFromBottom");
LABEL_12:

}

- (void)notesDetailTableViewHeaderView:(id)a3 selected:(BOOL)a4
{
  void *v6;
  id v7;
  char *v8;
  char *v9;
  char *v10;
  void *v11;
  NSMutableArray *mSectionSelections;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char *v20;
  void *v21;
  NSMutableArray *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;

  v27 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController tableView](self, "tableView"));
  if (-[THNotesDetailTableViewController p_isTableViewInEditMode:](self, "p_isTableViewInEditMode:", v6))
  {
    v7 = objc_msgSend(v27, "section");
    v8 = (char *)objc_msgSend(v6, "numberOfRowsInSection:", v7);
    v9 = v8;
    if (a4)
    {
      if ((uint64_t)v8 >= 1)
      {
        v10 = 0;
        do
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v10, v7));
          objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v11, 0);
          -[NSMutableDictionary removeObjectForKey:](self->mSelectedNotes, "removeObjectForKey:", v11);

          ++v10;
        }
        while (v9 != v10);
      }
      mSectionSelections = self->mSectionSelections;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
      -[NSMutableArray replaceObjectAtIndex:withObject:](mSectionSelections, "replaceObjectAtIndex:withObject:", v7, v13);

      v14 = objc_opt_class(THNotesDetailTableViewHeaderView);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "headerViewForSection:", v7));
      TSUDynamicCast(v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

      if (!v17)
        goto LABEL_14;
      v18 = v17;
      v19 = 0;
    }
    else
    {
      if ((uint64_t)v8 >= 1)
      {
        v20 = 0;
        do
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v20, v7));
          objc_msgSend(v6, "selectRowAtIndexPath:animated:scrollPosition:", v21, 0, 0);
          -[NSMutableDictionary setObject:forKey:](self->mSelectedNotes, "setObject:forKey:", v21, v21);

          ++v20;
        }
        while (v9 != v20);
      }
      v22 = self->mSectionSelections;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      -[NSMutableArray replaceObjectAtIndex:withObject:](v22, "replaceObjectAtIndex:withObject:", v7, v23);

      v24 = objc_opt_class(THNotesDetailTableViewHeaderView);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "headerViewForSection:", v7));
      TSUDynamicCast(v24, v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v26);

      if (!v17)
        goto LABEL_14;
      v18 = v17;
      v19 = 1;
    }
    objc_msgSend(v18, "setSelected:", v19);
LABEL_14:

    -[THNotesDetailTableViewController p_notifySelectionDidChange](self, "p_notifySelectionDidChange");
  }

}

- (id)_thTableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v12;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController p_annotationAtIndexPath:](self, "p_annotationAtIndexPath:", a5, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationDragItemProvider itemProviderWithAnnotation:propertyProvider:](AEAnnotationDragItemProvider, "itemProviderWithAnnotation:propertyProvider:", v6, self));
  v8 = objc_msgSend(objc_alloc((Class)NSItemProvider), "initWithObject:", v7);
  v9 = objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v8);
  v12 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  return v10;
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return -[THNotesDetailTableViewController _thTableView:itemsForBeginningDragSession:atIndexPath:](self, "_thTableView:itemsForBeginningDragSession:atIndexPath:", a3, a4, a5);
}

- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  return -[THNotesDetailTableViewController _thTableView:itemsForBeginningDragSession:atIndexPath:](self, "_thTableView:itemsForBeginningDragSession:atIndexPath:", a3, a4, a5, a6.x, a6.y);
}

- (void)_renderAnnotationsForTheme:(id)a3
{
  void *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "documentViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "documentRoot"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "themeProvider"));

  if (v9)
  {
    v10 = (unint64_t)objc_msgSend(v9, "annotationPageTheme");
    if (v10 <= 0x10 && ((0x1FFEFu >> v10) & 1) != 0)
      v5 = (id)qword_314938[v10];
  }
  -[THNotesViewAnnotationRenderer renderAnnotations:withUserInterfaceStyle:](self->mAnnotationRenderer, "renderAnnotations:withUserInterfaceStyle:", v11, v5);

}

- (id)p_annotationAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->mSections, "objectAtIndex:", objc_msgSend(v4, "section")));
    v7 = objc_msgSend(v5, "row");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notes"));
    v9 = objc_msgSend(v8, "count");

    if (v7 >= v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesDetailTableViewController p_annotationAtIndexPath:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesDetailTableViewController.m"));
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 1288, CFSTR("notes index out of range"));

    }
    v13 = objc_msgSend(v5, "row");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notes"));
    v15 = objc_msgSend(v14, "count");

    if (v13 >= v15)
    {
      v17 = 0;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notes"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v5, "row")));

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)p_makeViewForAnnotationAtIndexPath:(id)a3 cell:(id)a4
{
  id v6;
  id v7;
  THNotesDetailTableViewCellController *v8;
  THNotesDetailTableViewControllerDelegate **p_mDelegate;
  id WeakRetained;
  THNotesDetailTableViewCellController *v11;
  UINib *mTableCellNIB;
  uint64_t v13;
  void *v14;
  UINib *v15;
  UINib *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  unsigned __int8 v31;
  __CFString *v32;
  id v33;
  double v34;
  double v35;
  char *v36;
  void *v37;
  void *v38;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  v6 = a3;
  v7 = a4;
  v8 = [THNotesDetailTableViewCellController alloc];
  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v11 = -[THNotesDetailTableViewCellController initWithSizingDelegate:](v8, "initWithSizingDelegate:", WeakRetained);

  mTableCellNIB = self->mTableCellNIB;
  if (!mTableCellNIB)
  {
    v13 = THBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (UINib *)objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", CFSTR("THNotesDetailTableViewCellController"), v14));
    v16 = self->mTableCellNIB;
    self->mTableCellNIB = v15;

    mTableCellNIB = self->mTableCellNIB;
  }
  v17 = -[UINib instantiateWithOwner:options:](mTableCellNIB, "instantiateWithOwner:options:", v11, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController p_annotationAtIndexPath:](self, "p_annotationAtIndexPath:", v6));
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->mSections, "objectAtIndex:", objc_msgSend(v6, "section")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TSUNoCopyDictionary objectForKey:](self->mRenderedAnnotations, "objectForKey:", v18));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesDetailTableViewController tableView](self, "tableView"));
    objc_msgSend(v43, "bounds");
    v22 = v21;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "highlightLayer"));
    objc_msgSend(v20, "highlightTextFrame");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "editingHighlightLayer"));
    v31 = objc_msgSend(v18, "annotationIsOrphan");
    v45 = v7;
    if ((v31 & 1) != 0)
    {
      v32 = &stru_43D7D8;
    }
    else
    {
      v41 = objc_loadWeakRetained((id *)&self->mBookViewController);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "pageNumberStringForAnnotation:", v18));
    }
    v33 = objc_msgSend(v6, "row");
    if (v33)
    {
      v34 = 0.0;
    }
    else
    {
      v40 = objc_loadWeakRetained((id *)p_mDelegate);
      objc_msgSend(v40, "firstNoteBelowSectionAdjustment");
      v34 = v35;
    }
    v36 = (char *)objc_msgSend(v6, "row");
    v37 = v19;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "notes"));
    objc_msgSend(v45, "populateWithCellController:annotation:cellWidth:highlightLayer:highlightTextFrame:editingHighlightLayer:pageNumberString:topAdjustment:showDivider:", v11, v18, v42, v44, v32, v36 < (char *)objc_msgSend(v38, "count") - 1, v22, v24, v26, v28, v30, v34);

    if (v33)
    {
      if ((v31 & 1) != 0)
      {
LABEL_13:

        v7 = v45;
        goto LABEL_14;
      }
    }
    else
    {

      if ((v31 & 1) != 0)
        goto LABEL_13;
    }

    goto LABEL_13;
  }
LABEL_14:

  return v11;
}

- (id)bookTitle
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bookDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookTitle"));

  return v4;
}

- (id)author
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bookDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookAuthor"));

  return v4;
}

- (id)storeURL
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bookDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storeID"));

  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AEUserPublishing sharedInstance](AEUserPublishing, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeShortURLForStoreId:dataSource:", v4, 0));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pageNumberStringForAnnotation:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  v4 = TSUProtocolCast(&OBJC_PROTOCOL___THAnnotation, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "annotationIsOrphan") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mBookViewController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pageNumberStringForAnnotation:", v6));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (THNotesDetailTableViewControllerDelegate)delegate
{
  return (THNotesDetailTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->mDelegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->mDelegate, a3);
}

- (THBookViewController)bookViewController
{
  return (THBookViewController *)objc_loadWeakRetained((id *)&self->mBookViewController);
}

- (NSMutableDictionary)selectedNotes
{
  return self->mSelectedNotes;
}

- (void)setSelectedNotes:(id)a3
{
  objc_storeStrong((id *)&self->mSelectedNotes, a3);
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (BOOL)inSizeTransition
{
  return self->_inSizeTransition;
}

- (void)setInSizeTransition:(BOOL)a3
{
  self->_inSizeTransition = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->mBookViewController);
  objc_destroyWeak((id *)&self->mDelegate);
  objc_storeStrong((id *)&self->mLastInsertedRow, 0);
  objc_storeStrong((id *)&self->mCellHeights, 0);
  objc_storeStrong((id *)&self->mRenderedAnnotations, 0);
  objc_storeStrong((id *)&self->mAnnotationRenderer, 0);
  objc_storeStrong((id *)&self->mSelectedNotes, 0);
  objc_storeStrong((id *)&self->mSectionSelections, 0);
  objc_storeStrong((id *)&self->mSections, 0);
  objc_storeStrong((id *)&self->mTableCellNIB, 0);
}

@end

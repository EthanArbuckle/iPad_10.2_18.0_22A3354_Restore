@implementation THGlossaryDefinitionsViewController

- (void)p_initCommon
{
  self->mRecycledEntries = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  self->mScrollTargetEntryIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (THGlossaryDefinitionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  THGlossaryDefinitionsViewController *v4;
  THGlossaryDefinitionsViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THGlossaryDefinitionsViewController;
  v4 = -[THGlossaryDefinitionsViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[THGlossaryDefinitionsViewController p_initCommon](v4, "p_initCommon");
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[THGlossaryDefinitionsViewController setDidLayoutBlock:](self, "setDidLayoutBlock:", 0);
  -[NSMutableSet makeObjectsPerformSelector:](self->mRecycledEntries, "makeObjectsPerformSelector:", "teardown");
  -[NSMutableSet removeAllObjects](self->mRecycledEntries, "removeAllObjects");

  self->mScrollView = 0;
  self->mEntryViewControllers = 0;

  self->mEntryIndex = 0;
  self->mRecycledEntries = 0;

  self->_theme = 0;
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryDefinitionsViewController;
  -[THGlossaryDefinitionsViewController dealloc](&v3, "dealloc");
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THGlossaryDefinitionsViewController;
  -[THGlossaryDefinitionsViewController awakeFromNib](&v3, "awakeFromNib");
  -[THGlossaryDefinitionsViewController p_initCommon](self, "p_initCommon");
}

- (CGRect)p_definitionViewFrame
{
  THGlossaryDefinitionsViewControllerDelegate *mDelegate;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  mDelegate = self->mDelegate;
  if (mDelegate)
  {
    objc_msgSend(-[THGlossaryDefinitionsViewControllerDelegate glossaryEntryLayoutStyleProvider](mDelegate, "glossaryEntryLayoutStyleProvider"), "glossaryEntryLayoutViewFrame");
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)p_contentFrameForEntryIndex:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[THGlossaryDefinitionsViewController p_definitionViewFrame](self, "p_definitionViewFrame");
  v7 = (v6 + 1.0) * (double)a3;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v7;
  result.origin.x = v4;
  return result;
}

- (int64_t)p_entryIndexForContentFrame:(CGRect)a3
{
  double y;
  double v4;

  y = a3.origin.y;
  -[THGlossaryDefinitionsViewController p_contentFrameForEntryIndex:](self, "p_contentFrameForEntryIndex:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return (uint64_t)(y / v4 + 0.5);
}

- (CGRect)p_scrollViewFrameForPaging:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = a3;
  -[THGlossaryDefinitionsViewController p_contentFrameForEntryIndex:](self, "p_contentFrameForEntryIndex:", 0);
  v7 = v6;
  v9 = v8;
  if (v3)
  {
    -[THGlossaryDefinitionsViewController p_contentFrameForEntryIndex:](self, "p_contentFrameForEntryIndex:", 1);
    v11 = v10;
  }
  else
  {
    v11 = v5;
  }
  objc_msgSend(-[THGlossaryDefinitionsViewController view](self, "view"), "safeAreaInsets");
  v13 = v12;
  v14 = v7;
  v15 = v9;
  v16 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)layoutScrollView
{
  int64_t v3;
  id v4;
  void *v5;
  id v6;
  id i;
  double v8;
  double v9;

  v3 = -[THGlossaryDefinitionsViewController p_currentEntryIndex](self, "p_currentEntryIndex");
  v4 = -[TSUIntegerKeyDictionary keyEnumerator](self->mEntryViewControllers, "keyEnumerator");
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "nextKey");
    if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v6; i != (id)0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v5, "nextKey"))
        -[THGlossaryDefinitionsViewController p_releaseControllerForIndex:](self, "p_releaseControllerForIndex:", i);
    }
  }
  -[THGlossaryDefinitionsViewController p_scrollViewFrameForPaging:](self, "p_scrollViewFrameForPaging:", 1);
  -[UIScrollView setFrame:](self->mScrollView, "setFrame:");
  -[UIScrollView frame](self->mScrollView, "frame");
  v9 = v8;
  -[THGlossaryDefinitionsViewController p_contentFrameForEntryIndex:](self, "p_contentFrameForEntryIndex:", -[THGlossaryIndex numberOfEntries](self->mEntryIndex, "numberOfEntries"));
  -[UIScrollView setContentSize:](self->mScrollView, "setContentSize:", v9);
  -[THGlossaryDefinitionsViewController p_contentFrameForEntryIndex:](self, "p_contentFrameForEntryIndex:", v3);
  -[THGlossaryDefinitionsViewController p_updateForContentFrame:](self, "p_updateForContentFrame:");
  -[THGlossaryDefinitionsViewController p_showEntry:animated:](self, "p_showEntry:animated:", -[THGlossaryIndex entryAtIndex:](self->mEntryIndex, "entryAtIndex:", v3), 0);
}

- (void)loadView
{
  id v3;
  id v4;
  UIScrollView *v5;

  v3 = +[UIColor bc_booksBackground](UIColor, "bc_booksBackground");
  -[THGlossaryDefinitionsViewController setView:](self, "setView:", objc_alloc_init((Class)UIView));
  objc_msgSend(-[THGlossaryDefinitionsViewController view](self, "view"), "setBackgroundColor:", v3);
  objc_msgSend(-[THGlossaryDefinitionsViewController view](self, "view"), "setClipsToBounds:", 1);
  v4 = objc_alloc((Class)UIScrollView);
  -[THGlossaryDefinitionsViewController p_scrollViewFrameForPaging:](self, "p_scrollViewFrameForPaging:", 1);
  v5 = (UIScrollView *)objc_msgSend(v4, "initWithFrame:");
  self->mScrollView = v5;
  -[UIScrollView setContentInsetAdjustmentBehavior:](v5, "setContentInsetAdjustmentBehavior:", 2);
  -[UIScrollView setScrollEnabled:](self->mScrollView, "setScrollEnabled:", 1);
  -[UIScrollView setClipsToBounds:](self->mScrollView, "setClipsToBounds:", 0);
  -[UIScrollView setBackgroundColor:](self->mScrollView, "setBackgroundColor:", v3);
  -[UIScrollView setDelegate:](self->mScrollView, "setDelegate:", self);
  -[UIScrollView setPagingEnabled:](self->mScrollView, "setPagingEnabled:", 1);
  objc_msgSend(-[THGlossaryDefinitionsViewController view](self, "view"), "addSubview:", self->mScrollView);
}

- (void)didReceiveMemoryWarning
{
  id v3;
  id v4;
  id v5;
  int64_t v6;
  id v7;
  id v8;
  id i;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = -[TSUIntegerKeyDictionary count](self->mEntryViewControllers, "count");
  if ((unint64_t)v3 >= 2)
  {
    v4 = v3;
    v5 = -[TSUIntegerKeyDictionary keyEnumerator](self->mEntryViewControllers, "keyEnumerator");
    v6 = -[THGlossaryDefinitionsViewController p_currentEntryIndex](self, "p_currentEntryIndex");
    v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v4);
    v8 = objc_msgSend(v5, "nextKey");
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v8; i != (id)0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v5, "nextKey"))
      {
        if (i != (id)v6)
        {
          v10 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInteger:", i);
          objc_msgSend(v7, "addObject:", v10);

        }
      }
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v7);
          -[THGlossaryDefinitionsViewController p_releaseControllerForIndex:](self, "p_releaseControllerForIndex:", (int)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j), "intValue"));
        }
        v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
  -[NSMutableSet makeObjectsPerformSelector:](self->mRecycledEntries, "makeObjectsPerformSelector:", "teardown");
  -[NSMutableSet removeAllObjects](self->mRecycledEntries, "removeAllObjects");
  v15.receiver = self;
  v15.super_class = (Class)THGlossaryDefinitionsViewController;
  -[THGlossaryDefinitionsViewController didReceiveMemoryWarning](&v15, "didReceiveMemoryWarning");
}

- (void)setTheme:(id)a3
{
  id v5;

  if ((-[IMTheme isEqual:](self->_theme, "isEqual:") & 1) == 0)
  {
    v5 = a3;

    self->_theme = (IMTheme *)a3;
    -[THGlossaryDefinitionsViewController _stylizeForTheme](self, "_stylizeForTheme");
  }
}

- (void)_stylizeForTheme
{
  id v3;

  v3 = -[IMTheme backgroundColorForTraitEnvironment:](-[THGlossaryDefinitionsViewController theme](self, "theme"), "backgroundColorForTraitEnvironment:", self);
  objc_msgSend(-[THGlossaryDefinitionsViewController view](self, "view"), "setBackgroundColor:", v3);
  -[UIScrollView setBackgroundColor:](-[THGlossaryDefinitionsViewController scrollView](self, "scrollView"), "setBackgroundColor:", v3);
  -[THGlossaryDefinitionsViewController p_loadEntryAtIndex:scrollLocation:](self, "p_loadEntryAtIndex:scrollLocation:", -[THGlossaryDefinitionsViewController p_currentEntryIndex](self, "p_currentEntryIndex"), 0);
}

- (void)p_recycleEntry:(id)a3
{
  _QWORD v5[6];

  objc_msgSend(a3, "viewWillDisappear:", 0);
  objc_msgSend(objc_msgSend(a3, "view"), "removeFromSuperview");
  objc_msgSend(a3, "viewDidDisappear:", 0);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_AE90C;
  v5[3] = &unk_428E88;
  v5[4] = self;
  v5[5] = a3;
  objc_msgSend(a3, "unloadEntryOnComplete:", v5);
}

- (void)p_releaseControllerForIndex:(int64_t)a3
{
  id v5;

  v5 = -[TSUIntegerKeyDictionary objectForKey:](self->mEntryViewControllers, "objectForKey:");
  -[TSUIntegerKeyDictionary removeObjectForKey:](self->mEntryViewControllers, "removeObjectForKey:", a3);
  -[THGlossaryDefinitionsViewController p_recycleEntry:](self, "p_recycleEntry:", v5);

}

- (id)p_dequeueRecycledEntryController
{
  id v3;
  void *v4;
  id v5;

  v3 = -[NSMutableSet anyObject](self->mRecycledEntries, "anyObject");
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    -[NSMutableSet removeObject:](self->mRecycledEntries, "removeObject:", v4);
  }
  return v4;
}

- (id)p_createGlossaryEntryViewController
{
  THGlossaryEntryViewController *v3;

  v3 = (THGlossaryEntryViewController *)-[THGlossaryDefinitionsViewController p_dequeueRecycledEntryController](self, "p_dequeueRecycledEntryController");
  if (!v3)
  {
    v3 = -[THGlossaryEntryViewController initWithDocumentRoot:bookNavigator:]([THGlossaryEntryViewController alloc], "initWithDocumentRoot:bookNavigator:", -[THGlossaryController documentRoot](-[THGlossaryDefinitionsViewController glossaryController](self, "glossaryController"), "documentRoot"), -[THGlossaryDefinitionsViewControllerDelegate bookNavigator](-[THGlossaryDefinitionsViewController delegate](self, "delegate"), "bookNavigator"));
    -[THGlossaryEntryViewController setGlossaryController:](v3, "setGlossaryController:", -[THGlossaryDefinitionsViewController glossaryController](self, "glossaryController"));
    -[THGlossaryEntryViewController setModalViewControllerProvider:](v3, "setModalViewControllerProvider:", -[THGlossaryDefinitionsViewControllerDelegate modalViewControllerProviderForGlossaryDefinitionsViewController:](-[THGlossaryDefinitionsViewController delegate](self, "delegate"), "modalViewControllerProviderForGlossaryDefinitionsViewController:", self));
    -[THGlossaryEntryViewController setLinkHandler:](v3, "setLinkHandler:", -[THGlossaryDefinitionsViewController glossaryViewController](self, "glossaryViewController"));
    -[THGlossaryEntryViewController setTheme:](v3, "setTheme:", -[THGlossaryDefinitionsViewController theme](self, "theme"));
  }
  return v3;
}

- (id)p_layoutStyleProvider
{
  return -[THGlossaryDefinitionsViewControllerDelegate glossaryEntryLayoutStyleProvider](self->mDelegate, "glossaryEntryLayoutStyleProvider");
}

- (void)p_loadEntryAtIndex:(int64_t)a3 scrollLocation:(int)a4
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[6];
  int v15;

  v7 = -[THGlossaryIndex entryAtIndex:](self->mEntryIndex, "entryAtIndex:");
  if (v7)
  {
    v8 = v7;
    v9 = -[TSUIntegerKeyDictionary objectForKey:](self->mEntryViewControllers, "objectForKey:", a3);
    if (!v9)
    {
      v9 = -[THGlossaryDefinitionsViewController p_createGlossaryEntryViewController](self, "p_createGlossaryEntryViewController");
      -[TSUIntegerKeyDictionary setObject:forKey:](self->mEntryViewControllers, "setObject:forKey:", v9, a3);

      -[THGlossaryDefinitionsViewController p_contentFrameForEntryIndex:](self, "p_contentFrameForEntryIndex:", a3);
      objc_msgSend(objc_msgSend(v9, "view"), "setFrame:", v10, v11, v12, v13);
      objc_msgSend(v9, "viewWillAppear:", 0);
      -[UIScrollView addSubview:](self->mScrollView, "addSubview:", objc_msgSend(v9, "view"));
      objc_msgSend(v9, "viewDidAppear:", 0);
    }
    objc_msgSend(v9, "setTheme:", -[THGlossaryDefinitionsViewController theme](self, "theme"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_AEC30;
    v14[3] = &unk_428EB0;
    v14[4] = self;
    v14[5] = v9;
    v15 = a4;
    objc_msgSend(v9, "loadEntry:withLayoutStyleProvider:onComplete:", v8, -[THGlossaryDefinitionsViewController p_layoutStyleProvider](self, "p_layoutStyleProvider"), v14);
  }
}

- (void)p_updateForContentFrame:(CGRect)a3
{
  int64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  int64_t v9;
  int64_t v10;

  v4 = -[THGlossaryDefinitionsViewController p_entryIndexForContentFrame:](self, "p_entryIndexForContentFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[THGlossaryDefinitionsViewController p_loadEntryAtIndex:scrollLocation:](self, "p_loadEntryAtIndex:scrollLocation:", v4, 0);
  -[THGlossaryDefinitionsViewController p_loadEntryAtIndex:scrollLocation:](self, "p_loadEntryAtIndex:scrollLocation:");
  -[THGlossaryDefinitionsViewController p_loadEntryAtIndex:scrollLocation:](self, "p_loadEntryAtIndex:scrollLocation:");
  v5 = -[TSUIntegerKeyDictionary keyEnumerator](self->mEntryViewControllers, "keyEnumerator");
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "nextKey");
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = v7;
      v9 = v4 - 2;
      v10 = v4 + 2;
      do
      {
        if ((uint64_t)v8 < v9 || (uint64_t)v8 > v10)
          -[THGlossaryDefinitionsViewController p_releaseControllerForIndex:](self, "p_releaseControllerForIndex:");
        v8 = objc_msgSend(v6, "nextKey");
      }
      while (v8 != (id)0x7FFFFFFFFFFFFFFFLL);
    }
  }
}

- (int64_t)p_currentEntryIndex
{
  double v3;
  double v4;
  double v5;

  -[UIScrollView bounds](self->mScrollView, "bounds");
  if (v3 == 0.0)
    v4 = 1.0;
  else
    v4 = v3;
  -[UIScrollView contentOffset](self->mScrollView, "contentOffset");
  return (uint64_t)(v5 / v4);
}

- (void)p_showEntry:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  int64_t v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  _BOOL4 v16;
  double v17;
  double v18;
  uint64_t v19;
  int64_t v20;

  v4 = a4;
  v7 = -[THGlossaryDefinitionsViewController p_currentEntryIndex](self, "p_currentEntryIndex");
  v8 = -[THGlossaryIndex indexForEntry:](self->mEntryIndex, "indexForEntry:", a3);
  -[THGlossaryDefinitionsViewController p_contentFrameForEntryIndex:](self, "p_contentFrameForEntryIndex:", v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[THGlossaryDefinitionsViewController p_updateForContentFrame:](self, "p_updateForContentFrame:");
  v15 = v7 - v8;
  if (v7 - v8 < 0)
    v15 = v8 - v7;
  v16 = v15 < 3;
  -[UIScrollView frame](self->mScrollView, "frame");
  v18 = v17;
  v19 = v16 & v4;
  v20 = 0x7FFFFFFFFFFFFFFFLL;
  if ((_DWORD)v19)
    v20 = v8;
  self->mScrollTargetEntryIndex = v20;
  objc_msgSend(-[TSUIntegerKeyDictionary objectForKey:](self->mEntryViewControllers, "objectForKey:", v8), "scrollToLocation:animated:", 1, v19);
  -[UIScrollView scrollRectToVisible:animated:](self->mScrollView, "scrollRectToVisible:animated:", v19, v10, v12, v14, v18);
}

- (void)displayIndex:(id)a3 withEntry:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;
  _QWORD v24[7];
  BOOL v25;
  _QWORD v26[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v5 = a5;
  if (objc_msgSend(-[THGlossaryDefinitionsViewController view](self, "view"), "superview"))
  {
    if (!-[THGlossaryIndex isEqual:](self->mEntryIndex, "isEqual:", a3))
    {
      v22 = a4;

      self->mEntryIndex = (THGlossaryIndex *)a3;
      v23 = objc_msgSend(a3, "numberOfEntries");
      v9 = objc_msgSend(objc_alloc((Class)TSUIntegerKeyDictionary), "initWithCapacity:", v23);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v10 = -[TSUIntegerKeyDictionary valueEnumerator](self->mEntryViewControllers, "valueEnumerator");
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
            v15 = objc_msgSend(a3, "indexForEntry:", objc_msgSend(v14, "entry"));
            if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              -[THGlossaryDefinitionsViewController p_recycleEntry:](self, "p_recycleEntry:", v14);
            }
            else
            {
              objc_msgSend(v9, "setObject:forKey:", v14, v15);
              -[THGlossaryDefinitionsViewController p_contentFrameForEntryIndex:](self, "p_contentFrameForEntryIndex:", v15);
              objc_msgSend(objc_msgSend(v14, "view"), "setFrame:", v16, v17, v18, v19);
            }
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v11);
      }

      self->mEntryViewControllers = (TSUIntegerKeyDictionary *)v9;
      -[UIScrollView frame](self->mScrollView, "frame");
      v21 = v20;
      -[THGlossaryDefinitionsViewController p_contentFrameForEntryIndex:](self, "p_contentFrameForEntryIndex:", v23);
      -[UIScrollView setContentSize:](self->mScrollView, "setContentSize:", v21);
      v5 = 0;
      a4 = v22;
    }
    -[THGlossaryDefinitionsViewController p_showEntry:animated:](self, "p_showEntry:animated:", a4, v5);
  }
  else
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3052000000;
    v26[3] = sub_AF180;
    v26[4] = sub_AF190;
    v26[5] = self;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_AF19C;
    v24[3] = &unk_428ED8;
    v24[5] = a4;
    v24[6] = v26;
    v24[4] = a3;
    v25 = v5;
    -[THGlossaryDefinitionsViewController setDidLayoutBlock:](self, "setDidLayoutBlock:", v24);
    _Block_object_dispose(v26, 8);
  }
}

- (id)displayedEntry
{
  return -[THGlossaryIndex entryAtIndex:](self->mEntryIndex, "entryAtIndex:", -[THGlossaryDefinitionsViewController p_currentEntryIndex](self, "p_currentEntryIndex"));
}

- (void)unload
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  NSMutableSet *mRecycledEntries;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = -[TSUIntegerKeyDictionary valueEnumerator](self->mEntryViewControllers, "valueEnumerator");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        -[THGlossaryDefinitionsViewController p_recycleEntry:](self, "p_recycleEntry:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  self->mEntryViewControllers = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  mRecycledEntries = self->mRecycledEntries;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mRecycledEntries, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(mRecycledEntries);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)j), "teardown");
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mRecycledEntries, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }
  -[NSMutableSet removeAllObjects](self->mRecycledEntries, "removeAllObjects");

  self->mEntryIndex = 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  -[UIScrollView bounds](self->mScrollView, "bounds", a3);
  -[THGlossaryDefinitionsViewController p_updateForContentFrame:](self, "p_updateForContentFrame:");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  self->mScrollTargetEntryIndex = 0x7FFFFFFFFFFFFFFFLL;
  -[THGlossaryDefinitionsViewControllerDelegate didScrollToEntry:](self->mDelegate, "didScrollToEntry:", -[THGlossaryDefinitionsViewController displayedEntry](self, "displayedEntry", a3));
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THGlossaryDefinitionsViewController;
  -[THGlossaryDefinitionsViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[THGlossaryDefinitionsViewController layoutScrollView](self, "layoutScrollView");
  if (-[THGlossaryDefinitionsViewController didLayoutBlock](self, "didLayoutBlock"))
  {
    (*((void (**)(void))-[THGlossaryDefinitionsViewController didLayoutBlock](self, "didLayoutBlock") + 2))();
    -[THGlossaryDefinitionsViewController setDidLayoutBlock:](self, "setDidLayoutBlock:", 0);
  }
}

- (THGlossaryController)glossaryController
{
  return self->mGlossaryController;
}

- (void)setGlossaryController:(id)a3
{
  self->mGlossaryController = (THGlossaryController *)a3;
}

- (THGlossaryDefinitionsViewControllerDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THGlossaryDefinitionsViewControllerDelegate *)a3;
}

- (THGlossaryViewController)glossaryViewController
{
  return self->mGlossaryViewController;
}

- (void)setGlossaryViewController:(id)a3
{
  self->mGlossaryViewController = (THGlossaryViewController *)a3;
}

- (UIScrollView)scrollView
{
  return self->mScrollView;
}

- (IMTheme)theme
{
  return self->_theme;
}

- (id)didLayoutBlock
{
  return self->_didLayoutBlock;
}

- (void)setDidLayoutBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

@end

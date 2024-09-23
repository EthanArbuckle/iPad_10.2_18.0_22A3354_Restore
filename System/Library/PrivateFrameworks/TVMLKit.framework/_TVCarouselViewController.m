@implementation _TVCarouselViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_TVCarouselViewController;
  -[_TVCarouselViewController dealloc](&v4, sel_dealloc);
}

- (void)_updateHeaderView
{
  void *v3;
  void *v4;
  id v5;

  -[_TVCarouselView headerView](self->_carouselView, "headerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_viewFromElement:existingView:", self->_headerElement, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVCarouselView setHeaderView:](self->_carouselView, "setHeaderView:", v4);
}

- (void)loadView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  TVMLCarouselView *v12;
  _TVCarouselView *carouselView;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = -[TVMLCarouselView initWithFrame:]([TVMLCarouselView alloc], "initWithFrame:", v5, v7, v9, v11);
  carouselView = self->_carouselView;
  self->_carouselView = &v12->super;

  -[_TVCarouselView setDataSource:](self->_carouselView, "setDataSource:", self);
  -[_TVCarouselView setDelegate:](self->_carouselView, "setDelegate:", self);
  -[_TVCarouselView setAutoscrollInterval:](self->_carouselView, "setAutoscrollInterval:", 10.0);
  -[_TVCarouselViewController setView:](self, "setView:", self->_carouselView);
  -[_TVCarouselViewController _registerCellClasses](self, "_registerCellClasses");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__applicationWillResignActive_, *MEMORY[0x24BDF75D8], 0);

  v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__selectButtonAction_);
  objc_msgSend(v17, "setAllowedPressTypes:", &unk_24EBCD448);
  -[_TVCarouselView addGestureRecognizer:](self->_carouselView, "addGestureRecognizer:", v17);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__playButtonAction_);
  objc_msgSend(v16, "setAllowedPressTypes:", &unk_24EBCD460);
  -[_TVCarouselView addGestureRecognizer:](self->_carouselView, "addGestureRecognizer:", v16);
  -[_TVCarouselViewController _updateHeaderView](self, "_updateHeaderView");
  -[_TVCarouselViewController _updateAutoScrollInterval](self, "_updateAutoScrollInterval");
  -[_TVCarouselViewController _updateLayoutAndReload](self, "_updateLayoutAndReload");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVCarouselViewController;
  -[_TVCarouselViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_flags.didAppear = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVCarouselViewController;
  -[_TVCarouselViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[_TVCarouselViewController _cancelImpressionsUpdate](self, "_cancelImpressionsUpdate");
}

- (CGSize)viewSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_TVCarouselViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)preferredFocusEnvironments
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (self->_carouselView)
  {
    v4[0] = self->_carouselView;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v2;
}

- (BOOL)_needsDefaultCarouselCells
{
  return -[TVCarouselLayout layoutType](self->_carouselLayout, "layoutType") == 0;
}

- (unint64_t)numberOfItemsInCarouselView:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[IKCollectionElement sections](self->_collectionElement, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfItems");

  return v5;
}

- (void)_registerCellClasses
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[IKCollectionElement sections](self->_collectionElement, "sections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(obj);
        v18 = v4;
        v5 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v4);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v5, "prototypes");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v20;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v20 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
              +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "_collectionViewCellClassForElement:", v11);

              objc_msgSend(v11, "elementName");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v3, "containsObject:", v14) & 1) == 0)
              {
                objc_msgSend(v3, "addObject:", v14);
                -[_TVCarouselView registerClass:forCellWithReuseIdentifier:](self->_carouselView, "registerClass:forCellWithReuseIdentifier:", v13, v14);
              }

              ++v10;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v8);
        }

        v4 = v18 + 1;
      }
      while (v18 + 1 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v17);
  }

}

- (id)carouselView:(id)a3 cellForItemAtIndex:(unint64_t)a4
{
  IKCollectionElement *collectionElement;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  collectionElement = self->_collectionElement;
  v7 = a3;
  -[IKCollectionElement sections](collectionElement, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "elementForItemAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "elementName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndex:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "transferLayoutStylesFromElement:", v10);
  v13 = (void *)MEMORY[0x24BDD1968];
  -[TVCarouselLayout cellPadding](self->_carouselLayout, "cellPadding");
  objc_msgSend(v13, "valueWithUIEdgeInsets:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forTVViewStyle:", v14, CFSTR("padding"));

  objc_msgSend(v12, "tv_setAssociatedIKViewElement:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "setSelectSubviews:", 0);
    objc_msgSend(v12, "setDelegate:", self);
  }
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setCenterGrowth:", -[TVCarouselLayout layoutType](self->_carouselLayout, "layoutType") == 0);
  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "_viewFromElement:layout:existingView:", v10, v15, v12);

  return v12;
}

- (void)carouselViewDidScroll:(id)a3
{
  if (self->_flags.didAppear)
    -[_TVCarouselViewController _updateImpressions](self, "_updateImpressions", a3);
}

- (void)carouselView:(id)a3 didFocusItemAtIndex:(unint64_t)a4
{
  id v6;

  objc_msgSend(a3, "focusedCell");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVCarouselViewController _dispatchEvent:forItemAtIndex:cell:](self, "_dispatchEvent:forItemAtIndex:cell:", CFSTR("highlight"), a4, v6);

}

- (void)carouselView:(id)a3 willDisplayCell:(id)a4 forItemAtIndex:(unint64_t)a5
{
  void *v5;
  id v6;

  v5 = (void *)*MEMORY[0x24BDF74F8];
  v6 = a4;
  objc_msgSend(v6, "tv_setDisplayed:", objc_msgSend(v5, "applicationState") == 0);

}

- (void)carouselView:(id)a3 willDisplayItemAtIndex:(unint64_t)a4
{
  void *v5;
  id v6;

  -[IKCollectionElement sections](self->_collectionElement, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "loadIndex:", a4);
}

- (void)carouselView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndex:(unint64_t)a5
{
  objc_msgSend(a4, "tv_setDisplayed:", 0);
}

- (void)carouselView:(id)a3 didEndDisplayingItemAtIndex:(unint64_t)a4
{
  void *v5;
  id v6;

  if (!self->_flags.indexesDirty)
  {
    -[IKCollectionElement sections](self->_collectionElement, "sections", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "unloadIndex:", a4);
  }
}

- (void)carouselView:(id)a3 didSelectItemAtIndex:(unint64_t)a4
{
  id v6;

  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a3, "focusedCell");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_TVCarouselViewController _dispatchEvent:forItemAtIndex:cell:](self, "_dispatchEvent:forItemAtIndex:cell:", CFSTR("select"), a4, v6);

  }
}

- (void)_updateImpressions
{
  void *v3;
  double v4;
  double v5;

  -[IKCollectionElement appDocument](self->_collectionElement, "appDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "impressionThreshold");
  v5 = v4;

  -[_TVCarouselViewController _cancelImpressionsUpdate](self, "_cancelImpressionsUpdate");
  if (v5 > 0.0)
    -[_TVCarouselViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__recordImpressionsForVisibleView, 0, v5);
}

- (void)_cancelImpressionsUpdate
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__recordImpressionsForVisibleView, 0);
}

- (void)_recordImpressionsForVisibleView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_TVCarouselViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IKCollectionElement appDocument](self->_collectionElement, "appDocument");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_TVCarouselViewController impressionableElementsContainedInDocument:](self, "impressionableElementsContainedInDocument:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      objc_msgSend(v6, "recordImpressionsForViewElements:", v5);

  }
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IKCollectionElement appDocument](self->_collectionElement, "appDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
  {
    -[_TVCarouselView subviews](self->_carouselView, "subviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "visibleCells");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_TVCarouselViewController isViewLoaded](self, "isViewLoaded"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "tv_impressionableElementsForDocument:", v4, (_QWORD)v19);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObjectsFromArray:", v16);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v13);
      }

    }
    if (objc_msgSend(v10, "count", (_QWORD)v19))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_playButtonAction:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusedView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v8)
  {
    while (1)
    {
      v9 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v9, "superview");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
      if (!v6)
        goto LABEL_7;
    }
    v7 = -[_TVCarouselView indexForCell:](self->_carouselView, "indexForCell:", v9);
    v5 = v9;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[_TVCarouselViewController _dispatchEvent:forItemAtIndex:cell:](self, "_dispatchEvent:forItemAtIndex:cell:", CFSTR("play"), v7, v9);
      v5 = v9;
    }
  }
LABEL_7:

}

- (void)_selectButtonAction:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusedView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v8)
  {
    while (1)
    {
      v9 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v9, "superview");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
      if (!v6)
        goto LABEL_7;
    }
    v7 = -[_TVCarouselView indexForCell:](self->_carouselView, "indexForCell:", v9);
    v5 = v9;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[_TVCarouselViewController _dispatchEvent:forItemAtIndex:cell:](self, "_dispatchEvent:forItemAtIndex:cell:", CFSTR("select"), v7, v9);
      v5 = v9;
    }
  }
LABEL_7:

}

- (void)_applicationDidBecomeActive:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[_TVCarouselView visibleCells](self->_carouselView, "visibleCells", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "tv_setDisplayed:", 1);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_applicationWillResignActive:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[_TVCarouselView visibleCells](self->_carouselView, "visibleCells", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "tv_setDisplayed:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_dispatchEvent:(id)a3 forItemAtIndex:(unint64_t)a4 cell:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  -[IKCollectionElement sections](self->_collectionElement, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "elementForItemAtIndex:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isDisabled") & 1) == 0)
    objc_msgSend(v11, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", v12, 1, 1, 0, v8, 0);

}

+ (id)headerElementFromCollectionElement:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "children", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "tv_elementType") == 15)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)updateWithViewElement:(id)a3 layout:(id)a4
{
  IKCollectionElement *v7;
  id v8;
  IKViewElement *v9;
  IKViewElement *headerElement;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id obj;
  TVCarouselLayout **p_carouselLayout;
  id *location;
  id *locationa;
  id *p_collectionElement;
  _TVCarouselViewController *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v7 = (IKCollectionElement *)a3;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "headerElementFromCollectionElement:", v7);
  v9 = (IKViewElement *)objc_claimAutoreleasedReturnValue();
  headerElement = self->_headerElement;
  self->_headerElement = v9;

  p_collectionElement = (id *)&self->_collectionElement;
  v54 = self;
  v48 = v8;
  if (self->_collectionElement != v7
    || -[IKCollectionElement updateType](v7, "updateType") != 2
    || (-[_TVCarouselViewController view](self, "view"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "window"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    -[IKCollectionElement sections](v7, "sections");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v27;
    objc_msgSend(v27, "itemsChangeSet");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      objc_msgSend(v28, "addedIndexes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "count"))
      {
        v31 = 1;
      }
      else
      {
        objc_msgSend(v29, "removedIndexes");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "count"))
        {
          v31 = 1;
        }
        else
        {
          objc_msgSend(v29, "movedIndexesByNewIndex");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v33, "count"))
            v31 = 1;
          else
            v31 = !-[TVCarouselLayout isEqual:](self->_carouselLayout, "isEqual:", v8);

        }
      }

    }
    else
    {
      v31 = 1;
    }
    objc_storeStrong(p_collectionElement, a3);
    p_carouselLayout = &self->_carouselLayout;
    objc_storeStrong((id *)&self->_carouselLayout, a4);
    -[_TVCarouselViewController _updateHeaderView](self, "_updateHeaderView");
    -[_TVCarouselViewController _updateAutoScrollInterval](self, "_updateAutoScrollInterval");
    if (v31)
    {
      -[_TVCarouselViewController _updateLayoutAndReload](self, "_updateLayoutAndReload");
    }
    else
    {
      v47 = v29;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      -[_TVCarouselView visibleCells](self->_carouselView, "visibleCells");
      locationa = (id *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(locationa, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v56 != v36)
              objc_enumerationMutation(locationa);
            v38 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
            v39 = -[_TVCarouselView indexForCell:](self->_carouselView, "indexForCell:", v38);
            if (v39 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v40 = v39;
              objc_msgSend(*p_collectionElement, "sections");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "firstObject");
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v42, "elementForItemAtIndex:", v40);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = (void *)objc_opt_new();
              objc_msgSend(v44, "setCenterGrowth:", -[TVCarouselLayout layoutType](*p_carouselLayout, "layoutType") == 0);
              +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = (id)objc_msgSend(v45, "_viewFromElement:layout:existingView:", v43, v44, v38);

              self = v54;
            }
          }
          v35 = objc_msgSend(locationa, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        }
        while (v35);
      }

      v29 = v47;
    }

    goto LABEL_42;
  }
  location = (id *)&self->_carouselLayout;
  if (!-[TVCarouselLayout isEqual:](self->_carouselLayout, "isEqual:", v8))
  {
    objc_storeStrong(location, a4);
    -[_TVCarouselViewController _updateLayout](self, "_updateLayout");
  }
  -[_TVCarouselViewController _updateHeaderView](self, "_updateHeaderView");
  -[_TVCarouselViewController _updateAutoScrollInterval](self, "_updateAutoScrollInterval");
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[_TVCarouselView visibleCells](self->_carouselView, "visibleCells");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v60 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j);
        v18 = -[_TVCarouselView indexForCell:](self->_carouselView, "indexForCell:", v17);
        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v19 = v18;
          objc_msgSend(*p_collectionElement, "sections");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "elementForItemAtIndex:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_opt_new();
          objc_msgSend(v23, "setCenterGrowth:", objc_msgSend(*location, "layoutType") == 0);
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (id)objc_msgSend(v24, "_viewFromElement:layout:existingView:", v22, v23, v17);

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v14);
LABEL_42:
    v8 = v48;
  }

}

- (void)centerItemAtPageIndex:(int64_t)a3
{
  _TVCarouselView *carouselView;

  carouselView = self->_carouselView;
  if (carouselView)
    -[_TVCarouselView centerItemAtPageIndex:](carouselView, "centerItemAtPageIndex:", a3);
}

- (void)_updateAutoScrollInterval
{
  IKCollectionElement *collectionElement;
  void *v4;
  id v5;

  collectionElement = self->_collectionElement;
  if (collectionElement && self->_carouselView)
  {
    -[IKCollectionElement sections](collectionElement, "sections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v5, "numberOfItems") >= 3)
      -[_TVCarouselView setAutoscrollInterval:](self->_carouselView, "setAutoscrollInterval:", 10.0);

  }
}

- (void)_updateLayout
{
  _TVCarouselView *carouselView;
  double v4;
  double v5;
  _TVCarouselView *v7;
  void *v8;
  float v9;
  id v10;

  carouselView = self->_carouselView;
  if (carouselView)
  {
    -[_TVCarouselView transferLayoutStylesFromElement:](carouselView, "transferLayoutStylesFromElement:", self->_collectionElement);
    -[TVCarouselLayout cellSize](self->_carouselLayout, "cellSize");
    if (v5 > 2.22044605e-16 && v4 > 2.22044605e-16)
      -[_TVCarouselView setItemSize:](self->_carouselView, "setItemSize:");
    v7 = self->_carouselView;
    -[TVCarouselLayout interitemSpacing](self->_carouselLayout, "interitemSpacing");
    -[_TVCarouselView setInteritemSpacing:](v7, "setInteritemSpacing:");
    -[_TVCarouselView setSemanticContentAttribute:](self->_carouselView, "setSemanticContentAttribute:", -[IKCollectionElement tv_semanticContentAttribute](self->_collectionElement, "tv_semanticContentAttribute"));
    -[_TVCarouselView setScrollMode:](self->_carouselView, "setScrollMode:", -[TVCarouselLayout scrollMode](self->_carouselLayout, "scrollMode"));
    -[_TVCarouselView setShowsPageControl:](self->_carouselView, "setShowsPageControl:", -[TVCarouselLayout showsPageControl](self->_carouselLayout, "showsPageControl"));
    -[TVCarouselLayout pageControlMarginNumber](self->_carouselLayout, "pageControlMarginNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v10 = v8;
      objc_msgSend(v8, "floatValue");
      -[_TVCarouselView setPageControlMargin:](self->_carouselView, "setPageControlMargin:", v9);
      v8 = v10;
    }

  }
}

- (void)_updateLayoutAndReload
{
  $DD319AC380963C674801FD51D4C14450 *p_flags;

  p_flags = &self->_flags;
  self->_flags.indexesDirty = 1;
  -[_TVCarouselView reloadData](self->_carouselView, "reloadData");
  p_flags->indexesDirty = 0;
  -[_TVCarouselViewController _updateLayout](self, "_updateLayout");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerElement, 0);
  objc_storeStrong((id *)&self->_carouselView, 0);
  objc_storeStrong((id *)&self->_collectionElement, 0);
  objc_storeStrong((id *)&self->_carouselLayout, 0);
}

@end

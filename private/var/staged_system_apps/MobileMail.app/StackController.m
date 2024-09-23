@implementation StackController

- (StackController)init
{
  StackController *v2;
  NSMutableArray *v3;
  NSMutableArray *stackedItems;
  NSMutableArray *v5;
  NSMutableArray *orderedItems;
  NSMutableDictionary *v7;
  NSMutableDictionary *stackElementsByItem;
  NSMutableDictionary *v9;
  NSMutableDictionary *loadRequestDatesByItem;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)StackController;
  v2 = -[StackController init](&v13, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 50);
    stackedItems = v2->_stackedItems;
    v2->_stackedItems = v3;

    v5 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 50);
    orderedItems = v2->_orderedItems;
    v2->_orderedItems = v5;

    v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 50);
    stackElementsByItem = v2->_stackElementsByItem;
    v2->_stackElementsByItem = v7;

    v9 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 50);
    loadRequestDatesByItem = v2->_loadRequestDatesByItem;
    v2->_loadRequestDatesByItem = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, "stackDataSourceDidLoadItemData:", CFSTR("StackDataSourceDidLoadItemData"), 0);

  }
  return v2;
}

- (unint64_t)maximumNumberOfVisibleStackElements
{
  return 5;
}

- (int64_t)maximumStackElementDepth
{
  return 4;
}

- (void)displayStackedViewsForItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIView *stackContainerView;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *v10;
  void *v11;
  void *v12;
  char *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  id v18;

  v4 = a4;
  v18 = a3;
  self->_isTerminating = 0;
  stackContainerView = self->_stackContainerView;
  if (!stackContainerView)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[StackController delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v7, "stackControllerWillStartStackingViews:") & 1) != 0)
      objc_msgSend(v7, "stackControllerWillStartStackingViews:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[StackController dataSource](self, "dataSource"));
    v9 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stackContainerViewForStackController:", self));
    v10 = self->_stackContainerView;
    self->_stackContainerView = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self->_stackContainerView, "window"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windowScene"));
    v13 = (char *)objc_msgSend(v12, "interfaceOrientation");

    if ((unint64_t)(v13 - 3) <= 1)
      -[UIView setClipsToBounds:](self->_stackContainerView, "setClipsToBounds:", 1);
    objc_msgSend(v8, "stackContainerViewEdgeInsetsForStackController:", self);
    self->_stackContainerViewEdgeInsets.top = v14;
    self->_stackContainerViewEdgeInsets.left = v15;
    self->_stackContainerViewEdgeInsets.bottom = v16;
    self->_stackContainerViewEdgeInsets.right = v17;

  }
  -[StackController setAnimateStateTransitions:](self, "setAnimateStateTransitions:", v4);
  -[StackController setItemsToDisplay:](self, "setItemsToDisplay:", v18);
  -[StackController setNeedsToUpdateDisplayedItems:immediately:](self, "setNeedsToUpdateDisplayedItems:immediately:", 1, stackContainerView == 0);

}

- (void)setNeedsToUpdateDisplayedItems:(BOOL)a3 immediately:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  double v8;
  double v9;
  id v10;

  v4 = a4;
  v5 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "updateDisplayedItems", 0);
  if (v5)
  {
    if (v4)
    {
      -[StackController updateDisplayedItems](self, "updateDisplayedItems");
    }
    else
    {
      v7 = 0.0;
      if (-[StackController animateStateTransitions](self, "animateStateTransitions"))
      {
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        v9 = v8 - self->_lastDisplayedItemsUpdateRequest;
        self->_lastDisplayedItemsUpdateRequest = v8;
        if (v9 < 0.3)
        {
          self->_isSuspended = 1;
          v7 = 0.1;
        }
      }
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", NSRunLoopCommonModes));
      -[StackController performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", "updateDisplayedItems", 0, v7);

    }
  }
  else
  {
    self->_isSuspended = 0;
  }
}

- (void)addStackedItem:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v4 = -[NSMutableArray indexOfObject:](self->_orderedItems, "indexOfObject:");
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray addObject:](self->_stackedItems, "addObject:", v9);
    -[NSMutableArray addObject:](self->_orderedItems, "addObject:", v9);
  }
  else
  {
    v5 = 0;
    do
    {
      v6 = v5;
      if (v5 >= (unint64_t)-[NSMutableArray count](self->_stackedItems, "count"))
        break;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_stackedItems, "objectAtIndex:", v5));
      v8 = -[NSMutableArray indexOfObject:](self->_orderedItems, "indexOfObject:", v7);
      ++v5;

    }
    while (v8 <= v4);
    -[NSMutableArray insertObject:atIndex:](self->_stackedItems, "insertObject:atIndex:", v9, v6);
  }

}

- (void)updateDisplayedItems
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *k;
  void *v17;
  id v18;
  uint64_t v19;
  void *m;
  void *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *n;
  void *v27;
  id v28;
  uint64_t v29;
  void *ii;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];

  self->_isSuspended = 0;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[StackController itemsToDisplay](self, "itemsToDisplay"));
  v32 = -[NSMutableArray copy](self->_stackedItems, "copy");
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v3 = v33;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  v5 = 0;
  if (v4)
  {
    v6 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v59 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
        if ((-[NSMutableArray containsObject:](self->_stackedItems, "containsObject:", v8, v32) & 1) == 0)
        {
          -[StackController addStackedItem:](self, "addStackedItem:", v8);
          if (!v5)
            v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 1);
          objc_msgSend(v5, "addObject:", v8);
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v4);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v32;
  v9 = 0;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(_QWORD *)v55 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)j);
        if ((objc_msgSend(v3, "containsObject:", v13, v32) & 1) == 0)
        {
          -[NSMutableArray removeObject:](self->_stackedItems, "removeObject:", v13);
          if (!v9)
            v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 1);
          objc_msgSend(v9, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    }
    while (v10);
  }

  -[StackController beginTransaction](self, "beginTransaction");
  if (objc_msgSend(v3, "count"))
  {
    v48 = 0uLL;
    v49 = 0uLL;
    v46 = 0uLL;
    v47 = 0uLL;
    v35 = v5;
    v14 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v47;
      do
      {
        for (k = 0; k != v14; k = (char *)k + 1)
        {
          if (*(_QWORD *)v47 != v15)
            objc_enumerationMutation(v35);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)k), 1, v32));
          objc_msgSend(v17, "setTargetState:", 4);

        }
        v14 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
      }
      while (v14);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v34 = v9;
    v18 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v63, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v43;
      do
      {
        for (m = 0; m != v18; m = (char *)m + 1)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v34);
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)m), 0, v32));
          objc_msgSend(v21, "setTargetState:", 5);

        }
        v18 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v63, 16);
      }
      while (v18);
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](self->_stackedItems, "reverseObjectEnumerator"));
    v22 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
    if (v22)
    {
      v23 = 0;
      v24 = 0;
      v25 = *(_QWORD *)v39;
      do
      {
        for (n = 0; n != v22; n = (char *)n + 1)
        {
          if (*(_QWORD *)v39 != v25)
            objc_enumerationMutation(v36);
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)n), 0, v32));
          objc_msgSend(v27, "setTargetDepth:", (char *)n + v24);
          if (v23 > 4)
          {
            objc_msgSend(v27, "setTargetState:", 6);
          }
          else
          {
            objc_msgSend(v27, "setTargetState:", 4);
            ++v23;
          }

        }
        v22 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
        v24 += (uint64_t)n;
      }
      while (v22);
    }
  }
  else
  {
    v52 = 0uLL;
    v53 = 0uLL;
    v50 = 0uLL;
    v51 = 0uLL;
    v36 = v9;
    v28 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v51;
      do
      {
        for (ii = 0; ii != v28; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v51 != v29)
            objc_enumerationMutation(v36);
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)ii), 0, v32));
          objc_msgSend(v31, "setTargetState:", 5);

        }
        v28 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
      }
      while (v28);
    }
  }

  -[StackController endTransaction](self, "endTransaction");
}

- (void)removeStackedViews:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  StackController *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  self->_isTerminating = 1;
  v5 = -[NSMutableArray copy](self->_stackedItems, "copy");
  -[NSMutableArray removeAllObjects](self->_stackedItems, "removeAllObjects");
  -[StackController setAnimateStateTransitions:](self, "setAnimateStateTransitions:", v3);
  -[StackController setItemsToDisplay:](self, "setItemsToDisplay:", 0);
  -[StackController setNeedsToUpdateDisplayedItems:immediately:](self, "setNeedsToUpdateDisplayedItems:immediately:", 0, 1);
  -[StackController beginTransaction](self, "beginTransaction");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), 0, (_QWORD)v13));
        objc_msgSend(v10, "setTargetState:", 1);
        if (objc_msgSend(v10, "currentState") == (id)1)
          -[StackController stackElement:currentStateDidChangeFrom:to:](self, "stackElement:currentStateDidChangeFrom:to:", v10, 1, 1);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[StackController endTransaction](self, "endTransaction");
  if (!objc_msgSend(v6, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[StackController delegate](self, "delegate"));
    v12 = self;
    if ((objc_opt_respondsToSelector(v11, "stackControllerDidStopStackingViews:") & 1) != 0)
      objc_msgSend(v11, "stackControllerDidStopStackingViews:", v12);

  }
}

- (void)updateStackedViewsFrame
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = -[NSMutableArray copy](self->_stackedItems, "copy");
  -[StackController beginTransaction](self, "beginTransaction");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reverseObjectEnumerator", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), 0));
        if (objc_msgSend(v8, "currentState") != (id)1)
          -[StackController _updateStackedViewFrameForElement:](self, "_updateStackedViewFrameForElement:", v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[StackController endTransaction](self, "endTransaction");
}

- (void)updateStackedViewFrameForItem:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", a3, 0));
  -[StackController _updateStackedViewFrameForElement:](self, "_updateStackedViewFrameForElement:");

}

- (void)_updateStackedViewFrameForElement:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StackController dataSource](self, "dataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "item"));
  objc_msgSend(v4, "stackController:rectForItem:", self, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v14, "updateViewFrame:", v7, v9, v11, v13);
}

- (id)stackedViewForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StackController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stackController:viewForItem:", self, v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[StackController stackContainerView](self, "stackContainerView"));
    objc_msgSend(v8, "addSubview:", v6);

    objc_msgSend(v6, "setAlpha:", 0.0);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v9, "setCornerRadius:", 0.0);

  return v6;
}

- (id)keyForItem:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v6 = v5;

  return v6;
}

- (id)stackElementForItem:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  StackElement *v8;
  BOOL v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StackController keyForItem:](self, "keyForItem:", v6));
  v8 = (StackElement *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_stackElementsByItem, "objectForKeyedSubscript:", v7));
  if (v8)
    v9 = 1;
  else
    v9 = !v4;
  if (!v9)
  {
    v8 = -[StackElement initWithItem:state:]([StackElement alloc], "initWithItem:state:", v6, 1);
    -[StackElement setDelegate:](v8, "setDelegate:", self);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stackElementsByItem, "setObject:forKeyedSubscript:", v8, v7);
  }

  return v8;
}

- (void)removeStackElement:(id)a3
{
  void *v4;
  UIView *stackContainerView;
  void *v6;
  StackController *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "item"));
  v8 = (id)objc_claimAutoreleasedReturnValue(-[StackController keyForItem:](self, "keyForItem:", v4));

  -[NSMutableDictionary removeObjectForKey:](self->_stackElementsByItem, "removeObjectForKey:", v8);
  if (!-[NSMutableDictionary count](self->_stackElementsByItem, "count"))
  {
    -[UIView setClipsToBounds:](self->_stackContainerView, "setClipsToBounds:", 0);
    stackContainerView = self->_stackContainerView;
    self->_stackContainerView = 0;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[StackController delegate](self, "delegate"));
    v7 = self;
    if ((objc_opt_respondsToSelector(v6, "stackControllerDidStopStackingViews:") & 1) != 0)
      objc_msgSend(v6, "stackControllerDidStopStackingViews:", v7);

  }
}

- (BOOL)isDataAvailableForStackElement:(id)a3 loadIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *loadRequestDatesByItem;
  void *v16;
  double v17;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_orderedItems, "lastObject"));

  if (v7 == v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[StackController dataSource](self, "dataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[StackController keyForItem:](self, "keyForItem:", v7));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemView"));
    v9 = objc_msgSend(v10, "stackController:isDataLoadedForItem:inView:", self, v7, v12);
    if (((v9 | !v4) & 1) == 0)
      objc_msgSend(v10, "stackController:loadDataForItem:inView:", self, v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_loadRequestDatesByItem, "objectForKey:", v11));
    v14 = v13;
    if (v13)
    {
      if ((v9 & 1) != 0)
      {
        LOBYTE(v9) = 1;
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(v13, "timeIntervalSinceNow");
      if (v17 > -0.05)
      {
        LOBYTE(v9) = 0;
        goto LABEL_15;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[StackController delegate](self, "delegate"));
      if ((objc_opt_respondsToSelector(v16, "stackController:dataLoadTimedOutInView:forItem:") & 1) != 0)
        objc_msgSend(v16, "stackController:dataLoadTimedOutInView:forItem:", self, v12, v7);
      LOBYTE(v9) = 1;
    }
    else
    {
      loadRequestDatesByItem = self->_loadRequestDatesByItem;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[NSMutableDictionary setObject:forKey:](loadRequestDatesByItem, "setObject:forKey:", v16, v11);
    }

    goto LABEL_15;
  }
  LOBYTE(v9) = 1;
LABEL_16:

  return v9;
}

- (void)beginTransaction
{
  ++self->_transactionCount;
}

- (void)endTransaction
{
  unint64_t v2;

  v2 = self->_transactionCount - 1;
  self->_transactionCount = v2;
  if (!v2 && self->_updateNeeded)
  {
    self->_updateNeeded = 0;
    -[StackController updateStackElements](self, "updateStackElements");
  }
}

- (void)setNeedsToUpdateStackElements
{
  if (self->_transactionCount)
    self->_updateNeeded = 1;
  else
    -[StackController updateStackElements](self, "updateStackElements");
}

- (void)updateStackElements
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (!self->_isSuspended)
  {
    self->_loadingData = 0;
    self->_itemsBecameStacked = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_stackElementsByItem, "allValues"));
    if (objc_msgSend(v3, "count"))
    {
      -[StackController beginTransaction](self, "beginTransaction");
      v10 = 0u;
      v11 = 0u;
      v8 = 0u;
      v9 = 0u;
      v4 = v3;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v5)
      {
        v6 = *(_QWORD *)v9;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(_QWORD *)v9 != v6)
              objc_enumerationMutation(v4);
            -[StackController updateStackElement:](self, "updateStackElement:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), (_QWORD)v8);
          }
          v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        }
        while (v5);
      }

      -[StackController endTransaction](self, "endTransaction");
    }
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "setNeedsToUpdateStackElements", 0, (_QWORD)v8);
    if (self->_loadingData)
      -[StackController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "setNeedsToUpdateStackElements", 0, 0.05);
    -[StackController updateIsAnimating](self, "updateIsAnimating");

  }
}

- (void)updateStackElement:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  unsigned int v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = (uint64_t)objc_msgSend(v16, "nextState");
  v5 = objc_msgSend(v16, "targetState");
  v6 = objc_msgSend(v16, "nextDepth");
  v7 = objc_msgSend(v16, "targetDepth");
  v8 = (unint64_t)v7;
  if ((id)v4 != v5 || v6 != v7)
  {
    v9 = -[StackController animateStateTransitions](self, "animateStateTransitions");
    if (objc_msgSend(v16, "isAnimating"))
      v8 = (unint64_t)v6;
    v10 = (uint64_t)v5;
    switch((unint64_t)v5)
    {
      case 1uLL:
      case 2uLL:
      case 6uLL:
        goto LABEL_14;
      case 3uLL:
        v11 = -[StackController isAnyStackElementBeingStacked](self, "isAnyStackElementBeingStacked");
        v10 = 3;
        if (v11)
          v10 = v4;
        goto LABEL_14;
      case 4uLL:
        if (-[StackController isDataAvailableForStackElement:loadIfNeeded:](self, "isDataAvailableForStackElement:loadIfNeeded:", v16, -[StackController _shouldLoadDataForElement:](self, "_shouldLoadDataForElement:", v16)))
        {
          v10 = 4;
LABEL_14:
          if (v10 != v4)
          {
            if (v10 == 4 && v5 == (id)4)
            {
              self->_itemsBecameStacked = 1;
              v13 = (void *)objc_claimAutoreleasedReturnValue(-[StackController delegate](self, "delegate"));
              if ((objc_opt_respondsToSelector(v13, "stackController:willDisplayView:forItem:") & 1) != 0)
              {
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "itemView"));
                v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "item"));
                objc_msgSend(v13, "stackController:willDisplayView:forItem:", self, v14, v15);

              }
              v4 = 4;
            }
            else
            {
              v4 = v10;
            }
            goto LABEL_27;
          }
        }
        else
        {
          self->_loadingData = 1;
        }
LABEL_15:
        v12 = (id)v8 != v6 && v4 == 4;
        if (v12 || !v9)
        {
LABEL_27:
          objc_msgSend(v16, "setNextState:nextDepth:animated:", v4, v8, v9);
          break;
        }
        break;
      case 5uLL:
        v10 = 5;
        if (v4 == 6 && v8 >= 5)
        {
          v8 = -[StackController maximumStackElementDepth](self, "maximumStackElementDepth");
          v10 = 5;
        }
        goto LABEL_14;
      default:
        goto LABEL_15;
    }
  }

}

- (void)stackDataSourceDidLoadItemData:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:"));

  if (v4)
    -[StackController setNeedsToUpdateStackElements](self, "setNeedsToUpdateStackElements");

}

- (BOOL)isAnyStackElementBeingStacked
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](self->_stackedItems, "reverseObjectEnumerator", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), 0));
        v8 = v7;
        if (v7 && objc_msgSend(v7, "nextState") == (id)4 && !objc_msgSend(v8, "currentState"))
        {

          v9 = 1;
          goto LABEL_13;
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)hasStackedItems
{
  return -[NSMutableArray count](self->_stackedItems, "count") != 0;
}

- (void)setIsAnimating:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  id v6;

  if (self->_isAnimating != a3)
  {
    v3 = a3;
    self->_isAnimating = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = WeakRetained;
    if (v3)
    {
      if ((objc_opt_respondsToSelector(WeakRetained, "stackControllerWillStartAnimatingViews:") & 1) != 0)
        objc_msgSend(v6, "stackControllerWillStartAnimatingViews:", self);
    }
    else if ((objc_opt_respondsToSelector(WeakRetained, "stackControllerDidStopAnimatingViews:") & 1) != 0)
    {
      objc_msgSend(v6, "stackControllerDidStopAnimatingViews:", self);
    }

  }
}

- (void)updateIsAnimating
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  if (self->_isTerminating)
  {
    v3 = 0;
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_stackElementsByItem, "allValues", 0));
    v3 = (uint64_t)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v5 = *(_QWORD *)v8;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isAnimating") & 1) != 0)
          {
            v3 = 1;
            goto LABEL_13;
          }
        }
        v3 = (uint64_t)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  -[StackController setIsAnimating:](self, "setIsAnimating:", v3);
}

- (BOOL)_shouldLoadDataForElement:(id)a3
{
  return objc_msgSend(a3, "targetDepth") == 0;
}

- (id)stackContainerView
{
  return self->_stackContainerView;
}

- (UIEdgeInsets)stackContainerViewEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_stackContainerViewEdgeInsets.top;
  left = self->_stackContainerViewEdgeInsets.left;
  bottom = self->_stackContainerViewEdgeInsets.bottom;
  right = self->_stackContainerViewEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)stackIsTerminating
{
  return self->_isTerminating;
}

- (id)viewForStackElement:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StackController stackedViewForItem:](self, "stackedViewForItem:", v4));

  return v5;
}

- (id)viewBelowStackElement:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "item"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](self->_orderedItems, "reverseObjectEnumerator", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        if (v7)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", v10, 0));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemViewCreateIfNeeded:", 0));

          if (v12)
            goto LABEL_13;
          v7 = 1;
        }
        else
        {
          v7 = v10 == v4;
        }
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (void)stackElement:(id)a3 willRemoveView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StackController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v6, "stackController:willRemoveViewForItem:") & 1) != 0)
    objc_msgSend(v6, "stackController:willRemoveViewForItem:", self, v5);
  if ((-[NSMutableArray containsObject:](self->_stackedItems, "containsObject:", v5) & 1) == 0)
  {
    -[NSMutableArray removeObject:](self->_orderedItems, "removeObject:", v5);
    if (-[NSMutableArray count](self->_stackedItems, "count"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_stackedItems, "lastObject"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", v7, 0));
      v9 = v8;
      if (v8)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemView"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[StackController dataSource](self, "dataSource"));
        if ((objc_msgSend(v11, "stackController:isDataLoadedForItem:inView:", self, v7, v10) & 1) == 0
          && -[StackController _shouldLoadDataForElement:](self, "_shouldLoadDataForElement:", v12))
        {
          objc_msgSend(v11, "stackController:loadDataForItem:inView:", self, v7, v10);
        }

      }
    }
  }

}

- (void)stackElement:(id)a3 currentStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[4];
  id v15;

  v8 = a3;
  if (objc_msgSend(v8, "targetState") == (id)a5)
  {
    switch(a5)
    {
      case 1:
      case 5:
      case 6:
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "item"));
        objc_msgSend(v8, "removeView");
        if ((-[NSMutableArray containsObject:](self->_stackedItems, "containsObject:", v9) & 1) == 0)
          -[StackController removeStackElement:](self, "removeStackElement:", v8);
        if (v9
          && (-[NSMutableArray containsObject:](self->_stackedItems, "containsObject:", v9) & 1) == 0)
        {
          -[NSMutableArray removeObject:](self->_orderedItems, "removeObject:", v9);
        }
        goto LABEL_8;
      case 2:
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001D986C;
        block[3] = &unk_10051AA98;
        v10 = v8;
        v15 = v10;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        -[StackController removeStackElement:](self, "removeStackElement:", v10);

        break;
      case 4:
        if ((a4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && -[NSMutableArray count](self->_orderedItems, "count"))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "item"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_orderedItems, "lastObject"));

          if (v9 == v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[StackController dataSource](self, "dataSource"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemView"));
            if ((objc_msgSend(v12, "stackController:isDataLoadedForItem:inView:", self, v9, v13) & 1) == 0
              && -[StackController _shouldLoadDataForElement:](self, "_shouldLoadDataForElement:", v8))
            {
              objc_msgSend(v12, "stackController:loadDataForItem:inView:", self, v9, v13);
            }

          }
LABEL_8:

        }
        break;
      default:
        break;
    }
  }
  -[StackController setNeedsToUpdateStackElements](self, "setNeedsToUpdateStackElements");

}

- (void)stackElement:(id)a3 targetStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (a4 == 1 && a5 == 4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[StackController delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v8, "stackController:willStackView:forItem:") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "item"));
      objc_msgSend(v8, "stackController:willStackView:forItem:", self, v9, v10);

    }
  }
  -[StackController setNeedsToUpdateStackElements](self, "setNeedsToUpdateStackElements");

}

- (StackDataSource)dataSource
{
  return (StackDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (StackDelegate)delegate
{
  return (StackDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (BOOL)animateStateTransitions
{
  return self->_animateStateTransitions;
}

- (void)setAnimateStateTransitions:(BOOL)a3
{
  self->_animateStateTransitions = a3;
}

- (NSArray)itemsToDisplay
{
  return self->_itemsToDisplay;
}

- (void)setItemsToDisplay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsToDisplay, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_loadRequestDatesByItem, 0);
  objc_storeStrong((id *)&self->_stackElementsByItem, 0);
  objc_storeStrong((id *)&self->_orderedItems, 0);
  objc_storeStrong((id *)&self->_stackedItems, 0);
  objc_storeStrong((id *)&self->_stackContainerView, 0);
}

@end

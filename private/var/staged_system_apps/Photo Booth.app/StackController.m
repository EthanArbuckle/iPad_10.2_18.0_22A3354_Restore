@implementation StackController

- (StackController)init
{
  StackController *v2;
  NSNotificationCenter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)StackController;
  v2 = -[StackController init](&v5, "init");
  if (v2)
  {
    v2->_stackedItems = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 50);
    v2->_orderedItems = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 50);
    v2->_stackElementsByItem = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 50);
    v2->_loadRequestDatesByItem = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 50);
    v2->_transitionEdge = 2;
    v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", v2, "stackDataSourceDidLoadItemData:", off_100043330, 0);
  }
  return v2;
}

- (void)dealloc
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[NSMutableDictionary allValues](self->_stackElementsByItem, "allValues");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "delegate") == self)
          objc_msgSend(v8, "setDelegate:", 0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  if (-[StackRevealGroup delegate](self->_revealGroup, "delegate") == (StackRevealGroupDelegate *)self)
    -[StackRevealGroup setDelegate:](self->_revealGroup, "setDelegate:", 0);

  v9.receiver = self;
  v9.super_class = (Class)StackController;
  -[StackController dealloc](&v9, "dealloc");
}

- (unint64_t)maxNumberOfOrientations
{
  return 3;
}

- (void)displayStackedViewsForItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  PBStackContainerView *stackContainerView;
  StackDataSource *v8;
  StackDelegate *v9;
  __int128 *v10;
  id v11;
  UIView *defaultView;

  v4 = a4;
  self->_isTerminating = 0;
  stackContainerView = self->_stackContainerView;
  v8 = -[StackController dataSource](self, "dataSource");
  if (!self->_stackContainerView)
  {
    v9 = -[StackController delegate](self, "delegate");
    if ((objc_opt_respondsToSelector(v9, "stackControllerWillStartStackingViews:") & 1) != 0)
      -[StackDelegate stackControllerWillStartStackingViews:](v9, "stackControllerWillStartStackingViews:", self);
    self->_stackContainerView = (PBStackContainerView *)-[StackDataSource stackContainerViewForStackController:](v8, "stackContainerViewForStackController:", self);
    if ((char *)-[UIApplication statusBarOrientation](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "statusBarOrientation")- 3 <= (char *)1)-[PBStackContainerView setClipsToBounds:](self->_stackContainerView, "setClipsToBounds:", 1);
    if (objc_msgSend(a3, "count"))
      v10 = &xmmword_100027400;
    else
      v10 = &xmmword_1000273F0;
    self->_stackCenterOffset = (CGSize)*v10;
  }
  v11 = -[StackDataSource defaultItemForStackController:](v8, "defaultItemForStackController:", self);
  if (v11 != self->_defaultItem && (objc_msgSend(v11, "isEqual:") & 1) == 0)
  {
    defaultView = self->_defaultView;
    self->_previousDefaultItem = self->_defaultItem;

    self->_defaultItem = -[StackDataSource defaultItemForStackController:](v8, "defaultItemForStackController:", self);
    self->_defaultView = (UIView *)-[StackDataSource defaultViewForStackController:](v8, "defaultViewForStackController:", self);
  }
  -[StackController setAnimateStateTransitions:](self, "setAnimateStateTransitions:", v4);
  -[StackController setItemsToDisplay:](self, "setItemsToDisplay:", a3);
  -[StackController setNeedsToUpdateDisplayedItems:immediately:](self, "setNeedsToUpdateDisplayedItems:immediately:", 1, stackContainerView == 0);
}

- (void)setNeedsToUpdateDisplayedItems:(BOOL)a3 immediately:(BOOL)a4
{
  _BOOL4 v5;
  double v7;
  double v8;

  v5 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "updateDisplayedItems", 0);
  if (v5)
  {
    if (!-[StackController animateStateTransitions](self, "animateStateTransitions")
      || a4
      || (+[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate"),
          v8 = v7 - self->_lastDisplayedItemsUpdateRequest,
          self->_lastDisplayedItemsUpdateRequest = v7,
          v8 >= 0.3))
    {
      -[StackController performSelector:withObject:](self, "performSelector:withObject:", "updateDisplayedItems", 0);
    }
    else
    {
      self->_isSuspended = 1;
      +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", NSRunLoopCommonModes);
      -[StackController performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", "updateDisplayedItems", 0);
    }
  }
}

- (void)addStackedItem:(id)a3
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v5 = -[NSMutableArray indexOfObject:](self->_orderedItems, "indexOfObject:");
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray addObject:](self->_stackedItems, "addObject:", a3);
    -[NSMutableArray addObject:](self->_orderedItems, "addObject:", a3);
  }
  else
  {
    v6 = v5;
    v7 = 0;
    do
    {
      v8 = v7;
      if (v7 >= (unint64_t)-[NSMutableArray count](self->_stackedItems, "count"))
        break;
      v9 = -[NSMutableArray indexOfObject:](self->_orderedItems, "indexOfObject:", -[NSMutableArray objectAtIndex:](self->_stackedItems, "objectAtIndex:", v8));
      v7 = v8 + 1;
    }
    while (v9 <= v6);
    -[NSMutableArray insertObject:atIndex:](self->_stackedItems, "insertObject:atIndex:", a3, v8);
  }
}

- (void)updateDisplayedItems
{
  NSArray *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *k;
  id v21;
  id v22;
  uint64_t v23;
  void *m;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *n;
  id v30;
  id previousDefaultItem;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
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
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];

  self->_isSuspended = 0;
  v3 = -[StackController itemsToDisplay](self, "itemsToDisplay");
  v4 = -[NSMutableArray copy](self->_stackedItems, "copy");
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v8)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        if ((-[NSMutableArray containsObject:](self->_stackedItems, "containsObject:", v10) & 1) == 0)
        {
          -[StackController addStackedItem:](self, "addStackedItem:", v10);
          if (!v7)
            v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 1);
          objc_msgSend(v7, "addObject:", v10);
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v45 != v14)
          objc_enumerationMutation(v4);
        v16 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
        if (!-[NSArray containsObject:](v3, "containsObject:", v16))
        {
          -[NSMutableArray removeObject:](self->_stackedItems, "removeObject:", v16);
          if (!v13)
            v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 1);
          objc_msgSend(v13, "addObject:", v16);
        }
      }
      v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }
  -[StackController beginTransaction](self, "beginTransaction");
  if (-[NSArray count](v3, "count"))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v37;
      do
      {
        for (k = 0; k != v18; k = (char *)k + 1)
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(v7);
          objc_msgSend(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)k), 1), "setTargetState:", 4);
        }
        v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
      }
      while (v18);
    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v21 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v33;
      do
      {
        for (m = 0; m != v22; m = (char *)m + 1)
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v13);
          objc_msgSend(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)m), 0), "setTargetState:", 5);
        }
        v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
      }
      while (v22);
    }
  }
  else
  {
    v25 = -[StackController defaultItem](self, "defaultItem");
    objc_msgSend(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", v25, 1), "setTargetState:", 3);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v26 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v41;
      do
      {
        for (n = 0; n != v27; n = (char *)n + 1)
        {
          if (*(_QWORD *)v41 != v28)
            objc_enumerationMutation(v13);
          v30 = *(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)n);
          if (v30 != v25
            && (objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)n), "isEqual:", v25) & 1) == 0)
          {
            objc_msgSend(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", v30, 0), "setTargetState:", 5);
          }
        }
        v27 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
      }
      while (v27);
    }
  }
  previousDefaultItem = self->_previousDefaultItem;
  if (previousDefaultItem)
    objc_msgSend(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", previousDefaultItem, 0), "setTargetState:", 5);
  -[StackController endTransaction](self, "endTransaction");

}

- (void)removeStackedViews:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  self->_isTerminating = 1;
  v5 = -[NSMutableArray copy](self->_stackedItems, "copy");
  -[NSMutableArray removeAllObjects](self->_stackedItems, "removeAllObjects");
  -[StackController setAnimateStateTransitions:](self, "setAnimateStateTransitions:", v3);
  -[StackController setItemsToDisplay:](self, "setItemsToDisplay:", 0);
  -[StackController setNeedsToUpdateDisplayedItems:immediately:](self, "setNeedsToUpdateDisplayedItems:immediately:", 0, 1);
  -[StackController beginTransaction](self, "beginTransaction");
  -[StackRevealGroup cancel:](-[StackController revealGroup](self, "revealGroup"), "cancel:", v3);
  v6 = -[StackController defaultItem](self, "defaultItem");
  objc_msgSend(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", v6, 0), "setTargetState:", 2);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        v11 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10);
        if (v11 != v6
          && (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), "isEqual:", v6) & 1) == 0)
        {
          objc_msgSend(-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", v11, 0), "setTargetState:", 1);
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  -[StackController endTransaction](self, "endTransaction");

}

- (id)stackedViewForItem:(id)a3
{
  id v5;

  if (-[StackController defaultItem](self, "defaultItem") == a3
    || objc_msgSend(a3, "isEqual:", -[StackController defaultItem](self, "defaultItem")))
  {
    return -[StackController defaultView](self, "defaultView");
  }
  v5 = -[StackDataSource stackController:viewForItem:](-[StackController dataSource](self, "dataSource"), "stackController:viewForItem:", self, a3);
  if (!objc_msgSend(v5, "superview"))
  {
    objc_msgSend(-[StackController stackContainerView](self, "stackContainerView"), "addSubview:", v5);
    objc_msgSend(v5, "setAlpha:", 0.0);
  }
  return v5;
}

- (id)keyForItem:(id)a3
{
  if (a3)
    return a3;
  else
    return +[NSNull null](NSNull, "null");
}

- (id)stackElementForItem:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  StackElement *v8;
  BOOL v9;
  uint64_t v10;

  v4 = a4;
  v7 = -[StackController keyForItem:](self, "keyForItem:");
  v8 = (StackElement *)-[NSMutableDictionary objectForKey:](self->_stackElementsByItem, "objectForKey:", v7);
  if (v8)
    v9 = 1;
  else
    v9 = !v4;
  if (!v9)
  {
    if (-[StackController defaultItem](self, "defaultItem") == a3)
    {
      v10 = 2;
    }
    else if (objc_msgSend(a3, "isEqual:", -[StackController defaultItem](self, "defaultItem")))
    {
      v10 = 2;
    }
    else
    {
      v10 = 1;
    }
    v8 = -[StackElement initWithItem:state:]([StackElement alloc], "initWithItem:state:", a3, v10);
    -[StackElement setDelegate:](v8, "setDelegate:", self);
    -[NSMutableDictionary setObject:forKey:](self->_stackElementsByItem, "setObject:forKey:", v8, v7);
  }
  return v8;
}

- (void)removeStackElement:(id)a3
{
  StackDelegate *v4;
  StackController *v5;
  StackController *v6;

  -[NSMutableDictionary removeObjectForKey:](self->_stackElementsByItem, "removeObjectForKey:", -[StackController keyForItem:](self, "keyForItem:", objc_msgSend(a3, "item")));
  if (!-[NSMutableDictionary count](self->_stackElementsByItem, "count"))
  {
    -[PBStackContainerView setClipsToBounds:](self->_stackContainerView, "setClipsToBounds:", 0);

    self->_stackContainerView = 0;
    self->_previousDefaultItem = 0;

    self->_defaultItem = 0;
    self->_defaultView = 0;
    v4 = -[StackController delegate](self, "delegate");
    v5 = self;
    if ((objc_opt_respondsToSelector(v4, "stackControllerDidStopStackingViews:") & 1) != 0)
      -[StackDelegate stackControllerDidStopStackingViews:](v4, "stackControllerDidStopStackingViews:", self);
    v6 = self;
  }
}

- (BOOL)isDataAvailableForStackElement:(id)a3 loadIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  unsigned __int8 v8;
  StackDataSource *v10;
  id v11;
  id v12;
  id v13;
  double v14;
  StackDelegate *v15;

  v4 = a4;
  v7 = objc_msgSend(a3, "item");
  if (v7 == -[NSMutableArray lastObject](self->_orderedItems, "lastObject"))
  {
    v10 = -[StackController dataSource](self, "dataSource");
    v11 = -[StackController keyForItem:](self, "keyForItem:", v7);
    v12 = objc_msgSend(a3, "innerView");
    v8 = -[StackDataSource stackController:isDataLoadedForItem:inView:](v10, "stackController:isDataLoadedForItem:inView:", self, v7, v12);
    if ((v8 & 1) == 0 && v4)
      -[StackDataSource stackController:loadDataForItem:inView:](v10, "stackController:loadDataForItem:inView:", self, v7, v12);
    v13 = -[NSMutableDictionary objectForKey:](self->_loadRequestDatesByItem, "objectForKey:", v11);
    if (!v13)
    {
      -[NSMutableDictionary setObject:forKey:](self->_loadRequestDatesByItem, "setObject:forKey:", +[NSDate date](NSDate, "date"), v11);
      return v8;
    }
    if ((v8 & 1) == 0)
    {
      objc_msgSend(v13, "timeIntervalSinceNow");
      if (v14 > -0.05)
        return 0;
      v15 = -[StackController delegate](self, "delegate");
      if ((objc_opt_respondsToSelector(v15, "stackController:dataLoadTimedOutInView:forItem:") & 1) != 0)
        -[StackDelegate stackController:dataLoadTimedOutInView:forItem:](v15, "stackController:dataLoadTimedOutInView:forItem:", self, v12, v7);
    }
  }
  return 1;
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
  id v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *i;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  if (!self->_isSuspended)
  {
    if (!-[StackController animateStateTransitions](self, "animateStateTransitions"))
      -[StackRevealGroup cancel:](-[StackController revealGroup](self, "revealGroup"), "cancel:", 0);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v3 = -[NSMutableArray reverseObjectEnumerator](self->_stackedItems, "reverseObjectEnumerator");
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v3);
          v9 = -[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), 0);
          if (objc_msgSend(v9, "targetState") == (id)4)
          {
            if (v6 > 2)
            {
              if (objc_msgSend(v9, "currentState") == (id)1)
                objc_msgSend(v9, "setTargetState:", 6);
            }
            else
            {
              ++v6;
            }
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v5);
    }
    *(_WORD *)&self->_loadingData = 0;
    v10 = -[NSMutableDictionary allValues](self->_stackElementsByItem, "allValues");
    if (objc_msgSend(v10, "count"))
    {
      -[StackController beginTransaction](self, "beginTransaction");
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v10);
            -[StackController updateStackElement:](self, "updateStackElement:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)j));
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        }
        while (v12);
      }
      -[StackController endTransaction](self, "endTransaction");
    }
    -[StackController updateIsAnimating](self, "updateIsAnimating");
  }
}

- (void)updateStackElement:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _BOOL8 v9;
  StackRevealGroup *v10;
  StackRevealGroup *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v16;
  id v17;
  void *v18;
  NSMutableArray *stackedItems;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  double v26;
  id v27;
  id v28;
  id v29;
  _BOOL4 v30;
  _BOOL4 v31;
  id v32;
  StackRevealGroup *v33;
  StackDelegate *v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v5 = objc_msgSend(a3, "nextState");
  v6 = objc_msgSend(a3, "targetState");
  if (v5 != v6)
  {
    v7 = (uint64_t)v6;
    v8 = objc_msgSend(a3, "previousState");
    v9 = -[StackController animateStateTransitions](self, "animateStateTransitions");
    v10 = -[StackController revealGroup](self, "revealGroup");
    v11 = v10;
    switch(v7)
    {
      case 1:
      case 2:
      case 6:
        goto LABEL_54;
      case 3:
        v7 = (uint64_t)v5;
        if (!v10)
        {
          if (-[StackController isAnyStackElementBeingStacked](self, "isAnyStackElementBeingStacked"))
            v7 = (uint64_t)v5;
          else
            v7 = 3;
        }
        goto LABEL_54;
      case 4:
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        v13 = v12;
        v14 = v12 - self->_lastTransitionToStackState;
        if (v14 > 0.0 && v8 == (id)1)
        {
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          stackedItems = self->_stackedItems;
          v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stackedItems, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v38;
            v16 = 154;
LABEL_21:
            v23 = 0;
            while (1)
            {
              if (*(_QWORD *)v38 != v22)
                objc_enumerationMutation(stackedItems);
              v24 = -[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v23), 0);
              if (v24 == a3)
                break;
              v25 = v24;
              if (objc_msgSend(v24, "currentState") == (id)1 && objc_msgSend(v25, "targetState") == (id)4)
                goto LABEL_36;
              if (v21 == (id)++v23)
              {
                v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stackedItems, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
                if (v21)
                  goto LABEL_21;
                break;
              }
            }
          }
        }
        else if (v14 <= 0.0)
        {
          v16 = 154;
          goto LABEL_36;
        }
        if (-[StackController isDataAvailableForStackElement:loadIfNeeded:](self, "isDataAvailableForStackElement:loadIfNeeded:", a3, 1)|| (-[StackController stackElement:delayForAnimation:](self, "stackElement:delayForAnimation:", a3, 0), v26 > 0.0))
        {
          self->_lastTransitionToStackState = v13;
          goto LABEL_37;
        }
        v16 = 153;
LABEL_36:
        *((_BYTE *)&self->super.isa + v16) = 1;
        if (v5 == (id)4)
        {
LABEL_37:
          v27 = -[StackController defaultItem](self, "defaultItem");
          v28 = objc_msgSend(a3, "item");
          if (v28 == v27
            || (objc_msgSend(v28, "isEqual:", v27) & 1) != 0
            || (-[NSMutableArray containsObject:](self->_stackedItems, "containsObject:", v27) & 1) != 0
            || (v29 = -[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", v27, 0), objc_msgSend(v29, "targetState") == (id)5))
          {
            v30 = 1;
          }
          else
          {
            v30 = 1;
            objc_msgSend(v29, "setTargetState:", 1);
          }
          v7 = 4;
          goto LABEL_55;
        }
        if (!v9)
          goto LABEL_63;
        return;
      case 5:
        v7 = 4;
        if (v8 == (id)6 || v5 == (id)6)
          goto LABEL_54;
        v17 = -[StackController stackElementToReshowUnderneathStackElement:](self, "stackElementToReshowUnderneathStackElement:", a3);
        if (v17)
        {
          v18 = v17;
          if (objc_msgSend(v17, "currentState") != (id)4)
          {
            objc_msgSend(v18, "setOrientation:", objc_msgSend(a3, "orientation"));
            objc_msgSend(v18, "setTargetState:", 4);
            goto LABEL_53;
          }
        }
        if (-[StackController isAnyStackElementBeingStacked](self, "isAnyStackElementBeingStacked"))
        {
LABEL_18:
          v7 = 5;
          goto LABEL_54;
        }
        v36 = 0;
        if (!-[StackRevealGroup containsStackElement:isTopElement:](v11, "containsStackElement:isTopElement:", a3, &v36))
        {
          if (!-[StackRevealGroup isRevealing](v11, "isRevealing"))
          {
            if (v11)
              v31 = 0;
            else
              v31 = v9;
            if (!v31)
              goto LABEL_18;
            v32 = -[StackController orderedStackedElementsAboveStackElement:](self, "orderedStackedElementsAboveStackElement:", a3);
            if (!objc_msgSend(v32, "count"))
              goto LABEL_18;
            v33 = -[StackRevealGroup initWithStackElements:]([StackRevealGroup alloc], "initWithStackElements:", v32);
            -[StackRevealGroup setTransitionEdge:](v33, "setTransitionEdge:", -[StackController transitionEdge](self, "transitionEdge"));
            -[StackController setRevealGroup:](self, "setRevealGroup:", v33);
            -[StackRevealGroup beginRevealAnimation](v33, "beginRevealAnimation");

          }
          goto LABEL_53;
        }
        if (v36)
        {
          -[StackRevealGroup cancel:](v11, "cancel:", v9);
LABEL_53:
          v7 = (uint64_t)v5;
          goto LABEL_54;
        }
        v7 = (uint64_t)v5;
        if (!-[StackRevealGroup isRevealing](v11, "isRevealing"))
        {
          -[StackRevealGroup removeStackElement:](v11, "removeStackElement:", a3);
          goto LABEL_18;
        }
LABEL_54:
        v30 = v7 == 4;
LABEL_55:
        if ((id)v7 != v5 || !v9)
        {
          if (v30)
          {
            -[StackController updateOrientationForStackElement:](self, "updateOrientationForStackElement:", a3);
            v35 = -[StackController delegate](self, "delegate");
            if ((objc_opt_respondsToSelector(v35, "stackController:willDisplayView:forItem:") & 1) != 0)
              -[StackDelegate stackController:willDisplayView:forItem:](v35, "stackController:willDisplayView:forItem:", self, objc_msgSend(a3, "innerView"), objc_msgSend(a3, "item"));
          }
          v5 = (id)v7;
LABEL_63:
          objc_msgSend(a3, "setNextState:animated:", v5, v9);
        }
        break;
      default:
        goto LABEL_53;
    }
  }
}

- (void)updateOrientationForStackElement:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *stackedItems;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  void *v12;
  unint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
  v5 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  stackedItems = self->_stackedItems;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stackedItems, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(stackedItems);
        v11 = -[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), 0);
        if (v11)
        {
          v12 = v11;
          if (objc_msgSend(v11, "nextState") == (id)4)
          {
            objc_msgSend(v4, "addObject:", v12);
            objc_msgSend(v5, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v12, "orientation")));
          }
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stackedItems, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  if (objc_msgSend(v5, "containsObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "orientation"))))
  {
    v13 = 0;
    while (objc_msgSend(v5, "containsObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13)))
    {
      if (++v13 == 3)
      {
        v13 = ((unint64_t)objc_msgSend(objc_msgSend(v4, "lastObject"), "orientation") + 1) % 3;
        break;
      }
    }
    objc_msgSend(a3, "setOrientation:", v13);
  }

}

- (void)stackDataSourceDidLoadItemData:(id)a3
{
  if (-[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", objc_msgSend(a3, "object"), 0))
  {
    -[StackController setNeedsToUpdateStackElements](self, "setNeedsToUpdateStackElements");
  }
}

- (id)orderedStackedElementsWithOrientation:(int64_t)a3
{
  NSMutableArray *v5;
  NSMutableArray *stackedItems;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = objc_opt_new(NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  stackedItems = self->_stackedItems;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stackedItems, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(stackedItems);
        v11 = -[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), 0);
        if (v11)
        {
          v12 = v11;
          if (objc_msgSend(v11, "nextState") == (id)4 && objc_msgSend(v12, "orientation") == (id)a3)
            -[NSMutableArray addObject:](v5, "addObject:", v12);
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stackedItems, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  -[NSMutableArray sortUsingFunction:context:](v5, "sortUsingFunction:context:", sub_100015200, 0);
  return v5;
}

- (id)orderedStackedElementsAboveStackElement:(id)a3
{
  id v5;
  NSMutableArray *v6;
  NSMutableArray *stackedItems;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  BOOL v13;
  id v14;
  char *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (objc_msgSend(a3, "currentState") == (id)1)
    return 0;
  v6 = objc_opt_new(NSMutableArray);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  stackedItems = self->_stackedItems;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stackedItems, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(stackedItems);
        v12 = -[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), 0);
        if (v12)
          v13 = v12 == a3;
        else
          v13 = 1;
        if (!v13)
        {
          v14 = v12;
          if (objc_msgSend(v12, "nextState") == (id)4)
            -[NSMutableArray addObject:](v6, "addObject:", v14);
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stackedItems, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  if (-[NSMutableArray count](v6, "count"))
  {
    -[NSMutableArray addObject:](v6, "addObject:", a3);
    -[NSMutableArray sortUsingFunction:context:](v6, "sortUsingFunction:context:", sub_100015200, 0);
    v15 = (char *)-[NSMutableArray indexOfObjectIdenticalTo:](v6, "indexOfObjectIdenticalTo:", a3) + 1;
    v5 = -[NSMutableArray subarrayWithRange:](v6, "subarrayWithRange:", v15, (_BYTE *)-[NSMutableArray count](v6, "count") - v15);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)stackElementToReshowUnderneathStackElement:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = -[NSMutableArray reverseObjectEnumerator](self->_stackedItems, "reverseObjectEnumerator", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = -[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9), 0);
        if (v10)
          v11 = v10 == a3;
        else
          v11 = 1;
        if (!v11)
        {
          v12 = v10;
          v13 = objc_msgSend(v10, "nextState");
          if (v13 == (id)4)
          {
            v14 = objc_msgSend(v12, "orientation");
            if (v14 == objc_msgSend(a3, "orientation"))
              return v12;
          }
          else if (v13 == (id)6)
          {
            return v12;
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  return 0;
}

- (BOOL)isAnyStackElementBeingStacked
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = -[NSMutableArray reverseObjectEnumerator](self->_stackedItems, "reverseObjectEnumerator", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = -[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7), 0);
        if (v8)
        {
          v9 = v8;
          if (objc_msgSend(v8, "nextState") == (id)4 && !objc_msgSend(v9, "currentState"))
          {
            LOBYTE(v4) = 1;
            return (char)v4;
          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
  return (char)v4;
}

- (StackRevealGroup)revealGroup
{
  return self->_revealGroup;
}

- (void)setRevealGroup:(id)a3
{
  StackRevealGroup *revealGroup;
  StackRevealGroup *v6;

  revealGroup = self->_revealGroup;
  if (a3 && revealGroup)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("StackController.m"), 746, CFSTR("doesn't support multiple reveal groups"));
    revealGroup = self->_revealGroup;
  }
  if (revealGroup != a3)
  {
    if (-[StackRevealGroup delegate](revealGroup, "delegate") == (StackRevealGroupDelegate *)self)
      -[StackRevealGroup setDelegate:](self->_revealGroup, "setDelegate:", 0);

    v6 = (StackRevealGroup *)a3;
    self->_revealGroup = v6;
    -[StackRevealGroup setDelegate:](v6, "setDelegate:", self);
  }
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setIsAnimating:(BOOL)a3
{
  char **v4;
  char *v5;

  if (self->_isAnimating != a3)
  {
    v4 = &selRef_stackControllerWillStartAnimatingViews_;
    self->_isAnimating = a3;
    if (!a3)
      v4 = &selRef_stackControllerDidStopAnimatingViews_;
    v5 = *v4;
    if ((objc_opt_respondsToSelector(-[StackController delegate](self, "delegate"), *v4) & 1) != 0)
      -[StackDelegate performSelector:withObject:](-[StackController delegate](self, "delegate"), "performSelector:withObject:", v5, self);
  }
}

- (void)updateIsAnimating
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (self->_isTerminating
    || (v11 = 0u,
        v12 = 0u,
        v9 = 0u,
        v10 = 0u,
        v4 = -[NSMutableDictionary allValues](self->_stackElementsByItem, "allValues", 0),
        (v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16)) == 0))
  {
    v3 = 0;
  }
  else
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "isAnimating") & 1) != 0)
        {
          v3 = 1;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v3 = 0;
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:
  -[StackController setIsAnimating:](self, "setIsAnimating:", v3);
}

- (id)stackContainerView
{
  return self->_stackContainerView;
}

- (CGSize)stackCenterOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_stackCenterOffset.width;
  height = self->_stackCenterOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)stackIsTerminating
{
  return self->_isTerminating;
}

- (id)viewForStackElement:(id)a3
{
  return -[StackController stackedViewForItem:](self, "stackedViewForItem:", objc_msgSend(a3, "item"));
}

- (Class)stackElementOuterViewClass
{
  return (Class)objc_opt_class(StackShadowedView, a2);
}

- (unint64_t)transitionEdge
{
  return self->_transitionEdge;
}

- (void)stackElement:(id)a3 willRemoveView:(id)a4
{
  id v5;
  StackDelegate *v6;
  id v7;
  id v8;
  id v9;
  StackDataSource *v10;

  v5 = objc_msgSend(a3, "item");
  v6 = -[StackController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v6, "stackController:willRemoveViewForItem:") & 1) != 0)
    -[StackDelegate stackController:willRemoveViewForItem:](v6, "stackController:willRemoveViewForItem:", self, v5);
  if ((-[NSMutableArray containsObject:](self->_stackedItems, "containsObject:", v5) & 1) == 0)
  {
    -[NSMutableArray removeObject:](self->_orderedItems, "removeObject:", v5);
    if (-[NSMutableArray count](self->_stackedItems, "count"))
    {
      v7 = -[NSMutableArray lastObject](self->_stackedItems, "lastObject");
      v8 = -[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", v7, 0);
      if (v8)
      {
        v9 = objc_msgSend(v8, "innerView");
        v10 = -[StackController dataSource](self, "dataSource");
        if ((-[StackDataSource stackController:isDataLoadedForItem:inView:](v10, "stackController:isDataLoadedForItem:inView:", self, v7, v9) & 1) == 0)-[StackDataSource stackController:loadDataForItem:inView:](v10, "stackController:loadDataForItem:inView:", self, v7, v9);
      }
    }
  }
}

- (void)stackElement:(id)a3 currentStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  id v18;
  StackDataSource *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  if (objc_msgSend(a3, "targetState") == (id)a5)
  {
    switch(a5)
    {
      case 1:
      case 5:
      case 6:
        v9 = objc_msgSend(a3, "item");
        if (v9 != -[StackController defaultItem](self, "defaultItem")
          && (objc_msgSend(v9, "isEqual:", -[StackController defaultItem](self, "defaultItem")) & 1) == 0)
        {
          objc_msgSend(a3, "removeView");
          if ((-[NSMutableArray containsObject:](self->_stackedItems, "containsObject:", v9) & 1) == 0)
            -[StackController removeStackElement:](self, "removeStackElement:", a3);
        }
        if (v9 == self->_previousDefaultItem)
        {

          self->_previousDefaultItem = 0;
        }
        if ((-[NSMutableArray containsObject:](self->_stackedItems, "containsObject:", v9) & 1) == 0)
          -[NSMutableArray removeObject:](self->_orderedItems, "removeObject:", v9);
        break;
      case 2:
        objc_msgSend(a3, "removeView");
        -[StackController removeStackElement:](self, "removeStackElement:", a3);
        break;
      case 3:
        objc_msgSend(a3, "setOrientation:", 0);
        break;
      case 4:
        if ((a4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        {
          v10 = -[StackController orderedStackedElementsWithOrientation:](self, "orderedStackedElementsWithOrientation:", objc_msgSend(a3, "orientation"));
          if (v10)
          {
            v11 = v10;
            v12 = objc_msgSend(v10, "lastObject");
            v21 = 0u;
            v22 = 0u;
            v23 = 0u;
            v24 = 0u;
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v22;
              do
              {
                for (i = 0; i != v14; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v22 != v15)
                    objc_enumerationMutation(v11);
                  v17 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
                  if (v17 != v12)
                    objc_msgSend(v17, "setTargetState:", 6);
                }
                v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
              }
              while (v14);
            }
            v18 = objc_msgSend(a3, "item");
            if (v18 == -[NSMutableArray lastObject](self->_orderedItems, "lastObject"))
            {
              v19 = -[StackController dataSource](self, "dataSource");
              v20 = objc_msgSend(v12, "innerView");
              if ((-[StackDataSource stackController:isDataLoadedForItem:inView:](v19, "stackController:isDataLoadedForItem:inView:", self, v18, v20) & 1) == 0)-[StackDataSource stackController:loadDataForItem:inView:](v19, "stackController:loadDataForItem:inView:", self, v18, v20);
            }
          }
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
  StackDelegate *v7;

  if (a5 == 4)
  {
    if (a4 == 1)
    {
      v7 = -[StackController delegate](self, "delegate");
      if ((objc_opt_respondsToSelector(v7, "stackController:willStackView:forItem:") & 1) != 0)
        -[StackDelegate stackController:willStackView:forItem:](v7, "stackController:willStackView:forItem:", self, objc_msgSend(a3, "innerView"), objc_msgSend(a3, "item"));
    }
    -[StackRevealGroup cancel:](-[StackController revealGroup](self, "revealGroup"), "cancel:", -[StackController animateStateTransitions](self, "animateStateTransitions"));
  }
  -[StackController setNeedsToUpdateStackElements](self, "setNeedsToUpdateStackElements");
}

- (double)stackElement:(id)a3 delayForAnimation:(int)a4
{
  uint64_t v4;
  StackDelegate *v7;
  double result;

  v4 = *(_QWORD *)&a4;
  v7 = -[StackController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v7, "stackController:delayForItem:animation:") & 1) == 0)
    return 0.0;
  -[StackDelegate stackController:delayForItem:animation:](v7, "stackController:delayForItem:animation:", self, objc_msgSend(a3, "item"), v4);
  return result;
}

- (void)stackRevealGroupDidFinish:(id)a3
{
  -[StackController setRevealGroup:](self, "setRevealGroup:", 0);
  -[StackController setNeedsToUpdateStackElements](self, "setNeedsToUpdateStackElements");
}

- (id)stackedViews
{
  NSMutableArray *v3;
  NSMutableArray *stackedItems;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  id v10;
  NSMutableArray *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_opt_new(NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  stackedItems = self->_stackedItems;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stackedItems, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(stackedItems);
        v9 = -[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), 0);
        if (v9)
        {
          v10 = v9;
          if (objc_msgSend(v9, "currentState") == (id)4)
            -[NSMutableArray addObject:](v3, "addObject:", v10);
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stackedItems, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  -[NSMutableArray sortUsingFunction:context:](v3, "sortUsingFunction:context:", sub_100015200, 0);
  v11 = v3;
  return -[NSMutableArray valueForKeyPath:](v3, "valueForKeyPath:", CFSTR("outerView"));
}

- (StackDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (StackDataSource *)a3;
}

- (StackDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (StackDelegate *)a3;
}

- (id)defaultItem
{
  return self->_defaultItem;
}

- (UIView)defaultView
{
  return self->_defaultView;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setTransitionEdge:(unint64_t)a3
{
  self->_transitionEdge = a3;
}

@end

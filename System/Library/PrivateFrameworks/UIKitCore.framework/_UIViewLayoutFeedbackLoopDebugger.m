@implementation _UIViewLayoutFeedbackLoopDebugger

+ (id)layoutFeedbackLoopDebugger
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63___UIViewLayoutFeedbackLoopDebugger_layoutFeedbackLoopDebugger__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7B5B0 != -1)
    dispatch_once(&qword_1ECD7B5B0, block);
  return (id)qword_1ECD7B5A8;
}

- (void)didEnterLayoutSublayersOfLayerForView:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_debuggingState >= 2)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_currentLayoutView, a3);
    objc_msgSend(v6, "_lfld_pushCurrentLayoutMethodName:", CFSTR("layoutSublayersOfLayer:"));
    v5 = v6;
  }

}

- (void)willExitLayoutSublayersOfLayerForView:(id)a3
{
  UIView *currentLayoutView;
  id v4;

  if (self->_debuggingState >= 2)
  {
    currentLayoutView = self->_currentLayoutView;
    self->_currentLayoutView = 0;
    v4 = a3;

    objc_msgSend(v4, "_lfld_discardLastCurrentLayoutMethodName");
  }
}

- (void)willSendLayoutSubviewsToView:(id)a3
{
  UIView *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *v9;
  NSMutableArray *layoutList;
  NSMutableSet *v11;
  NSMutableSet *involvedViews;
  int64_t v13;
  UIView *rootView;
  UIView **p_rootView;
  uint64_t v16;
  NSMutableSet *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  int64_t rootViewLayoutCount;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  NSArray *v41;
  NSArray *reducedLayoutList;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  NSArray *obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  const __CFString *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = (UIView *)a3;
  -[UIView _lfld_incrementCount](v5, "_lfld_incrementCount");
  -[UIView _lfld_prepareToResetCountIfNecessary](v5, "_lfld_prepareToResetCountIfNecessary");
  v6 = -[UIView _lfld_count](v5, "_lfld_count");
  v7 = qword_1ECD7B5D0;
  if (v6 > qword_1ECD7B5D0)
  {
    self->_debuggingState = 3;
LABEL_6:
    -[_UIViewLayoutFeedbackLoopDebugger dumpInfoWithInfoCollectionSuccess:](self, "dumpInfoWithInfoCollectionSuccess:", v6 <= v7);
    goto LABEL_7;
  }
  switch(self->_debuggingState)
  {
    case 0:
      v8 = -[UIView _lfld_count](v5, "_lfld_count");
      if (v8 != qword_1ECD7B5B8)
        goto LABEL_7;
      objc_storeStrong((id *)&self->_rootView, a3);
      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      layoutList = self->_layoutList;
      self->_layoutList = v9;

      v11 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v5, 0);
      involvedViews = self->_involvedViews;
      self->_involvedViews = v11;

      v13 = 1;
      goto LABEL_58;
    case 1:
      -[NSMutableArray addObject:](self->_layoutList, "addObject:", v5);
      -[NSMutableSet addObject:](self->_involvedViews, "addObject:", v5);
      p_rootView = &self->_rootView;
      rootView = self->_rootView;
      if (rootView != v5 && -[UIView isDescendantOfView:](rootView, "isDescendantOfView:", v5))
        objc_storeStrong((id *)&self->_rootView, a3);
      v16 = -[NSMutableArray count](self->_layoutList, "count");
      if (v16 != qword_1ECD7B5C8)
        goto LABEL_7;
      self->_rootViewConfirmed = 1;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v17 = self->_involvedViews;
      v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
      if (!v18)
        goto LABEL_29;
      v19 = v18;
      v20 = *(_QWORD *)v59;
      break;
    case 2:
      if (self->_rootView == v5)
      {
        rootViewLayoutCount = self->_rootViewLayoutCount;
        self->_rootViewLayoutCount = rootViewLayoutCount + 1;
        if (rootViewLayoutCount >= 10)
          self->_debuggingState = 3;
      }
      -[UIView _lfld_pushCurrentLayoutMethodName:](v5, "_lfld_pushCurrentLayoutMethodName:", CFSTR("layoutSubviews"));
      v23 = qword_1ECD7B5E0;
      if (!qword_1ECD7B5E0)
      {
        v23 = __UILogCategoryGetNode("LayoutLoop", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v23, (unint64_t *)&qword_1ECD7B5E0);
      }
      v24 = *(NSObject **)(v23 + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = v24;
        -[UIView _lfld_minimalDescription](v5, "_lfld_minimalDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v63 = CFSTR("layoutSubviews");
        v64 = 2112;
        v65 = v26;
        v66 = 2112;
        v67 = v27;
        _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "About to send -%@ to %@. \n%@", buf, 0x20u);

      }
      goto LABEL_7;
    case 3:
      goto LABEL_6;
    default:
      goto LABEL_7;
  }
  while (2)
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v59 != v20)
        objc_enumerationMutation(v17);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "isDescendantOfView:", *p_rootView) & 1) == 0)
      {
        self->_rootViewConfirmed = 0;
        goto LABEL_29;
      }
    }
    v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    if (v19)
      continue;
    break;
  }
LABEL_29:

  if (self->_rootViewConfirmed)
  {
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29 = (void *)-[NSMutableArray copy](self->_layoutList, "copy");
    v30 = objc_msgSend(v29, "indexOfObject:", self->_rootView);
    if (v30 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v31 = v29;
    }
    else
    {
      v32 = (void *)MEMORY[0x1E0C9AA60];
      do
      {
        v33 = v30 + 1;
        objc_msgSend(v29, "subarrayWithRange:", 0, v30 + 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v34);

        v31 = v32;
        if (v33 < objc_msgSend(v29, "count"))
        {
          objc_msgSend(v29, "subarrayWithRange:", v33, objc_msgSend(v29, "count") - v33);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v30 = objc_msgSend(v31, "indexOfObject:", *p_rootView);
        v29 = v31;
      }
      while (v30 != 0x7FFFFFFFFFFFFFFFLL);
    }
    if (objc_msgSend(v28, "count"))
      objc_msgSend(v28, "removeObjectAtIndex:", 0);
    if ((unint64_t)objc_msgSend(v28, "count") < 2)
      goto LABEL_56;
    objc_msgSend(v28, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    self->_feedbackLoopConfirmed = 1;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v36 = v28;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v55;
      while (2)
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v55 != v39)
            objc_enumerationMutation(v36);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "isEqualToArray:", v35) & 1) == 0)
          {
            self->_feedbackLoopConfirmed = 0;
            goto LABEL_49;
          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
        if (v38)
          continue;
        break;
      }
    }
LABEL_49:

    if (self->_feedbackLoopConfirmed)
    {
      v41 = v35;
      reducedLayoutList = self->_reducedLayoutList;
      self->_reducedLayoutList = v41;
    }
    else
    {
      if ((unint64_t)objc_msgSend(v36, "count") < 4)
      {
LABEL_52:
        if (self->_feedbackLoopConfirmed)
        {
          v43 = -[NSMutableSet count](self->_involvedViews, "count");
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_reducedLayoutList);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "count");

          if (v43 != v45)
            self->_feedbackLoopConfirmed = 0;
        }

LABEL_56:
        goto LABEL_57;
      }
      self->_feedbackLoopConfirmed = 1;
      objc_msgSend(v36, "firstObject");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "arrayByAddingObjectsFromArray:", v47);
      obj = (NSArray *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)(objc_msgSend(v36, "count") - 4) <= 0xFFFFFFFFFFFFFFFCLL)
      {
        v48 = 2;
        while (1)
        {
          objc_msgSend(v36, "objectAtIndexedSubscript:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v48 + 1;
          objc_msgSend(v36, "objectAtIndexedSubscript:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "arrayByAddingObjectsFromArray:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v52, "isEqualToArray:", obj) & 1) == 0)
            break;

          v48 = v50 + 1;
          if (v48 >= objc_msgSend(v36, "count") - 1)
            goto LABEL_66;
        }
        self->_feedbackLoopConfirmed = 0;

      }
LABEL_66:
      reducedLayoutList = obj;
      if (self->_feedbackLoopConfirmed)
        objc_storeStrong((id *)&self->_reducedLayoutList, obj);
    }

    goto LABEL_52;
  }
LABEL_57:
  v13 = 2;
LABEL_58:
  self->_debuggingState = v13;
LABEL_7:

}

- (void)didSendLayoutSubviewsToView:(id)a3
{
  if (self->_debuggingState >= 2)
    objc_msgSend(a3, "_lfld_discardLastCurrentLayoutMethodName");
}

- (void)willSendViewWillLayoutSubviewsToViewControllerOfView:(id)a3
{
  if (self->_debuggingState >= 2)
    objc_msgSend(a3, "_lfld_pushCurrentLayoutMethodName:", CFSTR("viewWillLayoutSubviews"));
}

- (void)didSendViewWillLayoutSubviewsToViewControllerOfView:(id)a3
{
  if (self->_debuggingState >= 2)
    objc_msgSend(a3, "_lfld_discardLastCurrentLayoutMethodName");
}

- (void)willSendViewDidLayoutSubviewsToViewControllerOfView:(id)a3
{
  if (self->_debuggingState >= 2)
    objc_msgSend(a3, "_lfld_pushCurrentLayoutMethodName:", CFSTR("viewDidLayoutSubviews"));
}

- (void)didSendViewDidLayoutSubviewsToViewControllerOfView:(id)a3
{
  if (self->_debuggingState >= 2)
    objc_msgSend(a3, "_lfld_discardLastCurrentLayoutMethodName");
}

- (id)viewsWithVariableChangesTriggeringLayoutCreateIfNecessary
{
  NSMutableSet *viewsWithVariableChangesTriggeringLayout;
  NSMutableSet *v4;
  NSMutableSet *v5;

  viewsWithVariableChangesTriggeringLayout = self->_viewsWithVariableChangesTriggeringLayout;
  if (!viewsWithVariableChangesTriggeringLayout)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = self->_viewsWithVariableChangesTriggeringLayout;
    self->_viewsWithVariableChangesTriggeringLayout = v4;

    viewsWithVariableChangesTriggeringLayout = self->_viewsWithVariableChangesTriggeringLayout;
  }
  return viewsWithVariableChangesTriggeringLayout;
}

- (void)willSendSetNeedsLayoutToView:(id)a3 becauseOfChangeInVariable:(id)a4 inLayoutEngine:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  if (self->_debuggingState >= 2)
  {
    v7 = a5;
    v8 = a4;
    -[_UIViewLayoutFeedbackLoopDebugger viewsWithVariableChangesTriggeringLayoutCreateIfNecessary](self, "viewsWithVariableChangesTriggeringLayoutCreateIfNecessary");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v9);
    objc_msgSend(v9, "_lfld_addVariableChangeRecordForVariable:inLayoutEngine:", v8, v7);

  }
}

- (id)turningPointViewsCreateIfNecessary
{
  NSMutableSet *turningPointViews;
  NSMutableSet *v4;
  NSMutableSet *v5;

  turningPointViews = self->_turningPointViews;
  if (!turningPointViews)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = self->_turningPointViews;
    self->_turningPointViews = v4;

    turningPointViews = self->_turningPointViews;
  }
  return turningPointViews;
}

- (void)_recordSetNeedsLayoutToLayerOfView:(id)a3
{
  UIView *v4;
  UIView *currentLayoutView;
  _BOOL4 v6;
  unint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  int v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (UIView *)a3;
  if (self->_debuggingState >= 2)
  {
    currentLayoutView = self->_currentLayoutView;
    if (!currentLayoutView)
    {
      if (self->_rootView != v4)
        goto LABEL_15;
      v17 = qword_1ECD7B5F0;
      if (!qword_1ECD7B5F0)
      {
        v17 = __UILogCategoryGetNode("LayoutLoop", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, (unint64_t *)&qword_1ECD7B5F0);
      }
      v18 = *(NSObject **)(v17 + 8);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      v15 = v18;
      -[UIView _lfld_minimalDescription](v4, "_lfld_minimalDescription");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v19;
      v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "About to send -setNeedsLayout to layer for %@ \n%@", (uint8_t *)&v21, 0x16u);

LABEL_12:
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _lfld_addSetNeedsLayoutCallStack:](v4, "_lfld_addSetNeedsLayoutCallStack:", v16);

      goto LABEL_15;
    }
    v6 = -[UIView isDescendantOfView:](currentLayoutView, "isDescendantOfView:", v4);
    v7 = qword_1ECD7B5E8;
    if (!qword_1ECD7B5E8)
    {
      v7 = __UILogCategoryGetNode("LayoutLoop", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&qword_1ECD7B5E8);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (v6)
        v9 = CFSTR(">>>UPSTREAM LAYOUT DIRTYING<<< ");
      else
        v9 = &stru_1E16EDF20;
      v10 = v8;
      -[UIView _lfld_minimalDescription](v4, "_lfld_minimalDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _lfld_currentLayoutMethodName](self->_currentLayoutView, "_lfld_currentLayoutMethodName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _lfld_minimalDescription](self->_currentLayoutView, "_lfld_minimalDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138413314;
      v22 = v9;
      v23 = 2112;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      v27 = 2112;
      v28 = v13;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "%@About to send -setNeedsLayout to layer for %@ under -%@ for %@ \n%@", (uint8_t *)&v21, 0x34u);

    }
    if (v6)
    {
      -[_UIViewLayoutFeedbackLoopDebugger turningPointViewsCreateIfNecessary](self, "turningPointViewsCreateIfNecessary");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v15, "addObject:", v4);
      goto LABEL_12;
    }
  }
LABEL_15:

}

- (id)viewsWithChangingGeometryCreateIfNecessary
{
  NSMutableSet *viewsWithChangingGeometry;
  NSMutableSet *v4;
  NSMutableSet *v5;

  viewsWithChangingGeometry = self->_viewsWithChangingGeometry;
  if (!viewsWithChangingGeometry)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = self->_viewsWithChangingGeometry;
    self->_viewsWithChangingGeometry = v4;

    viewsWithChangingGeometry = self->_viewsWithChangingGeometry;
  }
  return viewsWithChangingGeometry;
}

- (void)willChangeGeometryForLayerOfView:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "needsLayoutOnGeometryChange");

  v6 = v11;
  if (v5)
  {
    -[_UIViewLayoutFeedbackLoopDebugger willSendSetNeedsLayoutToLayerOfView:](self, "willSendSetNeedsLayoutToLayerOfView:", v11);
    objc_msgSend(v11, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "layoutIsActive");

      if ((v10 & 1) == 0)
        -[_UIViewLayoutFeedbackLoopDebugger willSendSetNeedsLayoutToLayerOfView:](self, "willSendSetNeedsLayoutToLayerOfView:", v8);
    }

    v6 = v11;
  }

}

- (void)willSendSetBounds:(CGRect)a3 toLayerOfView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  id v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  -[_UIViewLayoutFeedbackLoopDebugger willChangeGeometryForLayerOfView:](self, "willChangeGeometryForLayerOfView:");
  if (self->_debuggingState >= 2)
  {
    -[_UIViewLayoutFeedbackLoopDebugger viewsWithChangingGeometryCreateIfNecessary](self, "viewsWithChangingGeometryCreateIfNecessary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_lfld_addGeometryChangeRecordWithPropertyName:value:", CFSTR("bounds"), v10);

  }
}

- (void)willSendSetPosition:(CGPoint)a3 toLayerOfView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;

  if (self->_debuggingState >= 2)
  {
    y = a3.y;
    x = a3.x;
    v7 = a4;
    -[_UIViewLayoutFeedbackLoopDebugger viewsWithChangingGeometryCreateIfNecessary](self, "viewsWithChangingGeometryCreateIfNecessary");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v7);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_lfld_addGeometryChangeRecordWithPropertyName:value:", CFSTR("center"), v8);

  }
}

- (void)willSendSetFrame:(CGRect)a3 toLayerOfView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  id v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  -[_UIViewLayoutFeedbackLoopDebugger willChangeGeometryForLayerOfView:](self, "willChangeGeometryForLayerOfView:");
  if (self->_debuggingState >= 2)
  {
    -[_UIViewLayoutFeedbackLoopDebugger viewsWithChangingGeometryCreateIfNecessary](self, "viewsWithChangingGeometryCreateIfNecessary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_lfld_addGeometryChangeRecordWithPropertyName:value:", CFSTR("frame"), v10);

  }
}

- (void)willSendSetAnchorPoint:(CGPoint)a3 toLayerOfView:(id)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  id v9;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  -[_UIViewLayoutFeedbackLoopDebugger willChangeGeometryForLayerOfView:](self, "willChangeGeometryForLayerOfView:");
  if (self->_debuggingState >= 2)
  {
    -[_UIViewLayoutFeedbackLoopDebugger viewsWithChangingGeometryCreateIfNecessary](self, "viewsWithChangingGeometryCreateIfNecessary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_lfld_addGeometryChangeRecordWithPropertyName:value:", CFSTR("anchorPoint"), v8);

  }
}

- (void)didUpdateSafeAreaInsets:(UIEdgeInsets)a3 ofView:(id)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  void *v10;
  id v11;

  if (self->_debuggingState >= 2)
  {
    right = a3.right;
    bottom = a3.bottom;
    left = a3.left;
    top = a3.top;
    v9 = a4;
    -[_UIViewLayoutFeedbackLoopDebugger viewsWithChangingGeometryCreateIfNecessary](self, "viewsWithChangingGeometryCreateIfNecessary");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v9);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIEdgeInsets:", top, left, bottom, right);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_lfld_addGeometryChangeRecordWithPropertyName:value:", CFSTR("safeAreaInsets"), v10);

  }
}

- (void)didUpdateLayoutMargins:(UIEdgeInsets)a3 ofView:(id)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  void *v10;
  id v11;

  if (self->_debuggingState >= 2)
  {
    right = a3.right;
    bottom = a3.bottom;
    left = a3.left;
    top = a3.top;
    v9 = a4;
    -[_UIViewLayoutFeedbackLoopDebugger viewsWithChangingGeometryCreateIfNecessary](self, "viewsWithChangingGeometryCreateIfNecessary");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v9);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIEdgeInsets:", top, left, bottom, right);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_lfld_addGeometryChangeRecordWithPropertyName:value:", CFSTR("layoutMargins"), v10);

  }
}

- (void)dumpInfoWithInfoCollectionSuccess:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  _UIViewLayoutFeedbackLoopDebugger *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(CFSTR("Degenerate layout!"), "mutableCopy", a3);
  v5 = v4;
  if (self->_feedbackLoopConfirmed)
  {
    objc_msgSend(v4, "appendString:", CFSTR(" Layout feedback loop detected"));
    if (self->_rootViewConfirmed)
    {
      -[UIView _lfld_description](self->_rootView, "_lfld_description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR(" in subtree of %@. "), v6);
    }
    else
    {
      -[NSMutableSet allObjects](self->_involvedViews, "allObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _UIViewLFLDDescriptionForArray(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR(" involving\n%@\n"), v7);

    }
  }
  else
  {
    -[UIView _lfld_description](self->_rootView, "_lfld_description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" Layout feedback loop suspected in subtree of %@, but the information is incomplete. "), v6);
  }

  v8 = dumpInfoWithInfoCollectionSuccess____s_category;
  if (!dumpInfoWithInfoCollectionSuccess____s_category)
  {
    v8 = __UILogCategoryGetNode("LayoutLoop", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&dumpInfoWithInfoCollectionSuccess____s_category);
  }
  v9 = *(NSObject **)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = self;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%@\n%@", buf, 0x16u);
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("More info may be available in the log for %s.%@"), "com.apple.UIKit", CFSTR("LayoutLoop"));
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "raise");

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  UIView *rootView;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  UIView *v45;
  UIView *v46;
  _UIViewLayoutFeedbackLoopDebugger *v47;
  NSMutableSet *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  UIView *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v59;
  NSMutableSet *obj;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  id v69;
  void *v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(CFSTR("\n"), "mutableCopy");
  v4 = v3;
  if (!self->_feedbackLoopConfirmed)
  {
    if (qword_1ECD7B5B8 >= 10000)
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("Unable to confirm the layout feedback loop. %@\n"), CFSTR("The following information is likely to be incomplete."));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The loop trigger threshold is %ld and may be too low. Use the -%s launch argument to try a higher threshold, up to %ld."), qword_1ECD7B5B8, "UIViewLayoutFeedbackLoopDebuggingThreshold", 10000);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("Unable to confirm the layout feedback loop. %@\n"), v5);

    }
  }
  rootView = self->_rootView;
  if (rootView)
  {
    -[UIView _lfld_description](rootView, "_lfld_description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Top-level view = %@\n\n"), v7);

  }
  if ((unint64_t)-[NSMutableSet count](self->_involvedViews, "count") >= 2)
  {
    -[_UIViewLayoutFeedbackLoopDebugger topLevelViewHierarchyTrace](self, "topLevelViewHierarchyTrace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Views caught in loop: %@\n\n"), v8);

  }
  if (-[NSArray count](self->_reducedLayoutList, "count"))
  {
    _UIViewLFLDDescriptionForArray(self->_reducedLayoutList);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Views receiving layout in order: %@\n\n"), v9);

  }
  v10 = -[NSMutableSet count](self->_viewsWithVariableChangesTriggeringLayout, "count");
  v11 = -[NSMutableSet count](self->_viewsWithChangingGeometry, "count");
  v59 = v10;
  if (v10)
  {
    objc_msgSend(v4, "appendString:", CFSTR("\n*** Views With Variable Changes Triggering Layout ***\n"));
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = self->_viewsWithVariableChangesTriggeringLayout;
    v63 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
    if (v63)
    {
      v61 = *(_QWORD *)v89;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v89 != v61)
            objc_enumerationMutation(obj);
          v64 = v12;
          v13 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v12);
          objc_msgSend(v13, "_lfld_minimalDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_lfld_variableChangeRecords");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("\nVariable change records for %@:\n%@\n"), v14, v15);

          v62 = objc_msgSend(v13, "hasAmbiguousLayout");
          v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v87 = 0u;
          objc_msgSend(v13, "_lfld_variableChangeRecords");
          v68 = (id)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v85;
            v65 = *(_QWORD *)v85;
            v66 = v16;
            do
            {
              v20 = 0;
              v67 = v18;
              do
              {
                if (*(_QWORD *)v85 != v19)
                  objc_enumerationMutation(v68);
                objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * v20), "variable");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v16, "containsObject:", v21) & 1) == 0)
                {
                  objc_msgSend(v16, "addObject:", v21);
                  objc_msgSend(v21, "delegate");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v22, "conformsToProtocol:", &unk_1EDDD3D78) & 1) == 0)
                  {

                    v22 = 0;
                  }
                  objc_msgSend(v22, "_referenceView");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v23)
                  {
                    v70 = v22;
                    v71 = v20;
                    v69 = v23;
                    objc_msgSend(v23, "_lfld_constraintsAffectingVariableValueChanges");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "objectForKey:", v21);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();

                    v82 = 0u;
                    v83 = 0u;
                    v80 = 0u;
                    v81 = 0u;
                    objc_msgSend(v25, "keyEnumerator");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
                    if (v27)
                    {
                      v28 = v27;
                      v29 = *(_QWORD *)v81;
                      do
                      {
                        for (i = 0; i != v28; ++i)
                        {
                          if (*(_QWORD *)v81 != v29)
                            objc_enumerationMutation(v26);
                          v31 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i);
                          objc_msgSend(v25, "objectForKey:", v31);
                          v32 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v4, "appendFormat:", CFSTR("\nConstraints contributing to value of %@ for %@\n %@\n"), v31, v21, v32);

                        }
                        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
                      }
                      while (v28);
                    }

                    v19 = v65;
                    v16 = v66;
                    v18 = v67;
                    v22 = v70;
                    v20 = v71;
                    v23 = v69;
                  }

                }
                ++v20;
              }
              while (v20 != v18);
              v18 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
            }
            while (v18);
          }

          v12 = v64 + 1;
        }
        while (v64 + 1 != v63);
        v63 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
      }
      while (v63);
      goto LABEL_49;
    }
LABEL_48:
    v62 = 0;
LABEL_49:

    goto LABEL_50;
  }
  if (v11)
  {
    objc_msgSend(v4, "appendString:", CFSTR("\n*** Views With Geometry Changes ***\n"));
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    obj = self->_viewsWithChangingGeometry;
    v33 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v77;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v77 != v35)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
          objc_msgSend(v37, "_lfld_minimalDescription");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "_lfld_geometryChangeRecords");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("Geometry change records for %@:\n%@\n"), v38, v39);

        }
        v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
      }
      while (v34);
    }
    goto LABEL_48;
  }
  v62 = 0;
LABEL_50:
  -[UIView _lfld_setNeedsLayoutCallStacks](self->_rootView, "_lfld_setNeedsLayoutCallStacks");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "count");

  if (v41)
  {
    -[UIView _lfld_setNeedsLayoutCallStacks](self->_rootView, "_lfld_setNeedsLayoutCallStacks");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v59)
    {
      objc_msgSend(v42, "anyObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("\n*** Representative call stack where -setNeedsLayout is sent to the top-level view ***\n%@\n"), v44);

    }
    else
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("\n*** Call stacks where -setNeedsLayout is sent to the top-level view ***\n%@\n"), v42);
    }

  }
  if ((unint64_t)-[NSMutableSet count](self->_turningPointViews, "count") > 1
    || -[NSMutableSet count](self->_turningPointViews, "count") == 1
    && (-[NSMutableSet anyObject](self->_turningPointViews, "anyObject"),
        v45 = (UIView *)objc_claimAutoreleasedReturnValue(),
        v46 = self->_rootView,
        v45,
        v45 != v46))
  {
    objc_msgSend(v4, "appendString:", CFSTR("\n*** Additional (non-top-level) Views Receiving Upstream Layout Dirtying ***\n"));
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v47 = self;
    v48 = self->_turningPointViews;
    v49 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v73;
      do
      {
        for (k = 0; k != v50; ++k)
        {
          if (*(_QWORD *)v73 != v51)
            objc_enumerationMutation(v48);
          v53 = *(UIView **)(*((_QWORD *)&v72 + 1) + 8 * k);
          if (v53 != v47->_rootView)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * k), "_lfld_minimalDescription");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView _lfld_setNeedsLayoutCallStacks](v53, "_lfld_setNeedsLayoutCallStacks");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "appendFormat:", CFSTR("\n\t>>> Call stacks where -setNeedsLayout is sent upstream to %@\n%@\n"), v54, v55);

          }
        }
        v50 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
      }
      while (v50);
    }

  }
  if ((v62 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Ambiguous layout suspected as a cause of this layout feedback loop.%@"), v4);
    v56 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v56 = v4;
  }
  v57 = v56;

  return v57;
}

- (id)topLevelViewHierarchyTrace
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *(*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__241;
  v11 = __Block_byref_object_dispose__241;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63___UIViewLayoutFeedbackLoopDebugger_topLevelViewHierarchyTrace__block_invoke;
  v6[3] = &unk_1E16EC730;
  v6[4] = self;
  v6[5] = &v7;
  v2 = _Block_copy(v6);
  v3 = (void *)v8[5];
  v8[5] = (uint64_t)v2;

  (*(void (**)(void))(v8[5] + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (UIView)currentLayoutView
{
  return self->_currentLayoutView;
}

- (void)setCurrentLayoutView:(id)a3
{
  objc_storeStrong((id *)&self->_currentLayoutView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayoutView, 0);
  objc_storeStrong((id *)&self->_reducedLayoutList, 0);
  objc_storeStrong((id *)&self->_layoutList, 0);
  objc_storeStrong((id *)&self->_involvedViews, 0);
  objc_storeStrong((id *)&self->_turningPointViews, 0);
  objc_storeStrong((id *)&self->_viewsWithVariableChangesTriggeringLayout, 0);
  objc_storeStrong((id *)&self->_viewsWithChangingGeometry, 0);
  objc_storeStrong((id *)&self->_rootView, 0);
}

+ (void)createLayoutFeedbackLoopDebuggerForUnitTests
{
  id v2;
  void *v3;

  if (!qword_1ECD7B5A8)
  {
    qword_1ECD7B5B8 = 100;
    qword_1ECD7B5C8 = 100;
    qword_1ECD7B5D0 = 1000;
    v2 = objc_alloc_init((Class)a1);
    v3 = (void *)qword_1ECD7B5A8;
    qword_1ECD7B5A8 = (uint64_t)v2;

  }
}

+ (void)destroyLayoutFeedbackLoopDebuggerForUnitTests
{
  void *v2;

  qword_1ECD7B5B8 = 0;
  qword_1ECD7B5C8 = 0;
  qword_1ECD7B5D0 = 0;
  v2 = (void *)qword_1ECD7B5A8;
  qword_1ECD7B5A8 = 0;

}

@end

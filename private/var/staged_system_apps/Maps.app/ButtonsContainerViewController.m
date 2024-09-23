@implementation ButtonsContainerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ButtonsContainerViewController)initWithCoder:(id)a3
{
  return -[ButtonsContainerViewController initWithFloatingButtonItems:](self, "initWithFloatingButtonItems:", 0);
}

- (ButtonsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[ButtonsContainerViewController initWithFloatingButtonItems:](self, "initWithFloatingButtonItems:", 0, a4);
}

- (ButtonsContainerViewController)initWithFloatingButtonItems:(id)a3
{
  return -[ButtonsContainerViewController initWithFloatingButtonItems:visualEffectDisabled:](self, "initWithFloatingButtonItems:visualEffectDisabled:", a3, 0);
}

- (ButtonsContainerViewController)initWithFloatingButtonItems:(id)a3 visualEffectDisabled:(BOOL)a4
{
  id v6;
  ButtonsContainerViewController *v7;
  UIStackView *v8;
  UIStackView *stackView;
  NSArray *v10;
  NSArray *floatingButtonItems;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ButtonsContainerViewController;
  v7 = -[ButtonsContainerViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", 0, 0);
  if (v7)
  {
    v8 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    stackView = v7->_stackView;
    v7->_stackView = v8;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v7->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7->_visualEffectDisabled = a4;
    v10 = (NSArray *)objc_msgSend(v6, "copy");
    floatingButtonItems = v7->_floatingButtonItems;
    v7->_floatingButtonItems = v10;

    -[ButtonsContainerViewController refreshControls](v7, "refreshControls");
  }

  return v7;
}

- (void)loadView
{
  NSString *v3;
  BOOL visualEffectDisabled;
  id v5;
  NSString *v6;
  id v7;
  _QWORD *v8;
  id v9;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  NSArray *v16;
  NSArray *groupVCs;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  NSString *v23;
  id v24;
  BOOL v25;
  _BYTE v26[128];

  v3 = self->_blurGroupName;
  visualEffectDisabled = self->_visualEffectDisabled;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1002CB93C;
  v22[3] = &unk_1011B01A0;
  v25 = visualEffectDisabled;
  v6 = v3;
  v23 = v6;
  v7 = v5;
  v24 = v7;
  v8 = objc_retainBlock(v22);
  v9 = objc_alloc_init((Class)NSMutableArray);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = self->_floatingButtonItems;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v15, "isSeparator", (_QWORD)v18) & 1) != 0)
        {
          if (objc_msgSend(v9, "count"))
          {
            ((void (*)(_QWORD *, id))v8[2])(v8, v9);
            objc_msgSend(v9, "removeAllObjects");
          }
        }
        else
        {
          objc_msgSend(v9, "addObject:", v15);
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
    ((void (*)(_QWORD *, id))v8[2])(v8, v9);
  v16 = (NSArray *)objc_msgSend(v7, "copy", (_QWORD)v18);
  groupVCs = self->_groupVCs;
  self->_groupVCs = v16;

  -[ButtonsContainerViewController setView:](self, "setView:", self->_stackView);
}

- (void)viewDidLoad
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ButtonsContainerViewController;
  -[ButtonsContainerViewController viewDidLoad](&v5, "viewDidLoad");
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 10.0);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 0);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  LODWORD(v3) = 1148846080;
  -[UIStackView setContentHuggingPriority:forAxis:](self->_stackView, "setContentHuggingPriority:forAxis:", 0, v3);
  LODWORD(v4) = 1148846080;
  -[UIStackView setContentCompressionResistancePriority:forAxis:](self->_stackView, "setContentCompressionResistancePriority:forAxis:", 0, v4);
}

- (void)setBlurGroupName:(id)a3
{
  NSString *v4;
  NSString *blurGroupName;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = (NSString *)objc_msgSend(a3, "copy");
  blurGroupName = self->_blurGroupName;
  self->_blurGroupName = v4;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_groupVCs;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "setBlurGroupName:", self->_blurGroupName, (_QWORD)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)hideNonVisibleControls:(int64_t)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_groupVCs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "hideNonVisibleControls:", a3, (_QWORD)v12);
        v10 = objc_msgSend(v9, "hasShownControls") ^ 1;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
        objc_msgSend(v11, "setHidden:", v10);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)setVisibleControls:(int64_t)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  double v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_groupVCs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "setVisibleControls:", a3, (_QWORD)v12);
        if (objc_msgSend(v9, "hasVisibleControls"))
          v10 = 1.0;
        else
          v10 = 0.0;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
        objc_msgSend(v11, "setAlpha:", v10);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)showVisibleControls:(int64_t)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_groupVCs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "showVisibleControls:", a3, (_QWORD)v12);
        v10 = objc_msgSend(v9, "hasShownControls") ^ 1;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
        objc_msgSend(v11, "setHidden:", v10);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)refreshControls
{
  id v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  UIStackView *stackView;
  id v12;
  _QWORD block[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_groupVCs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "refreshControls");
        -[ButtonsContainerViewController addChildViewController:](self, "addChildViewController:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
        objc_msgSend(v3, "addObject:", v10);

        objc_msgSend(v9, "didMoveToParentViewController:", self);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  stackView = self->_stackView;
  v12 = objc_msgSend(v3, "copy");
  -[UIStackView _maps_setArrangedSubviews:](stackView, "_maps_setArrangedSubviews:", v12);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002CC0D0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (NSArray)floatingButtonItems
{
  return self->_floatingButtonItems;
}

- (NSString)blurGroupName
{
  return self->_blurGroupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurGroupName, 0);
  objc_storeStrong((id *)&self->_floatingButtonItems, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_groupVCs, 0);
}

@end

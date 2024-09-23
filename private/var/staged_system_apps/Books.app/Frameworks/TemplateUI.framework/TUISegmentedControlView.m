@implementation TUISegmentedControlView

+ (id)tuiReuseIdentifier
{
  return CFSTR("TUIReuseIdentifierSegmentedControlView");
}

- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  objc_super v25;

  if (a3)
  {
    right = a4.right;
    bottom = a4.bottom;
    left = a4.left;
    top = a4.top;
    v9 = a3;
    v11 = objc_opt_class(TUIRenderModelSegmentedControl, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
    v13 = TUIDynamicCast(v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    v16 = objc_opt_class(TUIRenderModelSegmentedControl, v15);
    v17 = TUIDynamicCast(v16, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v25.receiver = self;
    v25.super_class = (Class)TUISegmentedControlView;
    -[TUIInteractiveBaseView configureWithModel:outsets:](&v25, "configureWithModel:outsets:", v9, top, left, bottom, right);

    if (v14 != v18 && (objc_msgSend(v14, "isEqualToRenderModel:", v18) & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "viewState"));
      -[TUISegmentedControlView setDynamicViewState:](self, "setDynamicViewState:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUISegmentedControlView viewState](self, "viewState"));
      if (v20)
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUISegmentedControlView viewState](self, "viewState"));
      else
        v21 = v18;
      v22 = objc_msgSend(v21, "selectIndex");
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "segments"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tintColor"));
      -[TUISegmentedControlView updateControlWithSelectIndex:segments:tintColor:](self, "updateControlWithSelectIndex:segments:tintColor:", v22, v23, v24);

      if (v20)
    }

  }
}

- (void)_updateDynamicViewState
{
  void *v3;
  TUIMutableDynamicValue *dynamicViewState;
  TUIMutableDynamicValue *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (v3)
  {
    dynamicViewState = self->_dynamicViewState;

    if (dynamicViewState)
    {
      v5 = self->_dynamicViewState;
      v9 = CFSTR("index");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "selectedSegmentIndex")));
      v10 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
      -[TUIMutableDynamicValue updateWithValueIfChanged:](v5, "updateWithValueIfChanged:", v8);

    }
  }
}

- (void)updateControlWithSelectIndex:(int64_t)a3 segments:(id)a4 tintColor:(id)a5
{
  id v8;
  void *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v10 = (char *)objc_msgSend(v9, "numberOfSegments");
  v11 = (char *)objc_msgSend(v17, "count");
  v12 = v11;
  if ((uint64_t)v10 >= (uint64_t)v11)
    v13 = (uint64_t)v11;
  else
    v13 = (uint64_t)v10;
  if (v13 >= 1)
  {
    for (i = 0; i != v13; ++i)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", i));
      objc_msgSend(v9, "setTitle:forSegmentAtIndex:", v15, i);

    }
  }
  if ((uint64_t)v10 >= (uint64_t)v12)
  {
    while ((uint64_t)v10 > (uint64_t)v12)
      objc_msgSend(v9, "removeSegmentAtIndex:animated:", --v10, 1);
  }
  else
  {
    do
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v10));
      objc_msgSend(v9, "insertSegmentWithTitle:atIndex:animated:", v16, v10, 1);

      ++v10;
    }
    while (v12 != v10);
  }
  objc_msgSend(v9, "setSelectedSegmentIndex:", a3);
  if (v8)
    objc_msgSend(v9, "setTintColor:", v8);
  -[TUISegmentedControlView bounds](self, "bounds");
  objc_msgSend(v9, "setFrame:");

}

- (void)loadControlIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (!v3)
  {
    v5 = objc_opt_class(TUIRenderModelSegmentedControl, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
    v7 = TUIDynamicCast(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v9 = objc_alloc((Class)UISegmentedControl);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "segments"));
    v11 = objc_msgSend(v9, "initWithItems:", v10);

    -[TUISegmentedControlView bounds](self, "bounds");
    objc_msgSend(v11, "setFrame:");
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, "_segmentedControlValueChanged:", 4096);
    objc_msgSend(v11, "setAutoresizingMask:", 18);
    -[TUISegmentedControlView addSubview:](self, "addSubview:", v11);
    -[TUIInteractiveBaseView setControl:](self, "setControl:", v11);

    v3 = v11;
  }

}

- (void)_segmentedControlValueChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionHandler"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionHandler"));
    v15 = CFSTR("value");
    v9 = objc_opt_class(UISegmentedControl, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    v11 = TUIDynamicCast(v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v12, "selectedSegmentIndex")));
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    objc_msgSend(v7, "invoke:arguments:", CFSTR("valueChanged"), v14);

  }
  -[TUISegmentedControlView _updateDynamicViewState](self, "_updateDynamicViewState");
}

+ (id)renderModelWithStates:(id)a3 actionHandler:(id)a4 viewState:(id)a5 enabled:(BOOL)a6 identifier:(id)a7 name:(id)a8 selectIndex:(int64_t)a9 segments:(id)a10 tintColor:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  TUIRenderModelSegmentedControl *v24;
  void *v25;
  TUIRenderModelSegmentedControl *v26;
  _BOOL4 v28;

  v28 = a6;
  v17 = a11;
  v18 = a10;
  v19 = a8;
  v20 = a7;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = [TUIRenderModelSegmentedControl alloc];
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tuiReuseIdentifier"));
  v26 = -[TUIRenderModelSegmentedControl initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:selectIndex:segments:tintColor:](v24, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:selectIndex:segments:tintColor:", v25, v20, v23, v22, v21, v28, v19, a9, v18, v17);

  return v26;
}

- (id)viewStateSave
{
  void *v3;
  _TUISegmentedControlViewState *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (v3)
  {
    -[TUISegmentedControlView setViewState:](self, "setViewState:", 0);
    v4 = -[_TUISegmentedControlViewState initWithSelectIndex:]([_TUISegmentedControlViewState alloc], "initWithSelectIndex:", objc_msgSend(v3, "selectedSegmentIndex"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)viewStateRestore:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v6 = objc_opt_class(_TUISegmentedControlViewState, v5);
  v7 = TUIDynamicCast(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  -[TUISegmentedControlView setViewState:](self, "setViewState:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (v4 && v9)
  {
    v11 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUISegmentedControlView viewState](self, "viewState"));
    objc_msgSend(v11, "setSelectedSegmentIndex:", objc_msgSend(v10, "selectIndex"));

    v9 = v11;
  }

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (_TUISegmentedControlViewState)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
  objc_storeStrong((id *)&self->_viewState, a3);
}

- (TUIMutableDynamicValue)dynamicViewState
{
  return self->_dynamicViewState;
}

- (void)setDynamicViewState:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicViewState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicViewState, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
}

@end

@implementation TUIToggleView

+ (id)tuiReuseIdentifier
{
  return CFSTR("TUIReuseIdentifierToggleView");
}

+ (id)renderModelWithStates:(id)a3 actionHandler:(id)a4 viewState:(id)a5 enabled:(BOOL)a6 identifier:(id)a7 name:(id)a8 title:(id)a9 isOn:(BOOL)a10
{
  _BOOL8 v12;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  TUIRenderModelToggle *v23;
  void *v24;
  TUIRenderModelToggle *v25;
  uint64_t v27;

  v12 = a6;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = [TUIRenderModelToggle alloc];
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tuiReuseIdentifier"));
  LOBYTE(v27) = a10;
  v25 = -[TUIRenderModelToggle initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:title:isOn:](v23, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:title:isOn:", v24, v19, v22, v21, v20, v12, v18, v17, v27);

  return v25;
}

- (void)loadControlIfNeeded
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (!v3)
  {
    v4 = objc_alloc((Class)UISwitch);
    -[TUIToggleView bounds](self, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    objc_msgSend(v5, "addTarget:action:forControlEvents:", self, "_toggleValueChanged:", 4096);
    objc_msgSend(v5, "setAutoresizingMask:", 18);
    -[TUIToggleView addSubview:](self, "addSubview:", v5);
    -[TUIInteractiveBaseView setControl:](self, "setControl:", v5);
    v3 = v5;
  }

}

- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  v10 = objc_opt_class(TUIRenderModelToggle);
  v11 = TUIDynamicCast(v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    v13 = objc_opt_class(TUIRenderModelToggle);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
    v15 = TUIDynamicCast(v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    v17 = objc_msgSend(v12, "isOn");
    if (objc_msgSend(v12, "isEqualToRenderModel:", v16))
      v17 = (id)-[TUIToggleView controlIsOn](self, "controlIsOn");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIToggleView viewStateToRestore](self, "viewStateToRestore"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIToggleView viewStateToRestore](self, "viewStateToRestore"));
      v17 = objc_msgSend(v19, "isOn");

      -[TUIToggleView setViewStateToRestore:](self, "setViewStateToRestore:", 0);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewState"));
    -[TUIToggleView setDynamicViewState:](self, "setDynamicViewState:", v20);

    v22.receiver = self;
    v22.super_class = (Class)TUIToggleView;
    -[TUIInteractiveBaseView configureWithModel:outsets:](&v22, "configureWithModel:outsets:", v9, top, left, bottom, right);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
    -[TUIToggleView updateControlWithIsOn:title:enabled:animated:](self, "updateControlWithIsOn:title:enabled:animated:", v17, v21, objc_msgSend(v12, "enabled"), v16 != 0);

  }
}

- (void)setControlIsOn:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  objc_msgSend(v6, "setOn:animated:", v5, v4);

}

- (BOOL)controlIsOn
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v3 = objc_msgSend(v2, "isOn");

  return v3;
}

- (void)updateControlWithIsOn:(BOOL)a3 title:(id)a4 enabled:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  id v14;

  v6 = a6;
  v7 = a5;
  v8 = a3;
  v14 = a4;
  -[TUIToggleView setControlIsOn:animated:](self, "setControlIsOn:animated:", v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
  if (v11 == v14)
  {

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
    v13 = objc_msgSend(v12, "isEqualToString:", v14);

    if ((v13 & 1) == 0)
      objc_msgSend(v10, "setTitle:", v14);
  }
  objc_msgSend(v10, "setEnabled:", v7);
  -[TUIToggleView bounds](self, "bounds");
  objc_msgSend(v10, "setFrame:");

}

- (void)_toggleValueChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionHandler"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionHandler"));
    v10 = CFSTR("isOn");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[TUIToggleView controlIsOn](self, "controlIsOn")));
    v11 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    objc_msgSend(v7, "invoke:arguments:", CFSTR("valueChanged"), v9);

  }
  -[TUIToggleView _updateDynamicViewState](self, "_updateDynamicViewState");
}

- (void)_updateDynamicViewState
{
  void *v3;
  TUIMutableDynamicValue *dynamicViewState;
  TUIMutableDynamicValue *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (v3)
  {
    dynamicViewState = self->_dynamicViewState;

    if (dynamicViewState)
    {
      v5 = self->_dynamicViewState;
      v8 = CFSTR("isOn");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[TUIToggleView controlIsOn](self, "controlIsOn")));
      v9 = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
      -[TUIMutableDynamicValue updateWithValueIfChanged:](v5, "updateWithValueIfChanged:", v7);

    }
  }
}

- (id)viewStateSave
{
  void *v3;
  _TUIToggleViewState *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (v3)
    v4 = -[_TUIToggleViewState initWithIsOn:]([_TUIToggleViewState alloc], "initWithIsOn:", -[TUIToggleView controlIsOn](self, "controlIsOn"));
  else
    v4 = 0;

  return v4;
}

- (void)viewStateRestore:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));

  if (v6 && v4)
  {
    v5 = objc_msgSend(v6, "isOn");

    -[TUIToggleView setControlIsOn:animated:](self, "setControlIsOn:animated:", v5, 1);
  }
  else
  {
    -[TUIToggleView setViewStateToRestore:](self, "setViewStateToRestore:", v6);

  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIToggleView;
  -[TUIInteractiveBaseView prepareForReuse](&v3, "prepareForReuse");
  -[TUIToggleView setViewStateToRestore:](self, "setViewStateToRestore:", 0);
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

- (_TUIToggleViewState)viewStateToRestore
{
  return self->_viewStateToRestore;
}

- (void)setViewStateToRestore:(id)a3
{
  objc_storeStrong((id *)&self->_viewStateToRestore, a3);
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
  objc_storeStrong((id *)&self->_viewStateToRestore, 0);
}

@end

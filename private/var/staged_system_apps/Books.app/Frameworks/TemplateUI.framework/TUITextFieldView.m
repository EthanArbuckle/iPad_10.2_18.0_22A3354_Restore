@implementation TUITextFieldView

+ (id)renderModelWithStates:(id)a3 actionHandler:(id)a4 viewState:(id)a5 enabled:(BOOL)a6 name:(id)a7 identifier:(id)a8 editingInsets:(UIEdgeInsets)a9 style:(id)a10 placeholderText:(id)a11 text:(id)a12 returnKeyType:(id)a13 keyboardAppearance:(unint64_t)a14
{
  double right;
  double bottom;
  double left;
  double top;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  TUIRenderModelInteractiveText *v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  id v34;
  _BOOL4 v36;
  TUIRenderModelInteractiveText *v37;

  v36 = a6;
  right = a9.right;
  bottom = a9.bottom;
  left = a9.left;
  top = a9.top;
  v34 = a13;
  v32 = a12;
  v31 = a11;
  v23 = a10;
  v33 = a8;
  v24 = a7;
  v25 = a5;
  v26 = a4;
  v27 = a3;
  v28 = [TUIRenderModelInteractiveText alloc];
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tuiReuseIdentifier"));
  v37 = -[TUIRenderModelInteractiveText initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:](v28, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:", v29, v33, v27, v26, v25, v36, top, left, bottom, right, v24, v23, v31, v32, v34, a14);

  return v37;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, "_textFieldContentChanged", 0x20000);

  v4.receiver = self;
  v4.super_class = (Class)TUITextFieldView;
  -[TUITextFieldView dealloc](&v4, "dealloc");
}

+ (id)tuiReuseIdentifier
{
  return CFSTR("TUIReuseIdentifierTextFieldView");
}

- (id)currentState
{
  __CFString *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  __CFString *v8;
  __CFString **v9;

  v3 = CFSTR("default");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v5 = objc_msgSend(v4, "isEditing");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    if (!v5)
    {
LABEL_7:
      v8 = v3;
      goto LABEL_8;
    }
    v9 = TUIElementStateEditing;
    v8 = v3;
LABEL_6:
    v3 = *v9;

    goto LABEL_7;
  }
  v8 = CFSTR("hasValue");

  if ((v5 & 1) != 0)
  {
    v9 = TUIElementStateEditingHasValue;
    goto LABEL_6;
  }
LABEL_8:

  return v8;
}

- (void)loadControlIfNeeded
{
  TUIUIKitTextField *v3;
  TUIUIKitTextField *v4;
  TUIUIKitTextField *v5;

  v3 = (TUIUIKitTextField *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (!v3)
  {
    v4 = [TUIUIKitTextField alloc];
    -[TUITextFieldView bounds](self, "bounds");
    v5 = -[TUIUIKitTextField initWithFrame:](v4, "initWithFrame:");
    -[TUIUIKitTextField setDelegate:](v5, "setDelegate:", self);
    -[TUIUIKitTextField setEnabled:](v5, "setEnabled:", 1);
    -[TUIUIKitTextField setText:](v5, "setText:", 0);
    -[TUIUIKitTextField setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    -[TUIUIKitTextField addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", self, "_textFieldContentChanged", 0x20000);
    -[TUITextFieldView addSubview:](self, "addSubview:", v5);
    -[TUIInteractiveBaseView setControl:](self, "setControl:", v5);
    -[TUITextFieldView setTextInitialized:](self, "setTextInitialized:", 0);
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
  id v10;
  void *v11;
  TUIMutableDynamicValue *v12;
  TUIMutableDynamicValue *dynamicViewState;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void **v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  TUITextFieldView *v36;
  id v37;
  objc_super v38;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  v38.receiver = self;
  v38.super_class = (Class)TUITextFieldView;
  -[TUIInteractiveBaseView configureWithModel:outsets:](&v38, "configureWithModel:outsets:", v9, top, left, bottom, right);
  v10 = v9;
  v11 = v10;
  if (v10)
  {
    v12 = (TUIMutableDynamicValue *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewState"));
    dynamicViewState = self->_dynamicViewState;
    self->_dynamicViewState = v12;

    objc_msgSend(v11, "editingInsets");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v22, "setEditingInsets:", v15, v17, v19, v21);

    v32 = _NSConcreteStackBlock;
    v33 = 3221225472;
    v34 = sub_176D98;
    v35 = &unk_23D7D0;
    v36 = self;
    v23 = v11;
    v37 = v23;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v32);
    -[TUITextFieldView setTextInitialized:](self, "setTextInitialized:", 1, v32, v33, v34, v35, v36);
    v24 = objc_msgSend(v23, "enabled");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v25, "setEnabled:", v24);

    -[TUIInteractiveBaseView updateFromState](self, "updateFromState");
    if (objc_msgSend(v23, "returnKeyType"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      objc_msgSend(v26, "setReturnKeyType:", objc_msgSend(v23, "returnKeyType"));

    }
    v27 = TUIPlatformKeyboardAppearanceFromKeyboardAppearance((_BOOL8)objc_msgSend(v23, "keyboardAppearance"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    v29 = objc_msgSend(v28, "keyboardAppearance");

    if ((id)v27 != v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      objc_msgSend(v30, "setKeyboardAppearance:", v27);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      objc_msgSend(v31, "reloadInputViewsWithoutReset");

    }
  }
  -[TUITextFieldView setViewStateToRestore:](self, "setViewStateToRestore:", 0);

}

- (id)_textForControlUsingRenderModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!self->_textInitialized
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text")),
        v5,
        !v6))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TUITextFieldViewState text](self->_viewStateToRestore, "text"));
    if (!v6)
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  }

  return v6;
}

- (void)_updateDynamicViewState
{
  void *v3;
  TUIMutableDynamicValue *dynamicViewState;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  if (self->_dynamicViewState)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));

    if (v3)
    {
      dynamicViewState = self->_dynamicViewState;
      v8 = CFSTR("value");
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
      v9 = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
      -[TUIMutableDynamicValue updateWithValueIfChanged:](dynamicViewState, "updateWithValueIfChanged:", v7);

    }
  }
}

- (void)_callActionHandlerForTrigger:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionHandler"));
  objc_msgSend(v8, "invoke:arguments:", v7, v6);

}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  -[TUIInteractiveBaseView updateFromState](self, "updateFromState", a3);
  v7 = CFSTR("value");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v8 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  -[TUITextFieldView _callActionHandlerForTrigger:arguments:](self, "_callActionHandlerForTrigger:arguments:", CFSTR("beginInput"), v6);

  -[TUITextFieldView _updateDynamicViewState](self, "_updateDynamicViewState");
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  -[TUIInteractiveBaseView updateFromState](self, "updateFromState", a3);
  v7 = CFSTR("value");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v8 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  -[TUITextFieldView _callActionHandlerForTrigger:arguments:](self, "_callActionHandlerForTrigger:arguments:", CFSTR("endInput"), v6);

  -[TUITextFieldView _updateDynamicViewState](self, "_updateDynamicViewState");
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;

  v9 = CFSTR("value");
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  -[TUITextFieldView _callActionHandlerForTrigger:arguments:](self, "_callActionHandlerForTrigger:arguments:", CFSTR("returnPressed"), v7);

  objc_msgSend(v4, "resignFirstResponder");
  return 0;
}

- (void)_textFieldContentChanged
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  -[TUIInteractiveBaseView updateFromState](self, "updateFromState");
  v6 = CFSTR("value");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  -[TUITextFieldView _callActionHandlerForTrigger:arguments:](self, "_callActionHandlerForTrigger:arguments:", CFSTR("changedInput"), v5);

  -[TUITextFieldView _updateDynamicViewState](self, "_updateDynamicViewState");
}

- (id)viewStateSave
{
  void *v2;
  _TUITextFieldViewState *v3;
  void *v4;
  _TUITextFieldViewState *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (v2)
  {
    v3 = [_TUITextFieldViewState alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));
    v5 = -[_TUITextFieldViewState initWithText:](v3, "initWithText:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)viewStateRestore:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));

  if (v7 && v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v6, "setText:", v5);

    -[TUIInteractiveBaseView updateFromState](self, "updateFromState");
  }
  else
  {
    -[TUITextFieldView setViewStateToRestore:](self, "setViewStateToRestore:", v7);

  }
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUITextFieldView;
  -[TUIInteractiveBaseView prepareForReuse](&v4, "prepareForReuse");
  -[TUITextFieldView setViewStateToRestore:](self, "setViewStateToRestore:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  objc_msgSend(v3, "setText:", 0);

  -[TUITextFieldView setTextInitialized:](self, "setTextInitialized:", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = objc_msgSend(v4, "length");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v7 = v6;
  if (v5)
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
  else
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeholder"));
  v9 = (void *)v8;

  return v9;
}

- (_TUITextFieldViewState)viewStateToRestore
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

- (BOOL)textInitialized
{
  return self->_textInitialized;
}

- (void)setTextInitialized:(BOOL)a3
{
  self->_textInitialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicViewState, 0);
  objc_storeStrong((id *)&self->_viewStateToRestore, 0);
}

@end

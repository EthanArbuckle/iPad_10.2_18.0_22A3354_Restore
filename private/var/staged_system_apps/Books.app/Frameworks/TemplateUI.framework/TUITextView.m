@implementation TUITextView

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

- (TUITextView)initWithFrame:(CGRect)a3
{
  TUITextView *v3;
  TUITextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUITextView;
  v3 = -[TUITextView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TUITextView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)TUITextView;
  -[TUITextView dealloc](&v4, "dealloc");
}

+ (id)tuiReuseIdentifier
{
  return CFSTR("TUIReuseIdentifierTextView");
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
  TUIUIKitTextView *v3;
  TUIUIKitTextView *v4;
  void *v5;
  TUIUIKitTextView *v6;

  v3 = (TUIUIKitTextView *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (!v3)
  {
    v4 = [TUIUIKitTextView alloc];
    -[TUITextView bounds](self, "bounds");
    v6 = -[TUIUIKitTextView initWithFrame:](v4, "initWithFrame:");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TUIUIKitTextView setBackgroundColor:](v6, "setBackgroundColor:", v5);

    -[TUIUIKitTextView setDelegate:](v6, "setDelegate:", self);
    -[TUIUIKitTextView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
    -[TUITextView addSubview:](self, "addSubview:", v6);
    -[TUIInteractiveBaseView setControl:](self, "setControl:", v6);
    -[TUITextView setViewStateToRestore:](self, "setViewStateToRestore:", 0);
    -[TUITextView setTextInitialized:](self, "setTextInitialized:", 0);
    v3 = v6;
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
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  objc_super v26;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TUITextView;
  -[TUIInteractiveBaseView configureWithModel:outsets:](&v26, "configureWithModel:outsets:", v9, top, left, bottom, right);
  v10 = v9;
  v11 = v10;
  if (v10)
  {
    v12 = (TUIMutableDynamicValue *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewState"));
    dynamicViewState = self->_dynamicViewState;
    self->_dynamicViewState = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "placeholderText"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v15, "setAttributedPlaceholder:", v14);

    if (objc_msgSend(v11, "returnKeyType"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      objc_msgSend(v16, "setReturnKeyType:", objc_msgSend(v11, "returnKeyType"));

    }
    v17 = TUIPlatformKeyboardAppearanceFromKeyboardAppearance((_BOOL8)objc_msgSend(v11, "keyboardAppearance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    v19 = objc_msgSend(v18, "keyboardAppearance");

    if ((id)v17 != v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      objc_msgSend(v20, "setKeyboardAppearance:", v17);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      objc_msgSend(v21, "reloadInputViewsWithoutReset");

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TUITextView _textForControlUsingRenderModel:](self, "_textForControlUsingRenderModel:", v11));
    objc_msgSend(v22, "setText:", v23);

    -[TUITextView setTextInitialized:](self, "setTextInitialized:", 1);
    v24 = objc_msgSend(v11, "enabled");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v25, "setEnabled:", v24);

    -[TUIInteractiveBaseView updateFromState](self, "updateFromState");
  }
  -[TUITextView setViewStateToRestore:](self, "setViewStateToRestore:", 0);

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
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TUITextViewState text](self->_viewStateToRestore, "text"));
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

- (void)_textViewDidBeginEditing
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
  -[TUITextView _callActionHandlerForTrigger:arguments:](self, "_callActionHandlerForTrigger:arguments:", CFSTR("beginInput"), v5);

}

- (void)_textViewEndBeginEditing
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
  -[TUITextView _callActionHandlerForTrigger:arguments:](self, "_callActionHandlerForTrigger:arguments:", CFSTR("endInput"), v5);

}

- (void)_textViewContentChanged
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
  -[TUITextView _callActionHandlerForTrigger:arguments:](self, "_callActionHandlerForTrigger:arguments:", CFSTR("changedInput"), v5);

  -[TUITextView _updateDynamicViewState](self, "_updateDynamicViewState");
}

- (void)textViewDidBeginEditing:(id)a3
{
  -[TUITextView _textViewDidBeginEditing](self, "_textViewDidBeginEditing", a3);
}

- (void)textViewDidEndEditing:(id)a3
{
  -[TUITextView _textViewEndBeginEditing](self, "_textViewEndBeginEditing", a3);
}

- (void)textViewDidChange:(id)a3
{
  -[TUITextView _textViewContentChanged](self, "_textViewContentChanged", a3);
}

- (id)viewStateSave
{
  void *v2;
  _TUITextViewState *v3;
  void *v4;
  _TUITextViewState *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (v2)
  {
    v3 = [_TUITextViewState alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));
    v5 = -[_TUITextViewState initWithText:](v3, "initWithText:", v4);

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
    -[TUITextView setViewStateToRestore:](self, "setViewStateToRestore:", v7);

  }
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUITextView;
  -[TUIInteractiveBaseView prepareForReuse](&v4, "prepareForReuse");
  -[TUITextView setViewStateToRestore:](self, "setViewStateToRestore:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  objc_msgSend(v3, "setText:", 0);

  -[TUITextView setTextInitialized:](self, "setTextInitialized:", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = objc_msgSend(v4, "length");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributedPlaceholder"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "string"));

  }
  return v8;
}

- (_TUITextViewState)viewStateToRestore
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

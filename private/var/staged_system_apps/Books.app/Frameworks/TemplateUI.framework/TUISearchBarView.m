@implementation TUISearchBarView

+ (id)renderModelWithStates:(id)a3 actionHandler:(id)a4 viewState:(id)a5 enabled:(BOOL)a6 name:(id)a7 identifier:(id)a8 editingInsets:(UIEdgeInsets)a9 placeholderText:(id)a10 style:(id)a11 text:(id)a12 returnKeyType:(id)a13 keyboardAppearance:(unint64_t)a14 cancelText:(id)a15 showCancel:(BOOL)a16
{
  double right;
  double bottom;
  double left;
  double top;
  id v23;
  id v24;
  id v25;
  id v26;
  TUIRenderModelInteractiveText *v27;
  void *v28;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v37;
  _BOOL4 v40;
  TUIRenderModelInteractiveText *v41;

  v40 = a6;
  right = a9.right;
  bottom = a9.bottom;
  left = a9.left;
  top = a9.top;
  v37 = a15;
  v23 = a13;
  v34 = a12;
  v33 = a11;
  v24 = a10;
  v35 = a8;
  v31 = a7;
  v32 = a5;
  v25 = a4;
  v26 = a3;
  v27 = [TUIRenderModelInteractiveText alloc];
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tuiReuseIdentifier"));
  LOBYTE(v30) = a16;
  v41 = -[TUIRenderModelInteractiveText initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:cancelText:showCancel:](v27, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:cancelText:showCancel:", v28, v35, v26, v25, v32, v40, top, left, bottom, right, v31, v33, v24, v34, v23, a14,
          v37,
          v30);

  return v41;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)TUISearchBarView;
  -[TUISearchBarView dealloc](&v4, "dealloc");
}

+ (id)tuiReuseIdentifier
{
  return CFSTR("TUIReuseIdentifierSearchBarView");
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
  v5 = objc_msgSend(v4, "isFocused");
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
  TUIUIKitSearchBar *v3;
  TUIUIKitSearchBar *v4;
  void *v5;
  void *v6;
  TUIUIKitSearchBar *v7;

  v3 = (TUIUIKitSearchBar *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (!v3)
  {
    v4 = [TUIUIKitSearchBar alloc];
    -[TUISearchBarView bounds](self, "bounds");
    v7 = -[TUIUIKitSearchBar initWithFrame:](v4, "initWithFrame:");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUISearchBarView viewStateToRestore](self, "viewStateToRestore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
    -[TUIUIKitSearchBar setText:](v7, "setText:", v6);

    -[TUIUIKitSearchBar setDelegate:](v7, "setDelegate:", self);
    -[TUIUIKitSearchBar setSearchBarStyle:](v7, "setSearchBarStyle:", 2);
    -[TUIUIKitSearchBar _setAutoDisableCancelButton:](v7, "_setAutoDisableCancelButton:", 0);
    -[TUISearchBarView addSubview:](self, "addSubview:", v7);
    -[TUIInteractiveBaseView setControl:](self, "setControl:", v7);
    -[TUISearchBarView setViewStateToRestore:](self, "setViewStateToRestore:", 0);
    v3 = v7;
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
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  objc_super v32;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  v32.receiver = self;
  v32.super_class = (Class)TUISearchBarView;
  -[TUIInteractiveBaseView configureWithModel:outsets:](&v32, "configureWithModel:outsets:", v9, top, left, bottom, right);
  -[TUISearchBarView setViewStateToRestore:](self, "setViewStateToRestore:", 0);
  v10 = v9;
  v11 = v10;
  if (v10)
  {
    v12 = (TUIMutableDynamicValue *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewState"));
    dynamicViewState = self->_dynamicViewState;
    self->_dynamicViewState = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUISearchBarView _textForControlUsingRenderModel:](self, "_textForControlUsingRenderModel:", v11));
    objc_msgSend(v14, "setText:", v15);

    if (objc_msgSend(v11, "returnKeyType"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      objc_msgSend(v16, "setReturnKeyType:", objc_msgSend(v11, "returnKeyType"));

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cancelText"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cancelText"));
      objc_msgSend(v18, "setCancelText:", v19);

    }
    v20 = objc_msgSend(v11, "enabled");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v21, "setEnabled:", v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v22, "setShouldShowCancelButton:", objc_msgSend(v11, "showCancel"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "placeholderText"));
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "searchField"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "placeholderText"));
      objc_msgSend(v25, "setAttributedPlaceholder:", v26);

    }
    v27 = TUIPlatformKeyboardAppearanceFromKeyboardAppearance((_BOOL8)objc_msgSend(v11, "keyboardAppearance"));
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

}

- (void)_updateDynamicViewState
{
  void *v3;
  TUIMutableDynamicValue *dynamicViewState;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  if (self->_dynamicViewState)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));

    if (v3)
    {
      dynamicViewState = self->_dynamicViewState;
      v9 = CFSTR("value");
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchField"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
      v10 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
      -[TUIMutableDynamicValue updateWithValueIfChanged:](dynamicViewState, "updateWithValueIfChanged:", v8);

    }
  }
}

- (id)viewStateSave
{
  void *v2;
  _TUISearchBarViewState *v3;
  void *v4;
  _TUISearchBarViewState *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (v2)
  {
    v3 = [_TUISearchBarViewState alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));
    v5 = -[_TUISearchBarViewState initWithText:](v3, "initWithText:", v4);

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
    -[TUISearchBarView setViewStateToRestore:](self, "setViewStateToRestore:", v7);

  }
}

- (id)_textForControlUsingRenderModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));

  if (!v6)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TUISearchBarViewState text](self->_viewStateToRestore, "text"));
    if (!v6)
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  }

  return v6;
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

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v4 = a3;
  -[TUIInteractiveBaseView updateFromState](self, "updateFromState");
  v9 = CFSTR("value");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  -[TUISearchBarView _callActionHandlerForTrigger:arguments:](self, "_callActionHandlerForTrigger:arguments:", CFSTR("beginInput"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  LODWORD(v5) = objc_msgSend(v8, "shouldShowCancelButton");

  if ((_DWORD)v5)
  {
    objc_msgSend(v4, "setShowsCancelButton:animated:", 1, 1);
    objc_msgSend(v4, "becomeFirstResponder");
  }
  -[TUISearchBarView _updateDynamicViewState](self, "_updateDynamicViewState");

}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  void *v12;

  v4 = a3;
  -[TUIInteractiveBaseView updateFromState](self, "updateFromState");
  v11 = CFSTR("value");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  v12 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  -[TUISearchBarView _callActionHandlerForTrigger:arguments:](self, "_callActionHandlerForTrigger:arguments:", CFSTR("endInput"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v10 = objc_msgSend(v9, "length");

  if (!v10)
    objc_msgSend(v4, "setShowsCancelButton:animated:", 0, 1);
  -[TUISearchBarView _updateDynamicViewState](self, "_updateDynamicViewState");

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  -[TUIInteractiveBaseView updateFromState](self, "updateFromState", a3, a4);
  v8 = CFSTR("value");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  -[TUISearchBarView _callActionHandlerForTrigger:arguments:](self, "_callActionHandlerForTrigger:arguments:", CFSTR("changedInput"), v7);

  -[TUISearchBarView _updateDynamicViewState](self, "_updateDynamicViewState");
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  -[TUISearchBarView _searchBarDidSubmitSearch:](self, "_searchBarDidSubmitSearch:", a3);
}

- (void)searchBarBookmarkButtonClicked:(id)a3
{
  -[TUISearchBarView _searchBarDidSubmitSearch:](self, "_searchBarDidSubmitSearch:", a3);
}

- (void)_searchBarDidSubmitSearch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;
  void *v11;

  v4 = a3;
  v10 = CFSTR("value");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  v11 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  -[TUISearchBarView _callActionHandlerForTrigger:arguments:](self, "_callActionHandlerForTrigger:arguments:", CFSTR("returnPressed"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v9 = objc_msgSend(v8, "shouldShowCancelButton");

  if (v9)
    objc_msgSend(v4, "resignFirstResponder");

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  objc_msgSend(v5, "setText:", &stru_243BF0);

  v9 = CFSTR("value");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  -[TUISearchBarView _callActionHandlerForTrigger:arguments:](self, "_callActionHandlerForTrigger:arguments:", CFSTR("cancelPressed"), v8);

  objc_msgSend(v4, "setShowsCancelButton:animated:", 0, 1);
  objc_msgSend(v4, "resignFirstResponder");

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUISearchBarView;
  -[TUIInteractiveBaseView prepareForReuse](&v4, "prepareForReuse");
  -[TUISearchBarView setViewStateToRestore:](self, "setViewStateToRestore:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  objc_msgSend(v3, "setText:", 0);

}

- (_TUISearchBarViewState)viewStateToRestore
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

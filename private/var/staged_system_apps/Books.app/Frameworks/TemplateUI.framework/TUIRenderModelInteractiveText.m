@implementation TUIRenderModelInteractiveText

- (TUIRenderModelInteractiveText)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 editingInsets:(UIEdgeInsets)a10 style:(id)a11 placeholderText:(id)a12 text:(id)a13 returnKey:(unint64_t)a14 keyboardAppearance:(unint64_t)a15
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v26;
  id v27;
  TUIRenderModelInteractiveText *v28;
  TUIRenderModelInteractiveText *v29;
  NSAttributedString *v30;
  NSAttributedString *placeholderText;
  NSString *v32;
  NSString *text;
  uint64_t v35;

  right = a10.right;
  bottom = a10.bottom;
  left = a10.left;
  top = a10.top;
  v26 = a12;
  v27 = a13;
  LOBYTE(v35) = a8;
  v28 = -[TUIRenderModelInteractive initWithReuseIdentifier:identifier:style:elementStates:actionHandler:viewState:enabled:pressScale:touchInsets:](self, "initWithReuseIdentifier:identifier:style:elementStates:actionHandler:viewState:enabled:pressScale:touchInsets:", a3, a4, a11, a5, a6, a7, 1.0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v35);
  v29 = v28;
  if (v28)
  {
    v28->_editingInsets.top = top;
    v28->_editingInsets.left = left;
    v28->_editingInsets.bottom = bottom;
    v28->_editingInsets.right = right;
    v30 = (NSAttributedString *)objc_msgSend(v26, "copy");
    placeholderText = v29->_placeholderText;
    v29->_placeholderText = v30;

    v32 = (NSString *)objc_msgSend(v27, "copy");
    text = v29->_text;
    v29->_text = v32;

    v29->_returnKeyType = a14;
    v29->_keyboardAppearance = a15;
  }

  return v29;
}

- (TUIRenderModelInteractiveText)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 editingInsets:(UIEdgeInsets)a10 style:(id)a11 placeholderText:(id)a12 text:(id)a13 returnKeyType:(id)a14 keyboardAppearance:(unint64_t)a15
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v24;
  id v25;
  id v26;
  void *v27;
  TUIRenderModelInteractiveText *v28;
  TUIRenderModelInteractiveText *v29;
  NSAttributedString *v30;
  NSAttributedString *placeholderText;
  NSString *v32;
  NSString *text;
  uint64_t v35;

  right = a10.right;
  bottom = a10.bottom;
  left = a10.left;
  top = a10.top;
  v24 = a12;
  v25 = a13;
  v26 = a14;
  v27 = v25;
  LOBYTE(v35) = a8;
  v28 = -[TUIRenderModelInteractive initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:](self, "initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:", a3, a4, a11, a5, 0, a6, 1.0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, a7, v35, 0, 0, 0,
          a9);
  v29 = v28;
  if (v28)
  {
    v28->_editingInsets.top = top;
    v28->_editingInsets.left = left;
    v28->_editingInsets.bottom = bottom;
    v28->_editingInsets.right = right;
    v30 = (NSAttributedString *)objc_msgSend(v24, "copy");
    placeholderText = v29->_placeholderText;
    v29->_placeholderText = v30;

    v32 = (NSString *)objc_msgSend(v27, "copy");
    text = v29->_text;
    v29->_text = v32;

    v29->_returnKeyType = -[TUIRenderModelInteractiveText _returnKeyTypeForString:](v29, "_returnKeyTypeForString:", v26);
    v29->_keyboardAppearance = a15;
  }

  return v29;
}

- (TUIRenderModelInteractiveText)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 editingInsets:(UIEdgeInsets)a10 style:(id)a11 placeholderText:(id)a12 text:(id)a13 returnKeyType:(id)a14 keyboardAppearance:(unint64_t)a15 cancelText:(id)a16 showCancel:(BOOL)a17
{
  _BOOL8 v17;
  double right;
  double bottom;
  double left;
  double top;
  id v28;
  TUIRenderModelInteractiveText *v29;
  NSString *v30;
  NSString *cancelText;

  v17 = a8;
  right = a10.right;
  bottom = a10.bottom;
  left = a10.left;
  top = a10.top;
  v28 = a16;
  v29 = -[TUIRenderModelInteractiveText initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:](self, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:", a3, a4, a5, a6, a7, v17, top, left, bottom, right, a9, a11, a12, a13, a14, a15);
  if (v29)
  {
    v30 = (NSString *)objc_msgSend(v28, "copy");
    cancelText = v29->_cancelText;
    v29->_cancelText = v30;

    v29->_showCancel = a17;
  }

  return v29;
}

- (TUIRenderModelInteractiveText)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 editingInsets:(UIEdgeInsets)a10 style:(id)a11 placeholderText:(id)a12 text:(id)a13 returnKey:(unint64_t)a14 keyboardAppearance:(unint64_t)a15 cancelText:(id)a16 showCancel:(BOOL)a17
{
  _BOOL8 v17;
  double right;
  double bottom;
  double left;
  double top;
  id v28;
  TUIRenderModelInteractiveText *v29;
  NSString *v30;
  NSString *cancelText;

  v17 = a8;
  right = a10.right;
  bottom = a10.bottom;
  left = a10.left;
  top = a10.top;
  v28 = a16;
  v29 = -[TUIRenderModelInteractiveText initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKey:keyboardAppearance:](self, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKey:keyboardAppearance:", a3, a4, a5, a6, a7, v17, top, left, bottom, right, a9, a11, a12, a13, a14, a15);
  if (v29)
  {
    v30 = (NSString *)objc_msgSend(v28, "copy");
    cancelText = v29->_cancelText;
    v29->_cancelText = v30;

    v29->_showCancel = a17;
  }

  return v29;
}

- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = objc_alloc((Class)objc_opt_class(self));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive reuseIdentifier](self, "reuseIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive stateToModel](self, "stateToModel"));
  v7 = TUIElementStateRenderModelMapCopyForInitialAppearanceWithFlags(v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive actionHandler](self, "actionHandler"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive viewState](self, "viewState"));
  v11 = -[TUIRenderModelInteractive enabled](self, "enabled");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive name](self, "name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive style](self, "style"));
  LOBYTE(v16) = self->_showCancel;
  v14 = objc_msgSend(v18, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKey:keyboardAppearance:cancelText:showCancel:", v17, v5, v8, v9, v10, v11, self->_editingInsets.top, self->_editingInsets.left, self->_editingInsets.bottom, self->_editingInsets.right, v12, v13, self->_placeholderText, self->_text, self->_returnKeyType, self->_keyboardAppearance,
          self->_cancelText,
          v16);

  TUIRenderModelCopyProperties(v14, self);
  return v14;
}

- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = objc_alloc((Class)objc_opt_class(self));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive reuseIdentifier](self, "reuseIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive stateToModel](self, "stateToModel"));
  v7 = TUIElementStateRenderModelMapCopyForFinalAppearanceWithFlags(v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive actionHandler](self, "actionHandler"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive viewState](self, "viewState"));
  v11 = -[TUIRenderModelInteractive enabled](self, "enabled");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive name](self, "name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive style](self, "style"));
  LOBYTE(v16) = self->_showCancel;
  v14 = objc_msgSend(v18, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKey:keyboardAppearance:cancelText:showCancel:", v17, v5, v8, v9, v10, v11, self->_editingInsets.top, self->_editingInsets.left, self->_editingInsets.bottom, self->_editingInsets.right, v12, v13, self->_placeholderText, self->_text, self->_returnKeyType, self->_keyboardAppearance,
          self->_cancelText,
          v16);

  TUIRenderModelCopyProperties(v14, self);
  return v14;
}

- (unint64_t)_returnKeyTypeForString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Go")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Google")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Join")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Next")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Route")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Search")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Send")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Yahoo")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Done")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EmergencyCall")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Continue")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSAttributedString)placeholderText
{
  return self->_placeholderText;
}

- (NSString)text
{
  return self->_text;
}

- (unint64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (UIEdgeInsets)editingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_editingInsets.top;
  left = self->_editingInsets.left;
  bottom = self->_editingInsets.bottom;
  right = self->_editingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSString)cancelText
{
  return self->_cancelText;
}

- (BOOL)showCancel
{
  return self->_showCancel;
}

- (unint64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
}

@end

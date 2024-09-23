@implementation SUScriptNativeUIBarButtonItem

- (id)image
{
  return (id)objc_msgSend(-[SUScriptNativeObject object](self, "object"), "image");
}

- (UIEdgeInsets)imageInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "imageInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setImage:(id)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setImage:", a3);
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setImageInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setTag:(int64_t)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setTag:", a3);
}

- (void)setTitle:(id)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setTitle:", a3);
}

- (int64_t)tag
{
  return objc_msgSend(-[SUScriptNativeObject object](self, "object"), "tag");
}

- (id)title
{
  return (id)objc_msgSend(-[SUScriptNativeObject object](self, "object"), "title");
}

+ (id)objectWithDefaultButtonForScriptButton:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SUBarButtonItem *v9;
  SUBarButtonItem *v10;
  id v11;

  v5 = objc_msgSend(a3, "_systemItemString");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (!objc_msgSend((id)__BarButtonSystemItems[v7 + 1], "isEqualToString:", v6))
    {
      v7 += 2;
      if (v7 == 48)
      {
        v8 = 0;
        goto LABEL_8;
      }
    }
    v8 = __BarButtonSystemItems[v7];
LABEL_8:
    v9 = -[SUBarButtonItem initWithBarButtonSystemItem:target:action:]([SUBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", v8, 0, 0);
  }
  else
  {
    v9 = objc_alloc_init(SUBarButtonItem);
  }
  v10 = v9;
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "setScriptObject:", a3);
  objc_msgSend(v11, "setObject:", v10);

  return v11;
}

- (int)buttonType
{
  return 1;
}

- (void)connectButtonAction
{
  id v3;
  id v4;

  if (-[SUScriptObject _action](-[SUScriptNativeObject scriptObject](self, "scriptObject"), "_action"))
  {
    v3 = -[SUScriptNativeObject object](self, "object");
    v4 = SUButtonActionPopFromBarButtonItem(v3);
    objc_msgSend(v3, "setAction:", sel_buttonAction_);
    objc_msgSend(v3, "setTarget:", self);
    if (objc_msgSend(v4, "isActivated"))
      -[SUScriptButtonNativeObject buttonAction:](self, "buttonAction:", v3);
  }
}

- (void)destroyNativeObject
{
  objc_super v3;

  -[SUScriptNativeUIBarButtonItem disconnectButtonAction](self, "disconnectButtonAction");
  v3.receiver = self;
  v3.super_class = (Class)SUScriptNativeUIBarButtonItem;
  -[SUScriptNativeObject destroyNativeObject](&v3, sel_destroyNativeObject);
}

- (void)disconnectButtonAction
{
  id v3;

  v3 = -[SUScriptNativeObject object](self, "object");
  if ((SUScriptNativeUIBarButtonItem *)objc_msgSend(v3, "target") == self)
    objc_msgSend(v3, "setTarget:", 0);
}

- (void)hideConfirmationAnimated:(BOOL)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "hideConfirmationWithAppearance:animated:", -[SUClientInterface appearance](-[SUScriptObject clientInterface](-[SUScriptNativeObject scriptObject](self, "scriptObject"), "clientInterface"), "appearance"), a3);
}

- (BOOL)isBackButton
{
  return self->_isBackButton;
}

- (BOOL)isLoading
{
  return objc_msgSend(-[SUScriptNativeObject object](self, "object"), "isLoading");
}

- (BOOL)isShowingConfirmation
{
  return objc_msgSend(-[SUScriptNativeObject object](self, "object"), "isShowingConfirmation");
}

- (void)setLoading:(BOOL)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setLoading:", a3);
}

- (void)setStyleFromString:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = -[SUScriptNativeObject object](self, "object");
  v6 = 0;
  while (!objc_msgSend((id)__BarButtonStyles[v6 + 1], "isEqualToString:", a3))
  {
    v6 += 2;
    if (v6 == 8)
    {
      v7 = 0;
      goto LABEL_6;
    }
  }
  v7 = __BarButtonStyles[v6];
LABEL_6:
  objc_msgSend(v5, "setStyle:", v7);
  self->_isBackButton = objc_msgSend(a3, "isEqualToString:", CFSTR("back"));
}

- (void)setupNativeObject
{
  objc_super v3;

  -[SUScriptNativeUIBarButtonItem connectButtonAction](self, "connectButtonAction");
  v3.receiver = self;
  v3.super_class = (Class)SUScriptNativeUIBarButtonItem;
  -[SUScriptNativeObject setupNativeObject](&v3, sel_setupNativeObject);
}

- (void)showConfirmationWithTitle:(id)a3 animated:(BOOL)a4
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "showConfirmationWithTitle:appearance:animated:", a3, -[SUClientInterface appearance](-[SUScriptObject clientInterface](-[SUScriptNativeObject scriptObject](self, "scriptObject"), "clientInterface"), "appearance"), a4);
}

- (id)styleString
{
  uint64_t v3;
  uint64_t v4;

  if (self->_isBackButton)
    return CFSTR("back");
  v3 = objc_msgSend(-[SUScriptNativeObject object](self, "object"), "style");
  v4 = 0;
  while (__BarButtonStyles[v4] != v3)
  {
    v4 += 2;
    if (v4 == 8)
      return 0;
  }
  return (id)__BarButtonStyles[v4 + 1];
}

- (id)systemItemString
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(-[SUScriptNativeObject object](self, "object"), "systemItem");
  v3 = 0;
  while (__BarButtonSystemItems[v3] != v2)
  {
    v3 += 2;
    if (v3 == 48)
      return 0;
  }
  return (id)__BarButtonSystemItems[v3 + 1];
}

@end

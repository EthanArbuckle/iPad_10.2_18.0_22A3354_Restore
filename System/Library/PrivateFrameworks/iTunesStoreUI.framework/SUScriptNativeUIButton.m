@implementation SUScriptNativeUIButton

- (id)image
{
  return (id)objc_msgSend(-[SUScriptNativeObject object](self, "object"), "imageForState:", 0);
}

- (UIEdgeInsets)imageInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "imageEdgeInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setImage:(id)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setImage:forState:", a3, 0);
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setImageEdgeInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setTag:(int64_t)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setTag:", a3);
}

- (void)setTitle:(id)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setTitle:forState:", a3, 0);
}

- (int64_t)tag
{
  return objc_msgSend(-[SUScriptNativeObject object](self, "object"), "tag");
}

- (id)title
{
  return (id)objc_msgSend(-[SUScriptNativeObject object](self, "object"), "titleForState:", 0);
}

+ (id)objectWithDefaultButtonForScriptButton:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a3, "copyObjectForScriptFromPoolWithClass:", objc_opt_class());
  v5 = (void *)objc_msgSend(a1, "objectWithNativeObject:", v4);

  return v5;
}

- (void)connectButtonAction
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "addTarget:action:forControlEvents:", self, sel_buttonAction_, 64);
}

- (void)destroyNativeObject
{
  objc_super v3;

  -[SUScriptNativeUIButton disconnectButtonAction](self, "disconnectButtonAction");
  v3.receiver = self;
  v3.super_class = (Class)SUScriptNativeUIButton;
  -[SUScriptNativeObject destroyNativeObject](&v3, sel_destroyNativeObject);
}

- (void)disconnectButtonAction
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
}

- (void)setupNativeObject
{
  objc_super v3;

  -[SUScriptNativeUIButton connectButtonAction](self, "connectButtonAction");
  v3.receiver = self;
  v3.super_class = (Class)SUScriptNativeUIButton;
  -[SUScriptNativeObject setupNativeObject](&v3, sel_setupNativeObject);
}

@end

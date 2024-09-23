@implementation SUScriptButtonNativeObject

- (SUScriptButtonNativeObject)initWithSystemItemString:(id)a3
{
  SUScriptButtonNativeObject *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptButtonNativeObject;
  v4 = -[SUScriptNativeObject init](&v6, sel_init);
  if (v4)
    v4->_systemItemString = (NSString *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptButtonNativeObject;
  -[SUScriptButtonNativeObject dealloc](&v3, sel_dealloc);
}

+ (id)objectWithDefaultButtonForScriptButton:(id)a3
{
  return (id)objc_msgSend(a1, "objectWithNativeObject:", 0);
}

- (void)buttonAction:(id)a3
{
  SUScriptObject *v3;
  id v4;

  v3 = -[SUScriptNativeObject scriptObject](self, "scriptObject", a3);
  if (-[SUScriptObject shouldPerformDefaultAction](v3, "shouldPerformDefaultAction"))
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v3, 0);
    -[SUScriptObject performActionWithArguments:](v3, "performActionWithArguments:", v4);

  }
}

- (int)buttonType
{
  return 0;
}

- (void)configureFromScriptButtonNativeObject:(id)a3
{
  -[SUScriptButtonNativeObject setEnabled:](self, "setEnabled:", objc_msgSend(a3, "isEnabled"));
  -[SUScriptButtonNativeObject setImage:](self, "setImage:", objc_msgSend(a3, "image"));
  objc_msgSend(a3, "imageInsets");
  -[SUScriptButtonNativeObject setImageInsets:](self, "setImageInsets:");
  -[SUScriptButtonNativeObject setLoading:](self, "setLoading:", objc_msgSend(a3, "isLoading"));
  -[SUScriptButtonNativeObject setStyleFromString:](self, "setStyleFromString:", objc_msgSend(a3, "styleString"));
  -[SUScriptButtonNativeObject setSubtitle:](self, "setSubtitle:", objc_msgSend(a3, "subtitle"));
  -[SUScriptButtonNativeObject setTag:](self, "setTag:", objc_msgSend(a3, "tag"));
  -[SUScriptButtonNativeObject setTitle:](self, "setTitle:", objc_msgSend(a3, "title"));
}

- (UIEdgeInsets)imageInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x24BDF7718];
  v3 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v4 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v5 = *(double *)(MEMORY[0x24BDF7718] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)isBackButton
{
  return 0;
}

- (BOOL)isEnabled
{
  id v2;

  v2 = -[SUScriptNativeObject object](self, "object");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "isEnabled");
  else
    return 1;
}

- (BOOL)isShowingConfirmation
{
  return 0;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = -[SUScriptNativeObject object](self, "object");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setEnabled:", v3);
}

- (void)setStyleFromString:(id)a3
{
  NSString *styleString;

  styleString = self->_styleString;
  if (styleString != a3)
  {

    self->_styleString = (NSString *)a3;
  }
}

- (void)setSubtitle:(id)a3
{
  id v5;
  NSString *subtitle;

  v5 = -[SUScriptNativeObject object](self, "object");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setSubtitle:", a3);
  subtitle = self->_subtitle;
  if (subtitle != a3)
  {

    self->_subtitle = (NSString *)a3;
  }
}

- (NSString)styleString
{
  if (self->_styleString)
    return self->_styleString;
  else
    return (NSString *)CFSTR("plain");
}

- (NSString)subtitle
{
  NSString *subtitle;
  id v3;

  subtitle = self->_subtitle;
  v3 = -[SUScriptNativeObject object](self, "object");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (NSString *)objc_msgSend(v3, "subtitle");
  else
    return subtitle;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (NSString)systemItemString
{
  return self->_systemItemString;
}

@end

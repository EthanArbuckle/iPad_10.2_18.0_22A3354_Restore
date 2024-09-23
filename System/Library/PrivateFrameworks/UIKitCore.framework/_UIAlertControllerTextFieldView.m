@implementation _UIAlertControllerTextFieldView

- (_UIAlertControllerTextFieldView)initWithFrame:(CGRect)a3
{
  _UIAlertControllerTextFieldView *v3;
  _UIAlertControllerTextField *v4;
  _UIAlertControllerTextField *textField;
  _UIAlertControllerTextField *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIAlertControllerTextFieldView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_UIAlertControllerTextField);
    textField = v3->_textField;
    v3->_textField = v4;

    -[_UIAlertControllerTextField setTextFieldView:](v3->_textField, "setTextFieldView:", v3);
    v6 = v3->_textField;
    -[_UIAlertControllerTextFieldView _textFieldFont](v3, "_textFieldFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v6, "setFont:", v7);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_textField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIAlertControllerTextField setTextFieldView:](self->_textField, "setTextFieldView:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIAlertControllerTextFieldView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)_loadConstraints
{
  NSArray *containerViewConstraints;
  UIView *containerView;
  NSArray *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  id v10;

  if (-[NSArray count](self->_containerViewConstraints, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_containerViewConstraints);
    containerViewConstraints = self->_containerViewConstraints;
    self->_containerViewConstraints = 0;

  }
  containerView = self->_containerView;
  if (containerView)
  {
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    _NSDictionaryOfVariableBindings(CFSTR("_textField, _containerView"), self->_textField, self->_containerView, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_containerView]|"), 0, 0, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v5, "addObjectsFromArray:", v6);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_containerView]|"), 0, 0, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v5, "addObjectsFromArray:", v7);

    v8 = self->_containerViewConstraints;
    self->_containerViewConstraints = v5;
    v9 = v5;

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_containerViewConstraints);
  }
}

- (double)_borderWidth
{
  double result;

  -[UIView _currentScreenScale](self, "_currentScreenScale");
  UIRoundToViewScale(self);
  return result;
}

- (id)_textFieldFont
{
  void *v2;
  void *v3;

  objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", CFSTR("UICTFontTextStyleFootnote"), 0, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UITextField)textField
{
  return (UITextField *)self->_textField;
}

- (void)setContainerView:(id)a3
{
  UIView *v4;
  UIView *containerView;
  UIView *v6;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_containerView, "removeFromSuperview");
  containerView = self->_containerView;
  self->_containerView = v4;
  v6 = v4;

  -[UIView addSubview:](self, "addSubview:", self->_containerView);
  -[_UIAlertControllerTextFieldView _loadConstraints](self, "_loadConstraints");
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerViewConstraints, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end

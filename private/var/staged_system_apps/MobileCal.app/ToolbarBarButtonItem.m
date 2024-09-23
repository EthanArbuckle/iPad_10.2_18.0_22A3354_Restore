@implementation ToolbarBarButtonItem

- (ToolbarBarButtonItem)initWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  UIButton *v10;
  UIButton *button;
  void *v12;
  void *v13;
  double v14;
  UIButton *v15;
  ToolbarBarButtonItem *v16;
  ToolbarBarButtonItem *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  button = self->_button;
  self->_button = v10;

  -[UIButton setTitle:forState:](self->_button, "setTitle:forState:", v8, 0);
  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", v9, a5, 64);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_button, "titleLabel"));
  objc_msgSend(v13, "setFont:", v12);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v14) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_button, "setContentCompressionResistancePriority:forAxis:", 0, v14);
  v15 = self->_button;
  v19.receiver = self;
  v19.super_class = (Class)ToolbarBarButtonItem;
  v16 = -[ToolbarBarButtonItem initWithCustomView:](&v19, "initWithCustomView:", v15);
  v17 = v16;
  if (v16)
    -[ToolbarBarButtonItem setTitle:](v16, "setTitle:", v8);

  return v17;
}

- (void)setTitle:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ToolbarBarButtonItem;
  v4 = a3;
  -[ToolbarBarButtonItem setTitle:](&v5, "setTitle:", v4);
  -[UIButton setTitle:forState:](self->_button, "setTitle:forState:", v4, 0, v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end

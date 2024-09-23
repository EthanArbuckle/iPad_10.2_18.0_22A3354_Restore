@implementation UIViewControllerPreviewAction

- (id)_initWithTitle:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  UIViewControllerPreviewAction *v8;
  UIViewControllerPreviewAction *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIViewControllerPreviewAction;
  v8 = -[UIViewControllerPreviewAction init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[UIViewControllerPreviewAction setTitle:](v8, "setTitle:", v6);
    -[UIViewControllerPreviewAction setHandler:](v9, "setHandler:", v7);
  }

  return v9;
}

+ (id)actionWithTitle:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[UIViewControllerPreviewAction _initWithTitle:handler:]([UIViewControllerPreviewAction alloc], "_initWithTitle:handler:", v6, v5);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[UIViewControllerPreviewAction title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  -[UIViewControllerPreviewAction handler](self, "handler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHandler:", v6);

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

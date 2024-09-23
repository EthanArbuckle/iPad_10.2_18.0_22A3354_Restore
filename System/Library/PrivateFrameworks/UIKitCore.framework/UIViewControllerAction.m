@implementation UIViewControllerAction

- (UIViewControllerAction)initWithViewController:(id)a3 name:(id)a4 transition:(int)a5
{
  id v8;
  id v9;
  UIViewControllerAction *v10;
  UIViewControllerAction *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UIViewControllerAction;
  v10 = -[UIViewControllerAction init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_viewController, v8);
    objc_storeStrong((id *)&v11->_name, a4);
    v11->_transition = a5;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

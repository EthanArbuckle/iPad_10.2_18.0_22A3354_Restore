@implementation _UITabAction

- (_UITabAction)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5 handler:(id)a6
{
  id v10;
  _UITabAction *v11;
  void *v12;
  id actionHandler;
  objc_super v15;

  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)_UITabAction;
  v11 = -[UITab initWithTitle:image:identifier:viewControllerProvider:](&v15, sel_initWithTitle_image_identifier_viewControllerProvider_, a4, a5, a3, 0);
  if (v11)
  {
    v12 = _Block_copy(v10);
    actionHandler = v11->_actionHandler;
    v11->_actionHandler = v12;

  }
  return v11;
}

- (BOOL)_isAction
{
  return 1;
}

- (int64_t)preferredPlacement
{
  return 6;
}

- (int64_t)_tabPlacement
{
  return 6;
}

- (void)_performAction
{
  void (**actionHandler)(id, _UITabAction *);

  actionHandler = (void (**)(id, _UITabAction *))self->_actionHandler;
  if (actionHandler)
    actionHandler[2](actionHandler, self);
}

- (id)_actionHandler
{
  return self->_actionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
}

@end

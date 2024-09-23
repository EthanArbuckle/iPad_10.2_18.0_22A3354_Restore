@implementation PTSingleTestRecipe

+ (id)recipeWithTitle:(id)a3 action:(id)a4
{
  return (id)objc_msgSend(a1, "recipeWithTitle:prepareBlock:action:cleanupBlock:", a3, 0, a4, 0);
}

+ (id)recipeWithTitle:(id)a3 prepareBlock:(id)a4 action:(id)a5 cleanupBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTitle:prepareBlock:cleanupBlock:", v13, v12, v10);

  objc_msgSend(v14, "setAction:", v11);
  return v14;
}

- (BOOL)_wantsEvent:(int64_t)a3
{
  return a3 == 2;
}

- (void)_handleEvent:(int64_t)a3
{
  void (**action)(void);

  if (a3 == 2)
  {
    action = (void (**)(void))self->_action;
    if (action)
      action[2]();
  }
}

- (void)invalidate
{
  id action;
  objc_super v4;

  action = self->_action;
  self->_action = 0;

  v4.receiver = self;
  v4.super_class = (Class)PTSingleTestRecipe;
  -[PTTestRecipe invalidate](&v4, sel_invalidate);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
}

@end

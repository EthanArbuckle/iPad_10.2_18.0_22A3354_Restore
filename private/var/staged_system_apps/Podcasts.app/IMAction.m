@implementation IMAction

- (IMAction)initWithTitle:(id)a3 icon:(id)a4
{
  id v7;
  id v8;
  IMAction *v9;
  IMAction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMAction;
  v9 = -[IMAction init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_icon, a4);
  }

  return v10;
}

- (id)button
{
  uint64_t (**buttonBlock)(id, SEL);
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  buttonBlock = (uint64_t (**)(id, SEL))self->_buttonBlock;
  if (buttonBlock)
  {
    v4 = buttonBlock[2](buttonBlock, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMAction icon](self, "icon"));
    objc_msgSend(v6, "setImage:forState:", v7, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMAction title](self, "title"));
    objc_msgSend(v6, "setTitle:forState:", v8, 0);

    v5 = 0;
  }
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, "buttonTapped:", 64);
  return v5;
}

- (id)buttonItem
{
  uint64_t (**buttonItemBlock)(id, SEL);
  uint64_t v4;
  id v5;
  id v6;
  void *v7;

  buttonItemBlock = (uint64_t (**)(id, SEL))self->_buttonItemBlock;
  if (buttonItemBlock)
  {
    v4 = buttonItemBlock[2](buttonItemBlock, a2);
    v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    objc_msgSend(v5, "setTarget:", self);
    objc_msgSend(v5, "setAction:", "buttonTapped:");
  }
  else
  {
    v6 = objc_alloc((Class)UIBarButtonItem);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMAction button](self, "button"));
    v5 = objc_msgSend(v6, "initWithCustomView:", v7);

  }
  return v5;
}

- (BOOL)isAllowedForController:(id)a3
{
  uint64_t (**conditionBlock)(id, id);

  conditionBlock = (uint64_t (**)(id, id))self->_conditionBlock;
  if (conditionBlock)
    LOBYTE(conditionBlock) = conditionBlock[2](conditionBlock, a3);
  return (char)conditionBlock;
}

- (void)buttonTapped:(id)a3
{
  void (**actionBlock)(id, id, id);
  IMActionController **p_controller;
  id v5;
  id WeakRetained;

  actionBlock = (void (**)(id, id, id))self->_actionBlock;
  if (actionBlock)
  {
    p_controller = &self->_controller;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_controller);
    actionBlock[2](actionBlock, WeakRetained, v5);

  }
}

- (IMActionController)controller
{
  return (IMActionController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (id)conditionBlock
{
  return self->_conditionBlock;
}

- (void)setConditionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)buttonBlock
{
  return self->_buttonBlock;
}

- (void)setButtonBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)buttonItemBlock
{
  return self->_buttonItemBlock;
}

- (void)setButtonItemBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_buttonItemBlock, 0);
  objc_storeStrong(&self->_buttonBlock, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong(&self->_conditionBlock, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end

@implementation PTToggleTestRecipe

+ (id)recipeWithTitle:(id)a3 toggleAction:(id)a4
{
  return (id)objc_msgSend(a1, "recipeWithTitle:prepareBlock:toggleAction:cleanupBlock:", a3, 0, a4, 0);
}

+ (id)recipeWithTitle:(id)a3 prepareBlock:(id)a4 toggleAction:(id)a5 cleanupBlock:(id)a6
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

  objc_msgSend(v14, "setToggleAction:", v11);
  return v14;
}

- (BOOL)_wantsEvent:(int64_t)a3
{
  return a3 == 2;
}

- (void)_activate
{
  objc_super v2;

  self->_on = 0;
  v2.receiver = self;
  v2.super_class = (Class)PTToggleTestRecipe;
  -[PTTestRecipe _activate](&v2, sel__activate);
}

- (void)_deactivate
{
  objc_super v2;

  self->_on = 0;
  v2.receiver = self;
  v2.super_class = (Class)PTToggleTestRecipe;
  -[PTTestRecipe _deactivate](&v2, sel__deactivate);
}

- (void)_handleEvent:(int64_t)a3
{
  _BOOL4 on;
  void (**toggleAction)(id, BOOL);

  if (a3 == 2)
  {
    on = self->_on;
    self->_on = !on;
    toggleAction = (void (**)(id, BOOL))self->_toggleAction;
    if (toggleAction)
      toggleAction[2](toggleAction, !on);
  }
}

- (void)invalidate
{
  id toggleAction;
  objc_super v4;

  toggleAction = self->_toggleAction;
  self->_toggleAction = 0;

  v4.receiver = self;
  v4.super_class = (Class)PTToggleTestRecipe;
  -[PTTestRecipe invalidate](&v4, sel_invalidate);
}

- (id)toggleAction
{
  return self->_toggleAction;
}

- (void)setToggleAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isOn
{
  return self->_on;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_toggleAction, 0);
}

@end

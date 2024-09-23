@implementation PTDoubleTestRecipe

+ (id)recipeWithTitle:(id)a3 increaseAction:(id)a4 decreaseAction:(id)a5
{
  return (id)objc_msgSend(a1, "recipeWithTitle:prepareBlock:increaseAction:decreaseAction:cleanupBlock:", a3, 0, a4, a5, 0);
}

+ (id)recipeWithTitle:(id)a3 prepareBlock:(id)a4 increaseAction:(id)a5 decreaseAction:(id)a6 cleanupBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTitle:prepareBlock:cleanupBlock:", v16, v15, v12);

  objc_msgSend(v17, "setIncreaseAction:", v14);
  objc_msgSend(v17, "setDecreaseAction:", v13);

  return v17;
}

- (BOOL)_wantsEvent:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

- (void)_handleEvent:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 2)
  {
    v3 = 56;
  }
  else
  {
    if (a3 != 1)
      return;
    v3 = 48;
  }
  v4 = *(uint64_t *)((char *)&self->super.super.isa + v3);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
}

- (void)invalidate
{
  id increaseAction;
  id decreaseAction;
  objc_super v5;

  increaseAction = self->_increaseAction;
  self->_increaseAction = 0;

  decreaseAction = self->_decreaseAction;
  self->_decreaseAction = 0;

  v5.receiver = self;
  v5.super_class = (Class)PTDoubleTestRecipe;
  -[PTTestRecipe invalidate](&v5, sel_invalidate);
}

- (id)increaseAction
{
  return self->_increaseAction;
}

- (void)setIncreaseAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)decreaseAction
{
  return self->_decreaseAction;
}

- (void)setDecreaseAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_decreaseAction, 0);
  objc_storeStrong(&self->_increaseAction, 0);
}

@end

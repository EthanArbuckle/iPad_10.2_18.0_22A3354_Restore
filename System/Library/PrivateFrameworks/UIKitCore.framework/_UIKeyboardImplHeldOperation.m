@implementation _UIKeyboardImplHeldOperation

- (_UIKeyboardImplHeldOperation)initWithOperation:(id)a3
{
  id v4;
  _UIKeyboardImplHeldOperation *v5;
  _UIKeyboardImplHeldOperation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIKeyboardImplHeldOperation;
  v5 = -[_UIKeyboardImplHeldOperation init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_UIKeyboardImplHeldOperation setOperation:](v5, "setOperation:", v4);

  return v6;
}

- (id)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_operation, 0);
}

@end

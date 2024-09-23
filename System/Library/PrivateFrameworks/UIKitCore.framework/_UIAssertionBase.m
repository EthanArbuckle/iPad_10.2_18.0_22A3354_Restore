@implementation _UIAssertionBase

- (void)setParentController:(id)a3
{
  objc_storeWeak((id *)&self->_parentController, a3);
}

- (void)_invalidate
{
  void *v4;
  id WeakRetained;

  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAssertionController.m"), 56, CFSTR("Tried to invalidate an assertion that is already invalid. %@"), self);

  }
  self->_invalidated = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  objc_msgSend(WeakRetained, "_endTrackingAssertion:", self);

}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)initialState
{
  return self->_initialState;
}

- (id)_initWithType:(unint64_t)a3 initialState:(BOOL)a4 reason:(id)a5 requiresExplicitInvalidation:(BOOL)a6
{
  id v10;
  _UIAssertionBase *v11;
  _UIAssertionBase *v12;
  uint64_t v13;
  NSString *reason;
  objc_super v16;

  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_UIAssertionBase;
  v11 = -[_UIAssertionBase init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    v13 = objc_msgSend(v10, "copy");
    reason = v12->_reason;
    v12->_reason = (NSString *)v13;

    v12->_initialState = a4;
    v12->_requiresExplicitInvalidation = a6;
  }

  return v12;
}

- (void)dealloc
{
  void *WeakRetained;
  objc_super v5;

  if (!self->_invalidated)
  {
    if (self->_requiresExplicitInvalidation)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAssertionController.m"), 70, CFSTR("Assertion deallocated before it was invalidated. %@"), self);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
      objc_msgSend(WeakRetained, "_endTrackingAssertion:", self);
    }

  }
  v5.receiver = self;
  v5.super_class = (Class)_UIAssertionBase;
  -[_UIAssertionBase dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentController);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %lux %@>"), v5, self, self->_type, self->_reason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)reason
{
  return self->_reason;
}

- (_UIAssertionController)parentController
{
  return (_UIAssertionController *)objc_loadWeakRetained((id *)&self->_parentController);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (BOOL)requiresExplicitInvalidation
{
  return self->_requiresExplicitInvalidation;
}

@end

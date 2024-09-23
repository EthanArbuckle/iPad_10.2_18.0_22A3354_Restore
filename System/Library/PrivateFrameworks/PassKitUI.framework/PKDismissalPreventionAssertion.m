@implementation PKDismissalPreventionAssertion

- (PKDismissalPreventionAssertion)initWithInvalidationHandler:(id)a3
{
  id v4;
  PKDismissalPreventionAssertion *v5;
  PKDismissalPreventionAssertion *v6;
  void *v7;
  id invalidationHandler;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKDismissalPreventionAssertion;
  v5 = -[PKDismissalPreventionAssertion init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_invalidated = 0;
    v7 = _Block_copy(v4);
    invalidationHandler = v6->_invalidationHandler;
    v6->_invalidationHandler = v7;

  }
  return v6;
}

- (void)invalidate
{
  (*((void (**)(void))self->_invalidationHandler + 2))();
  self->_invalidated = 1;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end

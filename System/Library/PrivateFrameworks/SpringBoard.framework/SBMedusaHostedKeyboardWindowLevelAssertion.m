@implementation SBMedusaHostedKeyboardWindowLevelAssertion

- (SBMedusaHostedKeyboardWindowLevelAssertion)initWithMedusaHostedKeyboardWindow:(id)a3 priority:(unint64_t)a4 windowLevel:(double)a5
{
  id v8;
  SBMedusaHostedKeyboardWindowLevelAssertion *v9;
  SBMedusaHostedKeyboardWindowLevelAssertion *v10;
  uint64_t v11;
  id invalidationHandler;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id from;
  id location;
  objc_super v22;

  v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SBMedusaHostedKeyboardWindowLevelAssertion;
  v9 = -[SBMedusaHostedKeyboardWindowLevelAssertion init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_priority = a4;
    v9->_windowLevel = a5;
    objc_initWeak(&location, v9);
    objc_initWeak(&from, v8);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __102__SBMedusaHostedKeyboardWindowLevelAssertion_initWithMedusaHostedKeyboardWindow_priority_windowLevel___block_invoke;
    v17 = &unk_1E8EAB5B8;
    objc_copyWeak(&v18, &from);
    objc_copyWeak(&v19, &location);
    v11 = MEMORY[0x1D17E5550](&v14);
    invalidationHandler = v10->_invalidationHandler;
    v10->_invalidationHandler = (id)v11;

    objc_msgSend(v8, "addWindowLevelAssertion:", v10, v14, v15, v16, v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __102__SBMedusaHostedKeyboardWindowLevelAssertion_initWithMedusaHostedKeyboardWindow_priority_windowLevel___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeWindowLevelAssertion:", v2);

}

- (void)dealloc
{
  objc_super v3;

  -[SBMedusaHostedKeyboardWindowLevelAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBMedusaHostedKeyboardWindowLevelAssertion;
  -[SBMedusaHostedKeyboardWindowLevelAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void (**invalidationHandler)(id, SEL);
  id v4;

  invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2](invalidationHandler, a2);
    v4 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

  }
}

- (unint64_t)priority
{
  return self->_priority;
}

- (double)windowLevel
{
  return self->_windowLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end

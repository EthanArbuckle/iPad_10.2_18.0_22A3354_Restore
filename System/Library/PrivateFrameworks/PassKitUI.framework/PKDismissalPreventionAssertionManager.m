@implementation PKDismissalPreventionAssertionManager

+ (id)sharedInstance
{
  if (_MergedGlobals_668 != -1)
    dispatch_once(&_MergedGlobals_668, &__block_literal_global_29);
  return (id)qword_1ED06C638;
}

void __55__PKDismissalPreventionAssertionManager_sharedInstance__block_invoke()
{
  PKDismissalPreventionAssertionManager *v0;
  void *v1;

  v0 = objc_alloc_init(PKDismissalPreventionAssertionManager);
  v1 = (void *)qword_1ED06C638;
  qword_1ED06C638 = (uint64_t)v0;

}

- (PKDismissalPreventionAssertionManager)init
{
  PKDismissalPreventionAssertionManager *v2;
  NSMutableSet *v3;
  NSMutableSet *assertions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKDismissalPreventionAssertionManager;
  v2 = -[PKDismissalPreventionAssertionManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    assertions = v2->_assertions;
    v2->_assertions = v3;

  }
  return v2;
}

- (id)acquireAssertion
{
  PKDismissalPreventionAssertion *v3;
  PKDismissalPreventionAssertion *v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = [PKDismissalPreventionAssertion alloc];
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __57__PKDismissalPreventionAssertionManager_acquireAssertion__block_invoke;
  v9 = &unk_1E3E64568;
  objc_copyWeak(&v10, &location);
  v4 = -[PKDismissalPreventionAssertion initWithInvalidationHandler:](v3, "initWithInvalidationHandler:", &v6);
  -[NSMutableSet addObject:](self->_assertions, "addObject:", v4, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v4;
}

void __57__PKDismissalPreventionAssertionManager_acquireAssertion__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[1], "removeObject:", v5);

}

- (BOOL)shouldPreventAutomaticDismissal
{
  return -[NSMutableSet count](self->_assertions, "count") != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end

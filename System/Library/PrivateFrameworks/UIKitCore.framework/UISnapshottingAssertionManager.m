@implementation UISnapshottingAssertionManager

+ (id)sharedInstance
{
  if (qword_1ECD7DDF0 != -1)
    dispatch_once(&qword_1ECD7DDF0, &__block_literal_global_245);
  return (id)_MergedGlobals_1062;
}

void __48__UISnapshottingAssertionManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[UISnapshottingAssertionManager _init]([UISnapshottingAssertionManager alloc], "_init");
  v1 = (void *)_MergedGlobals_1062;
  _MergedGlobals_1062 = (uint64_t)v0;

}

- (UISnapshottingAssertionManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISnapshottingAssertionManager.m"), 42, CFSTR("UISnapshottingAssertionManager is a singleton, used sharedInstance instead"));

  return 0;
}

- (id)_init
{
  UISnapshottingAssertionManager *v2;
  UISnapshottingAssertionManager *v3;
  uint64_t v4;
  NSMutableSet *heldAssertions;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UISnapshottingAssertionManager;
  v2 = -[UISnapshottingAssertionManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->lock, 0);
    v4 = objc_opt_new();
    heldAssertions = v3->_heldAssertions;
    v3->_heldAssertions = (NSMutableSet *)v4;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->lock);
  v3.receiver = self;
  v3.super_class = (Class)UISnapshottingAssertionManager;
  -[UISnapshottingAssertionManager dealloc](&v3, sel_dealloc);
}

- (void)withLock:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  void (**v4)(_QWORD);

  if (a3)
  {
    p_lock = &self->lock;
    v4 = (void (**)(_QWORD))a3;
    pthread_mutex_lock(p_lock);
    v4[2](v4);

    pthread_mutex_unlock(p_lock);
  }
}

- (id)acquireNewAssertion
{
  UISnapshottingAssertion *v3;
  UISnapshottingAssertion *v4;
  UISnapshottingAssertion *v5;
  UISnapshottingAssertion *v6;
  _QWORD v8[5];
  UISnapshottingAssertion *v9;

  v3 = objc_alloc_init(UISnapshottingAssertion);
  v4 = v3;
  if (v3)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__UISnapshottingAssertionManager_acquireNewAssertion__block_invoke;
    v8[3] = &unk_1E16B1B50;
    v8[4] = self;
    v5 = v3;
    v9 = v5;
    -[UISnapshottingAssertionManager withLock:](self, "withLock:", v8);
    v6 = v5;

  }
  return v4;
}

uint64_t __53__UISnapshottingAssertionManager_acquireNewAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)relinquishAssertion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__UISnapshottingAssertionManager_relinquishAssertion___block_invoke;
    v6[3] = &unk_1E16B1B50;
    v6[4] = self;
    v7 = v4;
    -[UISnapshottingAssertionManager withLock:](self, "withLock:", v6);

  }
}

uint64_t __54__UISnapshottingAssertionManager_relinquishAssertion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)executeIfNoActiveAssertions:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__UISnapshottingAssertionManager_executeIfNoActiveAssertions___block_invoke;
    v6[3] = &unk_1E16B1D18;
    v6[4] = self;
    v7 = v4;
    -[UISnapshottingAssertionManager withLock:](self, "withLock:", v6);

  }
}

uint64_t __62__UISnapshottingAssertionManager_executeIfNoActiveAssertions___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count");
  if (!result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heldAssertions, 0);
}

@end

@implementation NCBannerTransitionBlockingPrototypeRecipe

- (NCBannerTransitionBlockingPrototypeRecipe)initWithNotificationAlertDestination:(id)a3
{
  id v4;
  NCBannerTransitionBlockingPrototypeRecipe *v5;
  NCBannerTransitionBlockingPrototypeRecipe *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NCBannerTransitionBlockingPrototypeRecipe;
  v5 = -[NCBannerTransitionBlockingPrototypeRecipe init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_notificationAlertDestination, v4);
    objc_initWeak(&location, v6);
    v7 = (void *)MEMORY[0x1E0D83038];
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __82__NCBannerTransitionBlockingPrototypeRecipe_initWithNotificationAlertDestination___block_invoke;
    v13[3] = &unk_1E8D1B278;
    objc_copyWeak(&v14, &location);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __82__NCBannerTransitionBlockingPrototypeRecipe_initWithNotificationAlertDestination___block_invoke_2;
    v11[3] = &unk_1E8D1B278;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v7, "recipeWithTitle:increaseAction:decreaseAction:", CFSTR("Block Banner Transitions"), v13, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTDomain registerTestRecipe:](NCUNUIKitPrototypeDomain, "registerTestRecipe:", v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __82__NCBannerTransitionBlockingPrototypeRecipe_initWithNotificationAlertDestination___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pushNewAssertion");

}

void __82__NCBannerTransitionBlockingPrototypeRecipe_initWithNotificationAlertDestination___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_popTopAssertion");

}

- (void)_pushNewAssertion
{
  NCBannerTransitionBlockingPrototypeRecipe *v2;
  NSMutableArray *v3;
  NSMutableArray *assertions;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_assertions)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    assertions = v2->_assertions;
    v2->_assertions = v3;

  }
  WeakRetained = objc_loadWeakRetained((id *)&v2->_notificationAlertDestination);
  objc_msgSend(WeakRetained, "activeNotificationRequestPresenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("transitionBlockingPrototypeRecipe-%ld"), -[NSMutableArray count](v2->_assertions, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestTransitionBlockingAssertionWithReason:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__NCBannerTransitionBlockingPrototypeRecipe__pushNewAssertion__block_invoke;
    v9[3] = &unk_1E8D1B1F0;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "addInvalidationBlock:", v9);
    if (v8)
      -[NSMutableArray addObject:](v2->_assertions, "addObject:", v8);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }

  objc_sync_exit(v2);
}

void __62__NCBannerTransitionBlockingPrototypeRecipe__pushNewAssertion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = (id *)WeakRetained;
    objc_sync_enter(v8);
    objc_msgSend(v8[1], "removeObject:", v9);
    objc_sync_exit(v8);

  }
}

- (void)_popTopAssertion
{
  void *v2;
  NCBannerTransitionBlockingPrototypeRecipe *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableArray lastObject](obj->_assertions, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](obj->_assertions, "removeLastObject");
  objc_msgSend(v2, "invalidateWithReason:", CFSTR("popTopAssertion"));

  objc_sync_exit(obj);
}

- (NCNotificationAlertDestinationPrototyping)notificationAlertDestination
{
  return (NCNotificationAlertDestinationPrototyping *)objc_loadWeakRetained((id *)&self->_notificationAlertDestination);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationAlertDestination);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end

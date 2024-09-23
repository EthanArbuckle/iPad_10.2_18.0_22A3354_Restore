@implementation WBSExtensionsAnalyticsEventCoalescer

- (WBSExtensionsAnalyticsEventCoalescer)init
{
  WBSExtensionsAnalyticsEventCoalescer *v2;
  WBSExtensionsAnalyticsEventCoalescer *v3;
  NSMutableSet *v4;
  NSMutableSet *injectedScriptExtensions;
  NSMutableSet *v6;
  NSMutableSet *buttonInvokedExtensions;
  WBSExtensionsAnalyticsEventCoalescer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WBSExtensionsAnalyticsEventCoalescer;
  v2 = -[WBSExtensionsAnalyticsEventCoalescer init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    injectedScriptExtensions = v3->_injectedScriptExtensions;
    v3->_injectedScriptExtensions = v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    buttonInvokedExtensions = v3->_buttonInvokedExtensions;
    v3->_buttonInvokedExtensions = v6;

    objc_storeWeak((id *)&v3->_delegate, v3);
    v3->_resetInterval = 86400.0;
    -[WBSExtensionsAnalyticsEventCoalescer _configureResetTimer](v3, "_configureResetTimer");
    v8 = v3;
  }

  return v3;
}

- (void)_configureResetTimer
{
  void *v3;
  double v4;
  double v5;
  NSTimer *v6;
  NSTimer *resetTimer;
  _QWORD v8[4];
  id v9;
  id location;

  -[NSTimer invalidate](self->_resetTimer, "invalidate");
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  -[WBSExtensionsAnalyticsEventCoalescer resetInterval](self, "resetInterval");
  v5 = v4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__WBSExtensionsAnalyticsEventCoalescer__configureResetTimer__block_invoke;
  v8[3] = &unk_1E5442518;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 1, v8, v5);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  resetTimer = self->_resetTimer;
  self->_resetTimer = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (double)resetInterval
{
  return self->_resetInterval;
}

- (BOOL)didInjectScriptForExtensionWithIdentifier:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  WBSExtensionsAnalyticsEventCoalescer *v14;
  id v15;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[NSMutableSet containsObject:](self->_injectedScriptExtensions, "containsObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  if (v4)
    v6 = v5;
  else
    v6 = 1;
  if ((v6 & 1) == 0)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __82__WBSExtensionsAnalyticsEventCoalescer_didInjectScriptForExtensionWithIdentifier___block_invoke;
    v13 = &unk_1E5441848;
    v14 = self;
    v7 = v4;
    v15 = v7;
    os_unfair_lock_lock(&self->_lock);
    __82__WBSExtensionsAnalyticsEventCoalescer_didInjectScriptForExtensionWithIdentifier___block_invoke((uint64_t)&v10);
    os_unfair_lock_unlock(&self->_lock);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "extensionAnalyticsEventCoalescer:didInjectScriptForExtensionWithIdentifier:", self, v7, v10, v11);

  }
  return v6 ^ 1;
}

void __82__WBSExtensionsAnalyticsEventCoalescer_didInjectScriptForExtensionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v1, "addObject:", v2);

}

- (BOOL)didInvokeToolbarButtonForExtensionWithIdentifier:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  WBSExtensionsAnalyticsEventCoalescer *v14;
  id v15;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[NSMutableSet containsObject:](self->_buttonInvokedExtensions, "containsObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  if (v4)
    v6 = v5;
  else
    v6 = 1;
  if ((v6 & 1) == 0)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __89__WBSExtensionsAnalyticsEventCoalescer_didInvokeToolbarButtonForExtensionWithIdentifier___block_invoke;
    v13 = &unk_1E5441848;
    v14 = self;
    v7 = v4;
    v15 = v7;
    os_unfair_lock_lock(&self->_lock);
    __89__WBSExtensionsAnalyticsEventCoalescer_didInvokeToolbarButtonForExtensionWithIdentifier___block_invoke((uint64_t)&v10);
    os_unfair_lock_unlock(&self->_lock);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "extensionAnalyticsEventCoalescer:didInvokeToolbarButtonForExtensionWithIdentifier:", self, v7, v10, v11);

  }
  return v6 ^ 1;
}

void __89__WBSExtensionsAnalyticsEventCoalescer_didInvokeToolbarButtonForExtensionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v1, "addObject:", v2);

}

- (void)setResetInterval:(double)a3
{
  self->_resetInterval = a3;
  -[WBSExtensionsAnalyticsEventCoalescer _configureResetTimer](self, "_configureResetTimer");
}

void __60__WBSExtensionsAnalyticsEventCoalescer__configureResetTimer__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  id v3;
  _QWORD v4[5];

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __60__WBSExtensionsAnalyticsEventCoalescer__configureResetTimer__block_invoke_2;
    v4[3] = &unk_1E5441CB8;
    v4[4] = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 6);
    __60__WBSExtensionsAnalyticsEventCoalescer__configureResetTimer__block_invoke_2((uint64_t)v4);
    os_unfair_lock_unlock(v2 + 6);
    v3 = objc_loadWeakRetained((id *)&v2[10]);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "extensionAnalyticsEventCoalescerDidResetCachedExtensions:", v2);

  }
}

uint64_t __60__WBSExtensionsAnalyticsEventCoalescer__configureResetTimer__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

- (void)extensionAnalyticsEventCoalescer:(id)a3 didInjectScriptForExtensionWithIdentifier:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D8A0A8];
  v5 = a4;
  objc_msgSend(v4, "sharedLogger");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didInjectScriptForExtensionWithIdentifier:", v5);

}

- (void)extensionAnalyticsEventCoalescer:(id)a3 didInvokeToolbarButtonForExtensionWithIdentifier:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D8A0A8];
  v5 = a4;
  objc_msgSend(v4, "sharedLogger");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didInvokeToolbarButtonForExtensionWithIdentifier:", v5);

}

- (WBSExtensionsAnalyticsEventCoalescerDelegate)delegate
{
  return (WBSExtensionsAnalyticsEventCoalescerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resetTimer, 0);
  objc_storeStrong((id *)&self->_buttonInvokedExtensions, 0);
  objc_storeStrong((id *)&self->_injectedScriptExtensions, 0);
}

@end

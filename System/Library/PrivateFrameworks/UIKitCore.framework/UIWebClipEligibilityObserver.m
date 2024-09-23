@implementation UIWebClipEligibilityObserver

+ (id)sharedObserver
{
  if (qword_1ECD82900 != -1)
    dispatch_once(&qword_1ECD82900, &__block_literal_global_644_0);
  return (id)_MergedGlobals_1337;
}

void __46__UIWebClipEligibilityObserver_sharedObserver__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[UIWebClipEligibilityObserver _init]([UIWebClipEligibilityObserver alloc], "_init");
  v1 = (void *)_MergedGlobals_1337;
  _MergedGlobals_1337 = (uint64_t)v0;

}

- (id)_init
{
  UIWebClipEligibilityObserver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  UIWebClipEligibilityObserver *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIWebClipEligibilityObserver;
  v2 = -[UIWebClipEligibilityObserver init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.UIKit.webClipEligibilityObserver", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)startObservingEligibility
{
  void *v3;
  void *v4;
  int v5;
  _QWORD block[5];

  if (!self->_notifyToken)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.springboard"));

    if (v5)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__UIWebClipEligibilityObserver_startObservingEligibility__block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      if (startObservingEligibility_onceTokenCompletion != -1)
        dispatch_once(&startObservingEligibility_onceTokenCompletion, block);
    }
  }
}

uint64_t __57__UIWebClipEligibilityObserver_startObservingEligibility__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v8[5];
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__UIWebClipEligibilityObserver_startObservingEligibility__block_invoke_2;
  block[3] = &unk_1E16B1B28;
  block[4] = v2;
  dispatch_async(v4, block);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 16);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __57__UIWebClipEligibilityObserver_startObservingEligibility__block_invoke_3;
  v8[3] = &unk_1E16BDB68;
  v8[4] = v5;
  return notify_register_dispatch("com.apple.os-eligibility-domain.change.beryllium", (int *)(v5 + 8), v6, v8);
}

uint64_t __57__UIWebClipEligibilityObserver_startObservingEligibility__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEligibilityIfNeeded");
}

uint64_t __57__UIWebClipEligibilityObserver_startObservingEligibility__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEligibilityIfNeeded");
}

- (void)_updateEligibilityIfNeeded
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "webClips");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)objc_opt_class(), "_determineEligibility");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "_requiresPlaceholderBundle", (_QWORD)v10))
          objc_msgSend(v9, "_updateWebClipWithEligibility:", v3);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)dealloc
{
  int notifyToken;
  objc_super v4;

  notifyToken = self->_notifyToken;
  if (notifyToken)
    notify_cancel(notifyToken);
  v4.receiver = self;
  v4.super_class = (Class)UIWebClipEligibilityObserver;
  -[UIWebClipEligibilityObserver dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

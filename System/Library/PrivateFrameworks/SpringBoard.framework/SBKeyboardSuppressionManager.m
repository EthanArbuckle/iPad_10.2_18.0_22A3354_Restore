@implementation SBKeyboardSuppressionManager

- (void)_setKeyboardSuppressed:(BOOL)a3 forReason:(id)a4 withPredicate:(id)a5 displayIdentity:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v8 = a3;
  v19 = a4;
  v10 = a5;
  v11 = a6;
  -[NSMutableDictionary objectForKey:](self->_keyboardSuppressionAssertions, "objectForKey:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
  {
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sceneDeactivationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "newAssertionWithReason:", 8);

    objc_msgSend(MEMORY[0x1E0CEA350], "transitionContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAnimationSettings:", v18);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keyboardSuppressionAssertions, "setObject:forKeyedSubscript:", v16, v19);
    if (v11)
      objc_msgSend(v16, "sb_acquireWithPredicate:transitionContext:displayIdentity:", v10, v17, v11);
    else
      objc_msgSend(v16, "acquireWithPredicate:transitionContext:", v10, v17);
    objc_msgSend(v13, "relinquish");

    goto LABEL_8;
  }

  if (v13)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_keyboardSuppressionAssertions, "objectForKeyedSubscript:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "relinquish");
    -[NSMutableDictionary removeObjectForKey:](self->_keyboardSuppressionAssertions, "removeObjectForKey:", v19);
LABEL_8:

  }
}

- (void)stopSuppressingKeyboardWithReason:(id)a3
{
  -[SBKeyboardSuppressionManager _setKeyboardSuppressed:forReason:withPredicate:displayIdentity:](self, "_setKeyboardSuppressed:forReason:withPredicate:displayIdentity:", 0, a3, 0, 0);
}

+ (SBKeyboardSuppressionManager)sharedInstance
{
  if (sharedInstance_token_0 != -1)
    dispatch_once(&sharedInstance_token_0, &__block_literal_global_103);
  return (SBKeyboardSuppressionManager *)(id)sharedInstance___sharedKeyboardManager;
}

uint64_t __46__SBKeyboardSuppressionManager_sharedInstance__block_invoke()
{
  SBKeyboardSuppressionManager *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBKeyboardSuppressionManager);
  v1 = (void *)sharedInstance___sharedKeyboardManager;
  sharedInstance___sharedKeyboardManager = (uint64_t)v0;

  return kdebug_trace();
}

- (SBKeyboardSuppressionManager)init
{
  SBKeyboardSuppressionManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *keyboardSuppressionAssertions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBKeyboardSuppressionManager;
  v2 = -[SBKeyboardSuppressionManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    keyboardSuppressionAssertions = v2->_keyboardSuppressionAssertions;
    v2->_keyboardSuppressionAssertions = v3;

  }
  return v2;
}

- (void)startSuppressingKeyboardWithReason:(id)a3 predicate:(id)a4 displayIdentity:(id)a5
{
  -[SBKeyboardSuppressionManager _setKeyboardSuppressed:forReason:withPredicate:displayIdentity:](self, "_setKeyboardSuppressed:forReason:withPredicate:displayIdentity:", 1, a3, a4, a5);
}

- (id)acquireKeyboardSuppressionAssertionWithReason:(id)a3 predicate:(id)a4 displayIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = objc_alloc(MEMORY[0x1E0D01868]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __104__SBKeyboardSuppressionManager_acquireKeyboardSuppressionAssertionWithReason_predicate_displayIdentity___block_invoke;
  v15[3] = &unk_1E8EA4CC0;
  objc_copyWeak(&v17, &location);
  v12 = v8;
  v16 = v12;
  v13 = (void *)objc_msgSend(v11, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("SBKeyboardSuppressionManager"), v12, v15);
  -[SBKeyboardSuppressionManager _setKeyboardSuppressed:forReason:withPredicate:displayIdentity:](self, "_setKeyboardSuppressed:forReason:withPredicate:displayIdentity:", 1, v12, v9, v10);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

void __104__SBKeyboardSuppressionManager_acquireKeyboardSuppressionAssertionWithReason_predicate_displayIdentity___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "stopSuppressingKeyboardWithReason:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, suppression reasons: %@>"), v5, self, self->_keyboardSuppressionAssertions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardSuppressionAssertions, 0);
}

@end

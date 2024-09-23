@implementation PKAuthenticator

- (PKAuthenticator)init
{
  return -[PKAuthenticator initWithDelegate:](self, "initWithDelegate:", 0);
}

- (PKAuthenticator)initWithDelegate:(id)a3
{
  id v4;
  PKAuthenticator *v5;
  PKAuthenticator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKAuthenticator;
  v5 = -[PKAuthenticator init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)dealloc
{
  id v3;
  void *v4;
  objc_super v5;
  _QWORD block[4];
  id v7;

  -[PKAuthenticatorEvaluationContext invalidate](self->_context, "invalidate");
  v3 = -[PKAuthenticatorEvaluationContext hoistCompletionHandler](self->_context, "hoistCompletionHandler");
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __26__PKAuthenticator_dealloc__block_invoke;
    block[3] = &unk_24D0A0B30;
    v7 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  v5.receiver = self;
  v5.super_class = (Class)PKAuthenticator;
  -[PKAuthenticator dealloc](&v5, sel_dealloc);
}

void __26__PKAuthenticator_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE6EA20], "responseWithResult:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (void)preheatAuthenticator
{
  objc_msgSend(a1, "currentStateForPolicy:", 0);
}

+ (void)resetSharedRootContextWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[PKAuthenticatorSharedRootContext sharedInstance](PKAuthenticatorSharedRootContext, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetWithCompletion:", v3);

}

+ (BOOL)isUserIntentAvailableWithStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  +[PKAuthenticatorSharedRootContext sharedInstance](PKAuthenticatorSharedRootContext, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userIntentAvailabilityState");

  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 != 1)
      return 0;
    return ((v5 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  else
  {
    return v5 == 1;
  }
}

+ (BOOL)_isAccessibilityUserIntentEnabled
{
  int IsAvailable;
  void *v3;
  char v4;

  IsAvailable = PKUserIntentIsAvailable();
  if (IsAvailable)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA958]), "initWithDomain:authenticationContext:", 0, 0);
    v4 = objc_msgSend(v3, "BOOLForKey:error:", 1, 0);

    LOBYTE(IsAvailable) = v4;
  }
  return IsAvailable;
}

+ (int64_t)userIntentStyle
{
  if (!PKUserIntentIsAvailable())
    return 0;
  if (!objc_msgSend(a1, "_isAccessibilityUserIntentEnabled"))
    return 1;
  if (_AXSAssistiveTouchEnabled())
    return 2;
  if (UIAccessibilityIsSwitchControlRunning())
    return 3;
  return -1;
}

+ (void)removeUserIntentAvailable
{
  id v2;

  +[PKAuthenticatorSharedRootContext sharedInstance](PKAuthenticatorSharedRootContext, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userIntentAvailabilityState") == 3)
    objc_msgSend(v2, "setUserIntentAvailabilityState:", 2);

}

+ (unint64_t)currentStateForPolicy:(int64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  CFTimeInterval v9;
  _QWORD v11[7];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v5 = _LAPolicyContainerForPKPolicy(a3);
  v7 = v6;
  if ((v6 & 0x100) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __41__PKAuthenticator_currentStateForPolicy___block_invoke;
    v12[3] = &unk_24D0A1348;
    v12[4] = &v13;
    v12[5] = v5;
    v12[6] = v6;
    _AccessPreflightContext(HIDWORD(v6) & 1, v12);
  }
  v8 = objc_msgSend(a1, "_currentStateForMechanisms:", v14[5]);
  if ((v7 & 0x100000000) == 0)
  {
    v9 = CACurrentMediaTime();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __41__PKAuthenticator_currentStateForPolicy___block_invoke_411;
    v11[3] = &__block_descriptor_56_e29_v16__0__NSMutableDictionary_8l;
    v11[4] = v8;
    *(CFTimeInterval *)&v11[5] = v9;
    v11[6] = a3;
    _AccessAuthenticatorStateCache(v11);
  }
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __41__PKAuthenticator_currentStateForPolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  objc_msgSend(a2, "evaluationMechanismsForPolicy:error:", v6, &v12);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v12;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  if (v8)
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_213A36000, v11, OS_LOG_TYPE_DEFAULT, "Authentication Mechanism Error: %@", buf, 0xCu);
    }

  }
  v5[2](v5);

}

void __41__PKAuthenticator_currentStateForPolicy___block_invoke_411(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v7 = a1[4];
  v8 = a1[5];
  v3 = (void *)MEMORY[0x24BDD1968];
  v4 = a2;
  objc_msgSend(v3, "valueWithBytes:objCType:", &v7, "{?=Qd}");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[6], v7, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v6);

}

+ (void)currentStateForRequest:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v8 = a4;
  v6 = _LAPolicyContainerForPKPolicy(objc_msgSend(a3, "policy"));
  if ((v7 & 0x100) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__PKAuthenticator_currentStateForRequest_completion___block_invoke;
    v9[3] = &unk_24D0A13B8;
    v11 = v6;
    v12 = v7;
    v10 = v8;
    v13 = a1;
    _AccessPreflightContext(0, v9);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

void __53__PKAuthenticator_currentStateForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  _QWORD v10[4];
  id v11;
  id v12;
  __int128 v13;
  uint64_t v14;

  v5 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__PKAuthenticator_currentStateForRequest_completion___block_invoke_2;
  v10[3] = &unk_24D0A1390;
  v13 = *(_OWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 56);
  v11 = v6;
  v12 = v5;
  v7 = v5;
  v8 = a2;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199BB0CC](v10);
  ((void (**)(_QWORD, id, _QWORD))v9)[2](v9, v8, 0);

}

void __53__PKAuthenticator_currentStateForRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 48);
  v10 = a3;
  v6 = a3;
  objc_msgSend(a2, "evaluationMechanismsForPolicy:error:", v5, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;

  if (v8)
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_213A36000, v9, OS_LOG_TYPE_DEFAULT, "Authentication Mechanism Error: %@", buf, 0xCu);
    }

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 64), "_currentStateForMechanisms:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (unint64_t)currentStateForAccessControl:(__SecAccessControl *)a3
{
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__PKAuthenticator_currentStateForAccessControl___block_invoke;
  v6[3] = &unk_24D0A13E0;
  v6[4] = &v7;
  v6[5] = a3;
  _AccessPreflightContext(0, v6);
  v4 = objc_msgSend(a1, "_currentStateForMechanisms:", v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__PKAuthenticator_currentStateForAccessControl___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  objc_msgSend(a2, "evaluationMechanismsForAccessControl:operation:error:", v6, 3, &v12);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v12;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  if (v8)
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_213A36000, v11, OS_LOG_TYPE_DEFAULT, "Authentication Mechanism Error: %@", buf, 0xCu);
    }

  }
  v5[2](v5);

}

+ (BOOL)canPerformPSD2StyleBuyForAccessControlRef:(__SecAccessControl *)a3
{
  int v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    CFRetain(a3);
    v4 = +[PKAuthenticator currentStateForAccessControl:](PKAuthenticator, "currentStateForAccessControl:", a3);
    v5 = v4 & +[PKAuthenticator currentStateForPolicy:](PKAuthenticator, "currentStateForPolicy:", 2) & 0xELL;
    v6 = v5 != 0;
    CFRelease(a3);
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "+[PKAuthenticator canPerformPSD2StyleBuyForAccessControlRef:]";
      v11 = 1024;
      v12 = v5 != 0;
      _os_log_impl(&dword_213A36000, v7, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v9, 0x12u);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_213A36000, v7, OS_LOG_TYPE_DEFAULT, "ACL is missing, cannot determine if a buy is possible.", (uint8_t *)&v9, 2u);
    }
    v6 = 0;
  }

  return v6;
}

+ (unint64_t)_currentStateForMechanisms:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "containsObject:", &unk_24D0A9CC8))
      v4 = 2;
    else
      v4 = 0;
    if (objc_msgSend(v3, "containsObject:", &unk_24D0A9CB0))
      v4 |= 8uLL;
    v5 = objc_msgSend(v3, "containsObject:", &unk_24D0A9CE0);
    v6 = v4 | 4;
    if (!v5)
      v6 = v4;
    if (v6)
      v7 = v6 | 1;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (unint64_t)cachedStateForPolicy:(int64_t)a3
{
  uint64_t v5;
  double v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v10;
  double v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  _LAPolicyContainerForPKPolicy(a3);
  if ((v5 & 0x100000000) == 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __40__PKAuthenticator_cachedStateForPolicy___block_invoke;
    v12[3] = &unk_24D0A1408;
    v12[4] = &v13;
    v12[5] = a3;
    _AccessAuthenticatorStateCache(v12);
  }
  if (!v14[5])
  {
    v8 = objc_msgSend(a1, "currentStateForPolicy:", a3);
LABEL_8:
    v7 = v8;
    goto LABEL_9;
  }
  v6 = CACurrentMediaTime();
  v10 = 0;
  v11 = 0.0;
  objc_msgSend((id)v14[5], "getValue:", &v10);
  if (v6 - v11 >= 0.2)
  {
    v8 = objc_msgSend(a1, "currentStateForPolicy:", a3, v6 - v11);
    goto LABEL_8;
  }
  v7 = v10;
LABEL_9:
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __40__PKAuthenticator_cachedStateForPolicy___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "numberWithInteger:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

+ (id)viewServiceBundleID
{
  return CFSTR("com.apple.CoreAuthUI");
}

- (id)_context
{
  os_unfair_lock_s *p_lock;
  PKAuthenticatorEvaluationContext *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_context;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_swapContext:(id)a3
{
  return -[PKAuthenticator _swapContext:withOptions:](self, "_swapContext:withOptions:", a3, 0);
}

- (id)_swapContext:(id)a3 withOptions:(unint64_t)a4
{
  char v4;
  id v7;
  PKAuthenticatorEvaluationContext *context;
  PKAuthenticatorEvaluationContext **p_context;
  void *v10;
  void *v11;
  PKAuthenticatorEvaluationContext *v12;
  PKAuthenticatorEvaluationContext *v13;
  unint64_t v14;
  id WeakRetained;
  void *v16;
  BOOL v17;
  uint64_t v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  void *v21;
  char v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void (**v29)(_QWORD, _QWORD);
  void *v30;
  PKAuthenticatorEvaluationContext *v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  p_context = &self->_context;
  context = self->_context;
  v33 = v7;
  if (self->_invalidated)
  {
    if ((unint64_t)v7 | (unint64_t)context)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
      v11 = v10;
      if (*p_context)
      {
        objc_msgSend(v10, "addObject:");
        v12 = *p_context;
        if (!v7)
          goto LABEL_5;
      }
      else
      {
        v12 = 0;
        if (!v7)
        {
LABEL_5:
          if (!v12)
            goto LABEL_10;
          goto LABEL_14;
        }
      }
      v17 = v12 == v7;
      v12 = (PKAuthenticatorEvaluationContext *)v7;
      if (!v17)
      {
        objc_msgSend(v11, "addObject:", v7);
        v12 = *p_context;
        if (!*p_context)
          goto LABEL_10;
      }
LABEL_14:
      *p_context = 0;

      WeakRetained = 0;
      v14 = 0;
      v13 = 0;
      goto LABEL_15;
    }
LABEL_9:
    v11 = 0;
LABEL_10:
    os_unfair_lock_unlock(&self->_lock);
    v13 = 0;
    v14 = 0;
    v16 = 0;
    goto LABEL_25;
  }
  if (context == v7)
    goto LABEL_9;
  v13 = context;
  v14 = (unint64_t)v7;
  objc_storeStrong((id *)&self->_context, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = 0;
LABEL_15:
  ++self->_authenticationIdentifier;
  os_unfair_lock_unlock(&self->_lock);
  if (v13)
  {
    -[PKAuthenticatorEvaluationContext setDelegate:resetPriorDelegate:](v13, "setDelegate:resetPriorDelegate:", 0, v14 == 0);
    -[PKAuthenticatorEvaluationContext invalidateWithIntent:](v13, "invalidateWithIntent:", (v4 & 2 | v14) != 0);
    v18 = -[PKAuthenticatorEvaluationContext hoistCompletionHandler](v13, "hoistCompletionHandler");
    v19 = (void (**)(_QWORD, _QWORD))v18;
    if ((v4 & 1) == 0 && v18)
    {
      objc_msgSend(MEMORY[0x24BE6EA20], "responseWithResult:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v19)[2](v19, v20);

    }
  }
  if (v14)
  {
    objc_msgSend((id)v14, "request");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "useLegacyAuthenticator");

    if ((v22 & 1) == 0)
      objc_msgSend((id)v14, "_updateEvaluationState");
    v16 = WeakRetained;
    objc_msgSend((id)v14, "setDelegate:", WeakRetained);
  }
  else
  {
    v16 = WeakRetained;
  }
LABEL_25:
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v23 = v11;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v28, "invalidate");
        v29 = (void (**)(_QWORD, _QWORD))objc_msgSend(v28, "hoistCompletionHandler");
        if (v29)
        {
          objc_msgSend(MEMORY[0x24BE6EA20], "responseWithResult:", 2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v29)[2](v29, v30);

        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v25);
  }

  v31 = v13;
  return v31;
}

- (id)_optionsForEvaluationRequest:(id)a3 withEvaluationContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1B8], &unk_24D0A9D70);
  if ((objc_msgSend(v6, "passcodeOnly") & 1) == 0)
  {
    if (PKPearlIsAvailable())
      v9 = &unk_24D0A9CC8;
    else
      v9 = &unk_24D0A9CE0;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1B8], v9);
  }
  if (PKUserIntentIsAvailable())
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1B8], &unk_24D0A9CF8);
  v10 = -[PKAuthenticator _delegateSupportsPasscodePresentation](self, "_delegateSupportsPasscodePresentation");
  v11 = MEMORY[0x24BDBD1C8];
  if (v10)
  {
    v37 = &unk_24D0A9D70;
    v38[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, &unk_24D0A9CB0);

  }
  if (-[PKAuthenticator _delegateSupportsPassphrasePresentation](self, "_delegateSupportsPassphrasePresentation"))
  {
    v35 = &unk_24D0A9D70;
    v36 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, &unk_24D0A9C98);

  }
  v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, &unk_24D0A9DE8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "maxBiometryFailures"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, &unk_24D0A9E00);

  v16 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], &unk_24D0A9E18);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_24D0A9D70, &unk_24D0A9E30);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, &unk_24D0A9E48);
  objc_msgSend(v6, "processName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v6, "processName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, &unk_24D0A9E60);

  }
  objc_msgSend(v6, "reason");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v6, "reason");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, &unk_24D0A9CB0);

  }
  objc_msgSend(v6, "processIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v6, "processIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, &unk_24D0A9E78);

  }
  if (objc_msgSend(v7, "isPolicySupported"))
  {
    v23 = objc_msgSend(v7, "policy");
    if (v23 == 1017 || v23 == 1006)
    {
      objc_msgSend(v6, "PINTitle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "length"))
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, &unk_24D0A9E90);
      objc_msgSend(v6, "PINLength");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v25, &unk_24D0A9EA8);

    }
  }
  if (objc_msgSend(v7, "forceApplePayCheck"))
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], &unk_24D0A9EC0);
  if (objc_msgSend(v7, "forceSkipUserIntent"))
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], &unk_24D0A9ED8);
  if ((unint64_t)(objc_msgSend(v6, "policy") - 2) <= 7)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], &unk_24D0A9EF0);
  objc_msgSend(v6, "physicalButtonTitle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v6, "physicalButtonTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v27, &unk_24D0A9F08);

  }
  objc_msgSend(v6, "passcodeTitle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v6, "passcodeTitle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v29, &unk_24D0A9F20);

  }
  objc_msgSend(v6, "fallbackOptionTitle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "length");

  if (v31)
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], &unk_24D0A9F38);
    objc_msgSend(v6, "fallbackOptionTitle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v32, &unk_24D0A9CE0);

  }
  if (objc_msgSend(v6, "useLocationBasedAuthorization"))
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], &unk_24D0A9F50);
  v33 = (void *)objc_msgSend(v14, "copy");

  return v33;
}

- (void)_handleInstructionsForRequest:(id)a3 withContext:(id)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
}

- (void)_evaluateEvaluationContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAuthenticator _optionsForEvaluationRequest:withEvaluationContext:](self, "_optionsForEvaluationRequest:withEvaluationContext:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__PKAuthenticator__evaluateEvaluationContext___block_invoke;
  v9[3] = &unk_24D0A1430;
  objc_copyWeak(&v12, &location);
  v7 = v5;
  v10 = v7;
  v8 = v4;
  v11 = v8;
  objc_msgSend(v8, "evaluateWithOptions:completion:", v6, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __46__PKAuthenticator__evaluateEvaluationContext___block_invoke(id *a1, unsigned __int8 a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __int16 v22;
  _QWORD *v23;
  void (**v24)(_QWORD, _QWORD);
  void *v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v11 = 0;
  v12 = a2 & (WeakRetained != 0);
  if (v12)
    v13 = 0;
  else
    v13 = 5;
  if (v12 == 1)
  {
    if (objc_msgSend(a1[4], "policy") != 1)
    {
      objc_msgSend(v8, "externalizedContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_30;
      goto LABEL_8;
    }
    v11 = 0;
  }
  if (!v9)
    goto LABEL_30;
LABEL_8:
  PKLogFacilityTypeGetObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412290;
    v27 = v9;
    _os_log_impl(&dword_213A36000, v14, OS_LOG_TYPE_DEFAULT, "Authentication Error: %@", (uint8_t *)&v26, 0xCu);
  }

  objc_msgSend(v9, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDDA908]);

  if (v16)
  {
    v17 = objc_msgSend(v9, "code");
    switch(v17)
    {
      case -9:
        v13 = 2;
        break;
      case -8:
        v13 = 6;
        break;
      case -7:
        v13 = 3;
        break;
      case -6:
      case -5:
        break;
      case -4:
        objc_msgSend(v9, "userInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BDDA918]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = objc_msgSend(v19, "integerValue");
          v21 = 4;
          if (v20 == 9)
            v21 = 1;
          if (v20 == 18)
            v13 = 3;
          else
            v13 = v21;
        }
        else
        {
          v13 = 4;
        }

        break;
      case -3:
        goto LABEL_18;
      case -2:
        v13 = 1;
        break;
      default:
        if (v17 == -1023)
        {
          if (objc_msgSend(a1[4], "policy") == 10)
            v13 = 0;
          else
LABEL_18:
            v13 = 7;
        }
        break;
    }
  }
LABEL_30:
  if ((v12 & 1) != 0)
  {
    v22 = objc_msgSend(a1[5], "presentationFlags");
    v23 = (_QWORD *)MEMORY[0x24BE6EFA0];
    if ((v22 & 0x180) == 0)
      v23 = (_QWORD *)MEMORY[0x24BE6EFA8];
    MEMORY[0x2199BAC28](*v23, 0);
  }
  v24 = (void (**)(_QWORD, _QWORD))objc_msgSend(a1[5], "hoistCompletionHandler");
  if (v24)
  {
    objc_msgSend(MEMORY[0x24BE6EA20], "responseWithResult:biometricMatch:credential:", v13, objc_msgSend(a1[5], "biometricMatch"), v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v24)[2](v24, v25);

  }
}

- (void)evaluateRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  PKAuthenticatorEvaluationContext *v8;
  id v9;
  _QWORD v10[4];
  PKAuthenticatorEvaluationContext *v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[PKAuthenticatorEvaluationContext initWithRequest:completionHandler:forAuthenticator:]([PKAuthenticatorEvaluationContext alloc], "initWithRequest:completionHandler:forAuthenticator:", v6, v7, self);
  if (!-[PKAuthenticatorEvaluationContext isInvalidated](v8, "isInvalidated"))
  {
    v9 = -[PKAuthenticator _swapContext:](self, "_swapContext:", v8);
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __50__PKAuthenticator_evaluateRequest_withCompletion___block_invoke;
    v10[3] = &unk_24D0A1458;
    objc_copyWeak(&v12, &location);
    v11 = v8;
    -[PKAuthenticator _handleInstructionsForRequest:withContext:completion:](self, "_handleInstructionsForRequest:withContext:completion:", v6, v11, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __50__PKAuthenticator_evaluateRequest_withCompletion___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(void **)(a1 + 32);
  v8 = WeakRetained;
  if (WeakRetained && a2)
  {
    objc_msgSend(WeakRetained, "_evaluateEvaluationContext:", v5);
  }
  else
  {
    objc_msgSend(v5, "invalidate");
    v6 = (void (**)(_QWORD, _QWORD))objc_msgSend(*(id *)(a1 + 32), "hoistCompletionHandler");
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BE6EA20], "responseWithResult:", 5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v7);

    }
  }

}

- (void)fallbackToSystemPasscodeUI
{
  id v2;

  -[PKAuthenticator _context](self, "_context");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fallbackToPasscode");

}

- (void)cancelEvaluation
{
  -[PKAuthenticator cancelEvaluationWithOptions:](self, "cancelEvaluationWithOptions:", 0);
}

- (void)cancelEvaluationWithOptions:(unint64_t)a3
{
  id v3;

  v3 = -[PKAuthenticator _swapContext:withOptions:](self, "_swapContext:withOptions:", 0, a3);
}

- (void)restartEvaluation
{
  os_unfair_lock_s *p_lock;
  PKAuthenticatorEvaluationContext *context;
  id v5;
  id WeakRetained;
  id v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  context = self->_context;
  if (context)
  {
    -[PKAuthenticatorEvaluationContext request](context, "request");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[PKAuthenticatorEvaluationContext hoistCompletionHandler](self->_context, "hoistCompletionHandler");
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      if (objc_msgSend(v7, "useLegacyAuthenticator"))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "authenticatorWillRestartEvaluation:", self);

      }
      -[PKAuthenticator evaluateRequest:withCompletion:](self, "evaluateRequest:withCompletion:", v7, v5);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    v7 = 0;
    v5 = 0;
  }

}

- (void)accessExternalizedContextWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PKAuthenticator _context](self, "_context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__PKAuthenticator_accessExternalizedContextWithCompletion___block_invoke;
  v7[3] = &unk_24D0A1480;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "accessLAContext:", v7);

}

void __59__PKAuthenticator_accessExternalizedContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "externalizedContext");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
  -[PKAuthenticator cancelEvaluation](self, "cancelEvaluation");
}

- (unint64_t)authenticationIdentifier
{
  os_unfair_lock_s *p_lock;
  unint64_t authenticationIdentifier;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  authenticationIdentifier = self->_authenticationIdentifier;
  os_unfair_lock_unlock(p_lock);
  return authenticationIdentifier;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  PKAuthenticatorEvaluationContext *context;
  PKAuthenticatorEvaluationContext *v6;
  id obj;

  obj = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_storeWeak((id *)&self->_delegate, obj);
  if (self->_invalidated)
    context = 0;
  else
    context = self->_context;
  v6 = context;
  os_unfair_lock_unlock(p_lock);
  -[PKAuthenticatorEvaluationContext setDelegate:](v6, "setDelegate:", obj);

}

- (int64_t)evaluationState
{
  void *v2;
  int64_t v3;

  -[PKAuthenticator _context](self, "_context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "evaluationState");

  return v3;
}

- (int64_t)coachingState
{
  void *v2;
  int64_t v3;

  -[PKAuthenticator _context](self, "_context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "coachingState");

  return v3;
}

- (BOOL)fingerPresent
{
  void *v2;
  char v3;

  -[PKAuthenticator _context](self, "_context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fingerPresent");

  return v3;
}

- (BOOL)passcodeActive
{
  void *v2;
  char v3;

  -[PKAuthenticator _context](self, "_context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "passcodeActive");

  return v3;
}

- (BOOL)passphraseActive
{
  void *v2;
  char v3;

  -[PKAuthenticator _context](self, "_context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "passphraseActive");

  return v3;
}

- (BOOL)passcodeWasPresented
{
  void *v2;
  __int16 v3;

  -[PKAuthenticator _context](self, "_context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "presentationFlags");

  return (v3 & 0x180) != 0;
}

- (BOOL)_delegateSupportsPasscodePresentation
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_delegateSupportsPassphrasePresentation
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (PKAuthenticatorDelegate)delegate
{
  return (PKAuthenticatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSDictionary)clientAnalyticsParameters
{
  return self->_clientAnalyticsParameters;
}

- (void)setClientAnalyticsParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientAnalyticsParameters, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
}

@end

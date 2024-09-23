@implementation PKAuthenticatorSharedRootContext

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  return (id)sharedInstance_context;
}

void __50__PKAuthenticatorSharedRootContext_sharedInstance__block_invoke()
{
  PKAuthenticatorSharedRootContext *v0;
  void *v1;

  v0 = objc_alloc_init(PKAuthenticatorSharedRootContext);
  v1 = (void *)sharedInstance_context;
  sharedInstance_context = (uint64_t)v0;

}

- (PKAuthenticatorSharedRootContext)init
{
  PKAuthenticatorSharedRootContext *v2;
  PKAuthenticatorSharedRootContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAuthenticatorSharedRootContext;
  v2 = -[PKAuthenticatorSharedRootContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_userIntentAvailabilityState = -[PKAuthenticatorSharedRootContext _initialUserIntentAvailabilityState](v2, "_initialUserIntentAvailabilityState");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PKAuthenticatorSharedRootContext resetWithCompletion:](self, "resetWithCompletion:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PKAuthenticatorSharedRootContext;
  -[PKAuthenticatorSharedRootContext dealloc](&v3, sel_dealloc);
}

- (int64_t)_initialUserIntentAvailabilityState
{
  if (!PKUserIntentIsAvailable())
    return 2;
  if (!PKPearlIsAvailable())
    return 3;
  if (PKRunningInViewService())
    return 3;
  return 2;
}

- (void)resetWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  LAContext *v5;
  LAContext *LAContext;
  NSObject *v7;
  _QWORD v8[4];
  LAContext *v9;
  void (**v10)(_QWORD);
  uint8_t buf[4];
  LAContext *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_LAContext;
  LAContext = self->_LAContext;
  self->_LAContext = 0;

  self->_userIntentAvailabilityState = -[PKAuthenticatorSharedRootContext _initialUserIntentAvailabilityState](self, "_initialUserIntentAvailabilityState");
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v12 = v5;
      _os_log_impl(&dword_213A36000, v7, OS_LOG_TYPE_DEFAULT, "PKAuthenticatorSharedRootContext (%{public}p): shared context cleared and attempting reset...", buf, 0xCu);
    }

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__PKAuthenticatorSharedRootContext_resetWithCompletion___block_invoke;
    v8[3] = &unk_24D0A1000;
    v9 = v5;
    v10 = v4;
    -[LAContext resetWithReply:](v9, "resetWithReply:", v8);

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

void __56__PKAuthenticatorSharedRootContext_resetWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 || (a2 & 1) == 0)
  {
    if (!v7)
      goto LABEL_8;
    v12 = *(_QWORD *)(a1 + 32);
    v17 = 134349314;
    v18 = v12;
    v19 = 2112;
    v20 = v5;
    v9 = "PKAuthenticatorSharedRootContext (%{public}p): failed to reset former shared context - %@.";
    v10 = v6;
    v11 = 22;
  }
  else
  {
    if (!v7)
      goto LABEL_8;
    v8 = *(_QWORD *)(a1 + 32);
    v17 = 134349056;
    v18 = v8;
    v9 = "PKAuthenticatorSharedRootContext (%{public}p): former context reset and invalidated.";
    v10 = v6;
    v11 = 12;
  }
  _os_log_impl(&dword_213A36000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, v11);
LABEL_8:

  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 16))(v16, v13, v14, v15);

}

- (id)externalizedContext
{
  os_unfair_lock_s *p_lock;
  LAContext *LAContext;
  LAContext *v5;
  LAContext *v6;
  NSObject *v7;
  LAContext *v8;
  LAContext *v9;
  void *v10;
  int v12;
  LAContext *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LAContext = self->_LAContext;
  if (!LAContext)
  {
    v5 = (LAContext *)objc_alloc_init(MEMORY[0x24BDDA938]);
    v6 = self->_LAContext;
    self->_LAContext = v5;

    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_LAContext;
      v12 = 134349056;
      v13 = v8;
      _os_log_impl(&dword_213A36000, v7, OS_LOG_TYPE_DEFAULT, "PKAuthenticatorSharedRootContext (%{public}p): creating shared root.", (uint8_t *)&v12, 0xCu);
    }

    LAContext = self->_LAContext;
  }
  v9 = LAContext;
  os_unfair_lock_unlock(p_lock);
  -[LAContext externalizedContext](v9, "externalizedContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)userIntentAvailabilityState
{
  return self->_userIntentAvailabilityState;
}

- (void)setUserIntentAvailabilityState:(int64_t)a3
{
  self->_userIntentAvailabilityState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_LAContext, 0);
}

@end

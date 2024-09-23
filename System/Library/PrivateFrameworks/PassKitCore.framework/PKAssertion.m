@implementation PKAssertion

+ (void)preheatConnection
{
  id v2;

  v2 = +[PKAssertionCoordinator sharedInstance](PKAssertionCoordinator, "sharedInstance");
}

+ (void)acquireAssertionOfType:(unint64_t)a3 withReason:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v7 = a5;
  if (v7)
  {
    v8 = a4;
    +[PKAssertionCoordinator sharedInstance](PKAssertionCoordinator, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__PKAssertion_acquireAssertionOfType_withReason_completion___block_invoke;
    v10[3] = &unk_1E2AD7EE8;
    v11 = v7;
    objc_msgSend(v9, "acquireAssertionOfType:withReason:completion:", a3, v8, v10);

  }
}

uint64_t __60__PKAssertion_acquireAssertionOfType_withReason_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)isAssertionValid:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void (**)(id, _QWORD))a4;
  if (v5)
  {
    if (v8 && (objc_msgSend(v8, "identifier"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
    {
      +[PKAssertionCoordinator sharedInstance](PKAssertionCoordinator, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "isAssertionValid:completion:", v8, v5);

    }
    else
    {
      v5[2](v5, 0);
    }
  }

}

+ (void)hasValidAssertionOfType:(unint64_t)a3 completion:(id)a4
{
  id v5;
  id v6;

  if (a4)
  {
    v5 = a4;
    +[PKAssertionCoordinator sharedInstance](PKAssertionCoordinator, "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hasValidAssertionOfType:completion:", a3, v5);

  }
}

- (PKAssertion)initWithType:(unint64_t)a3 identifier:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  PKAssertion *v10;
  PKAssertion *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *reason;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKAssertion;
  v10 = -[PKAssertion init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    reason = v11->_reason;
    v11->_reason = (NSString *)v14;

    v11->_invalidateWhenBackgrounded = 1;
    v11->_invalidationLock._os_unfair_lock_opaque = 0;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[PKAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKAssertion;
  -[PKAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  os_unfair_lock_s *p_invalidationLock;
  id invalidationHandler;
  void *v5;
  id v6;

  p_invalidationLock = &self->_invalidationLock;
  os_unfair_lock_lock(&self->_invalidationLock);
  v6 = _Block_copy(self->_invalidationHandler);
  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  +[PKAssertionCoordinator sharedInstance](PKAssertionCoordinator, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateAssertion:completion:", self, v6);

  os_unfair_lock_unlock(p_invalidationLock);
}

- (void)markAsInvalidatedAndNotify
{
  os_unfair_lock_s *p_invalidationLock;
  void *v4;
  id invalidationHandler;
  uint64_t v6;
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  _QWORD block[4];
  id v11;

  p_invalidationLock = &self->_invalidationLock;
  os_unfair_lock_lock(&self->_invalidationLock);
  v4 = _Block_copy(self->_invalidationHandler);
  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  os_unfair_lock_unlock(p_invalidationLock);
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__PKAssertion_markAsInvalidatedAndNotify__block_invoke;
    v8[3] = &unk_1E2ABD9A0;
    v9 = v4;
    v7 = v8;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_17;
    block[3] = &unk_1E2ABD9A0;
    v11 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __41__PKAssertion_markAsInvalidatedAndNotify__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setInvalidateWhenBackgrounded:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_invalidationLock;
  void *v6;

  v3 = a3;
  p_invalidationLock = &self->_invalidationLock;
  os_unfair_lock_lock(&self->_invalidationLock);
  if (self->_invalidateWhenBackgrounded != v3)
  {
    self->_invalidateWhenBackgrounded = v3;
    +[PKAssertionCoordinator sharedInstance](PKAssertionCoordinator, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assertion:shouldInvalidateWhenBackgrounded:", self, v3);

  }
  os_unfair_lock_unlock(p_invalidationLock);
}

- (id)description
{
  unint64_t type;
  const __CFString *v3;

  type = self->_type;
  if (type > 8)
    v3 = CFSTR("unknown");
  else
    v3 = off_1E2AD7F08[type];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion Type: %@, Identifier: %@, Reason: %@"), v3, self->_identifier, self->_reason);
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)invalidateWhenBackgrounded
{
  return self->_invalidateWhenBackgrounded;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end

@implementation _HDSPOSTransaction

+ (id)assertionWithIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "assertionWithIdentifier:timeout:", a3, 5.0);
}

+ (id)assertionWithIdentifier:(id)a3 timeout:(double)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:timeout:", v5, a4);

  return v6;
}

- (_HDSPOSTransaction)initWithIdentifier:(id)a3 timeout:(double)a4
{
  id v7;
  _HDSPOSTransaction *v8;
  _HDSPOSTransaction *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t signpost_id;
  uint64_t v16;
  OS_os_transaction *transaction;
  dispatch_source_t v18;
  OS_dispatch_source *timer;
  NSObject *v20;
  NSObject *v21;
  dispatch_time_t v22;
  _HDSPOSTransaction *v23;
  _QWORD handler[4];
  id v26;
  id buf[2];
  objc_super v28;

  v7 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_HDSPOSTransaction;
  v8 = -[_HDSPOSTransaction init](&v28, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_transactionLock._os_unfair_lock_opaque = 0;
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    v9->_signpost_id = os_signpost_id_generate(v10);

    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_enabled(v11);

    if (v12)
    {
      HKSPLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      signpost_id = v9->_signpost_id;
      if (signpost_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_21610C000, v14, OS_SIGNPOST_INTERVAL_BEGIN, signpost_id, "_HDSPOSTransaction", (const char *)&unk_21618FF7B, (uint8_t *)buf, 2u);
      }

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    v16 = os_transaction_create();
    transaction = v9->_transaction;
    v9->_transaction = (OS_os_transaction *)v16;

    v18 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    timer = v9->_timer;
    v9->_timer = (OS_dispatch_source *)v18;

    objc_initWeak(buf, v9);
    v20 = v9->_timer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __49___HDSPOSTransaction_initWithIdentifier_timeout___block_invoke;
    handler[3] = &unk_24D4E4C10;
    objc_copyWeak(&v26, buf);
    dispatch_source_set_event_handler(v20, handler);
    v21 = v9->_timer;
    v22 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    dispatch_source_set_timer(v21, v22, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)v9->_timer);
    v23 = v9;
    objc_destroyWeak(&v26);
    objc_destroyWeak(buf);
  }

  return v9;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_transactionLock;
  void (**v4)(_QWORD);

  p_transactionLock = &self->_transactionLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_transactionLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_transactionLock);
}

- (void)releaseAssertion
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __38___HDSPOSTransaction_releaseAssertion__block_invoke;
  v2[3] = &unk_24D4E3498;
  v2[4] = self;
  -[_HDSPOSTransaction _withLock:](self, "_withLock:", v2);
}

- (void)_locked_release
{
  NSObject *timer;
  OS_os_transaction *transaction;
  OS_dispatch_source *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t signpost_id;
  uint8_t v11[16];

  timer = self->_timer;
  if (timer)
    dispatch_source_cancel(timer);
  transaction = self->_transaction;
  self->_transaction = 0;

  v5 = self->_timer;
  self->_timer = 0;

  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_enabled(v6);

  if (v7)
  {
    HKSPLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    signpost_id = self->_signpost_id;
    if (signpost_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_21610C000, v9, OS_SIGNPOST_INTERVAL_END, signpost_id, "_HDSPOSTransaction", (const char *)&unk_21618FF7B, v11, 2u);
    }

  }
}

- (void)dealloc
{
  objc_super v3;

  -[_HDSPOSTransaction releaseAssertion](self, "releaseAssertion");
  v3.receiver = self;
  v3.super_class = (Class)_HDSPOSTransaction;
  -[_HDSPOSTransaction dealloc](&v3, sel_dealloc);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_HDSPOSTransaction succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HDSPOSTransaction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("identifier"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_HDSPOSTransaction descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)signpost_id
{
  return self->_signpost_id;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (os_unfair_lock_s)transactionLock
{
  return self->_transactionLock;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

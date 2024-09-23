@implementation _HDSPPowerAssertion

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

- (_HDSPPowerAssertion)initWithIdentifier:(id)a3 timeout:(double)a4
{
  id v7;
  _HDSPPowerAssertion *v8;
  _HDSPPowerAssertion *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t signpost_id;
  void *v16;
  const __CFDictionary *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _HDSPPowerAssertion *v21;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  _QWORD v34[4];
  _QWORD v35[5];

  v35[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_HDSPPowerAssertion;
  v8 = -[_HDSPPowerAssertion init](&v27, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_assertionLock._os_unfair_lock_opaque = 0;
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
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21610C000, v14, OS_SIGNPOST_INTERVAL_BEGIN, signpost_id, "_HDSPPowerAssertion", (const char *)&unk_21618FF7B, buf, 2u);
      }

    }
    v34[0] = CFSTR("AssertType");
    v34[1] = CFSTR("AssertName");
    v35[0] = CFSTR("PreventUserIdleSystemSleep");
    v35[1] = v7;
    v35[2] = CFSTR("TimeoutActionRelease");
    v34[2] = CFSTR("TimeoutAction");
    v34[3] = CFSTR("TimeoutSeconds");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
    v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v18 = IOPMAssertionCreateWithProperties(v17, &v9->_assertionID);
    if ((_DWORD)v18)
    {
      v19 = v18;
      HKSPLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_opt_class();
        v24 = (void *)MEMORY[0x24BDD16E0];
        v25 = v23;
        objc_msgSend(v24, "numberWithInt:", v19);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v29 = v23;
        v30 = 2114;
        v31 = v26;
        v32 = 2114;
        v33 = v7;
        _os_log_error_impl(&dword_21610C000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Error %{public}@ taking power assert for %{public}@", buf, 0x20u);

      }
    }
    v21 = v9;

  }
  return v9;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_assertionLock;
  void (**v4)(_QWORD);

  p_assertionLock = &self->_assertionLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_assertionLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_assertionLock);
}

- (void)releaseAssertion
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __39___HDSPPowerAssertion_releaseAssertion__block_invoke;
  v2[3] = &unk_24D4E3498;
  v2[4] = self;
  -[_HDSPPowerAssertion _withLock:](self, "_withLock:", v2);
}

- (void)_locked_release
{
  IOPMAssertionID assertionID;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t signpost_id;
  uint8_t v9[16];

  assertionID = self->_assertionID;
  if (assertionID)
  {
    IOPMAssertionRelease(assertionID);
    self->_assertionID = 0;
    HKSPLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_enabled(v4);

    if (v5)
    {
      HKSPLogForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      signpost_id = self->_signpost_id;
      if (signpost_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_WORD *)v9 = 0;
        _os_signpost_emit_with_name_impl(&dword_21610C000, v7, OS_SIGNPOST_INTERVAL_END, signpost_id, "_HDSPPowerAssertion", (const char *)&unk_21618FF7B, v9, 2u);
      }

    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[_HDSPPowerAssertion releaseAssertion](self, "releaseAssertion");
  v3.receiver = self;
  v3.super_class = (Class)_HDSPPowerAssertion;
  -[_HDSPPowerAssertion dealloc](&v3, sel_dealloc);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_HDSPPowerAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  -[_HDSPPowerAssertion identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("identifier"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_HDSPPowerAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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

- (os_unfair_lock_s)assertionLock
{
  return self->_assertionLock;
}

- (unsigned)assertionID
{
  return self->_assertionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

@implementation WFDispatchSourceTimer

- (WFDispatchSourceTimer)initWithInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  return -[WFDispatchSourceTimer initWithInterval:repeatIntervalInt:queue:handler:](self, "initWithInterval:repeatIntervalInt:queue:handler:", -1, a4, a5, a3);
}

- (WFDispatchSourceTimer)initWithInterval:(double)a3 repeatInterval:(double)a4 queue:(id)a5 handler:(id)a6
{
  return -[WFDispatchSourceTimer initWithInterval:repeatIntervalInt:queue:handler:](self, "initWithInterval:repeatIntervalInt:queue:handler:", (unint64_t)(a4 * 1000000000.0), a5, a6, a3);
}

- (WFDispatchSourceTimer)initWithInterval:(double)a3 repeatIntervalInt:(unint64_t)a4 queue:(id)a5 handler:(id)a6
{
  NSObject *v11;
  id v12;
  WFDispatchSourceTimer *v13;
  dispatch_source_t v14;
  OS_dispatch_source *source;
  NSObject *v16;
  dispatch_time_t v17;
  NSObject *v18;
  WFDispatchSourceTimer *v19;
  WFDispatchSourceTimer *v20;
  void *v22;
  _QWORD handler[4];
  WFDispatchSourceTimer *v24;
  id v25;
  objc_super v26;

  v11 = a5;
  v12 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDispatchSourceTimer.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v26.receiver = self;
  v26.super_class = (Class)WFDispatchSourceTimer;
  v13 = -[WFDispatchSourceTimer init](&v26, sel_init);
  if (v13)
  {
    v14 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v11);
    source = v13->_source;
    v13->_source = (OS_dispatch_source *)v14;

    v13->_hasFired = 0;
    v16 = v13->_source;
    v17 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v16, v17, a4, 0x2FAF080uLL);
    v18 = v13->_source;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __74__WFDispatchSourceTimer_initWithInterval_repeatIntervalInt_queue_handler___block_invoke;
    handler[3] = &unk_1E5FC72E0;
    v19 = v13;
    v24 = v19;
    v25 = v12;
    dispatch_source_set_event_handler(v18, handler);
    v20 = v19;

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[WFDispatchSourceTimer cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)WFDispatchSourceTimer;
  -[WFDispatchSourceTimer dealloc](&v3, sel_dealloc);
}

- (BOOL)isCancelled
{
  NSObject *v2;
  BOOL v3;

  -[WFDispatchSourceTimer source](self, "source");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_source_testcancel(v2) != 0;

  return v3;
}

- (void)start
{
  void *v3;
  NSObject *v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  RBSAssertion *v17;
  NSObject *assertion;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE buf[24];
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  dispatch_resume((dispatch_object_t)self->_source);
  if (-[WFDispatchSourceTimer preventSuspension](self, "preventSuspension"))
  {
    -[WFDispatchSourceTimer assertion](self, "assertion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      getWFVoiceShortcutClientLogObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[WFDispatchSourceTimer start]";
        _os_log_impl(&dword_1AF681000, v4, OS_LOG_TYPE_INFO, "%s Client wants to prevent suspension, so we're taking out a RunningBoard assertion...", buf, 0xCu);
      }

      v20 = 0;
      v21 = &v20;
      v22 = 0x2050000000;
      v5 = (void *)getRBSAssertionClass_softClass;
      v23 = getRBSAssertionClass_softClass;
      if (!getRBSAssertionClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getRBSAssertionClass_block_invoke;
        v26 = &unk_1E5FC8858;
        v27 = &v20;
        __getRBSAssertionClass_block_invoke((uint64_t)buf);
        v5 = (void *)v21[3];
      }
      v6 = objc_retainAutorelease(v5);
      _Block_object_dispose(&v20, 8);
      v7 = [v6 alloc];
      v20 = 0;
      v21 = &v20;
      v22 = 0x2050000000;
      v8 = (void *)getRBSTargetClass_softClass;
      v23 = getRBSTargetClass_softClass;
      if (!getRBSTargetClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getRBSTargetClass_block_invoke;
        v26 = &unk_1E5FC8858;
        v27 = &v20;
        __getRBSTargetClass_block_invoke((uint64_t)buf);
        v8 = (void *)v21[3];
      }
      v9 = objc_retainAutorelease(v8);
      _Block_object_dispose(&v20, 8);
      objc_msgSend(v9, "currentProcess");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v21 = &v20;
      v22 = 0x2050000000;
      v11 = (void *)getRBSDomainAttributeClass_softClass;
      v23 = getRBSDomainAttributeClass_softClass;
      if (!getRBSDomainAttributeClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getRBSDomainAttributeClass_block_invoke;
        v26 = &unk_1E5FC8858;
        v27 = &v20;
        __getRBSDomainAttributeClass_block_invoke((uint64_t)buf);
        v11 = (void *)v21[3];
      }
      v12 = objc_retainAutorelease(v11);
      _Block_object_dispose(&v20, 8);
      objc_msgSend(v12, "attributeWithDomain:name:", CFSTR("com.apple.shortcuts"), CFSTR("RunningBackground"));
      v13 = objc_claimAutoreleasedReturnValue();
      v24 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v7, "initWithExplanation:target:attributes:", CFSTR("An assertion-requiring timer is ticking"), v10, v14);

      v19 = 0;
      LOBYTE(v13) = objc_msgSend(v15, "acquireWithError:", &v19);
      v16 = v19;
      if ((v13 & 1) != 0)
      {
        v17 = v15;
        assertion = self->_assertion;
        self->_assertion = v17;
      }
      else
      {
        getWFVoiceShortcutClientLogObject();
        assertion = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(assertion, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[WFDispatchSourceTimer start]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v16;
          _os_log_impl(&dword_1AF681000, assertion, OS_LOG_TYPE_FAULT, "%s Unable to acquire assertion for timer: %{public}@", buf, 0x16u);
        }
      }

    }
  }
}

- (void)cancel
{
  void *v3;
  RBSAssertion *assertion;

  dispatch_source_cancel((dispatch_source_t)self->_source);
  -[WFDispatchSourceTimer assertion](self, "assertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  assertion = self->_assertion;
  self->_assertion = 0;

}

- (BOOL)preventSuspension
{
  return self->_preventSuspension;
}

- (void)setPreventSuspension:(BOOL)a3
{
  self->_preventSuspension = a3;
}

- (BOOL)hasFired
{
  return self->_hasFired;
}

- (void)setHasFired:(BOOL)a3
{
  self->_hasFired = a3;
}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (RBSAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

uint64_t __74__WFDispatchSourceTimer_initWithInterval_repeatIntervalInt_queue_handler___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  void *v5;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "assertion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;

    objc_msgSend(*(id *)(a1 + 32), "setHasFired:", 1);
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  return result;
}

@end

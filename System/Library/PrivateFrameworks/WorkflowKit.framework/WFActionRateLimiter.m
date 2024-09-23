@implementation WFActionRateLimiter

- (WFActionRateLimiter)init
{
  void *v3;
  WFActionRateLimiter *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFActionRateLimiter initWithUserDefaults:](self, "initWithUserDefaults:", v3);

  return v4;
}

- (WFActionRateLimiter)initWithUserDefaults:(id)a3
{
  id v6;
  WFActionRateLimiter *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  WFActionRateLimiter *v10;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionRateLimiter.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userDefaults"));

  }
  v13.receiver = self;
  v13.super_class = (Class)WFActionRateLimiter;
  v7 = -[WFActionRateLimiter init](&v13, sel_init);
  if (v7)
  {
    v8 = dispatch_queue_create("com.apple.shortcuts.WFActionRateLimiter", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v7->_userDefaults, a3);
    v10 = v7;
  }

  return v7;
}

- (NSDictionary)attempts
{
  void *v2;
  void *v3;
  void *v4;
  NSDictionary *v5;

  -[WFActionRateLimiter userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("WFActionRateLimiter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA70];
  v5 = v3;

  return v5;
}

- (void)setAttempts:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFActionRateLimiter userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("WFActionRateLimiter"));

}

- (void)modify:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[WFActionRateLimiter queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__WFActionRateLimiter_modify___block_invoke;
  block[3] = &unk_1E7AF76F0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __30__WFActionRateLimiter_modify___block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  void *v3;
  id DeepCopy;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  objc_msgSend(*(id *)(a1 + 32), "attempts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DeepCopy = (id)CFPropertyListCreateDeepCopy(v2, v3, 1uLL);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setAttempts:", DeepCopy);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8239 != -1)
    dispatch_once(&sharedInstance_onceToken_8239, &__block_literal_global_8240);
  return (id)sharedInstance_rateLimiter;
}

+ (void)performAction:(id)a3 onQueue:(id)a4 withBlock:(id)a5
{
  id v9;
  NSObject *v10;
  void (**v11)(_QWORD);
  void (**v12)(_QWORD);
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  dispatch_time_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD block[4];
  void (**v28)(_QWORD);
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFActionRateLimiter.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    if (v10)
      goto LABEL_4;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFActionRateLimiter.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  if (!v12)
    goto LABEL_14;
LABEL_3:
  if (v10)
    goto LABEL_4;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFActionRateLimiter.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

LABEL_4:
  v13 = objc_msgSend(v9, "rateLimitThreshold");
  if (v13)
  {
    v14 = v13;
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    objc_msgSend(v9, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __55__WFActionRateLimiter_performAction_onQueue_withBlock___block_invoke;
    v29[3] = &unk_1E7AECE88;
    v18 = v15;
    v30 = v18;
    v32 = &v33;
    v19 = v9;
    v31 = v19;
    objc_msgSend(v16, "modify:", v29);

    if (v34[3] <= v14)
    {
      v12[2](v12);
    }
    else
    {
      getWFWorkflowExecutionLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v19, "rateLimitDelay");
        *(_DWORD *)buf = 136315906;
        v38 = "+[WFActionRateLimiter performAction:onQueue:withBlock:]";
        v39 = 2112;
        v40 = v21;
        v41 = 2048;
        v42 = v14;
        v43 = 2048;
        v44 = v22;
        _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_DEFAULT, "%s Action \"%@\" is being rate limited because it passed the threshold of %li runs. Delaying execution for %li seconds.", buf, 0x2Au);

      }
      v23 = dispatch_time(0, 1000000000 * objc_msgSend(v19, "rateLimitDelay"));
      block[0] = v17;
      block[1] = 3221225472;
      block[2] = __55__WFActionRateLimiter_performAction_onQueue_withBlock___block_invoke_129;
      block[3] = &unk_1E7AF8F48;
      v28 = v12;
      dispatch_after(v23, v10, block);

    }
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    v12[2](v12);
  }

}

void __55__WFActionRateLimiter_performAction_onQueue_withBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 32));
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LastAttemptDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  WFEnforceClass(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NumberOfAttempts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  WFEnforceClass(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v11, "integerValue");

  objc_msgSend(v8, "timeIntervalSinceNow");
  v13 = v12;
  v14 = objc_msgSend(*(id *)(a1 + 40), "rateLimitTimeout");
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v13 <= (double)-v14)
    v16 = 1;
  else
    v16 = *(_QWORD *)(v15 + 24) + 1;
  *(_QWORD *)(v15 + 24) = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("NumberOfAttempts"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("LastAttemptDate"));

}

uint64_t __55__WFActionRateLimiter_performAction_onQueue_withBlock___block_invoke_129(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __37__WFActionRateLimiter_sharedInstance__block_invoke()
{
  WFActionRateLimiter *v0;
  void *v1;

  v0 = objc_alloc_init(WFActionRateLimiter);
  v1 = (void *)sharedInstance_rateLimiter;
  sharedInstance_rateLimiter = (uint64_t)v0;

}

@end

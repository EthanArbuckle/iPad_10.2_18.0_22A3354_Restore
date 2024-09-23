@implementation VCCompanionSyncSession

- (VCCompanionSyncSession)initWithSYSession:(id)a3 service:(id)a4 syncDataHandlers:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  VCCompanionSyncSession *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  const __CFString *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  uint64_t v22;
  OS_os_transaction *transaction;
  VCCompanionSyncSerializer *v24;
  uint64_t v25;
  NSSet *syncDataHandlers;
  NSObject *v27;
  const __CFString *v28;
  VCCompanionSyncSession *v29;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  VCCompanionSyncSession *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCCompanionSyncSession.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service"));

    if (v12)
      goto LABEL_4;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCCompanionSyncSession.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session"));

  if (!v11)
    goto LABEL_19;
LABEL_3:
  if (v12)
  {
LABEL_4:
    v13 = v12;
    goto LABEL_5;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCCompanionSyncSession.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncDataHandlers"));

  v13 = 0;
LABEL_5:
  VCAssertUniqueMessageTypes(v13);
  v34.receiver = self;
  v34.super_class = (Class)VCCompanionSyncSession;
  v14 = -[VCCompanionSyncSession init](&v34, sel_init);
  if (v14)
  {
    v15 = objc_msgSend((id)objc_opt_class(), "direction");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_USER_INITIATED, 0);
    v17 = objc_claimAutoreleasedReturnValue();

    if (v15 == 1)
      v18 = "com.apple.VCCompanionSyncSession.incoming";
    else
      v18 = "com.apple.VCCompanionSyncSession.outgoing";
    if (v15 == 1)
      v19 = CFSTR("VCCompanionSyncSession.incoming");
    else
      v19 = CFSTR("VCCompanionSyncSession.outgoing");
    v20 = dispatch_queue_create(v18, v17);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v20;

    VCOSTransactionWithName((uint64_t)v19);
    v22 = objc_claimAutoreleasedReturnValue();
    transaction = v14->_transaction;
    v14->_transaction = (OS_os_transaction *)v22;

    objc_storeStrong((id *)&v14->_session, a3);
    -[SYSession setDelegate:](v14->_session, "setDelegate:", v14);
    -[SYSession setTargetQueue:](v14->_session, "setTargetQueue:", v14->_queue);
    v24 = objc_alloc_init(VCCompanionSyncSerializer);
    -[SYSession setSerializer:](v14->_session, "setSerializer:", v24);

    -[SYSession setMaxConcurrentMessages:](v14->_session, "setMaxConcurrentMessages:", 15);
    objc_storeStrong((id *)&v14->_service, a4);
    v25 = objc_msgSend(v12, "copy");
    syncDataHandlers = v14->_syncDataHandlers;
    v14->_syncDataHandlers = (NSSet *)v25;

    getWFWatchSyncLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = CFSTR("outgoing");
      *(_DWORD *)buf = 136315906;
      v36 = "-[VCCompanionSyncSession initWithSYSession:service:syncDataHandlers:]";
      v37 = 2114;
      v38 = v14;
      if (v15 == 1)
        v28 = CFSTR("incoming");
      v39 = 2114;
      v40 = v28;
      v41 = 2114;
      v42 = v10;
      _os_log_impl(&dword_1C146A000, v27, OS_LOG_TYPE_DEFAULT, "%s %{public}@ %{public}@ session created with SYSession: %{public}@", buf, 0x2Au);
    }

    v29 = v14;
  }

  return v14;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCCompanionSyncSession session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCCompanionSyncSession session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p SYSession=%@ id=%@>"), v5, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unsigned int result;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend((id)objc_opt_class(), "direction");
  v9 = (void *)MEMORY[0x1E0C99DA0];
  v10 = *MEMORY[0x1E0C99768];
  if (v8)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v10, CFSTR("-[VCCompanionSyncSession syncSession:enqueueChanges:error:] must be overridden"));
    __break(1u);
  }
  result = objc_msgSend(v9, "raise:format:", v10, CFSTR("-[VCCompanionSyncSession syncSession:enqueueChanges:error:] should not be invoked on an incoming session"));
  __break(1u);
  return result;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  const __CFString *v5;

  if (objc_msgSend((id)objc_opt_class(), "direction"))
    v5 = CFSTR("-[VCCompanionSyncSession syncSession:applyChanges:completion:] must be overridden");
  else
    v5 = CFSTR("-[VCCompanionSyncSession syncSession:applyChanges:completion:] should not be invoked on an outgoing session");
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], v5);
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[VCCompanionSyncSession session](self, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCCompanionSyncSession.m"), 84, CFSTR("Unexpected session finishing: %@"), v7);

  }
  getWFWatchSyncLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v20 = "-[VCCompanionSyncSession syncSession:didEndWithError:]";
      v21 = 2114;
      v22 = v7;
      v23 = 2114;
      v24 = v8;
      v13 = "%s finished session %{public}@ with error %{public}@";
      v14 = v12;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
LABEL_8:
      _os_log_impl(&dword_1C146A000, v14, v15, v13, buf, v16);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[VCCompanionSyncSession syncSession:didEndWithError:]";
    v21 = 2114;
    v22 = v7;
    v13 = "%s finished session %{public}@";
    v14 = v12;
    v15 = OS_LOG_TYPE_DEFAULT;
    v16 = 22;
    goto LABEL_8;
  }

  -[VCCompanionSyncSession delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "companionSyncSession:didFinishWithError:", self, v8);

}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  id v4;
  BOOL result;

  v4 = a3;
  result = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[VCCompanionSyncSession resetDataStoreForSyncSession:completion:] should be called instead"));
  __break(1u);
  return result;
}

- (void)resetDataStoreForSyncSession:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend((id)objc_opt_class(), "direction");
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  if (v7)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v9, CFSTR("-[VCCompanionSyncSession resetDataStoreForSyncSession:completion:] must be overridden"));
    __break(1u);
  }
  objc_msgSend(v8, "raise:format:", v9, CFSTR("-[VCCompanionSyncSession resetDataStoreForSyncSession:completion:] should not be invoked on an outgoing session"));
  __break(1u);
}

- (VCCompanionSyncSessionDelegate)delegate
{
  return (VCCompanionSyncSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SYSession)session
{
  return self->_session;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (VCShortcutSyncService)service
{
  return self->_service;
}

- (NSSet)syncDataHandlers
{
  return self->_syncDataHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncDataHandlers, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (int64_t)direction
{
  int64_t result;

  result = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("+[VCCompanionSyncSession sessionType] must be overridden"));
  __break(1u);
  return result;
}

@end

@implementation WFRemoteExecutionSession

- (WFRemoteExecutionSession)initWithService:(id)a3
{
  id v6;
  WFRemoteExecutionSession *v7;
  WFRemoteExecutionSession *v8;
  WFRemoteExecutionSession *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionSession.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFRemoteExecutionSession;
  v7 = -[WFRemoteExecutionSession init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_state = 0;
    objc_storeStrong((id *)&v7->_service, a3);
    v9 = v8;
  }

  return v8;
}

- (void)sendToDestinations:(id)a3 options:(id)a4
{
  id v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 0, a4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionSession.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinations"));

  }
}

- (void)finish
{
  void *v3;
  char v4;
  id v5;

  -[WFRemoteExecutionSession cancelTimeout](self, "cancelTimeout");
  -[WFRemoteExecutionSession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFRemoteExecutionSession delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionDidFinish:", self);

  }
}

- (void)setState:(unint64_t)a3
{
  NSObject *v5;
  unint64_t state;
  int v7;
  const char *v8;
  __int16 v9;
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  getWFRemoteExecutionLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    state = self->_state;
    v7 = 136315650;
    v8 = "-[WFRemoteExecutionSession setState:]";
    v9 = 2048;
    v10 = state;
    v11 = 2048;
    v12 = a3;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_INFO, "%s Transitioning from state %lu to %lu", (uint8_t *)&v7, 0x20u);
  }

  self->_state = a3;
}

- (double)timeoutLimitInSeconds
{
  return 0.0;
}

- (void)restartTimeout
{
  NSObject *v3;
  uint64_t v4;
  dispatch_source_t v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  WFRemoteExecutionSession *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[WFRemoteExecutionSession cancelTimeout](self, "cancelTimeout");
  getWFRemoteExecutionLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[WFRemoteExecutionSession timeoutLimitInSeconds](self, "timeoutLimitInSeconds");
    *(_DWORD *)buf = 136315650;
    v14 = "-[WFRemoteExecutionSession restartTimeout]";
    v15 = 2048;
    v16 = v4;
    v17 = 2114;
    v18 = self;
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_INFO, "%s Starting %f second timer for session %{public}@", buf, 0x20u);
  }

  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, 0);
  -[WFRemoteExecutionSession setTimeoutTimer:](self, "setTimeoutTimer:", v5);

  -[WFRemoteExecutionSession timeoutLimitInSeconds](self, "timeoutLimitInSeconds");
  v7 = (uint64_t)(v6 * 1000000000.0);
  -[WFRemoteExecutionSession timeoutTimer](self, "timeoutTimer");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, v7);
  dispatch_source_set_timer(v8, v9, v7, 0x3B9ACA00uLL);

  -[WFRemoteExecutionSession timeoutTimer](self, "timeoutTimer");
  v10 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __42__WFRemoteExecutionSession_restartTimeout__block_invoke;
  handler[3] = &unk_1E7AF94B0;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);

  -[WFRemoteExecutionSession timeoutTimer](self, "timeoutTimer");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v11);

}

- (void)cancelTimeout
{
  void *v3;
  NSObject *v4;

  -[WFRemoteExecutionSession timeoutTimer](self, "timeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFRemoteExecutionSession timeoutTimer](self, "timeoutTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[WFRemoteExecutionSession setTimeoutTimer:](self, "setTimeoutTimer:", 0);
  }
}

- (id)sessionTimedOutError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2D50];
  WFLocalizedString(CFSTR("Remote execution timed out"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("WFRemoteExecutionCoordinatorErrorDomain"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)invalidAceCommandError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2D50];
  WFLocalizedString(CFSTR("Unable to run action"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("WFRemoteExecutionCoordinatorErrorDomain"), 2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)state
{
  return self->_state;
}

- (WFRemoteExecutionSessionDelegate)delegate
{
  return (WFRemoteExecutionSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFRemoteExecutionRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (IDSService)service
{
  return self->_service;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __42__WFRemoteExecutionSession_restartTimeout__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cancelTimeout");
  getWFRemoteExecutionLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "timeoutLimitInSeconds");
    v6 = 136315650;
    v7 = "-[WFRemoteExecutionSession restartTimeout]_block_invoke";
    v8 = 2114;
    v9 = v3;
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_INFO, "%s %{public}@ hit timeout (%f)", (uint8_t *)&v6, 0x20u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "handleTimeout");
}

@end

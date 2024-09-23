@implementation STKSIMToolkitAlertSession

- (STKSIMToolkitAlertSession)initWithLogger:(id)a3 responseProvider:(id)a4 event:(int64_t)a5 options:(id)a6 behavior:(id)a7 sound:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  STKSIMToolkitAlertSession *v20;
  STKSIMToolkitAlertSession *v21;
  void *v23;
  objc_super v24;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STKAlertSession.m"), 227, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("behavior"));

  }
  v24.receiver = self;
  v24.super_class = (Class)STKSIMToolkitAlertSession;
  v20 = -[STKAlertSession initWithLogger:responseProvider:options:sound:](&v24, sel_initWithLogger_responseProvider_options_sound_, v15, v16, v17, v19);
  v21 = v20;
  if (v20)
  {
    v20->_event = a5;
    objc_storeStrong((id *)&v20->_behavior, a7);
  }

  return v21;
}

- (void)sendResponse:(int64_t)a3 withBOOLResult:(BOOL)a4
{
  _QWORD v4[6];
  BOOL v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__STKSIMToolkitAlertSession_sendResponse_withBOOLResult___block_invoke;
  v4[3] = &unk_24D563598;
  v4[4] = self;
  v4[5] = a3;
  v5 = a4;
  _STKWithLock((os_unfair_lock_s *)self, v4);
}

uint64_t __57__STKSIMToolkitAlertSession_sendResponse_withBOOLResult___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  int v7;
  NSObject *v8;
  _BYTE v9[24];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 41))
  {
    v2 = result;
    v3 = *(NSObject **)(v1 + 48);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(v2 + 32);
      v5 = *(_QWORD *)(v2 + 40) - 1;
      if (v5 > 6)
        v6 = CFSTR("Success");
      else
        v6 = off_24D563690[v5];
      v7 = *(unsigned __int8 *)(v2 + 48);
      *(_DWORD *)v9 = 134218498;
      *(_QWORD *)&v9[4] = v4;
      *(_WORD *)&v9[12] = 2114;
      *(_QWORD *)&v9[14] = v6;
      *(_WORD *)&v9[22] = 1024;
      LODWORD(v10) = v7;
      v8 = v3;
      _os_log_impl(&dword_216439000, v8, OS_LOG_TYPE_DEFAULT, "Session <%p> - Sending response with type: %{public}@ - BOOL result: %d", v9, 0x1Cu);

    }
    return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 16), "sendResponse:withBOOLResult:", *(_QWORD *)(v2 + 40), *(unsigned __int8 *)(v2 + 48), *(_OWORD *)v9, *(_QWORD *)&v9[16], v10);
  }
  return result;
}

- (void)sendSuccessWithSelectedIndex:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__STKSIMToolkitAlertSession_sendSuccessWithSelectedIndex___block_invoke;
  v3[3] = &unk_24D562FC8;
  v3[4] = self;
  v3[5] = a3;
  _STKWithLock((os_unfair_lock_s *)self, v3);
}

uint64_t __58__STKSIMToolkitAlertSession_sendSuccessWithSelectedIndex___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 41))
  {
    v2 = result;
    v3 = *(NSObject **)(v1 + 48);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(v2 + 32);
      v5 = *(_QWORD *)(v2 + 40);
      v6 = 134218498;
      v7 = v4;
      v8 = 2114;
      v9 = CFSTR("Success");
      v10 = 2048;
      v11 = v5;
      _os_log_impl(&dword_216439000, v3, OS_LOG_TYPE_DEFAULT, "Session <%p> - Sending response with type: %{public}@ - index result: %lu", (uint8_t *)&v6, 0x20u);
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 16), "sendSuccessWithSelectedIndex:", *(_QWORD *)(v2 + 40));
  }
  return result;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  NSObject *logger;
  void *v5;
  int v6;
  objc_super v7;
  uint8_t buf[4];
  STKSIMToolkitAlertSession *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)STKSIMToolkitAlertSession;
  -[STKAlertSession remoteAlertHandleDidActivate:](&v7, sel_remoteAlertHandleDidActivate_, a3);
  logger = self->super._logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = self;
    _os_log_impl(&dword_216439000, logger, OS_LOG_TYPE_DEFAULT, "Session <%p> - UI was presented.", buf, 0xCu);
  }
  -[STKSIMToolkitAlertSession behavior](self, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldSendResponseUponDisplay");

  if (v6)
    -[STKAlertSession sendResponse:](self, "sendResponse:", 0);
}

- (int64_t)event
{
  return self->_event;
}

- (STKSessionBehavior)behavior
{
  return self->_behavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behavior, 0);
}

@end

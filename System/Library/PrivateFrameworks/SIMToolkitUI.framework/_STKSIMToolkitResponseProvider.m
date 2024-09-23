@implementation _STKSIMToolkitResponseProvider

- (_STKSIMToolkitResponseProvider)initWithQueue:(id)a3 telephonyClient:(id)a4 context:(id)a5 options:(id)a6 logger:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _STKSIMToolkitResponseProvider *v18;
  _STKSIMToolkitResponseProvider *v19;
  uint64_t v20;
  NSDictionary *options;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_STKSIMToolkitResponseProvider.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v14)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_STKSIMToolkitResponseProvider.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

      if (v16)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_STKSIMToolkitResponseProvider.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("telephonyClient"));

  if (!v15)
    goto LABEL_10;
LABEL_4:
  if (v16)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_STKSIMToolkitResponseProvider.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

LABEL_5:
  v28.receiver = self;
  v28.super_class = (Class)_STKSIMToolkitResponseProvider;
  v18 = -[_STKSIMToolkitResponseProvider init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_telephonyClient, a4);
    objc_storeStrong((id *)&v19->_context, a5);
    v20 = objc_msgSend(v16, "copy");
    options = v19->_options;
    v19->_options = (NSDictionary *)v20;

    objc_storeStrong((id *)&v19->_queue, a3);
    objc_storeStrong((id *)&v19->_logger, a7);
  }

  return v19;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (BOOL)hasSentResponse
{
  return self->_hasSentResponse;
}

- (void)sendResponse:(int64_t)a3
{
  NSObject *logger;
  _BOOL4 v6;
  NSObject *queue;
  _QWORD *v8;
  _QWORD block[6];
  _QWORD v10[5];

  if (!self->_hasSentResponse)
  {
    self->_hasSentResponse = 1;
    logger = self->_logger;
    v6 = os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG);
    if (a3 == 7)
    {
      if (v6)
        -[_STKSIMToolkitResponseProvider sendResponse:].cold.1((uint64_t)self, logger);
      queue = self->_queue;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __47___STKSIMToolkitResponseProvider_sendResponse___block_invoke;
      v10[3] = &unk_24D563080;
      v10[4] = self;
      v8 = v10;
    }
    else
    {
      if (v6)
        -[_STKSIMToolkitResponseProvider sendResponse:].cold.2(self, logger, a3);
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __47___STKSIMToolkitResponseProvider_sendResponse___block_invoke_16;
      block[3] = &unk_24D562FC8;
      block[4] = self;
      block[5] = a3;
      v8 = block;
    }
    dispatch_async(queue, v8);
  }
}

- (void)sendResponse:(int64_t)a3 withBOOLResult:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *logger;
  NSObject *queue;
  const __CFString *v9;
  NSObject *v10;
  __CFString *v11;
  const __CFString *v12;
  _QWORD block[6];
  BOOL v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!self->_hasSentResponse)
  {
    v4 = a4;
    self->_hasSentResponse = 1;
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
    {
      if (self->_telephonyClient)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v10 = logger;
      v11 = -[_STKSIMToolkitResponseProvider _responseFromResponseType:](self, "_responseFromResponseType:", a3);
      *(_DWORD *)buf = 138412802;
      if (v4)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      v16 = v9;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_debug_impl(&dword_216439000, v10, OS_LOG_TYPE_DEBUG, "Really sending response to CT: sendSIMToolkitBooleanResponse - hasClient: %@, response: %@, result: %@", buf, 0x20u);

    }
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62___STKSIMToolkitResponseProvider_sendResponse_withBOOLResult___block_invoke;
    block[3] = &unk_24D563598;
    block[4] = self;
    block[5] = a3;
    v14 = v4;
    dispatch_async(queue, block);
  }
}

- (void)sendResponse:(int64_t)a3 withStringResult:(id)a4
{
  id v6;
  NSObject *logger;
  NSObject *queue;
  const __CFString *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  int64_t v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (!self->_hasSentResponse)
  {
    self->_hasSentResponse = 1;
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
    {
      if (self->_telephonyClient)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v10 = logger;
      *(_DWORD *)buf = 138412802;
      v15 = v9;
      v16 = 2112;
      v17 = -[_STKSIMToolkitResponseProvider _responseFromResponseType:](self, "_responseFromResponseType:", a3);
      v18 = 2112;
      v19 = v6;
      _os_log_debug_impl(&dword_216439000, v10, OS_LOG_TYPE_DEBUG, "Really sending response to CT: sendSIMToolkitStringResponse - hasClient: %@, response: %@, result: %@", buf, 0x20u);

    }
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64___STKSIMToolkitResponseProvider_sendResponse_withStringResult___block_invoke;
    block[3] = &unk_24D562FF0;
    block[4] = self;
    v13 = a3;
    v12 = v6;
    dispatch_async(queue, block);

  }
}

- (void)sendSuccessWithSelectedIndex:(unint64_t)a3
{
  NSObject *logger;
  NSObject *queue;
  _QWORD v7[6];

  if (!self->_hasSentResponse)
  {
    self->_hasSentResponse = 1;
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
      -[_STKSIMToolkitResponseProvider sendSuccessWithSelectedIndex:].cold.1(self, logger, a3);
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __63___STKSIMToolkitResponseProvider_sendSuccessWithSelectedIndex___block_invoke;
    v7[3] = &unk_24D562FC8;
    v7[4] = self;
    v7[5] = a3;
    dispatch_async(queue, v7);
  }
}

- (__CFString)_responseFromResponseType:(int64_t)a3
{
  __CFString **v3;

  switch(a3)
  {
    case 0:
      v3 = (__CFString **)MEMORY[0x24BDC2E38];
      goto LABEL_9;
    case 1:
      v3 = (__CFString **)MEMORY[0x24BDC2E20];
      goto LABEL_9;
    case 2:
      v3 = (__CFString **)MEMORY[0x24BDC2E40];
      goto LABEL_9;
    case 3:
      v3 = (__CFString **)MEMORY[0x24BDC2E30];
      goto LABEL_9;
    case 4:
      v3 = (__CFString **)MEMORY[0x24BDC2E10];
      goto LABEL_9;
    case 5:
      v3 = (__CFString **)MEMORY[0x24BDC2E18];
      goto LABEL_9;
    case 6:
    case 7:
      v3 = (__CFString **)MEMORY[0x24BDC2E28];
LABEL_9:
      self = *v3;
      break;
    default:
      return self;
  }
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)sendResponse:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 16))
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_216439000, a2, OS_LOG_TYPE_DEBUG, "Really sending response to CT: sendSIMToolkitUserActivity - hasClient: %@", (uint8_t *)&v3, 0xCu);
}

- (void)sendResponse:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = OUTLINED_FUNCTION_1_2((uint64_t)a1, a2);
  objc_msgSend(a1, "_responseFromResponseType:", a3);
  OUTLINED_FUNCTION_0_2();
  v8 = v6;
  _os_log_debug_impl(&dword_216439000, v5, OS_LOG_TYPE_DEBUG, "Really sending response to CT: sendSIMToolkitResponse - hasClient: %@, response: %@", v7, 0x16u);

}

- (void)sendSuccessWithSelectedIndex:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint8_t v10[14];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = OUTLINED_FUNCTION_1_2((uint64_t)a1, a2);
  v6 = objc_msgSend(a1, "_responseFromResponseType:", 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  v11 = v6;
  v12 = v8;
  v13 = v9;
  _os_log_debug_impl(&dword_216439000, v5, OS_LOG_TYPE_DEBUG, "Really sending response to CT: selectSIMToolkitListItem - hasClient: %@, response: %@, result: %@", v10, 0x20u);

}

@end

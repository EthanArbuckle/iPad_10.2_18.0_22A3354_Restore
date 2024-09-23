@implementation SAAppSizer

- (SAAppSizer)init
{
  SAAppSizer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SAAppSizer;
  result = -[SAAppSizer init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_handlerAlreadyRegistered = 0;
  return result;
}

- (void)invalidateConnection
{
  SADaemonXPC *xpcOut;

  -[SADaemonXPC invalidate](self->_xpcOut, "invalidate");
  xpcOut = self->_xpcOut;
  self->_xpcOut = 0;

}

- (void)callHandlerWithError:(id)a3
{
  id v4;
  SAReplyController *sarc;
  SAReplyController *v6;
  id v7;

  v4 = a3;
  sarc = self->_sarc;
  if (sarc && !self->_alreadyReportedXPCError)
  {
    self->_alreadyReportedXPCError = 1;
    v7 = v4;
    -[SAReplyController callAppSizerHandlerWithError:](sarc, "callAppSizerHandlerWithError:", v4);
    v6 = self->_sarc;
    self->_sarc = 0;

    -[SAAppSizer invalidateConnection](self, "invalidateConnection");
    v4 = v7;
  }

}

- (void)startObservingWithUpdateHandler:(id)a3
{
  -[SAAppSizer startObservingWithScanOptions:updateHandler:](self, "startObservingWithScanOptions:updateHandler:", 20995, a3);
}

- (void)startObservingWithScanOptions:(unint64_t)a3 updateHandler:(id)a4
{
  void (**v6)(id, _QWORD, NSObject *);
  SAAppSizer *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  SAReplyController *sarc;
  uint64_t v22;
  SADaemonXPC *v23;
  SADaemonXPC *xpcOut;
  SADaemonXPC *v25;
  void *v26;
  SAReplyController *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  uint64_t v33;
  void *v34;
  uint8_t buf[24];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD, NSObject *))a4;
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    if (v7->_handlerAlreadyRegistered)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s can't be called more than once per AppSizer instance"), "-[SAAppSizer startObservingWithScanOptions:updateHandler:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SALog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SAURLSizer startObservingURLs:updateHandler:].cold.2(objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), buf, v9);

      v10 = (void *)MEMORY[0x24BDD1540];
      v33 = *MEMORY[0x24BDD0FD8];
      v34 = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 17, v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v6[2](v6, 0, v12);
    }
    else
    {
      v7->_alreadyReportedXPCError = 0;
      v20 = objc_opt_new();
      sarc = v7->_sarc;
      v7->_sarc = (SAReplyController *)v20;

      -[SAReplyController setAppSizerUpdateHandler:](v7->_sarc, "setAppSizerUpdateHandler:", v6);
      v22 = MEMORY[0x24BDAC760];
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __58__SAAppSizer_startObservingWithScanOptions_updateHandler___block_invoke;
      v32[3] = &unk_2518F3690;
      v32[4] = v7;
      v23 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v32);
      xpcOut = v7->_xpcOut;
      v7->_xpcOut = v23;

      v25 = v7->_xpcOut;
      v30[0] = v22;
      v30[1] = 3221225472;
      v30[2] = __58__SAAppSizer_startObservingWithScanOptions_updateHandler___block_invoke_2;
      v30[3] = &unk_2518F36B8;
      v30[4] = v7;
      v31 = 0;
      -[SADaemonXPC remoteObjectProxyWithErrorHandler:](v25, "remoteObjectProxyWithErrorHandler:", v30);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v7->_sarc;
      v29[0] = v22;
      v29[1] = 3221225472;
      v29[2] = __58__SAAppSizer_startObservingWithScanOptions_updateHandler___block_invoke_3;
      v29[3] = &unk_2518F36E0;
      v29[4] = v7;
      objc_msgSend(v26, "addAppSizerHandler:reply:", v27, v29);
      v7->_handlerAlreadyRegistered = 1;
      v28[0] = v22;
      v28[1] = 3221225472;
      v28[2] = __58__SAAppSizer_startObservingWithScanOptions_updateHandler___block_invoke_4;
      v28[3] = &unk_2518F3690;
      v28[4] = v7;
      objc_msgSend(v26, "runAppSizerWithScanOptions:reply:", a3, v28);

      v8 = 0;
      v12 = 0;
    }
    objc_sync_exit(v7);

  }
  else
  {
    SALog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SAAppSizer startObservingWithScanOptions:updateHandler:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  }

}

uint64_t __58__SAAppSizer_startObservingWithScanOptions_updateHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callHandlerWithError:", a2);
}

uint64_t __58__SAAppSizer_startObservingWithScanOptions_updateHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callHandlerWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__SAAppSizer_startObservingWithScanOptions_updateHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setControllerID:", a2);
}

void __58__SAAppSizer_startObservingWithScanOptions_updateHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    SALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_2478E3000, v4, OS_LOG_TYPE_DEFAULT, "remoteObjectProxyWithErrorHandler repliedkey: bundleID, value: AppPath with err %@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "callAppSizerHandlerWithError:", v3);
  }

}

- (void)stopObserving
{
  OUTLINED_FUNCTION_0_1(&dword_2478E3000, a1, a3, "%s handler is not registered", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __27__SAAppSizer_stopObserving__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callHandlerWithError:", v3);
  SALog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __27__SAAppSizer_stopObserving__block_invoke_cold_1();

}

- (SAReplyController)sarc
{
  return (SAReplyController *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSarc:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (SADaemonXPC)xpcOut
{
  return (SADaemonXPC *)objc_getProperty(self, a2, 24, 1);
}

- (void)setXpcOut:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)handlerAlreadyRegistered
{
  return self->_handlerAlreadyRegistered;
}

- (void)setHandlerAlreadyRegistered:(BOOL)a3
{
  self->_handlerAlreadyRegistered = a3;
}

- (BOOL)alreadyReportedXPCError
{
  return self->_alreadyReportedXPCError;
}

- (void)setAlreadyReportedXPCError:(BOOL)a3
{
  self->_alreadyReportedXPCError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcOut, 0);
  objc_storeStrong((id *)&self->_sarc, 0);
}

- (void)startObservingWithScanOptions:(uint64_t)a3 updateHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2478E3000, a1, a3, "%s: updateHandler is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __27__SAAppSizer_stopObserving__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1(&dword_2478E3000, v0, v1, "%s: remoteObjectProxyWithErrorHandler called with %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

@end

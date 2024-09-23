@implementation SAURLSizer

- (SAURLSizer)init
{
  SAURLSizer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SAURLSizer;
  result = -[SAURLSizer init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_alreadyObservingURLs = 0;
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
    -[SAReplyController callURLSizerHandlerWithError:](sarc, "callURLSizerHandlerWithError:", v4);
    v6 = self->_sarc;
    self->_sarc = 0;

    -[SAURLSizer invalidateConnection](self, "invalidateConnection");
    v4 = v7;
  }

}

- (void)startObservingURLs:(id)a3 updateHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, NSObject *);
  SAURLSizer *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  SADaemonXPC *v22;
  SADaemonXPC *xpcOut;
  uint64_t v24;
  SAReplyController *sarc;
  SADaemonXPC *v26;
  void *v27;
  SAReplyController *v28;
  SADaemonXPC *v29;
  void *v30;
  NSUUID *sizerID;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  uint64_t v38;
  void *v39;
  uint8_t buf[24];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, NSObject *))a4;
  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    if (v8->_alreadyObservingURLs)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s can't be called more than once per URLSizer instance"), "-[SAURLSizer startObservingURLs:updateHandler:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SALog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SAURLSizer startObservingURLs:updateHandler:].cold.2(objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), buf, v10);

      v11 = (void *)MEMORY[0x24BDD1540];
      v38 = *MEMORY[0x24BDD0FD8];
      v39 = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 17, v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v7[2](v7, 0, v13);
    }
    else
    {
      v21 = MEMORY[0x24BDAC760];
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke;
      v37[3] = &unk_2518F3690;
      v37[4] = v8;
      v22 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v37);
      xpcOut = v8->_xpcOut;
      v8->_xpcOut = v22;

      v24 = objc_opt_new();
      sarc = v8->_sarc;
      v8->_sarc = (SAReplyController *)v24;

      -[SAReplyController setUrlSizerUpdateHandler:](v8->_sarc, "setUrlSizerUpdateHandler:", v7);
      v8->_alreadyReportedXPCError = 0;
      v26 = v8->_xpcOut;
      v35[0] = v21;
      v35[1] = 3221225472;
      v35[2] = __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_2;
      v35[3] = &unk_2518F36B8;
      v35[4] = v8;
      v36 = 0;
      -[SADaemonXPC synchronousRemoteObjectProxyWithErrorHandler:](v26, "synchronousRemoteObjectProxyWithErrorHandler:", v35);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v8->_sarc;
      v34[0] = v21;
      v34[1] = 3221225472;
      v34[2] = __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_3;
      v34[3] = &unk_2518F36E0;
      v34[4] = v8;
      objc_msgSend(v27, "addURLSizerHandler:withURLs:reply:", v28, v6, v34);

      v8->_alreadyObservingURLs = 1;
      v29 = v8->_xpcOut;
      v33[0] = v21;
      v33[1] = 3221225472;
      v33[2] = __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_4;
      v33[3] = &unk_2518F3690;
      v33[4] = v8;
      -[SADaemonXPC remoteObjectProxyWithErrorHandler:](v29, "remoteObjectProxyWithErrorHandler:", v33);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      sizerID = v8->_sizerID;
      v32[0] = v21;
      v32[1] = 3221225472;
      v32[2] = __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_5;
      v32[3] = &unk_2518F3690;
      v32[4] = v8;
      objc_msgSend(v30, "runURLSizerWithID:reply:", sizerID, v32);

      v9 = 0;
      v13 = 0;
    }
    objc_sync_exit(v8);

  }
  else
  {
    SALog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SAURLSizer startObservingURLs:updateHandler:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callHandlerWithError:", a2);
}

uint64_t __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callHandlerWithError:", *(_QWORD *)(a1 + 40));
}

void __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setControllerID:", v3);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v3;

}

uint64_t __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callHandlerWithError:", a2);
}

void __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    SALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_5_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "callURLSizerHandlerWithError:", v3);
  }

}

- (void)stopObserving
{
  OUTLINED_FUNCTION_0_1(&dword_2478E3000, a1, a3, "%s handler is not registered", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __27__SAURLSizer_stopObserving__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    SALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __27__SAURLSizer_stopObserving__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    objc_msgSend(*(id *)(a1 + 32), "callHandlerWithError:", v3);
  }

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

- (NSUUID)sizerID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSizerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)alreadyObservingURLs
{
  return self->_alreadyObservingURLs;
}

- (void)setAlreadyObservingURLs:(BOOL)a3
{
  self->_alreadyObservingURLs = a3;
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
  objc_storeStrong((id *)&self->_sizerID, 0);
  objc_storeStrong((id *)&self->_xpcOut, 0);
  objc_storeStrong((id *)&self->_sarc, 0);
}

- (void)startObservingURLs:(uint64_t)a3 updateHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2478E3000, a1, a3, "%s: updateHandler is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)startObservingURLs:(os_log_t)log updateHandler:.cold.2(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2478E3000, log, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
}

void __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2478E3000, a2, a3, "runURLSizerWithID failed with error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __27__SAURLSizer_stopObserving__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2478E3000, a2, a3, "stopObserving error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end

@implementation BRCloudTelemetryTTRDecisionRequest

+ (id)requestWithSenderID:(id)a3 ruleID:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[BRCloudTelemetryTTRDecisionRequest _initWithSenderID:ruleID:completionHandler:]([BRCloudTelemetryTTRDecisionRequest alloc], "_initWithSenderID:ruleID:completionHandler:", v9, v8, v7);

  return v10;
}

- (id)_initWithSenderID:(id)a3 ruleID:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  BRCloudTelemetryTTRDecisionRequest *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *apsQueue;
  id v16;
  uint64_t v17;
  APSConnection *apsConnection;
  uint64_t v19;
  NSData *publicToken;
  void *v21;
  void *v22;
  uint64_t v23;
  NSURL *decisonServerURL;
  NSMutableData *v25;
  NSMutableData *responseBody;
  uint64_t v27;
  id completionHandler;
  _QWORD v30[4];
  id v31;
  objc_super v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)BRCloudTelemetryTTRDecisionRequest;
  v12 = -[BRCloudTelemetryTTRDecisionRequest init](&v32, sel_init);
  if (v12)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.rtctaptoradar.pushtokenprovider", v13);

    apsQueue = v12->_apsQueue;
    v12->_apsQueue = (OS_dispatch_queue *)v14;

    v16 = objc_alloc(MEMORY[0x24BE08738]);
    v17 = objc_msgSend(v16, "initWithEnvironmentName:namedDelegatePort:queue:", *MEMORY[0x24BE08720], *MEMORY[0x24BE08708], v12->_apsQueue);
    apsConnection = v12->_apsConnection;
    v12->_apsConnection = (APSConnection *)v17;

    -[APSConnection publicToken](v12->_apsConnection, "publicToken");
    v19 = objc_claimAutoreleasedReturnValue();
    publicToken = v12->_publicToken;
    v12->_publicToken = (NSData *)v19;

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_useDecisionServer = objc_msgSend(v21, "useIDSDecisionService");

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "idsDecisionServiceURL");
    v23 = objc_claimAutoreleasedReturnValue();
    decisonServerURL = v12->_decisonServerURL;
    v12->_decisonServerURL = (NSURL *)v23;

    objc_storeStrong((id *)&v12->_senderID, a3);
    objc_storeStrong((id *)&v12->_ruleID, a4);
    v25 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    responseBody = v12->_responseBody;
    v12->_responseBody = v25;

    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __81__BRCloudTelemetryTTRDecisionRequest__initWithSenderID_ruleID_completionHandler___block_invoke;
    v30[3] = &unk_24FE416B0;
    v31 = v11;
    v27 = MEMORY[0x2348BA0DC](v30);
    completionHandler = v12->_completionHandler;
    v12->_completionHandler = (id)v27;

  }
  return v12;
}

void __81__BRCloudTelemetryTTRDecisionRequest__initWithSenderID_ruleID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a3;
  if (v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      __81__BRCloudTelemetryTTRDecisionRequest__initWithSenderID_ruleID_completionHandler___block_invoke_cold_1();

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)resume
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] Assertion failed: !_dataTask dataTask must be nil.%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  if (a7)
    (*((void (**)(id, id))a7 + 2))(a7, a6);
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    -[BRCloudTelemetryTTRDecisionRequest URLSession:task:needNewBodyStream:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSMutableData *responseBody;
  id v17;
  id v18;
  void *v19;
  void (**completionHandler)(id, _QWORD, void *);
  void *v21;
  const __CFString *v22;
  void *v23;
  void (**v24)(id, _QWORD, void *);
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(id, _QWORD, void *);
  void *v29;
  void (**v30)(id, _QWORD, id);
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  id v34;
  int v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void (**v39)(id, _QWORD, void *);
  void *v40;
  void (**v41)(id, _QWORD, id);
  void (**v42)(id, _QWORD, void *);
  void *v43;
  void (**v44)(id, _QWORD, void *);
  void *v45;
  const __CFString *v46;
  int v47;
  id v48;
  id v49;
  uint8_t buf[4];
  const __CFString *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  objc_msgSend(a4, "response");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
  {
    (*((void (**)(void))self->_completionHandler + 2))();
    goto LABEL_31;
  }
  if (!v8)
  {
    completionHandler = (void (**)(id, _QWORD, void *))self->_completionHandler;
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = CFSTR("Unexpected empty response from service");
LABEL_15:
    objc_msgSend(v21, "brc_unkownErrorWithDescription:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    completionHandler[2](completionHandler, 0, v23);

    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    completionHandler = (void (**)(id, _QWORD, void *))self->_completionHandler;
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = CFSTR("Invalid response type");
    goto LABEL_15;
  }
  v10 = v9;
  objc_msgSend(v10, "valueForHTTPHeaderField:", CFSTR("X-Apple-Splunk-Hint"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[BRCloudTelemetryTTRDecisionRequest URLSession:task:didCompleteWithError:].cold.1();

  if (objc_msgSend(v10, "statusCode") != 200)
  {
    v24 = (void (**)(id, _QWORD, void *))self->_completionHandler;
    v25 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HTTP request failed: %ld"), objc_msgSend(v10, "statusCode"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "brc_unkownErrorWithDescription:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2](v24, 0, v27);

LABEL_30:
    goto LABEL_31;
  }
  objc_msgSend(v10, "valueForHTTPHeaderField:", CFSTR("Content-Type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v28 = (void (**)(id, _QWORD, void *))self->_completionHandler;
    objc_msgSend(MEMORY[0x24BDD1540], "brc_unkownErrorWithDescription:", CFSTR("Missing response Content-Type"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2](v28, 0, v29);

    goto LABEL_30;
  }
  v15 = v14;
  if ((objc_msgSend(v14, "containsString:", CFSTR("application/json")) & 1) == 0)
  {
    v30 = (void (**)(id, _QWORD, id))self->_completionHandler;
    v31 = (void *)MEMORY[0x24BDD1540];
    v32 = CFSTR("Invalid response Content-Type");
LABEL_28:
    objc_msgSend(v31, "brc_unkownErrorWithDescription:", v32);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v30[2](v30, 0, v17);
LABEL_29:

    goto LABEL_30;
  }
  if (!-[NSMutableData length](self->_responseBody, "length"))
    goto LABEL_27;
  responseBody = self->_responseBody;
  v49 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", responseBody, 0, &v49);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v49;
  if (v18)
  {
    v19 = v18;
    (*((void (**)(void))self->_completionHandler + 2))();

    goto LABEL_31;
  }
  if (!v17)
  {
LABEL_27:
    v30 = (void (**)(id, _QWORD, id))self->_completionHandler;
    v31 = (void *)MEMORY[0x24BDD1540];
    v32 = CFSTR("Empty response body");
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v39 = (void (**)(id, _QWORD, void *))self->_completionHandler;
    objc_msgSend(MEMORY[0x24BDD1540], "brc_unkownErrorWithDescription:", CFSTR("Invalid response body"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2](v39, 0, v40);

    goto LABEL_29;
  }
  v17 = v17;
  objc_msgSend(v17, "objectForKey:", CFSTR("showTTR"));
  v33 = objc_claimAutoreleasedReturnValue();
  if (!v33)
  {
    v41 = (void (**)(id, _QWORD, id))self->_completionHandler;
    objc_msgSend(MEMORY[0x24BDD1540], "brc_unkownErrorWithDescription:", CFSTR("Missing show TTR info"));
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v41[2](v41, 0, v34);
LABEL_36:

    goto LABEL_29;
  }
  v34 = (id)v33;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v42 = (void (**)(id, _QWORD, void *))self->_completionHandler;
    objc_msgSend(MEMORY[0x24BDD1540], "brc_unkownErrorWithDescription:", CFSTR("Unexpected show TTR info type"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2](v42, 0, v43);

    goto LABEL_36;
  }
  v34 = v34;
  v35 = objc_msgSend(v34, "BOOLValue");
  objc_msgSend(v17, "objectForKey:", CFSTR("reason"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v44 = (void (**)(id, _QWORD, void *))self->_completionHandler;
      objc_msgSend(MEMORY[0x24BDD1540], "brc_unkownErrorWithDescription:", CFSTR("Unexpected show TTR reason"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v44[2](v44, 0, v45);

      goto LABEL_36;
    }
  }
  v47 = v35;
  v48 = v36;
  brc_bread_crumbs();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    v46 = CFSTR("N");
    *(_DWORD *)buf = 138412802;
    if (v47)
      v46 = CFSTR("Y");
    v51 = v46;
    v52 = 2112;
    v53 = v48;
    v54 = 2112;
    v55 = v37;
    _os_log_debug_impl(&dword_230455000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] Decision Server Response showTTR=%@, reason=%@%@", buf, 0x20u);
  }

  (*((void (**)(void))self->_completionHandler + 2))();
LABEL_31:

}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  if (a6)
    (*((void (**)(id, id))a6 + 2))(a6, a5);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  if (a6)
    (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  -[NSMutableData appendData:](self->_responseBody, "appendData:", a5, a4);
}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  NSMutableData *v6;
  NSMutableData *responseBody;

  v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
  responseBody = self->_responseBody;
  self->_responseBody = v6;

}

- (NSObject)networkingDelegate
{
  return objc_loadWeakRetained((id *)&self->_networkingDelegate);
}

- (void)setNetworkingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_networkingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_networkingDelegate);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_responseBody, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_publicToken, 0);
  objc_storeStrong((id *)&self->_ruleID, 0);
  objc_storeStrong((id *)&self->_senderID, 0);
  objc_storeStrong((id *)&self->_decisonServerURL, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_apsQueue, 0);
}

void __81__BRCloudTelemetryTTRDecisionRequest__initWithSenderID_ruleID_completionHandler___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_230455000, v0, (os_log_type_t)0x90u, "[ERROR] Failed calling the IDS TTR Decision Service: %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)URLSession:(uint64_t)a3 task:(uint64_t)a4 needNewBodyStream:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] Assertion failed: NO Unexpected callback.%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_230455000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Decision splunkHint=%@%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

@end

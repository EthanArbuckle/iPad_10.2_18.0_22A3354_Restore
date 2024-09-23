@implementation OspreyGRPCChannel

- (OspreyGRPCChannel)initWithURL:(id)a3 configuration:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  OspreyGRPCChannel *v11;
  uint64_t v12;
  NSURL *baseURL;
  id v14;
  void *v15;
  uint64_t v16;
  NSURLSession *session;
  uint64_t v18;
  NSMapTable *taskToContext;
  OspreyMessageWriter *v20;
  OspreyMessageWriter *messageWriter;
  AbsintheAuthenticationDurations *v22;
  AbsintheAuthenticationDurations *absintheDurations;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)OspreyGRPCChannel;
  v11 = -[OspreyGRPCChannel init](&v25, sel_init);
  if (v11)
  {
    OspreyLoggingInit();
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
      -[OspreyGRPCChannel initWithURL:configuration:queue:].cold.2();
    v12 = objc_msgSend(v8, "copy");
    baseURL = v11->_baseURL;
    v11->_baseURL = (NSURL *)v12;

    objc_storeStrong((id *)&v11->_queue, a5);
    v14 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(v14, "setUnderlyingQueue:", v11->_queue);
    if (OspreyIsEntitledForMPTCP())
    {
      objc_msgSend(v9, "set_allowsMultipathTCP:", 1);
      objc_msgSend(v9, "set_multipathAlternatePort:", 5228);
      OspreyLoggingInit();
      v15 = (void *)OspreyLogContextGRPC;
      if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
        -[OspreyGRPCChannel initWithURL:configuration:queue:].cold.1(v9, v15);
    }
    objc_msgSend(v9, "set_allowsTLSFalseStart:", 1);
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v9, v11, v14);
    v16 = objc_claimAutoreleasedReturnValue();
    session = v11->_session;
    v11->_session = (NSURLSession *)v16;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v18 = objc_claimAutoreleasedReturnValue();
    taskToContext = v11->_taskToContext;
    v11->_taskToContext = (NSMapTable *)v18;

    v20 = objc_alloc_init(OspreyMessageWriter);
    messageWriter = v11->_messageWriter;
    v11->_messageWriter = v20;

    v22 = objc_alloc_init(AbsintheAuthenticationDurations);
    absintheDurations = v11->_absintheDurations;
    v11->_absintheDurations = v22;

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[OspreyGRPCChannel close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)OspreyGRPCChannel;
  -[OspreyGRPCChannel dealloc](&v3, sel_dealloc);
}

- (void)close
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B97C2000, v0, v1, "%s session: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cancel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B97C2000, v0, v1, "%s session: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setAbsintheTimestampForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[OspreyGRPCChannel absintheDurations](self, "absintheDurations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAbsintheAuthenticationTimestampForKey:", v4);

}

- (void)_startTask:(id)a3
{
  objc_msgSend(a3, "resume");
}

- (id)clientStreamingContextForRequest:(id)a3 streamingResponseHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  OspreyGRPCStreamingContext *v11;
  uint64_t v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[OspreyGRPCStreamingContext initWithQueue:responseHandler:completion:]([OspreyGRPCStreamingContext alloc], "initWithQueue:responseHandler:completion:", self->_queue, v9, v8);

  v12 = objc_msgSend(v10, "useCompression");
  -[OspreyGRPCStreamingContext setCompressionEnabled:](v11, "setCompressionEnabled:", v12);
  return v11;
}

- (void)unaryRequest:(id)a3 requestData:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[6];
  _QWORD v23[3];
  char v24;
  _QWORD v25[5];
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__2;
  v25[4] = __Block_byref_object_dispose__2;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __62__OspreyGRPCChannel_unaryRequest_requestData_responseHandler___block_invoke;
  v22[3] = &unk_1E7098398;
  v22[4] = v23;
  v22[5] = v25;
  v12 = (void *)MEMORY[0x1BCCC5138](v22);
  v16 = v11;
  v17 = 3221225472;
  v18 = __62__OspreyGRPCChannel_unaryRequest_requestData_responseHandler___block_invoke_2;
  v19 = &unk_1E7098320;
  v13 = v10;
  v20 = v13;
  v21 = v25;
  v14 = (void *)MEMORY[0x1BCCC5138](&v16);
  -[OspreyGRPCChannel bidirectionalStreamingRequest:streamingResponseHandler:completion:](self, "bidirectionalStreamingRequest:streamingResponseHandler:completion:", v8, v12, v14, v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "writeFrame:", v9);
  objc_msgSend(v15, "finishWriting");

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

}

void __62__OspreyGRPCChannel_unaryRequest_requestData_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v4 = v5;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

uint64_t __62__OspreyGRPCChannel_unaryRequest_requestData_responseHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  return result;
}

- (void)serverStreamingRequest:(id)a3 requestData:(id)a4 streamingResponseHandler:(id)a5 completion:(id)a6
{
  id v10;
  id v11;

  v10 = a4;
  -[OspreyGRPCChannel bidirectionalStreamingRequest:streamingResponseHandler:completion:](self, "bidirectionalStreamingRequest:streamingResponseHandler:completion:", a3, a5, a6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "writeFrame:", v10);

  objc_msgSend(v11, "finishWriting");
}

- (id)clientStreamingRequest:(id)a3 responseHandler:(id)a4 streamingContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[6];
  _QWORD v24[3];
  char v25;
  _QWORD v26[5];
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__2;
  v26[4] = __Block_byref_object_dispose__2;
  v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __77__OspreyGRPCChannel_clientStreamingRequest_responseHandler_streamingContext___block_invoke;
  v23[3] = &unk_1E7098398;
  v23[4] = v24;
  v23[5] = v26;
  v12 = (void *)MEMORY[0x1BCCC5138](v23);
  v17 = v11;
  v18 = 3221225472;
  v19 = __77__OspreyGRPCChannel_clientStreamingRequest_responseHandler_streamingContext___block_invoke_2;
  v20 = &unk_1E7098320;
  v13 = v9;
  v21 = v13;
  v22 = v26;
  v14 = (void *)MEMORY[0x1BCCC5138](&v17);
  -[OspreyGRPCChannel bidirectionalStreamingRequest:streamingResponseHandler:completion:](self, "bidirectionalStreamingRequest:streamingResponseHandler:completion:", v8, v12, v14, v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

  return v15;
}

void __77__OspreyGRPCChannel_clientStreamingRequest_responseHandler_streamingContext___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v4 = v5;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

uint64_t __77__OspreyGRPCChannel_clientStreamingRequest_responseHandler_streamingContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  return result;
}

- (id)bidirectionalStreamingRequest:(id)a3 streamingResponseHandler:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[OspreyGRPCChannel clientStreamingContextForRequest:streamingResponseHandler:completion:](self, "clientStreamingContextForRequest:streamingResponseHandler:completion:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OspreyGRPCChannel bidirectionalStreamingRequest:streamingContext:](self, "bidirectionalStreamingRequest:streamingContext:", v8, v9);

  return v9;
}

- (void)bidirectionalStreamingRequest:(id)a3 streamingContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSURL *baseURL;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  NSURL *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  OspreyLoggingInit();
  v8 = (void *)OspreyLogContextGRPC;
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_INFO))
  {
    baseURL = self->_baseURL;
    v10 = v8;
    objc_msgSend(v6, "methodName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315650;
    v15 = "-[OspreyGRPCChannel bidirectionalStreamingRequest:streamingContext:]";
    v16 = 2112;
    v17 = baseURL;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1B97C2000, v10, OS_LOG_TYPE_INFO, "%s baseURL: %@, method: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(v6, "grpcRequestWithBaseURL:", self->_baseURL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindToUrlRequest:", v12);
  -[NSURLSession dataTaskWithRequest:](self->_session, "dataTaskWithRequest:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](self->_taskToContext, "setObject:forKey:", v7, v13);

  -[OspreyGRPCChannel _startTask:](self, "_startTask:", v13);
}

- (void)preconnect
{
  id v3;

  -[NSURLSession dataTaskWithURL:completionHandler:](self->_session, "dataTaskWithURL:completionHandler:", self->_baseURL, &__block_literal_global_6);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set_preconnect:", 1);
  -[OspreyGRPCChannel _startTask:](self, "_startTask:", v3);

}

void __31__OspreyGRPCChannel_preconnect__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    OspreyLoggingInit();
    v9 = (void *)OspreyLogContextGRPC;
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
      __31__OspreyGRPCChannel_preconnect__block_invoke_cold_3(v9, v8);
  }
  else
  {
    OspreyLoggingInit();
    v10 = OspreyLogContextGRPC;
    v11 = os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v11)
        __31__OspreyGRPCChannel_preconnect__block_invoke_cold_2(v10, v12, v13, v14, v15, v16, v17, v18);
    }
    else if (v11)
    {
      __31__OspreyGRPCChannel_preconnect__block_invoke_cold_1(v10, v12, v13, v14, v15, v16, v17, v18);
    }
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v6;
  NSObject *v7;
  OspreyConnectionMetrics *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**connectionMetricsHandler)(id, OspreyConnectionMetrics *);
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  OspreyLoggingInit();
  v7 = OspreyLogContextGRPC;
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_INFO))
  {
    v13 = 136315394;
    v14 = "-[OspreyGRPCChannel URLSession:task:didFinishCollectingMetrics:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1B97C2000, v7, OS_LOG_TYPE_INFO, "%s Successfully collected metrics %@", (uint8_t *)&v13, 0x16u);
  }
  if (v6)
  {
    v8 = -[OspreyConnectionMetrics initWithMetrics:]([OspreyConnectionMetrics alloc], "initWithMetrics:", v6);
    -[OspreyGRPCChannel absintheDurations](self, "absintheDurations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OspreyConnectionMetrics connectionMethod](v8, "connectionMethod");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAbsintheConnectionMethodWith:", v10);

    +[OspreyAnalytics reporter](OspreyAnalytics, "reporter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reportConnectionMetrics:", v8);

    connectionMetricsHandler = (void (**)(id, OspreyConnectionMetrics *))self->_connectionMetricsHandler;
    if (connectionMetricsHandler)
      connectionMetricsHandler[2](connectionMetricsHandler, v8);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  NSObject *queue;
  void (**v6)(id, _QWORD);

  queue = self->_queue;
  v6 = (void (**)(id, _QWORD))a5;
  dispatch_assert_queue_V2(queue);
  v6[2](v6, 0);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v7, "originalRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_taskToContext, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OspreyLoggingInit();
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
  {
    -[OspreyGRPCChannel URLSession:task:didCompleteWithError:].cold.1();
    if (!v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v8)
  {
LABEL_3:
    +[OspreyAnalytics reporter](OspreyAnalytics, "reporter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reportError:forURL:", v8, v10);

  }
LABEL_4:
  objc_msgSend(v11, "completeWithError:", v8);
  -[NSMapTable removeObjectForKey:](self->_taskToContext, "removeObjectForKey:", v7);

}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  NSObject *queue;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  void *v11;
  int v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;

  v7 = a4;
  queue = self->_queue;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v7, "protectionSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "authenticationMethod");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB32C8]);

  OspreyLoggingInit();
  v13 = (void *)OspreyLogContextGRPC;
  v14 = os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14)
      -[OspreyGRPCChannel URLSession:didReceiveChallenge:completionHandler:].cold.1();
    v15 = 0;
  }
  else
  {
    if (v14)
      -[OspreyGRPCChannel URLSession:didReceiveChallenge:completionHandler:].cold.2((uint64_t)v7, v13, v10);
    v15 = 1;
  }
  v9[2](v9, v15, 0);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD);
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;

  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, _QWORD))a6;
  OspreyLoggingInit();
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
    -[OspreyGRPCChannel URLSession:dataTask:didReceiveResponse:completionHandler:].cold.4();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v12 = v10;
  v13 = objc_msgSend(v12, "statusCode");
  objc_msgSend(v12, "allHeaderFields");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("grpc-status"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "longLongValue");

  +[OspreyAnalytics reporter](OspreyAnalytics, "reporter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reportHttpStatus:grpcStatus:forURL:", v13, v16, v18);

  if (v13 != 200)
  {
    objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    OspreyLoggingInit();
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR))
      -[OspreyGRPCChannel URLSession:dataTask:didReceiveResponse:completionHandler:].cold.3();
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB32E8];
    objc_msgSend(v12, "allHeaderFields");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v27;
    v25 = v28;
    v26 = v13;
    goto LABEL_11;
  }
  if (v16)
  {
    objc_msgSend(v12, "allHeaderFields");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("grpc-message"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    OspreyLoggingInit();
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR))
      -[OspreyGRPCChannel URLSession:dataTask:didReceiveResponse:completionHandler:].cold.2();
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB32E8];
    objc_msgSend(v12, "allHeaderFields");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v21;
    v25 = v22;
    v26 = -1011;
LABEL_11:
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, v26, v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMapTable objectForKey:](self->_taskToContext, "objectForKey:", v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "completeWithError:", v29);
    -[NSMapTable removeObjectForKey:](self->_taskToContext, "removeObjectForKey:", v9);
    v11[2](v11, 0);

    goto LABEL_12;
  }
  OspreyLoggingInit();
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
    -[OspreyGRPCChannel URLSession:dataTask:didReceiveResponse:completionHandler:].cold.1();
  v11[2](v11, 1);
LABEL_12:

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  OspreyLoggingInit();
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
    -[OspreyGRPCChannel URLSession:dataTask:didReceiveData:].cold.1();
  -[NSMapTable objectForKey:](self->_taskToContext, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleResponseData:", v8);

}

- (id)connectionMetricsHandler
{
  return self->_connectionMetricsHandler;
}

- (void)setConnectionMetricsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (AbsintheAuthenticationDurations)absintheDurations
{
  return self->_absintheDurations;
}

- (void)setAbsintheDurations:(id)a3
{
  objc_storeStrong((id *)&self->_absintheDurations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_absintheDurations, 0);
  objc_storeStrong(&self->_connectionMetricsHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_taskToContext, 0);
  objc_storeStrong((id *)&self->_messageWriter, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)initWithURL:(void *)a1 configuration:(void *)a2 queue:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = 136315906;
  v5 = "-[OspreyGRPCChannel initWithURL:configuration:queue:]";
  v6 = 2112;
  v7 = a1;
  v8 = 1024;
  v9 = objc_msgSend(a1, "_allowsMultipathTCP");
  v10 = 2048;
  v11 = objc_msgSend(a1, "_multipathAlternatePort");
  _os_log_debug_impl(&dword_1B97C2000, v3, OS_LOG_TYPE_DEBUG, "%s %@ mptcp: %d port: %lu", (uint8_t *)&v4, 0x26u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithURL:configuration:queue:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_1B97C2000, v0, v1, "%s Initializing Osprey GRPC channel and NSURLSession -- %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __31__OspreyGRPCChannel_preconnect__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1B97C2000, a1, a3, "%s Preconnection successful!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __31__OspreyGRPCChannel_preconnect__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1B97C2000, a1, a3, "%s Perconnection error: response should be nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __31__OspreyGRPCChannel_preconnect__block_invoke_cold_3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1B97C2000, v3, OS_LOG_TYPE_DEBUG, "%s Preconnection error: %@", (uint8_t *)v5, 0x16u);

  OUTLINED_FUNCTION_4_1();
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_1B97C2000, v0, v1, "%s Completed with error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_1B97C2000, v0, v1, "%s Got challenge %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)URLSession:(uint64_t)a1 didReceiveChallenge:(void *)a2 completionHandler:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "authenticationMethod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136315650;
  v9 = "-[OspreyGRPCChannel URLSession:didReceiveChallenge:completionHandler:]";
  v10 = 2112;
  v11 = a1;
  v12 = 2112;
  v13 = v6;
  OUTLINED_FUNCTION_3(&dword_1B97C2000, v5, v7, "%s Using default handling for challenge %@ with authenticationMethod %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)URLSession:dataTask:didReceiveResponse:completionHandler:.cold.1()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1B97C2000, v0, (uint64_t)v0, "%s %@ got response %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_4_1();
}

- (void)URLSession:dataTask:didReceiveResponse:completionHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_7(&dword_1B97C2000, v0, v1, "%s Encountered grpc error status: %lld - %@", v2);
  OUTLINED_FUNCTION_4_1();
}

- (void)URLSession:dataTask:didReceiveResponse:completionHandler:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_7(&dword_1B97C2000, v0, v1, "%s Encountered HTTP error status: %ld - %@", v2);
  OUTLINED_FUNCTION_4_1();
}

- (void)URLSession:dataTask:didReceiveResponse:completionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_1B97C2000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)URLSession:dataTask:didReceiveData:.cold.1()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1B97C2000, v0, (uint64_t)v0, "%s %@ got %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_4_1();
}

@end

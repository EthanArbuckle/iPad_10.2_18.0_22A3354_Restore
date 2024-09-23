@implementation OspreyChannel

- (OspreyChannel)initWithURL:(id)a3 configuration:(id)a4
{
  return -[OspreyChannel initWithURL:configuration:useCache:](self, "initWithURL:configuration:useCache:", a3, a4, 0);
}

- (OspreyChannel)initWithURL:(id)a3 configuration:(id)a4 useCache:(BOOL)a5
{
  id v8;
  id v9;
  OspreyChannel *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSURL *url;
  void *v21;
  uint64_t v22;
  NSURLSessionConfiguration *configuration;
  id v24;
  const char *v25;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *queue;
  OspreyPreferences *v29;
  OspreyKeychain *v30;
  uint64_t v31;
  OspreyPreferences *preferences;
  uint64_t v33;
  OspreyConnectionPreferences *connectionPreferences;
  OspreyChannelRequestOptions *v35;
  OspreyChannelRequestOptions *defaultRequestOptions;
  dispatch_group_t v37;
  OS_dispatch_group *validationGroup;
  NSError *signatureError;
  OspreyGRPCChannel *v40;
  OspreyGRPCChannel *channel;
  objc_super v43;

  v8 = a3;
  v9 = a4;
  v43.receiver = self;
  v43.super_class = (Class)OspreyChannel;
  v10 = -[OspreyChannel init](&v43, sel_init);
  if (v10)
  {
    OspreyLoggingInit();
    v11 = OspreyLogContextChannel;
    if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_DEBUG))
      -[OspreyChannel initWithURL:configuration:useCache:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    v19 = objc_msgSend(v8, "copy");
    url = v10->_url;
    v10->_url = (NSURL *)v19;

    -[NSURL host](v10->_url, "host");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v9, "copy");
    configuration = v10->_configuration;
    v10->_configuration = (NSURLSessionConfiguration *)v22;

    objc_msgSend(CFSTR("OspreyChannel."), "stringByAppendingString:", v21);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = (const char *)objc_msgSend(v24, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = dispatch_queue_create(v25, v26);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v27;

    v29 = [OspreyPreferences alloc];
    v30 = objc_alloc_init(OspreyKeychain);
    v31 = -[OspreyPreferences initWithKeychain:](v29, "initWithKeychain:", v30);
    preferences = v10->_preferences;
    v10->_preferences = (OspreyPreferences *)v31;

    -[OspreyPreferences connectionPreferencesForHost:](v10->_preferences, "connectionPreferencesForHost:", v21);
    v33 = objc_claimAutoreleasedReturnValue();
    connectionPreferences = v10->_connectionPreferences;
    v10->_connectionPreferences = (OspreyConnectionPreferences *)v33;

    v35 = objc_alloc_init(OspreyChannelRequestOptions);
    defaultRequestOptions = v10->_defaultRequestOptions;
    v10->_defaultRequestOptions = v35;

    v10->_enableDeviceAuthentication = 1;
    v37 = dispatch_group_create();
    validationGroup = v10->_validationGroup;
    v10->_validationGroup = (OS_dispatch_group *)v37;

    v10->_waitingForSignature = 0;
    signatureError = v10->_signatureError;
    v10->_signatureError = 0;

    if (!a5)
      objc_msgSend(v9, "setRequestCachePolicy:", 4);
    v40 = -[OspreyGRPCChannel initWithURL:configuration:queue:]([OspreyGRPCChannel alloc], "initWithURL:configuration:queue:", v8, v9, v10->_queue);
    channel = v10->_channel;
    v10->_channel = v40;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[OspreyChannel close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)OspreyChannel;
  -[OspreyChannel dealloc](&v3, sel_dealloc);
}

- (BOOL)forceHTTPv2
{
  return -[OspreyChannelRequestOptions forceHTTPv2](self->_defaultRequestOptions, "forceHTTPv2");
}

- (void)setForceHTTPv2:(BOOL)a3
{
  -[OspreyChannelRequestOptions setForceHTTPv2:](self->_defaultRequestOptions, "setForceHTTPv2:", a3);
}

- (void)setUseCompression:(BOOL)a3
{
  -[OspreyChannelRequestOptions setCompressionEnabled:](self->_defaultRequestOptions, "setCompressionEnabled:", a3);
}

- (void)setConnectionMetricsHandler:(id)a3
{
  -[OspreyGRPCChannel setConnectionMetricsHandler:](self->_channel, "setConnectionMetricsHandler:", a3);
}

- (id)getConnectionMetricsHandler
{
  return -[OspreyGRPCChannel connectionMetricsHandler](self->_channel, "connectionMetricsHandler");
}

- (void)unaryRequestWithMethodName:(id)a3 requestData:(id)a4 requestBuilder:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v10 = a4;
  v11 = a6;
  -[OspreyChannel _buildRequestWithMethodName:requestBuilder:](self, "_buildRequestWithMethodName:requestBuilder:", a3, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__OspreyChannel_unaryRequestWithMethodName_requestData_requestBuilder_responseHandler___block_invoke;
  v16[3] = &unk_1E7098348;
  v16[4] = self;
  v17 = v12;
  v18 = v10;
  v19 = v11;
  v13 = v10;
  v14 = v12;
  v15 = v11;
  -[OspreyChannel _prepareChannelWithRequest:continueWith:](self, "_prepareChannelWithRequest:continueWith:", v14, v16);

}

uint64_t __87__OspreyChannel_unaryRequestWithMethodName_requestData_requestBuilder_responseHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(a1[7] + 16))();
  else
    return objc_msgSend(*(id *)(a1[4] + 32), "unaryRequest:requestData:responseHandler:", a1[5], a1[6], a1[7]);
}

- (void)serverStreamingRequestWithMethodName:(id)a3 requestData:(id)a4 requestBuilder:(id)a5 streamingResponseHandler:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v12 = a4;
  v13 = a6;
  v14 = a7;
  -[OspreyChannel _buildRequestWithMethodName:requestBuilder:](self, "_buildRequestWithMethodName:requestBuilder:", a3, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __117__OspreyChannel_serverStreamingRequestWithMethodName_requestData_requestBuilder_streamingResponseHandler_completion___block_invoke;
  v20[3] = &unk_1E7098370;
  v20[4] = self;
  v21 = v15;
  v22 = v12;
  v23 = v14;
  v24 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v15;
  v19 = v14;
  -[OspreyChannel _prepareChannelWithRequest:continueWith:](self, "_prepareChannelWithRequest:continueWith:", v18, v20);

}

uint64_t __117__OspreyChannel_serverStreamingRequestWithMethodName_requestData_requestBuilder_streamingResponseHandler_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(a1[7] + 16))();
  else
    return objc_msgSend(*(id *)(a1[4] + 32), "serverStreamingRequest:requestData:streamingResponseHandler:completion:", a1[5], a1[6], a1[8], a1[7]);
}

- (id)clientStreamingRequestWithMethodName:(id)a3 requestBuilder:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[6];
  _QWORD v31[3];
  char v32;
  _QWORD v33[5];
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[OspreyChannel _buildRequestWithMethodName:requestBuilder:](self, "_buildRequestWithMethodName:requestBuilder:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__1;
  v33[4] = __Block_byref_object_dispose__1;
  v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __85__OspreyChannel_clientStreamingRequestWithMethodName_requestBuilder_responseHandler___block_invoke;
  v30[3] = &unk_1E7098398;
  v30[4] = v31;
  v30[5] = v33;
  v13 = (void *)MEMORY[0x1BCCC5138](v30);
  v27[0] = v12;
  v27[1] = 3221225472;
  v27[2] = __85__OspreyChannel_clientStreamingRequestWithMethodName_requestBuilder_responseHandler___block_invoke_2;
  v27[3] = &unk_1E7098320;
  v14 = v10;
  v28 = v14;
  v29 = v33;
  v15 = (void *)MEMORY[0x1BCCC5138](v27);
  -[OspreyGRPCChannel clientStreamingContextForRequest:streamingResponseHandler:completion:](self->_channel, "clientStreamingContextForRequest:streamingResponseHandler:completion:", v11, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __85__OspreyChannel_clientStreamingRequestWithMethodName_requestBuilder_responseHandler___block_invoke_3;
  v23[3] = &unk_1E7098348;
  v17 = v14;
  v26 = v17;
  v23[4] = self;
  v18 = v11;
  v24 = v18;
  v19 = v16;
  v25 = v19;
  -[OspreyChannel _prepareChannelWithRequest:continueWith:](self, "_prepareChannelWithRequest:continueWith:", v18, v23);
  v20 = v25;
  v21 = v19;

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

  return v21;
}

void __85__OspreyChannel_clientStreamingRequestWithMethodName_requestBuilder_responseHandler___block_invoke(uint64_t a1, void *a2)
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

uint64_t __85__OspreyChannel_clientStreamingRequestWithMethodName_requestBuilder_responseHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  return result;
}

uint64_t __85__OspreyChannel_clientStreamingRequestWithMethodName_requestBuilder_responseHandler___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(a1[7] + 16))();
  else
    return objc_msgSend(*(id *)(a1[4] + 32), "bidirectionalStreamingRequest:streamingContext:", a1[5], a1[6]);
}

- (id)bidirectionalStreamingRequestWithMethodName:(id)a3 requestBuilder:(id)a4 streamingResponseHandler:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v10 = a6;
  v11 = a5;
  -[OspreyChannel _buildRequestWithMethodName:requestBuilder:](self, "_buildRequestWithMethodName:requestBuilder:", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OspreyGRPCChannel clientStreamingContextForRequest:streamingResponseHandler:completion:](self->_channel, "clientStreamingContextForRequest:streamingResponseHandler:completion:", v12, v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __112__OspreyChannel_bidirectionalStreamingRequestWithMethodName_requestBuilder_streamingResponseHandler_completion___block_invoke;
  v20[3] = &unk_1E7098348;
  v23 = v10;
  v20[4] = self;
  v21 = v12;
  v14 = v13;
  v22 = v14;
  v15 = v12;
  v16 = v10;
  -[OspreyChannel _prepareChannelWithRequest:continueWith:](self, "_prepareChannelWithRequest:continueWith:", v15, v20);
  v17 = v22;
  v18 = v14;

  return v18;
}

uint64_t __112__OspreyChannel_bidirectionalStreamingRequestWithMethodName_requestBuilder_streamingResponseHandler_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(a1[7] + 16))();
  else
    return objc_msgSend(*(id *)(a1[4] + 32), "bidirectionalStreamingRequest:streamingContext:", a1[5], a1[6]);
}

- (void)preconnect
{
  -[OspreyGRPCChannel preconnect](self->_channel, "preconnect");
}

- (void)initializeDeviceAuthenticationSessionWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  NSObject *queue;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_enableDeviceAuthentication)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__OspreyChannel_initializeDeviceAuthenticationSessionWithCompletion___block_invoke;
    v8[3] = &unk_1E70983E8;
    v8[4] = self;
    v9 = v4;
    dispatch_async(queue, v8);

  }
  else
  {
    OspreyLoggingInit();
    v7 = OspreyLogContextChannel;
    if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_ERROR))
      -[OspreyChannel initializeDeviceAuthenticationSessionWithCompletion:].cold.1(v7);
    v5[2](v5, 0);
  }

}

void __69__OspreyChannel_initializeDeviceAuthenticationSessionWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __69__OspreyChannel_initializeDeviceAuthenticationSessionWithCompletion___block_invoke_2;
  v2[3] = &unk_1E70983C0;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_prepareDeviceAuthenticationWithCompletion:", v2);

}

void __69__OspreyChannel_initializeDeviceAuthenticationSessionWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  OspreyLoggingInit();
  v5 = OspreyLogContextChannel;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_ERROR))
      __69__OspreyChannel_initializeDeviceAuthenticationSessionWithCompletion___block_invoke_2_cold_2(v5, v4);
  }
  else if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_DEBUG))
  {
    __69__OspreyChannel_initializeDeviceAuthenticationSessionWithCompletion___block_invoke_2_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)close
{
  -[OspreyGRPCChannel close](self->_channel, "close");
}

- (void)cancel
{
  -[OspreyGRPCChannel cancel](self->_channel, "cancel");
}

- (id)_buildRequestWithMethodName:(id)a3 requestBuilder:(id)a4
{
  void (**v6)(id, OspreyMutableRequest *);
  id v7;
  OspreyMutableRequest *v8;
  void *v9;

  v6 = (void (**)(id, OspreyMutableRequest *))a4;
  v7 = a3;
  v8 = -[OspreyMutableRequest initWithMethodName:]([OspreyMutableRequest alloc], "initWithMethodName:", v7);

  -[OspreyMutableRequest setEnableDeviceAuthentication:](v8, "setEnableDeviceAuthentication:", self->_enableDeviceAuthentication);
  -[OspreyChannelRequestOptions applyToOspreyMutableRequest:](self->_defaultRequestOptions, "applyToOspreyMutableRequest:", v8);
  if (v6)
    v6[2](v6, v8);
  -[OspreyMutableRequest buildInternalRequest](v8, "buildInternalRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_prepareChannelWithRequest:(id)a3 continueWith:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  OspreyChannel *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__OspreyChannel__prepareChannelWithRequest_continueWith___block_invoke;
  block[3] = &unk_1E7098438;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __57__OspreyChannel__prepareChannelWithRequest_continueWith___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  if ((objc_msgSend(*(id *)(a1 + 32), "enableDeviceAuthentication") & 1) != 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__OspreyChannel__prepareChannelWithRequest_continueWith___block_invoke_2;
    v6[3] = &unk_1E7098410;
    v2 = *(void **)(a1 + 40);
    v3 = *(id *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v7 = v3;
    v8 = v4;
    v9 = v5;
    objc_msgSend(v2, "_prepareDeviceAuthenticationWithCompletion:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __57__OspreyChannel__prepareChannelWithRequest_continueWith___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSignedDeviceAuthenticationData:", a2);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "currentStrategyVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDeviceAuthenticationVersion:", v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_prepareDeviceAuthenticationWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  OspreyDeviceAuthentication *v5;
  OspreyDeviceAuthentication *deviceAuthenticator;
  void *v7;
  NSObject *v8;
  NSObject *validationGroup;
  NSObject *queue;
  id v11;
  OspreyDeviceAuthentication *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  void (**v16)(id, void *, _QWORD);
  _QWORD v17[5];
  void (**v18)(id, void *, _QWORD);
  _QWORD block[5];
  void (**v20)(id, void *, _QWORD);
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_deviceAuthenticator)
  {
    v5 = -[OspreyDeviceAuthentication initWithChannel:connectionPreferences:allPreferences:]([OspreyDeviceAuthentication alloc], "initWithChannel:connectionPreferences:allPreferences:", self->_channel, self->_connectionPreferences, self->_preferences);
    deviceAuthenticator = self->_deviceAuthenticator;
    self->_deviceAuthenticator = v5;

  }
  -[OspreyConnectionPreferences deviceAttestationData](self->_connectionPreferences, "deviceAttestationData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    OspreyLoggingInit();
    v8 = OspreyLogContextChannel;
    if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[OspreyChannel _prepareDeviceAuthenticationWithCompletion:]";
      _os_log_impl(&dword_1B97C2000, v8, OS_LOG_TYPE_INFO, "%s Reusing existing session info", buf, 0xCu);
    }
    v4[2](v4, v7, 0);
  }
  else
  {
    if (self->_waitingForSignature)
    {
      validationGroup = self->_validationGroup;
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke;
      block[3] = &unk_1E70981A8;
      block[4] = self;
      v20 = v4;
      dispatch_group_notify(validationGroup, queue, block);
      v11 = v20;
    }
    else
    {
      self->_waitingForSignature = 1;
      dispatch_group_enter((dispatch_group_t)self->_validationGroup);
      v12 = self->_deviceAuthenticator;
      v13 = objc_alloc_init(MEMORY[0x1E0C99D50]);
      v14 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke_2;
      v17[3] = &unk_1E7098488;
      v17[4] = self;
      v18 = v4;
      v15[0] = v14;
      v15[1] = 3221225472;
      v15[2] = __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke_16;
      v15[3] = &unk_1E70980E0;
      v15[4] = self;
      v16 = v18;
      -[OspreyDeviceAuthentication signData:success:failure:](v12, "signData:success:failure:", v13, v17, v15);

      v11 = v18;
    }

  }
}

void __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "deviceAttestationData");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));

}

void __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 24);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke_3;
  v12[3] = &unk_1E7098460;
  v13 = v5;
  v14 = v7;
  v15 = v6;
  v16 = v8;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

void __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  OspreyLoggingInit();
  v2 = (void *)OspreyLogContextChannel;
  if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[OspreyChannel _prepareDeviceAuthenticationWithCompletion:]_block_invoke_3";
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1B97C2000, v4, OS_LOG_TYPE_INFO, "%s Signed validation header data: %@", (uint8_t *)&v10, 0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = 0;

  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
  v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v8, "setDeviceAttestationData:withExpiration:", v9, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "setConnectionPreferences:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "synchronize");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 56) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 48));
}

void __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke_2_17;
  block[3] = &unk_1E70984B0;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

void __60__OspreyChannel__prepareDeviceAuthenticationWithCompletion___block_invoke_2_17(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "deleteDeviceAttestationData");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setConnectionPreferences:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "synchronize");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
}

- (BOOL)useAbsinthe
{
  return self->_enableDeviceAuthentication;
}

- (void)setUseAbsinthe:(BOOL)a3
{
  self->_enableDeviceAuthentication = a3;
}

- (void)performRequest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "methodName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__OspreyChannel_performRequest_handler___block_invoke;
  v11[3] = &unk_1E70984D8;
  v12 = v6;
  v10 = v6;
  -[OspreyChannel unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:](self, "unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:", v8, v9, v11, v7);

}

void __40__OspreyChannel_performRequest_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientTraceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "clientTraceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClientTraceIdentifier:", v4);

  }
}

- (void)performBidirectionalStreamingRequest:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v8 = a3;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__OspreyChannel_performBidirectionalStreamingRequest_handler_completion___block_invoke;
  v17[3] = &unk_1E70984D8;
  v9 = v8;
  v18 = v9;
  v10 = a5;
  v11 = a4;
  v12 = (void *)MEMORY[0x1BCCC5138](v17);
  objc_msgSend(v9, "methodName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OspreyChannel bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:](self, "bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:", v13, v12, v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v9, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "writeFrame:", v16);

    objc_msgSend(v14, "finishWriting");
  }

}

void __73__OspreyChannel_performBidirectionalStreamingRequest_handler_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientTraceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "clientTraceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClientTraceIdentifier:", v4);

  }
}

- (BOOL)enableDeviceAuthentication
{
  return self->_enableDeviceAuthentication;
}

- (void)setEnableDeviceAuthentication:(BOOL)a3
{
  self->_enableDeviceAuthentication = a3;
}

- (id)connectionMetricsHandler
{
  return self->_connectionMetricsHandler;
}

- (NSString)clientTraceId
{
  return self->_clientTraceId;
}

- (void)setClientTraceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientTraceId, 0);
  objc_storeStrong(&self->_connectionMetricsHandler, 0);
  objc_storeStrong((id *)&self->_defaultRequestOptions, 0);
  objc_storeStrong((id *)&self->_connectionPreferences, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_signatureError, 0);
  objc_storeStrong((id *)&self->_validationGroup, 0);
  objc_storeStrong((id *)&self->_deviceAuthenticator, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)ocp_setAssociatedHandle:(id)a3
{
  objc_setAssociatedObject(self, &OspreyConnectionHandleAssociatedKey, a3, (void *)0x301);
}

- (void)initWithURL:(uint64_t)a3 configuration:(uint64_t)a4 useCache:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1B97C2000, a1, a3, "%s Initializing Osprey channel...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initializeDeviceAuthenticationSessionWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[OspreyChannel initializeDeviceAuthenticationSessionWithCompletion:]";
  _os_log_error_impl(&dword_1B97C2000, log, OS_LOG_TYPE_ERROR, "%s Failed to initialize device authentication session: device authentication was disabled!", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __69__OspreyChannel_initializeDeviceAuthenticationSessionWithCompletion___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1B97C2000, a1, a3, "%s Successfully initialized device authentication session!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __69__OspreyChannel_initializeDeviceAuthenticationSessionWithCompletion___block_invoke_2_cold_2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[OspreyChannel initializeDeviceAuthenticationSessionWithCompletion:]_block_invoke_2";
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1B97C2000, v3, OS_LOG_TYPE_ERROR, "%s Failed to initialize device authentication session: %@", (uint8_t *)&v5, 0x16u);

}

@end

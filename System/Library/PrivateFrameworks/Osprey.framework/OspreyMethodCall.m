@implementation OspreyMethodCall

- (OspreyMethodCall)initWithMethodName:(id)a3 channel:(id)a4 serializeRequest:(id)a5 deserializeResponse:(id)a6 defaultRequestBuilder:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  OspreyMethodCall *v17;
  uint64_t v18;
  NSString *methodName;
  uint64_t v20;
  id serializeRequest;
  uint64_t v22;
  id deserializeResponse;
  uint64_t v24;
  id defaultRequestBuilder;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)OspreyMethodCall;
  v17 = -[OspreyMethodCall init](&v27, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    methodName = v17->_methodName;
    v17->_methodName = (NSString *)v18;

    objc_storeStrong((id *)&v17->_channel, a4);
    v20 = objc_msgSend(v14, "copy");
    serializeRequest = v17->_serializeRequest;
    v17->_serializeRequest = (id)v20;

    v22 = objc_msgSend(v15, "copy");
    deserializeResponse = v17->_deserializeResponse;
    v17->_deserializeResponse = (id)v22;

    v24 = objc_msgSend(v16, "copy");
    defaultRequestBuilder = v17->_defaultRequestBuilder;
    v17->_defaultRequestBuilder = (id)v24;

  }
  return v17;
}

- (OspreyMethodCall)callWithMessageReceived:(id)a3 completion:(id)a4
{
  return -[OspreyMethodCall callWithRequestBuilder:messageReceived:completion:](self, "callWithRequestBuilder:messageReceived:completion:", 0, a3, a4);
}

- (OspreyMethodCall)callWithRequestBuilder:(id)a3 messageReceived:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  OspreyRPC *channel;
  NSString *methodName;
  id v16;
  void *v17;
  OspreyMessageProducer *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self->_deserializeResponse);
  v11 = (void *)MEMORY[0x1BCCC5138](v8);
  v12 = MEMORY[0x1E0C809B0];
  if (self->_defaultRequestBuilder)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __70__OspreyMethodCall_callWithRequestBuilder_messageReceived_completion___block_invoke;
    v23[3] = &unk_1E70986A8;
    v23[4] = self;
    v24 = v8;
    v13 = MEMORY[0x1BCCC5138](v23);

    v11 = (void *)v13;
  }
  methodName = self->_methodName;
  channel = self->_channel;
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __70__OspreyMethodCall_callWithRequestBuilder_messageReceived_completion___block_invoke_2;
  v20[3] = &unk_1E70986D0;
  v16 = v9;
  v21 = v16;
  objc_copyWeak(&v22, &location);
  -[OspreyRPC bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:](channel, "bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:", methodName, v11, v20, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[OspreyMessageProducer initWithMessageSerializer:streamingContext:]([OspreyMessageProducer alloc], "initWithMessageSerializer:streamingContext:", self->_serializeRequest, v17);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return (OspreyMethodCall *)v18;
}

void __70__OspreyMethodCall_callWithRequestBuilder_messageReceived_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __70__OspreyMethodCall_callWithRequestBuilder_messageReceived_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void (**v4)(id, id);
  void *v5;
  id v6;

  v6 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

    if (WeakRetained)
    {
      v4 = (void (**)(id, id))objc_loadWeakRetained((id *)(a1 + 40));
      v4[2](v4, v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultRequestBuilder, 0);
  objc_storeStrong(&self->_deserializeResponse, 0);
  objc_storeStrong(&self->_serializeRequest, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_methodName, 0);
}

@end

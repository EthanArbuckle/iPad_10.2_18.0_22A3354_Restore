@implementation SiriAnalyticsRemoteService

- (void)emitMessage:(id)a3 timestamp:(unint64_t)a4 messageUUID:(id)a5 isolatedStreamUUID:(id)a6 completion:(id)a7
{
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  NSObject *queue;
  _QWORD block[5];
  id v17;
  void (**v18)(_QWORD);

  v12 = (void (**)(_QWORD))a7;
  -[SiriAnalyticsRemoteService _packageMessageForXPC:timestamp:messageUUID:isolatedStreamUUID:](self, "_packageMessageForXPC:timestamp:messageUUID:isolatedStreamUUID:", a3, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__SiriAnalyticsRemoteService_emitMessage_timestamp_messageUUID_isolatedStreamUUID_completion___block_invoke;
    block[3] = &unk_1E4357C48;
    block[4] = self;
    v17 = v13;
    v18 = v12;
    dispatch_async(queue, block);

  }
  else if (v12)
  {
    v12[2](v12);
  }

}

- (id)_packageMessageForXPC:(id)a3 timestamp:(unint64_t)a4 messageUUID:(id)a5 isolatedStreamUUID:(id)a6
{
  id v9;
  id v10;
  void *v11;
  SiriAnalyticsXPCOrderedMessageEnvelope *v12;
  uint64_t v13;
  void *v14;
  SiriAnalyticsXPCOrderedMessageEnvelope *v15;

  v9 = a6;
  v10 = a5;
  objc_msgSend(a3, "wrapAsAnyEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [SiriAnalyticsXPCOrderedMessageEnvelope alloc];
  v13 = (int)objc_msgSend(v11, "anyEventType");
  objc_msgSend(v11, "payload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SiriAnalyticsXPCOrderedMessageEnvelope initWithTimestamp:streamUUID:messageType:messageUUID:messageBody:](v12, "initWithTimestamp:streamUUID:messageType:messageUUID:messageBody:", a4, v9, v13, v10, v14);

  return v15;
}

void __94__SiriAnalyticsRemoteService_emitMessage_timestamp_messageUUID_isolatedStreamUUID_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1[4] + 16);
  v4[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publishMessages:completion:", v3, a1[6]);

}

- (SiriAnalyticsRemoteService)initWithMachServiceName:(id)a3
{
  id v4;
  SiriAnalyticsRemoteService *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  SiriAnalyticsXPCConnection *v9;
  SiriAnalyticsXPCConnection *connection;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriAnalyticsRemoteService;
  v5 = -[SiriAnalyticsRemoteService init](&v12, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.siri.analytics.stream.xpc", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = -[SiriAnalyticsXPCConnection initWithMachServiceName:]([SiriAnalyticsXPCConnection alloc], "initWithMachServiceName:", v4);
    connection = v5->_connection;
    v5->_connection = v9;

  }
  return v5;
}

- (void)resolvePartialMessage:(id)a3 timestamp:(unint64_t)a4 messageUUID:(id)a5 isolatedStreamUUID:(id)a6 completion:(id)a7
{
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  NSObject *queue;
  _QWORD block[5];
  id v17;
  void (**v18)(_QWORD);

  v12 = (void (**)(_QWORD))a7;
  -[SiriAnalyticsRemoteService _packageMessageForXPC:timestamp:messageUUID:isolatedStreamUUID:](self, "_packageMessageForXPC:timestamp:messageUUID:isolatedStreamUUID:", a3, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__SiriAnalyticsRemoteService_resolvePartialMessage_timestamp_messageUUID_isolatedStreamUUID_completion___block_invoke;
    block[3] = &unk_1E4357C48;
    block[4] = self;
    v17 = v13;
    v18 = v12;
    dispatch_async(queue, block);

  }
  else if (v12)
  {
    v12[2](v12);
  }

}

- (void)enqueueLargeMessageObjectFromPath:(id)a3 dataUploadEvent:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  SiriAnalyticsXPCLargeMessageEnvelope *v11;
  void *v12;
  SiriAnalyticsXPCLargeMessageEnvelope *v13;
  NSObject *queue;
  id v15;
  SiriAnalyticsXPCLargeMessageEnvelope *v16;
  _QWORD block[5];
  SiriAnalyticsXPCLargeMessageEnvelope *v18;
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [SiriAnalyticsXPCLargeMessageEnvelope alloc];
  objc_msgSend(v9, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SiriAnalyticsXPCLargeMessageEnvelope initWithLargeMessagePath:serializedDataUploadMessage:](v11, "initWithLargeMessagePath:serializedDataUploadMessage:", v10, v12);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__SiriAnalyticsRemoteService_enqueueLargeMessageObjectFromPath_dataUploadEvent_completion___block_invoke;
  block[3] = &unk_1E4357C48;
  block[4] = self;
  v18 = v13;
  v19 = v8;
  v15 = v8;
  v16 = v13;
  dispatch_async(queue, block);

}

- (void)barrierWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  _QWORD aBlock[4];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__SiriAnalyticsRemoteService_barrierWithCompletion___block_invoke;
  aBlock[3] = &unk_1E4357C20;
  v13 = v4;
  v6 = v4;
  v7 = _Block_copy(aBlock);
  queue = self->_queue;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __52__SiriAnalyticsRemoteService_barrierWithCompletion___block_invoke_2;
  block[3] = &unk_1E4357C98;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_barrier_async(queue, block);

}

- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__SiriAnalyticsRemoteService_sensitiveCondition_startedAt_completion___block_invoke;
  v11[3] = &unk_1E4357C70;
  v14 = a3;
  v12 = v8;
  v13 = a4;
  v11[4] = self;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__SiriAnalyticsRemoteService_sensitiveCondition_endedAt_completion___block_invoke;
  v11[3] = &unk_1E4357C70;
  v14 = a3;
  v12 = v8;
  v13 = a4;
  v11[4] = self;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)createTag:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SiriAnalyticsRemoteService_createTag_completion___block_invoke;
  block[3] = &unk_1E4357C48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __51__SiriAnalyticsRemoteService_createTag_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "createTag:completion:", a1[5], a1[6]);
}

uint64_t __68__SiriAnalyticsRemoteService_sensitiveCondition_endedAt_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sensitiveCondition:endedAt:completion:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __70__SiriAnalyticsRemoteService_sensitiveCondition_startedAt_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sensitiveCondition:startedAt:completion:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __52__SiriAnalyticsRemoteService_barrierWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __52__SiriAnalyticsRemoteService_barrierWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  return objc_msgSend(v2, "barrierWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __91__SiriAnalyticsRemoteService_enqueueLargeMessageObjectFromPath_dataUploadEvent_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "publishLargeMessage:completion:", a1[5], a1[6]);
}

void __104__SiriAnalyticsRemoteService_resolvePartialMessage_timestamp_messageUUID_isolatedStreamUUID_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1[4] + 16);
  v4[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveMessages:completion:", v3, a1[6]);

}

@end

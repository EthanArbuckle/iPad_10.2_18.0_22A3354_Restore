@implementation FTBlazarService

- (id)performMultiUserWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  FTMultiUserStreamingContext *v14;
  FTMultiUserStreamingContext *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __74__FTBlazarService_performMultiUserWithDelegate_requestBuilder_completion___block_invoke;
  v22[3] = &unk_251A13968;
  v11 = v8;
  v23 = v11;
  v17 = v10;
  v18 = 3221225472;
  v19 = __74__FTBlazarService_performMultiUserWithDelegate_requestBuilder_completion___block_invoke_2;
  v20 = &unk_251A15068;
  v12 = v9;
  v21 = v12;
  -[OspreyChannel bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:](self, "bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:", CFSTR("/siri.speech.qss_fb.Blazar/MultiUser"), a4, v22, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [FTMultiUserStreamingContext alloc];
  v15 = -[FTMultiUserStreamingContext initWithGRPCStreamingCallContext:](v14, "initWithGRPCStreamingCallContext:", v13, v17, v18, v19, v20);

  return v15;
}

void __74__FTBlazarService_performMultiUserWithDelegate_requestBuilder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = -[FTMultiUserStreamingResponse initAndVerifyWithFlatbuffData:]([FTMultiUserStreamingResponse alloc], "initAndVerifyWithFlatbuffData:", v5);
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "streamDidReceiveMultiUserStreamingResponse:", v3);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Flatbuffers"), 100, MEMORY[0x24BDBD1B8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "streamFailVerifyMultiUserStreamingResponse:", v4);

  }
}

uint64_t __74__FTBlazarService_performMultiUserWithDelegate_requestBuilder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)performMultilingualWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  FTMultilingualStreamingContext *v14;
  FTMultilingualStreamingContext *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __77__FTBlazarService_performMultilingualWithDelegate_requestBuilder_completion___block_invoke;
  v22[3] = &unk_251A13968;
  v11 = v8;
  v23 = v11;
  v17 = v10;
  v18 = 3221225472;
  v19 = __77__FTBlazarService_performMultilingualWithDelegate_requestBuilder_completion___block_invoke_2;
  v20 = &unk_251A15068;
  v12 = v9;
  v21 = v12;
  -[OspreyChannel bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:](self, "bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:", CFSTR("/siri.speech.qss_fb.Blazar/Multilingual"), a4, v22, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [FTMultilingualStreamingContext alloc];
  v15 = -[FTMultilingualStreamingContext initWithGRPCStreamingCallContext:](v14, "initWithGRPCStreamingCallContext:", v13, v17, v18, v19, v20);

  return v15;
}

void __77__FTBlazarService_performMultilingualWithDelegate_requestBuilder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = -[FTMultilingualStreamingResponse initAndVerifyWithFlatbuffData:]([FTMultilingualStreamingResponse alloc], "initAndVerifyWithFlatbuffData:", v5);
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "streamDidReceiveMultilingualStreamingResponse:", v3);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Flatbuffers"), 100, MEMORY[0x24BDBD1B8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "streamFailVerifyMultilingualStreamingResponse:", v4);

  }
}

uint64_t __77__FTBlazarService_performMultilingualWithDelegate_requestBuilder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)performSpeechTranslationWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  FTSpeechTranslationStreamingContext *v14;
  FTSpeechTranslationStreamingContext *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __82__FTBlazarService_performSpeechTranslationWithDelegate_requestBuilder_completion___block_invoke;
  v22[3] = &unk_251A13968;
  v11 = v8;
  v23 = v11;
  v17 = v10;
  v18 = 3221225472;
  v19 = __82__FTBlazarService_performSpeechTranslationWithDelegate_requestBuilder_completion___block_invoke_2;
  v20 = &unk_251A15068;
  v12 = v9;
  v21 = v12;
  -[OspreyChannel bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:](self, "bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:", CFSTR("/siri.speech.qss_fb.Blazar/SpeechTranslation"), a4, v22, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [FTSpeechTranslationStreamingContext alloc];
  v15 = -[FTSpeechTranslationStreamingContext initWithGRPCStreamingCallContext:](v14, "initWithGRPCStreamingCallContext:", v13, v17, v18, v19, v20);

  return v15;
}

void __82__FTBlazarService_performSpeechTranslationWithDelegate_requestBuilder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = -[FTSpeechTranslationStreamingResponse initAndVerifyWithFlatbuffData:]([FTSpeechTranslationStreamingResponse alloc], "initAndVerifyWithFlatbuffData:", v5);
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "streamDidReceiveSpeechTranslationStreamingResponse:", v3);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Flatbuffers"), 100, MEMORY[0x24BDBD1B8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "streamFailVerifySpeechTranslationStreamingResponse:", v4);

  }
}

uint64_t __82__FTBlazarService_performSpeechTranslationWithDelegate_requestBuilder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)performBatchTranslationWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  FTBatchTranslationStreamingContext *v14;
  FTBatchTranslationStreamingContext *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __81__FTBlazarService_performBatchTranslationWithDelegate_requestBuilder_completion___block_invoke;
  v22[3] = &unk_251A13968;
  v11 = v8;
  v23 = v11;
  v17 = v10;
  v18 = 3221225472;
  v19 = __81__FTBlazarService_performBatchTranslationWithDelegate_requestBuilder_completion___block_invoke_2;
  v20 = &unk_251A15068;
  v12 = v9;
  v21 = v12;
  -[OspreyChannel bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:](self, "bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:", CFSTR("/siri.speech.qss_fb.Blazar/BatchTranslation"), a4, v22, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [FTBatchTranslationStreamingContext alloc];
  v15 = -[FTBatchTranslationStreamingContext initWithGRPCStreamingCallContext:](v14, "initWithGRPCStreamingCallContext:", v13, v17, v18, v19, v20);

  return v15;
}

void __81__FTBlazarService_performBatchTranslationWithDelegate_requestBuilder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = -[FTBatchTranslationStreamingResponse initAndVerifyWithFlatbuffData:]([FTBatchTranslationStreamingResponse alloc], "initAndVerifyWithFlatbuffData:", v5);
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "streamDidReceiveBatchTranslationStreamingResponse:", v3);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Flatbuffers"), 100, MEMORY[0x24BDBD1B8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "streamFailVerifyBatchTranslationStreamingResponse:", v4);

  }
}

uint64_t __81__FTBlazarService_performBatchTranslationWithDelegate_requestBuilder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performTextToSpeechRouter:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "flatbuffData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__FTBlazarService_performTextToSpeechRouter_requestBuilder_completion___block_invoke;
  v12[3] = &unk_251A15090;
  v11 = v9;
  v13 = v11;
  -[OspreyChannel unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:](self, "unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:", CFSTR("/siri.speech.qss_fb.Blazar/TextToSpeechRouter"), v10, v8, v12);

}

void __71__FTBlazarService_performTextToSpeechRouter_requestBuilder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = -[FTTextToSpeechResponse initAndVerifyWithFlatbuffData:]([FTTextToSpeechResponse alloc], "initAndVerifyWithFlatbuffData:", v8);
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Flatbuffers"), 100, MEMORY[0x24BDBD1B8]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

}

- (id)performTextToSpeechRouterStreamingWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  FTTextToSpeechRouterStreamingStreamingContext *v14;
  FTTextToSpeechRouterStreamingStreamingContext *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __92__FTBlazarService_performTextToSpeechRouterStreamingWithDelegate_requestBuilder_completion___block_invoke;
  v22[3] = &unk_251A13968;
  v11 = v8;
  v23 = v11;
  v17 = v10;
  v18 = 3221225472;
  v19 = __92__FTBlazarService_performTextToSpeechRouterStreamingWithDelegate_requestBuilder_completion___block_invoke_2;
  v20 = &unk_251A15068;
  v12 = v9;
  v21 = v12;
  -[OspreyChannel bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:](self, "bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:", CFSTR("/siri.speech.qss_fb.Blazar/TextToSpeechRouterStreaming"), a4, v22, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [FTTextToSpeechRouterStreamingStreamingContext alloc];
  v15 = -[FTTextToSpeechRouterStreamingStreamingContext initWithGRPCStreamingCallContext:](v14, "initWithGRPCStreamingCallContext:", v13, v17, v18, v19, v20);

  return v15;
}

void __92__FTBlazarService_performTextToSpeechRouterStreamingWithDelegate_requestBuilder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = -[FTTextToSpeechRouterStreamingStreamingResponse initAndVerifyWithFlatbuffData:]([FTTextToSpeechRouterStreamingStreamingResponse alloc], "initAndVerifyWithFlatbuffData:", v5);
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "streamDidReceiveTextToSpeechRouterStreamingStreamingResponse:", v3);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Flatbuffers"), 100, MEMORY[0x24BDBD1B8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "streamFailVerifyTextToSpeechRouterStreamingStreamingResponse:", v4);

  }
}

uint64_t __92__FTBlazarService_performTextToSpeechRouterStreamingWithDelegate_requestBuilder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performServiceDiscovery:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "flatbuffData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__FTBlazarService_performServiceDiscovery_requestBuilder_completion___block_invoke;
  v12[3] = &unk_251A15090;
  v11 = v9;
  v13 = v11;
  -[OspreyChannel unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:](self, "unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:", CFSTR("/siri.speech.qss_fb.Blazar/ServiceDiscovery"), v10, v8, v12);

}

void __69__FTBlazarService_performServiceDiscovery_requestBuilder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = -[FTServiceDiscoveryResponse initAndVerifyWithFlatbuffData:]([FTServiceDiscoveryResponse alloc], "initAndVerifyWithFlatbuffData:", v8);
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Flatbuffers"), 100, MEMORY[0x24BDBD1B8]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

}

@end

@implementation FTApgService

- (id)performPronGuessWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  FTPronGuessStreamingContext *v14;
  FTPronGuessStreamingContext *v15;
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
  v22[2] = __71__FTApgService_performPronGuessWithDelegate_requestBuilder_completion___block_invoke;
  v22[3] = &unk_251A13968;
  v11 = v8;
  v23 = v11;
  v17 = v10;
  v18 = 3221225472;
  v19 = __71__FTApgService_performPronGuessWithDelegate_requestBuilder_completion___block_invoke_2;
  v20 = &unk_251A15068;
  v12 = v9;
  v21 = v12;
  -[OspreyChannel bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:](self, "bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:", CFSTR("/siri.speech.qss_fb.Apg/PronGuess"), a4, v22, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [FTPronGuessStreamingContext alloc];
  v15 = -[FTPronGuessStreamingContext initWithGRPCStreamingCallContext:](v14, "initWithGRPCStreamingCallContext:", v13, v17, v18, v19, v20);

  return v15;
}

void __71__FTApgService_performPronGuessWithDelegate_requestBuilder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = -[FTPronGuessStreamingResponse initAndVerifyWithFlatbuffData:]([FTPronGuessStreamingResponse alloc], "initAndVerifyWithFlatbuffData:", v5);
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "streamDidReceivePronGuessStreamingResponse:", v3);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Flatbuffers"), 100, MEMORY[0x24BDBD1B8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "streamFailVerifyPronGuessStreamingResponse:", v4);

  }
}

uint64_t __71__FTApgService_performPronGuessWithDelegate_requestBuilder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

@implementation FTAsrService

- (id)performRecognitionWithDelegate:(id)a3 requestBuilder:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  FTRecognitionStreamingContext *v14;
  FTRecognitionStreamingContext *v15;
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
  v22[2] = __73__FTAsrService_performRecognitionWithDelegate_requestBuilder_completion___block_invoke;
  v22[3] = &unk_251A13968;
  v11 = v8;
  v23 = v11;
  v17 = v10;
  v18 = 3221225472;
  v19 = __73__FTAsrService_performRecognitionWithDelegate_requestBuilder_completion___block_invoke_2;
  v20 = &unk_251A15068;
  v12 = v9;
  v21 = v12;
  -[OspreyChannel bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:](self, "bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:", CFSTR("/siri.speech.qss_fb.Asr/Recognition"), a4, v22, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [FTRecognitionStreamingContext alloc];
  v15 = -[FTRecognitionStreamingContext initWithGRPCStreamingCallContext:](v14, "initWithGRPCStreamingCallContext:", v13, v17, v18, v19, v20);

  return v15;
}

void __73__FTAsrService_performRecognitionWithDelegate_requestBuilder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = -[FTRecognitionStreamingResponse initAndVerifyWithFlatbuffData:]([FTRecognitionStreamingResponse alloc], "initAndVerifyWithFlatbuffData:", v5);
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "streamDidReceiveRecognitionStreamingResponse:", v3);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Flatbuffers"), 100, MEMORY[0x24BDBD1B8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "streamFailVerifyRecognitionStreamingResponse:", v4);

  }
}

uint64_t __73__FTAsrService_performRecognitionWithDelegate_requestBuilder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performErrorBlamer:(id)a3 requestBuilder:(id)a4 completion:(id)a5
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
  v12[2] = __61__FTAsrService_performErrorBlamer_requestBuilder_completion___block_invoke;
  v12[3] = &unk_251A15090;
  v11 = v9;
  v13 = v11;
  -[OspreyChannel unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:](self, "unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:", CFSTR("/siri.speech.qss_fb.Asr/ErrorBlamer"), v10, v8, v12);

}

void __61__FTAsrService_performErrorBlamer_requestBuilder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v6 = -[FTErrorBlamerResponse initAndVerifyWithFlatbuffData:]([FTErrorBlamerResponse alloc], "initAndVerifyWithFlatbuffData:", v8);
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

- (void)performItn:(id)a3 requestBuilder:(id)a4 completion:(id)a5
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
  v12[2] = __53__FTAsrService_performItn_requestBuilder_completion___block_invoke;
  v12[3] = &unk_251A15090;
  v11 = v9;
  v13 = v11;
  -[OspreyChannel unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:](self, "unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:", CFSTR("/siri.speech.qss_fb.Asr/Itn"), v10, v8, v12);

}

void __53__FTAsrService_performItn_requestBuilder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v6 = -[FTItnResponse initAndVerifyWithFlatbuffData:]([FTItnResponse alloc], "initAndVerifyWithFlatbuffData:", v8);
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

- (void)performTextNormalization:(id)a3 requestBuilder:(id)a4 completion:(id)a5
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
  v12[2] = __67__FTAsrService_performTextNormalization_requestBuilder_completion___block_invoke;
  v12[3] = &unk_251A15090;
  v11 = v9;
  v13 = v11;
  -[OspreyChannel unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:](self, "unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:", CFSTR("/siri.speech.qss_fb.Asr/TextNormalization"), v10, v8, v12);

}

void __67__FTAsrService_performTextNormalization_requestBuilder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v6 = -[FTTextNormalizationResponse initAndVerifyWithFlatbuffData:]([FTTextNormalizationResponse alloc], "initAndVerifyWithFlatbuffData:", v8);
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

- (void)performPostItnHammer:(id)a3 requestBuilder:(id)a4 completion:(id)a5
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
  v12[2] = __63__FTAsrService_performPostItnHammer_requestBuilder_completion___block_invoke;
  v12[3] = &unk_251A15090;
  v11 = v9;
  v13 = v11;
  -[OspreyChannel unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:](self, "unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:", CFSTR("/siri.speech.qss_fb.Asr/PostItnHammer"), v10, v8, v12);

}

void __63__FTAsrService_performPostItnHammer_requestBuilder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v6 = -[FTPostItnHammerResponse initAndVerifyWithFlatbuffData:]([FTPostItnHammerResponse alloc], "initAndVerifyWithFlatbuffData:", v8);
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

- (void)performKeywordFinder:(id)a3 requestBuilder:(id)a4 completion:(id)a5
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
  v12[2] = __63__FTAsrService_performKeywordFinder_requestBuilder_completion___block_invoke;
  v12[3] = &unk_251A15090;
  v11 = v9;
  v13 = v11;
  -[OspreyChannel unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:](self, "unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:", CFSTR("/siri.speech.qss_fb.Asr/KeywordFinder"), v10, v8, v12);

}

void __63__FTAsrService_performKeywordFinder_requestBuilder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v6 = -[FTKeywordFinderResponse initAndVerifyWithFlatbuffData:]([FTKeywordFinderResponse alloc], "initAndVerifyWithFlatbuffData:", v8);
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

- (void)performCorrectionsValidator:(id)a3 requestBuilder:(id)a4 completion:(id)a5
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
  v12[2] = __70__FTAsrService_performCorrectionsValidator_requestBuilder_completion___block_invoke;
  v12[3] = &unk_251A15090;
  v11 = v9;
  v13 = v11;
  -[OspreyChannel unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:](self, "unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:", CFSTR("/siri.speech.qss_fb.Asr/CorrectionsValidator"), v10, v8, v12);

}

void __70__FTAsrService_performCorrectionsValidator_requestBuilder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v6 = -[FTCorrectionsValidatorResponse initAndVerifyWithFlatbuffData:]([FTCorrectionsValidatorResponse alloc], "initAndVerifyWithFlatbuffData:", v8);
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

- (void)performGraphemeToPhoneme:(id)a3 requestBuilder:(id)a4 completion:(id)a5
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
  v12[2] = __67__FTAsrService_performGraphemeToPhoneme_requestBuilder_completion___block_invoke;
  v12[3] = &unk_251A15090;
  v11 = v9;
  v13 = v11;
  -[OspreyChannel unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:](self, "unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:", CFSTR("/siri.speech.qss_fb.Asr/GraphemeToPhoneme"), v10, v8, v12);

}

void __67__FTAsrService_performGraphemeToPhoneme_requestBuilder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v6 = -[FTGraphemeToPhonemeResponse initAndVerifyWithFlatbuffData:]([FTGraphemeToPhonemeResponse alloc], "initAndVerifyWithFlatbuffData:", v8);
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

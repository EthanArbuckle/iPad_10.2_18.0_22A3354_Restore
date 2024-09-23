@implementation FTMtService

- (void)performTranslation:(id)a3 requestBuilder:(id)a4 completion:(id)a5
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
  v12[2] = __60__FTMtService_performTranslation_requestBuilder_completion___block_invoke;
  v12[3] = &unk_251A15090;
  v11 = v9;
  v13 = v11;
  -[OspreyChannel unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:](self, "unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:", CFSTR("/siri.speech.qss_fb.Mt/Translation"), v10, v8, v12);

}

void __60__FTMtService_performTranslation_requestBuilder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v6 = -[FTTranslationResponse initAndVerifyWithFlatbuffData:]([FTTranslationResponse alloc], "initAndVerifyWithFlatbuffData:", v8);
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

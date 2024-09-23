@implementation OspreyUnaryMethodCall

- (OspreyUnaryMethodCall)callWithRequestBuilder:(id)a3 requestMessage:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  OspreyUnaryMethodCall *result;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__0;
  v18[4] = __Block_byref_object_dispose__0;
  v19 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__OspreyUnaryMethodCall_callWithRequestBuilder_requestMessage_completion___block_invoke;
  v17[3] = &unk_1E70982F8;
  v17[4] = v18;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__OspreyUnaryMethodCall_callWithRequestBuilder_requestMessage_completion___block_invoke_2;
  v14[3] = &unk_1E7098320;
  v11 = v10;
  v15 = v11;
  v16 = v18;
  -[OspreyMethodCall callWithRequestBuilder:messageReceived:completion:](self, "callWithRequestBuilder:messageReceived:completion:", v8, v17, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "produceMessage:", v9);
  objc_msgSend(v12, "finishProducing");

  _Block_object_dispose(v18, 8);
  return result;
}

void __74__OspreyUnaryMethodCall_callWithRequestBuilder_requestMessage_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __74__OspreyUnaryMethodCall_callWithRequestBuilder_requestMessage_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, a2);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

@end

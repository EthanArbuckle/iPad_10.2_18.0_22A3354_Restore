@implementation PKAsyncFactory

+ (id)createObjectWithOperation:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  PKAsyncUnaryOperationComposer *v8;
  uint64_t v9;
  PKAsyncFactoryOperationContainer *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
    goto LABEL_5;
  if (!v5)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v8 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__PKAsyncFactory_createObjectWithOperation_completion___block_invoke;
  v15[3] = &unk_1E2AC5358;
  v16 = v5;
  -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v15);
  v10 = objc_alloc_init(PKAsyncFactoryOperationContainer);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __55__PKAsyncFactory_createObjectWithOperation_completion___block_invoke_3;
  v13[3] = &unk_1E2AC5380;
  v14 = v7;
  -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v8, "evaluateWithInput:completion:", v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v11;
}

void __55__PKAsyncFactory_createObjectWithOperation_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, _QWORD *);
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__PKAsyncFactory_createObjectWithOperation_completion___block_invoke_2;
  v13[3] = &unk_1E2AC5330;
  v14 = v7;
  v15 = v8;
  v10 = *(void (**)(uint64_t, uint64_t, _QWORD *))(v9 + 16);
  v11 = v8;
  v12 = v7;
  v10(v9, a2, v13);

}

uint64_t __55__PKAsyncFactory_createObjectWithOperation_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __55__PKAsyncFactory_createObjectWithOperation_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a4;
  objc_msgSend(a3, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, id))(v6 + 16))(v6, a2, v8, v7);

}

@end

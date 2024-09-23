@implementation SESEndPointUpdateWithBlock

void __SESEndPointUpdateWithBlock_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[9];
  id v13;
  _QWORD v14[6];
  _QWORD v15[5];
  id v16;

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__9;
  v15[4] = __Block_byref_object_dispose__9;
  v16 = 0;
  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __SESEndPointUpdateWithBlock_block_invoke_2;
  v14[3] = &unk_24C2BCBF8;
  v4 = *(_QWORD *)(a1 + 56);
  v14[4] = v15;
  v14[5] = v4;
  objc_msgSend(v2, "listEndPointsWithProxy:reply:", 0, v14);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "hexStringAsData");
    v12[5] = v3;
    v12[6] = 3221225472;
    v12[7] = __SESEndPointUpdateWithBlock_block_invoke_3;
    v12[8] = &unk_24C2BD4D0;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v5;
    Find();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v7 = *(void **)(a1 + 32);
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __SESEndPointUpdateWithBlock_block_invoke_4;
      v12[3] = &unk_24C2BCCB0;
      v12[4] = *(_QWORD *)(a1 + 56);
      objc_msgSend(v7, "updateEndpoint:reply:", v6, v12);
    }
    else
    {
      SESDefaultLogObject();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }
  _Block_object_dispose(v15, 8);

}

void __SESEndPointUpdateWithBlock_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t __SESEndPointUpdateWithBlock_block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "publicKeyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToData:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __SESEndPointUpdateWithBlock_block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

@end

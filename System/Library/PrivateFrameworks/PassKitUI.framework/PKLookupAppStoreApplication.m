@implementation PKLookupAppStoreApplication

void __PKLookupAppStoreApplication_block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __PKLookupAppStoreApplication_block_invoke_2;
  v9[3] = &unk_1E3E618A0;
  v10 = v5;
  v11 = v6;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __PKLookupAppStoreApplication_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __PKLookupAppStoreApplication_block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *MEMORY[0x1E0CF9B28];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __PKLookupAppStoreApplication_block_invoke_4;
  v18[3] = &unk_1E3E657C8;
  v24 = v9;
  v19 = v7;
  v20 = v8;
  v21 = *(id *)(a1 + 48);
  v22 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 56);
  v14 = *(_QWORD *)(a1 + 64);
  v23 = v13;
  v25 = v14;
  v15 = v8;
  v16 = v9;
  v17 = v7;
  objc_msgSend(v10, "_lockupRequestForBundleID:withContext:completionBlock:", v11, v12, v18);

}

void __PKLookupAppStoreApplication_block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    if (!v5 || a3)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __PKLookupAppStoreApplication_block_invoke_5;
      v10[3] = &unk_1E3E657A0;
      v6 = *(void **)(a1 + 48);
      v11 = *(id *)(a1 + 56);
      v12 = v5;
      v7 = *(id *)(a1 + 64);
      v8 = *(_QWORD *)(a1 + 80);
      v13 = v7;
      v14 = v8;
      objc_msgSend(v6, "addOperation:", v10);
      (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), 0, v9);

    }
  }

}

void __PKLookupAppStoreApplication_block_invoke_5(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a2, "isCanceled") & 1) == 0)
  {
    v9 = (void *)a1[4];
    v10 = a1[5];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __PKLookupAppStoreApplication_block_invoke_6;
    v12[3] = &unk_1E3E65778;
    v11 = a1[6];
    v15 = a1[7];
    v14 = v8;
    v13 = v7;
    objc_msgSend(v9, "_lockupDictionaryForRequest:includingKeys:withCompletionBlock:", v10, v11, v12);

  }
}

uint64_t __PKLookupAppStoreApplication_block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  PKAMSLookupItem *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = -[PKAMSLookupItem initWithDict:]([PKAMSLookupItem alloc], "initWithDict:", v3);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __PKLookupAppStoreApplication_block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result;

  result = objc_msgSend(a4, "isCanceled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

@end

@implementation PKLookupAppStoreApplications

id __PKLookupAppStoreApplications_block_invoke(uint64_t a1, void *a2)
{
  return _PKCreateASCLookupRequestForStoreID(a2, 0);
}

void __PKLookupAppStoreApplications_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
  v9[2] = __PKLookupAppStoreApplications_block_invoke_3;
  v9[3] = &unk_1E3E618A0;
  v10 = v5;
  v11 = v6;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __PKLookupAppStoreApplications_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __PKLookupAppStoreApplications_block_invoke_4(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)a1[4];
  v11 = a1[5];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __PKLookupAppStoreApplications_block_invoke_5;
  v16[3] = &unk_1E3E65708;
  v12 = a1[6];
  v19 = v9;
  v20 = v12;
  v17 = v7;
  v18 = v8;
  v13 = v8;
  v14 = v9;
  v15 = v7;
  objc_msgSend(v10, "_cacheLockupsWithRequests:withCompletionBlock:", v11, v16);

}

void __PKLookupAppStoreApplications_block_invoke_5(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __PKLookupAppStoreApplications_block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a2, "isCanceled") & 1) == 0)
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "containsObject:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(a1 + 40);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __PKLookupAppStoreApplications_block_invoke_7;
      v12[3] = &unk_1E3E64280;
      v11 = *(_QWORD *)(a1 + 48);
      v13 = *(id *)(a1 + 56);
      v15 = v8;
      v14 = v7;
      objc_msgSend(v9, "_lockupDictionaryForRequest:includingKeys:withCompletionBlock:", v10, v11, v12);

    }
    else
    {
      (*((void (**)(id, id, _QWORD))v8 + 2))(v8, v7, 0);
    }
  }

}

uint64_t __PKLookupAppStoreApplications_block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  PKAMSLookupItem *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = -[PKAMSLookupItem initWithDict:]([PKAMSLookupItem alloc], "initWithDict:", v4);

  objc_msgSend(v3, "safelyAddObject:", v5);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __PKLookupAppStoreApplications_block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  id v6;

  if ((objc_msgSend(a4, "isCanceled") & 1) == 0)
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  }
}

@end

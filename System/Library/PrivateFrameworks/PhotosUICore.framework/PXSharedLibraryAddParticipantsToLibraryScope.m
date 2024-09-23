@implementation PXSharedLibraryAddParticipantsToLibraryScope

void __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Canceled by the user: Add Participants", v5, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v3 = a1[4];
  PXSharedLibraryUserCanceledErrorWithDebugDescription(CFSTR("Add Participants"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, a1[5]);

}

void __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v4)(id, _QWORD, id);
  id v5;

  v5 = a2;
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v4)
    v4[2](v4, 0, v5);

}

void __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_290(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint8_t buf[16];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    PLSharedLibraryGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Adding Participants Failed", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Adding Participants Failed"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_293;
    v8[3] = &unk_1E513DE18;
    v5 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v9 = v3;
    v10 = v6;
    v11 = *(id *)(a1 + 48);
    v7 = v3;
    PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(v4, v5, v8);

  }
}

void __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_2_294(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint8_t buf[16];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    PLSharedLibraryGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Adding Participants Failed: Too Many", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", *MEMORY[0x1E0CD1D80], 6011, CFSTR("Simulated Error: Adding Participants Failed: Too Many"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_297;
    v8[3] = &unk_1E513DE18;
    v5 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v9 = v3;
    v10 = v6;
    v11 = *(id *)(a1 + 48);
    v7 = v3;
    PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(v4, v5, v8);

  }
}

void __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_2_298(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  void *v12;
  id *v13;
  id *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v9 = *(_QWORD *)(a1 + 64);
  if (!*(_BYTE *)(*(_QWORD *)(v9 + 8) + 24))
  {
    if ((a2 & 1) != 0)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_4;
      v17[3] = &unk_1E513DEE0;
      v10 = *(_QWORD *)(a1 + 72);
      v23 = v9;
      v24 = v10;
      v11 = &v18;
      v12 = *(void **)(a1 + 40);
      v18 = *(id *)(a1 + 32);
      v13 = &v21;
      v21 = *(id *)(a1 + 56);
      v14 = &v19;
      v19 = v7;
      v20 = *(id *)(a1 + 40);
      v22 = *(id *)(a1 + 48);
      _PublishLibraryScope(v12, v17);

    }
    else
    {
      v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v16 = *(void **)(a1 + 32);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_3;
      v25[3] = &unk_1E513DE18;
      v11 = &v27;
      v27 = *(id *)(a1 + 48);
      v13 = &v26;
      v26 = v8;
      v14 = &v28;
      v28 = *(id *)(a1 + 56);
      PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(v15, v16, v25);
    }

  }
}

uint64_t __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

void __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_5;
    v9[3] = &unk_1E513DEB8;
    v10 = v5;
    v14 = *(id *)(a1 + 56);
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 64);
    v13 = v6;
    PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(v7, v8, v9);

  }
}

void __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[16];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 64);
    if (v2)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, 1, 0);
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    PLSharedLibraryGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_ERROR, "Publishing library scope after adding participants failed, deleting the added participants.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 48), "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_299;
    v10[3] = &unk_1E5148D08;
    v11 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 40);
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_2_300;
    v6[3] = &unk_1E513DE90;
    v8 = *(id *)(a1 + 72);
    v7 = *(id *)(a1 + 56);
    v9 = *(id *)(a1 + 64);
    objc_msgSend(v4, "performChanges:completionHandler:", v10, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
}

void __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_299(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD15E8], "changeRequestForLibraryScope:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeParticipants:", *(_QWORD *)(a1 + 40));

}

void __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_2_300(id *a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_3_301;
  block[3] = &unk_1E513DE68;
  v12 = a2;
  v10 = a1[5];
  v8 = a1[4];
  v11 = a1[6];
  v9 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_3_301(uint64_t a1)
{
  uint64_t v1;

  v1 = 32;
  if (!*(_BYTE *)(a1 + 64))
    v1 = 40;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + v1), *(_QWORD *)(a1 + 56));
}

uint64_t __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_297(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

uint64_t __PXSharedLibraryAddParticipantsToLibraryScope_block_invoke_293(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

@end

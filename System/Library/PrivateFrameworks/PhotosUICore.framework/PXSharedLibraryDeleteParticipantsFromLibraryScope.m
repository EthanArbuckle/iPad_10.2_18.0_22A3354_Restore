@implementation PXSharedLibraryDeleteParticipantsFromLibraryScope

void __PXSharedLibraryDeleteParticipantsFromLibraryScope_block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Canceled by the user: Delete Participants", v5, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    PXSharedLibraryUserCanceledErrorWithDebugDescription(CFSTR("Delete Participants"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

void __PXSharedLibraryDeleteParticipantsFromLibraryScope_block_invoke_316(uint64_t a1)
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
  uint8_t buf[16];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    PLSharedLibraryGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Deleting Participants Failed", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Deleting Participants Failed"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __PXSharedLibraryDeleteParticipantsFromLibraryScope_block_invoke_319;
    v8[3] = &unk_1E5148CE0;
    v5 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v9 = v3;
    v10 = v6;
    v7 = v3;
    PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(v4, v5, v8);

  }
}

void __PXSharedLibraryDeleteParticipantsFromLibraryScope_block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v7 = *(void **)(a1 + 32);
    if ((a2 & 1) != 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __PXSharedLibraryDeleteParticipantsFromLibraryScope_block_invoke_4;
      v9[3] = &unk_1E5148A40;
      v8 = &v10;
      v10 = *(id *)(a1 + 40);
      PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(v6, v7, v9);
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __PXSharedLibraryDeleteParticipantsFromLibraryScope_block_invoke_3;
      v11[3] = &unk_1E5148CE0;
      v8 = &v13;
      v13 = *(id *)(a1 + 40);
      v12 = v5;
      PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(v6, v7, v11);

    }
  }

}

uint64_t __PXSharedLibraryDeleteParticipantsFromLibraryScope_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __PXSharedLibraryDeleteParticipantsFromLibraryScope_block_invoke_4(uint64_t a1)
{
  uint64_t result;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __PXSharedLibraryDeleteParticipantsFromLibraryScope_block_invoke_319(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

@end

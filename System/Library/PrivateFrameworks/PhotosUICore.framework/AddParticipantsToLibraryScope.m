@implementation AddParticipantsToLibraryScope

void ___AddParticipantsToLibraryScope_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v2 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___AddParticipantsToLibraryScope_block_invoke_2;
  v11[3] = &unk_1E513DD20;
  v3 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v11);
  v6 = v2;
  v7 = 3221225472;
  v8 = ___AddParticipantsToLibraryScope_block_invoke_3;
  v9 = &unk_1E513DD20;
  v4 = *(void **)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v6);
  objc_msgSend(MEMORY[0x1E0CD15E8], "changeRequestForLibraryScope:", *(_QWORD *)(a1 + 56), v6, v7, v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addParticipants:", *(_QWORD *)(a1 + 40));

}

void ___AddParticipantsToLibraryScope_block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  char v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD17A8], "fetchParticipantsWithLocalIdentifiers:options:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(id *)(a1 + 48);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 72);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_END, v11, "AddParticipants", ", buf, 2u);
  }

  PLSharedLibraryGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a2)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 56), "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v14;
      v29 = 2114;
      v30 = v15;
      v16 = "Did add participants: %{public}@ to library scope with identifier: %{public}@";
      v17 = v13;
      v18 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
      _os_log_impl(&dword_1A6789000, v17, v18, v16, buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 56), "localIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v15;
    v29 = 2112;
    v30 = v5;
    v16 = "Failed to add participants to library scope with identifier: %{public}@, error: %@";
    v17 = v13;
    v18 = OS_LOG_TYPE_ERROR;
    goto LABEL_9;
  }

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = ___AddParticipantsToLibraryScope_block_invoke_279;
  v22[3] = &unk_1E5144238;
  v19 = *(id *)(a1 + 64);
  v24 = v5;
  v25 = v19;
  v26 = a2;
  v23 = v8;
  v20 = v5;
  v21 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v22);

}

uint64_t ___AddParticipantsToLibraryScope_block_invoke_279(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t ___AddParticipantsToLibraryScope_block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

void ___AddParticipantsToLibraryScope_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CD17B0], "creationRequestForShareParticipantWithEmailAddress:permission:", a2, 3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v5, "placeholderForCreatedShareParticipant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void ___AddParticipantsToLibraryScope_block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CD17B0], "creationRequestForShareParticipantWithPhoneNumber:permission:", a2, 3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v5, "placeholderForCreatedShareParticipant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

@end

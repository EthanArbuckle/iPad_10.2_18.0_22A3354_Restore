@implementation CreateLibraryScope

void ___CreateLibraryScope_block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_InvitationTitle"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD15E8], "creationRequestForOwnedLibraryScopeInPreviewStateWithTitle:", v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeholderForCreatedLibraryScope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = (void *)a1[4];
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = ___CreateLibraryScope_block_invoke_2;
  v16[3] = &unk_1E513DD20;
  v10 = v7;
  v17 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v16);
  v11 = (void *)a1[5];
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = ___CreateLibraryScope_block_invoke_3;
  v14[3] = &unk_1E513DD20;
  v15 = v10;
  v12 = v10;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);
  objc_msgSend(v2, "addParticipants:", v12);

}

void ___CreateLibraryScope_block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_END, v8, "CreateLibraryScope", ", buf, 2u);
  }

  PLSharedLibraryGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543362;
      v23 = v11;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Did create library scope with identifier: %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "librarySpecificFetchOptions");
    v10 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CD15E0];
    v26[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchLibraryScopesWithLocalIdentifiers:options:", v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v23 = v16;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Failed to create library scope with identifier: %{public}@, error: %@", buf, 0x16u);
    }
    v15 = 0;
  }

  v17 = *(void **)(a1 + 48);
  if (v17)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___CreateLibraryScope_block_invoke_453;
    block[3] = &unk_1E5145688;
    v21 = v17;
    v19 = v15;
    v20 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t ___CreateLibraryScope_block_invoke_453(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void ___CreateLibraryScope_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CD17B0], "creationRequestForShareParticipantWithEmailAddress:permission:", a2, 3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeholderForCreatedShareParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void ___CreateLibraryScope_block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CD17B0], "creationRequestForShareParticipantWithPhoneNumber:permission:", a2, 3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeholderForCreatedShareParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end

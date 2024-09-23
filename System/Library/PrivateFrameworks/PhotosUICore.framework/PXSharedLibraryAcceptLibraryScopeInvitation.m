@implementation PXSharedLibraryAcceptLibraryScopeInvitation

uint64_t __PXSharedLibraryAcceptLibraryScopeInvitation_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __PXSharedLibraryAcceptLibraryScopeInvitation_block_invoke_220(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __PXSharedLibraryAcceptLibraryScopeInvitation_block_invoke_223(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __PXSharedLibraryAcceptLibraryScopeInvitation_block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, char, void *);
  void *v13;
  id v14;
  id v15;

  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if ((a2 & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(__int16 *)(a1 + 56);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __PXSharedLibraryAcceptLibraryScopeInvitation_block_invoke_3;
    v13 = &unk_1E5148348;
    v15 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 32);
    _MarkSharedAssetsForLibraryScopeIfNecessary(v6, v7, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(*(id *)(a1 + 40), "addChild:withPendingUnitCount:", v8, 1, v10, v11, v12, v13);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v5);
  }

}

void __PXSharedLibraryAcceptLibraryScopeInvitation_block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if ((a2 & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __PXSharedLibraryAcceptLibraryScopeInvitation_block_invoke_4;
    v8[3] = &unk_1E51417E8;
    v6 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    _AcceptLibraryScope(v6, v8);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v5);
  }

}

void __PXSharedLibraryAcceptLibraryScopeInvitation_block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

@end

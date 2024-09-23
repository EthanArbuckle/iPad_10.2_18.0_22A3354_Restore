@implementation PXSharedLibraryPreviewLibraryScopeInvitation

uint64_t __PXSharedLibraryPreviewLibraryScopeInvitation_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __PXSharedLibraryPreviewLibraryScopeInvitation_block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  __int16 v15;

  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if ((a2 & 1) != 0)
  {
    v6 = *(__int16 *)(a1 + 72);
    v7 = *(void **)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __PXSharedLibraryPreviewLibraryScopeInvitation_block_invoke_3;
    v11[3] = &unk_1E513DC08;
    v14 = *(id *)(a1 + 64);
    v12 = *(id *)(a1 + 32);
    v15 = *(_WORD *)(a1 + 72);
    v13 = *(id *)(a1 + 56);
    _UpdateRulesForLibraryScope(v7, v6, 0, v8, v9, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v11);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 64);
    if (v10)
      (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v5);
  }

}

void __PXSharedLibraryPreviewLibraryScopeInvitation_block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if ((a2 & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(__int16 *)(a1 + 56);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __PXSharedLibraryPreviewLibraryScopeInvitation_block_invoke_4;
    v10[3] = &unk_1E51417E8;
    v11 = *(id *)(a1 + 48);
    _MarkSharedAssetsForLibraryScopeIfNecessary(v6, v7, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(*(id *)(a1 + 40), "addChild:withPendingUnitCount:", v8, 1);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v5);
  }

}

void __PXSharedLibraryPreviewLibraryScopeInvitation_block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
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

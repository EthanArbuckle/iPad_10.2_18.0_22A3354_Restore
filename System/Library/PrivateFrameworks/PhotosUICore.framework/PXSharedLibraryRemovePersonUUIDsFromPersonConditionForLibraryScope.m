@implementation PXSharedLibraryRemovePersonUUIDsFromPersonConditionForLibraryScope

uint64_t __PXSharedLibraryRemovePersonUUIDsFromPersonConditionForLibraryScope_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __PXSharedLibraryRemovePersonUUIDsFromPersonConditionForLibraryScope_block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD15E8], "changeRequestForLibraryScope:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAutoSharePolicy:", 2);
  objc_msgSend(v2, "updateWithCustomRules:", *(_QWORD *)(a1 + 40));

}

void __PXSharedLibraryRemovePersonUUIDsFromPersonConditionForLibraryScope_block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __PXSharedLibraryRemovePersonUUIDsFromPersonConditionForLibraryScope_block_invoke_4;
    block[3] = &unk_1E5146308;
    v9 = v6;
    v10 = a2;
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __PXSharedLibraryRemovePersonUUIDsFromPersonConditionForLibraryScope_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

@end

@implementation CreateOrPublishLibraryScope

void ___CreateOrPublishLibraryScope_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ___CreateOrPublishLibraryScope_block_invoke_2;
    v7[3] = &unk_1E5144D60;
    v6 = v3;
    v8 = v6;
    objc_msgSend(v5, "performChanges:", v7);
    _FinishAssistantForSharedLibrary(v6, *(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 72), *(void **)(a1 + 56), *(void **)(a1 + 64));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t ___CreateOrPublishLibraryScope_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSharedLibrary:", *(_QWORD *)(a1 + 32));
}

@end

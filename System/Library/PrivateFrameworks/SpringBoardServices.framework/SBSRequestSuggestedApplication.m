@implementation SBSRequestSuggestedApplication

void __SBSRequestSuggestedApplication_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __SBSRequestSuggestedApplication_block_invoke_2;
  v6[3] = &unk_1E288D2E8;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __SBSRequestSuggestedApplication_block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  else
    return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

@end

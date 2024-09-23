@implementation SFAppleIDClientCopyMyAppleID

uint64_t __SFAppleIDClientCopyMyAppleID_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  objc_msgSend(a2, "appleID");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = NSErrorToOSStatus();

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, v7, v8);
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __SFAppleIDClientCopyMyAppleID_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(unsigned int *)(a1 + 40));
}

@end

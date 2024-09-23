@implementation SFAppleIDClientCopyCertificate

uint64_t __SFAppleIDClientCopyCertificate_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = NSErrorToOSStatus();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, a2, v5);
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __SFAppleIDClientCopyCertificate_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(unsigned int *)(a1 + 40));
}

@end

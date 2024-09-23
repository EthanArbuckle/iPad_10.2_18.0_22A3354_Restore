@implementation PXDebugEnumerateInterestingNumbersToLocalize

uint64_t __PXDebugEnumerateInterestingNumbersToLocalize_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "integerValue"), a4);
}

@end

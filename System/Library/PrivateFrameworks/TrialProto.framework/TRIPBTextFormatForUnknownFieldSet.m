@implementation TRIPBTextFormatForUnknownFieldSet

uint64_t __TRIPBTextFormatForUnknownFieldSet_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%d: %llu\n"), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
}

uint64_t __TRIPBTextFormatForUnknownFieldSet_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%d: 0x%X\n"), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
}

uint64_t __TRIPBTextFormatForUnknownFieldSet_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%d: 0x%llX\n"), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
}

@end

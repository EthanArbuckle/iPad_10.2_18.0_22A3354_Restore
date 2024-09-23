@implementation PCSFPCreateUniqueID

void __PCSFPCreateUniqueID_block_invoke(uint64_t a1, const void *a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2);
}

void __PCSFPCreateUniqueID_block_invoke_2(uint64_t a1, const void *a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2);
}

void __PCSFPCreateUniqueID_block_invoke_3(uint64_t a1, int a2, void *value)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), value);
}

@end

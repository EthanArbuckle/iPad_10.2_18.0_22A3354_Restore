@implementation PCSFPCopyPublicIdentities

void __PCSFPCopyPublicIdentities_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(const void **)(a3 + 16));
}

@end

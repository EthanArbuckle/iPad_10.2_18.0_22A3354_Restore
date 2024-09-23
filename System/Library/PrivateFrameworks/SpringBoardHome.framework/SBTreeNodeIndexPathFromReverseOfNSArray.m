@implementation SBTreeNodeIndexPathFromReverseOfNSArray

uint64_t ___SBTreeNodeIndexPathFromReverseOfNSArray_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "unsignedIntegerValue");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * (*(_QWORD *)(a1 + 40) + ~a3)) = result;
  return result;
}

@end

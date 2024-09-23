@implementation PXCMMHasSendAndReceiveCapabilities

uint64_t __PXCMMHasSendAndReceiveCapabilities_block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2 == 2;
  return result;
}

@end

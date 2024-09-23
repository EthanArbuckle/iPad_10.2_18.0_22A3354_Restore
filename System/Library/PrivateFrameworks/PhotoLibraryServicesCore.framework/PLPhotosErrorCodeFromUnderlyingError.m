@implementation PLPhotosErrorCodeFromUnderlyingError

uint64_t __PLPhotosErrorCodeFromUnderlyingError_block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

@end

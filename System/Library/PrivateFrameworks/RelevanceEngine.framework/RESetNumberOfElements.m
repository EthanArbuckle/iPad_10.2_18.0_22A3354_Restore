@implementation RESetNumberOfElements

uint64_t __RESetNumberOfElements_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = REMaxElementCount;
  if ((unint64_t)REMaxElementCount <= *(_QWORD *)(result + 32))
    v1 = *(_QWORD *)(result + 32);
  REMaxElementCount = v1;
  return result;
}

@end

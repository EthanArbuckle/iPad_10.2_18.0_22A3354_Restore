@implementation CESizeDeserialization

uint64_t __CESizeDeserialization_block_invoke(uint64_t result)
{
  ++**(_QWORD **)(result + 32);
  return result;
}

@end

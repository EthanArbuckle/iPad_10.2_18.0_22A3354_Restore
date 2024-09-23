@implementation FilterFields

BOOL __FilterFields_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "foreignReferenceType") == 0;
}

@end

@implementation UPOrderedKeysForValues

BOOL __UPOrderedKeysForValues_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:") == 1;
}

@end

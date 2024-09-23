@implementation TSWPGetListNumberTypeForString

uint64_t __TSWPGetListNumberTypeForString_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t result;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 4);
  v1 = 0;
  do
  {
    result = objc_msgSend(v0, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v1), TSWPStringFromTSWPListNumberType(v1));
    v1 = (v1 + 1);
  }
  while ((_DWORD)v1 != 62);
  TSWPGetListNumberTypeForString::listNames = (uint64_t)v0;
  return result;
}

@end

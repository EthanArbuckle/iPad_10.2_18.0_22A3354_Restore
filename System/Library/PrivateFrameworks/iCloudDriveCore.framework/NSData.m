@implementation NSData

void __57__NSData_BRCCryptographicAdditions__brc_generateBogusKey__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v2 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)brc_generateBogusKey_key;
  brc_generateBogusKey_key = v0;

}

@end

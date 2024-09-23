@implementation ConsumerSecret

void ___ConsumerSecret_block_invoke()
{
  void *v0;
  uint64_t i;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 40; ++i)
    objc_msgSend(v0, "appendFormat:", CFSTR("%c"), dword_2173B6D80[i]);
  v2 = (void *)_ConsumerSecret_ConsumerSecretString;
  _ConsumerSecret_ConsumerSecretString = (uint64_t)v0;

}

@end

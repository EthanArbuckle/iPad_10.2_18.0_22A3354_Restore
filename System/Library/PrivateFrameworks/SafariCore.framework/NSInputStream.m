@implementation NSInputStream

void __53__NSInputStream_SafariCoreExtras__safari_readAllData__block_invoke(uint64_t a1)
{
  free(*(void **)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "close");
}

@end

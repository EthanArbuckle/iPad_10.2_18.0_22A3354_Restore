@implementation MapImageNameNumberAware

void __MapImageNameNumberAware_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA0F64A8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MapImageNameNumberAware_sDigitAwareSet;
  MapImageNameNumberAware_sDigitAwareSet = v0;

}

@end

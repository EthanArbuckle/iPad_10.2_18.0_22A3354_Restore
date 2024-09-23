@implementation HKSHUICurrentDevice

void __HKSHUICurrentDevice_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_2;
  _MergedGlobals_2 = v0;

}

@end

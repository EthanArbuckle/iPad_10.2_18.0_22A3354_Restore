@implementation STMGestaltTotalDiskCapacity

void __STMGestaltTotalDiskCapacity_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)MGCopyAnswer();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BED86C0]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)STMGestaltTotalDiskCapacity_totalDiskCapacity;
  STMGestaltTotalDiskCapacity_totalDiskCapacity = v0;

}

@end

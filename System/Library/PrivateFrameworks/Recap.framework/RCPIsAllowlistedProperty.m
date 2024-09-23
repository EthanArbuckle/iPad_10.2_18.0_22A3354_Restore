@implementation RCPIsAllowlistedProperty

void ___RCPIsAllowlistedProperty_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("DeviceOpenedByEventSystem"), CFSTR("LastActivityTimestamp"), CFSTR("BatchInterval"), CFSTR("PreserveTimestamp"), CFSTR("BKReadyToReceivePointerEvents"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_RCPIsAllowlistedProperty_propertyNames;
  _RCPIsAllowlistedProperty_propertyNames = v0;

}

@end

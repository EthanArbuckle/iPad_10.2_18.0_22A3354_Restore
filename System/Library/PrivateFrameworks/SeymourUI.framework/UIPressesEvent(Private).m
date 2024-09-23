@implementation UIPressesEvent(Private)

- (uint64_t)smu_triggeringPhysicalButtonPressType
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_triggeringPhysicalButton");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "type");

  return v2;
}

@end

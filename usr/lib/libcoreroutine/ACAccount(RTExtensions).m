@implementation ACAccount(RTExtensions)

- (uint64_t)coreRoutineDataclassEnabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "provisionedDataclasses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsObject:", *MEMORY[0x1E0C8F3A0]);

  return v2;
}

@end

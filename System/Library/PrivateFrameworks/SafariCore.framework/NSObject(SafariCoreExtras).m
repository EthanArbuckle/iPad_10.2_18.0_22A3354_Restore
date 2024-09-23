@implementation NSObject(SafariCoreExtras)

- (void)safari_postKVONotificationsForKey:()SafariCoreExtras aroundBlock:
{
  void (**v6)(_QWORD);
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "willChangeValueForKey:", v7);
  v6[2](v6);

  objc_msgSend(a1, "didChangeValueForKey:", v7);
}

- (uint64_t)safari_isNSBoolean
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

@end

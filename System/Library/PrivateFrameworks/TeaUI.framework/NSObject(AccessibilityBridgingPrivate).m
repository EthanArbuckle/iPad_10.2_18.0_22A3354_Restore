@implementation NSObject(AccessibilityBridgingPrivate)

- (void)ts_axSetBoolValue:()AccessibilityBridgingPrivate forKey:
{
  id v6;
  const void *v7;
  id v8;

  v6 = a4;
  v7 = (const void *)objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v7, v8, (void *)0x301);

}

- (uint64_t)ts_axBoolValueForKey:()AccessibilityBridgingPrivate
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_getAssociatedObject(a1, (const void *)objc_msgSend(v4, "hash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BOOL)ts_axHasValueForKey:()AccessibilityBridgingPrivate
{
  id v4;
  void *v5;

  v4 = a3;
  objc_getAssociatedObject(a1, (const void *)objc_msgSend(v4, "hash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

@end

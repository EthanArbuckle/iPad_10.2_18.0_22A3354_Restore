@implementation NSObject(AccessibilityBridging)

- (id)ts_accessibilityLeafDescendants
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1048], "defaultVoiceOverOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityLeafDescendantsWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v2, "axSafelyAddObjectsFromArray:", v4);
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

- (uint64_t)_accessibilityUsesFixFor72070946
{
  return 0;
}

@end

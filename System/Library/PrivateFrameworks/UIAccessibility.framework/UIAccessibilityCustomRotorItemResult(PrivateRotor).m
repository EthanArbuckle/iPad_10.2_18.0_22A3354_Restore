@implementation UIAccessibilityCustomRotorItemResult(PrivateRotor)

- (void)setTargetNSRange:()PrivateRotor
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("targetNSRange"));

}

- (uint64_t)targetNSRange
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("targetNSRange"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "rangeValue");
  else
    v3 = 0x7FFFFFFFLL;

  return v3;
}

@end

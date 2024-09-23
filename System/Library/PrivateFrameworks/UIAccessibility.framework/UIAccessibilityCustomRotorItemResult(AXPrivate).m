@implementation UIAccessibilityCustomRotorItemResult(AXPrivate)

- (uint64_t)setTargetTextMarkerRange:()AXPrivate
{
  return objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", a3, CFSTR("targetTextMarkerRange"));
}

- (uint64_t)targetTextMarkerRange
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("targetTextMarkerRange"));
}

- (void)initWithTargetElement:()AXPrivate targetRange:targetTextMarkerRange:
{
  id v8;
  void *v9;

  v8 = a5;
  v9 = (void *)objc_msgSend(a1, "initWithTargetElement:targetRange:", a3, a4);
  objc_msgSend(v9, "setTargetTextMarkerRange:", v8);

  return v9;
}

@end

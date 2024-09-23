@implementation NSObject(SVAXElementOcclusion)

- (uint64_t)svax_shouldBeOccluded
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;

  objc_msgSend(a1, "accessibilityContainer");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    return 0;
  v3 = (void *)v2;
  while ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(v3, "accessibilityContainer");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
    if (!v4)
      return 0;
  }
  v6 = objc_msgSend(v3, "shouldOccludeAccessibilityElement:", a1);

  return v6;
}

@end

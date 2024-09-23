@implementation AXRemoteElement(UIAccessibilityElementTraversal)

- (uint64_t)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:
{
  id v8;
  id v9;
  uint64_t v10;
  objc_super v12;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(a1, "onClientSide"))
  {
    v12.receiver = a1;
    v12.super_class = (Class)&off_1EE49DBE8;
    v10 = (uint64_t)objc_msgSendSuper2(&v12, sel__accessibilityEnumerateSiblingsWithParent_options_usingBlock_, a3, v8, v9);
  }
  else
  {
    if (a3)
      *a3 = 0;
    v10 = 1;
  }

  return v10;
}

@end

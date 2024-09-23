@implementation UIAccessibilityControlCenterElementShouldIncludeOpenModuleAction

uint64_t __UIAccessibilityControlCenterElementShouldIncludeOpenModuleAction_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end

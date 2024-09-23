@implementation UINavigationItem(ScrollToEdge)

- (uint64_t)ob_applyAutomaticScrollToEdgeBehavior
{
  return objc_msgSend(a1, "ob_applyAutomaticScrollToEdgeBehaviorWithDistance:", 16.0);
}

- (uint64_t)ob_applyAutomaticScrollToEdgeBehaviorWithDistance:()ScrollToEdge
{
  uint64_t result;

  result = objc_msgSend(a1, "_isManualScrollEdgeAppearanceEnabled");
  if ((result & 1) == 0)
  {
    objc_msgSend(a1, "_setAutoScrollEdgeTransitionDistance:", a2);
    return objc_msgSend(a1, "_setManualScrollEdgeAppearanceEnabled:", 1);
  }
  return result;
}

@end

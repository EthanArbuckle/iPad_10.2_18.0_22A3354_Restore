@implementation UIWindowScene

uint64_t __92__UIWindowScene_UIAccessibilityElementTraversal___accessibilityTraversalWindowsWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "level");
  v6 = v5;
  objc_msgSend(v4, "level");
  v8 = v7;

  if (v8 <= v6)
    v9 = 0;
  else
    v9 = -1;
  if (v8 < v6)
    return 1;
  else
    return v9;
}

@end

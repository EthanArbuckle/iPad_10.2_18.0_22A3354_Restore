@implementation UIButtonConfiguration

id __56__UIButtonConfiguration_IC__ic_plainButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  if (UIAccessibilityButtonShapesEnabled())
    objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E5C71EE0, *MEMORY[0x1E0DC1248]);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

@end

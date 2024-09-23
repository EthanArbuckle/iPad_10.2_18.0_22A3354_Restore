@implementation UITraitCollectionFromThemeKey

uint64_t ___UITraitCollectionFromThemeKey_block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setUserInterfaceStyle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(a2, "setUserInterfaceIdiom:", *(_QWORD *)(a1 + 40));
  objc_msgSend(a2, "setAccessibilityContrast:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(a2, "setDisplayGamut:", *(unsigned __int8 *)(a1 + 57));
  return objc_msgSend(a2, "setUserInterfaceLevel:", *(_QWORD *)(a1 + 48) == 1);
}

@end

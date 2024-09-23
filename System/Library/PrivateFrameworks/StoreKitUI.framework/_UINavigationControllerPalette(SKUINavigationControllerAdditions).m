@implementation _UINavigationControllerPalette(SKUINavigationControllerAdditions)

- (void)SKUI_beginHidingPaletteShadow
{
  void *v2;
  uint64_t v3;
  const void *v4;
  void *v5;

  objc_getAssociatedObject(a1, (const void *)_SKUINavigationControllerAssociatedObjectKeyPaletteShadowHidden);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  v4 = (const void *)_SKUINavigationControllerAssociatedObjectKeyPaletteShadowHidden;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3 + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v4, v5, (void *)1);

  if (!v3)
    objc_msgSend(a1, "setPaletteShadowIsHidden:", 1);
}

- (void)SKUI_endHidingPaletteShadow
{
  void *v2;
  uint64_t v3;
  const void *v4;
  void *v5;
  id v6;

  objc_getAssociatedObject(a1, (const void *)_SKUINavigationControllerAssociatedObjectKeyPaletteShadowHidden);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  if (v3)
  {
    v4 = (const void *)_SKUINavigationControllerAssociatedObjectKeyPaletteShadowHidden;
    v5 = (void *)(v3 - 1);
    if (v3 == 1)
    {
      objc_setAssociatedObject(a1, (const void *)_SKUINavigationControllerAssociatedObjectKeyPaletteShadowHidden, v5, (void *)1);
      objc_msgSend(a1, "setPaletteShadowIsHidden:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(a1, v4, v6, (void *)1);

    }
  }
}

@end

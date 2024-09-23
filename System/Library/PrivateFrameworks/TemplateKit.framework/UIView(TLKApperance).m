@implementation UIView(TLKApperance)

- (void)tlk_updateWithCurrentAppearance
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v7 = v3;
      objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqual:", v4) & 1) != 0)
      {
        +[TLKAppearance bestAppearanceForView:](TLKAppearance, "bestAppearanceForView:", a1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "tlk_updateForAppearance:", v5);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3E88], "setCurrentTraitCollection:", v7);
        +[TLKAppearance bestAppearanceForView:](TLKAppearance, "bestAppearanceForView:", a1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "tlk_updateForAppearance:", v6);

        objc_msgSend(MEMORY[0x1E0DC3E88], "setCurrentTraitCollection:", v4);
      }

      v3 = v7;
    }

  }
}

@end

@implementation UINavigationItem(Bridge)

- (void)ts_setBottomPaletteWithContentView:()Bridge
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4290]), "initWithContentView:", v5);
    objc_msgSend(a1, "_setBottomPalette:", v4);

  }
  else
  {
    objc_msgSend(a1, "_setBottomPalette:", 0);
  }

}

- (void)ts_setBottomPaletteMinimumHeight:()Bridge
{
  id v3;

  objc_msgSend(a1, "_bottomPalette");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMinimumHeight:", a2);

}

- (void)ts_setBottomPalettePreferredHeight:()Bridge
{
  id v3;

  objc_msgSend(a1, "_bottomPalette");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferredHeight:", a2);

}

@end

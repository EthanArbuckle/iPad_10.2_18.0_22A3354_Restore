@implementation UINavigationController(Bridge)

- (void)ts_setTopPaletteShadowHidden:()Bridge
{
  id v4;

  objc_msgSend(a1, "existingPaletteForEdge:", 2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaletteShadowIsHidden:", a3);

}

- (void)ts_setPaletteBackgroundHidden:()Bridge
{
  void *v4;
  double v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "existingPaletteForEdge:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (a3)
    v5 = 0.0;
  else
    v5 = 1.0;
  objc_msgSend(v4, "_backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

}

- (void)ts_setPaletteBlurthroughBackground
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "existingPaletteForEdge:", 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3F50], "ts_sideBarEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithEffect:", v3);
  objc_msgSend(v5, "_setBackgroundView:", v4);

  objc_msgSend(a1, "_setPreferredNavigationBarPosition:", 2);
}

- (void)ts_setNavigationBarBackgroundHidden:()Bridge
{
  void *v4;
  double v5;
  id v6;

  objc_msgSend(a1, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v5 = 1.0;
  if (a3)
    v5 = 0.0;
  objc_msgSend(v4, "_setBackgroundOpacity:", v5);

}

@end

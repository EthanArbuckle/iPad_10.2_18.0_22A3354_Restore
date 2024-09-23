@implementation UIToolbar(Bridge)

- (void)ts_setBlurthroughBackground
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3F50], "ts_sideBarEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundEffects:", v3);

}

- (id)ts_barButtonViews
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__UIToolbar_Bridge__ts_barButtonViews__block_invoke;
  v6[3] = &unk_1E6309630;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

- (void)ts_setTransparentBackground
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(a1, "_setBackgroundView:", v2);

}

@end

@implementation UIView(Bridge)

- (BOOL)ts_safeAreaWidthExceedsReadableWidth
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  BOOL v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  objc_msgSend(a1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "horizontalSizeClass") == 1)
  {

LABEL_4:
    objc_msgSend(a1, "safeAreaInsets");
    v6 = v5 <= 0.0;
    return !v6;
  }
  objc_msgSend(a1, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verticalSizeClass");

  if (v4 == 1)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0DC1350], "_readableWidth");
  v8 = ceil(v7 * 0.125) * -8.0;
  objc_msgSend(a1, "safeAreaLayoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutFrame");
  v11 = v10;
  objc_msgSend(a1, "safeAreaInsets");
  v13 = v11 - v12;
  objc_msgSend(a1, "safeAreaInsets");
  v15 = v13 - v14;

  v6 = v15 + v8 <= 88.0;
  return !v6;
}

- (void)ts_setPlusDCompositingFilter
{
  uint64_t v1;
  id v2;

  v1 = *MEMORY[0x1E0CD2E98];
  objc_msgSend(a1, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompositingFilter:", v1);

}

- (void)ts_setPlusLCompositingFilter
{
  uint64_t v1;
  id v2;

  v1 = *MEMORY[0x1E0CD2EA0];
  objc_msgSend(a1, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompositingFilter:", v1);

}

@end

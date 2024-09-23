@implementation UIView(CACUIAdditions)

- (id)cac_snapshot
{
  void *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(MEMORY[0x24BEBD620], "defaultFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BEBD618]);
  objc_msgSend(a1, "bounds");
  v7 = (void *)objc_msgSend(v4, "initWithSize:format:", v3, v5, v6);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__UIView_CACUIAdditions__cac_snapshot__block_invoke;
  v10[3] = &unk_24F2AD548;
  v10[4] = a1;
  objc_msgSend(v7, "imageWithActions:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end

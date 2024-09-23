@implementation UIButton(SBPIPVibrancyEffects)

- (void)SBPIP_updateVibrancyEffectForTintColorWithFilter:()SBPIPVibrancyEffects
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(a1, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAdjustsImageWhenDisabled:", objc_msgSend(v4, "SBPIP_wantsVibrancyEffect") ^ 1);

  objc_msgSend(a1, "imageForState:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "tintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTintColor:", v7);

    objc_msgSend(a1, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "SBPIP_updateVibrancyEffectForTintColorWithFilter:", v13);

  }
  objc_msgSend(a1, "titleForState:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "tintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v11);

    objc_msgSend(a1, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "SBPIP_updateVibrancyEffectForTintColorWithFilter:", v13);

  }
}

- (void)SBPIP_removeVibrancyEffect
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "imageForState:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "imageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "SBPIP_removeVibrancyEffect");

  }
  objc_msgSend(a1, "titleForState:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "titleLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "SBPIP_removeVibrancyEffect");

  }
}

@end

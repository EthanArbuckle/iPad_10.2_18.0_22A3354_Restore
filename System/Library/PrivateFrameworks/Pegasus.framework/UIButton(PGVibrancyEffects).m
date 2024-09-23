@implementation UIButton(PGVibrancyEffects)

- (void)PG_updateVibrancyEffectForTintColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a1, "tintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAdjustsImageWhenDisabled:", objc_msgSend(v2, "PG_wantsVibrancyEffect") ^ 1);

  objc_msgSend(a1, "imageForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTintColor:", v5);

    objc_msgSend(a1, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PG_updateVibrancyEffectForTintColor");

  }
  objc_msgSend(a1, "titleForState:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v9);

    objc_msgSend(a1, "titleLabel");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "PG_updateVibrancyEffectForTintColor");

  }
}

- (void)PG_removeVibrancyEffect
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
    objc_msgSend(v3, "PG_removeVibrancyEffect");

  }
  objc_msgSend(a1, "titleForState:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "titleLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "PG_removeVibrancyEffect");

  }
}

@end

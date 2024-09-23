@implementation UIImageView(PGVibrancyEffects)

- (id)PG_updateVibrancyEffectForTintColor
{
  void *v2;
  int v3;
  objc_super v5;

  objc_msgSend(a1, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "PG_wantsVibrancyEffect");

  if (!v3)
    return (id)objc_msgSend(a1, "PG_removeVibrancyEffect");
  v5.receiver = a1;
  v5.super_class = (Class)&off_1EEEF5CF0;
  return objc_msgSendSuper2(&v5, sel_PG_updateVibrancyEffectForTintColor);
}

@end

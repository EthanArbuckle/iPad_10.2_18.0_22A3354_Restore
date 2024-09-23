@implementation UILabel(PGVibrancyEffects)

- (uint64_t)PG_updateVibrancyEffectForTintColor
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&off_1EEEF4ED8;
  objc_msgSendSuper2(&v3, sel_PG_updateVibrancyEffectForTintColor);
  return objc_msgSend(a1, "_setTextColorFollowsTintColor:", 1);
}

- (id)PG_removeVibrancyEffect
{
  objc_super v3;

  objc_msgSend(a1, "_setTextColorFollowsTintColor:", 0);
  v3.receiver = a1;
  v3.super_class = (Class)&off_1EEEF4ED8;
  return objc_msgSendSuper2(&v3, sel_PG_removeVibrancyEffect);
}

@end

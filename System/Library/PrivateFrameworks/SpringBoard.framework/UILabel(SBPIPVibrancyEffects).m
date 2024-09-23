@implementation UILabel(SBPIPVibrancyEffects)

- (uint64_t)SBPIP_updateVibrancyEffectForTintColorWithFilter:()SBPIPVibrancyEffects
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)UILabel_0;
  objc_msgSendSuper2(&v3, sel_SBPIP_updateVibrancyEffectForTintColorWithFilter_);
  return objc_msgSend(a1, "_setTextColorFollowsTintColor:", 1);
}

- (id)SBPIP_removeVibrancyEffect
{
  objc_super v3;

  objc_msgSend(a1, "_setTextColorFollowsTintColor:", 0);
  v3.receiver = a1;
  v3.super_class = (Class)UILabel_0;
  return objc_msgSendSuper2(&v3, sel_SBPIP_removeVibrancyEffect);
}

@end

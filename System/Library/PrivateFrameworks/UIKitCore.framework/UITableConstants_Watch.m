@implementation UITableConstants_Watch

+ (id)sharedConstants
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)sharedConstants___sharedConstants_4;
  if (!sharedConstants___sharedConstants_4)
  {
    v3 = objc_opt_new();
    v4 = (void *)sharedConstants___sharedConstants_4;
    sharedConstants___sharedConstants_4 = v3;

    v2 = (void *)sharedConstants___sharedConstants_4;
  }
  return v2;
}

- (BOOL)useChromelessSectionHeadersAndFootersForTableStyle:(int64_t)a3
{
  return 0;
}

- (int64_t)defaultHeaderFooterPinningBehaviorForTableStyle:(int64_t)a3
{
  return 0;
}

- (_UITableConstantsBackgroundProperties)defaultHeaderFooterBackgroundPropertiesForTableViewStyle:(SEL)a3 cellConfigurationState:(int64_t)a4 traitCollection:(id)a5 floating:(id)a6
{
  _UITableConstantsBackgroundProperties *result;

  +[UIColor blackColor](UIColor, "blackColor", a4, a5, a6, a7);
  result = (_UITableConstantsBackgroundProperties *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  retstr->var13.trailing = 0.0;
  retstr->var1 = result;
  return result;
}

- (id)defaultCheckmarkImageForCell:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.PepperUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("UIPreferencesBlueCheck"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithRenderingMode:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end

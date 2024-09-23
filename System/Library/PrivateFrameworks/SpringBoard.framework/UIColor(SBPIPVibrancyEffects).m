@implementation UIColor(SBPIPVibrancyEffects)

- (BOOL)SBPIP_wantsVibrancyEffect
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", 0, 0, 0, &v2);
  return v2 < 1.0 && v2 > 0.0;
}

@end

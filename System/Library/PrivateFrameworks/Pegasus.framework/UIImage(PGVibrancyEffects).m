@implementation UIImage(PGVibrancyEffects)

- (BOOL)PG_wantsVibrancyEffect
{
  return objc_msgSend(a1, "renderingMode") != 1;
}

@end

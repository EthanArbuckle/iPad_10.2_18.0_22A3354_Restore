@implementation PXFocalDistanceFormatter

- (PXFocalDistanceFormatter)init
{
  PXFocalDistanceFormatter *v2;
  PXFocalDistanceFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXFocalDistanceFormatter;
  v2 = -[PXFocalDistanceFormatter init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PXFocalDistanceFormatter setPositiveFormat:](v2, "setPositiveFormat:", CFSTR("0.## mm"));
    -[PXFocalDistanceFormatter setNegativeFormat:](v3, "setNegativeFormat:", CFSTR("-0.## mm"));
    -[PXFocalDistanceFormatter setUsesGroupingSeparator:](v3, "setUsesGroupingSeparator:", 0);
    -[PXFocalDistanceFormatter setGeneratesDecimalNumbers:](v3, "setGeneratesDecimalNumbers:", 0);
    -[PXFocalDistanceFormatter setAlwaysShowsDecimalSeparator:](v3, "setAlwaysShowsDecimalSeparator:", 0);
    -[PXFocalDistanceFormatter setAllowsFloats:](v3, "setAllowsFloats:", 1);
  }
  return v3;
}

@end

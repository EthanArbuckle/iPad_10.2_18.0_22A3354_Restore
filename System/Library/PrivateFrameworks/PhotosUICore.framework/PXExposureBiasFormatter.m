@implementation PXExposureBiasFormatter

- (PXExposureBiasFormatter)init
{
  PXExposureBiasFormatter *v2;
  PXExposureBiasFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXExposureBiasFormatter;
  v2 = -[PXExposureBiasFormatter init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PXExposureBiasFormatter setPositiveFormat:](v2, "setPositiveFormat:", CFSTR("0.0 ev"));
    -[PXExposureBiasFormatter setNegativeFormat:](v3, "setNegativeFormat:", CFSTR("-0.0 ev"));
    -[PXExposureBiasFormatter setMinimumFractionDigits:](v3, "setMinimumFractionDigits:", 0);
    -[PXExposureBiasFormatter setMaximumFractionDigits:](v3, "setMaximumFractionDigits:", 1);
  }
  return v3;
}

@end

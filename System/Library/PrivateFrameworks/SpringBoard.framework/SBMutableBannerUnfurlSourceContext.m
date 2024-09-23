@implementation SBMutableBannerUnfurlSourceContext

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBBannerUnfurlSourceContext _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBBannerUnfurlSourceContext _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (void)setCornerRadius:(double)a3
{
  self->super._cornerRadius = a3;
}

- (void)setReferenceCoordinateSpaceBounds:(CGRect)a3
{
  self->super._referenceCoordinateSpaceBounds = a3;
}

- (void)setReferenceFrame:(CGRect)a3
{
  self->super._referenceFrame = a3;
}

- (void)setReferenceVelocity:(CGPoint)a3
{
  self->super._referenceVelocity = a3;
}

@end

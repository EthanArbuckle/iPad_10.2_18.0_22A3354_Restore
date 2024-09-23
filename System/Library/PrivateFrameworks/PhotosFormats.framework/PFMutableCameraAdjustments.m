@implementation PFMutableCameraAdjustments

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PFCameraAdjustments initWithAdjustments:]([PFCameraAdjustments alloc], "initWithAdjustments:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAdjustments:", self);
}

- (void)setEffectFilterName:(id)a3
{
  NSString *v4;
  NSString *effectFilterName;

  if (self->super._effectFilterName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    effectFilterName = self->super._effectFilterName;
    self->super._effectFilterName = v4;

  }
}

- (void)setPortraitEffectFilterName:(id)a3
{
  NSString *v4;
  NSString *portraitEffectFilterName;

  if (self->super._portraitEffectFilterName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    portraitEffectFilterName = self->super._portraitEffectFilterName;
    self->super._portraitEffectFilterName = v4;

  }
}

- (void)setPortraitMetadata:(id)a3
{
  AVApplePortraitMetadata *v5;
  AVApplePortraitMetadata **p_portraitMetadata;
  AVApplePortraitMetadata *portraitMetadata;
  AVApplePortraitMetadata *v8;

  v5 = (AVApplePortraitMetadata *)a3;
  portraitMetadata = self->super._portraitMetadata;
  p_portraitMetadata = &self->super._portraitMetadata;
  if (portraitMetadata != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_portraitMetadata, a3);
    v5 = v8;
  }

}

- (void)setDepthEnabled:(BOOL)a3
{
  if (self->super._depthEnabled != a3)
    self->super._depthEnabled = a3;
}

- (void)setSloMoEnabled:(BOOL)a3
{
  if (self->super._sloMoEnabled != a3)
    self->super._sloMoEnabled = a3;
}

- (void)setIsEligibleForCinematicAudioEffectProcessing:(BOOL)a3
{
  if (self->super._isEligibleForCinematicAudioEffectProcessing != a3)
    self->super._isEligibleForCinematicAudioEffectProcessing = a3;
}

- (void)setCinematicVideoRenderingVersion:(unint64_t)a3
{
  if (self->super._cinematicVideoRenderingVersion != a3)
    self->super._cinematicVideoRenderingVersion = a3;
}

- (void)setCropRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->super._cropRect))
  {
    self->super._cropRect.origin.x = x;
    self->super._cropRect.origin.y = y;
    self->super._cropRect.size.width = width;
    self->super._cropRect.size.height = height;
  }
}

@end

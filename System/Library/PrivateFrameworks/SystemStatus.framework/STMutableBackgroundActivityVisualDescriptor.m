@implementation STMutableBackgroundActivityVisualDescriptor

- (void)setSystemImageName:(id)a3
{
  NSString *v4;
  NSString *systemImageName;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    systemImageName = self->super._systemImageName;
    self->super._systemImageName = v4;

  }
}

- (void)setImageName:(id)a3
{
  NSString *v4;
  NSString *imageName;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    imageName = self->super._imageName;
    self->super._imageName = v4;

  }
}

- (void)setPackageName:(id)a3
{
  NSString *v4;
  NSString *packageName;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    packageName = self->super._packageName;
    self->super._packageName = v4;

  }
}

- (void)setTextLabel:(id)a3
{
  NSString *v4;
  NSString *textLabel;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    textLabel = self->super._textLabel;
    self->super._textLabel = v4;

  }
}

- (void)setBackgroundColorRepresentation:(id)a3
{
  STBackgroundActivityVisualDescriptorColorRepresentation **p_backgroundColorRepresentation;
  id v5;

  p_backgroundColorRepresentation = &self->super._backgroundColorRepresentation;
  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_backgroundColorRepresentation, a3);

}

- (void)setVerticalOffsetInPixels:(double)a3
{
  if (self->super._verticalOffsetInPixels != a3)
    self->super._verticalOffsetInPixels = a3;
}

- (void)setFontSizeAdjustment:(double)a3
{
  if (self->super._fontSizeAdjustment != a3)
    self->super._fontSizeAdjustment = a3;
}

- (void)setPrefersToKeepContentVisible:(BOOL)a3
{
  if (self->super._prefersToKeepContentVisible != a3)
    self->super._prefersToKeepContentVisible = a3;
}

- (void)setPreferredVisualEffectName:(id)a3
{
  __CFString *v4;
  NSString *v5;
  NSString *preferredVisualEffectName;
  __CFString *v7;

  v4 = (__CFString *)a3;
  if (!v4)
    v4 = CFSTR("none");
  v7 = v4;
  if ((BSEqualObjects() & 1) == 0)
  {
    v5 = (NSString *)-[__CFString copy](v7, "copy");
    preferredVisualEffectName = self->super._preferredVisualEffectName;
    self->super._preferredVisualEffectName = v5;

  }
}

- (void)setPreferredContinuousAnimationName:(id)a3
{
  __CFString *v4;
  NSString *v5;
  NSString *preferredContinuousAnimationName;
  __CFString *v7;

  v4 = (__CFString *)a3;
  if (!v4)
    v4 = CFSTR("pulseBackground");
  v7 = v4;
  if ((BSEqualObjects() & 1) == 0)
  {
    v5 = (NSString *)-[__CFString copy](v7, "copy");
    preferredContinuousAnimationName = self->super._preferredContinuousAnimationName;
    self->super._preferredContinuousAnimationName = v5;

  }
}

- (void)setCrossfadableActivities:(id)a3
{
  NSSet *v4;
  NSSet *crossfadableActivities;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSSet *)objc_msgSend(v6, "copy");
    crossfadableActivities = self->super._crossfadableActivities;
    self->super._crossfadableActivities = v4;

  }
}

- (void)setPrefersToSuppressPulse:(BOOL)a3
{
  __CFString **v4;
  void *v5;
  int v6;

  v4 = STBackgroundActivityContinuousAnimationNone;
  if (!a3)
  {
    -[STBackgroundActivityVisualDescriptor preferredContinuousAnimationName](self, "preferredContinuousAnimationName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", CFSTR("none"));

    if (!v6)
      return;
    v4 = STBackgroundActivityContinuousAnimationPulseBackground;
  }
  -[STMutableBackgroundActivityVisualDescriptor setPreferredContinuousAnimationName:](self, "setPreferredContinuousAnimationName:", *v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  _copyValuesFromDescriptorToDescriptor(self, v4);
  return v4;
}

@end

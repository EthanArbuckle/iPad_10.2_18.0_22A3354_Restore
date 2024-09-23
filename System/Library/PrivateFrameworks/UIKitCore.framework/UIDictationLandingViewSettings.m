@implementation UIDictationLandingViewSettings

+ (id)sharedInstance
{
  void *v2;
  UIDictationLandingViewSettings *v3;
  void *v4;

  v2 = (void *)gSettings;
  if (!gSettings)
  {
    v3 = objc_alloc_init(UIDictationLandingViewSettings);
    v4 = (void *)gSettings;
    gSettings = (uint64_t)v3;

    v2 = (void *)gSettings;
  }
  return v2;
}

- (UIDictationLandingViewSettings)init
{
  UIDictationLandingViewSettings *v2;
  UIDictationLandingViewSettings *v3;
  UIDictationLandingViewSettings *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIDictationLandingViewSettings;
  v2 = -[UIDictationLandingViewSettings init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIDictationLandingViewSettings setUseBlackWave:](v2, "setUseBlackWave:", 0);
    -[UIDictationLandingViewSettings setFadeInDuration:](v3, "setFadeInDuration:", 0.416);
    -[UIDictationLandingViewSettings setFadeOutDuration:](v3, "setFadeOutDuration:", 0.2);
    -[UIDictationLandingViewSettings setShrinkDuration:](v3, "setShrinkDuration:", 0.316);
    -[UIDictationLandingViewSettings setColorTransitionInDuration:](v3, "setColorTransitionInDuration:", 0.3);
    -[UIDictationLandingViewSettings setColorTransitionOutDuration:](v3, "setColorTransitionOutDuration:", 0.3);
    -[UIDictationLandingViewSettings setCircleRPM:](v3, "setCircleRPM:", 83.0);
    v4 = v3;
  }

  return v3;
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->_fadeInDuration = a3;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->_fadeOutDuration = a3;
}

- (double)shrinkDuration
{
  return self->_shrinkDuration;
}

- (void)setShrinkDuration:(double)a3
{
  self->_shrinkDuration = a3;
}

- (double)colorTransitionInDuration
{
  return self->_colorTransitionInDuration;
}

- (void)setColorTransitionInDuration:(double)a3
{
  self->_colorTransitionInDuration = a3;
}

- (double)colorTransitionOutDuration
{
  return self->_colorTransitionOutDuration;
}

- (void)setColorTransitionOutDuration:(double)a3
{
  self->_colorTransitionOutDuration = a3;
}

- (double)circleRPM
{
  return self->_circleRPM;
}

- (void)setCircleRPM:(double)a3
{
  self->_circleRPM = a3;
}

- (BOOL)useBlackWave
{
  return self->_useBlackWave;
}

- (void)setUseBlackWave:(BOOL)a3
{
  self->_useBlackWave = a3;
}

@end

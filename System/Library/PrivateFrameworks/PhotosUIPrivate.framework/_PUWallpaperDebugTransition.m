@implementation _PUWallpaperDebugTransition

- (NSObject)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_animationSettings, a3);
}

- (double)px_duration
{
  return self->_px_duration;
}

- (void)setPx_duration:(double)a3
{
  self->_px_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end

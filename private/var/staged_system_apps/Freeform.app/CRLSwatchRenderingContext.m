@implementation CRLSwatchRenderingContext

- (unint64_t)backgroundAppearance
{
  return self->_backgroundAppearance;
}

- (void)setBackgroundAppearance:(unint64_t)a3
{
  self->_backgroundAppearance = a3;
}

- (BOOL)rendersForWideGamut
{
  return self->_rendersForWideGamut;
}

- (void)setRendersForWideGamut:(BOOL)a3
{
  self->_rendersForWideGamut = a3;
}

- (BOOL)wantsToRenderHighContrastBackground
{
  return self->_wantsToRenderHighContrastBackground;
}

- (void)setWantsToRenderHighContrastBackground:(BOOL)a3
{
  self->_wantsToRenderHighContrastBackground = a3;
}

- (BOOL)wantsRoundedCornersIfAppropriate
{
  return self->_wantsRoundedCornersIfAppropriate;
}

- (void)setWantsRoundedCornersIfAppropriate:(BOOL)a3
{
  self->_wantsRoundedCornersIfAppropriate = a3;
}

@end

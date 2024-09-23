@implementation _UIPopoverPresentationMetrics

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)setShouldUseVisualStyleAnimationControllerForPresentation:(BOOL)a3
{
  self->_shouldUseVisualStyleAnimationControllerForPresentation = a3;
}

- (void)setShouldUseVisualStyleAnimationControllerForDismissal:(BOOL)a3
{
  self->_shouldUseVisualStyleAnimationControllerForDismissal = a3;
}

- (void)setShouldHideArrow:(BOOL)a3
{
  self->_shouldHideArrow = a3;
}

- (BOOL)shouldHideArrow
{
  return self->_shouldHideArrow;
}

+ (id)defaultPopoverMetrics
{
  if (qword_1ECD7D9E8 != -1)
    dispatch_once(&qword_1ECD7D9E8, &__block_literal_global_202);
  return (id)_MergedGlobals_1038;
}

- (CGSize)defaultPreferredSmallContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 320.0;
  v3 = 480.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)defaultPreferredLargeContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 375.0;
  v3 = 667.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldUseVisualStyleAnimationControllerForDismissal
{
  return self->_shouldUseVisualStyleAnimationControllerForDismissal;
}

- (BOOL)shouldUseVisualStyleAnimationControllerForPresentation
{
  return self->_shouldUseVisualStyleAnimationControllerForPresentation;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

@end

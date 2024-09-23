@implementation UIPopoverPresentationMetrics

uint64_t __54___UIPopoverPresentationMetrics_defaultPopoverMetrics__block_invoke()
{
  _UIPopoverPresentationMetrics *v0;
  void *v1;

  v0 = objc_alloc_init(_UIPopoverPresentationMetrics);
  v1 = (void *)_MergedGlobals_1038;
  _MergedGlobals_1038 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_1038, "setShouldHideArrow:", 0);
  objc_msgSend((id)_MergedGlobals_1038, "setShouldUseVisualStyleAnimationControllerForDismissal:", 0);
  objc_msgSend((id)_MergedGlobals_1038, "setShouldUseVisualStyleAnimationControllerForPresentation:", 0);
  return objc_msgSend((id)_MergedGlobals_1038, "setCornerRadius:", 0.0);
}

@end

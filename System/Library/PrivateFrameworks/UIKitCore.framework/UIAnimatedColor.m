@implementation UIAnimatedColor

void __37___UIAnimatedColor__patternCallbacks__block_invoke()
{
  LODWORD(xmmword_1ECD7A5F0) = 1;
  *((_QWORD *)&xmmword_1ECD7A5F0 + 1) = _patternCallback;
  qword_1ECD7A600 = (uint64_t)_releaseCallback;
}

uint64_t __39___UIAnimatedColor_initWithParentView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
}

void __55___UIAnimatedColor_initWithBounds_invalidationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentationValueChanged");

}

@end

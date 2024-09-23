@implementation UITextCanvasDrawWithFadedEdgesInContext

void ___UITextCanvasDrawWithFadedEdgesInContext_block_invoke()
{
  CGColorSpace *v0;
  __int128 v1;
  CGFloat components[2];
  __int128 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA18]);
  *(_OWORD *)components = xmmword_1866814D8;
  v3 = unk_1866814E8;
  v1 = xmmword_18666F250;
  _UITextCanvasDrawWithFadedEdgesInContext_leftFadeGradient = (uint64_t)CGGradientCreateWithColorComponents(v0, components, (const CGFloat *)&v1, 2uLL);
  CGColorSpaceRelease(v0);
}

@end

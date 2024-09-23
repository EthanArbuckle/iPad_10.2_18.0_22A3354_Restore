@implementation ConvertSceneRectToWindow

uint64_t __ConvertSceneRectToWindow_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isTextEffectsWindow") ^ 1;
}

@end

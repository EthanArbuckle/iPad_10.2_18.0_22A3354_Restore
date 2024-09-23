@implementation UILegibilityView

CGImage *__51___UILegibilityView_setSettings_image_shadowImage___block_invoke(void *a1)
{
  CGImage *result;
  CGImage *v2;
  size_t BitsPerPixel;

  result = (CGImage *)objc_msgSend(a1, "CGImage");
  if (result)
  {
    v2 = result;
    BitsPerPixel = CGImageGetBitsPerPixel(result);
    return (CGImage *)(BitsPerPixel == CGImageGetBitsPerComponent(v2));
  }
  return result;
}

@end

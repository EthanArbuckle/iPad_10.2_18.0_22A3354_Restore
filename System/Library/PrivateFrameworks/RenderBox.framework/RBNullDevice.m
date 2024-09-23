@implementation RBNullDevice

+ (RBNullDevice)sharedDevice
{
  unsigned __int8 v2;

  {
    +[RBNullDevice sharedDevice]::device = objc_opt_new();
  }
  return (RBNullDevice *)+[RBNullDevice sharedDevice]::device;
}

- (CGImage)renderImageInRect:(CGRect)a3 options:(id)a4 renderer:(id)a5
{
  return (CGImage *)render_image(0, a4, (uint64_t)a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)renderImageInRect:(CGRect)a3 options:(id)a4 renderer:(id)a5 completionQueue:(id)a6 handler:(id)a7
{
  render_image_async(0, a4, (uint64_t)a5, a6, (uint64_t)a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end

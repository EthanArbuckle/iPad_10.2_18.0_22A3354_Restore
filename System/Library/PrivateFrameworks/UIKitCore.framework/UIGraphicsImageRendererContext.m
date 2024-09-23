@implementation UIGraphicsImageRendererContext

- (UIImage)currentImage
{
  CGImageRef Image;
  CGImage *v4;
  void *v5;
  double v6;
  void *v7;

  Image = CGBitmapContextCreateImage(-[UIGraphicsRendererContext CGContext](self, "CGContext"));
  if (Image)
  {
    v4 = Image;
    -[UIGraphicsRendererContext format](self, "format");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_contextScale");
    if (v6 == 0.0)
      v6 = 1.0;
    +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v4, 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    CGImageRelease(v4);
  }
  else
  {
    v7 = 0;
  }
  return (UIImage *)v7;
}

@end

@implementation TSUImage

+ (TSUImage)imageWithImageData:(id)a3
{
  return (TSUImage *)objc_msgSend((id)objc_opt_class(a1), "imageWithCGImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", a3));
}

- (TSUImage)initWithImageData:(id)a3
{
  return (TSUImage *)objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithCGImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", a3));
}

@end

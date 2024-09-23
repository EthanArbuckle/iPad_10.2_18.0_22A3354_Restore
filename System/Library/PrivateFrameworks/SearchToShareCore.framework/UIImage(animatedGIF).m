@implementation UIImage(animatedGIF)

+ (id)agif_animatedImageWithAnimatedGIFData:()animatedGIF
{
  CGImageSource *v3;

  v3 = CGImageSourceCreateWithData(data, 0);
  return animatedImageWithAnimatedGIFReleasingImageSource(v3);
}

+ (id)agif_animatedImageWithAnimatedGIFURL:()animatedGIF
{
  CGImageSource *v3;

  v3 = CGImageSourceCreateWithURL(url, 0);
  return animatedImageWithAnimatedGIFReleasingImageSource(v3);
}

+ (id)agif_animatedImageWithImageInfo:()animatedGIF
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "duration");
  v5 = v4;
  v6 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(v3, "frames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "animatedImageWithImages:duration:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end

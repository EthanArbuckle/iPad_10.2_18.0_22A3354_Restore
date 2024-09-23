@implementation UIImage(PRLikenessView)

+ (uint64_t)pr_imageWithCGImage:()PRLikenessView size:scale:
{
  return objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", a6, 0, a3);
}

+ (uint64_t)pr_imageWithCGImage:()PRLikenessView
{
  return objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:");
}

+ (id)pr_imageWithCGImage:()PRLikenessView cropRect:
{
  CGImageRef v7;
  CGImage *v8;
  void *v9;

  v7 = PRImageCreateWithImageInRect(a7, a1, a2, a3, a4);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x24BDF6AC8], "pr_imageWithCGImage:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (uint64_t)pr_imageRef
{
  return objc_msgSend(objc_retainAutorelease(a1), "CGImage");
}

- (id)pr_circleImageOfDiameter:()PRLikenessView cropRect:
{
  CGImage *v10;
  CGImageRef CircularImageInRect;
  CGImage *v12;
  void *v13;

  v10 = (CGImage *)objc_msgSend(a1, "pr_imageRef");
  if (v10 && (CircularImageInRect = PRImageCreateCircularImageInRect(v10, a3, a4, a5, a6)) != 0)
  {
    v12 = CircularImageInRect;
    objc_msgSend(MEMORY[0x24BDF6AC8], "pr_imageWithCGImage:", CircularImageInRect);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v12);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (uint64_t)pr_circleImageWithCropRect:()PRLikenessView
{
  double v10;
  double v11;
  double v12;
  double v13;

  if (CGRectIsEmpty(*(CGRect *)&a2))
  {
    objc_msgSend(a1, "size");
    v11 = v10;
    objc_msgSend(a1, "size");
    if (v11 >= v12)
      v13 = v12;
    else
      v13 = v11;
  }
  else
  {
    v13 = a4;
  }
  return objc_msgSend(a1, "pr_circleImageOfDiameter:cropRect:", v13, a2, a3, a4, a5);
}

@end

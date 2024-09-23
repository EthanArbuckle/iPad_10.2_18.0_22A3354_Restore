@implementation UIImage(ACMImage)

- (uint64_t)crop:()ACMImage
{
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGImage *v18;
  CGImage *v19;
  void *v20;
  double v21;
  uint64_t v22;
  CGRect v24;

  objc_msgSend(a1, "scale");
  v11 = a2 * v10;
  objc_msgSend(a1, "scale");
  v13 = a3 * v12;
  objc_msgSend(a1, "scale");
  v15 = a4 * v14;
  objc_msgSend(a1, "scale");
  v17 = a5 * v16;
  v18 = (CGImage *)objc_msgSend(a1, "CGImage");
  v24.origin.x = v11;
  v24.origin.y = v13;
  v24.size.width = v15;
  v24.size.height = v17;
  v19 = CGImageCreateWithImageInRect(v18, v24);
  v20 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(a1, "scale");
  v22 = objc_msgSend(v20, "imageWithCGImage:scale:orientation:", v19, objc_msgSend(a1, "imageOrientation"), v21);
  CGImageRelease(v19);
  return v22;
}

@end

@implementation UIImage(Magnify)

- (id)sbf_resizedImageForCurrentMagnifyMode
{
  void *v2;
  double v3;
  BOOL v4;
  float v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  CGAffineTransform v14;

  +[SBFMagnifyMode currentMagnifyMode](SBFMagnifyMode, "currentMagnifyMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoomFactor");
  *(float *)&v3 = fabsf(*(float *)&v3 + -1.0);
  if (v2)
    v4 = *(float *)&v3 < 2.2204e-16;
  else
    v4 = 1;
  if (v4)
  {
    v11 = a1;
  }
  else
  {
    objc_msgSend(v2, "zoomFactor", v3);
    v6 = 1.0 / v5;
    objc_msgSend(a1, "size");
    v8 = v7;
    v10 = v9;
    CGAffineTransformMakeScale(&v14, v6, v6);
    objc_msgSend(a1, "sbf_resizeImageToSize:", v10 * v14.c + v14.a * v8, v10 * v14.d + v14.b * v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

@end

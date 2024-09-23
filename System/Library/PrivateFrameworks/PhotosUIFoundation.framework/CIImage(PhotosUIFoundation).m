@implementation CIImage(PhotosUIFoundation)

- (id)px_imageByApplyingAlpha:()PhotosUIFoundation
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBF658], "colorMatrixFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v8, 0, 24);
  *(double *)&v8[3] = a2;
  objc_msgSend(v4, "setDefaults");
  objc_msgSend(MEMORY[0x24BDBF690], "vectorWithValues:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAVector:", v5);

  objc_msgSend(v4, "setInputImage:", a1);
  objc_msgSend(v4, "outputImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)px_imageByApplyingScale:()PhotosUIFoundation
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGAffineTransform v9;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v12;
  CGAffineTransform v13;

  objc_msgSend(a1, "extent");
  v5 = v4;
  v7 = v6;
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeTranslation(&v13, v4 * -0.5, v6 * -0.5);
  CGAffineTransformMakeScale(&t2, a2, a2);
  t1 = v13;
  CGAffineTransformConcat(&v12, &t1, &t2);
  v13 = v12;
  CGAffineTransformMakeTranslation(&v9, v5 * a2 * 0.5, v7 * a2 * 0.5);
  t1 = v13;
  CGAffineTransformConcat(&v12, &t1, &v9);
  v13 = v12;
  objc_msgSend(a1, "imageByApplyingTransform:", &v12);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

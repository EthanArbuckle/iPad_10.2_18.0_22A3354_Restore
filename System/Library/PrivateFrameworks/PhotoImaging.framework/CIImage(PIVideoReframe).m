@implementation CIImage(PIVideoReframe)

- (id)pi_imageByApplyingStabilizationWatermark
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  CGFloat v11;
  CGFloat Height;
  void *v13;
  void *v14;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;

  if (pi_imageByApplyingStabilizationWatermark_onceToken != -1)
    dispatch_once(&pi_imageByApplyingStabilizationWatermark_onceToken, &__block_literal_global_19445);
  objc_msgSend(a1, "extent");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", pi_imageByApplyingStabilizationWatermark_dotImage);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17.origin.x = v3;
  v17.origin.y = v5;
  v17.size.width = v7;
  v17.size.height = v9;
  v11 = CGRectGetWidth(v17) * 0.5;
  v18.origin.x = v3;
  v18.origin.y = v5;
  v18.size.width = v7;
  v18.size.height = v9;
  Height = CGRectGetHeight(v18);
  CGAffineTransformMakeTranslation(&v16, v11, Height * 0.5);
  objc_msgSend(v10, "imageByApplyingTransform:", &v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "imageByCompositingOverImage:", a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end

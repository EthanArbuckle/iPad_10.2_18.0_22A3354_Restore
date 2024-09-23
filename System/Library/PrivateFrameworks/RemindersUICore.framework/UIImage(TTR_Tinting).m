@implementation UIImage(TTR_Tinting)

- (id)ttr_tintedImageWithColor:()TTR_Tinting
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGSize v17;
  CGRect v18;

  v4 = a3;
  objc_msgSend(a1, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(a1, "scale");
  v10 = v9;
  v17.width = v6;
  v17.height = v8;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v10);
  objc_msgSend(a1, "size");
  v12 = v11;
  objc_msgSend(a1, "size");
  v14 = v13;
  objc_msgSend(a1, "drawInRect:", 0.0, 0.0, v12, v13);
  objc_msgSend(v4, "set");

  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = v12;
  v18.size.height = v14;
  UIRectFillUsingBlendMode(v18, kCGBlendModeSourceAtop);
  UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v15;
}

@end

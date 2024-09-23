@implementation VignetteLayer

- (void)drawInContext:(CGContext *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  double v20;
  void *v21;
  CGContext *CurrentContext;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  CGImage *v34;
  objc_super v35;
  CGSize v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  -[VignetteLayer setMasksToBounds:](self, "setMasksToBounds:", 0);
  v35.receiver = self;
  v35.super_class = (Class)VignetteLayer;
  -[VignetteLayer drawInContext:](&v35, sel_drawInContext_, a3);
  -[VignetteLayer insets](self, "insets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[VignetteLayer bounds](self, "bounds");
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  v17 = CGRectGetWidth(v37) - v8 - v12;
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v18 = CGRectGetHeight(v38) - v6 - v10;
  v19 = (void *)MEMORY[0x24BDF6870];
  -[VignetteLayer cornerRadius](self, "cornerRadius");
  objc_msgSend(v19, "bezierPathWithRoundedRect:cornerRadius:", v8, v10, v17, v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36.width = width;
  v36.height = height;
  UIGraphicsBeginImageContext(v36);
  CurrentContext = UIGraphicsGetCurrentContext();
  v23 = objc_retainAutorelease(v21);
  CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(v23, "CGPath"));
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v24, "CGColor"));

  CGContextFillPath(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(MEMORY[0x24BDBF658], "gaussianBlurFilter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x24BDBF660];
  v28 = objc_retainAutorelease(v25);
  objc_msgSend(v27, "imageWithCGImage:", objc_msgSend(v28, "CGImage"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setValue:forKey:", v29, *MEMORY[0x24BDBF960]);

  v30 = (void *)MEMORY[0x24BDD16E0];
  -[VignetteLayer blurRadius](self, "blurRadius");
  objc_msgSend(v30, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setValue:forKey:", v31, *MEMORY[0x24BDBF978]);

  objc_msgSend(v26, "outputImage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_alloc_init(MEMORY[0x24BDBF648]);
  objc_msgSend(v32, "extent");
  v34 = (CGImage *)objc_msgSend(v33, "createCGImage:fromRect:", v32);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  CGContextDrawImage(a3, v39, v34);

}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
}

@end

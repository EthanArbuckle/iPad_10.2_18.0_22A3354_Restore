@implementation SXBorderView

- (SXBorderView)init
{
  SXBorderView *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXBorderView;
  v2 = -[SXBorderView init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXBorderView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[SXBorderView setOpaque:](v2, "setOpaque:", 0);
    -[SXBorderView setUserInteractionEnabled:](v2, "setUserInteractionEnabled:", 0);
  }
  return v2;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  id v9;
  CGFloat MinX;
  CGFloat MaxY;
  void *v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  UIImage *image;
  CGImage *v20;
  CGImage *v21;
  CGFloat v22;
  CGAffineTransform v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v24.receiver = self;
  v24.super_class = (Class)SXBorderView;
  -[SXBorderView drawRect:](&v24, sel_drawRect_);
  CurrentContext = UIGraphicsGetCurrentContext();
  -[SXBorderView backgroundColor](self, "backgroundColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v9, "CGColor"));

  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  CGContextFillRect(CurrentContext, v25);
  CGContextSaveGState(CurrentContext);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MinX = CGRectGetMinX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MaxY = CGRectGetMaxY(v27);
  CGContextTranslateCTM(CurrentContext, MinX, MaxY);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  v14 = v13;

  CGAffineTransformMakeScale(&v23, v14, v14);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v29 = CGRectApplyAffineTransform(v28, &v23);
  v15 = v29.origin.x;
  v16 = v29.origin.y;
  v17 = v29.size.width;
  v18 = v29.size.height;
  if (self)
    image = self->_image;
  else
    image = 0;
  v20 = -[UIImage CGImage](objc_retainAutorelease(image), "CGImage");
  v30.origin.x = v15;
  v30.origin.y = v16;
  v30.size.width = v17;
  v30.size.height = v18;
  v21 = CGImageCreateWithImageInRect(v20, v30);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v22 = CGRectGetWidth(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v33.size.height = CGRectGetHeight(v32);
  v33.origin.x = 0.0;
  v33.origin.y = 0.0;
  v33.size.width = v22;
  CGContextDrawImage(CurrentContext, v33, v21);
  CGImageRelease(v21);
  CGContextRestoreGState(CurrentContext);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end

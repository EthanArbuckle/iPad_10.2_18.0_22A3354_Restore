@implementation SXStrokeRenderer

- (id)initWithComponentView:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)SXStrokeRenderer;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
      objc_storeWeak(v4 + 1, v3);
  }

  return a1;
}

- (CGContext)newContextForFrame:(double)a3
{
  void *v7;
  double v8;
  double v9;
  CGFloat v10;
  CGColorSpace *DeviceRGB;
  CGContext *v12;
  void *v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  v10 = a5 * v9;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v12 = CGBitmapContextCreate(0, (unint64_t)(a4 * v9), (unint64_t)v10, 8uLL, vcvtd_n_u64_f64(a4 * v9, 2uLL), DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextTranslateCTM(v12, 0.0, v10);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = v14;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  CGContextScaleCTM(v12, v15, -v17);

  return v12;
}

- (id)imageFromContext:(uint64_t)a1
{
  CGImage *Image;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    Image = CGBitmapContextCreateImage(context);
    v3 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    objc_msgSend(v3, "imageWithCGImage:scale:orientation:", Image, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    CGImageRelease(Image);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)lineForStyle:(double)a3 andFrame:(double)a4
{
  id v11;
  void *v12;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  int v20;
  CGPath *Mutable;
  CGContext *v22;
  double v23;
  id v24;
  uint64_t v26;
  CGFloat lengths;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      WeakRetained = objc_loadWeakRetained(a1 + 1);
      objc_msgSend(WeakRetained, "unitConverter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v11, "width");
      objc_msgSend(v14, "convertValueToPoints:", v15, v16);
      v18 = v17;

      objc_msgSend(v11, "color");
      v19 = objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(v11, "style");
      v12 = (void *)v19;
    }
    else
    {
      v18 = 1.0;
      v20 = 1;
    }
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, 0.0, v18 * 0.5);
    CGPathAddLineToPoint(Mutable, 0, a5, v18 * 0.5);
    v22 = -[SXStrokeRenderer newContextForFrame:]((uint64_t)a1, a3, a4, a5, a6);
    if ((v20 & 0xFFFFFFFE) == 2)
    {
      v26 = 0;
      v23 = -[SXStrokeRenderer phaseForBorderWidth:style:borderSide:length:startingGap:]((uint64_t)a1, v20, 1, (double *)&v26, v18, a5);
      if (v20 == 2)
      {
        lengths = v18 * 3.0;
        v28 = v18 * 3.0;
        CGContextSetLineDash(v22, v23, &lengths, 2uLL);
      }
      else
      {
        lengths = 0.0;
        v28 = v18 * 3.0 + v18 * 3.0;
        CGContextSetLineDash(v22, v23, &lengths, 2uLL);
        CGContextSetLineCap(v22, kCGLineCapRound);
      }
    }
    CGContextAddPath(v22, Mutable);
    CGContextSetLineWidth(v22, v18);
    v24 = objc_retainAutorelease(v12);
    CGContextSetStrokeColorWithColor(v22, (CGColorRef)objc_msgSend(v24, "CGColor"));
    CGContextStrokePath(v22);
    CGPathRelease(Mutable);
    -[SXStrokeRenderer imageFromContext:]((uint64_t)a1, v22);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    CGContextRelease(v22);

  }
  return a1;
}

- (double)phaseForBorderWidth:(int)a3 style:(double *)a4 borderSide:(double)a5 length:(double)a6 startingGap:
{
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  float v11;
  float v12;
  float v13;

  if (!a1)
    return 0.0;
  if (a2 == 2)
    v6 = a5 * 3.0;
  else
    v6 = a5;
  v7 = v6 + v6;
  v8 = a6 / (v6 + v6) - (double)(int)(a6 / (v6 + v6));
  if (v8 >= 0.5)
    v8 = v8 + -1.0;
  v9 = v6 - v7 * v8;
  v10 = roundf(v9) * 0.5;
  if ((a3 - 1) <= 1 && v6 - v10 < a5)
  {
    if (a4)
    {
      v11 = v6 - v10;
      *a4 = floorf(v11);
    }
    v10 = v6 + v10;
  }
  v12 = v10;
  v13 = v7;
  return fmodf(roundf(v12), v13);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_componentView);
}

@end

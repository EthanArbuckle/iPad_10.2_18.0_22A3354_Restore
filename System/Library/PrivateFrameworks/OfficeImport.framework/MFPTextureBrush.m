@implementation MFPTextureBrush

- (MFPTextureBrush)initWithImage:(id)a3 wrapMode:(int)a4 transform:(CGAffineTransform *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  MFPTextureBrush *v14;
  double tx;
  float d;
  double ty;
  float a;
  void *v19;
  double v20;
  double *v21;
  __objc2_class *v22;
  int v23;
  int v24;
  double v25;
  CGContext *v26;
  int v27;
  float v28;
  int v29;
  int v30;
  double v31;
  int v32;
  CGImageRef Image;
  CGImage *v34;
  void *v35;
  float v36;
  float v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGContext *v44;
  float v45;
  float v46;
  double v47;
  double v48;
  double v49;
  char v50;
  char v51;
  double v52;
  char v53;
  char v54;
  CGImage *v55;
  double v57;
  objc_super v58;

  v8 = a3;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v8, "phoneImage"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v8, "pixelSize"),
          v12 = v11,
          v9))
    {
      tx = a5->tx;
      d = a5->d;
      ty = a5->ty;
      a = a5->a;
      v19 = (void *)MEMORY[0x22E2DDB58](v10);
      v20 = a;
      v21 = (double *)MEMORY[0x24BDBEFB0];
      v22 = OITSUPositiveZeroNumberFormatter;
      if ((a4 - 1) >= 3 && fabs(v20 + -1.0) <= 0.001 && fabs(d + -1.0) <= 0.001)
      {
        v35 = v9;
      }
      else
      {
        if ((a4 & 0xFFFFFFFE) == 2)
          v23 = 2;
        else
          v23 = 1;
        if ((a4 & 0xFFFFFFFD) == 1)
          v24 = 2;
        else
          v24 = 1;
        v25 = v12 * v20;
        v26 = TCBitmapContextCreate(v12 * v20 * (double)v24);
        v57 = ty;
        objc_msgSend(v9, "size");
        v27 = 0;
        v28 = v25;
        do
        {
          v29 = 0;
          if (v27)
            v30 = -1;
          else
            v30 = 1;
          v31 = (double)v30;
          do
          {
            if (v29)
              v32 = -1;
            else
              v32 = 1;
            objc_msgSend(v9, "drawInRect:fromRect:isFlipped:", 1, NSScaleRect2((double)(2 * (v29++ != 0)), (double)(2 * (v27 != 0)), (double)v32, v31, v28));
          }
          while (v24 != v29);
          ++v27;
        }
        while (v27 != v23);
        Image = CGBitmapContextCreateImage(v26);
        v22 = OITSUPositiveZeroNumberFormatter;
        v21 = (double *)MEMORY[0x24BDBEFB0];
        ty = v57;
        v34 = Image;
        +[OITSUImage imageWithCGImage:](OITSUImage, "imageWithCGImage:", Image);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        CGImageRelease(v34);
        CGContextRelease(v26);
      }
      v36 = tx;
      v37 = ty;
      if (v36 == 0.0 && v37 == 0.0)
      {
        v13 = v35;
      }
      else
      {
        objc_msgSend(v35, "size");
        v39 = v38;
        v41 = v40;
        v42 = *v21;
        v43 = v21[1];
        v44 = TCBitmapContextCreate(v38);
        v45 = v36 - (floor(v36 / v39) + 1.0) * v39;
        v46 = v37 - (floor(v37 / v41) + 1.0) * v41;
        v47 = v45;
        v48 = v46;
        v49 = 0.0;
        v50 = 1;
        do
        {
          v51 = v50;
          v52 = v48 + v49 * v41;
          v53 = 1;
          v49 = 0.0;
          do
          {
            v54 = v53;
            objc_msgSend(v35, "drawInRect:fromRect:isFlipped:", 1, v47 + v49 * v39, v52, v39, v41, v42, v43, v39, v41);
            v53 = 0;
            v49 = 1.0;
          }
          while ((v54 & 1) != 0);
          v50 = 0;
        }
        while ((v51 & 1) != 0);
        v55 = CGBitmapContextCreateImage(v44);
        objc_msgSend(&v22[38], "imageWithCGImage:", v55);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        CGImageRelease(v55);
        CGContextRelease(v44);
      }
      v58.receiver = self;
      v58.super_class = (Class)MFPTextureBrush;
      self = -[MFPImageBrush initWithPhoneImage:](&v58, sel_initWithPhoneImage_, v13);
      objc_autoreleasePoolPop(v19);
    }
    else
    {
      v13 = 0;
    }
    self = self;

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end

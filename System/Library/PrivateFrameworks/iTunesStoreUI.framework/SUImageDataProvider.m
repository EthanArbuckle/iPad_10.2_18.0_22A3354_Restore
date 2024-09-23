@implementation SUImageDataProvider

- (void)dealloc
{
  objc_super v3;

  -[SUImageDataProvider setFillColor:](self, "setFillColor:", 0);
  -[SUImageDataProvider setModifier:](self, "setModifier:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUImageDataProvider;
  -[SUImageDataProvider dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUImageDataProvider;
  v4 = -[ISDataProvider copyWithZone:](&v8, sel_copyWithZone_, a3);
  v4[14] = -[SUImageDataProvider fillColor](self, "fillColor");
  -[SUImageDataProvider finalSize](self, "finalSize");
  v4[15] = v5;
  v4[16] = v6;
  v4[18] = -[SUImageDataProvider modifier](self, "modifier");
  return v4;
}

- (unint64_t)hash
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return -[NSString hash](NSStringFromClass(v2), "hash");
}

- (BOOL)isEqual:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[UIColor isEqual:](-[SUImageDataProvider fillColor](self, "fillColor"), "isEqual:", objc_msgSend(a3, "fillColor"))&& (-[SUImageDataProvider finalSize](self, "finalSize"), v6 = v5, v8 = v7, objc_msgSend(a3, "finalSize"), v6 == v10)&& v8 == v9)
  {
    return -[SUImageModifier isEqual:](-[SUImageDataProvider modifier](self, "modifier"), "isEqual:", objc_msgSend(a3, "modifier"));
  }
  else
  {
    return 0;
  }
}

- (id)newImageFromImage:(id)a3
{
  id v3;
  SUImageModifier *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  double v14;
  double v15;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v17;
  UIColor *v18;
  uint32_t v19;
  void *v20;
  double v21;
  double v22;
  float v23;
  CGContext *v24;
  CGContext *v25;
  CGImage *v26;
  CGImageRef Image;
  CGImage *v28;
  CGAffineTransform v30;
  CGRect v31;
  double v32;
  double v33;
  CGRect v34;

  if (!a3)
    return 0;
  v3 = a3;
  v5 = -[SUImageDataProvider modifier](self, "modifier");
  v6 = v3;
  if (v5)
  {

    v3 = -[SUImageModifier newImageForImage:](v5, "newImageForImage:", v3);
  }
  -[SUImageDataProvider finalSize](self, "finalSize");
  v8 = v7;
  v10 = v9;
  v32 = v7;
  v33 = v9;
  v31.origin = (CGPoint)*MEMORY[0x24BDBF090];
  objc_msgSend(v3, "size");
  v31.size.width = v11;
  v31.size.height = v12;
  if (v8 == *MEMORY[0x24BDBF148] && v10 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    objc_msgSend(v3, "size");
    v32 = v14;
    v33 = v15;
  }
  -[SUImageDataProvider _getFinalSize:imageFrame:forImage:withModifier:](self, "_getFinalSize:imageFrame:forImage:withModifier:", &v32, &v31, v3, v5);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    v17 = DeviceRGB;
    v18 = -[SUImageDataProvider fillColor](self, "fillColor");
    if (!v18 || v18 == (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "clearColor"))
      v19 = 8194;
    else
      v19 = 8198;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
    v22 = v21;
    *(float *)&v21 = v21 * v33;
    v23 = v22 * v32;
    v24 = CGBitmapContextCreate(0, vcvtps_u32_f32(v23), vcvtps_u32_f32(*(float *)&v21), 8uLL, (vcvtd_n_u64_f64(ceilf(v23), 3uLL) + 31) & 0xFFFFFFFFFFFFFFE0, v17, v19);
    if (v24)
    {
      v25 = v24;
      CGContextSetInterpolationQuality(v24, kCGInterpolationHigh);
      CGContextSetFillColorSpace(v25, v17);
      CGContextScaleCTM(v25, v22, v22);
      CGAffineTransformMakeScale(&v30, v22, v22);
      CGContextSetBaseCTM();
      if (v18)
      {
        CGContextSetFillColorWithColor(v25, -[UIColor CGColor](v18, "CGColor"));
        CGContextSetCompositeOperation();
        v34.size.width = v32;
        v34.size.height = v33;
        v34.origin.x = 0.0;
        v34.origin.y = 0.0;
        CGContextFillRect(v25, v34);
      }
      -[SUImageModifier drawBeforeImageForContext:imageFrame:finalSize:](v5, "drawBeforeImageForContext:imageFrame:finalSize:", v25, *(_OWORD *)&v31.origin, v31.size.width, v31.size.height, v32, v33);
      v26 = (CGImage *)objc_msgSend(v3, "CGImage");
      CGContextDrawImage(v25, v31, v26);
      -[SUImageModifier drawAfterImageForContext:imageFrame:finalSize:](v5, "drawAfterImageForContext:imageFrame:finalSize:", v25, *(_OWORD *)&v31.origin, v31.size.width, v31.size.height, v32, v33);
      Image = CGBitmapContextCreateImage(v25);
      if (Image)
      {
        v28 = Image;
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", Image, 0, v22);
        CGImageRelease(v28);
      }
      else
      {
        v20 = 0;
      }
      CFRelease(v25);
    }
    else
    {
      v20 = 0;
    }
    CGColorSpaceRelease(v17);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  CGImageSource *v5;
  CGImageSource *v6;
  CGImageRef ImageAtIndex;
  CGImage *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  BOOL v13;

  v5 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (!v5)
    return 0;
  v6 = v5;
  if (CGImageSourceGetCount(v5) && (ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, 0)) != 0)
  {
    v8 = ImageAtIndex;
    -[SUImageDataProvider inputImageScale](self, "inputImageScale");
    if (v9 >= 0.00000011920929)
      v10 = v9;
    else
      v10 = 1.0;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", v8, 0, v10);
    v12 = -[SUImageDataProvider newImageFromImage:](self, "newImageFromImage:", v11);
    if (!v12)
      v12 = v11;
    -[ISDataProvider setOutput:](self, "setOutput:", v12);

    CGImageRelease(v8);
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }
  CFRelease(v6);
  return v13;
}

- (void)_getFinalSize:(CGSize *)a3 imageFrame:(CGRect *)a4 forImage:(id)a5 withModifier:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v28;
  float v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;

  width = a3->width;
  height = a3->height;
  x = a4->origin.x;
  y = a4->origin.y;
  v15 = a4->size.width;
  v14 = a4->size.height;
  if (objc_msgSend(a6, "scalesImage"))
  {
    v16 = a6;
    v17 = width;
    v18 = height;
LABEL_16:
    objc_msgSend(v16, "finalSizeForSize:originalSize:", v17, v18, width, height);
    v20 = v33;
    v22 = v34;
    objc_msgSend(a6, "imageFrameForImage:currentFrame:finalSize:", a5, x, y, v15, v14, v33, v34);
    x = v35;
    y = v36;
    v15 = v37;
    v14 = v38;
    goto LABEL_17;
  }
  if (a6)
  {
    objc_msgSend(a6, "finalSizeForSize:originalSize:", width, height, width, height);
    v20 = v19;
    v22 = v21;
    objc_msgSend(a6, "imageFrameForImage:currentFrame:finalSize:", a5, x, y, v15, v14, v19, v21);
    x = v23;
    y = v24;
    v15 = v25;
    v14 = v26;
  }
  else
  {
    v22 = height;
    v20 = width;
  }
  if (v20 == *MEMORY[0x24BDBF148] && v22 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    objc_msgSend(a5, "size");
    v20 = v31;
    v22 = v32;
    if (!a6)
      goto LABEL_17;
LABEL_15:
    v16 = a6;
    v17 = v20;
    v18 = v22;
    goto LABEL_16;
  }
  v28 = v22 / v14;
  if (v22 / v14 >= v20 / v15)
    v28 = v20 / v15;
  v29 = v14 * v28;
  v14 = ceilf(v29);
  v30 = v15 * v28;
  v15 = ceilf(v30);
  if (a6)
    goto LABEL_15;
LABEL_17:
  a3->width = v20;
  a3->height = v22;
  a4->origin.x = x;
  a4->origin.y = y;
  a4->size.width = v15;
  a4->size.height = v14;
}

- (UIColor)fillColor
{
  return (UIColor *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFillColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (CGSize)finalSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_finalSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setFinalSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_finalSize, &v3, 16, 1, 0);
}

- (double)inputImageScale
{
  return self->_inputImageScale;
}

- (void)setInputImageScale:(double)a3
{
  self->_inputImageScale = a3;
}

- (SUImageModifier)modifier
{
  return (SUImageModifier *)objc_getProperty(self, a2, 144, 1);
}

- (void)setModifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

@end

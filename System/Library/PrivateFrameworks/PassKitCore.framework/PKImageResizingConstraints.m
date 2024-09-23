@implementation PKImageResizingConstraints

- (PKImageResizingConstraints)init
{
  PKImageResizingConstraints *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKImageResizingConstraints;
  v2 = -[PKImageResizingConstraints init](&v4, sel_init);
  if (v2)
    v2->_outputScale = PKScreenScale();
  return v2;
}

- (void)setOutputScale:(double)a3
{
  if (a3 == 0.0)
    a3 = PKScreenScale();
  self->_outputScale = a3;
}

+ (id)constraintsWithFixedWidth:(double)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5
{
  PKImageResizingConstraints *v8;

  v8 = objc_alloc_init(PKImageResizingConstraints);
  v8->_constraintType = 0;
  v8->_fixedDimension = a3;
  v8->_minAspectRatio = a4;
  v8->_maxAspectRatio = a5;
  v8->_respectAspectRatioRange = 1;
  return v8;
}

+ (id)constraintsWithFixedHeight:(double)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5
{
  PKImageResizingConstraints *v8;

  v8 = objc_alloc_init(PKImageResizingConstraints);
  v8->_constraintType = 1;
  v8->_fixedDimension = a3;
  v8->_minAspectRatio = a4;
  v8->_maxAspectRatio = a5;
  v8->_respectAspectRatioRange = 1;
  return v8;
}

+ (id)constraintsWithFixedLargeDimenstion:(double)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5
{
  PKImageResizingConstraints *v8;

  v8 = objc_alloc_init(PKImageResizingConstraints);
  v8->_constraintType = 2;
  v8->_fixedDimension = a3;
  v8->_minAspectRatio = a4;
  v8->_maxAspectRatio = a5;
  v8->_respectAspectRatioRange = 1;
  return v8;
}

+ (id)constraintsWithFixedSmallDimenstion:(double)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5
{
  PKImageResizingConstraints *v8;

  v8 = objc_alloc_init(PKImageResizingConstraints);
  v8->_constraintType = 3;
  v8->_fixedDimension = a3;
  v8->_minAspectRatio = a4;
  v8->_maxAspectRatio = a5;
  v8->_respectAspectRatioRange = 1;
  return v8;
}

+ (id)constraintsWithMaxSize:(CGSize)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5
{
  CGFloat height;
  CGFloat width;
  PKImageResizingConstraints *v9;

  height = a3.height;
  width = a3.width;
  v9 = objc_alloc_init(PKImageResizingConstraints);
  v9->_constraintType = 6;
  v9->_size.width = width;
  v9->_size.height = height;
  v9->_minAspectRatio = a4;
  v9->_maxAspectRatio = a5;
  v9->_respectAspectRatioRange = 1;
  return v9;
}

+ (id)constraintsWithMinSize:(CGSize)a3 minAspectRatio:(double)a4 maxAspectRatio:(double)a5
{
  CGFloat height;
  CGFloat width;
  PKImageResizingConstraints *v9;

  height = a3.height;
  width = a3.width;
  v9 = objc_alloc_init(PKImageResizingConstraints);
  v9->_constraintType = 7;
  v9->_size.width = width;
  v9->_size.height = height;
  v9->_minAspectRatio = a4;
  v9->_maxAspectRatio = a5;
  v9->_respectAspectRatioRange = 1;
  return v9;
}

+ (id)constraintsWithMaxSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  PKImageResizingConstraints *v5;

  height = a3.height;
  width = a3.width;
  v5 = objc_alloc_init(PKImageResizingConstraints);
  v5->_constraintType = 6;
  v5->_size.width = width;
  v5->_size.height = height;
  return v5;
}

+ (id)constraintsWithMinSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  PKImageResizingConstraints *v5;

  height = a3.height;
  width = a3.width;
  v5 = objc_alloc_init(PKImageResizingConstraints);
  v5->_constraintType = 7;
  v5->_size.width = width;
  v5->_size.height = height;
  return v5;
}

+ (id)constraintsWithAspectFillToSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  PKImageResizingConstraints *v5;

  height = a3.height;
  width = a3.width;
  v5 = objc_alloc_init(PKImageResizingConstraints);
  v5->_constraintType = 4;
  v5->_size.width = width;
  v5->_size.height = height;
  return v5;
}

+ (id)constraintsWithAspectFitToSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  PKImageResizingConstraints *v5;

  height = a3.height;
  width = a3.width;
  v5 = objc_alloc_init(PKImageResizingConstraints);
  v5->_constraintType = 5;
  v5->_size.width = width;
  v5->_size.height = height;
  return v5;
}

- (id)resizedImage:(id)a3
{
  id v4;
  PKImage *v5;
  CGContext *BitmapContext;
  CGContext *v7;
  id v8;
  CGImage *v9;
  CGImage *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double outputCornerRadius;
  id v20;
  const CGPath *v21;
  CGImageRef Image;
  _BOOL4 outputMirrored;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  double v28;
  double v29;
  CGRect v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;
  CGRect v34;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(&v30, 0, sizeof(v30));
  v28 = 0.0;
  v29 = 0.0;
  v5 = 0;
  if (-[PKImageResizingConstraints getPixelCropRect:pixelOutputSize:forImage:](self, "getPixelCropRect:pixelOutputSize:forImage:", &v30, &v28, v4))
  {
    BitmapContext = _CreateBitmapContext(0, 0, 0, v28, v29, 1.0);
    if (!BitmapContext)
      goto LABEL_11;
    v7 = BitmapContext;
    v8 = objc_retainAutorelease(v4);
    v9 = (CGImage *)objc_msgSend(v8, "imageRef");
    v10 = CGImageCreateWithImageInRect(v9, v30);
    -[PKImageResizingConstraints _getDrawRectForImage:withOutputSize:](self, "_getDrawRectForImage:withOutputSize:", v10, v28, v29);
    v15 = v14;
    v16 = v11;
    v17 = v12;
    v18 = v13;
    outputCornerRadius = self->_outputCornerRadius;
    if (outputCornerRadius > 0.0)
    {
      +[PKRoundedPath pathWithRoundedRect:cornerRadius:](PKRoundedPath, "pathWithRoundedRect:cornerRadius:", v15, v11, v12, v13, outputCornerRadius * self->_outputScale);
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = (const CGPath *)objc_msgSend(v20, "CGPath");

      CGContextBeginPath(v7);
      CGContextAddPath(v7, v21);
      CGContextClosePath(v7);
      CGContextClip(v7);
    }
    if (v10)
    {
      v34.origin.x = v15;
      v34.origin.y = v16;
      v34.size.width = v17;
      v34.size.height = v18;
      CGContextDrawImage(v7, v34, v10);
      CFRelease(v10);
    }
    Image = CGBitmapContextCreateImage(v7);
    CFRelease(v7);
    if (Image)
    {
      outputMirrored = self->_outputMirrored;
      v24 = objc_msgSend(v8, "orientation");
      v25 = v24;
      if (outputMirrored)
      {
        if ((unint64_t)(v24 - 1) > 7)
          v25 = 0;
        else
          v25 = qword_190453C40[v24 - 1];
      }
      v5 = -[PKImage initWithCGImage:scale:orientation:]([PKImage alloc], "initWithCGImage:scale:orientation:", Image, v25, self->_outputScale);
      CFRelease(Image);
    }
    else
    {
LABEL_11:
      PKLogFacilityTypeGetObject(0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v32 = v4;
        _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "PKImageResizingConstraints: failed to resize image %p - could not create destination context.", buf, 0xCu);
      }

      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)getPixelCropRect:(CGRect *)a3 pixelOutputSize:(CGSize *)a4 forImage:(id)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  char v23;

  v8 = a5;
  if ((unint64_t)(objc_msgSend(v8, "orientation") - 1) > 3)
  {
    -[PKImageResizingConstraints _flippedConstraints](self, "_flippedConstraints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v8, "scale");
    v22 = v21;

    v23 = objc_msgSend(v16, "_getPixelCropRect:pixelOutputSize:forImageSize:scale:", a3, a4, v18, v20, v22);
    return v23;
  }
  else
  {
    objc_msgSend(v8, "size");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v8, "scale");
    v14 = v13;

    return -[PKImageResizingConstraints _getPixelCropRect:pixelOutputSize:forImageSize:scale:](self, "_getPixelCropRect:pixelOutputSize:forImageSize:scale:", a3, a4, v10, v12, v14);
  }
}

- (BOOL)_getPixelCropRect:(CGRect *)a3 pixelOutputSize:(CGSize *)a4 forImageSize:(CGSize)a5 scale:(double)a6
{
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  int constraintType;
  double v12;
  double minAspectRatio;
  double maxAspectRatio;
  float v15;
  double v16;
  double outputScale;
  float v18;
  double v19;
  double v20;
  double v21;
  double v23;
  double v24;
  float v25;
  float v26;
  float v27;
  double v28;
  double v29;
  double v30;
  double v32;
  double v33;
  float v34;
  float v35;

  v7 = self->_outputBorderTrim * a6;
  v8 = v7 * -2.0 + a5.width * a6;
  v9 = v7 * -2.0 + a5.height * a6;
  v10 = v9 > 0.0 && v8 > 0.0;
  if (!v10)
    return v10;
  constraintType = self->_constraintType;
  v12 = v8 / v9;
  if (constraintType == 4)
  {
    minAspectRatio = self->_size.width / self->_size.height;
  }
  else
  {
    minAspectRatio = v8 / v9;
    if (self->_respectAspectRatioRange)
    {
      minAspectRatio = self->_minAspectRatio;
      maxAspectRatio = self->_maxAspectRatio;
      if (maxAspectRatio >= v12)
        maxAspectRatio = v8 / v9;
      if (minAspectRatio <= maxAspectRatio)
        minAspectRatio = maxAspectRatio;
    }
  }
  if (v12 > minAspectRatio + 0.00000011920929)
  {
    v15 = (v8 - v9 * minAspectRatio) * 0.5;
    v16 = v7;
    v7 = v7 + floorf(v15);
    v8 = v9 * minAspectRatio;
    if (!a3)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (v12 < minAspectRatio + -0.00000011920929)
  {
    v18 = (v9 - v8 / minAspectRatio) * 0.5;
    v16 = v7 + floorf(v18);
    v9 = v8 / minAspectRatio;
    if (!a3)
      goto LABEL_15;
LABEL_14:
    a3->origin.x = v7;
    a3->origin.y = v16;
    a3->size.width = v8;
    a3->size.height = v9;
    constraintType = self->_constraintType;
    goto LABEL_15;
  }
  v16 = v7;
  if (a3)
    goto LABEL_14;
LABEL_15:
  switch(constraintType)
  {
    case 0:
      v8 = self->_fixedDimension * self->_outputScale;
      goto LABEL_30;
    case 1:
      v9 = self->_fixedDimension * self->_outputScale;
      v8 = minAspectRatio * v9;
      if (!a4)
        return v10;
      goto LABEL_49;
    case 2:
      v8 = self->_fixedDimension * self->_outputScale;
      if (minAspectRatio <= 1.0)
        goto LABEL_27;
      goto LABEL_30;
    case 3:
      v8 = self->_fixedDimension * self->_outputScale;
      if (minAspectRatio >= 1.0)
      {
LABEL_27:
        v9 = v8;
        v8 = minAspectRatio * v8;
        if (!a4)
          return v10;
      }
      else
      {
LABEL_30:
        v9 = v8 / minAspectRatio;
        if (!a4)
          return v10;
      }
LABEL_49:
      a4->width = v8;
      a4->height = v9;
      break;
    case 4:
    case 5:
      outputScale = self->_outputScale;
      v8 = self->_size.width * outputScale;
      v9 = outputScale * self->_size.height;
      if (!a4)
        return v10;
      goto LABEL_49;
    case 6:
      v19 = self->_outputScale;
      v20 = self->_size.width * v19;
      v21 = v19 * self->_size.height;
      if (v8 <= v20 && v9 <= v21)
        goto LABEL_48;
      v23 = v20 / v8;
      v24 = v21 / v9;
      if (v23 < v24)
        v24 = v23;
      v25 = v8 * v24;
      v8 = floorf(v25);
      v26 = v9 * v24;
      v27 = floorf(v26);
      goto LABEL_47;
    case 7:
      v28 = self->_outputScale;
      v29 = self->_size.width * v28;
      v30 = v28 * self->_size.height;
      if (v8 >= v29 && v9 >= v30)
        goto LABEL_48;
      v32 = v29 / v8;
      v33 = v30 / v9;
      if (v32 > v33)
        v33 = v32;
      v34 = v8 * v33;
      v8 = ceilf(v34);
      v35 = v9 * v33;
      v27 = ceilf(v35);
LABEL_47:
      v9 = v27;
LABEL_48:
      if (a4)
        goto LABEL_49;
      return v10;
    default:
      v8 = *MEMORY[0x1E0C9D820];
      v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      if (!a4)
        return v10;
      goto LABEL_49;
  }
  return v10;
}

- (CGRect)_getDrawRectForImage:(CGImage *)a3 withOutputSize:(CGSize)a4
{
  double height;
  double width;
  size_t v8;
  double v9;
  size_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  height = a4.height;
  width = a4.width;
  if (self->_constraintType == 5)
  {
    v8 = CGImageGetWidth(a3);
    v9 = (double)v8;
    v10 = CGImageGetHeight(a3);
    v11 = (double)v10;
    v12 = width / (double)v8;
    if (!v8)
      v12 = 1.0;
    v13 = height / v11;
    if (!v10)
      v13 = 1.0;
    if (fmin(v12, v13) != 1.0)
    {
      if (v12 >= v13)
      {
        v9 = height * (v9 / v11);
        v11 = height;
      }
      else
      {
        v11 = width * (v11 / v9);
        v9 = width;
      }
    }
    v14 = PKSizeAlignedInRectWithScale(0x100000001uLL, v9, v11, *MEMORY[0x1E0C9D538], *(CGFloat *)(MEMORY[0x1E0C9D538] + 8), width, height, self->_outputScale);
    width = v16;
    height = v17;
  }
  else
  {
    v14 = *MEMORY[0x1E0C9D538];
    v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)_reasonable
{
  double fixedDimension;
  _BOOL4 v4;
  _BOOL4 v5;
  double minAspectRatio;
  double maxAspectRatio;
  double width;
  double height;
  _BOOL4 v11;
  double outputScale;
  _BOOL4 v13;
  unsigned int constraintType;
  int v15;
  NSObject *v17;
  double v18;
  double v19;
  CGFloat v20;
  _DWORD v21[2];
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  CGFloat v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  fixedDimension = self->_fixedDimension;
  v4 = fixedDimension <= 2048.0;
  if (fixedDimension < 10.0)
    v4 = 0;
  if (self->_respectAspectRatioRange)
  {
    v5 = 0;
    minAspectRatio = self->_minAspectRatio;
    if (minAspectRatio <= 5.0 && minAspectRatio >= 0.200000003)
    {
      maxAspectRatio = self->_maxAspectRatio;
      v5 = maxAspectRatio <= 5.0;
      if (maxAspectRatio < 0.200000003)
        v5 = 0;
      if (minAspectRatio > maxAspectRatio)
        v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }
  width = self->_size.width;
  if (width > 2048.0 || width < 10.0)
  {
    v11 = 0;
  }
  else
  {
    height = self->_size.height;
    v11 = height >= 10.0;
    if (height > 2048.0)
      v11 = 0;
  }
  outputScale = self->_outputScale;
  v13 = outputScale == 1.0;
  if (outputScale == 2.0)
    v13 = 1;
  if (outputScale == 3.0)
    v13 = 1;
  if (outputScale == 4.0)
    v13 = 1;
  constraintType = self->_constraintType;
  if (constraintType - 4 < 4)
  {
    v15 = v11 && v13;
  }
  else
  {
    if (constraintType > 3)
      goto LABEL_32;
    v15 = v4 && v13;
  }
  if ((v15 & v5 & 1) != 0)
    return 1;
LABEL_32:
  PKLogFacilityTypeGetObject(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v19 = self->_minAspectRatio;
    v18 = self->_maxAspectRatio;
    v20 = self->_size.height;
    v21[0] = 67110656;
    v21[1] = constraintType;
    v22 = 2048;
    v23 = fixedDimension;
    v24 = 2048;
    v25 = v19;
    v26 = 2048;
    v27 = v18;
    v28 = 2048;
    v29 = width;
    v30 = 2048;
    v31 = v20;
    v32 = 2048;
    v33 = outputScale;
    _os_log_error_impl(&dword_18FC92000, v17, OS_LOG_TYPE_ERROR, "Unreasonable constraints: <type: %d, dimen: %f, ratio: (%f, %f), size: (%f, %f), scale: %f>", (uint8_t *)v21, 0x44u);
  }

  return 0;
}

- (id)_flippedConstraints
{
  PKImageResizingConstraints *v3;
  float64x2_t v4;
  int constraintType;

  v3 = objc_alloc_init(PKImageResizingConstraints);
  v3->_fixedDimension = self->_fixedDimension;
  v4 = (float64x2_t)vextq_s8(*(int8x16_t *)&self->_minAspectRatio, *(int8x16_t *)&self->_minAspectRatio, 8uLL);
  __asm { FMOV            V2.2D, #1.0 }
  *(int8x16_t *)&v3->_minAspectRatio = vbicq_s8((int8x16_t)vdivq_f64(_Q2, v4), (int8x16_t)vceqzq_f64(v4));
  v3->_respectAspectRatioRange = self->_respectAspectRatioRange;
  v3->_size = (CGSize)vextq_s8((int8x16_t)self->_size, (int8x16_t)self->_size, 8uLL);
  v3->_outputScale = self->_outputScale;
  v3->_outputBorderTrim = self->_outputBorderTrim;
  v3->_outputMirrored = self->_outputMirrored;
  constraintType = self->_constraintType;
  if (constraintType)
  {
    if (constraintType == 1)
      constraintType = 0;
  }
  else
  {
    constraintType = 1;
  }
  v3->_constraintType = constraintType;
  return v3;
}

- (double)outputScale
{
  return self->_outputScale;
}

- (double)outputBorderTrim
{
  return self->_outputBorderTrim;
}

- (void)setOutputBorderTrim:(double)a3
{
  self->_outputBorderTrim = a3;
}

- (double)outputCornerRadius
{
  return self->_outputCornerRadius;
}

- (void)setOutputCornerRadius:(double)a3
{
  self->_outputCornerRadius = a3;
}

- (BOOL)outputMirrored
{
  return self->_outputMirrored;
}

- (void)setOutputMirrored:(BOOL)a3
{
  self->_outputMirrored = a3;
}

@end

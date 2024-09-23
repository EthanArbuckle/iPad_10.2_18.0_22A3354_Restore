@implementation UIKBRenderer

+ (void)clearInternalCaches
{
  void *v2;

  v2 = (void *)_MergedGlobals_1118;
  _MergedGlobals_1118 = 0;

}

+ (id)rendererWithContext:(CGContext *)a3 withSize:(CGSize)a4 withScale:(double)a5 opaque:(BOOL)a6 renderFlags:(int64_t)a7 assetIdiom:(int64_t)a8
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:", a3, a6, a7, a8, a4.width, a4.height, a5);
}

- (UIKBRenderer)initWithContext:(CGContext *)a3 withSize:(CGSize)a4 withScale:(double)a5 opaque:(BOOL)a6 renderFlags:(int64_t)a7 assetIdiom:(int64_t)a8
{
  CGFloat height;
  CGFloat width;
  UIKBRenderer *v15;
  CGPoint *v16;
  CGSize v17;
  objc_super v19;

  height = a4.height;
  width = a4.width;
  v19.receiver = self;
  v19.super_class = (Class)UIKBRenderer;
  v15 = -[UIKBRenderer init](&v19, sel_init);
  if (v15)
  {
    v15->_ctx = CGContextRetain(a3);
    v15->_size.width = width;
    v15->_size.height = height;
    v15->_scale = a5;
    v15->_opaque = a6;
    v15->_renderFlags = a7;
    v15->_forceColorFormat = 0;
    v15->_colorCount = 0;
    v16 = (CGPoint *)MEMORY[0x1E0C9D628];
    v15->_contentColorFormat = 1;
    v15->_assetIdiom = a8;
    v17 = (CGSize)v16[1];
    v15->__layerPaddedFrame.origin = *v16;
    v15->__layerPaddedFrame.size = v17;
    v15->__layerRoundRectRadius = 0.0;
  }
  return v15;
}

- (void)dealloc
{
  CGContext *cachingContext;
  CGContext *ctx;
  objc_super v5;

  cachingContext = self->_cachingContext;
  if (cachingContext)
    CGContextRelease(cachingContext);
  ctx = self->_ctx;
  if (ctx)
    CGContextRelease(ctx);
  v5.receiver = self;
  v5.super_class = (Class)UIKBRenderer;
  -[UIKBRenderer dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKBRenderer;
  -[UIKBRenderer description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("; renderFlags = %d, forceColors = %d"),
    -[UIKBRenderer renderFlags](self, "renderFlags"),
    self->_forceColorFormat);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)forceColorFormat:(int64_t)a3
{
  self->_forceColorFormat = a3;
}

- (UIColor)singleColor
{
  if (self->_colorCount == 1)
    return self->_singleColor;
  else
    return (UIColor *)0;
}

- (int64_t)contentColorFormat
{
  void *v3;

  -[UIKBRenderer singleColor](self, "singleColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 2;
  else
    return self->_contentColorFormat;
}

- (void)_addDetectedColor:(CGColor *)a3
{
  CGColor *CopyWithAlpha;
  CGColor *v5;
  int colorCount;
  UIColor *v7;
  UIColor *singleColor;
  id v9;

  if (a3 && self->_colorCount <= 1)
  {
    CopyWithAlpha = CGColorCreateCopyWithAlpha(a3, 1.0);
    UISCreateCachedColorTransform();
    v5 = (CGColor *)CGColorTransformConvertColor();
    CGColorTransformRelease();
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    CGColorRelease(CopyWithAlpha);
    CGColorRelease(v5);
    colorCount = self->_colorCount;
    if (colorCount == 1)
    {
      if (!-[UIColor isEqual:](self->_singleColor, "isEqual:", v9))
      {
        ++self->_colorCount;
        singleColor = self->_singleColor;
        self->_singleColor = 0;
        goto LABEL_9;
      }
    }
    else if (!colorCount)
    {
      self->_colorCount = 1;
      v7 = (UIColor *)v9;
      singleColor = self->_singleColor;
      self->_singleColor = v7;
LABEL_9:

    }
  }
}

- (void)detectColorsForNamedColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8 = v4;
    v6 = UIKBGetNamedColor(v4);
    -[UIKBRenderer _addDetectedColor:](self, "_addDetectedColor:", v6);
    v5 = v8;
    if (self->_contentColorFormat == 1)
    {
      v7 = UIKBColorUsesRGB((_BOOL8)v6);
      v5 = v8;
      if (v7)
        self->_contentColorFormat = 0;
    }
  }

}

- (void)detectColorsForGradient:(id)a3
{
  id v4;
  void *v5;
  UIColor *singleColor;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, "flatColorName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderer detectColorsForNamedColor:](self, "detectColorsForNamedColor:", v5);
    if (self->_contentColorFormat == 1 && objc_msgSend(v7, "usesRGBColors"))
      self->_contentColorFormat = 0;
    if (!v5)
    {
      self->_colorCount = 2;
      singleColor = self->_singleColor;
      self->_singleColor = 0;

    }
    v4 = v7;
  }

}

- (void)detectColorsForEffect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CGColor *v7;
  int v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    objc_msgSend(v4, "gradient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderer detectColorsForGradient:](self, "detectColorsForGradient:", v6);

    v7 = (CGColor *)objc_msgSend(v9, "CGColor");
    -[UIKBRenderer _addDetectedColor:](self, "_addDetectedColor:", v7);
    CGColorRelease(v7);
    v5 = v9;
    if (self->_contentColorFormat == 1)
    {
      v8 = objc_msgSend(v9, "usesRGBColors");
      v5 = v9;
      if (v8)
        self->_contentColorFormat = 0;
    }
  }

}

- (void)ensureContext
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (!self->_cachingContext && !self->_ctx && !self->_colorDetectMode)
  {
    -[UIKBRenderer size](self, "size");
    v4 = v3;
    v6 = v5;
    -[UIKBRenderer scale](self, "scale");
    self->_ctx = +[UIKBRenderer imageContextWithSize:scale:colorFormat:opaque:invert:](UIKBRenderer, "imageContextWithSize:scale:colorFormat:opaque:invert:", self->_forceColorFormat, -[UIKBRenderer opaque](self, "opaque"), 1, v4, v6, v7);
  }
}

- (CGContext)context
{
  CGContext *result;

  -[UIKBRenderer ensureContext](self, "ensureContext");
  result = self->_cachingContext;
  if (!result)
    return self->_ctx;
  return result;
}

- (UIImage)renderedImage
{
  UIImage *renderedImage;
  CGContext *ctx;
  CGImage *Image;
  UIKBCachedImage *v6;
  UIImage *v7;
  void *v8;
  UIImage *v9;

  renderedImage = self->_renderedImage;
  if (!renderedImage)
  {
    ctx = self->_ctx;
    if (ctx)
    {
      Image = CGBitmapContextCreateImage(ctx);
      v6 = [UIKBCachedImage alloc];
      -[UIKBRenderer scale](self, "scale");
      v7 = -[UIImage initWithCGImage:scale:orientation:](v6, "initWithCGImage:scale:orientation:", Image, 0);
      -[UIKBRenderer singleColor](self, "singleColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImage setFormatColor:](v7, "setFormatColor:", v8);

      v9 = self->_renderedImage;
      self->_renderedImage = v7;

      CGImageRelease(Image);
      renderedImage = self->_renderedImage;
    }
    else
    {
      renderedImage = 0;
    }
  }
  return renderedImage;
}

- (NSData)contextData
{
  CGContext *ctx;
  size_t BytesPerRow;
  size_t v5;

  ctx = self->_ctx;
  if (ctx)
  {
    BytesPerRow = CGBitmapContextGetBytesPerRow(ctx);
    v5 = CGBitmapContextGetHeight(self->_ctx) * BytesPerRow;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", CGBitmapContextGetData(self->_ctx), v5, 0);
    ctx = (CGContext *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)ctx;
}

+ (CGContext)imageContextWithSize:(CGSize)a3 scale:(double)a4 colorFormat:(int64_t)a5 opaque:(BOOL)a6 invert:(BOOL)a7
{
  size_t v7;
  size_t v8;
  CGContext *v10;
  _BOOL4 v11;
  _BOOL4 v13;
  CGColorSpace *DeviceGray;
  uint32_t v15;
  int AlignedBytesPerRow;
  CGContext *v17;
  CGAffineTransform v19;

  LODWORD(v8) = vcvtpd_s64_f64(a3.width * a4);
  LODWORD(v7) = vcvtpd_s64_f64(a3.height * a4);
  if ((int)v8 < 1 || (int)v7 < 1)
    return 0;
  v11 = a7;
  if (a5 == 2)
  {
    DeviceGray = 0;
    v15 = 7;
  }
  else
  {
    v13 = a6;
    if (a5 == 1)
    {
      DeviceGray = (CGColorSpace *)UIKBColorSpaceDeviceGray_colorspace;
      if (!UIKBColorSpaceDeviceGray_colorspace)
      {
        DeviceGray = CGColorSpaceCreateDeviceGray();
        UIKBColorSpaceDeviceGray_colorspace = (uint64_t)DeviceGray;
      }
      v15 = !v13;
    }
    else
    {
      DeviceGray = (CGColorSpace *)UIKBColorSpaceDeviceRGB_colorspace;
      if (!UIKBColorSpaceDeviceRGB_colorspace)
      {
        DeviceGray = CGColorSpaceCreateDeviceRGB();
        UIKBColorSpaceDeviceRGB_colorspace = (uint64_t)DeviceGray;
      }
      if (v13)
        v15 = 8198;
      else
        v15 = 8194;
    }
  }
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v17 = CGBitmapContextCreate(0, v8, v7, 8uLL, AlignedBytesPerRow, DeviceGray, v15);
  v10 = v17;
  if (v17)
  {
    if (v11)
    {
      CGContextTranslateCTM(v17, 0.0, (double)(int)v7);
      CGContextScaleCTM(v10, a4, -a4);
      CGContextGetCTM(&v19, v10);
      CGContextSetBaseCTM();
    }
    else
    {
      CGContextScaleCTM(v17, a4, a4);
    }
  }
  return v10;
}

- (void)renderEdgeEffect:(id)a3 withTraits:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGContext *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGColor *v33;
  uint64_t v34;
  void *v35;
  _BOOL4 v36;
  BOOL v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  UIKBRenderer *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  char v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  char v85;
  double v86;
  double v87;
  double v88;
  CGFloat v89;
  double v90;
  CGFloat v91;
  double v92;
  CGFloat v93;
  void *v94;
  CGColor *v95;
  CGColor *v96;
  uint64_t v97;
  double v98;
  double v99;
  uint64_t v100;
  double v101;
  CGContext *v102;
  CGFloat v103;
  void *v104;
  CGFloat v105;
  double v106;
  _BYTE v107[32];
  double v108;
  id v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;

  v109 = a3;
  v6 = a4;
  objc_msgSend(v6, "geometry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paddedFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if (objc_msgSend(v109, "isValid"))
  {
    v110.origin.x = v9;
    v110.origin.y = v11;
    v110.size.width = v13;
    v110.size.height = v15;
    if (!CGRectIsEmpty(v110))
    {
      if (self->_colorDetectMode)
      {
        -[UIKBRenderer detectColorsForEffect:](self, "detectColorsForEffect:", v109);
        goto LABEL_54;
      }
      v16 = -[UIKBRenderer context](self, "context");
      v17 = objc_msgSend(v7, "roundRectCorners");
      objc_msgSend(v7, "roundRectRadius");
      v108 = v18;
      objc_msgSend(v109, "insets");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      objc_msgSend(v7, "displayFrame");
      v27 = fabs(v20);
      v106 = v24;
      v28 = fabs(v22);
      *(double *)v107 = v29 - v28;
      *(double *)&v107[8] = v30 - v27;
      *(double *)&v107[16] = v31 - (-v28 - fabs(v26));
      *(double *)&v107[24] = v32 - (-fabs(v24) - v27);
      if (objc_msgSend(v109, "edges") == 15)
      {
        if ((unint64_t)(v17 + 1) < 2)
        {
          CGContextSaveGState(v16);
          v33 = (CGColor *)objc_msgSend(v109, "CGColor");
          CGContextSetStrokeColorWithColor(v16, v33);
          objc_msgSend(v6, "variantGeometries");
          v34 = objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            v35 = (void *)v34;
            if ((objc_msgSend(v7, "detachedVariants") & 1) != 0)
            {

LABEL_45:
              if (objc_msgSend(v7, "flickDirection") != -3)
              {
                v102 = -[UIKBRenderer context](self, "context");
                v113.origin.x = v9 + -0.25;
                v113.origin.y = v11 + -0.25;
                v113.size.width = v13 + 0.5;
                v113.size.height = v15 + 0.5;
                CGContextAddRect(v102, v113);
              }
              -[UIKBRenderer addPathForTraits:displayRect:](self, "addPathForTraits:displayRect:", v6, 0);
              objc_msgSend(v109, "weight");
              CGContextSetLineWidth(v16, v103);
              CGContextStrokePath(v16);
              goto LABEL_51;
            }
            v97 = objc_msgSend(v7, "flickDirection");

            if (v97 != -3)
              goto LABEL_45;
          }
          if (objc_msgSend(v7, "flickDirection") == -3)
          {
            if (v108 == 0.0 && !v17)
            {
              v98 = v11 + v20;
              v99 = v13 - (v22 + v26);
              -[UIKBRenderer addRoundRect:radius:corners:](self, "addRoundRect:radius:corners:", 0, v9 + v22, v98, v99, v15 - (v20 + v106), 0.0);
              v100 = objc_msgSend(v109, "edges");
              objc_msgSend(v109, "weight");
              -[UIKBRenderer addRoundRect:radius:corners:](self, "addRoundRect:radius:corners:", 0, UIRectInsetEdges(v100, v9 + v22, v98, v99, v15 - (v20 + v106), v101));
              CGContextEOClip(v16);
              CGContextSetFillColorWithColor(v16, v33);
              CGContextFillRect(v16, *(CGRect *)v107);
LABEL_51:
              v96 = v33;
              goto LABEL_52;
            }
            v104 = (void *)objc_msgSend(v7, "copy");
            objc_msgSend(v104, "applyInsets:", v20, v22, v24, v26);
            -[UIKBRenderer addPathForRenderGeometry:](self, "addPathForRenderGeometry:", v104);
          }
          else
          {
            v104 = (void *)objc_msgSend(v7, "copy");
            objc_msgSend(v104, "applyInsets:", v20, v22, v24, v26);
            -[UIKBRenderer addPathForFlickGeometry:](self, "addPathForFlickGeometry:", v104);
          }
          objc_msgSend(v109, "weight");
          CGContextSetLineWidth(v16, v105);
          CGContextStrokePath(v16);

          goto LABEL_51;
        }
        v36 = 0;
        v37 = v108 == 0.0;
      }
      else
      {
        v36 = v17 == 0;
        v37 = v108 == 0.0;
        if (v108 == 0.0 && !v17)
        {
          CGContextSaveGState(v16);
          -[UIKBRenderer addRoundRect:radius:corners:](self, "addRoundRect:radius:corners:", 0, v9, v11, v13, v15, 0.0);
          -[UIKBRenderer addRoundRect:radius:corners:](self, "addRoundRect:radius:corners:", 0, v9 + v22, v11 + v20, v13 - (v22 + v26), v15 - (v20 + v24), 0.0);
          CGContextEOClip(v16);
          objc_msgSend(v109, "gradient");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
          {
            objc_msgSend(v109, "gradient");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "displayFrame");
            v44 = self;
            v45 = v39;
LABEL_38:
            -[UIKBRenderer _drawLinearGradient:inRect:](v44, "_drawLinearGradient:inRect:", v45, v40, v41, v42, v43);

LABEL_53:
            CGContextRestoreGState(v16);
            goto LABEL_54;
          }
LABEL_39:
          v95 = (CGColor *)objc_msgSend(v109, "CGColor");
          CGContextSetFillColorWithColor(v16, v95);
          CGContextFillRect(v16, *(CGRect *)v107);
          v96 = v95;
LABEL_52:
          CGColorRelease(v96);
          goto LABEL_53;
        }
      }
      CGContextSaveGState(v16);
      objc_msgSend(v109, "insets");
      v50 = v46;
      v51 = v47;
      v52 = v48;
      v53 = v49;
      if (v37 || v36)
      {
        v81 = v9 + v47;
        v82 = v11 + v46;
        v83 = v13 - (v47 + v49);
        v84 = v15 - (v46 + v48);
        v85 = objc_msgSend(v109, "edges");
        objc_msgSend(v109, "weight");
        v87 = UIRectInsetEdges(v85, v81, v82, v83, v84, v86);
        v89 = v88;
        v91 = v90;
        v93 = v92;
        v111.origin.x = v81;
        v111.origin.y = v82;
        v111.size.width = v83;
        v111.size.height = v84;
        CGContextAddRect(v16, v111);
        v112.origin.x = v87;
        v112.origin.y = v89;
        v112.size.width = v91;
        v112.size.height = v93;
        CGContextAddRect(v16, v112);
      }
      else
      {
        v54 = 0.0;
        if (objc_msgSend(v7, "popupBias"))
          v55 = 0.0;
        else
          v55 = v50;
        v56 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(v56, "paddedFrame");
        v59 = v51 + v53;
        objc_msgSend(v56, "setPaddedFrame:", v51 + v57, v55 + v58, v60 - v59, v61 - (v52 + v55));
        objc_msgSend(v56, "displayFrame");
        objc_msgSend(v56, "setDisplayFrame:", v51 + v62, v50 + v63, v64 - v59, v65 - (v50 + v52));
        -[UIKBRenderer addPathForRenderGeometry:](self, "addPathForRenderGeometry:", v56);
        v66 = objc_msgSend(v109, "edges");
        objc_msgSend(v109, "weight");
        if ((v66 & 1) != 0)
          v68 = v67;
        else
          v68 = 0.0;
        if ((v66 & 2) != 0)
          v69 = v67;
        else
          v69 = 0.0;
        if ((v66 & 4) != 0)
          v70 = v67;
        else
          v70 = 0.0;
        if ((v66 & 8) != 0)
          v71 = v67;
        else
          v71 = 0.0;
        if (!objc_msgSend(v7, "popupBias"))
          v54 = v68;
        objc_msgSend(v56, "paddedFrame");
        v74 = v69 + v71;
        objc_msgSend(v56, "setPaddedFrame:", v69 + v72, v54 + v73, v75 - v74, v76 - (v70 + v54));
        objc_msgSend(v56, "displayFrame");
        objc_msgSend(v56, "setDisplayFrame:", v69 + v77, v68 + v78, v79 - v74, v80 - (v68 + v70));
        -[UIKBRenderer addPathForRenderGeometry:](self, "addPathForRenderGeometry:", v56);

      }
      CGContextEOClip(v16);
      objc_msgSend(v109, "gradient");
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      if (v94)
      {
        objc_msgSend(v109, "gradient");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = self;
        v45 = v39;
        v40 = *(double *)v107;
        v41 = *(double *)&v107[8];
        v42 = *(double *)&v107[16];
        v43 = *(double *)&v107[24];
        goto LABEL_38;
      }
      goto LABEL_39;
    }
  }
LABEL_54:

}

- (void)renderShadowEffect:(id)a3 withTraits:(id)a4
{
  id v6;
  void *v7;
  CGContext *v8;
  CGColor *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  CGSize v55;
  CGRect v56;

  v54 = a3;
  v6 = a4;
  objc_msgSend(v6, "geometry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v54, "isValid"))
  {
    objc_msgSend(v7, "displayFrame");
    if (!CGRectIsEmpty(v56))
    {
      if (self->_colorDetectMode)
      {
        -[UIKBRenderer detectColorsForEffect:](self, "detectColorsForEffect:", v54);
      }
      else
      {
        v8 = -[UIKBRenderer context](self, "context");
        CGContextSaveGState(v8);
        v9 = (CGColor *)objc_msgSend(v54, "CGColor");
        objc_msgSend(v54, "offset");
        v11 = v10;
        v13 = v12;
        objc_msgSend(v54, "weight");
        v15 = v14;
        v55.width = v11;
        v55.height = v13;
        CGContextSetShadowWithColor(v8, v55, v15, v9);
        CGColorRelease(v9);
        +[UIColor whiteColor](UIColor, "whiteColor");
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetFillColorWithColor(v8, (CGColorRef)objc_msgSend(v16, "CGColor"));

        v17 = v6;
        objc_msgSend(v54, "insets");
        if (v21 != 0.0 || v18 != 0.0 || v20 != 0.0 || v19 != 0.0)
        {
          v22 = (void *)objc_msgSend(v7, "copy");
          objc_msgSend(v17, "variantGeometries");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23 && !objc_msgSend(v7, "popupBias"))
          {
            v52 = v17;
            v53 = v22;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "count"))
            {
              v25 = 0;
              v26 = 0x1E0C99000uLL;
              do
              {
                objc_msgSend(v23, "objectAtIndex:", v25);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v26 + 3640), "null");
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                if (v27 == v28)
                {
                  objc_msgSend(*(id *)(v26 + 3640), "null");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  if (v25)
                  {
                    objc_msgSend(v54, "insets");
                    v30 = v29;
                    v32 = v31;
                    v34 = v33;
                    v36 = v35;
                    switch(v25)
                    {
                      case 1uLL:
                        objc_msgSend(v54, "concaveInsets");
                        v34 = -v37;
                        goto LABEL_22;
                      case 2uLL:
                        objc_msgSend(v54, "concaveInsets");
                        v32 = -v44;
                        goto LABEL_24;
                      case 3uLL:
                        objc_msgSend(v54, "concaveInsets");
                        v30 = -v45;
LABEL_22:
                        objc_msgSend(v54, "concaveInsets");
                        v32 = v46;
                        objc_msgSend(v54, "concaveInsets");
                        v36 = v47;
                        break;
                      case 4uLL:
                        objc_msgSend(v54, "concaveInsets");
                        v36 = -v48;
LABEL_24:
                        objc_msgSend(v54, "concaveInsets");
                        v30 = v49;
                        objc_msgSend(v54, "concaveInsets");
                        v34 = v50;
                        break;
                      default:
                        break;
                    }
                    v43 = (void *)objc_msgSend(v27, "copy");
                    v38 = v43;
                    v39 = v30;
                    v40 = v32;
                    v41 = v34;
                    v42 = v36;
                  }
                  else
                  {
                    v38 = (void *)objc_msgSend(v27, "copy");
                    objc_msgSend(v54, "concaveInsets");
                    v43 = v38;
                  }
                  objc_msgSend(v43, "applyInsets:", v39, v40, v41, v42);
                }
                objc_msgSend(v24, "addObject:", v38);

                ++v25;
                v26 = 0x1E0C99000;
              }
              while (v25 < objc_msgSend(v23, "count"));
            }

            v17 = v52;
            v22 = v53;
          }
          else
          {
            objc_msgSend(v54, "insets");
            objc_msgSend(v22, "applyShadowInsets:");
            v24 = v23;
          }
          +[UIKBRenderTraits traitsWithGeometry:](UIKBRenderTraits, "traitsWithGeometry:", v22);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v51, "setVariantGeometries:", v24);
          v17 = v51;
        }
        -[UIKBRenderer addPathForTraits:displayRect:](self, "addPathForTraits:displayRect:", v17, 0);
        CGContextFillPath(v8);
        CGContextRestoreGState(v8);

      }
    }
  }

}

- (void)renderDivotEffect:(id)a3 withTraits:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGContext *v21;
  id v22;
  CGImage *v23;
  CGImage *v24;
  id v25;
  CGRect v26;
  CGRect v27;

  v5 = a4;
  _UIImageWithName(CFSTR("spacekey_grabber_handles.png"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "geometry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v6, "size");
  v17 = v16;
  v19 = v18;
  v20 = v11 + (v15 - v18) * 0.5 + -1.0;
  v21 = -[UIKBRenderer context](self, "context");
  v22 = objc_retainAutorelease(v6);
  v23 = (CGImage *)objc_msgSend(v22, "CGImage");
  v26.origin.x = v9 + 8.0;
  v26.origin.y = v20;
  v26.size.width = v17;
  v26.size.height = v19;
  CGContextDrawImage(v21, v26, v23);
  v25 = objc_retainAutorelease(v22);
  v24 = (CGImage *)objc_msgSend(v25, "CGImage");
  v27.origin.x = v9 + v13 - v17 + -8.0;
  v27.origin.y = v20;
  v27.size.width = v17;
  v27.size.height = v19;
  CGContextDrawImage(v21, v27, v24);

}

- (void)_drawLinearGradient:(id)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  CGGradient *v11;
  CGContext *v12;
  id v13;
  CGPoint v14;
  CGPoint v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  if (v9)
  {
    v13 = v9;
    if (objc_msgSend(v9, "horizontal"))
    {
      v10 = -0.0;
    }
    else
    {
      width = -0.0;
      v10 = height;
    }
    v11 = (CGGradient *)objc_msgSend(v13, "CGGradient");
    if (self->_colorDetectMode)
    {
      -[UIKBRenderer detectColorsForGradient:](self, "detectColorsForGradient:", v13);
    }
    else if (-[UIKBRenderer context](self, "context"))
    {
      v12 = -[UIKBRenderer context](self, "context");
      v14.x = x;
      v14.y = y;
      v15.x = x + width;
      v15.y = y + v10;
      CGContextDrawLinearGradient(v12, v11, v14, v15, 0);
    }
    CGGradientRelease(v11);
    v9 = v13;
  }

}

- (void)renderBackgroundTraits:(id)a3 allowCaching:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  char v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  void *v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  char v23;
  _BOOL4 v24;
  char v25;
  uint64_t v26;
  void *v27;
  CGContext *cachingContext;
  void *v29;
  void *v30;
  CGBlendMode BlendMode;
  CGContext *ctx;
  id v33;
  CGImage *v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  CGContext *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  id cachingContextCompletion;
  void *v56;
  double v57;
  CGContext *v58;
  _BOOL4 v59;
  int v60;
  void *v61;
  uint64_t v62;
  int v63;
  unint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[5];
  id v70;
  id v71;
  CGRect v72;
  id location;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  CGAffineTransform transform;
  CGRect v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;
  CGRect v87;

  v4 = a4;
  v86 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[UIKBRenderer renderFlags](self, "renderFlags");
  v8 = -[UIKBRenderer renderFlags](self, "renderFlags");
  v64 = -[UIKBRenderer renderFlags](self, "renderFlags");
  objc_msgSend(v6, "backgroundGradient");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layeredBackgroundGradient");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layeredForegroundGradient");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "renderEffects");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 & 1;
  v10 = (v8 >> 1) & 1;
  if (objc_msgSend(v6, "blendForm") != 3)
    goto LABEL_9;
  if (-[UIKBRenderer renderFlags](self, "renderFlags") == 2)
  {
    LODWORD(v10) = 0;
    v9 = 1;
    goto LABEL_9;
  }
  if (-[UIKBRenderer renderFlags](self, "renderFlags") == 1)
  {

    objc_msgSend(v6, "foregroundRenderEffects");
    v11 = objc_claimAutoreleasedReturnValue();
    v65 = v68;
  }
  else
  {
    if (-[UIKBRenderer renderFlags](self, "renderFlags") != 4)
      goto LABEL_9;

    v11 = 0;
  }

  v68 = 0;
  v66 = (void *)v11;
LABEL_9:
  if (v67)
    v12 = v10;
  else
    v12 = 0;
  v13 = (v68 != 0) & (v64 >> 2);
  if (objc_msgSend(v6, "blendForm") == 1)
    v13 &= ~objc_msgSend(v6, "controlOpacities");
  if (((v9 | v10 | v12) & 1) == 0 && !v13)
    goto LABEL_92;
  v60 = v12;
  objc_msgSend(v6, "geometry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayFrame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v83.origin.x = v15;
  v83.origin.y = v17;
  v83.size.width = v19;
  v83.size.height = v21;

  v23 = -[UIKBRenderer renderFlags](self, "renderFlags");
  if (self->_colorDetectMode)
    goto LABEL_17;
  v25 = v23;
  v61 = 0;
  if (!-[UIKBRenderer disableInternalCaching](self, "disableInternalCaching"))
  {
    v26 = v25 & 3;
    if ((v25 & 3) != 0 && v4)
    {
      objc_msgSend(v6, "hashString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27 || (cachingContext = self->_cachingContext, v27, cachingContext))
      {
LABEL_17:
        v61 = 0;
        goto LABEL_18;
      }
      if (qword_1ECD7ED70 != -1)
        dispatch_once(&qword_1ECD7ED70, &__block_literal_global_326);
      objc_msgSend(v6, "hashString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringByAppendingFormat:", CFSTR("%d"), v26);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)_MergedGlobals_1118, "objectForKey:", v61);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        BlendMode = CGContextGetBlendMode();
        CGContextSetBlendMode(self->_ctx, kCGBlendModeCopy);
        ctx = self->_ctx;
        v33 = objc_retainAutorelease(v30);
        v34 = (CGImage *)objc_msgSend(v33, "CGImage");
        v87.origin.x = v16;
        v87.origin.y = v18;
        v87.size.width = v20;
        v87.size.height = v22;
        CGContextDrawImage(ctx, v87, v34);
        CGContextSetBlendMode(self->_ctx, BlendMode);
        v35 = objc_retainAutorelease(v33);
        objc_msgSend(v35, "CGImage");
        CGImageGetProperty();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "integerValue");
        if (v37 < self->_contentColorFormat)
          self->_contentColorFormat = v37;
        if (objc_msgSend(v35, "hasFormatColor"))
        {
          objc_msgSend(v35, "formatColor");
          v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          -[UIKBRenderer _addDetectedColor:](self, "_addDetectedColor:", objc_msgSend(v38, "CGColor"));

        }
        v39 = v61;
        goto LABEL_91;
      }
      v56 = (void *)objc_opt_class();
      -[UIKBRenderer scale](self, "scale");
      v58 = (CGContext *)objc_msgSend(v56, "imageContextWithSize:scale:colorFormat:opaque:invert:", self->_forceColorFormat, 0, 0, v20, v22, v57);
      self->_cachingContext = v58;
      CGAffineTransformMakeTranslation(&transform, -v16, -v18);
      CGContextConcatCTM(v58, &transform);
    }
  }
LABEL_18:
  if (v9)
  {
    v24 = (objc_msgSend(v6, "blurBlending") & 1) != 0 || objc_msgSend(v6, "blendForm") == 3;
    v63 = v24;
    if (!(_DWORD)v10)
      goto LABEL_39;
  }
  else
  {
    v63 = 0;
    if (!(_DWORD)v10)
      goto LABEL_39;
  }
  if ((objc_msgSend(v6, "blurBlending") & 1) == 0)
  {
    LODWORD(v62) = objc_msgSend(v6, "blendForm") != 3;
    goto LABEL_41;
  }
LABEL_39:
  LODWORD(v62) = 0;
LABEL_41:
  if (objc_msgSend(v6, "renderFlagsForAboveEffects"))
  {
    v40 = objc_msgSend(v6, "renderFlagsForAboveEffects");
    v59 = (-[UIKBRenderer renderFlags](self, "renderFlags") & v40) != 0;
    v62 = (v40 >> 1) & 1;
    v63 = v40 & 1;
    if (!(_DWORD)v10)
      goto LABEL_63;
  }
  else
  {
    v59 = 0;
    if (!(_DWORD)v10)
      goto LABEL_63;
  }
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v41 = v66;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
  if (!v42)
  {

    goto LABEL_63;
  }
  v43 = 0;
  v44 = *(_QWORD *)v79;
  do
  {
    v45 = 0;
    do
    {
      if (*(_QWORD *)v79 != v44)
        objc_enumerationMutation(v41);
      v46 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v45);
      if (objc_msgSend(v46, "renderUnder"))
      {
        if ((v43 & 1) != 0)
          goto LABEL_54;
        if (-[UIKBRenderer context](self, "context"))
        {
          CGContextSaveGState(-[UIKBRenderer context](self, "context"));
          v47 = -[UIKBRenderer context](self, "context");
          CGContextAddRect(v47, v83);
          -[UIKBRenderer addPathForTraits:displayRect:](self, "addPathForTraits:displayRect:", v6, 0);
          CGContextEOClip(-[UIKBRenderer context](self, "context"));
LABEL_54:
          v43 = 1;
        }
        else
        {
          v43 = 0;
        }
        objc_msgSend(v46, "renderEffectWithRenderer:traits:", self, v6);
      }
      ++v45;
    }
    while (v42 != v45);
    v48 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
    v42 = v48;
  }
  while (v48);

  if ((v43 & 1) != 0)
    CGContextRestoreGState(-[UIKBRenderer context](self, "context"));
LABEL_63:
  if (v9 | v60 | v13)
  {
    if (-[UIKBRenderer context](self, "context"))
    {
      CGContextSaveGState(-[UIKBRenderer context](self, "context"));
      -[UIKBRenderer addPathForTraits:displayRect:](self, "addPathForTraits:displayRect:", v6, &v83);
      if (!CGContextIsPathEmpty(-[UIKBRenderer context](self, "context")))
        CGContextClip(-[UIKBRenderer context](self, "context"));
    }
    if (v60)
      -[UIKBRenderer _drawLinearGradient:inRect:](self, "_drawLinearGradient:inRect:", v67, *(_OWORD *)&v83.origin, *(_OWORD *)&v83.size);
    if (v9)
      -[UIKBRenderer _drawLinearGradient:inRect:](self, "_drawLinearGradient:inRect:", v65, *(_OWORD *)&v83.origin, *(_OWORD *)&v83.size);
    if (v13)
      -[UIKBRenderer _drawLinearGradient:inRect:](self, "_drawLinearGradient:inRect:", v68, *(_OWORD *)&v83.origin, *(_OWORD *)&v83.size);
    if (-[UIKBRenderer context](self, "context"))
      CGContextRestoreGState(-[UIKBRenderer context](self, "context"));
  }
  if ((v62 | v63 | v59) == 1)
  {
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v49 = v66;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
    if (v50)
    {
      v51 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v75 != v51)
            objc_enumerationMutation(v49);
          v53 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          if ((objc_msgSend(v53, "renderUnder") & 1) == 0)
            objc_msgSend(v53, "renderEffectWithRenderer:traits:", self, v6);
        }
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
      }
      while (v50);
    }

  }
  v39 = v61;
  if (v61 && !self->_cachingContextCompletion)
  {
    objc_initWeak(&location, self);
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __52__UIKBRenderer_renderBackgroundTraits_allowCaching___block_invoke_2;
    v69[3] = &unk_1E16D3EB0;
    objc_copyWeak(&v71, &location);
    v69[4] = self;
    v39 = v61;
    v70 = v39;
    v72 = v83;
    v54 = (void *)objc_msgSend(v69, "copy");
    cachingContextCompletion = self->_cachingContextCompletion;
    self->_cachingContextCompletion = v54;

    if (((v64 >> 2) & 1) != 0)
      -[UIKBRenderer _completeCacheImageWithTraitsIfNecessary:](self, "_completeCacheImageWithTraitsIfNecessary:", v6);

    objc_destroyWeak(&v71);
    objc_destroyWeak(&location);
  }
LABEL_91:

LABEL_92:
}

uint64_t __52__UIKBRenderer_renderBackgroundTraits_allowCaching___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_MergedGlobals_1118;
  _MergedGlobals_1118 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_1118, "setCountLimit:", 50);
}

void __52__UIKBRenderer_renderBackgroundTraits_allowCaching___block_invoke_2(uint64_t a1)
{
  CGContextRef *WeakRetained;
  CGImage *Image;
  UIKBCachedImage *v4;
  void *v5;
  CGBlendMode BlendMode;
  CGContextRef *v7;

  WeakRetained = (CGContextRef *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    Image = CGBitmapContextCreateImage(WeakRetained[1]);
    CGContextRelease(v7[1]);
    v7[1] = 0;
    if (Image)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7[11]);
      CGImageSetProperty();
      v4 = -[UIImage initWithCGImage:]([UIKBCachedImage alloc], "initWithCGImage:", Image);
      if (objc_msgSend(*(id *)(a1 + 32), "contentColorFormat") == 2)
      {
        -[CGContextRef singleColor](v7, "singleColor");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBCachedImage setFormatColor:](v4, "setFormatColor:", v5);

      }
      objc_msgSend((id)_MergedGlobals_1118, "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));
      BlendMode = CGContextGetBlendMode();
      CGContextSetBlendMode(v7[6], kCGBlendModeCopy);
      CGContextDrawImage(v7[6], *(CGRect *)(a1 + 56), Image);
      CGContextSetBlendMode(v7[6], BlendMode);

    }
    CGImageRelease(Image);
    WeakRetained = v7;
  }

}

- (BOOL)loadCachedImageForHashString:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIKBCachedImage *v11;
  uint64_t v12;
  UIImage *v13;
  UIImage *renderedImage;

  v4 = a3;
  v5 = 0;
  if (v4 && _MergedGlobals_1118)
  {
    -[UIKBRenderer cacheKey](self, "cacheKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UIKBRenderer renderFlags](self, "renderFlags"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByAppendingString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)_MergedGlobals_1118, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = [UIKBCachedImage alloc];
        v12 = objc_msgSend(objc_retainAutorelease(v10), "CGImage");
        -[UIKBRenderer scale](self, "scale");
        v13 = -[UIImage initWithCGImage:scale:orientation:](v11, "initWithCGImage:scale:orientation:", v12, 1);
        renderedImage = self->_renderedImage;
        self->_renderedImage = v13;

      }
      v5 = self->_renderedImage != 0;

    }
  }

  return v5;
}

- (void)_completeCacheImageWithTraitsIfNecessary:(id)a3
{
  void *v4;
  id cachingContextCompletion;
  id v6;

  objc_msgSend(a3, "hashString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    cachingContextCompletion = self->_cachingContextCompletion;

    if (cachingContextCompletion)
    {
      (*((void (**)(void))self->_cachingContextCompletion + 2))();
      v6 = self->_cachingContextCompletion;
      self->_cachingContextCompletion = 0;

    }
  }
}

- (void)renderBackgroundTraits:(id)a3
{
  id v4;

  v4 = a3;
  -[UIKBRenderer ensureContext](self, "ensureContext");
  -[UIKBRenderer renderBackgroundTraits:allowCaching:](self, "renderBackgroundTraits:allowCaching:", v4, 0);

}

- (void)renderKeyContents:(id)a3 withTraits:(id)a4
{
  id v6;
  id v7;
  CGContext *ctx;
  unint64_t v9;
  unint64_t v10;
  CGContext *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UIKBRenderer ensureContext](self, "ensureContext");
  ctx = self->_ctx;
  if (ctx)
    CGContextSaveGState(ctx);
  -[UIKBRenderer renderBackgroundTraits:allowCaching:](self, "renderBackgroundTraits:allowCaching:", v7, 1);
  if (objc_msgSend(v6, "stringKeycapOverImage"))
  {
    v9 = -[UIKBRenderer renderKeyStringContents:withTraits:status:](self, "renderKeyStringContents:withTraits:status:", v6, v7, 0);
    if (v9 != 3
      && !-[UIKBRenderer renderKeyImageContents:withTraits:status:](self, "renderKeyImageContents:withTraits:status:", v6, v7, v9))
    {
LABEL_9:
      -[UIKBRenderer renderKeyPathContents:withTraits:](self, "renderKeyPathContents:withTraits:", v6, v7);
    }
  }
  else
  {
    v10 = -[UIKBRenderer renderKeyImageContents:withTraits:status:](self, "renderKeyImageContents:withTraits:status:", v6, v7, 0);
    if (v10 != 3
      && !-[UIKBRenderer renderKeyStringContents:withTraits:status:](self, "renderKeyStringContents:withTraits:status:", v6, v7, v10))
    {
      goto LABEL_9;
    }
  }
  v11 = self->_ctx;
  if (v11)
    CGContextRestoreGState(v11);
  objc_msgSend(v7, "geometry");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12
    || (v13 = (void *)v12,
        objc_msgSend(v7, "geometry"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "flickDirection"),
        v14,
        v13,
        v15 == -3))
  {
    objc_msgSend(v6, "variantDisplayContents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKBRenderer _completeCacheImageWithTraitsIfNecessary:](self, "_completeCacheImageWithTraitsIfNecessary:", v7);
    if (!v16)
      goto LABEL_20;
    goto LABEL_19;
  }
  objc_msgSend(v7, "variantGeometries");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    objc_msgSend(v6, "variantDisplayContents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[UIKBRenderer _completeCacheImageWithTraitsIfNecessary:](self, "_completeCacheImageWithTraitsIfNecessary:", v7);
LABEL_19:
      -[UIKBRenderer _renderVariantsFromKeyContents:withTraits:](self, "_renderVariantsFromKeyContents:withTraits:", v6, v7);
      goto LABEL_20;
    }
  }
  objc_msgSend(v7, "variantTraits");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "geometry");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v6, "highlightedVariantsList", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v32;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v26);
          objc_msgSend(v6, "variantDisplayContents");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectAtIndex:", objc_msgSend(v27, "unsignedIntegerValue"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "variantTraits");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBRenderer renderKeyContents:withTraits:](self, "renderKeyContents:withTraits:", v29, v30);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v24);
    }

    -[UIKBRenderer _completeCacheImageWithTraitsIfNecessary:](self, "_completeCacheImageWithTraitsIfNecessary:", v7);
  }
LABEL_20:

}

- (void)_renderVariantsFromKeyContents:(id)a3 withTraits:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "variantDisplayContents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(v6, "variantGeometries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 != v10)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v5;
        _os_log_fault_impl(&dword_185066000, v27, OS_LOG_TYPE_FAULT, "keyboard: number of popups didn't match number of geometries: %@", buf, 0xCu);
      }

    }
    else
    {
      v25 = _renderVariantsFromKeyContents_withTraits____s_category;
      if (!_renderVariantsFromKeyContents_withTraits____s_category)
      {
        v25 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v25, (unint64_t *)&_renderVariantsFromKeyContents_withTraits____s_category);
      }
      v26 = *(NSObject **)(v25 + 8);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v5;
        _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "keyboard: number of popups didn't match number of geometries: %@", buf, 0xCu);
      }
    }
  }
  objc_msgSend(v5, "variantDisplayContents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  objc_msgSend(v6, "variantGeometries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 >= v14)
    v15 = v14;
  else
    v15 = v12;
  if (v15)
  {
    for (i = 0; i != v15; ++i)
    {
      objc_msgSend(v5, "variantDisplayContents");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndex:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18 != v19)
      {
        objc_msgSend(v5, "highlightedVariantsList");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "containsObject:", v21) & 1) != 0)
          objc_msgSend(v6, "highlightedVariantTraits");
        else
          objc_msgSend(v6, "variantTraits");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "variantGeometries");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndex:", i);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setGeometry:", v24);

        -[UIKBRenderer renderKeyContents:withTraits:](self, "renderKeyContents:withTraits:", v18, v22);
      }

    }
  }

}

- (void)_drawKeyImage:(id)a3 inRect:(CGRect)a4 withStyle:(id)a5 force1xImages:(BOOL)a6 flipHorizontally:(BOOL)a7 isRGBImage:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  double height;
  double width;
  double y;
  double x;
  id v17;
  _BOOL4 colorDetectMode;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  float v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  CGContext *ctx;
  id v61;
  CGImage *v62;
  id v63;
  CGRect v64;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v63 = a3;
  v17 = a5;
  colorDetectMode = self->_colorDetectMode;
  objc_msgSend(v17, "textColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (colorDetectMode)
  {
    -[UIKBRenderer detectColorsForNamedColor:](self, "detectColorsForNamedColor:", v19);
    goto LABEL_43;
  }
  v21 = UIKBGetNamedColor(v19);

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "textOpacity");
  if (v22 != 1.0)
  {
    objc_msgSend(v17, "textOpacity");
    objc_msgSend(v20, "colorWithAlphaComponent:");
    v23 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v23;
  }
  if (v8)
  {
    v24 = v63;
  }
  else
  {
    objc_msgSend(v63, "_flatImageWithColor:", v20);
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;
  objc_msgSend(v63, "scale");
  v27 = v26;
  objc_msgSend(v25, "size");
  v29 = v28;
  v31 = v30;
  if (objc_msgSend(v63, "isSymbolImage"))
  {
    objc_msgSend(v63, "contentInsets");
    v33 = v32;
    objc_msgSend(v63, "contentInsets");
    v31 = v31 - (v33 + v34);
    objc_msgSend(v63, "contentInsets");
    v36 = v35;
    objc_msgSend(v63, "contentInsets");
    v29 = v29 - (v36 + v37);
  }
  if (v10)
    v38 = v27;
  else
    v38 = 1.0;
  v39 = v38 * v31;
  v40 = v38 * v29;
  if (v40 > width || v39 > height)
  {
    v42 = width / v40;
    if (width / v40 >= height / v39)
      v42 = height / v39;
    v40 = v40 * v42;
    v39 = v39 * v42;
  }
  objc_msgSend(v17, "imageScale");
  if (v43 != 1.0)
  {
    objc_msgSend(v17, "imageScale");
    v40 = v40 * v44;
    objc_msgSend(v17, "imageScale");
    v39 = v39 * v45;
  }
  if (!objc_msgSend(v17, "anchorCorner"))
  {
    v49 = v27 * (width - v40) * 0.5;
    v50 = x + fabsf(roundf(v49)) / v27;
    objc_msgSend(v17, "textOffset");
    v47 = v50 + v51;
    *(float *)&v51 = v27 * (height - v39) * 0.5;
    v48 = fabsf(roundf(*(float *)&v51)) / v27 - y;
    goto LABEL_27;
  }
  if (objc_msgSend(v17, "anchorCorner") == 1)
  {
    objc_msgSend(v17, "textOffset");
    v47 = x + v46;
LABEL_25:
    v48 = height - y - v39;
LABEL_27:
    objc_msgSend(v17, "textOffset");
    y = v52;
LABEL_35:
    v55 = v48 - y;
    goto LABEL_36;
  }
  if (objc_msgSend(v17, "anchorCorner") == 4)
  {
    objc_msgSend(v17, "textOffset");
    v47 = x + v53;
LABEL_34:
    objc_msgSend(v17, "textOffset");
    v48 = v57;
    goto LABEL_35;
  }
  if (objc_msgSend(v17, "anchorCorner") == 2)
  {
    objc_msgSend(v17, "textOffset");
    v47 = x + width - v40 - v54;
    goto LABEL_25;
  }
  v55 = 0.0;
  v47 = 0.0;
  if (objc_msgSend(v17, "anchorCorner") == 8)
  {
    objc_msgSend(v17, "textOffset");
    v47 = x + width - v40 - v56;
    goto LABEL_34;
  }
LABEL_36:
  if (v9)
    v58 = -v47 - v40;
  else
    v58 = v47;
  if (v9)
    v59 = -1.0;
  else
    v59 = 1.0;
  CGContextSaveGState(self->_ctx);
  CGContextTranslateCTM(self->_ctx, 0.0, height);
  CGContextScaleCTM(self->_ctx, v59, -1.0);
  ctx = self->_ctx;
  v61 = objc_retainAutorelease(v25);
  v62 = (CGImage *)objc_msgSend(v61, "CGImage");
  v64.origin.x = v58;
  v64.origin.y = v55;
  v64.size.width = v40;
  v64.size.height = v39;
  CGContextDrawImage(ctx, v64, v62);
  CGContextRestoreGState(self->_ctx);

LABEL_43:
}

- (unint64_t)renderKeyImageContents:(id)a3 withTraits:(id)a4 status:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v52;
  _QWORD v53[5];
  id v54;
  id v55;
  id v56;
  uint64_t *v57;
  uint64_t v58;
  unint64_t v59;
  _QWORD v60[5];
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  unint64_t v65;

  v8 = a3;
  v9 = a4;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = a5;
  if ((-[UIKBRenderer renderFlags](self, "renderFlags") & 0x34) != 0)
  {
    v10 = MEMORY[0x1E0C809B0];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __57__UIKBRenderer_renderKeyImageContents_withTraits_status___block_invoke;
    v60[3] = &unk_1E16CB090;
    v60[4] = self;
    v11 = v9;
    v61 = v11;
    +[UITraitCollection traitCollectionWithTraits:](UITraitCollection, "traitCollectionWithTraits:", v60);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a5 & 2) == 0)
    {
      objc_msgSend(v8, "secondaryDisplayStringImages");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        objc_msgSend(v11, "secondarySymbolStyles");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v14)
        {
          objc_msgSend(v8, "secondaryDisplayStringImages");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

          objc_msgSend(v11, "secondarySymbolStyles");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

          if (objc_msgSend(v11, "renderSecondarySymbolsSeparately"))
          {
            if ((-[UIKBRenderer renderFlags](self, "renderFlags") & 0x20) != 0)
            {
              v19 = 1;
              goto LABEL_32;
            }
            if ((-[UIKBRenderer renderFlags](self, "renderFlags") & 0x10) != 0)
            {
              v19 = 0;
LABEL_32:
              if (v19 >= v16)
              {
                v42 = 0;
                v41 = 0;
              }
              else
              {
                objc_msgSend(v8, "secondaryDisplayStringImages");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "objectAtIndex:", v19);
                v41 = (void *)objc_claimAutoreleasedReturnValue();

                if (v41)
                {
                  _UIImageWithNameAndTraitCollection(v41, v52);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v42 = 0;
                }
              }
              if (v19 >= v18
                || (objc_msgSend(v11, "secondarySymbolStyles"),
                    v43 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v43, "objectAtIndex:", v19),
                    v44 = (void *)objc_claimAutoreleasedReturnValue(),
                    v43,
                    !v44))
              {
                objc_msgSend(v11, "secondarySymbolStyles");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "lastObject");
                v44 = (void *)objc_claimAutoreleasedReturnValue();

              }
              if (v42)
              {
                objc_msgSend(v11, "geometry");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "symbolFrame");
                -[UIKBRenderer _drawKeyImage:inRect:withStyle:force1xImages:flipHorizontally:isRGBImage:](self, "_drawKeyImage:inRect:withStyle:force1xImages:flipHorizontally:isRGBImage:", v42, v44, objc_msgSend(v8, "force1xImages"), objc_msgSend(v8, "flipImageHorizontally"), 0, v47, v48, v49, v50);

                v63[3] = 3;
              }

            }
          }
          else
          {
            objc_msgSend(v8, "secondaryDisplayStringImages");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v53[0] = v10;
            v53[1] = 3221225472;
            v53[2] = __57__UIKBRenderer_renderKeyImageContents_withTraits_status___block_invoke_2;
            v53[3] = &unk_1E16D3ED8;
            v53[4] = self;
            v58 = 52;
            v59 = v18;
            v54 = v11;
            v55 = v52;
            v56 = v8;
            v57 = &v62;
            objc_msgSend(v34, "enumerateObjectsUsingBlock:", v53);

          }
LABEL_43:
          v20 = v63[3];
          goto LABEL_44;
        }
      }
      else
      {

      }
    }
    if ((a5 & 1) != 0)
      goto LABEL_43;
    objc_msgSend(v8, "displayStringImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "symbolStyle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "usesSymbolImage"))
    {
      -[UIKBRenderer symbolImageConfigForKey:traitCollection:](self, "symbolImageConfigForKey:traitCollection:", v11, v52);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundlePathOverride");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v25 = (void *)MEMORY[0x1E0CB34D0];
        objc_msgSend(v8, "bundlePathOverride");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bundleWithPath:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        +[UIImage imageNamed:inBundle:withConfiguration:](UIImage, "imageNamed:inBundle:withConfiguration:", v21, v27, v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "imageWithRenderingMode:", -[UIKBRenderer symbolImageRenderingModeForIdiom:](self, "symbolImageRenderingModeForIdiom:", -[UIKBRenderer assetIdiom](self, "assetIdiom")));
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v21, v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "imageWithRenderingMode:", -[UIKBRenderer symbolImageRenderingModeForIdiom:](self, "symbolImageRenderingModeForIdiom:", -[UIKBRenderer assetIdiom](self, "assetIdiom")));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(v8, "displayImage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend(v8, "displayImage");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 1;
        if (v29)
          goto LABEL_24;
        goto LABEL_17;
      }
      _UIImageWithNameAndTraitCollection(v21, v52);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v31 = 0;
    if (v29)
    {
LABEL_24:
      v33 = v21;
      if (!v29)
        goto LABEL_30;
      goto LABEL_28;
    }
LABEL_17:
    objc_msgSend(v8, "fallbackContents");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "displayStringImage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v22, "usesSymbolImage"))
      +[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", v33, v52);
    else
      _UIImageWithNameAndTraitCollection(v33, v52);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
      goto LABEL_30;
LABEL_28:
    if (v22)
    {
      objc_msgSend(v11, "geometry");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "symbolFrame");
      -[UIKBRenderer _drawKeyImage:inRect:withStyle:force1xImages:flipHorizontally:isRGBImage:](self, "_drawKeyImage:inRect:withStyle:force1xImages:flipHorizontally:isRGBImage:", v29, v22, objc_msgSend(v8, "force1xImages"), objc_msgSend(v8, "flipImageHorizontally"), v31, v36, v37, v38, v39);

      v63[3] = 3;
      goto LABEL_43;
    }
LABEL_30:
    v20 = v63[3];

LABEL_44:
    goto LABEL_45;
  }
  v20 = v63[3];
LABEL_45:
  _Block_object_dispose(&v62, 8);

  return v20;
}

void __57__UIKBRenderer_renderKeyImageContents_withTraits_status___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setUserInterfaceIdiom:", objc_msgSend(v3, "assetIdiom"));
  objc_msgSend(*(id *)(a1 + 32), "scale");
  objc_msgSend(v5, "setDisplayScale:");
  if (objc_msgSend(*(id *)(a1 + 40), "usesDarkAppearance"))
    v4 = 2;
  else
    v4 = 1;
  objc_msgSend(v5, "setUserInterfaceStyle:", v4);
  objc_msgSend(v5, "setLayoutDirection:", 0);

}

void __57__UIKBRenderer_renderKeyImageContents_withTraits_status___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a2;
  if (objc_msgSend(v15, "length") && (*(_QWORD *)(a1 + 72) & objc_msgSend(*(id *)(a1 + 32), "renderFlags")) != 0)
  {
    if (*(_QWORD *)(a1 + 80) <= a3
      || (objc_msgSend(*(id *)(a1 + 40), "secondarySymbolStyles"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "objectAtIndex:", a3),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          !v6))
    {
      objc_msgSend(*(id *)(a1 + 40), "secondarySymbolStyles");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    _UIImageWithNameAndTraitCollection(v15, *(void **)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "geometry");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "symbolFrame");
      objc_msgSend(v9, "_drawKeyImage:inRect:withStyle:force1xImages:flipHorizontally:isRGBImage:", v8, v6, objc_msgSend(*(id *)(a1 + 56), "force1xImages"), objc_msgSend(*(id *)(a1 + 56), "flipImageHorizontally"), 0, v11, v12, v13, v14);

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= 2uLL;
    }

  }
}

- (id)symbolImageConfigForKey:(id)a3 traitCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "symbolStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontWeightForSymbolImage");
  v8 = UISIndexForFontWeight();

  if (!v8)
  {
    objc_msgSend(v5, "symbolStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fontWeight");
    v10 = UISIndexForFontWeight();

    if (v10)
      v8 = v10;
    else
      v8 = 4;
  }
  objc_msgSend(v5, "symbolStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fontSizeForSymbolImage");
  v13 = v12;

  if (v13 == 0.0)
  {
    objc_msgSend(v5, "symbolStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fontSize");
    v13 = v15;

  }
  objc_msgSend(v5, "symbolStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", v8, objc_msgSend(v16, "symbolScale"), v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "configurationWithTraitCollection:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (int64_t)symbolImageRenderingModeForIdiom:(int64_t)a3
{
  return 2 * (a3 != 2);
}

- (BOOL)_drawSingleSymbol:(id)a3 inRect:(CGRect)a4 withStyle:(id)a5
{
  double height;
  double width;
  double y;
  CGFloat x;
  id v11;
  id v12;
  __int16 v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  const __CTFont *v22;
  double v23;
  _BOOL4 v24;
  double v25;
  double XHeight;
  double v27;
  void *v28;
  CGColor *CopyWithAlpha;
  double v30;
  CGFloat v31;
  BOOL v32;
  CGContext *ctx;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  CGContext *v41;
  void *v42;
  CGColor *v43;
  double v44;
  double v45;
  double v47;
  CGAffineTransform v48;
  CGPoint positions;
  CGGlyph glyphs;
  CGRect OpticalBoundsForGlyphs;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  if (objc_msgSend(v11, "length") == 1)
  {
    v13 = objc_msgSend(v11, "characterAtIndex:", 0);
    objc_msgSend(v12, "fontName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fontSize");
    v16 = v15;
    objc_msgSend(v12, "fontWeight");
    v18 = v17;
    objc_msgSend(v12, "fontWidth");
    v20 = v19;
    v21 = UIKBGlyphForCharacter(v14, v13, v16, v18, v19);
    glyphs = v21;
    if (!v21)
      goto LABEL_16;
    v47 = x;
    do
    {
      v22 = (const __CTFont *)UIKBCreateCTFont(v14, v16, v18, v20);
      OpticalBoundsForGlyphs = CTFontGetOpticalBoundsForGlyphs(v22, &glyphs, 0, 1, 0);
      v23 = OpticalBoundsForGlyphs.size.width;
      v24 = OpticalBoundsForGlyphs.size.width > width + -4.0;
      if (OpticalBoundsForGlyphs.size.height > height)
        v24 = 1;
      if (v24)
        v16 = v16 + -1.0;
    }
    while (v24 && v16 > 0.0);
    objc_msgSend(v12, "minFontSize");
    if (v16 >= v25)
    {
      XHeight = UIKBGetXHeight(v14, v16);
      if (XHeight == 0.0)
        XHeight = CTFontGetXHeight(v22);
      v27 = y + height * 0.5 + XHeight * 0.5;
      objc_msgSend(v12, "textColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      CopyWithAlpha = (CGColor *)UIKBGetNamedColor(v28);

      objc_msgSend(v12, "textOpacity");
      if (v30 == 1.0)
      {
        CGColorRetain(CopyWithAlpha);
      }
      else
      {
        objc_msgSend(v12, "textOpacity");
        CopyWithAlpha = CGColorCreateCopyWithAlpha(CopyWithAlpha, v31);
      }
      CGContextSaveGState(self->_ctx);
      ctx = self->_ctx;
      CGAffineTransformMakeScale(&v48, 1.0, -1.0);
      CGContextSetTextMatrix(ctx, &v48);
      objc_msgSend(v12, "textOffset");
      v35 = v34;
      objc_msgSend(v12, "etchOffset");
      positions.x = floor(v47 + (width - ceil(v23)) * 0.5 + 0.5) + v35 + v36;
      objc_msgSend(v12, "textOffset");
      v38 = v37;
      objc_msgSend(v12, "etchOffset");
      positions.y = -ceil(v27) - (v38 + v39);
      objc_msgSend(v12, "etchColor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        v41 = self->_ctx;
        objc_msgSend(v12, "etchColor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (CGColor *)UIKBGetNamedColor(v42);
        CGContextSetFillColorWithColor(v41, v43);

        CTFontDrawGlyphs(v22, &glyphs, &positions, 1uLL, self->_ctx);
      }
      objc_msgSend(v12, "etchOffset");
      positions.x = positions.x - v44;
      objc_msgSend(v12, "etchOffset");
      positions.y = positions.y + v45;
      CGContextSetFillColorWithColor(self->_ctx, CopyWithAlpha);
      v32 = 1;
      CTFontDrawGlyphs(v22, &glyphs, &positions, 1uLL, self->_ctx);
      CGContextRestoreGState(self->_ctx);
      CGColorRelease(CopyWithAlpha);
    }
    else
    {
LABEL_16:
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (BOOL)_drawKeyString:(id)a3 inRect:(CGRect)a4 withStyle:(id)a5
{
  void *v5;
  double height;
  double width;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  UIColor *singleColor;
  double v19;
  double v20;
  double v22;
  double v23;
  void *v24;
  int v25;
  double v26;
  unint64_t v27;
  double v28;
  uint64_t v29;
  double v30;
  int v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  const __CTLine *v41;
  double v42;
  double v43;
  char v44;
  double v45;
  void *v46;
  CGColor *CopyWithAlpha;
  double v48;
  CGFloat v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double TypographicBounds;
  double PenOffsetForFlush;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  CGContext *ctx;
  void *v108;
  CGColor *v109;
  double v110;
  double v111;
  double v112;
  unint64_t v113;
  NSObject *v114;
  NSObject *v115;
  BOOL v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  void *v123;
  UIKBRenderer *v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  CGColor *v132;
  double v133;
  double v134;
  double v135;
  int v136;
  double v137;
  double x;
  double y;
  uint8_t buf[8];
  double v141;
  double v142[2];
  CGRect v143;

  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  y = a4.origin.y;
  v10 = a3;
  v11 = a5;
  if (!objc_msgSend(v10, "length"))
    goto LABEL_17;
  objc_msgSend(v11, "fontName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v143.origin.x = x;
    v143.origin.y = y;
    v143.size.width = width;
    v143.size.height = height;
    if (!CGRectIsEmpty(v143))
    {
      if (self->_colorDetectMode)
      {
        objc_msgSend(v11, "textColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBRenderer detectColorsForNamedColor:](self, "detectColorsForNamedColor:", v14);

        objc_msgSend(v11, "etchColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBRenderer detectColorsForNamedColor:](self, "detectColorsForNamedColor:", v15);

        if (self->_contentColorFormat)
        {
          objc_msgSend(v11, "fontName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("AppleColorEmoji"));

          if (v17)
          {
            self->_contentColorFormat = 0;
            self->_colorCount = 2;
            singleColor = self->_singleColor;
            self->_singleColor = 0;

          }
        }
        goto LABEL_17;
      }
      if (objc_msgSend(v11, "anchorCorner") != 1 && objc_msgSend(v11, "anchorCorner") != 4)
      {
        if (objc_msgSend(v11, "anchorCorner") != 2 && objc_msgSend(v11, "anchorCorner") != 8)
        {
LABEL_15:
          if (!objc_msgSend(v11, "selector")
            && -[UIKBRenderer _drawSingleSymbol:inRect:withStyle:](self, "_drawSingleSymbol:inRect:withStyle:", v10, v11, x, y, width, height))
          {
LABEL_17:
            v13 = 1;
            goto LABEL_18;
          }
          v142[0] = 0.0;
          v133 = height;
          v134 = width;
          v124 = self;
          if (objc_msgSend(v10, "rangeOfString:options:", CFSTR("\n"), 2) == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v11, "fontSize");
            v23 = v22;
            v24 = 0;
            v141 = v22;
            v25 = 1;
            v26 = v22;
          }
          else
          {
            objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("\n"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v24, "count");
            if (v27 >= 3)
              v25 = 3;
            else
              v25 = v27;
            objc_msgSend(v11, "fontSize");
            v26 = v28;
            if (!v25)
            {
              v41 = 0;
              v44 = 1;
              v137 = INFINITY;
              v30 = v28;
LABEL_48:
              v141 = v30;
              v142[0] = v26;
              objc_msgSend(v11, "minFontSize");
              v13 = v30 >= v45;
              if (v30 < v45)
              {
                if (v41)
                  CFRelease(v41);
                goto LABEL_57;
              }
              objc_msgSend(v11, "textColor");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              CopyWithAlpha = (CGColor *)UIKBGetNamedColor(v46);

              objc_msgSend(v11, "textOpacity");
              v116 = v13;
              if (v48 == 1.0)
              {
                CGColorRetain(CopyWithAlpha);
              }
              else
              {
                objc_msgSend(v11, "textOpacity");
                CopyWithAlpha = CGColorCreateCopyWithAlpha(CopyWithAlpha, v49);
              }
              if ((v44 & 1) != 0)
              {
LABEL_56:
                CGColorRelease(CopyWithAlpha);
                v13 = v116;
LABEL_57:

                goto LABEL_18;
              }
              v50 = 0;
              v120 = v26 + v26;
              v121 = y + (1.5 - (double)v25) * v26;
              v128 = height / (double)v25;
              v130 = (double)v25;
              v126 = width / (double)v25;
              v122 = floor(x + 0.5);
              v117 = width * 0.5;
              v51 = v25;
              v118 = height * 0.5;
              v119 = x + (width - v137 * (double)(v25 - 1)) * 0.5;
              v136 = v25;
              v132 = CopyWithAlpha;
              while (1)
              {
                if (objc_msgSend(v11, "isVertical"))
                  v52 = v51 - 1;
                else
                  v52 = v50;
                v53 = objc_msgSend(v11, "isVertical");
                v54 = (double)v52;
                if (v53)
                  v55 = x + width * (double)v52 / v130;
                else
                  v55 = x;
                if (v53)
                  v56 = y;
                else
                  v56 = y + height * (double)v52 / v130;
                if (v53)
                  v57 = v126;
                else
                  v57 = width;
                if (v53)
                  v58 = height;
                else
                  v58 = v128;
                if (v25 != 1)
                {
                  v59 = v10;
                  if (v24)
                  {
                    objc_msgSend(v24, "objectAtIndex:", v50);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    v123 = v59;
                  }
                  objc_msgSend(v11, "fontName");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "fontWeight");
                  v62 = v61;
                  objc_msgSend(v11, "fontWidth");
                  v64 = v63;
                  objc_msgSend(v11, "kerning");
                  v41 = UIKBCreateFitCTLine(v59, v60, &v141, v142, objc_msgSend(v11, "selector"), objc_msgSend(v11, "ignoreTextMarginOnKey"), objc_msgSend(v11, "isVertical"), v55, v56, v57, v58, v62, v64, v65);

                  if (v24)
                  height = v133;
                }
                width = v134;
                TypographicBounds = CTLineGetTypographicBounds(v41, 0, 0, 0);
                if (objc_msgSend(v11, "isVertical"))
                {
                  if (objc_msgSend(v11, "anchorCorner") || objc_msgSend(v11, "alignment") != 1)
                  {
                    if (os_variant_has_internal_diagnostics())
                    {
                      __UIFaultDebugAssertLog();
                      v115 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v115, OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_fault_impl(&dword_185066000, v115, OS_LOG_TYPE_FAULT, "only alignment center is supported in vertical orientation", buf, 2u);
                      }

                      height = v133;
                      width = v134;
                    }
                    else
                    {
                      v113 = _drawKeyString_inRect_withStyle____s_category;
                      if (!_drawKeyString_inRect_withStyle____s_category)
                      {
                        v113 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                        atomic_store(v113, (unint64_t *)&_drawKeyString_inRect_withStyle____s_category);
                      }
                      v114 = *(NSObject **)(v113 + 8);
                      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_185066000, v114, OS_LOG_TYPE_ERROR, "only alignment center is supported in vertical orientation", buf, 2u);
                      }
                    }
                  }
                  PenOffsetForFlush = CTLineGetPenOffsetForFlush(v41, 0.5, height);
                  objc_msgSend(v11, "textOffset");
                  v69 = PenOffsetForFlush + v68;
                  objc_msgSend(v11, "etchOffset");
                  v71 = y + v69 + v70;
                  objc_msgSend(v11, "textOffset");
                  v73 = v72;
                  objc_msgSend(v11, "etchOffset");
                  v75 = ceil(v119 + v137 * v54) + v73 + v74;
                  goto LABEL_105;
                }
                v71 = ceil(v121 + v120 * v54);
                if (objc_msgSend(v11, "anchorCorner"))
                {
                  if (objc_msgSend(v11, "anchorCorner") == 1)
                  {
                    objc_msgSend(v11, "textOffset");
                    v77 = v76;
                    objc_msgSend(v11, "etchOffset");
                    v79 = v77 + v78;
                    goto LABEL_87;
                  }
                  if (objc_msgSend(v11, "anchorCorner") == 4)
                  {
                    objc_msgSend(v11, "textOffset");
                    v87 = v86;
                    objc_msgSend(v11, "etchOffset");
                    v89 = v87 + v88;
                    goto LABEL_103;
                  }
                  if (objc_msgSend(v11, "anchorCorner") == 2)
                  {
                    objc_msgSend(v11, "textOffset");
                    v91 = v134 - v90 - TypographicBounds;
                    objc_msgSend(v11, "etchOffset");
                    v79 = v92 + v91;
LABEL_87:
                    v75 = v122 + v79;
                    v80 = v142[0];
                    objc_msgSend(v11, "textOffset");
                    v82 = v80 + v81;
                    objc_msgSend(v11, "etchOffset");
                    v84 = v82 + v83;
                  }
                  else
                  {
                    if (objc_msgSend(v11, "anchorCorner") != 8)
                    {
                      v75 = v122;
                      goto LABEL_105;
                    }
                    objc_msgSend(v11, "textOffset");
                    v100 = v134 - v99 - TypographicBounds;
                    objc_msgSend(v11, "etchOffset");
                    v89 = v101 + v100;
LABEL_103:
                    v75 = v122 + v89;
                    v102 = height - v142[0];
                    objc_msgSend(v11, "textOffset");
                    v104 = v102 - v103;
                    objc_msgSend(v11, "etchOffset");
                    v84 = v104 - v105;
                  }
                  v71 = v71 + v84;
                  goto LABEL_105;
                }
                if (objc_msgSend(v11, "alignment") == 1)
                  break;
                v85 = v117;
                if (!objc_msgSend(v11, "alignment"))
                  goto LABEL_99;
                v75 = v122;
                if (objc_msgSend(v11, "alignment") == 2)
                {
                  v85 = v117 - TypographicBounds;
LABEL_99:
                  objc_msgSend(v11, "textOffset");
                  v94 = v85 + v93;
                  objc_msgSend(v11, "etchOffset");
                  v75 = v122 + v94 + v95;
                }
                objc_msgSend(v11, "textOffset");
                v97 = v118 + v96;
                objc_msgSend(v11, "etchOffset");
                v71 = v71 + v97 + v98;
                height = v133;
LABEL_105:
                objc_msgSend(v11, "etchColor");
                v106 = (void *)objc_claimAutoreleasedReturnValue();

                if (v106)
                {
                  ctx = v124->_ctx;
                  objc_msgSend(v11, "etchColor");
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  v109 = (CGColor *)UIKBGetNamedColor(v108);
                  UIKBDrawCTLineAtPoint(ctx, v41, v109, objc_msgSend(v11, "isVertical"), v75, v71);

                }
                objc_msgSend(v11, "etchOffset");
                v111 = v75 - v110;
                objc_msgSend(v11, "etchOffset");
                CopyWithAlpha = v132;
                UIKBDrawCTLineAtPoint(v124->_ctx, v41, v132, objc_msgSend(v11, "isVertical"), v111, v71 - v112);
                if (v41)
                  CFRelease(v41);
                ++v50;
                --v51;
                v25 = v136;
                if (!v51)
                  goto LABEL_56;
              }
              if (v134 - TypographicBounds >= 0.0)
                v85 = CTLineGetPenOffsetForFlush(v41, 0.5, v134);
              else
                v85 = (v134 - TypographicBounds) * 0.5;
              goto LABEL_99;
            }
            v23 = v28;
          }
          v29 = 0;
          v127 = height / (double)v25;
          v129 = (double)v25;
          v137 = INFINITY;
          v30 = v23;
          v125 = width / (double)v25;
          v131 = v23;
          do
          {
            v135 = v26;
            v31 = objc_msgSend(v11, "isVertical");
            if (v31)
              v32 = x + width * (double)(int)v29 / v129;
            else
              v32 = x;
            if (v31)
              v33 = y;
            else
              v33 = y + height * (double)(int)v29 / v129;
            if (v31)
              width = v125;
            else
              height = v127;
            *(double *)buf = v23;
            v34 = v10;
            if (v24)
            {
              objc_msgSend(v24, "objectAtIndex:", v29);
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v5;
            }
            objc_msgSend(v11, "fontName");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "fontWeight");
            v37 = v36;
            objc_msgSend(v11, "fontWidth");
            v39 = v38;
            objc_msgSend(v11, "kerning");
            v41 = UIKBCreateFitCTLine(v34, v35, (double *)buf, v142, objc_msgSend(v11, "selector"), objc_msgSend(v11, "ignoreTextMarginOnKey"), objc_msgSend(v11, "isVertical"), v32, v33, width, height, v37, v39, v40);

            if (v24)
            v26 = v135;
            if (*(double *)buf <= v30)
            {
              v26 = v142[0];
              v30 = *(double *)buf;
            }
            v42 = CTLineGetTypographicBounds(v41, 0, 0, 0);
            v43 = v137;
            if (v42 < v137)
              v43 = v42;
            v137 = v43;
            height = v133;
            width = v134;
            if (v25 != 1)
            {
              CFRelease(v41);
              v41 = 0;
            }
            v23 = v131;
            ++v29;
          }
          while (v25 != v29);
          v44 = 0;
          goto LABEL_48;
        }
        objc_msgSend(v11, "textOffset");
        x = x + v19;
      }
      objc_msgSend(v11, "textOffset");
      width = width - v20;
      goto LABEL_15;
    }
  }
  v13 = 0;
LABEL_18:

  return v13;
}

- (unint64_t)renderKeyStringContents:(id)a3 withTraits:(id)a4 status:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  _BOOL4 v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  BOOL v45;
  int64_t v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  unint64_t v59;
  void *v60;
  unint64_t v61;
  unint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  unint64_t v70;
  _QWORD v72[5];
  id v73;
  uint64_t *v74;
  uint64_t v75;
  unint64_t v76;
  BOOL v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  unint64_t v81;

  v8 = a3;
  v9 = a4;
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = a5;
  objc_msgSend(v8, "displayString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIKBRenderer renderFlags](self, "renderFlags");
  if (!v9 || (v11 & 0x34) == 0 || !v10)
    goto LABEL_42;
  if (objc_msgSend(v9, "renderSecondarySymbolsSeparately"))
    v12 = 4;
  else
    v12 = 52;
  if ((a5 & 2) == 0)
  {
    objc_msgSend(v8, "secondaryDisplayStrings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v9, "secondarySymbolStyles");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        objc_msgSend(v8, "displayString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");
        v18 = v17 != 0;

        if (v17)
        {
          objc_msgSend(v8, "displayStringImage");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "length"))
          {

          }
          else
          {
            v46 = -[UIKBRenderer renderFlags](self, "renderFlags") & v12;

            if (v46)
            {
              objc_msgSend(v8, "displayString");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "geometry");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "symbolFrame");
              v50 = v49;
              v52 = v51;
              v54 = v53;
              v56 = v55;
              objc_msgSend(v9, "symbolStyle");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIKBRenderer _drawKeyString:inRect:withStyle:](self, "_drawKeyString:inRect:withStyle:", v47, v57, v50, v52, v54, v56);

              v79[3] |= 1uLL;
            }
          }
        }
        objc_msgSend(v8, "secondaryDisplayStrings");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "count");

        objc_msgSend(v9, "secondarySymbolStyles");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "count");

        if (!objc_msgSend(v9, "renderSecondarySymbolsSeparately"))
        {
          objc_msgSend(v8, "secondaryDisplayStrings");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v72[0] = MEMORY[0x1E0C809B0];
          v72[1] = 3221225472;
          v72[2] = __58__UIKBRenderer_renderKeyStringContents_withTraits_status___block_invoke;
          v72[3] = &unk_1E16D3F00;
          v72[4] = self;
          v75 = 52;
          v76 = v61;
          v77 = v18;
          v73 = v9;
          v74 = &v78;
          objc_msgSend(v63, "enumerateObjectsUsingBlock:", v72);

          goto LABEL_42;
        }
        if ((-[UIKBRenderer renderFlags](self, "renderFlags") & 0x20) != 0)
        {
          v62 = 1;
        }
        else
        {
          if ((-[UIKBRenderer renderFlags](self, "renderFlags") & 0x10) == 0)
            goto LABEL_42;
          v62 = 0;
        }
        if (v62 >= v59)
        {
          v65 = 0;
        }
        else
        {
          objc_msgSend(v8, "secondaryDisplayStrings");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectAtIndex:", v62);
          v65 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (v62 >= v61
          || (objc_msgSend(v9, "secondarySymbolStyles"),
              v66 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v66, "objectAtIndex:", v62),
              v67 = (void *)objc_claimAutoreleasedReturnValue(),
              v66,
              !v67))
        {
          objc_msgSend(v9, "secondarySymbolStyles");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "lastObject");
          v67 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (objc_msgSend(v65, "length"))
        {
          if (!v17)
            objc_msgSend(v67, "setTextOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
          objc_msgSend(v9, "geometry");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "symbolFrame");
          -[UIKBRenderer _drawKeyString:inRect:withStyle:](self, "_drawKeyString:inRect:withStyle:", v65, v67);

          v79[3] = 3;
        }

        goto LABEL_42;
      }
    }
    else
    {

    }
  }
  if ((a5 & 1) == 0)
  {
    objc_msgSend(v9, "geometry");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "symbolFrame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(v9, "symbolStyle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[UIKBRenderer _drawKeyString:inRect:withStyle:](self, "_drawKeyString:inRect:withStyle:", v10, v29, v22, v24, v26, v28);

    if ((objc_msgSend(v8, "stringKeycapOverImage") & 1) != 0)
    {
      v31 = 0;
    }
    else
    {
      objc_msgSend(v8, "displayStringImage");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v32 != 0;

    }
    if (v30 || v31)
    {
      if (!v30)
        goto LABEL_42;
    }
    else
    {
      objc_msgSend(v8, "fallbackContents");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "displayString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "geometry");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "symbolFrame");
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v43 = v42;
      objc_msgSend(v9, "fallbackSymbolStyle");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[UIKBRenderer _drawKeyString:inRect:withStyle:](self, "_drawKeyString:inRect:withStyle:", v34, v44, v37, v39, v41, v43);

      if (!v45)
        goto LABEL_42;
    }
    v79[3] = 3;
  }
LABEL_42:
  v70 = v79[3];

  _Block_object_dispose(&v78, 8);
  return v70;
}

void __58__UIKBRenderer_renderKeyStringContents_withTraits_status___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "length") && (*(_QWORD *)(a1 + 56) & objc_msgSend(*(id *)(a1 + 32), "renderFlags")) != 0)
  {
    if (*(_QWORD *)(a1 + 64) <= a3
      || (objc_msgSend(*(id *)(a1 + 40), "secondarySymbolStyles"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "objectAtIndex:", a3),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          !v6))
    {
      objc_msgSend(*(id *)(a1 + 40), "secondarySymbolStyles");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!*(_BYTE *)(a1 + 72))
      objc_msgSend(v6, "setTextOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "geometry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "symbolFrame");
    objc_msgSend(v8, "_drawKeyString:inRect:withStyle:", v10, v6);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= 2uLL;
  }

}

- (CGPath)_thinShiftGlyphPath
{
  if (qword_1ECD7ED80 != -1)
    dispatch_once(&qword_1ECD7ED80, &__block_literal_global_34_1);
  return (CGPath *)qword_1ECD7ED78;
}

CGMutablePathRef __35__UIKBRenderer__thinShiftGlyphPath__block_invoke()
{
  CGMutablePathRef result;

  result = createMutablePathWithPoints(dbl_186680410, 10, 1);
  qword_1ECD7ED78 = (uint64_t)result;
  return result;
}

- (CGPath)_thickShiftGlyphPath
{
  if (qword_1ECD7ED90 != -1)
    dispatch_once(&qword_1ECD7ED90, &__block_literal_global_35_0);
  return (CGPath *)qword_1ECD7ED88;
}

CGMutablePathRef __36__UIKBRenderer__thickShiftGlyphPath__block_invoke()
{
  CGMutablePathRef result;

  result = createMutablePathWithPoints(dbl_1866804B0, 10, 1);
  qword_1ECD7ED88 = (uint64_t)result;
  return result;
}

- (CGPath)_deleteGlyphPaths
{
  if (qword_1ECD7EDA0 != -1)
    dispatch_once(&qword_1ECD7EDA0, &__block_literal_global_37_2);
  return (CGPath *)qword_1ECD7ED98;
}

CGMutablePathRef __33__UIKBRenderer__deleteGlyphPaths__block_invoke()
{
  CGMutablePathRef result;

  result = createMutablePathWithPoints(dbl_186680550, 13, 1);
  qword_1ECD7ED98 = (uint64_t)result;
  return result;
}

- (void)drawPath:(CGPath *)a3 weight:(double)a4 transform:(CGAffineTransform *)a5 color:(CGColor *)a6 fill:(BOOL)a7
{
  _BOOL4 v8;
  const CGPath *MutableCopyByTransformingPath;

  if (a3 && a6)
  {
    v8 = a7;
    MutableCopyByTransformingPath = CGPathCreateMutableCopyByTransformingPath(a3, a5);
    CGContextSaveGState(self->_ctx);
    CGContextSetLineWidth(self->_ctx, a4);
    CGContextSetLineJoin(self->_ctx, kCGLineJoinMiter);
    CGContextSetLineCap(self->_ctx, kCGLineCapSquare);
    if (v8)
    {
      CGContextAddPath(self->_ctx, MutableCopyByTransformingPath);
      CGContextSetFillColorWithColor(self->_ctx, a6);
      CGContextFillPath(self->_ctx);
    }
    CGContextAddPath(self->_ctx, MutableCopyByTransformingPath);
    CGContextSetStrokeColorWithColor(self->_ctx, a6);
    CGContextStrokePath(self->_ctx);
    CGPathRelease(MutableCopyByTransformingPath);
    CGContextRestoreGState(self->_ctx);
  }
}

- (void)drawShiftPath:(BOOL)a3 weight:(double)a4 transform:(CGAffineTransform *)a5 color:(CGColor *)a6
{
  double v10;
  const CGPath *MutablePathWithPoints;
  const CGPath *MutableCopyByTransformingPath;
  const CGPath *v13;
  const CGPath *v14;
  __int128 v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a6)
  {
    if (a3)
      v10 = 0.0;
    else
      v10 = 0.12;
    MutablePathWithPoints = createMutablePathWithPoints(dbl_186680620, 7, 0);
    MutableCopyByTransformingPath = CGPathCreateMutableCopyByTransformingPath(MutablePathWithPoints, a5);
    v15 = xmmword_1866806B0;
    v16 = 0x3FE0000000000000;
    v17 = 6.0 - v10;
    v18 = 0x4023000000000000;
    v19 = 15.0 - v10;
    v20 = 0x4032800000000000;
    v21 = 6.0 - v10;
    v22 = xmmword_1866806C0;
    v13 = createMutablePathWithPoints((CGFloat *)&v15, 5, 0);
    v14 = CGPathCreateMutableCopyByTransformingPath(v13, a5);
    CGContextSaveGState(self->_ctx);
    CGContextSetLineJoin(self->_ctx, kCGLineJoinMiter);
    CGContextSetLineCap(self->_ctx, kCGLineCapButt);
    CGContextSetLineWidth(self->_ctx, a4);
    CGContextAddPath(self->_ctx, MutableCopyByTransformingPath);
    CGContextSetStrokeColorWithColor(self->_ctx, a6);
    CGContextStrokePath(self->_ctx);
    CGContextSetLineWidth(self->_ctx, a4 - v10);
    CGContextAddPath(self->_ctx, v14);
    CGContextSetStrokeColorWithColor(self->_ctx, a6);
    CGContextStrokePath(self->_ctx);
    CGContextRestoreGState(self->_ctx);
    CGPathRelease(MutableCopyByTransformingPath);
    CGPathRelease(v14);
    CGPathRelease(MutablePathWithPoints);
    CGPathRelease(v13);
  }
}

- (BOOL)renderKeyPathContents:(id)a3 withTraits:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CGPath *v16;
  double v17;
  double width;
  double height;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  CGColor *CopyWithAlpha;
  void *v55;
  double v56;
  double v57;
  void *v58;
  CGFloat v59;
  void *v60;
  UIKBRenderer *v61;
  CGPath *v62;
  CGColor *v63;
  uint64_t v64;
  double v66;
  double x;
  double y;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGAffineTransform v71;
  CGRect v72;
  CGRect BoundingBox;
  CGRect v74;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "displayPathType");
  v9 = -[UIKBRenderer renderFlags](self, "renderFlags");
  v10 = 0;
  if (v7 && (v9 & 4) != 0 && v8)
  {
    if (self->_colorDetectMode)
    {
      objc_msgSend(v7, "symbolStyle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRenderer detectColorsForNamedColor:](self, "detectColorsForNamedColor:", v12);

      v10 = 1;
      goto LABEL_36;
    }
    objc_msgSend(v7, "symbolStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("UIKBColorWhite"));

    switch(v8)
    {
      case 1:
        if ((_DWORD)v15)
        {
          v16 = -[UIKBRenderer _thickShiftGlyphPath](self, "_thickShiftGlyphPath");
          v17 = 0.0;
        }
        else
        {
          v16 = -[UIKBRenderer _thinShiftGlyphPath](self, "_thinShiftGlyphPath");
          v17 = 0.12;
        }
        BoundingBox = CGPathGetBoundingBox(v16);
        x = BoundingBox.origin.x;
        y = BoundingBox.origin.y;
        width = BoundingBox.size.width;
        height = v17 + BoundingBox.size.height;
        break;
      case 4:
        +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        height = 10.0;
        objc_msgSend(v20, "moveToPoint:", 1.0, 10.0);
        y = 0.0;
        objc_msgSend(v20, "addLineToPoint:", 1.0, 0.0);
        objc_msgSend(v20, "closePath");
        v21 = objc_retainAutorelease(v20);
        v16 = (CGPath *)objc_msgSend(v21, "CGPath");

        width = 2.0;
        x = 0.0;
        break;
      case 3:
        +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 15.0, 15.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "moveToPoint:", 4.25, 10.75);
        objc_msgSend(v22, "addLineToPoint:", 10.75, 4.25);
        objc_msgSend(v22, "moveToPoint:", 4.25, 4.25);
        objc_msgSend(v22, "addLineToPoint:", 10.75, 10.75);
        objc_msgSend(v22, "closePath");
        v23 = objc_retainAutorelease(v22);
        v16 = (CGPath *)objc_msgSend(v23, "CGPath");
        v74 = CGPathGetBoundingBox(v16);
        x = v74.origin.x;
        y = v74.origin.y;
        width = v74.size.width;
        height = v74.size.height;

        break;
      case 2:
        v16 = -[UIKBRenderer _deleteGlyphPaths](self, "_deleteGlyphPaths");
        v72 = CGPathGetBoundingBox(v16);
        x = v72.origin.x;
        y = v72.origin.y;
        width = v72.size.width;
        height = v72.size.height;
        break;
      default:
        v16 = 0;
        width = *(double *)(MEMORY[0x1E0C9D648] + 16);
        x = *MEMORY[0x1E0C9D648];
        y = *(double *)(MEMORY[0x1E0C9D648] + 8);
        height = *(double *)(MEMORY[0x1E0C9D648] + 24);
        break;
    }
    objc_msgSend(v7, "geometry");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "symbolFrame");
    v26 = v25;

    if (width <= v26)
    {
      v30 = floor(height);
      objc_msgSend(v7, "symbolStyle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "fontSize");
      v33 = v32;

      v29 = 1.0;
      if (v30 >= v33)
        goto LABEL_23;
      objc_msgSend(v7, "symbolStyle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "fontSize");
      v29 = v34 / v30;
    }
    else
    {
      objc_msgSend(v7, "geometry");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "symbolFrame");
      v29 = v28 / width;
    }

LABEL_23:
    memset(&v71, 0, sizeof(v71));
    CGAffineTransformMakeScale(&v71, v29, v29);
    objc_msgSend(v7, "symbolStyle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "textOffset");
    v37 = v36;
    v66 = v38;

    objc_msgSend(v7, "geometry");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "symbolFrame");
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    -[UIKBRenderer scale](self, "scale");
    v49 = UIRectCenteredIntegralRectScale(x, y, width * v29, height * v29, v41, v43, v45, v47, v48);
    v51 = v50;

    v69 = v71;
    CGAffineTransformTranslate(&v70, &v69, (v37 + v49) / v29, (v66 + v51 + -1.0) / v29);
    v71 = v70;
    objc_msgSend(v7, "symbolStyle");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "textColor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    CopyWithAlpha = (CGColor *)UIKBGetNamedColor(v53);

    objc_msgSend(v7, "symbolStyle");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "textOpacity");
    v57 = v56;

    if (v57 == 1.0)
    {
      CGColorRetain(CopyWithAlpha);
    }
    else
    {
      objc_msgSend(v7, "symbolStyle");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "textOpacity");
      CopyWithAlpha = CGColorCreateCopyWithAlpha(CopyWithAlpha, v59);

    }
    if (objc_msgSend(v6, "fillPath"))
    {
      objc_msgSend(v7, "symbolStyle");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "pathWeight");
      v70 = v71;
      v61 = self;
      v62 = v16;
      v63 = CopyWithAlpha;
      v64 = 1;
    }
    else
    {
      if ((objc_msgSend(v6, "fillPath") & 1) != 0)
      {
        v10 = 0;
LABEL_35:
        CGColorRelease(CopyWithAlpha);
        goto LABEL_36;
      }
      objc_msgSend(v7, "symbolStyle");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "pathWeight");
      if (v8 == 1)
      {
        v70 = v71;
        -[UIKBRenderer drawShiftPath:weight:transform:color:](self, "drawShiftPath:weight:transform:color:", v15, &v70, CopyWithAlpha);
LABEL_34:

        v10 = 1;
        goto LABEL_35;
      }
      v70 = v71;
      v61 = self;
      v62 = v16;
      v63 = CopyWithAlpha;
      v64 = 0;
    }
    -[UIKBRenderer drawPath:weight:transform:color:fill:](v61, "drawPath:weight:transform:color:fill:", v62, &v70, v63, v64);
    goto LABEL_34;
  }
LABEL_36:

  return v10;
}

- (void)addRoundRect:(CGRect)a3 radius:(double)a4 corners:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *v11;
  void *v12;
  CGContext *v13;
  id v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4 <= 0.0 || a5 == 0)
  {
    v11 = -[UIKBRenderer context](self, "context", a5);
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    CGContextAddRect(v11, v15);
  }
  else
  {
    +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[UIKBRenderer context](self, "context");
    v14 = objc_retainAutorelease(v12);
    CGContextAddPath(v13, (CGPathRef)objc_msgSend(v14, "CGPath"));

  }
}

- (void)addPathForTraits:(id)a3 displayRect:(CGRect *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double x;
  double y;
  double width;
  double height;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  BOOL IsNull;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!self->_colorDetectMode)
  {
    objc_msgSend(v6, "geometry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "flickDirection");

    if (v9 == -3)
    {
      objc_msgSend(v7, "geometry");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "splitLeftRect");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        objc_msgSend(v7, "geometry");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "splitRightRect");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v7, "geometry");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBRenderer addPathForSplitGeometry:](self, "addPathForSplitGeometry:", v15);
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {

      }
      objc_msgSend(v7, "geometry");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "detachedVariants") & 1) != 0)
      {
        objc_msgSend(v7, "variantGeometries");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v7, "geometry");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v19, "copy");

          objc_msgSend(v15, "setPopupBias:", 0);
          -[UIKBRenderer addPathForRenderGeometry:](self, "addPathForRenderGeometry:", v15);
          x = *MEMORY[0x1E0C9D628];
          y = *(double *)(MEMORY[0x1E0C9D628] + 8);
          width = *(double *)(MEMORY[0x1E0C9D628] + 16);
          height = *(double *)(MEMORY[0x1E0C9D628] + 24);
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          objc_msgSend(v7, "variantGeometries", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v59;
            do
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v59 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
                v64.origin.x = x;
                v64.origin.y = y;
                v64.size.width = width;
                v64.size.height = height;
                IsNull = CGRectIsNull(v64);
                objc_msgSend(v29, "frame");
                v35 = v31;
                v36 = v32;
                v37 = v33;
                v38 = v34;
                if (!IsNull)
                {
                  v65.origin.x = x;
                  v65.origin.y = y;
                  v65.size.width = width;
                  v65.size.height = height;
                  *(CGRect *)&v31 = CGRectUnion(v65, *(CGRect *)&v35);
                }
                x = v31;
                y = v32;
                width = v33;
                height = v34;
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
            }
            while (v26);
          }

          objc_msgSend(v7, "geometry");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v39, "roundRectCorners"))
          {

          }
          else
          {
            objc_msgSend(v7, "geometry");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "roundRectRadius");
            v52 = v51;

            if (v52 != 0.0)
            {
LABEL_30:
              objc_msgSend(v15, "setFrame:", x, y, width, height);
              objc_msgSend(v15, "setPaddedFrame:", x, y, width, height);
              objc_msgSend(v15, "setDisplayFrame:", x, y, width, height);
              objc_msgSend(v15, "setRoundRectCorners:", -1);
              objc_msgSend(v7, "geometry");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "roundRectRadius");
              objc_msgSend(v15, "setRoundRectRadius:");

              goto LABEL_31;
            }
          }
          objc_msgSend(v15, "roundRectRadius");
          v54 = -v53;
          objc_msgSend(v15, "roundRectRadius");
          v56 = -v55;
          v66.origin.x = x;
          v66.origin.y = y;
          v66.size.width = width;
          v66.size.height = height;
          v67 = CGRectInset(v66, v54, v56);
          x = v67.origin.x;
          y = v67.origin.y;
          width = v67.size.width;
          height = v67.size.height;
          goto LABEL_30;
        }
      }
      else
      {

      }
      objc_msgSend(v7, "geometry");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
      -[UIKBRenderer addPathForRenderGeometry:](self, "addPathForRenderGeometry:", v15);
      goto LABEL_32;
    }
    objc_msgSend(v7, "variantGeometries");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v7, "variantGeometries");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRenderer addPathForFlickPopupGeometries:](self, "addPathForFlickPopupGeometries:", v15);
      goto LABEL_32;
    }
    objc_msgSend(v7, "variantTraits");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "geometry");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "geometry");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      -[UIKBRenderer addPathForRenderGeometry:](self, "addPathForRenderGeometry:", v42);

    }
    else
    {
      -[UIKBRenderer addPathForFlickGeometry:](self, "addPathForFlickGeometry:", v42);

      if (a4)
      {
        objc_msgSend(v7, "geometry");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "popupSource");
        v45 = v44;
        v47 = v46;
        v48 = *MEMORY[0x1E0C9D820];
        v49 = *(double *)(MEMORY[0x1E0C9D820] + 8);

        v68.origin.x = v45;
        v68.origin.y = v47;
        v68.size.width = v48;
        v68.size.height = v49;
        *a4 = CGRectUnion(*a4, v68);
      }
    }
  }
LABEL_33:

}

- (void)addPathForRenderGeometry:(id)a3
{
  id v4;

  -[UIKBRenderer pathForRenderGeometry:](self, "pathForRenderGeometry:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    CGContextAddPath(-[UIKBRenderer context](self, "context"), (CGPathRef)objc_msgSend(objc_retainAutorelease(v4), "CGPath"));

}

- (void)addPathForFlickGeometry:(id)a3
{
  id v4;

  -[UIKBRenderer pathForFlickGeometry:](self, "pathForFlickGeometry:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    CGContextAddPath(-[UIKBRenderer context](self, "context"), (CGPathRef)objc_msgSend(objc_retainAutorelease(v4), "CGPath"));

}

- (void)addPathForFlickPopupGeometries:(id)a3
{
  id v4;

  -[UIKBRenderer pathForFlickPopupGeometries:](self, "pathForFlickPopupGeometries:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    CGContextAddPath(-[UIKBRenderer context](self, "context"), (CGPathRef)objc_msgSend(objc_retainAutorelease(v4), "CGPath"));

}

- (void)addPathForSplitGeometry:(id)a3
{
  id v4;

  -[UIKBRenderer pathForSplitGeometry:](self, "pathForSplitGeometry:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    CGContextAddPath(-[UIKBRenderer context](self, "context"), (CGPathRef)objc_msgSend(objc_retainAutorelease(v4), "CGPath"));

}

- (id)pathForConcaveCornerWithGeometry:(id)a3
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  CGFloat MinY;
  double v47;
  CGFloat v48;
  double v49;
  double MaxX;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double MinX;
  double v78;
  double v79;
  double v80;
  double MaxY;
  double v82;
  double v83;
  double v84;
  double MidX;
  double v86;
  double v87;
  double v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;

  v3 = a3;
  +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paddedFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v3, "roundRectRadius");
  v14 = v13;
  objc_msgSend(v3, "roundRectRadius");
  v16 = v15;
  v17 = objc_msgSend(v3, "concaveCorner");
  objc_msgSend(v3, "concaveCornerOffset");
  v19 = v18;
  v21 = v20;

  v22 = 0;
  switch(v17)
  {
    case 1:
      v89.origin.x = v6;
      v89.origin.y = v8;
      v89.size.width = v10;
      v89.size.height = v12;
      MidX = CGRectGetMidX(v89);
      v90.origin.x = v6;
      v90.origin.y = v8;
      v90.size.width = v10;
      v90.size.height = v12;
      MaxY = CGRectGetMaxY(v90);
      v91.origin.x = v6;
      v91.origin.y = v8;
      v91.size.width = v10;
      v91.size.height = v12;
      MinX = CGRectGetMinX(v91);
      v92.origin.x = v6;
      v92.origin.y = v8;
      v92.size.width = v10;
      v92.size.height = v12;
      v69 = CGRectGetMaxY(v92);
      v93.origin.x = v6;
      v93.origin.y = v8;
      v93.size.width = v10;
      v93.size.height = v12;
      v73 = CGRectGetMinX(v93);
      v94.origin.x = v6;
      v94.origin.y = v8;
      v94.size.width = v10;
      v94.size.height = v12;
      v61 = v21 + CGRectGetMinY(v94);
      v95.origin.x = v6;
      v95.origin.y = v8;
      v95.size.width = v10;
      v95.size.height = v12;
      v65 = v19 + CGRectGetMinX(v95);
      v96.origin.x = v6;
      v96.origin.y = v8;
      v96.size.width = v10;
      v96.size.height = v12;
      v57 = v21 + CGRectGetMinY(v96);
      v97.origin.x = v6;
      v97.origin.y = v8;
      v97.size.width = v10;
      v97.size.height = v12;
      v53 = v19 + CGRectGetMinX(v97);
      v98.origin.x = v6;
      v98.origin.y = v8;
      v98.size.width = v10;
      v98.size.height = v12;
      MinY = CGRectGetMinY(v98);
      v99.origin.x = v6;
      v99.origin.y = v8;
      v99.size.width = v10;
      v99.size.height = v12;
      MaxX = CGRectGetMaxX(v99);
      v100.origin.x = v6;
      v100.origin.y = v8;
      v100.size.width = v10;
      v100.size.height = v12;
      v23 = CGRectGetMinY(v100);
      v101.origin.x = v6;
      v101.origin.y = v8;
      v101.size.width = v10;
      v101.size.height = v12;
      v24 = CGRectGetMaxX(v101);
      v102.origin.x = v6;
      v102.origin.y = v8;
      v102.size.width = v10;
      v102.size.height = v12;
      v25 = CGRectGetMaxY(v102);
      objc_msgSend(v4, "moveToPoint:", MidX, MaxY);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, MinX, v69, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v73, v61, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 1, v65, v57, v14, v16);
      v26 = v4;
      v27 = v53;
      v28 = MinY;
      v29 = v14;
      v30 = v16;
      v31 = 0;
      v32 = 1;
      goto LABEL_4;
    case 2:
      v103.origin.x = v6;
      v103.origin.y = v8;
      v103.size.width = v10;
      v103.size.height = v12;
      v86 = CGRectGetMidX(v103);
      v104.origin.x = v6;
      v104.origin.y = v8;
      v104.size.width = v10;
      v104.size.height = v12;
      v82 = CGRectGetMaxY(v104);
      v105.origin.x = v6;
      v105.origin.y = v8;
      v105.size.width = v10;
      v105.size.height = v12;
      v78 = CGRectGetMinX(v105);
      v106.origin.x = v6;
      v106.origin.y = v8;
      v106.size.width = v10;
      v106.size.height = v12;
      v70 = CGRectGetMaxY(v106);
      v107.origin.x = v6;
      v107.origin.y = v8;
      v107.size.width = v10;
      v107.size.height = v12;
      v74 = CGRectGetMinX(v107);
      v108.origin.x = v6;
      v108.origin.y = v8;
      v108.size.width = v10;
      v108.size.height = v12;
      v62 = CGRectGetMinY(v108);
      v109.origin.x = v6;
      v109.origin.y = v8;
      v109.size.width = v10;
      v109.size.height = v12;
      v66 = CGRectGetMaxX(v109) - v19;
      v110.origin.x = v6;
      v110.origin.y = v8;
      v110.size.width = v10;
      v110.size.height = v12;
      v58 = CGRectGetMinY(v110);
      v111.origin.x = v6;
      v111.origin.y = v8;
      v111.size.width = v10;
      v111.size.height = v12;
      v54 = CGRectGetMaxX(v111) - v19;
      v112.origin.x = v6;
      v112.origin.y = v8;
      v112.size.width = v10;
      v112.size.height = v12;
      v47 = v21 + CGRectGetMinY(v112);
      v113.origin.x = v6;
      v113.origin.y = v8;
      v113.size.width = v10;
      v113.size.height = v12;
      MaxX = CGRectGetMaxX(v113);
      v114.origin.x = v6;
      v114.origin.y = v8;
      v114.size.width = v10;
      v114.size.height = v12;
      v23 = v21 + CGRectGetMinY(v114);
      v115.origin.x = v6;
      v115.origin.y = v8;
      v115.size.width = v10;
      v115.size.height = v12;
      v24 = CGRectGetMaxX(v115);
      v116.origin.x = v6;
      v116.origin.y = v8;
      v116.size.width = v10;
      v116.size.height = v12;
      v25 = CGRectGetMaxY(v116);
      objc_msgSend(v4, "moveToPoint:", v86, v82);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v78, v70, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v74, v62, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v66, v58, v14, v16);
      v26 = v4;
      v27 = v54;
      v28 = v47;
      v29 = v14;
      v30 = v16;
      v32 = 4;
      v31 = 1;
LABEL_4:
      objc_msgSend(v26, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", v32, v31, v27, v28, v29, v30);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, MaxX, v23, v14, v16);
      v33 = v4;
      v34 = v24;
      v35 = v25;
      v36 = v14;
      v37 = v16;
      v38 = 8;
      goto LABEL_6;
    case 4:
      v117.origin.x = v6;
      v117.origin.y = v8;
      v117.size.width = v10;
      v117.size.height = v12;
      v87 = CGRectGetMidX(v117);
      v118.origin.x = v6;
      v118.origin.y = v8;
      v118.size.width = v10;
      v118.size.height = v12;
      v83 = CGRectGetMinY(v118);
      v119.origin.x = v6;
      v119.origin.y = v8;
      v119.size.width = v10;
      v119.size.height = v12;
      v79 = CGRectGetMaxX(v119);
      v120.origin.x = v6;
      v120.origin.y = v8;
      v120.size.width = v10;
      v120.size.height = v12;
      v71 = CGRectGetMinY(v120);
      v121.origin.x = v6;
      v121.origin.y = v8;
      v121.size.width = v10;
      v121.size.height = v12;
      v75 = CGRectGetMaxX(v121);
      v122.origin.x = v6;
      v122.origin.y = v8;
      v122.size.width = v10;
      v122.size.height = v12;
      v63 = CGRectGetMaxY(v122);
      v123.origin.x = v6;
      v123.origin.y = v8;
      v123.size.width = v10;
      v123.size.height = v12;
      v67 = v19 + CGRectGetMinX(v123);
      v124.origin.x = v6;
      v124.origin.y = v8;
      v124.size.width = v10;
      v124.size.height = v12;
      v55 = CGRectGetMaxY(v124);
      v125.origin.x = v6;
      v125.origin.y = v8;
      v125.size.width = v10;
      v125.size.height = v12;
      v59 = v19 + CGRectGetMinX(v125);
      v126.origin.x = v6;
      v126.origin.y = v8;
      v126.size.width = v10;
      v126.size.height = v12;
      v48 = CGRectGetMaxY(v126) - v21;
      v127.origin.x = v6;
      v127.origin.y = v8;
      v127.size.width = v10;
      v127.size.height = v12;
      v51 = CGRectGetMinX(v127);
      v128.origin.x = v6;
      v128.origin.y = v8;
      v128.size.width = v10;
      v128.size.height = v12;
      v39 = CGRectGetMaxY(v128) - v21;
      v129.origin.x = v6;
      v129.origin.y = v8;
      v129.size.width = v10;
      v129.size.height = v12;
      v40 = CGRectGetMinX(v129);
      v130.origin.x = v6;
      v130.origin.y = v8;
      v130.size.width = v10;
      v130.size.height = v12;
      v41 = CGRectGetMinY(v130);
      objc_msgSend(v4, "moveToPoint:", v87, v83);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v79, v71, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v75, v63, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v67, v55, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 1, v59, v48, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v51, v39, v14, v16);
      v33 = v4;
      v34 = v40;
      v35 = v41;
      v36 = v14;
      v37 = v16;
      v38 = 1;
LABEL_6:
      objc_msgSend(v33, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", v38, 0, v34, v35, v36, v37);
      objc_msgSend(v4, "closePath");
      v22 = v4;
      break;
    case 8:
      v131.origin.x = v6;
      v131.origin.y = v8;
      v131.size.width = v10;
      v131.size.height = v12;
      v88 = CGRectGetMidX(v131);
      v132.origin.x = v6;
      v132.origin.y = v8;
      v132.size.width = v10;
      v132.size.height = v12;
      v84 = CGRectGetMinY(v132);
      v133.origin.x = v6;
      v133.origin.y = v8;
      v133.size.width = v10;
      v133.size.height = v12;
      v80 = CGRectGetMaxX(v133);
      v134.origin.x = v6;
      v134.origin.y = v8;
      v134.size.width = v10;
      v134.size.height = v12;
      v72 = CGRectGetMinY(v134);
      v135.origin.x = v6;
      v135.origin.y = v8;
      v135.size.width = v10;
      v135.size.height = v12;
      v76 = CGRectGetMaxX(v135);
      v136.origin.x = v6;
      v136.origin.y = v8;
      v136.size.width = v10;
      v136.size.height = v12;
      v64 = CGRectGetMaxY(v136) - v21;
      v137.origin.x = v6;
      v137.origin.y = v8;
      v137.size.width = v10;
      v137.size.height = v12;
      v68 = CGRectGetMaxX(v137) - v19;
      v138.origin.x = v6;
      v138.origin.y = v8;
      v138.size.width = v10;
      v138.size.height = v12;
      v60 = CGRectGetMaxY(v138) - v21;
      v139.origin.x = v6;
      v139.origin.y = v8;
      v139.size.width = v10;
      v139.size.height = v12;
      v56 = CGRectGetMaxX(v139) - v19;
      v140.origin.x = v6;
      v140.origin.y = v8;
      v140.size.width = v10;
      v140.size.height = v12;
      v49 = CGRectGetMaxY(v140);
      v141.origin.x = v6;
      v141.origin.y = v8;
      v141.size.width = v10;
      v141.size.height = v12;
      v52 = CGRectGetMinX(v141);
      v142.origin.x = v6;
      v142.origin.y = v8;
      v142.size.width = v10;
      v142.size.height = v12;
      v42 = CGRectGetMaxY(v142);
      v143.origin.x = v6;
      v143.origin.y = v8;
      v143.size.width = v10;
      v143.size.height = v12;
      v43 = CGRectGetMinX(v143);
      v144.origin.x = v6;
      v144.origin.y = v8;
      v144.size.width = v10;
      v144.size.height = v12;
      v44 = CGRectGetMinY(v144);
      objc_msgSend(v4, "moveToPoint:", v88, v84);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v80, v72, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v76, v64, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 1, v68, v60, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v56, v49, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v52, v42, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v43, v44, v14, v16);
      objc_msgSend(v4, "closePath");
      v22 = 0;
      break;
    default:
      break;
  }

  return v22;
}

- (id)pathForRenderGeometry:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 4)
    -[UIKBRenderer watchPathForRenderGeometry:](self, "watchPathForRenderGeometry:", v4);
  else
    -[UIKBRenderer defaultPathForRenderGeometry:](self, "defaultPathForRenderGeometry:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)defaultPathForRenderGeometry:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double MinY;
  CGFloat v30;
  double v31;
  double MaxY;
  double v33;
  double v34;
  double v35;
  double v36;
  int v37;
  int v38;
  double v39;
  _BOOL4 v40;
  _BOOL4 v41;
  double v42;
  double x;
  BOOL v44;
  double v45;
  double width;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  void *v51;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double y;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  CGRect recta;
  __int128 v101;
  __int128 v102;
  CGAffineTransform v103;
  CGAffineTransform v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;

  v4 = a3;
  objc_msgSend(v4, "paddedFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "displayFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  recta.origin.y = v19;
  v20 = objc_msgSend(v4, "roundRectCorners");
  objc_msgSend(v4, "roundRectRadius");
  v22 = v21;
  -[UIKBRenderer _layerPaddedFrame](self, "_layerPaddedFrame");
  if (CGRectIsNull(v105))
  {
    v98 = v12;
    v23 = v10;
  }
  else
  {
    -[UIKBRenderer _layerPaddedFrame](self, "_layerPaddedFrame");
    v6 = v24;
    v8 = v25;
    v23 = v26;
    v98 = v27;
    -[UIKBRenderer _layerRoundRectRadius](self, "_layerRoundRectRadius");
    v22 = v28;
  }
  v97 = v22;
  recta.origin.x = v6;
  if (objc_msgSend(v4, "popupDirection") == 2)
  {
    v106.origin.x = v6;
    v106.origin.y = v8;
    v106.size.width = v23;
    v106.size.height = v98;
    MinY = CGRectGetMinY(v106);
    v107.origin.x = v14;
    v107.origin.y = v16;
    v107.size.width = v18;
    v107.size.height = recta.origin.y;
    v30 = CGRectGetMinY(v107);
    v108.size.height = recta.origin.y;
    v31 = MinY - v30;
    v108.origin.x = v14;
    v108.origin.y = v16;
    v108.size.width = v18;
    MaxY = CGRectGetMaxY(v108);
    v109.origin.x = recta.origin.x;
    v109.origin.y = v8;
    v109.size.width = v23;
    v109.size.height = v98;
    v8 = MaxY - CGRectGetHeight(v109) - v31;
  }
  objc_msgSend(v4, "symbolFrame");
  v34 = v33;
  v36 = v35;
  v37 = objc_msgSend(v4, "popupBias");
  v38 = objc_msgSend(v4, "tallPopup");
  v39 = 7.0;
  if (v38)
    v39 = 1.0;
  v93 = v39;
  v40 = v14 + v18 - (v34 + v36) > v36 + 8.0 || v37 == 40;
  v41 = v34 - v14 > v36 + 8.0 || v37 == 40;
  if (v37 && v41)
  {
    if (v37 == 40)
    {
      objc_msgSend(v4, "layoutMargins");
      if (v14 + v42 <= -8.0)
      {
        v14 = v14 + -20.0;
        v18 = v18 + 20.0;
      }
    }
    v110.origin.x = v14;
    v110.origin.y = v16;
    v110.size.width = v18;
    v110.size.height = recta.origin.y;
    x = COERCE_DOUBLE(CGRectInset(v110, 24.0, 0.0)) + 2.0 + -1.0;
    v37 = 2;
  }
  else
  {
    x = recta.origin.x;
  }
  if (v37)
    v44 = v40;
  else
    v44 = 0;
  v91 = x;
  if (v44)
  {
    v111.origin.x = v14;
    v111.origin.y = v16;
    v111.size.width = v18;
    v111.size.height = recta.origin.y;
    v112 = CGRectInset(v111, 24.0, 0.0);
    v45 = v112.origin.x;
    width = v112.size.width;
    if (!objc_msgSend(v4, "concaveCorner"))
    {
      v47 = width + -2.0;
      v48 = v45 + 0.0;
      v49 = v47 + 1.0;
      v37 = 2;
      goto LABEL_32;
    }
LABEL_28:
    -[UIKBRenderer pathForConcaveCornerWithGeometry:](self, "pathForConcaveCornerWithGeometry:", v4);
    v50 = objc_claimAutoreleasedReturnValue();
LABEL_29:
    v51 = (void *)v50;
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "concaveCorner"))
    goto LABEL_28;
  v49 = v23;
  v48 = recta.origin.x;
  if (!v37)
  {
LABEL_33:
    if (v20)
    {
      +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", objc_msgSend(v4, "roundRectCorners"), recta.origin.x, v8, v23, v98, v97, v97);
      v50 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    y = v98;
    v60 = recta.origin.x;
    v62 = v8;
    v63 = v23;
LABEL_46:
    +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v60, v62, v63, y);
    v50 = objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
LABEL_32:
  if (objc_msgSend(v4, "popupDirection") == 3)
    goto LABEL_33;
  v89 = v16;
  v99 = recta.origin.x + v23 * 0.5;
  v53 = v16 + recta.origin.y + -6.0;
  if (v37 > 28)
  {
    if (v37 == 29)
    {
      +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v89 + v93;
      v80 = recta.origin.x + v23;
      v96 = v8 + 15.0;
      v81 = v49 + v48;
      v82 = v8 + -19.0;
      objc_msgSend(v51, "moveToPoint:", v99, v53);
      objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, recta.origin.x, v53, v97, v97);
      objc_msgSend(v51, "addLineToPoint:", recta.origin.x, v79 + 10.0);
      objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, recta.origin.x, v79, 10.0, 10.0);
      objc_msgSend(v51, "addLineToPoint:", v81 + 26.0 + -10.0, v79);
      objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v81 + 26.0, v79, 10.0, 10.0);
      objc_msgSend(v51, "addLineToPoint:", v81 + 26.0, v8 + -19.0);
      if (v40)
      {
        v83 = (v96 + v82) * 0.5 + -1.5;
        objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v81 + 26.0, v83, 10.0, 10.0);
        objc_msgSend(v51, "addLineToPoint:", v80 + 10.0, v83);
        objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 1, v80, v83, 10.0, 10.0);
      }
      else
      {
        objc_msgSend(v51, "addQuadCurveToPoint:controlPoint:", v81 + 23.75, v8 + -12.5, v81 + 26.0 + -0.5, v82 + 5.0);
        objc_msgSend(v51, "addLineToPoint:", v80 + 2.75, v8 + 7.5);
        objc_msgSend(v51, "addQuadCurveToPoint:controlPoint:", v80, v96, v80 + 0.5, v96 + -5.0);
      }
      objc_msgSend(v51, "addLineToPoint:", v80, v53 - v97);
      objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v80, v53, v97, v97);
      v84 = v51;
      v85 = v99;
      v86 = v53;
      goto LABEL_59;
    }
    if (v37 != 30)
    {
LABEL_45:
      v60 = v14;
      v62 = v89;
      v63 = v18;
      y = recta.origin.y;
      goto LABEL_46;
    }
  }
  else if (v37 != 2)
  {
    if (v37 == 21)
    {
      +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v23;
      v55 = v8 + 15.0;
      v56 = v91 + -26.0;
      v57 = v8 + -19.0;
      v58 = v89 + v93;
      v94 = recta.origin.x + v54;
      objc_msgSend(v51, "moveToPoint:", v99, v53);
      objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, recta.origin.x, v53, v97, v97);
      objc_msgSend(v51, "addLineToPoint:", recta.origin.x, v8 + 15.0);
      if (v41)
      {
        v59 = (v55 + v57) * 0.5 + -1.5;
        objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 1, recta.origin.x, v59, 10.0, 10.0);
        objc_msgSend(v51, "addLineToPoint:", v56 + 10.0, v59);
        objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v56, v59, 10.0, 10.0);
      }
      else
      {
        objc_msgSend(v51, "addQuadCurveToPoint:controlPoint:", recta.origin.x + -2.75, v8 + 7.5, recta.origin.x + -0.5, v55 + -5.0);
        objc_msgSend(v51, "addLineToPoint:", v91 + -23.75, v8 + -12.5);
        objc_msgSend(v51, "addQuadCurveToPoint:controlPoint:", v56, v8 + -19.0, v56 + 0.5, v57 + 5.0);
      }
      objc_msgSend(v51, "addLineToPoint:", v56, v58 + 10.0);
      objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v56, v58, 10.0, 10.0);
      objc_msgSend(v51, "addLineToPoint:", v94 + -10.0, v58);
      objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v94, v58, 10.0, 10.0);
      objc_msgSend(v51, "addLineToPoint:", v94, v53 - v97);
      objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v94, v53, v97, v97);
      v84 = v51;
      v85 = v99;
      v86 = v53;
LABEL_59:
      objc_msgSend(v84, "addLineToPoint:", v85, v86);
      objc_msgSend(v51, "closePath");
      goto LABEL_30;
    }
    goto LABEL_45;
  }
  v88 = v23;
  +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v8 + 1.5;
  v65 = v8 + -9.0;
  v66 = v91 + -13.0;
  v67 = v53;
  v68 = v89 + v93;
  v92 = v8 + -8.0;
  v95 = v8 + -20.0;
  v69 = (v8 + 1.5 + v8 + -20.0) * 0.5 + -1.5;
  v70 = v49 + v48;
  v71 = v67;
  v72 = v70 + 13.0;
  objc_msgSend(v51, "moveToPoint:", v99, v67);
  recta.origin.y = v71;
  objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, recta.origin.x, v71, v97, v97);
  v90 = v64;
  objc_msgSend(v51, "addLineToPoint:", recta.origin.x, v64);
  v87 = v65;
  if (v41)
  {
    objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 1, recta.origin.x, v69, 10.0, 10.0);
    objc_msgSend(v51, "addLineToPoint:", v66 + 10.0, v69);
    objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v66, v69, 10.0, 10.0);
    v73 = v69;
    v74 = v92;
  }
  else
  {
    v75 = v65;
    v74 = v92;
    objc_msgSend(v51, "addCurveToPoint:controlPoint1:controlPoint2:", v66, v95, recta.origin.x, v75, v66, v92);
    v73 = v69;
  }
  v76 = recta.origin.x + v88;
  objc_msgSend(v51, "addLineToPoint:", v66, v68 + 10.0);
  objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v66, v68, 10.0, 10.0);
  objc_msgSend(v51, "addLineToPoint:", v72 + -10.0, v68);
  objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v72, v68, 10.0, 10.0);
  objc_msgSend(v51, "addLineToPoint:", v72, v95);
  if (v40)
  {
    objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v72, v73, 10.0, 10.0);
    objc_msgSend(v51, "addLineToPoint:", v76 + 10.0, v73);
    objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 1, v76, v73, 10.0, 10.0);
  }
  else
  {
    objc_msgSend(v51, "addCurveToPoint:controlPoint1:controlPoint2:", v76, v90, v72, v74, v76, v87);
  }
  objc_msgSend(v51, "addLineToPoint:", v76, recta.origin.y - v97);
  objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v76, recta.origin.y, v97, v97);
  objc_msgSend(v51, "addLineToPoint:", v99, recta.origin.y);
  objc_msgSend(v51, "closePath");
  if (objc_msgSend(v4, "popupDirection") == 2)
  {
    memset(&v104, 0, sizeof(v104));
    CGAffineTransformMakeScale(&v104, 1.0, -1.0);
    memset(&v103, 0, sizeof(v103));
    objc_msgSend(v51, "bounds");
    v77 = CGRectGetMinY(v113);
    objc_msgSend(v51, "bounds");
    v78 = CGRectGetMaxY(v114);
    CGAffineTransformMakeTranslation(&v103, 0.0, v77 + v78);
    recta.size = *(CGSize *)&v104.a;
    v101 = *(_OWORD *)&v104.c;
    v102 = *(_OWORD *)&v104.tx;
    objc_msgSend(v51, "applyTransform:", &recta.size);
    recta.size = *(CGSize *)&v103.a;
    v101 = *(_OWORD *)&v103.c;
    v102 = *(_OWORD *)&v103.tx;
    objc_msgSend(v51, "applyTransform:", &recta.size);
  }
LABEL_30:

  return v51;
}

- (id)watchPathForRenderGeometry:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  void *v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v42;
  double v43;
  double v44;
  double v45;

  v3 = a3;
  +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paddedFrame");
  v6 = v5;
  v42 = v8;
  v45 = v7;
  v10 = v9;
  objc_msgSend(v3, "displayFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v3, "roundRectRadius");
  v20 = v19;
  objc_msgSend(v3, "roundRectRadius");
  v22 = v21;
  v23 = objc_msgSend(v3, "popupBias");
  if (v23 > 28)
  {
    if (v23 == 29)
    {
      v37 = v6 + v10 * 0.5;
      v24 = v14 + v18;
      v38 = v12 + v16;
      v39 = v6 + v10;
      v40 = v37;
      objc_msgSend(v4, "moveToPoint:");
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v12, v24, v20, v22);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v12, v14, v20, v22);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v38, v14, v20, v22);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v38, v45, v20, v22);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 1, v39, v45, v20, v22);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v39, v24, v20, v22);
      v34 = v4;
      v35 = v40;
      goto LABEL_11;
    }
    if (v23 != 30)
      goto LABEL_9;
LABEL_7:
    v44 = v6 + v10 * 0.5;
    v24 = v14 + v18;
    v33 = v12 + v16;
    v25 = v6 + v10;
    objc_msgSend(v4, "moveToPoint:", *(_QWORD *)&v44);
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v6, v24, v20, v22);
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 1, v6, v45, v20, v22);
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v12, v45, v20, v22);
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v12, v14, v20, v22);
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v33, v14, v20, v22);
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v33, v45, v20, v22);
    v26 = v4;
    v27 = v25;
    v28 = v45;
    v29 = v20;
    v30 = v22;
    v32 = 1;
    v31 = 1;
    goto LABEL_8;
  }
  if (v23 == 2)
    goto LABEL_7;
  if (v23 == 21)
  {
    v43 = v6 + v10 * 0.5;
    v24 = v14 + v18;
    v25 = v6 + v10;
    objc_msgSend(v4, "moveToPoint:");
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v6, v24, v20, v22);
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 1, v6, v45, v20, v22);
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v12, v45, v20, v22);
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v12, v14, v20, v22);
    v26 = v4;
    v27 = v12 + v16;
    v28 = v14;
    v29 = v20;
    v30 = v22;
    v31 = 0;
    v32 = 2;
LABEL_8:
    objc_msgSend(v26, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", v32, v31, v27, v28, v29, v30);
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v25, v24, v20, v22);
    v34 = v4;
    v35 = v43;
LABEL_11:
    objc_msgSend(v34, "addLineToPoint:", v35, v24);
    goto LABEL_12;
  }
LABEL_9:
  +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", objc_msgSend(v3, "roundRectCorners"), v6, v45, v10, v42, v20, v22);
  v36 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v36;
LABEL_12:
  objc_msgSend(v4, "closePath");

  return v4;
}

- (id)pathForFlickWidth:(double)a3 height:(double)a4 handleLength:(double)a5 keyMiddle:(CGPoint)a6 angle:(double)a7 radius:(double)a8
{
  CGFloat y;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v26;
  double v27;
  double v28;
  __double2 v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v36;
  double angle;
  double x;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;

  y = a6.y;
  x = a6.x;
  +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderer scale](self, "scale");
  v17 = v16;
  UIRoundToScale(a3 * 0.5 + -8.0, v16);
  v19 = v18 + v18;
  UIRoundToScale(a4 + -16.0, v17);
  v21 = v20;
  UIRoundToScale(a5 * 0.6, v17);
  v23 = 0;
  if (v19 > 0.0 && v21 > 0.0)
  {
    v24 = v22;
    if (v22 > 0.0 && v22 > 8.0)
    {
      v36 = y;
      angle = a7;
      v26 = atan((v22 + -8.0 + v22 + -8.0) / v19);
      v27 = v19 * -0.5;
      v28 = v19 * 0.5;
      v29 = __sincos_stret(v26);
      v30 = -a4 - v24;
      objc_msgSend(v15, "moveToPoint:", v29.__sinval * a8, v29.__cosval * a8 - a8);
      objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 0.0, -a8, a8);
      objc_msgSend(v15, "addLineToPoint:", v27 + v29.__sinval * -8.0, v29.__cosval * 8.0 - v24);
      objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v27, -v24, 8.0, v26 + 1.57079633, 3.14159265);
      objc_msgSend(v15, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v27 + -8.0, v30, 8.0, 8.0);
      objc_msgSend(v15, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v28 + 8.0, v30, 8.0, 8.0);
      objc_msgSend(v15, "addLineToPoint:", v28 + 8.0, -v24);
      objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v28, -v24, 8.0, 0.0, 1.57079633 - v26);
      objc_msgSend(v15, "closePath");
      memset(&v41, 0, sizeof(v41));
      UIRoundToScale(x, v17);
      v32 = v31;
      UIRoundToScale(v36, v17);
      CGAffineTransformMakeTranslation(&v41, v32, v33);
      v39 = v41;
      CGAffineTransformRotate(&v40, &v39, angle);
      v41 = v40;
      UIRoundToScale(v24 * -0.6, v17);
      v39 = v41;
      CGAffineTransformTranslate(&v40, &v39, 0.0, v34);
      v41 = v40;
      objc_msgSend(v15, "applyTransform:", &v40);
      v23 = v15;
    }
  }

  return v23;
}

- (id)pathForFlickGeometry:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIKBRenderer *v20;
  double v21;
  double v22;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "paddedFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "popupSource");
  v14 = v13;
  v16 = v15;
  if (objc_msgSend(v4, "flickDirection"))
  {
    if (objc_msgSend(v4, "flickDirection") == 1)
    {
      v17 = v6 - v14;
      v18 = 1.57079633;
LABEL_10:
      v19 = 8.0;
      v20 = self;
      v21 = v12;
      v22 = v10;
      goto LABEL_11;
    }
    if (objc_msgSend(v4, "flickDirection") != 2)
    {
      if (objc_msgSend(v4, "flickDirection") != 3)
      {
        v23 = 0;
        goto LABEL_12;
      }
      v17 = v14 - (v6 + v10);
      v18 = -1.57079633;
      goto LABEL_10;
    }
    v17 = v8 - v16;
    v18 = 3.14159265;
  }
  else
  {
    v17 = v16 - (v8 + v12);
    v18 = 0.0;
  }
  v19 = 8.0;
  v20 = self;
  v21 = v10;
  v22 = v12;
LABEL_11:
  -[UIKBRenderer pathForFlickWidth:height:handleLength:keyMiddle:angle:radius:](v20, "pathForFlickWidth:height:handleLength:keyMiddle:angle:radius:", v21, v22, v17, v14, v16, v18, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v23;
}

- (id)pathForFlickPopupGeometries:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;

  v3 = a3;
  v4 = v3;
  if (v3 && (unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
      v9 = 0;
    else
      v9 = v7;
    v10 = v9;

    objc_msgSend(v4, "objectAtIndex:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v12)
      v13 = 0;
    else
      v13 = v11;
    v14 = v13;

    objc_msgSend(v4, "objectAtIndex:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 == v16)
      v17 = 0;
    else
      v17 = v15;
    v18 = v17;

    objc_msgSend(v4, "objectAtIndex:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == v20)
      v21 = 0;
    else
      v21 = v19;
    v22 = v21;

    +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paddedFrame");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v23 + v29;
    objc_msgSend(v5, "moveToPoint:");
    if (v18)
    {
      objc_msgSend(v18, "paddedFrame");
      v32 = v31;
      v35 = v33 + v34;
      objc_msgSend(v5, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0);
      objc_msgSend(v5, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v35, v32, 8.0, 8.0);
    }
    v36 = v26 + v28;
    objc_msgSend(v5, "addLineToPoint:", v30, v26);
    if (v14)
    {
      objc_msgSend(v14, "paddedFrame");
      v39 = v37 + v38;
      v42 = v40 + v41;
      objc_msgSend(v5, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v37 + v38);
      objc_msgSend(v5, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v39, v42, 8.0, 8.0);
    }
    objc_msgSend(v5, "addLineToPoint:", v30, v36);
    if (v22)
    {
      objc_msgSend(v22, "paddedFrame");
      v44 = v43;
      v48 = v46 + v47;
      objc_msgSend(v5, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v43 + v45, v46 + v47, 8.0, 8.0);
      objc_msgSend(v5, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v44, v48, 8.0, 8.0);
    }
    objc_msgSend(v5, "addLineToPoint:", v24, v36);
    if (v10)
    {
      objc_msgSend(v10, "paddedFrame");
      v50 = v49;
      v52 = v51;
      objc_msgSend(v5, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0);
      objc_msgSend(v5, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v50, v52, 8.0, 8.0);
    }
    objc_msgSend(v5, "addLineToPoint:", v24, v26);
    objc_msgSend(v5, "closePath");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)pathForSplitGeometry:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v35;
  double v36;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "splitLeftRect"), (v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v7 = (void *)v6,
        objc_msgSend(v5, "splitRightRect"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    objc_msgSend(v5, "splitLeftRect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "CGRectValue");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    objc_msgSend(v5, "splitRightRect");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "CGRectValue");
    v35 = v20;
    v36 = v19;
    v22 = v21;

    -[UIKBRenderer size](self, "size");
    v24 = v23 - v22;
    v25 = objc_msgSend(v5, "roundRectCorners") & 0xA;
    v26 = objc_msgSend(v5, "roundRectCorners") & 5;
    objc_msgSend(v5, "roundRectRadius");
    v28 = v27;
    objc_msgSend(v5, "roundRectRadius");
    v30 = v29;
    +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v25, v11, v13, v15, v17, v28, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "appendPath:", v32);

    +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v26, v24, v36, v22, v35, v28, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "appendPath:", v33);

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)opaque
{
  return self->_opaque;
}

- (int64_t)renderFlags
{
  return self->_renderFlags;
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  objc_storeStrong((id *)&self->_cacheKey, a3);
}

- (BOOL)colorDetectMode
{
  return self->_colorDetectMode;
}

- (void)setColorDetectMode:(BOOL)a3
{
  self->_colorDetectMode = a3;
}

- (int64_t)assetIdiom
{
  return self->_assetIdiom;
}

- (BOOL)disableInternalCaching
{
  return self->_disableInternalCaching;
}

- (void)setDisableInternalCaching:(BOOL)a3
{
  self->_disableInternalCaching = a3;
}

- (CGRect)_layerPaddedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__layerPaddedFrame.origin.x;
  y = self->__layerPaddedFrame.origin.y;
  width = self->__layerPaddedFrame.size.width;
  height = self->__layerPaddedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)set_layerPaddedFrame:(CGRect)a3
{
  self->__layerPaddedFrame = a3;
}

- (double)_layerRoundRectRadius
{
  return self->__layerRoundRectRadius;
}

- (void)set_layerRoundRectRadius:(double)a3
{
  self->__layerRoundRectRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedImage, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_singleColor, 0);
  objc_storeStrong(&self->_cachingContextCompletion, 0);
}

@end

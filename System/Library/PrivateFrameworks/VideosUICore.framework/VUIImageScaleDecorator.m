@implementation VUIImageScaleDecorator

- (CGSize)scaleToSize
{
  double width;
  double height;
  CGSize result;

  width = self->_scaleToSize.width;
  height = self->_scaleToSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setScaleToSize:(CGSize)a3
{
  self->_scaleToSize = a3;
}

- (void)setScaleMode:(int64_t)a3
{
  self->_scaleMode = a3;
}

- (void)setCornerRadii:(_VUICornerRadii)a3
{
  self->_cornerRadii = a3;
}

- (int64_t)scaleMode
{
  return self->_scaleMode;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)loaderCropToFit
{
  return self->_scaleMode == 3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
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
  BOOL v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
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
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  objc_super v45;

  v4 = a3;
  if (objc_msgSend(v4, "scaleMode") == 2 && -[VUIImageScaleDecorator scaleMode](self, "scaleMode") == 2)
  {
    objc_msgSend(v4, "bgColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIImageScaleDecorator bgColor](self, "bgColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == v6;

  }
  else
  {
    v7 = 1;
  }
  objc_msgSend(v4, "cornerRadii");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[VUIImageScaleDecorator cornerRadii](self, "cornerRadii");
  if (v9 == v16
    && (-[VUIImageScaleDecorator cornerRadii](self, "cornerRadii"), v11 == v17)
    && (-[VUIImageScaleDecorator cornerRadii](self, "cornerRadii"), v13 == v18))
  {
    -[VUIImageScaleDecorator cornerRadii](self, "cornerRadii");
    v20 = v15 == v19;
  }
  else
  {
    v20 = 0;
  }
  v45.receiver = self;
  v45.super_class = (Class)VUIImageScaleDecorator;
  if (!-[VUIImageDecorator isEqual:](&v45, sel_isEqual_, v4))
    goto LABEL_20;
  objc_msgSend(v4, "scaleToSize");
  v22 = v21;
  v24 = v23;
  -[VUIImageScaleDecorator scaleToSize](self, "scaleToSize");
  v26 = 0;
  if (v22 == v27 && v24 == v25)
  {
    objc_msgSend(v4, "padding");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    -[VUIImageScaleDecorator padding](self, "padding");
    v26 = 0;
    if (v31 == v39 && v29 == v36 && v35 == v38 && v33 == v37)
    {
      v40 = objc_msgSend(v4, "scaleMode");
      if (v40 == -[VUIImageScaleDecorator scaleMode](self, "scaleMode"))
      {
        objc_msgSend(v4, "focusedSizeIncrease");
        v42 = v41;
        -[VUIImageScaleDecorator focusedSizeIncrease](self, "focusedSizeIncrease");
        if (v42 == v43)
        {
          v26 = v7 && v20;
          goto LABEL_21;
        }
      }
LABEL_20:
      v26 = 0;
    }
  }
LABEL_21:

  return v26;
}

- (VUIImageScaleDecorator)init
{
  return -[VUIImageScaleDecorator initWithScaleToSize:scaleMode:](self, "initWithScaleToSize:scaleMode:", 1, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (VUIImageScaleDecorator)initWithScaleToSize:(CGSize)a3 scaleMode:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  VUIImageScaleDecorator *result;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)VUIImageScaleDecorator;
  result = -[VUIImageScaleDecorator init](&v8, sel_init);
  if (result)
  {
    result->_scaleToSize.width = width;
    result->_scaleToSize.height = height;
    result->_scaleMode = a4;
    *(_OWORD *)&result->_cornerRadii.topLeft = VUICornerRadiiZero;
    *(_OWORD *)&result->_cornerRadii.bottomLeft = *(_OWORD *)&qword_1D954F8C0;
    result->_preservesAlpha = 1;
  }
  return result;
}

- (double)focusedSizeIncrease
{
  return self->_focusedSizeIncrease;
}

- (id)decoratorIdentifier
{
  void *v3;
  double width;
  double height;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int64_t scaleMode;
  const __CFString *v11;
  UIColor *bgColor;
  char *__ptr32 *v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  float topLeft;
  float topRight;
  float bottomLeft;
  float bottomRight;
  double v21;
  double v22;
  double v23;
  double v24;
  double v28;
  float v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float v34;
  double v35;
  double v36;
  float v37;
  void *v38;
  id v39;
  double v41;
  double v42;
  double v43;
  double v44;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  width = self->_scaleToSize.width;
  if (width != 0.0)
  {
    height = self->_scaleToSize.height;
    if (height != 0.0)
    {
      v6 = (int)width;
      v7 = (int)height;
      objc_msgSend(MEMORY[0x1E0CEA950], "vui_main");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "vui_scale");
      objc_msgSend(v3, "appendFormat:", CFSTR("%dx%d_%.0f"), v6, v7, v9);

      if (!self->_preservesAlpha)
        objc_msgSend(v3, "appendString:", CFSTR("_noAlpha"));
      scaleMode = self->_scaleMode;
      if (scaleMode == 2)
      {
        objc_msgSend(v3, "appendString:", CFSTR("_fitBB"));
        bgColor = self->_bgColor;
        if (bgColor)
        {
          v43 = 0.0;
          v44 = 0.0;
          v41 = 0.0;
          v42 = 0.0;
          -[UIColor getRed:green:blue:alpha:](bgColor, "getRed:green:blue:alpha:", &v44, &v43, &v42, &v41);
          v13 = &off_1D954F000;
          LODWORD(v13) = vcvtad_u64_f64(v44 * 255.0);
          LODWORD(v14) = vcvtad_u64_f64(v43 * 255.0);
          LODWORD(v15) = vcvtad_u64_f64(v42 * 255.0);
          v16 = v41;
          objc_msgSend(v3, "appendFormat:", CFSTR("(%02X%02X%02X%.1f)"), v13, v14, v15, v16);
        }
      }
      else
      {
        if (scaleMode == 4)
        {
          v11 = CFSTR("_fitHeight");
        }
        else
        {
          if (scaleMode != 3)
            goto LABEL_13;
          v11 = CFSTR("_fill");
        }
        objc_msgSend(v3, "appendString:", v11);
      }
    }
  }
LABEL_13:
  if (!+[VUICoreUtilities radiiIsZero:](VUICoreUtilities, "radiiIsZero:", self->_cornerRadii.topLeft, self->_cornerRadii.topRight, self->_cornerRadii.bottomLeft, self->_cornerRadii.bottomRight))
  {
    topLeft = self->_cornerRadii.topLeft;
    topRight = self->_cornerRadii.topRight;
    bottomLeft = self->_cornerRadii.bottomLeft;
    bottomRight = self->_cornerRadii.bottomRight;
    objc_msgSend(v3, "appendFormat:", CFSTR("_br(%.f,%.f,%.f,%.f)"), topLeft, topRight, bottomLeft, bottomRight);
  }
  -[VUIImageScaleDecorator padding](self, "padding");
  if (v24 != *(double *)(MEMORY[0x1E0CEB4B0] + 8)
    || v21 != *MEMORY[0x1E0CEB4B0]
    || v23 != *(double *)(MEMORY[0x1E0CEB4B0] + 24)
    || v22 != *(double *)(MEMORY[0x1E0CEB4B0] + 16))
  {
    -[VUIImageScaleDecorator padding](self, "padding");
    v29 = v28;
    v30 = v29;
    -[VUIImageScaleDecorator padding](self, "padding");
    *(float *)&v31 = v31;
    v32 = *(float *)&v31;
    -[VUIImageScaleDecorator padding](self, "padding");
    v34 = v33;
    v35 = v34;
    -[VUIImageScaleDecorator padding](self, "padding");
    v37 = v36;
    objc_msgSend(v3, "appendFormat:", CFSTR("_pad(%.f,%.f,%.f,%.f)"), *(_QWORD *)&v30, *(_QWORD *)&v32, *(_QWORD *)&v35, v37);
  }
  if (objc_msgSend(v3, "length"))
    v38 = v3;
  else
    v38 = 0;
  v39 = v38;

  return v39;
}

- (_VUICornerRadii)cornerRadii
{
  double topLeft;
  double topRight;
  double bottomLeft;
  double bottomRight;
  _VUICornerRadii result;

  topLeft = self->_cornerRadii.topLeft;
  topRight = self->_cornerRadii.topRight;
  bottomLeft = self->_cornerRadii.bottomLeft;
  bottomRight = self->_cornerRadii.bottomRight;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  result.topRight = topRight;
  result.topLeft = topLeft;
  return result;
}

- (BOOL)centerGrowth
{
  return self->_centerGrowth;
}

- (CGSize)_scaleToSizeAdjustedForUpscaling
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[VUIImageScaleDecorator scaleToSize](self, "scaleToSize");
  v5 = v4;
  v6 = v3;
  if (v4 > 0.0 && v3 > 0.0)
  {
    -[VUIImageScaleDecorator focusedSizeIncrease](self, "focusedSizeIncrease");
    v8 = v7;
    if (-[VUIImageScaleDecorator centerGrowth](self, "centerGrowth"))
    {
      v6 = v6 + v8;
    }
    else
    {
      if (v5 <= v6)
        v9 = v6;
      else
        v9 = v5;
      v10 = (v9 + v8) / v9;
      v5 = floor(v5 * v10);
      v6 = floor(v6 * v10);
    }
  }
  v11 = v5;
  v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgColor, 0);
}

- (VUIImageScaleDecorator)initWithScaleToSize:(CGSize)a3
{
  return -[VUIImageScaleDecorator initWithScaleToSize:scaleMode:](self, "initWithScaleToSize:scaleMode:", 1, a3.width, a3.height);
}

- (VUIImageScaleDecorator)initWithScaleToSize:(CGSize)a3 cropToFit:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 3;
  else
    v4 = 1;
  return -[VUIImageScaleDecorator initWithScaleToSize:scaleMode:](self, "initWithScaleToSize:scaleMode:", v4, a3.width, a3.height);
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)MEMORY[0x1E0CB3B18];
  -[VUIImageScaleDecorator scaleToSize](self, "scaleToSize");
  objc_msgSend(v2, "valueWithCGSize:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)cropToFit
{
  return self->_scaleMode == 3;
}

- (void)setCropToFit:(BOOL)a3
{
  int64_t v3;

  v3 = 3;
  if (!a3)
    v3 = 1;
  self->_scaleMode = v3;
}

- (double)upscaleAdjustment
{
  return self->_focusedSizeIncrease;
}

- (void)setUpscaleAdjustment:(double)a3
{
  self->_focusedSizeIncrease = a3;
}

- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  id v9;
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
  double v21;
  double v22;
  BOOL v23;
  int64_t scaleMode;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  _BOOL4 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  int v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat x;
  CGFloat y;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  double v57;
  double v58;
  id v59;
  void *v60;
  BOOL v61;
  uint64_t v62;
  void *v63;
  _BOOL8 v64;
  id v65;
  id v66;
  BOOL v67;
  BOOL v68;
  BOOL v69;
  double v70;
  double v71;
  double v72;
  double v73;
  id v74;
  _BOOL8 v75;
  void *v76;
  void *v77;
  double v79;
  _QWORD v80[5];
  id v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  double v85;
  _QWORD v86[5];
  id v87;
  CGFloat v88;
  CGFloat v89;
  double v90;
  double v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  BOOL v96;
  BOOL v97;
  double v98;
  CGSize v99;
  CGSize v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v9 = a3;
  -[VUIImageScaleDecorator _scaleToSizeAdjustedForUpscaling](self, "_scaleToSizeAdjustedForUpscaling");
  v11 = v10;
  v13 = v12;
  -[VUIImageScaleDecorator _paddingAdjustedForUpscaling](self, "_paddingAdjustedForUpscaling");
  v18 = v14;
  v19 = v15;
  if (v11 != *MEMORY[0x1E0C9D820] || v13 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v21 = v16;
    v22 = v17;
    v23 = v11 == width && v13 == height;
    if (!v23
      || ((scaleMode = self->_scaleMode, scaleMode == 3) ? (v25 = !v5) : (v25 = 0),
          !v25 ? (v26 = scaleMode == 2) : (v26 = 1),
          !v26 ? (v27 = scaleMode == 4) : (v27 = 1),
          v27
       || (v15 == *(double *)(MEMORY[0x1E0CEB4B0] + 8) ? (v67 = v14 == *MEMORY[0x1E0CEB4B0]) : (v67 = 0),
           v67 ? (v68 = v17 == *(double *)(MEMORY[0x1E0CEB4B0] + 24)) : (v68 = 0),
           v68 ? (v69 = v16 == *(double *)(MEMORY[0x1E0CEB4B0] + 16)) : (v69 = 0),
           !v69)))
    {
      v79 = v11;
      v28 = (int)objc_msgSend(v9, "orientation") >= 2 && (int)objc_msgSend(v9, "orientation") < 9;
      objc_msgSend(v9, "pixelBounds");
      v30 = v29;
      v32 = v31;
      if (v28)
      {
        v33 = objc_msgSend(v9, "orientation");
        if (v33 <= 4)
          v34 = v32;
        else
          v34 = v30;
        if (v33 > 4)
          v30 = v32;
        v32 = v34;
      }
      v35 = 0.0;
      v36 = v19 + v22;
      v37 = v18 + v21;
      v38 = v19 + 0.0;
      v39 = v18 + 0.0;
      v40 = v79 - v36;
      v41 = v13 - v37;
      switch(self->_scaleMode)
      {
        case 1:
          v99.width = v30;
          v99.height = v32;
          v108.origin.x = v38;
          v108.origin.y = v39;
          v108.size.width = v40;
          v108.size.height = v41;
          v101 = AVMakeRectWithAspectRatioInsideRect(v99, v108);
          v42 = v101.size.width;
          v13 = v101.size.height;
          v43 = *MEMORY[0x1E0C9D538];
          v35 = *(double *)(MEMORY[0x1E0C9D538] + 8);
          v44 = v35;
          v45 = *MEMORY[0x1E0C9D538];
          goto LABEL_41;
        case 2:
          v100.width = v30;
          v100.height = v32;
          v109.origin.x = v38;
          v109.origin.y = v39;
          v109.size.width = v40;
          v109.size.height = v41;
          *(CGRect *)&v45 = AVMakeRectWithAspectRatioInsideRect(v100, v109);
          break;
        case 3:
          v102.origin.x = v38;
          v102.origin.y = v39;
          v102.size.width = v40;
          v102.size.height = v41;
          v46 = CGRectGetWidth(v102) / v30;
          v103.origin.x = v38;
          v103.origin.y = v39;
          v103.size.width = v40;
          v103.size.height = v41;
          v47 = CGRectGetHeight(v103) / v32;
          if (v46 >= v47)
            v47 = v46;
          v48 = v30 * v47;
          v49 = v32 * v47;
          v35 = 0.0;
          goto LABEL_39;
        case 4:
          v104.origin.x = v38;
          v104.origin.y = v39;
          v104.size.width = v40;
          v104.size.height = v41;
          v50 = v30 * (CGRectGetHeight(v104) / v32);
          v105.origin.x = v38;
          v105.origin.y = v39;
          v105.size.width = v40;
          v105.size.height = v41;
          v49 = CGRectGetHeight(v105);
          v48 = v50;
LABEL_39:
          +[VUICoreUtilities centerRect:inRect:](VUICoreUtilities, "centerRect:inRect:", 0.0, 0.0, v48, v49, v38, v39, v40, v41);
          break;
        default:
          v45 = *MEMORY[0x1E0C9D648];
          v44 = *(double *)(MEMORY[0x1E0C9D648] + 8);
          v101.size.width = *(CGFloat *)(MEMORY[0x1E0C9D648] + 16);
          v101.size.height = *(CGFloat *)(MEMORY[0x1E0C9D648] + 24);
          break;
      }
      v43 = 0.0;
      v42 = v79;
LABEL_41:
      v106 = CGRectIntegral(*(CGRect *)&v45);
      x = v106.origin.x;
      y = v106.origin.y;
      v53 = v106.size.width;
      v54 = v106.size.height;
      v106.origin.x = v43;
      v106.origin.y = v35;
      v106.size.width = v42;
      v106.size.height = v13;
      v107 = CGRectIntegral(v106);
      v55 = v107.origin.x;
      v56 = v107.origin.y;
      v57 = v107.size.width;
      v58 = v107.size.height;
      v59 = objc_retainAutorelease(v9);
      +[VUIGraphicsImageRenderer formatWithCGImage:](VUIGraphicsImageRenderer, "formatWithCGImage:", objc_msgSend(v59, "image"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = -[VUIImageScaleDecorator needsAlphaForImage:](self, "needsAlphaForImage:", v59);
      -[VUIImageScaleDecorator bgColor](self, "bgColor");
      v62 = objc_claimAutoreleasedReturnValue();
      v63 = (void *)v62;
      if (v61)
      {
        v64 = 1;
      }
      else
      {
        v64 = 0;
        if (self->_scaleMode == 2 && v62)
        {
          v98 = 0.0;
          -[UIColor getRed:green:blue:alpha:](self->_bgColor, "getRed:green:blue:alpha:", 0, 0, 0, &v98);
          v64 = v98 < 1.0;
        }
      }
      objc_msgSend(v60, "setOpaque:", v64 ^ 1);
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __63__VUIImageScaleDecorator_decorate_scaledWithSize_croppedToFit___block_invoke;
      v86[3] = &unk_1E9F2C6A8;
      v86[4] = self;
      v88 = v55;
      v89 = v56;
      v90 = v57;
      v91 = v58;
      v96 = v64;
      v92 = x;
      v93 = y;
      v94 = v53;
      v95 = v54;
      v87 = v59;
      v97 = v28;
      +[VUIGraphicsImageRenderer imageWithSize:format:actions:](VUIGraphicsImageRenderer, "imageWithSize:format:actions:", v60, v86, v57, v58);
      v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      +[VUIImage imageWithCGImageRef:preserveAlpha:](VUIImage, "imageWithCGImageRef:preserveAlpha:", objc_msgSend(v65, "CGImage"), v64);
      v66 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_65;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    || !+[VUICoreUtilities radiiIsZero:](VUICoreUtilities, "radiiIsZero:", self->_cornerRadii.topLeft, self->_cornerRadii.topRight, self->_cornerRadii.bottomLeft, self->_cornerRadii.bottomRight))
  {
    objc_msgSend(v9, "pixelBounds");
    v71 = v70;
    v73 = v72;
    v74 = objc_retainAutorelease(v9);
    +[VUIGraphicsImageRenderer formatWithCGImage:](VUIGraphicsImageRenderer, "formatWithCGImage:", objc_msgSend(v74, "image"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = -[VUIImageScaleDecorator needsAlphaForImage:](self, "needsAlphaForImage:", v74);
    objc_msgSend(v60, "setOpaque:", v75 ^ 1);
    objc_msgSend(v60, "setScale:", 1.0);
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __63__VUIImageScaleDecorator_decorate_scaledWithSize_croppedToFit___block_invoke_2;
    v80[3] = &unk_1E9F2C6D0;
    v82 = 0;
    v83 = 0;
    v80[4] = self;
    v84 = v71;
    v85 = v73;
    v81 = v74;
    +[VUIGraphicsImageRenderer imageWithSize:format:actions:](VUIGraphicsImageRenderer, "imageWithSize:format:actions:", v60, v80, v71, v73);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v76;
    if (v76)
    {
      +[VUIImage imageWithCGImageRef:preserveAlpha:](VUIImage, "imageWithCGImageRef:preserveAlpha:", objc_msgSend(v76, "vuiCGImage"), v75);
      v66 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v66 = 0;
    }

LABEL_65:
    goto LABEL_66;
  }
  v66 = v9;
LABEL_66:

  return v66;
}

void __63__VUIImageScaleDecorator_decorate_scaledWithSize_croppedToFit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_applyCornerMaskForRect:toContext:", objc_msgSend(v9, "CGContext"), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if (!*(_BYTE *)(a1 + 112)
    || *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) == 2 && !CGRectEqualToRect(*(CGRect *)(a1 + 48), *(CGRect *)(a1 + 80)))
  {
    objc_msgSend(*(id *)(a1 + 32), "bgColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

    objc_msgSend(v6, "setFill");
    UIRectFill(*(CGRect *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 40), "uiImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 113))
  {
    objc_msgSend(*(id *)(a1 + 32), "_imageFixedForRotation:", *(_QWORD *)(a1 + 40));
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  objc_msgSend(v7, "drawInRect:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "drawInContext:imageRect:", v9, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));

}

void __63__VUIImageScaleDecorator_decorate_scaledWithSize_croppedToFit___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_applyCornerMaskForRect:toContext:", objc_msgSend(v4, "CGContext"), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 40), "uiImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawInRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "drawInContext:imageRect:", v4, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

- (double)_focusedSizeIncreaseFactor
{
  return 1.0;
}

- (BOOL)needsAlphaForImage:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (-[VUIImageScaleDecorator preservesAlpha](self, "preservesAlpha"))
  {
    if ((objc_msgSend(v4, "hasAlpha") & 1) != 0)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      -[VUIImageScaleDecorator cornerRadii](self, "cornerRadii");
      v5 = !+[VUICoreUtilities radiiIsZero:](VUICoreUtilities, "radiiIsZero:");
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_imageFixedForRotation:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;

  v3 = objc_retainAutorelease(a3);
  +[VUIGraphicsImageRenderer formatWithCGImage:](VUIGraphicsImageRenderer, "formatWithCGImage:", objc_msgSend(v3, "image"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOpaque:", objc_msgSend(v3, "hasAlpha") ^ 1);
  objc_msgSend(v4, "setScale:", 1.0);
  v5 = objc_msgSend(v3, "orientation");
  objc_msgSend(v3, "pixelBounds");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v3, "pixelBounds");
  if (v5 <= 4)
    v12 = v10;
  else
    v12 = v9;
  if (v5 <= 4)
    v13 = v11;
  else
    v13 = v7;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__VUIImageScaleDecorator__imageFixedForRotation___block_invoke;
  v17[3] = &unk_1E9F2C6F8;
  v19 = v12;
  v20 = v13;
  v21 = (int)v5;
  v22 = v7;
  v23 = v9;
  v18 = v3;
  v14 = v3;
  +[VUIGraphicsImageRenderer imageWithSize:format:actions:](VUIGraphicsImageRenderer, "imageWithSize:format:actions:", v4, v17, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __49__VUIImageScaleDecorator__imageFixedForRotation___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  CGFloat v4;
  __int128 v5;
  __int128 v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGImage *v10;
  CGAffineTransform v11;
  CGRect v12;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSetInterpolationQuality(v3, kCGInterpolationHigh);
  v4 = 0.0;
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 48));
  CGContextScaleCTM(v3, 1.0, -1.0);
  v5 = xmmword_1D954F970;
  v6 = xmmword_1D954F980;
  v7 = 0.0;
  switch(*(_QWORD *)(a1 + 56))
  {
    case 2:
      v5 = xmmword_1D954F980;
      v6 = xmmword_1D954F990;
      v4 = *(double *)(a1 + 64);
      break;
    case 3:
      v5 = xmmword_1D954F9A0;
      v6 = xmmword_1D954F990;
      v4 = *(double *)(a1 + 64);
      v7 = *(double *)(a1 + 72);
      break;
    case 4:
      v5 = xmmword_1D954F9A0;
      v6 = xmmword_1D954F970;
      v7 = *(double *)(a1 + 72);
      break;
    case 5:
      v5 = xmmword_1D954F990;
      v6 = xmmword_1D954F9A0;
      v7 = *(double *)(a1 + 64);
      v4 = *(double *)(a1 + 72);
      break;
    case 6:
      v6 = xmmword_1D954F9A0;
      v7 = *(double *)(a1 + 64);
      break;
    case 7:
      break;
    case 8:
      v5 = xmmword_1D954F990;
      v4 = *(double *)(a1 + 72);
      break;
    default:
      v6 = *MEMORY[0x1E0C9BAA8];
      v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v4 = *(double *)(MEMORY[0x1E0C9BAA8] + 32);
      v7 = *(double *)(MEMORY[0x1E0C9BAA8] + 40);
      break;
  }
  *(_OWORD *)&v11.a = v6;
  *(_OWORD *)&v11.c = v5;
  v11.tx = v4;
  v11.ty = v7;
  CGContextConcatCTM(v3, &v11);
  v8 = *(double *)(a1 + 64);
  v9 = *(double *)(a1 + 72);
  v10 = (CGImage *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "image");
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = v8;
  v12.size.height = v9;
  CGContextDrawImage(v3, v12, v10);
}

- (UIEdgeInsets)_paddingAdjustedForUpscaling
{
  double v3;
  double v4;
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
  UIEdgeInsets result;

  -[VUIImageScaleDecorator padding](self, "padding");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VUIImageScaleDecorator _focusedSizeIncreaseFactor](self, "_focusedSizeIncreaseFactor");
  if (v11 > 1.0)
  {
    v4 = floor(v4 * v11);
    v6 = floor(v6 * v11);
    v8 = floor(v8 * v11);
    v10 = floor(v10 * v11);
  }
  v12 = v4;
  v13 = v6;
  v14 = v8;
  v15 = v10;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)_applyCornerMaskForRect:(CGRect)a3 toContext:(CGContext *)a4
{
  double width;
  double y;
  double x;
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
  CGPath *v19;
  double height;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VUIImageScaleDecorator _focusedSizeIncreaseFactor](self, "_focusedSizeIncreaseFactor");
  v10 = v9;
  -[VUIImageScaleDecorator cornerRadii](self, "cornerRadii");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if (!+[VUICoreUtilities radiiIsZero:](VUICoreUtilities, "radiiIsZero:"))
  {
    v19 = +[VUICoreUtilities createPathForRadii:inRect:isContinuous:](VUICoreUtilities, "createPathForRadii:inRect:isContinuous:", -[VUIImageScaleDecorator cornerContinuous](self, "cornerContinuous"), v10 * v12, v10 * v14, v10 * v16, v10 * v18, x, y, width, height);
    CGContextAddPath(a4, v19);
    CGPathRelease(v19);
    CGContextClip(a4);
  }
}

- (void)setCenterGrowth:(BOOL)a3
{
  self->_centerGrowth = a3;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  self->_focusedSizeIncrease = a3;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (BOOL)cornerContinuous
{
  return self->_cornerContinuous;
}

- (void)setCornerContinuous:(BOOL)a3
{
  self->_cornerContinuous = a3;
}

- (UIColor)bgColor
{
  return self->_bgColor;
}

- (void)setBgColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)preservesAlpha
{
  return self->_preservesAlpha;
}

- (void)setPreservesAlpha:(BOOL)a3
{
  self->_preservesAlpha = a3;
}

@end

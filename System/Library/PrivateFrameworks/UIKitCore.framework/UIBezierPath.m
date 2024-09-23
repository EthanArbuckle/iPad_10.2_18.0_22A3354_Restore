@implementation UIBezierPath

+ (id)_continuousRoundedRectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 cornerRadii:(id)a5 segments:(int)a6 smoothPillShapes:(BOOL)a7 clampCornerRadii:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  double height;
  double width;
  double y;
  double v14;
  id v16;
  CGPath *Mutable;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  double *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  int v30;
  int v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  int v36;
  int v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  int v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  _BOOL4 v48;
  _BOOL4 v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  _BOOL4 v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  unint64_t v69;
  int v71;
  double v72;
  int v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  char v79;
  void *v80;
  double v81;
  void *v82;
  double v83;
  void *v84;
  double v85;
  void *v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  BOOL v92;
  double v93;
  double v94;
  BOOL v95;
  int v96;
  double v97;
  char v98;
  double v99;
  char v100;
  objc_class *v101;
  double v102;
  double x;
  _BOOL4 v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  double v111;
  double v112;

  v8 = a8;
  v9 = a7;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  v14 = a3.origin.x;
  v16 = a5;
  Mutable = CGPathCreateMutable();
  v18 = (a6 >> 1) & 1;
  if ((~a6 & 0xD) != 0)
    v18 = 0;
  if ((a6 & 0x10) != 0)
    v19 = 1;
  else
    v19 = v18;
  v101 = (objc_class *)a1;
  v104 = v9;
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v20 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1)
    goto LABEL_9;
  v71 = _UIInternalPreference_EnableCGPathContinuousRoundedRect;
  if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_EnableCGPathContinuousRoundedRect)
    goto LABEL_9;
  while (1)
  {
    v72 = height;
    v73 = v19;
    if (v20 < v71)
      break;
    _UIInternalPreferenceSync(v20, &_UIInternalPreference_EnableCGPathContinuousRoundedRect, (uint64_t)CFSTR("EnableCGPathContinuousRoundedRect"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    v71 = _UIInternalPreference_EnableCGPathContinuousRoundedRect;
    if (v20 == _UIInternalPreference_EnableCGPathContinuousRoundedRect)
      goto LABEL_9;
  }
  if (!byte_1ECD7657C)
    goto LABEL_9;
  objc_msgSend(v16, "objectAtIndex:", 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "CGSizeValue");
  v76 = v75;

  objc_msgSend(v16, "objectAtIndex:", 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "CGSizeValue");
  v112 = v78;

  v79 = v19 ^ 1;
  if (a4 != -1)
    v79 = 1;
  if ((v79 & 1) != 0 || v76 != v112)
  {
LABEL_9:
    v100 = v19;
    v21 = v19 ^ 1;
    if ((a6 & 4) != 0)
      v22 = 0;
    else
      v22 = v21;
    v98 = v22;
    if ((a6 & 1) != 0)
      v22 = 0;
    v23 = (double *)MEMORY[0x1E0C9D820];
    if ((a4 & 1) == 0 || v22)
    {
      v26 = *MEMORY[0x1E0C9D820];
      v29 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    else
    {
      objc_msgSend(v16, "objectAtIndex:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "CGSizeValue");
      v26 = v25 * 1.528665;
      objc_msgSend(v16, "objectAtIndex:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "CGSizeValue");
      v29 = v28 * 1.528665;

    }
    if ((a6 & 1) != 0)
      v30 = 0;
    else
      v30 = v21;
    if ((a6 & 8) != 0)
      v31 = 0;
    else
      v31 = v30;
    if ((a4 & 2) == 0 || v31)
    {
      v109 = *v23;
      v106 = v23[1];
    }
    else
    {
      objc_msgSend(v16, "objectAtIndex:", 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "CGSizeValue");
      v109 = v33 * 1.528665;
      objc_msgSend(v16, "objectAtIndex:", 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "CGSizeValue");
      v106 = v35 * 1.528665;

    }
    if ((a6 & 8) != 0)
      v36 = 0;
    else
      v36 = v21;
    if ((a6 & 2) != 0)
      v37 = 0;
    else
      v37 = v36;
    if ((a4 & 8) == 0 || v37)
    {
      v107 = v23[1];
      v108 = *v23;
    }
    else
    {
      objc_msgSend(v16, "objectAtIndex:", 3);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "CGSizeValue");
      v108 = v39 * 1.528665;
      objc_msgSend(v16, "objectAtIndex:", 3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "CGSizeValue");
      v107 = v41 * 1.528665;

    }
    if ((a6 & 2) != 0)
      v21 = 0;
    if ((a6 & 4) != 0)
      v42 = 0;
    else
      v42 = v21;
    if ((a4 & 4) == 0 || v42)
    {
      v47 = v23[1];
      v111 = *v23;
      if (!v8)
        goto LABEL_46;
    }
    else
    {
      objc_msgSend(v16, "objectAtIndex:", 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "CGSizeValue");
      v111 = v44 * 1.528665;
      objc_msgSend(v16, "objectAtIndex:", 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "CGSizeValue");
      v47 = v46 * 1.528665;

      if (!v8)
      {
LABEL_46:
        v102 = v29;
        v48 = 0;
        v49 = 0;
        v50 = 3;
        v51 = 3;
        v52 = 3;
        v53 = 3;
        goto LABEL_58;
      }
    }
    if (v26 + v109 >= width)
    {
      v26 = width * 0.5;
      v51 = 2;
      v50 = 1;
      v109 = width * 0.5;
      v54 = 1;
    }
    else
    {
      v54 = 0;
      v50 = 3;
      v51 = 3;
    }
    if (v108 + v111 >= width)
    {
      v53 = 2;
      v52 = 1;
      v108 = width * 0.5;
      v111 = width * 0.5;
      v54 = 1;
    }
    else
    {
      v52 = 3;
      v53 = 3;
    }
    v49 = v29 + v47 >= height;
    if (v29 + v47 >= height)
    {
      v29 = height * 0.5;
      v50 &= 2u;
      v53 &= 1u;
      v47 = height * 0.5;
    }
    v102 = v29;
    v48 = v54 != 0;
    if (v106 + v107 >= height)
    {
      v51 &= 1u;
      v52 &= 2u;
      v49 = 1;
      v106 = height * 0.5;
      v107 = height * 0.5;
    }
LABEL_58:
    v96 = v50;
    v55 = v51 | v53 | v50 | v52;
    v56 = v104;
    if (!v55)
      v56 = 0;
    v57 = v14 + width;
    v58 = y + height;
    v97 = v47;
    if (v48 && v56)
    {
      x = v14 + v111 * 0.05;
      v59 = v14 + v26 * 0.05;
      v60 = v57 - v108 * 0.05;
      v57 = v57 - v109 * 0.05;
      v61 = y;
    }
    else
    {
      if (v49 && v56)
      {
        v61 = y + v106 * 0.05;
        y = y + v102 * 0.05;
        v62 = v47 * 0.05;
        v63 = v58 - v107 * 0.05;
        v58 = v58 - v62;
        v59 = v14;
        x = v14;
        v60 = v57;
        if ((v30 & 1) != 0)
        {
LABEL_69:
          v99 = v26;
          v105 = y;
          v65 = *v23;
          v64 = v23[1];
          if (v109 != *v23 || v106 != v64)
          {
            if ((v100 & 1) == 0)
              CGPathMoveToPoint(Mutable, 0, v57 - v109, v61);
            _addContinuousCornerToPath(Mutable, 2, v51, 0, v55 == 0, v57, v61, v109, v106);
          }
          if ((v36 & 1) == 0)
          {
            if ((v100 & 1) == 0)
              CGPathMoveToPoint(Mutable, 0, v57, v106 + v61);
            CGPathAddLineToPoint(Mutable, 0, v60, v63 - v107);
          }
          if (v108 != v65 || v107 != v64)
          {
            if ((v100 & 1) == 0)
              CGPathMoveToPoint(Mutable, 0, v60 - v108, v63);
            _addContinuousCornerToPath(Mutable, 8, v52, 0, v55 == 0, v60, v63, v108, v107);
          }
          if ((v21 & 1) == 0)
          {
            if ((v100 & 1) == 0)
              CGPathMoveToPoint(Mutable, 0, v60 - v108, v63);
            CGPathAddLineToPoint(Mutable, 0, v111 + x, v58);
          }
          if (v111 != v65 || v97 != v64)
          {
            if ((v100 & 1) == 0)
              CGPathMoveToPoint(Mutable, 0, v111 + x, v58);
            _addContinuousCornerToPath(Mutable, 4, v53, 0, v55 == 0, x, v58, v111, v97);
          }
          if ((v98 & 1) == 0)
          {
            if ((v100 & 1) == 0)
              CGPathMoveToPoint(Mutable, 0, x, v58 - v97);
            CGPathAddLineToPoint(Mutable, 0, v59, v102 + v105);
          }
          if (v99 != v65 || v102 != v64)
          {
            if ((v100 & 1) == 0)
              CGPathMoveToPoint(Mutable, 0, v59, v102 + v105);
            _addContinuousCornerToPath(Mutable, 1, v96, 0, v55 == 0, v59, v105, v99, v102);
          }
          CGPathAddLineToPoint(Mutable, 0, v99 + v59, v105);
          v66 = objc_msgSend([v101 alloc], "_initWithCGMutablePath:", Mutable);
          CFRelease(Mutable);
          *(_BYTE *)(v66 + 89) = 1;
          objc_msgSend(v16, "objectAtIndex:", 0);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "CGSizeValue");
          *(_QWORD *)(v66 + 96) = v68;

          *(_BYTE *)(v66 + 104) = v55 != 0;
          v69 = a4 & 0xF;
          goto LABEL_102;
        }
LABEL_68:
        CGPathMoveToPoint(Mutable, 0, v26 + v59, y);
        CGPathAddLineToPoint(Mutable, 0, v57 - v109, v61);
        goto LABEL_69;
      }
      v61 = y;
      v59 = v14;
      x = v14;
      v60 = v57;
    }
    v63 = v58;
    if ((v30 & 1) != 0)
      goto LABEL_69;
    goto LABEL_68;
  }
  objc_msgSend(v16, "objectAtIndex:", 1);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "CGSizeValue");
  if (v76 != v81)
  {
LABEL_126:

    v19 = v73;
    goto LABEL_9;
  }
  objc_msgSend(v16, "objectAtIndex:", 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "CGSizeValue");
  if (v112 != v83)
  {
LABEL_125:

    goto LABEL_126;
  }
  objc_msgSend(v16, "objectAtIndex:", 2, v112);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "CGSizeValue");
  if (v76 != v85)
  {
LABEL_124:

    goto LABEL_125;
  }
  objc_msgSend(v16, "objectAtIndex:", 2);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "CGSizeValue");
  if (v112 != v87)
  {
LABEL_123:

    goto LABEL_124;
  }
  objc_msgSend(v16, "objectAtIndex:", 3, v112);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "CGSizeValue");
  if (v76 != v89)
  {

    goto LABEL_123;
  }
  objc_msgSend(v16, "objectAtIndex:", 3);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "CGSizeValue");
  v91 = v90;

  v92 = v112 == v91;
  v19 = v73;
  height = v72;
  if (!v92)
    goto LABEL_9;
  v93 = width * 0.5;
  v94 = fmin(v76, fmin(width * 0.5, v72 * 0.5));
  CGPathAddContinuousRoundedRect();
  v66 = objc_msgSend([v101 alloc], "_initWithCGMutablePath:", Mutable);
  CFRelease(Mutable);
  *(_BYTE *)(v66 + 89) = 1;
  *(double *)(v66 + 96) = v76;
  v95 = v94 > v93;
  if (v94 > v72 * 0.5)
    v95 = 1;
  *(_BYTE *)(v66 + 104) = v95;
  v69 = 15;
LABEL_102:
  *(_QWORD *)(v66 + 112) = v69;

  return (id)v66;
}

+ (UIBezierPath)bezierPath
{
  CGMutablePathRef Mutable;
  void *v4;

  Mutable = CGPathCreateMutable();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCGMutablePath:", Mutable);
  CFRelease(Mutable);
  return (UIBezierPath *)v4;
}

- (id)_initWithCGMutablePath:(CGPath *)a3
{
  UIBezierPath *v4;
  UIBezierPath *v5;
  CGPath *path;

  v4 = -[UIBezierPath init](self, "init");
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      path = v4->_path;
      if (path)
        CFRelease(path);
      v5->_path = (CGPath *)CFRetain(a3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("CGPath must be non-nil"));

      return 0;
    }
  }
  return v5;
}

- (UIBezierPath)init
{
  UIBezierPath *v2;
  CGMutablePathRef Mutable;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIBezierPath;
  v2 = -[UIBezierPath init](&v5, sel_init);
  if (v2)
  {
    Mutable = CGPathCreateMutable();
    UIBezierPathCommonInit(v2, Mutable);
    CFRelease(Mutable);
  }
  return v2;
}

- (void)_invalidatePathMetadata
{
  -[UIBezierPath _invalidatePathMetadataIncludingCornerRadius:](self, "_invalidatePathMetadataIncludingCornerRadius:", 1);
}

- (void)setUsesEvenOddFillRule:(BOOL)usesEvenOddFillRule
{
  self->_usesEvenOddFillRule = usesEvenOddFillRule;
}

- (void)setLineWidth:(CGFloat)lineWidth
{
  self->_lineWidth = lineWidth;
}

- (void)fillWithBlendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha
{
  _QWORD *ContextStack;
  CGContext *v8;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v8 = 0;
  else
    v8 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSaveGState(v8);
  CGContextSetBlendMode(v8, blendMode);
  CGContextSetAlpha(v8, alpha);
  CGContextSetFlatness(v8, self->_flatness);
  CGContextAddPath(v8, self->_path);
  if (self->_usesEvenOddFillRule)
    CGContextEOFillPath(v8);
  else
    CGContextFillPath(v8);
  CGContextRestoreGState(v8);
}

- (void)dealloc
{
  double *lineDashPattern;
  CGPath *path;
  CGPath *immutablePath;
  objc_super v6;

  lineDashPattern = self->_lineDashPattern;
  if (lineDashPattern)
    free(lineDashPattern);
  path = self->_path;
  if (path)
    CFRelease(path);
  immutablePath = self->_immutablePath;
  if (immutablePath)
    CGPathRelease(immutablePath);
  v6.receiver = self;
  v6.super_class = (Class)UIBezierPath;
  -[UIBezierPath dealloc](&v6, sel_dealloc);
}

+ (id)_bezierPathWithRoundedRect:(CGRect)a3 byRoundingCorners:(unint64_t)a4 cornerRadius:(double)a5
{
  return (id)objc_msgSend(a1, "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", a4, 16, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
}

+ (id)_roundedRectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 cornerRadius:(double)a5 segments:(int)a6 legacyCorners:(BOOL)a7
{
  double v8;
  char v9;
  double height;
  double width;
  double y;
  double x;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPath *Mutable;
  CGPath *v20;
  unsigned int v21;
  uint64_t v22;
  _BOOL4 v23;
  unsigned __int8 v24;
  double v25;
  double v26;
  unsigned __int8 v27;
  double v28;
  int v29;
  double v30;
  double v31;
  _BOOL4 v32;
  int v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v8 = a5;
  v9 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a7)
  {
    if ((~(_BYTE)a4 & 5) == 0 || (a4 & 0xA) == 0xA)
    {
      v15 = CGRectGetHeight(a3) * 0.5;
      if (v15 <= v8)
        v8 = v15;
    }
    if ((~v9 & 3) == 0 || (v9 & 0xC) == 0xCLL)
    {
      v46.origin.x = x;
      v46.origin.y = y;
      v46.size.width = width;
      v46.size.height = height;
      v16 = CGRectGetWidth(v46) * 0.5;
      if (v8 >= v16)
        v8 = v16;
    }
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    v17 = CGRectGetWidth(v47);
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    v18 = CGRectGetHeight(v48);
    if (v17 < v18)
      v18 = v17;
    if (v8 >= v18)
      v8 = v18;
    Mutable = CGPathCreateMutable();
    v20 = Mutable;
    if ((a6 & 0x10) != 0)
    {
      v21 = 1;
    }
    else if ((~a6 & 0xD) != 0)
    {
      v21 = 0;
    }
    else
    {
      v21 = (a6 >> 1) & 1;
    }
    v23 = (a6 & 4) == 0;
    if ((a6 & 4) != 0)
      v24 = 0;
    else
      v24 = v21 ^ 1;
    v25 = 0.0;
    if ((v9 & 1) != 0)
      v26 = v8;
    else
      v26 = 0.0;
    if ((a6 & 1) != 0)
      v27 = 0;
    else
      v27 = v21 ^ 1;
    v42 = v26;
    if ((((a6 & 1) == 0) & v24) != 0)
      v26 = 0.0;
    v45 = v26;
    if ((v9 & 2) != 0)
      v28 = v8;
    else
      v28 = 0.0;
    if ((a6 & 8) != 0)
      v29 = 0;
    else
      v29 = v21 ^ 1;
    if ((((a6 & 8) == 0) & v27) != 0)
      v30 = 0.0;
    else
      v30 = v28;
    if ((v9 & 8) != 0)
      v31 = v8;
    else
      v31 = 0.0;
    v32 = (a6 & 2) == 0;
    if ((a6 & 2) != 0)
      v33 = 0;
    else
      v33 = v21 ^ 1;
    if ((v32 & v29) != 0)
      v34 = 0.0;
    else
      v34 = v31;
    if ((v9 & 4) != 0)
      v35 = v8;
    else
      v35 = 0.0;
    v41 = v35;
    if ((v23 & v33) == 0)
      v25 = v35;
    v43 = v34;
    v44 = v25;
    if ((v27 & 1) == 0)
    {
      CGPathMoveToPoint(Mutable, 0, x + v45, y);
      CGPathAddLineToPoint(v20, 0, x + width - v28, y);
    }
    if (v30 > 0.0)
    {
      v36 = y + v8;
      if ((v21 & 1) == 0)
      {
        CGPathMoveToPoint(v20, 0, x + width - v8, y);
        v36 = y + v8;
      }
      CGPathAddArc(v20, 0, x + width - v8, v36, v8, 4.71238898, 6.28318531, 0);
    }
    if ((v29 & 1) == 0)
    {
      if ((v21 & 1) == 0)
        CGPathMoveToPoint(v20, 0, x + width, y + v30);
      CGPathAddLineToPoint(v20, 0, x + width, y + height - v31);
    }
    if (v43 > 0.0)
    {
      if ((v21 & 1) == 0)
        CGPathMoveToPoint(v20, 0, x + width - v8, y + height);
      CGPathAddArc(v20, 0, x + width - v8, y + height - v8, v8, 0.0, 1.57079633, 0);
    }
    if ((v33 & 1) == 0)
    {
      if (v21)
      {
        v37 = y + height;
      }
      else
      {
        v38 = x + width - v43;
        v37 = y + height;
        CGPathMoveToPoint(v20, 0, v38, y + height);
      }
      CGPathAddLineToPoint(v20, 0, x + v41, v37);
    }
    if (v44 > 0.0)
    {
      if ((v21 & 1) == 0)
        CGPathMoveToPoint(v20, 0, x + v8, y + height);
      CGPathAddArc(v20, 0, x + v8, y + height - v8, v8, 1.57079633, 3.14159265, 0);
    }
    if ((v24 & 1) == 0)
    {
      if ((v21 & 1) == 0)
        CGPathMoveToPoint(v20, 0, x, y + height - v44);
      CGPathAddLineToPoint(v20, 0, x, y + v42);
    }
    if (v45 > 0.0)
    {
      v39 = y + v8;
      if ((v21 & 1) == 0)
        CGPathMoveToPoint(v20, 0, x, v39);
      CGPathAddArc(v20, 0, x + v8, v39, v8, 3.14159265, 4.71238898, 0);
    }
    v22 = objc_msgSend(objc_alloc((Class)a1), "_initWithCGMutablePath:", v20);
    CFRelease(v20);
    *(_BYTE *)(v22 + 89) = 1;
    *(double *)(v22 + 96) = v8;
    *(_BYTE *)(v22 + 104) = 0;
    *(_QWORD *)(v22 + 112) = v9 & 0xF;
  }
  else
  {
    objc_msgSend(a1, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:", a4, *(_QWORD *)&a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5, a5);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  return (id)v22;
}

+ (UIBezierPath)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius
{
  return (UIBezierPath *)objc_msgSend(a1, "_bezierPathWithRoundedRect:byRoundingCorners:cornerRadius:", -1, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, cornerRadius);
}

- (void)addLineToPoint:(CGPoint)point
{
  CGPathAddLineToPoint(self->_path, 0, point.x, point.y);
  self->_immutablePathIsValid = 0;
}

- (void)_invalidatePathMetadataIncludingCornerRadius:(BOOL)a3
{
  self->_immutablePathIsValid = 0;
  if (a3)
  {
    self->_isRoundedRect = 0;
    self->_cornerRadius = 0.0;
    self->_hasContinuousCorners = 0;
    self->_cornerMask = 0;
  }
}

- (void)moveToPoint:(CGPoint)point
{
  CGPathMoveToPoint(self->_path, 0, point.x, point.y);
  self->_immutablePathIsValid = 0;
}

+ (id)_continuousRoundedRectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 cornerRadius:(CGSize)a5 segments:(int)a6
{
  uint64_t v6;
  double height;
  double width;
  double y;
  double x;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v6 = *(_QWORD *)&a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", a5.width, a5.height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = v13;
  v17[2] = v13;
  v17[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadii:segments:smoothPillShapes:clampCornerRadii:", a4, v14, v6, 0, 1, x, y, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (UIBezierPath)bezierPathWithOvalInRect:(CGRect)rect
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v7;
  CGPath *v8;
  double v9;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  objc_msgSend(a1, "bezierPath");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (CGPath *)objc_msgSend((id)v7, "_mutablePath");
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  CGPathAddEllipseInRect(v8, 0, v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v9 = CGRectGetWidth(v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (vabdd_f64(v9, CGRectGetHeight(v13)) <= 2.22044605e-16)
  {
    *(_BYTE *)(v7 + 89) = 1;
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    *(CGFloat *)(v7 + 96) = CGRectGetHeight(v14) * 0.5;
    *(_BYTE *)(v7 + 104) = 0;
    *(_QWORD *)(v7 + 112) = 15;
  }
  return (UIBezierPath *)(id)v7;
}

- (void)appendPath:(UIBezierPath *)bezierPath
{
  CGPathAddPath(self->_path, 0, -[UIBezierPath _mutablePath](bezierPath, "_mutablePath"));
  -[UIBezierPath _invalidatePathMetadata](self, "_invalidatePathMetadata");
}

+ (UIBezierPath)bezierPathWithRect:(CGRect)rect
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v7;
  CGPath *v8;
  CGRect v10;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  objc_msgSend(a1, "bezierPath");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (CGPath *)objc_msgSend((id)v7, "_mutablePath");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  CGPathAddRect(v8, 0, v10);
  *(_BYTE *)(v7 + 89) = 1;
  *(_QWORD *)(v7 + 112) = 15;
  return (UIBezierPath *)(id)v7;
}

- (CGPath)_mutablePath
{
  return self->_path;
}

- (CGPoint)currentPoint
{
  double x;
  double y;
  CGPoint CurrentPoint;
  CGPoint result;

  CurrentPoint = CGPathGetCurrentPoint(self->_path);
  y = CurrentPoint.y;
  x = CurrentPoint.x;
  result.y = y;
  result.x = x;
  return result;
}

+ (UIBezierPath)bezierPathWithCGPath:(CGPathRef)CGPath
{
  CGMutablePathRef MutableCopy;
  void *v5;

  if (CGPath)
  {
    MutableCopy = CGPathCreateMutableCopy(CGPath);
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCGMutablePath:", MutableCopy);
    CFRelease(MutableCopy);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("CGPath must be non-nil"));
    v5 = 0;
  }
  return (UIBezierPath *)v5;
}

- (void)stroke
{
  _QWORD *ContextStack;
  CGContext *v4;
  size_t lineDashPatternCount;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v4 = 0;
  else
    v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSaveGState(v4);
  CGContextSetLineWidth(v4, self->_lineWidth);
  CGContextSetLineJoin(v4, (CGLineJoin)self->_lineJoinStyle);
  CGContextSetLineCap(v4, (CGLineCap)self->_lineCapStyle);
  CGContextSetMiterLimit(v4, self->_miterLimit);
  CGContextSetFlatness(v4, self->_flatness);
  lineDashPatternCount = self->_lineDashPatternCount;
  if (lineDashPatternCount)
    CGContextSetLineDash(v4, self->_lineDashPhase, self->_lineDashPattern, lineDashPatternCount);
  CGContextAddPath(v4, self->_path);
  CGContextStrokePath(v4);
  CGContextRestoreGState(v4);
}

- (CGPathRef)CGPath
{
  _BOOL4 immutablePathIsValid;
  CGPathRef result;

  immutablePathIsValid = self->_immutablePathIsValid;
  result = self->_immutablePath;
  if (!immutablePathIsValid)
  {
    CGPathRelease(result);
    result = CGPathCreateMutableCopy(self->_path);
    self->_immutablePath = result;
    self->_immutablePathIsValid = 1;
  }
  return result;
}

- (void)closePath
{
  CGPathCloseSubpath(self->_path);
  self->_immutablePathIsValid = 0;
}

- (void)fill
{
  _QWORD *ContextStack;
  CGContext *v4;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v4 = 0;
  else
    v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSaveGState(v4);
  CGContextSetFlatness(v4, self->_flatness);
  CGContextAddPath(v4, self->_path);
  if (self->_usesEvenOddFillRule)
    CGContextEOFillPath(v4);
  else
    CGContextFillPath(v4);
  CGContextRestoreGState(v4);
}

- (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2
{
  CGPathAddCurveToPoint(self->_path, 0, controlPoint1.x, controlPoint1.y, controlPoint2.x, controlPoint2.y, endPoint.x, endPoint.y);
  self->_immutablePathIsValid = 0;
}

- (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise
{
  CGPathAddArc(self->_path, 0, center.x, center.y, radius, startAngle, endAngle, !clockwise);
  self->_immutablePathIsValid = 0;
}

+ (UIBezierPath)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise
{
  CGFloat y;
  CGFloat x;
  CGPath *Mutable;
  void *v15;

  y = center.y;
  x = center.x;
  Mutable = CGPathCreateMutable();
  CGPathAddArc(Mutable, 0, x, y, radius, startAngle, endAngle, !clockwise);
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCGMutablePath:", Mutable);
  CFRelease(Mutable);
  return (UIBezierPath *)v15;
}

- (void)setLineJoinStyle:(CGLineJoin)lineJoinStyle
{
  self->_lineJoinStyle = lineJoinStyle;
}

- (void)addClip
{
  _QWORD *ContextStack;
  CGContext *v4;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v4 = 0;
  else
    v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextAddPath(v4, self->_path);
  if (self->_usesEvenOddFillRule)
    CGContextEOClip(v4);
  else
    CGContextClip(v4);
}

- (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint
{
  CGPathAddQuadCurveToPoint(self->_path, 0, controlPoint.x, controlPoint.y, endPoint.x, endPoint.y);
  self->_immutablePathIsValid = 0;
}

+ (id)_bezierPathWithPillRect:(CGRect)a3 cornerRadius:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", a4, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = v9;
  v13[2] = v9;
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadii:segments:smoothPillShapes:clampCornerRadii:", -1, v10, 16, 1, 1, x, y, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIBezierPath)initWithCoder:(NSCoder *)coder
{
  NSCoder *v5;
  void *v6;
  CGPath *Mutable;
  UIBezierPath *v8;
  CGPath *v9;
  unint64_t v10;
  float *v11;
  unint64_t lineDashPatternCount;
  double *v13;
  unint64_t i;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  void *v22;
  uint64_t v23;

  v5 = coder;
  if (-[NSCoder allowsKeyedCoding](v5, "allowsKeyedCoding"))
  {
    -[NSCoder decodeObjectOfClass:forKey:](v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIBezierPathCGPathDataKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      Mutable = -[UIBezierPath _createMutablePathByDecodingData:](self, "_createMutablePathByDecodingData:", v6);
      if (!Mutable)
      {

        self = 0;
LABEL_13:

        v8 = self;
        goto LABEL_14;
      }
    }
    else
    {
      Mutable = CGPathCreateMutable();
    }
    v9 = Mutable;
    UIBezierPathCommonInit(self, Mutable);
    CFRelease(v9);
    v10 = -[NSCoder decodeIntegerForKey:](v5, "decodeIntegerForKey:", CFSTR("UIBezierPathLineDashPatternCountKey"));
    self->_lineDashPatternCount = v10;
    if (v10)
    {
      v23 = 0;
      v11 = -[NSCoder decodeBytesForKey:returnedLength:](objc_retainAutorelease(v5), "decodeBytesForKey:returnedLength:", CFSTR("UIBezierPathLineDashPatternKey"), &v23);
      lineDashPatternCount = self->_lineDashPatternCount;
      if (v23 != 4 * lineDashPatternCount)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBezierPath.m"), 151, CFSTR("decoded line dash pattern length mismatch"));

        lineDashPatternCount = self->_lineDashPatternCount;
      }
      v13 = (double *)malloc_type_malloc(8 * lineDashPatternCount, 0x100004000313F17uLL);
      self->_lineDashPattern = v13;
      for (i = self->_lineDashPatternCount; i; --i)
      {
        v15 = *v11++;
        *v13++ = v15;
      }
    }
    -[NSCoder decodeFloatForKey:](v5, "decodeFloatForKey:", CFSTR("UIBezierPathLineWidthKey"));
    self->_lineWidth = v16;
    -[NSCoder decodeFloatForKey:](v5, "decodeFloatForKey:", CFSTR("UIBezierPathMiterLimitKey"));
    self->_miterLimit = v17;
    -[NSCoder decodeFloatForKey:](v5, "decodeFloatForKey:", CFSTR("UIBezierPathFlatnessKey"));
    self->_flatness = v18;
    -[NSCoder decodeFloatForKey:](v5, "decodeFloatForKey:", CFSTR("UIBezierPathLineDashPhaseKey"));
    self->_lineDashPhase = v19;
    self->_lineCapStyle = -[NSCoder decodeIntegerForKey:](v5, "decodeIntegerForKey:", CFSTR("UIBezierPathLineCapStyleKey"));
    self->_lineJoinStyle = -[NSCoder decodeIntegerForKey:](v5, "decodeIntegerForKey:", CFSTR("UIBezierPathLineJoinStyleKey"));
    self->_usesEvenOddFillRule = -[NSCoder decodeBoolForKey:](v5, "decodeBoolForKey:", CFSTR("UIBezierPathUsesEvenOddFillRuleKey"));
    self->_isRoundedRect = -[NSCoder decodeBoolForKey:](v5, "decodeBoolForKey:", CFSTR("UIBezierPathIsRoundedRectKey"));
    -[NSCoder decodeFloatForKey:](v5, "decodeFloatForKey:", CFSTR("UIBezierPathCornerRadiusKey"));
    self->_cornerRadius = v20;
    self->_cornerMask = -[NSCoder decodeIntegerForKey:](v5, "decodeIntegerForKey:", CFSTR("UIBezierPathCornerMaskKey"));
    self->_hasContinuousCorners = -[NSCoder decodeBoolForKey:](v5, "decodeBoolForKey:", CFSTR("UIBezierPathHasContinuousCornersKey"));
    self = self;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("UIBezierPath only supports keyed coding."));
  v8 = 0;
LABEL_14:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  unint64_t lineDashPatternCount;
  float *v7;
  unint64_t v8;
  double *lineDashPattern;
  float *v10;
  double v11;
  float v12;
  double lineWidth;
  double miterLimit;
  double flatness;
  double lineDashPhase;
  double cornerRadius;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    CGPathApply(self->_path, v5, (CGPathApplierFunction)__encodePathElementIntoData);
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UIBezierPathCGPathDataKey"));
    objc_msgSend(v4, "encodeInteger:forKey:", self->_lineDashPatternCount, CFSTR("UIBezierPathLineDashPatternCountKey"));
    lineDashPatternCount = self->_lineDashPatternCount;
    if (lineDashPatternCount)
    {
      v7 = (float *)((char *)v18 - ((4 * lineDashPatternCount + 15) & 0xFFFFFFFFFFFFFFF0));
      v8 = self->_lineDashPatternCount;
      if (v8)
      {
        lineDashPattern = self->_lineDashPattern;
        v10 = v7;
        do
        {
          v11 = *lineDashPattern++;
          v12 = v11;
          *v10++ = v12;
          --v8;
        }
        while (v8);
      }
      objc_msgSend(v4, "encodeBytes:length:forKey:");
    }
    lineWidth = self->_lineWidth;
    *(float *)&lineWidth = lineWidth;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIBezierPathLineWidthKey"), lineWidth);
    miterLimit = self->_miterLimit;
    *(float *)&miterLimit = miterLimit;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIBezierPathMiterLimitKey"), miterLimit);
    flatness = self->_flatness;
    *(float *)&flatness = flatness;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIBezierPathFlatnessKey"), flatness);
    lineDashPhase = self->_lineDashPhase;
    *(float *)&lineDashPhase = lineDashPhase;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIBezierPathLineDashPhaseKey"), lineDashPhase);
    objc_msgSend(v4, "encodeInteger:forKey:", self->_lineCapStyle, CFSTR("UIBezierPathLineCapStyleKey"));
    objc_msgSend(v4, "encodeInteger:forKey:", self->_lineJoinStyle, CFSTR("UIBezierPathLineJoinStyleKey"));
    objc_msgSend(v4, "encodeBool:forKey:", self->_usesEvenOddFillRule, CFSTR("UIBezierPathUsesEvenOddFillRuleKey"));
    objc_msgSend(v4, "encodeBool:forKey:", self->_isRoundedRect, CFSTR("UIBezierPathIsRoundedRectKey"));
    cornerRadius = self->_cornerRadius;
    *(float *)&cornerRadius = cornerRadius;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIBezierPathCornerRadiusKey"), cornerRadius);
    objc_msgSend(v4, "encodeInteger:forKey:", self->_cornerMask, CFSTR("UIBezierPathCornerMaskKey"));
    objc_msgSend(v4, "encodeBool:forKey:", self->_hasContinuousCorners, CFSTR("UIBezierPathHasContinuousCornersKey"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C78], CFSTR("UIBezierPath only supports keyed coding."));
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  const CGPath *MutableCopy;
  uint64_t v6;
  unint64_t lineDashPatternCount;
  void *v8;

  MutableCopy = CGPathCreateMutableCopy(self->_path);
  v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithCGMutablePath:", MutableCopy);
  CGPathRelease(MutableCopy);
  *(double *)(v6 + 32) = self->_lineWidth;
  *(double *)(v6 + 40) = self->_miterLimit;
  *(double *)(v6 + 48) = self->_flatness;
  *(double *)(v6 + 56) = self->_lineDashPhase;
  *(_QWORD *)(v6 + 24) = self->_lineDashPatternCount;
  *(_DWORD *)(v6 + 64) = self->_lineCapStyle;
  *(_DWORD *)(v6 + 68) = self->_lineJoinStyle;
  *(_BYTE *)(v6 + 72) = self->_usesEvenOddFillRule;
  *(_BYTE *)(v6 + 89) = self->_isRoundedRect;
  *(double *)(v6 + 96) = self->_cornerRadius;
  *(_BYTE *)(v6 + 104) = self->_hasContinuousCorners;
  *(_QWORD *)(v6 + 112) = self->_cornerMask;
  lineDashPatternCount = self->_lineDashPatternCount;
  if (lineDashPatternCount)
  {
    v8 = malloc_type_malloc(8 * lineDashPatternCount, 0x100004000313F17uLL);
    *(_QWORD *)(v6 + 16) = v8;
    memcpy(v8, self->_lineDashPattern, 8 * self->_lineDashPatternCount);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  UIBezierPath *v4;
  UIBezierPath *v5;
  const CGPath *v6;
  UIBezierPath *v7;
  _BOOL4 v8;
  double *lineDashPattern;
  double *v10;
  unint64_t lineDashPatternCount;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v18;
  float64x2_t v19;

  v4 = (UIBezierPath *)a3;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_retainAutorelease(self);
      v6 = -[UIBezierPath CGPath](v5, "CGPath");
      v7 = objc_retainAutorelease(v4);
      v8 = CGPathEqualToPath(v6, -[UIBezierPath CGPath](v7, "CGPath"));
      lineDashPattern = v5->_lineDashPattern;
      v10 = v7->_lineDashPattern;
      if (lineDashPattern == v10)
      {
        LOBYTE(lineDashPatternCount) = 0;
      }
      else
      {
        lineDashPatternCount = v5->_lineDashPatternCount;
        if (lineDashPatternCount == v7->_lineDashPatternCount)
        {
          if (lineDashPatternCount)
          {
            v12 = lineDashPatternCount - 1;
            do
            {
              v13 = *lineDashPattern++;
              v14 = v13;
              v15 = *v10++;
              v16 = vabdd_f64(v14, v15);
              LOBYTE(lineDashPatternCount) = v16 > 0.00000011920929;
            }
            while (v16 <= 0.00000011920929 && v12-- != 0);
          }
        }
        else
        {
          LOBYTE(lineDashPatternCount) = 1;
        }
      }
      v18 = 0;
      v19 = (float64x2_t)vdupq_n_s64(0x3E80000000000000uLL);
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_f64(v19, vabsq_f64(vsubq_f64(*(float64x2_t *)&v5->_lineWidth, *(float64x2_t *)&v7->_lineWidth))), (int32x4_t)vcgtq_f64(v19, vabsq_f64(vsubq_f64(*(float64x2_t *)&v5->_flatness, *(float64x2_t *)&v7->_flatness))))))) & 1) == 0&& v5->_lineCapStyle == v7->_lineCapStyle&& (lineDashPatternCount & 1) == 0&& v8)
      {
        v18 = v5->_usesEvenOddFillRule == v7->_usesEvenOddFillRule && v5->_lineJoinStyle == v7->_lineJoinStyle;
      }
    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

+ (id)_bezierPathWithArcRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  return (id)objc_msgSend(a1, "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", -1, 16, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (void)applyTransform:(CGAffineTransform *)transform
{
  CGPath *Mutable;
  __int128 v6;
  double width;
  double rotation;
  _BOOL8 v9;
  CGAffineTransform v11;
  CGAffineTransformComponents v12;

  Mutable = CGPathCreateMutable();
  CGPathAddPath(Mutable, transform, self->_path);
  CFRelease(self->_path);
  self->_path = Mutable;
  v6 = *(_OWORD *)&transform->c;
  *(_OWORD *)&v11.a = *(_OWORD *)&transform->a;
  *(_OWORD *)&v11.c = v6;
  *(_OWORD *)&v11.tx = *(_OWORD *)&transform->tx;
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformDecompose(&v12, &v11);
  rotation = v12.rotation;
  v9 = 1;
  if (v12.rotation == 0.0)
  {
    width = v12.scale.width;
    rotation = 1.0;
    if (v12.horizontalShear == 0.0 && v12.scale.width == 1.0)
    {
      width = v12.scale.height;
      v9 = v12.scale.height != 1.0;
    }
  }
  -[UIBezierPath _invalidatePathMetadataIncludingCornerRadius:](self, "_invalidatePathMetadataIncludingCornerRadius:", v9, rotation, width);
}

- (void)removeAllPoints
{
  CFRelease(self->_path);
  self->_path = CGPathCreateMutable();
  -[UIBezierPath _invalidatePathMetadata](self, "_invalidatePathMetadata");
}

- (UIBezierPath)bezierPathByReversingPath
{
  char *v4;
  id v5;
  char *v6;
  unint64_t v7;
  char *v8;
  char *v9;
  double *v10;
  int v11;
  char v12;
  double *v13;
  uint64_t v14;
  char *v15;
  uint64_t info;
  _BYTE v17[3584];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  info = 0;
  CGPathApply(self->_path, &info, (CGPathApplierFunction)CountPathElements);
  if (info <= 1)
    return (UIBezierPath *)(id)-[UIBezierPath copy](self, "copy");
  v14 = 0;
  if ((unint64_t)info < 0x41)
    v4 = v17;
  else
    v4 = (char *)malloc_type_malloc(56 * info, 0x1000040577F94FBuLL);
  v15 = v4;
  CGPathApply(self->_path, &v14, (CGPathApplierFunction)RecordPathElements);
  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = v15;
  if (v14 >= 1)
  {
    v7 = (unint64_t)&v15[56 * v14];
    v8 = v15 + 56;
    v9 = v15 - 56;
    do
    {
      v10 = (double *)v6;
      v6 = v8;
      if ((unint64_t)v8 >= v7 || !*((_DWORD *)v10 + 14))
      {
        v11 = *(_DWORD *)v10;
        if (*(_DWORD *)v10 == 4 || (objc_msgSend(v5, "moveToPoint:", v10[1], v10[2]), (v11 = *(_DWORD *)v10) != 0))
        {
          v12 = 0;
          v13 = (double *)v9;
          while (2)
          {
            switch(v11)
            {
              case 1:
                objc_msgSend(v5, "addLineToPoint:", v13[1], v13[2]);
                if ((v12 & 1) == 0)
                  goto LABEL_18;
                goto LABEL_15;
              case 2:
                objc_msgSend(v5, "addQuadCurveToPoint:controlPoint:", v13[1], v13[2], v13[10], v13[11]);
                if ((v12 & 1) == 0)
                  goto LABEL_18;
                goto LABEL_15;
              case 3:
                objc_msgSend(v5, "addCurveToPoint:controlPoint1:controlPoint2:", v13[1], v13[2], v13[12], v13[13], v13[10], v13[11]);
                if ((v12 & 1) != 0)
                {
LABEL_15:
                  v11 = *(_DWORD *)v13;
                  if (*(_DWORD *)v13)
                  {
                    v12 = 1;
                    goto LABEL_25;
                  }
                  objc_msgSend(v5, "closePath");
LABEL_23:
                  v12 = 1;
                }
                else
                {
LABEL_18:
                  v12 = 0;
                }
LABEL_24:
                v11 = *(_DWORD *)v13;
LABEL_25:
                v13 -= 7;
                if (!v11)
                  break;
                continue;
              case 4:
                objc_msgSend(v5, "moveToPoint:", v13[1], v13[2]);
                goto LABEL_23;
              default:
                goto LABEL_24;
            }
            break;
          }
        }
        if ((unint64_t)v6 < v7)
          objc_msgSend(v5, "moveToPoint:", v10[8], v10[9]);
      }
      v8 = v6 + 56;
      v9 += 56;
    }
    while ((unint64_t)(v6 + 56) <= v7);
    v6 = v15;
  }
  if (v6 != v17)
    free(v6);
  return (UIBezierPath *)v5;
}

- (void)setCGPath:(CGPathRef)CGPath
{
  if (CGPath)
  {
    CFRelease(self->_path);
    self->_path = CGPathCreateMutableCopy(CGPath);
    -[UIBezierPath _invalidatePathMetadata](self, "_invalidatePathMetadata");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("CGPath must be non-nil"));
  }
}

- (BOOL)isEmpty
{
  return CGPathIsEmpty(self->_path);
}

- (CGRect)bounds
{
  return CGPathGetPathBoundingBox(self->_path);
}

- (BOOL)containsPoint:(CGPoint)point
{
  return CGPathContainsPoint(self->_path, 0, point, self->_usesEvenOddFillRule);
}

- (void)setLineDash:(const CGFloat *)pattern count:(NSInteger)count phase:(CGFloat)phase
{
  double *lineDashPattern;
  double *v10;

  lineDashPattern = self->_lineDashPattern;
  if (lineDashPattern)
    free(lineDashPattern);
  if (pattern && count > 0)
  {
    v10 = (double *)malloc_type_malloc(8 * count, 0x100004000313F17uLL);
    self->_lineDashPattern = v10;
    memcpy(v10, pattern, 8 * count);
  }
  else
  {
    count = 0;
    self->_lineDashPattern = 0;
    phase = 0.0;
  }
  self->_lineDashPatternCount = count;
  self->_lineDashPhase = phase;
}

- (void)getLineDash:(CGFloat *)pattern count:(NSInteger *)count phase:(CGFloat *)phase
{
  double *lineDashPattern;
  unint64_t i;
  uint64_t v7;

  if (count)
    *count = self->_lineDashPatternCount;
  if (phase)
    *phase = self->_lineDashPhase;
  if (pattern)
  {
    lineDashPattern = self->_lineDashPattern;
    if (lineDashPattern)
    {
      for (i = self->_lineDashPatternCount; i; --i)
      {
        v7 = *(_QWORD *)lineDashPattern++;
        *(_QWORD *)pattern++ = v7;
      }
    }
  }
}

- (void)strokeWithBlendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha
{
  _QWORD *ContextStack;
  CGContext *v8;
  size_t lineDashPatternCount;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v8 = 0;
  else
    v8 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSaveGState(v8);
  CGContextSetBlendMode(v8, blendMode);
  CGContextSetAlpha(v8, alpha);
  CGContextSetLineWidth(v8, self->_lineWidth);
  CGContextSetLineJoin(v8, (CGLineJoin)self->_lineJoinStyle);
  CGContextSetLineCap(v8, (CGLineCap)self->_lineCapStyle);
  CGContextSetMiterLimit(v8, self->_miterLimit);
  CGContextSetFlatness(v8, self->_flatness);
  lineDashPatternCount = self->_lineDashPatternCount;
  if (lineDashPatternCount)
    CGContextSetLineDash(v8, self->_lineDashPhase, self->_lineDashPattern, lineDashPatternCount);
  CGContextAddPath(v8, self->_path);
  CGContextStrokePath(v8);
  CGContextRestoreGState(v8);
}

+ (id)roundedRectBezierPath:(CGRect)a3 withTopCornerRadius:(double)a4 withBottomCornerRadius:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  unsigned int i;
  double v14;
  void *v15;
  void *v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 4; ++i)
  {
    if (i >= 2)
      v14 = a5;
    else
      v14 = a4;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v14, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v15);

  }
  objc_msgSend(a1, "roundedRectBezierPath:withRoundedCorners:withCornerRadii:", -1, v12, x, y, width, height);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (CGPath)_createMutablePathByDecodingData:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  CGPath *Mutable;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  BOOL v15;
  float64x2_t *v16;
  uint64_t v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SEL v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    v7 = v6;
    v24 = a2;
    Mutable = CGPathCreateMutable();
    v9 = objc_msgSend(objc_retainAutorelease(v5), "bytes");
    v10 = 0;
    v25 = *MEMORY[0x1E0C9D538];
    do
    {
      v11 = *(unsigned int *)(v9 + v10 + 4);
      v12 = *(int *)(v9 + v10);
      v26 = v25;
      v27 = v25;
      v28 = v25;
      if (v12 > 3)
        v13 = 0;
      else
        v13 = dword_18667D140[v12];
      v14 = v10 + 8;
      if ((_DWORD)v11)
        v15 = (_DWORD)v11 == v13;
      else
        v15 = 0;
      if (v15)
      {
        v16 = (float64x2_t *)&v26;
        v17 = v11;
        do
        {
          v10 = v14 + 8;
          *v16++ = vcvtq_f64_f32(*(float32x2_t *)(v9 + v14));
          v14 += 8;
          --v17;
        }
        while (v17);
      }
      else
      {
        v10 += 8;
      }
      switch((int)v12)
      {
        case 0:
          if ((_DWORD)v11 != v13)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v24, self, CFSTR("UIBezierPath.m"), 853, CFSTR("incorrect number of points for path element type kCGPathElementMoveToPoint"));

          }
          CGPathMoveToPoint(Mutable, 0, *(CGFloat *)&v26, *((CGFloat *)&v26 + 1));
          break;
        case 1:
          if ((_DWORD)v11 != v13)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", v24, self, CFSTR("UIBezierPath.m"), 857, CFSTR("incorrect number of points for path element type kCGPathElementAddLineToPoint"));

          }
          CGPathAddLineToPoint(Mutable, 0, *(CGFloat *)&v26, *((CGFloat *)&v26 + 1));
          break;
        case 2:
          if ((_DWORD)v11 != v13)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v24, self, CFSTR("UIBezierPath.m"), 861, CFSTR("incorrect number of points for path element type kCGPathElementAddQuadCurveToPoint"));

          }
          CGPathAddQuadCurveToPoint(Mutable, 0, *(CGFloat *)&v26, *((CGFloat *)&v26 + 1), *(CGFloat *)&v27, *((CGFloat *)&v27 + 1));
          break;
        case 3:
          if ((_DWORD)v11 != v13)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v24, self, CFSTR("UIBezierPath.m"), 865, CFSTR("incorrect number of points for path element type kCGPathElementAddCurveToPoint"));

          }
          CGPathAddCurveToPoint(Mutable, 0, *(CGFloat *)&v26, *((CGFloat *)&v26 + 1), *(CGFloat *)&v27, *((CGFloat *)&v27 + 1), *(CGFloat *)&v28, *((CGFloat *)&v28 + 1));
          break;
        case 4:
          if ((_DWORD)v11 != v13)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v24, self, CFSTR("UIBezierPath.m"), 869, CFSTR("incorrect number of points for path element type kCGPathElementCloseSubpath"));

          }
          CGPathCloseSubpath(Mutable);
          break;
        default:
          break;
      }
    }
    while (v10 < v7);
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

- (void)_addRoundedCornerWithTrueCorner:(CGPoint)a3 radius:(CGSize)a4 corner:(unint64_t)a5 clockwise:(BOOL)a6
{
  _addContinuousCornerToPath(self->_path, a5, 3, a6, 0, a3.x, a3.y, a4.width * 1.528665, a4.height * 1.528665);
  self->_immutablePathIsValid = 0;
}

- (void)_addRoundedCornerWithTrueCorner:(CGPoint)a3 radius:(CGSize)a4 corner:(unint64_t)a5 clockwise:(BOOL)a6 leadInIsContinuous:(BOOL)a7 leadOutIsContinuous:(BOOL)a8
{
  _BOOL4 v10;
  _BOOL4 v11;
  int v12;

  v10 = a7;
  if (!a6)
  {
    if (a5 != 1 && a5 != 8)
      goto LABEL_8;
LABEL_7:
    v11 = a7;
    v10 = a8;
    goto LABEL_9;
  }
  if (a5 == 2 || a5 == 4)
    goto LABEL_7;
LABEL_8:
  v11 = a8;
LABEL_9:
  if (v11)
    a4.width = a4.width * 1.528665;
  if (v10)
    a4.height = a4.height * 1.528665;
  if (a8)
    v12 = a7 | 2;
  else
    v12 = a7;
  _addContinuousCornerToPath(self->_path, a5, v12, a6, 0, a3.x, a3.y, a4.width, a4.height);
  self->_immutablePathIsValid = 0;
}

- (id)description
{
  void *v3;
  UIBezierPath *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t info;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p;"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  info = 0;
  v4 = objc_retainAutorelease(self);
  CGPathApply(-[UIBezierPath CGPath](v4, "CGPath"), &info, (CGPathApplierFunction)CountPathElements);
  v17 = 0;
  if (info < 65)
    v5 = &v20;
  else
    v5 = (char *)malloc_type_malloc(56 * info, 0x1000040577F94FBuLL);
  v18 = v5;
  CGPathApply(-[UIBezierPath CGPath](objc_retainAutorelease(v4), "CGPath"), &v17, (CGPathApplierFunction)RecordPathElements);
  if (v17 >= 1)
  {
    v6 = 0;
    v7 = 48;
    do
    {
      objc_msgSend(v3, "appendString:", CFSTR(" <"));
      switch(*(_DWORD *)&v18[v7 - 48])
      {
        case 0:
          NSStringFromCGPoint(*(CGPoint *)&v18[v7 - 40]);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("MoveTo %@"), v8);
          goto LABEL_12;
        case 1:
          NSStringFromCGPoint(*(CGPoint *)&v18[v7 - 40]);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("LineTo %@"), v8);
          goto LABEL_12;
        case 2:
          NSStringFromCGPoint(*(CGPoint *)&v18[v7 - 40]);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromCGPoint(*(CGPoint *)&v18[v7 - 24]);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("QuadCurveTo %@ - %@"), v8, v9);

LABEL_12:
          break;
        case 3:
          NSStringFromCGPoint(*(CGPoint *)&v18[v7 - 40]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromCGPoint(*(CGPoint *)&v18[v7 - 24]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromCGPoint(*(CGPoint *)&v18[v7 - 8]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("CurveTo %@ %@ %@"), v10, v11, v12);

          break;
        case 4:
          objc_msgSend(v3, "appendFormat:", CFSTR("Close"), v16);
          break;
        default:
          objc_msgSend(v3, "appendFormat:", CFSTR("Unknown %d"), *(unsigned int *)&v18[v7 - 48]);
          break;
      }
      ++v6;
      v13 = v17;
      if (v17 > v6)
      {
        objc_msgSend(v3, "appendString:", CFSTR(">,\n"));
        v13 = v17;
      }
      v7 += 56;
    }
    while (v13 > v6);
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

- (id)_objcCodeDescription
{
  uint64_t v2;
  void *v4;
  UIBezierPath *v5;
  char *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  const __CFString *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char *v26;
  uint64_t info;
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("UIBezierPath *path = [UIBezierPath new];\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  info = 0;
  v5 = objc_retainAutorelease(self);
  CGPathApply(-[UIBezierPath CGPath](v5, "CGPath"), &info, (CGPathApplierFunction)CountPathElements);
  v25 = 0;
  if (info < 65)
    v6 = &v28;
  else
    v6 = (char *)malloc_type_malloc(56 * info, 0x1000040577F94FBuLL);
  v26 = v6;
  CGPathApply(-[UIBezierPath CGPath](objc_retainAutorelease(v5), "CGPath"), &v25, (CGPathApplierFunction)RecordPathElements);
  if (v25 >= 1)
  {
    v7 = 0;
    v8 = CFSTR("[");
    v9 = 48;
    v10 = CFSTR("];\n");
    v11 = 0x1E0CB3000uLL;
    do
    {
      objc_msgSend(v4, "appendString:", v8);
      switch(*(_DWORD *)&v26[v9 - 48])
      {
        case 0:
          objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", CFSTR("CGPointMake(%f, %f)"), *(_QWORD *)&v26[v9 - 40], *(_QWORD *)&v26[v9 - 32]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("path moveToPoint:%@"), v12);
          goto LABEL_12;
        case 1:
          objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", CFSTR("CGPointMake(%f, %f)"), *(_QWORD *)&v26[v9 - 40], *(_QWORD *)&v26[v9 - 32]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("path addLineToPoint:%@"), v12);
          goto LABEL_12;
        case 2:
          objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", CFSTR("CGPointMake(%f, %f)"), *(_QWORD *)&v26[v9 - 40], *(_QWORD *)&v26[v9 - 32]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", CFSTR("CGPointMake(%f, %f)"), *(_QWORD *)&v26[v9 - 24], *(_QWORD *)&v26[v9 - 16]);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("path addQuadCurveToPoint:%@ controlPoint:%@"), v12, v13);

LABEL_12:
          break;
        case 3:
          objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", CFSTR("CGPointMake(%f, %f)"), *(_QWORD *)&v26[v9 - 40], *(_QWORD *)&v26[v9 - 32]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", CFSTR("CGPointMake(%f, %f)"), *(_QWORD *)&v26[v9 - 24], *(_QWORD *)&v26[v9 - 16]);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", CFSTR("CGPointMake(%f, %f)"), *(_QWORD *)&v26[v9 - 8], *(_QWORD *)&v26[v9]);
          v15 = v11;
          v16 = v8;
          v17 = v2;
          v18 = v10;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("path addCurveToPoint:%@ controlPoint1:%@ controlPoint2:%@"), v24, v14, v19);

          v10 = v18;
          v2 = v17;
          v8 = v16;
          v11 = v15;

          break;
        case 4:
          objc_msgSend(v4, "appendFormat:", CFSTR("path closePath];"), v23);
          break;
        default:
          objc_msgSend(v4, "appendFormat:", CFSTR("Unknown %d"), *(unsigned int *)&v26[v9 - 48]);
          break;
      }
      ++v7;
      v20 = v25;
      if (v25 > v7)
      {
        objc_msgSend(v4, "appendString:", v10);
        v20 = v25;
      }
      v9 += 56;
    }
    while (v20 > v7);
  }
  v21 = (void *)objc_msgSend(v4, "copy");

  return v21;
}

- (CGPath)_pathRef
{
  return self->_path;
}

- (void)appendBezierPath:(id)a3
{
  CGPathAddPath(self->_path, 0, (CGPathRef)objc_msgSend(a3, "_mutablePath"));
  -[UIBezierPath _invalidatePathMetadata](self, "_invalidatePathMetadata");
}

- (void)appendBezierPathWithRect:(CGRect)a3
{
  CGPathAddRect(self->_path, 0, a3);
  -[UIBezierPath _invalidatePathMetadata](self, "_invalidatePathMetadata");
}

- (void)appendBezierPathWithOvalInRect:(CGRect)a3
{
  CGPathAddEllipseInRect(self->_path, 0, a3);
  -[UIBezierPath _invalidatePathMetadata](self, "_invalidatePathMetadata");
}

- (void)appendBezierPathWithOvalInRect:(CGRect)a3 transform:(CGAffineTransform *)a4
{
  CGPathAddEllipseInRect(self->_path, a4, a3);
  -[UIBezierPath _invalidatePathMetadata](self, "_invalidatePathMetadata");
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6 clockwise:(BOOL)a7
{
  CGPathAddArc(self->_path, 0, a3.x, a3.y, a4, a5, a6, !a7);
  -[UIBezierPath _invalidatePathMetadata](self, "_invalidatePathMetadata");
}

+ (id)roundedRectBezierPath:(CGRect)a3 withRoundedEdges:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = ((uint64_t)(a4 << 62) >> 63) & 5;
  if ((a4 & 8) != 0)
    v4 |= 0xAuLL;
  if ((a4 & 1) != 0)
    v4 |= 3uLL;
  if ((a4 & 4) != 0)
    v5 = v4 | 0xC;
  else
    v5 = v4;
  return +[UIBezierPath _continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:](UIBezierPath, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:", v5, 16, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a3.size.height * 0.5, a3.size.width * 0.5);
}

+ (id)roundedRectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 withCornerRadii:(id)a5
{
  return +[UIBezierPath _continuousRoundedRectBezierPath:withRoundedCorners:cornerRadii:segments:smoothPillShapes:clampCornerRadii:](UIBezierPath, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadii:segments:smoothPillShapes:clampCornerRadii:", a4, a5, 16, 0, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)_roundedRectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 cornerRadius:(double)a5 segments:(int)a6
{
  return (id)objc_msgSend(a1, "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", a4, *(_QWORD *)&a6, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
}

+ (id)_continuousRoundedCARectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 cornerRadius:(CGSize)a5 segments:(int)a6
{
  uint64_t v6;
  double height;
  double width;
  double y;
  double x;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v6 = *(_QWORD *)&a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", a5.width, a5.height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = v13;
  v17[2] = v13;
  v17[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadii:segments:smoothPillShapes:clampCornerRadii:", a4, v14, v6, 0, 0, x, y, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_bezierPathConvertedFromCoordinateSpace:(id)a3 toCoordinateSpace:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  CGPath *path;
  CGMutablePathRef Mutable;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  CGMutablePathRef v22;
  _QWORD aBlock[4];
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__UIBezierPath__bezierPathConvertedFromCoordinateSpace_toCoordinateSpace___block_invoke;
  aBlock[3] = &unk_1E16C9A20;
  v24 = v6;
  v25 = v7;
  v9 = v7;
  v10 = v6;
  v11 = _Block_copy(aBlock);
  path = self->_path;
  Mutable = CGPathCreateMutable();
  v17 = v8;
  v18 = 3221225472;
  v19 = __74__UIBezierPath__bezierPathConvertedFromCoordinateSpace_toCoordinateSpace___block_invoke_2;
  v20 = &unk_1E16C9A48;
  v21 = v11;
  v22 = Mutable;
  v14 = v11;
  CGPathApplyWithBlock(path, &v17);
  +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", Mutable, v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(Mutable);

  return v15;
}

uint64_t __74__UIBezierPath__bezierPathConvertedFromCoordinateSpace_toCoordinateSpace___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "convertPoint:toCoordinateSpace:", *(_QWORD *)(a1 + 40));
}

void __74__UIBezierPath__bezierPathConvertedFromCoordinateSpace_toCoordinateSpace___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;

  v3 = *(double **)(a2 + 8);
  switch(*(_DWORD *)a2)
  {
    case 0:
      v4 = (*(double (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(*v3, v3[1]);
      CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, v4, v5);
      break;
    case 1:
      v6 = (*(double (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(*v3, v3[1]);
      CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 40), 0, v6, v7);
      break;
    case 2:
      v8 = (*(double (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(*v3, v3[1]);
      v10 = v9;
      v11 = (*(double (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(v3[2], v3[3]);
      CGPathAddQuadCurveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, v8, v10, v11, v12);
      break;
    case 3:
      v13 = (*(double (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(*v3, v3[1]);
      v15 = v14;
      v16 = (*(double (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(v3[2], v3[3]);
      v18 = v17;
      v19 = (*(double (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(v3[4], v3[5]);
      CGPathAddCurveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, v13, v15, v16, v18, v19, v20);
      break;
    case 4:
      CGPathCloseSubpath(*(CGMutablePathRef *)(a1 + 40));
      break;
    default:
      return;
  }
}

- (BOOL)_isRoundedRect
{
  return self->_isRoundedRect;
}

- (double)_cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)_hasContinuousCorners
{
  return self->_hasContinuousCorners;
}

- (unint64_t)_cornerMask
{
  return self->_cornerMask;
}

- (CGFloat)lineWidth
{
  return self->_lineWidth;
}

- (CGLineCap)lineCapStyle
{
  return self->_lineCapStyle;
}

- (void)setLineCapStyle:(CGLineCap)lineCapStyle
{
  self->_lineCapStyle = lineCapStyle;
}

- (CGLineJoin)lineJoinStyle
{
  return self->_lineJoinStyle;
}

- (CGFloat)miterLimit
{
  return self->_miterLimit;
}

- (void)setMiterLimit:(CGFloat)miterLimit
{
  self->_miterLimit = miterLimit;
}

- (CGFloat)flatness
{
  return self->_flatness;
}

- (void)setFlatness:(CGFloat)flatness
{
  self->_flatness = flatness;
}

- (BOOL)usesEvenOddFillRule
{
  return self->_usesEvenOddFillRule;
}

+ (id)shadowBezierPath:(CGRect)a3 withRoundedEdges:(unint64_t)a4
{
  char v4;
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  void *v12;
  CGPath *v13;
  double v14;
  double v15;
  double v16;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a3.size.height * 0.5;
  if ((a4 & 2) != 0)
    v10 = a3.size.height * 0.5;
  else
    v10 = 0.0;
  if ((a4 & 8) != 0)
    v11 = a3.size.height * 0.5;
  else
    v11 = 0.0;
  +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (CGPath *)objc_msgSend(v12, "_pathRef");
  v14 = x + v10;
  CGPathMoveToPoint(v13, 0, v14, y);
  if ((v4 & 2) != 0)
  {
    CGPathAddArc(v13, 0, x + v9, y + v9, v9, 4.71238898, 1.57079633, 1);
    v15 = y + height;
  }
  else
  {
    v15 = y + height;
    CGPathAddLineToPoint(v13, 0, x, v15 + -4.0);
    objc_msgSend(v12, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, x + 4.0, v15 + -4.0, 4.0, 3.14159265, 1.57079633);
  }
  v16 = x + width;
  CGPathAddLineToPoint(v13, 0, v16 - v11, v15);
  if ((v4 & 8) != 0)
  {
    objc_msgSend(v12, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v16 - v9, y + v9, v9, 1.57079633, 4.71238898);
  }
  else
  {
    objc_msgSend(v12, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v16 + -4.0, v15 + -4.0, 4.0, 1.57079633, 0.0);
    CGPathAddLineToPoint(v13, 0, v16, y);
  }
  CGPathAddLineToPoint(v13, 0, v14, y);
  CGPathCloseSubpath(v13);
  return v12;
}

@end

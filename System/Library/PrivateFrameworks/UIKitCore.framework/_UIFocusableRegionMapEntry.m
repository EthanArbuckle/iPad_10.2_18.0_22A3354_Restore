@implementation _UIFocusableRegionMapEntry

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFocusableRegionMapEntry;
  v4 = -[_UIFocusRegionMapEntry copyWithZone:](&v7, sel_copyWithZone_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusableRegion);
  objc_storeWeak(v4 + 13, WeakRetained);

  *((_BYTE *)v4 + 96) = self->_isFocusGuide;
  *((_BYTE *)v4 + 97) = self->_focusCandidate;
  return v4;
}

- (id)visualRepresentationColor
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (-[_UIFocusableRegionMapEntry isFocusGuide](self, "isFocusGuide"))
  {
    if (qword_1ECD7B748 != -1)
      dispatch_once(&qword_1ECD7B748, &__block_literal_global_260_1);
    v3 = qword_1ECD7B740;
  }
  else
  {
    if (qword_1ECD7B758 != -1)
      dispatch_once(&qword_1ECD7B758, &__block_literal_global_263);
    v3 = qword_1ECD7B750;
  }
  -[_UIFocusableRegionMapEntry focusableRegion](self, "focusableRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMapEntry _uniqueElementFromArray:forKey:](self, "_uniqueElementFromArray:forKey:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)drawVisualRepresentationInContext:(CGContext *)a3 imageFrame:(CGRect)a4 isFinal:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  CGFloat v10;
  CGFloat v11;
  CGFloat width;
  CGFloat height;
  void *v14;
  id v15;
  CGPattern *v16;
  CGColorSpace *v17;
  CGColorSpace *Pattern;
  __int128 v19;
  const CGPatternCallbacks *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  _BOOL4 v29;
  double v30;
  id v31;
  const CGFloat *Components;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  CGAffineTransform matrix;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v5 = a5;
  y = a4.origin.y;
  x = a4.origin.x;
  -[_UIFocusRegionMapEntry frame](self, "frame", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v40 = CGRectOffset(v39, -x, -y);
  if (v5)
  {
    v10 = v40.origin.x;
    v11 = v40.origin.y;
    width = v40.size.width;
    height = v40.size.height;
    -[_UIFocusableRegionMapEntry visualRepresentationColor](self, "visualRepresentationColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "colorWithAlphaComponent:", 0.5);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v15, "CGColor"));

    v41.origin.x = v10;
    v41.origin.y = v11;
    v41.size.width = width;
    v41.size.height = height;
    CGContextFillRect(a3, v41);
    v16 = -[_UIFocusRegionMapEntry visualRepresentationPatternType](self, "visualRepresentationPatternType");
    if (v16)
    {
      v17 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D988]);
      Pattern = CGColorSpaceCreatePattern(v17);
      CGContextSetFillColorSpace(a3, Pattern);
      CGColorSpaceRelease(Pattern);
      CGColorSpaceRelease(v17);
      switch((unint64_t)v16)
      {
        case 1uLL:
          v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          *(_OWORD *)&matrix.a = *MEMORY[0x1E0C9BAA8];
          *(_OWORD *)&matrix.c = v19;
          *(_OWORD *)&matrix.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
          v20 = (const CGPatternCallbacks *)&_UIFocusRegionMapEntryPatternCreateWithType_callbacks;
          goto LABEL_11;
        case 2uLL:
          CGAffineTransformMakeRotation(&matrix, 0.785398163);
          v20 = (const CGPatternCallbacks *)&_UIFocusRegionMapEntryPatternCreateWithType_callbacks_316;
          goto LABEL_13;
        case 3uLL:
          v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          *(_OWORD *)&matrix.a = *MEMORY[0x1E0C9BAA8];
          *(_OWORD *)&matrix.c = v21;
          *(_OWORD *)&matrix.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
          v20 = (const CGPatternCallbacks *)&_UIFocusRegionMapEntryPatternCreateWithType_callbacks_317;
          goto LABEL_11;
        case 4uLL:
          CGAffineTransformMakeRotation(&matrix, 1.57079633);
          v20 = (const CGPatternCallbacks *)&_UIFocusRegionMapEntryPatternCreateWithType_callbacks_318;
          goto LABEL_11;
        case 5uLL:
          CGAffineTransformMakeRotation(&matrix, 0.785398163);
          v20 = (const CGPatternCallbacks *)&_UIFocusRegionMapEntryPatternCreateWithType_callbacks_319;
          goto LABEL_11;
        case 6uLL:
          CGAffineTransformMakeRotation(&matrix, 2.35619449);
          v20 = (const CGPatternCallbacks *)&_UIFocusRegionMapEntryPatternCreateWithType_callbacks_320;
LABEL_11:
          v22 = 0;
          v23 = 0;
          v24 = 30.0;
          v25 = 30.0;
          v26 = 30.0;
          v27 = 30.0;
          goto LABEL_14;
        case 7uLL:
          CGAffineTransformMakeRotation(&matrix, 2.35619449);
          v20 = (const CGPatternCallbacks *)&_UIFocusRegionMapEntryPatternCreateWithType_callbacks_321;
LABEL_13:
          v24 = 22.5;
          v22 = 0;
          v23 = 0;
          v25 = 22.5;
          v26 = 22.5;
          v27 = 22.5;
LABEL_14:
          v16 = CGPatternCreate(0, *(CGRect *)&v22, &matrix, v26, v27, kCGPatternTilingConstantSpacing, 0, v20);
          break;
        default:
          v16 = 0;
          break;
      }
    }
    -[_UIFocusableRegionMapEntry visualRepresentationColor](self, "visualRepresentationColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[_UIFocusableRegionMapEntry isFocusGuide](self, "isFocusGuide");
    v30 = 0.3;
    if (v29)
      v30 = 0.4;
    objc_msgSend(v28, "colorWithAlphaComponent:", v30);
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    Components = CGColorGetComponents((CGColorRef)objc_msgSend(v31, "CGColor"));
    CGContextSetFillPattern(a3, v16, Components);

    v42.origin.x = v10;
    v42.origin.y = v11;
    v42.size.width = width;
    v42.size.height = height;
    CGContextFillRect(a3, v42);
    CGPatternRelease(v16);
    -[_UIFocusableRegionMapEntry visualRepresentationColor](self, "visualRepresentationColor");
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(v33, "CGColor"));

    v43.origin.x = v10;
    v43.origin.y = v11;
    v43.size.width = width;
    v43.size.height = height;
    CGContextStrokeRect(a3, v43);
    if (-[_UIFocusableRegionMapEntry isFocusCandidate](self, "isFocusCandidate"))
    {
      CGContextSaveGState(a3);
      v44.origin.x = v10;
      v44.origin.y = v11;
      v44.size.width = width;
      v44.size.height = height;
      v45 = CGRectInset(v44, -6.0, -6.0);
      +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v45.origin.x, v45.origin.y, v45.size.width, v45.size.height, 12.0);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setLineWidth:", 3.0);
      +[UIColor redColor](UIColor, "redColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "colorWithAlphaComponent:", 0.5);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "colorWithAlphaComponent:", 0.5);
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(v36, "CGColor"));

      objc_msgSend(v37, "stroke");
      CGContextRestoreGState(a3);

    }
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  CGRect v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMapEntry frame](self, "frame");
  NSStringFromCGRect(v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusableRegionMapEntry focusableRegion](self, "focusableRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusableRegionMapEntry focusableRegion](self, "focusableRegion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p frame=%@, region=%@: %p>"), v5, self, v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (_UILegacyFocusRegion)focusableRegion
{
  return (_UILegacyFocusRegion *)objc_loadWeakRetained((id *)&self->_focusableRegion);
}

- (void)setFocusableRegion:(id)a3
{
  objc_storeWeak((id *)&self->_focusableRegion, a3);
}

- (BOOL)isFocusGuide
{
  return self->_isFocusGuide;
}

- (void)setIsFocusGuide:(BOOL)a3
{
  self->_isFocusGuide = a3;
}

- (BOOL)isFocusCandidate
{
  return self->_focusCandidate;
}

- (void)setFocusCandidate:(BOOL)a3
{
  self->_focusCandidate = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusableRegion);
}

@end

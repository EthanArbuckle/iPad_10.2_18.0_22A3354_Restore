@implementation PXViewSpec

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setCompositingFilterType:(int64_t)a3
{
  self->_compositingFilterType = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_backgroundColor);
  objc_storeStrong((id *)(v4 + 24), self->_selectionHighlightColor);
  objc_storeStrong((id *)(v4 + 32), self->_borderColor);
  *(double *)(v4 + 40) = self->_borderWidth;
  *(double *)(v4 + 48) = self->_cornerRadius;
  v5 = -[NSString copy](self->_cornerCurve, "copy");
  v6 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v5;

  *(_QWORD *)(v4 + 64) = self->_cornerMask;
  *(double *)(v4 + 72) = self->_displayScale;
  *(_QWORD *)(v4 + 88) = self->_compositingFilterType;
  *(_BYTE *)(v4 + 8) = self->_hidden;
  *(double *)(v4 + 80) = self->_rotationAngle;
  return (id)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerCurve, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_selectionHighlightColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (PXViewSpec)init
{
  PXViewSpec *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXViewSpec;
  result = -[PXViewSpec init](&v3, sel_init);
  if (result)
    result->_displayScale = 1.0;
  return result;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  -[PXViewSpec backgroundColor](self, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[PXViewSpec selectionHighlightColor](self, "selectionHighlightColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[PXViewSpec borderColor](self, "borderColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8 ^ (2 * (uint64_t)self->_borderWidth) ^ (4 * (uint64_t)self->_cornerRadius) ^ (8 * self->_cornerMask) ^ (16 * (uint64_t)self->_displayScale) ^ (32 * self->_hidden);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  id v26;
  void *v27;
  char v28;
  unint64_t v29;
  double v30;
  double v31;
  double v32;
  int64_t v33;
  int v34;
  double v36;
  double v37;
  double v38;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXViewSpec backgroundColor](self, "backgroundColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = objc_msgSend(v6, "isEqual:", v7);

      if ((v9 & 1) == 0)
        goto LABEL_25;
    }
    -[PXViewSpec selectionHighlightColor](self, "selectionHighlightColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionHighlightColor");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 == v12)
    {

    }
    else
    {
      v13 = v12;
      v14 = objc_msgSend(v11, "isEqual:", v12);

      if ((v14 & 1) == 0)
        goto LABEL_25;
    }
    -[PXViewSpec borderColor](self, "borderColor");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "borderColor");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v15 == v16)
    {

    }
    else
    {
      v17 = v16;
      v18 = objc_msgSend(v15, "isEqual:", v16);

      if ((v18 & 1) == 0)
        goto LABEL_25;
    }
    -[PXViewSpec borderWidth](self, "borderWidth");
    v20 = v19;
    objc_msgSend(v5, "borderWidth");
    if (v20 != v21)
      goto LABEL_25;
    -[PXViewSpec cornerRadius](self, "cornerRadius");
    v23 = v22;
    objc_msgSend(v5, "cornerRadius");
    if (v23 != v24)
      goto LABEL_25;
    -[PXViewSpec cornerCurve](self, "cornerCurve");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cornerCurve");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (v25 == v26)
    {

    }
    else
    {
      v27 = v26;
      v28 = objc_msgSend(v25, "isEqual:", v26);

      if ((v28 & 1) == 0)
        goto LABEL_25;
    }
    v29 = -[PXViewSpec cornerMask](self, "cornerMask");
    if (v29 == objc_msgSend(v5, "cornerMask"))
    {
      -[PXViewSpec displayScale](self, "displayScale");
      v31 = v30;
      objc_msgSend(v5, "displayScale");
      if (v31 == v32)
      {
        v33 = -[PXViewSpec compositingFilterType](self, "compositingFilterType");
        if (v33 == objc_msgSend(v5, "compositingFilterType"))
        {
          v34 = -[PXViewSpec isHidden](self, "isHidden");
          if (v34 == objc_msgSend(v5, "isHidden"))
          {
            -[PXViewSpec rotationAngle](self, "rotationAngle");
            v37 = v36;
            objc_msgSend(v5, "rotationAngle");
            v10 = v37 == v38;
            goto LABEL_26;
          }
        }
      }
    }
LABEL_25:
    v10 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v10 = 0;
LABEL_27:

  return v10;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (UIColor)selectionHighlightColor
{
  return self->_selectionHighlightColor;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (unint64_t)cornerMask
{
  return self->_cornerMask;
}

- (NSString)cornerCurve
{
  return self->_cornerCurve;
}

- (int64_t)compositingFilterType
{
  return self->_compositingFilterType;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setSelectionHighlightColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setBorderColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)setCornerCurve:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setCornerMask:(unint64_t)a3
{
  self->_cornerMask = a3;
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

@end

@implementation UIPreviewParameters

- (UIPreviewParameters)init
{
  UIColor *v3;
  UIColor *backgroundColor;
  UIPreviewParameters *v5;

  if (self)
  {
    _UIPreviewParametersDefaultBackgroundColor();
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v3;

    v5 = self;
  }

  return self;
}

- (UIPreviewParameters)initWithTextLineRects:(NSArray *)textLineRects
{
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  UIPreviewParameters *v12;
  uint64_t v13;
  NSArray *v14;
  UIPreviewParameters *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = textLineRects;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPreviewParameters.m"), 268, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("textLineRects != nil"));

  }
  objc_opt_class();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v5;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPreviewParameters.m"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[supposedValue isKindOfClass:valueClass]"));

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v12 = -[UIPreviewParameters init](self, "init");
  if (v12)
  {
    v13 = -[NSArray copy](v6, "copy");
    v14 = v12->_textLineRects;
    v12->_textLineRects = (NSArray *)v13;

    *(_OWORD *)&v12->_textPathInsets.top = _UIPreviewParametersTextMargins;
    *(_OWORD *)&v12->_textPathInsets.bottom = unk_18667AF98;
    v12->_textPathCornerRadius = 13.0;
    v12->_previewMode = 1;
    v15 = v12;
  }

  return v12;
}

- (id)_initWithMode:(int64_t)a3 visiblePath:(id)a4 backgroundColor:(id)a5
{
  id v8;
  id v9;
  UIPreviewParameters *v10;
  uint64_t v11;
  UIBezierPath *visiblePath;
  uint64_t v13;
  UIColor *backgroundColor;
  UIPreviewParameters *v15;

  v8 = a4;
  v9 = a5;
  v10 = -[UIPreviewParameters init](self, "init");
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    visiblePath = v10->_visiblePath;
    v10->_visiblePath = (UIBezierPath *)v11;

    v13 = objc_msgSend(v9, "copy");
    backgroundColor = v10->_backgroundColor;
    v10->_backgroundColor = (UIColor *)v13;

    v10->_previewMode = a3;
    v10->_isUsingCustomBackgroundColor = 1;
    v15 = v10;
  }

  return v10;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  UIColor *v4;
  void *v5;
  void *v6;
  UIColor *v7;
  UIColor *v8;
  UIColor *v9;

  v4 = backgroundColor;
  self->_isUsingCustomBackgroundColor = v4 != 0;
  v9 = v4;
  v5 = (void *)-[UIColor copy](v4, "copy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    _UIPreviewParametersDefaultBackgroundColor();
    v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v8 = self->_backgroundColor;
  self->_backgroundColor = v7;

}

- (BOOL)appliesShadow
{
  return self->_appliesShadow && -[UIPreviewParameters _previewMode](self, "_previewMode") != 4;
}

- (BOOL)_isSingleLineText
{
  return -[NSArray count](self->_textLineRects, "count") == 1;
}

- (UIBezierPath)visiblePath
{
  UIBezierPath *v3;
  UIBezierPath *visiblePath;

  if (self->_previewMode == 1 && !self->_visiblePath)
  {
    _UIPreviewParametersGenerateTextPlatter(self->_textLineRects, self->_textPathInsets.top, self->_textPathInsets.left, self->_textPathInsets.bottom, self->_textPathInsets.right, self->_textPathCornerRadius);
    v3 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
    visiblePath = self->_visiblePath;
    self->_visiblePath = v3;

  }
  return self->_visiblePath;
}

- (void)_setTextPathInsets:(UIEdgeInsets)a3
{
  UIBezierPath *visiblePath;

  if (a3.left != self->_textPathInsets.left
    || a3.top != self->_textPathInsets.top
    || a3.right != self->_textPathInsets.right
    || a3.bottom != self->_textPathInsets.bottom)
  {
    self->_textPathInsets = a3;
    visiblePath = self->_visiblePath;
    self->_visiblePath = 0;

  }
}

- (void)_setTextPathCornerRadius:(double)a3
{
  UIBezierPath *visiblePath;

  if (self->_textPathCornerRadius != a3)
  {
    self->_textPathCornerRadius = a3;
    visiblePath = self->_visiblePath;
    self->_visiblePath = 0;

  }
}

- (UIBezierPath)effectiveShadowPath
{
  UIBezierPath *shadowPath;

  shadowPath = self->_shadowPath;
  if (!shadowPath)
    shadowPath = self->_visiblePath;
  return shadowPath;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  void *v13;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSArray copy](self->_textLineRects, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[UIBezierPath copy](self->_visiblePath, "copy");
  v8 = (void *)v4[4];
  v4[4] = v7;

  v9 = -[UIColor copy](self->_backgroundColor, "copy");
  v10 = (void *)v4[6];
  v4[6] = v9;

  v4[7] = self->_previewMode;
  *((_BYTE *)v4 + 16) = self->_appliesShadow;
  *((_BYTE *)v4 + 17) = self->_hidesSourceViewDuringDropAnimation;
  v11 = *(_OWORD *)&self->_textPathInsets.bottom;
  *((_OWORD *)v4 + 4) = *(_OWORD *)&self->_textPathInsets.top;
  *((_OWORD *)v4 + 5) = v11;
  v4[3] = *(_QWORD *)&self->_textPathCornerRadius;
  v12 = -[UIBezierPath copy](self->_shadowPath, "copy");
  v13 = (void *)v4[5];
  v4[5] = v12;

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  double v9;
  int64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  int64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;

  -[UIPreviewParameters visiblePath](self, "visiblePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[UIPreviewParameters backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[UIPreviewParameters _previewMode](self, "_previewMode");
  v8 = v7 ^ -[UIPreviewParameters appliesShadow](self, "appliesShadow");
  -[UIPreviewParameters _textPathCornerRadius](self, "_textPathCornerRadius");
  v10 = v8 ^ (int)v9;
  -[UIPreviewParameters _textPathInsets](self, "_textPathInsets");
  v12 = (int)v11;
  -[UIPreviewParameters _textPathInsets](self, "_textPathInsets");
  v14 = v10 ^ v12 ^ (int)v13;
  -[UIPreviewParameters _textPathInsets](self, "_textPathInsets");
  v16 = (int)v15;
  -[UIPreviewParameters _textPathInsets](self, "_textPathInsets");
  v18 = v16 ^ (int)v17;
  -[UIPreviewParameters shadowPath](self, "shadowPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v14 ^ v18 ^ objc_msgSend(v19, "hash");

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  int v17;
  _BOOL4 v18;
  int v19;
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
  _BOOL4 v31;
  double v32;
  int v33;
  double v34;
  double v35;
  double v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[UIPreviewParameters visiblePath](self, "visiblePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visiblePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[UIPreviewParameters visiblePath](self, "visiblePath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visiblePath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    -[UIPreviewParameters backgroundColor](self, "backgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 != v13)
    {
      -[UIPreviewParameters backgroundColor](self, "backgroundColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "backgroundColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 &= objc_msgSend(v14, "isEqual:", v15);

    }
    v16 = -[UIPreviewParameters _previewMode](self, "_previewMode");
    if (v16 == objc_msgSend(v5, "_previewMode"))
      v17 = v10;
    else
      v17 = 0;
    v18 = -[UIPreviewParameters appliesShadow](self, "appliesShadow");
    v19 = v17 & ~(v18 ^ objc_msgSend(v5, "appliesShadow"));
    -[UIPreviewParameters _textPathInsets](self, "_textPathInsets");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    objc_msgSend(v5, "_textPathInsets");
    v31 = v23 == v30;
    if (v21 != v32)
      v31 = 0;
    if (v27 != v29)
      v31 = 0;
    if (v25 != v28)
      v31 = 0;
    v33 = v19 & v31;
    -[UIPreviewParameters _textPathCornerRadius](self, "_textPathCornerRadius");
    v35 = v34;
    objc_msgSend(v5, "_textPathCornerRadius");
    if (v35 == v36)
      v37 = v33;
    else
      v37 = 0;
    -[UIPreviewParameters shadowPath](self, "shadowPath");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shadowPath");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38 != v39)
    {
      -[UIPreviewParameters shadowPath](self, "shadowPath");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shadowPath");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v37 &= objc_msgSend(v40, "isEqual:", v41);

    }
    v42 = -[UIPreviewParameters hidesSourceViewDuringDropAnimation](self, "hidesSourceViewDuringDropAnimation");
    v11 = v37 & (v42 ^ objc_msgSend(v5, "hidesSourceViewDuringDropAnimation") ^ 1);

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  -[UIPreviewParameters backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; backgroundColor = %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPreviewParameters visiblePath](self, "visiblePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIPreviewParameters visiblePath](self, "visiblePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; visiblePath = %@"), v8);

  }
  -[UIPreviewParameters shadowPath](self, "shadowPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UIPreviewParameters shadowPath](self, "shadowPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; shadowPath = %@"), v10);

  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (NSArray)_textLineRects
{
  return self->_textLineRects;
}

- (void)_setTextLineRects:(id)a3
{
  objc_storeStrong((id *)&self->_textLineRects, a3);
}

- (UIEdgeInsets)_textPathInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textPathInsets.top;
  left = self->_textPathInsets.left;
  bottom = self->_textPathInsets.bottom;
  right = self->_textPathInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)_textPathCornerRadius
{
  return self->_textPathCornerRadius;
}

- (void)setVisiblePath:(UIBezierPath *)visiblePath
{
  objc_setProperty_nonatomic_copy(self, a2, visiblePath, 32);
}

- (UIBezierPath)shadowPath
{
  return self->_shadowPath;
}

- (void)setShadowPath:(UIBezierPath *)shadowPath
{
  objc_setProperty_nonatomic_copy(self, a2, shadowPath, 40);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int64_t)_previewMode
{
  return self->_previewMode;
}

- (void)_setPreviewMode:(int64_t)a3
{
  self->_previewMode = a3;
}

- (void)setAppliesShadow:(BOOL)a3
{
  self->_appliesShadow = a3;
}

- (BOOL)hidesSourceViewDuringDropAnimation
{
  return self->_hidesSourceViewDuringDropAnimation;
}

- (void)setHidesSourceViewDuringDropAnimation:(BOOL)a3
{
  self->_hidesSourceViewDuringDropAnimation = a3;
}

- (BOOL)isUsingCustomBackgroundColor
{
  return self->_isUsingCustomBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_shadowPath, 0);
  objc_storeStrong((id *)&self->_visiblePath, 0);
  objc_storeStrong((id *)&self->_textLineRects, 0);
}

@end

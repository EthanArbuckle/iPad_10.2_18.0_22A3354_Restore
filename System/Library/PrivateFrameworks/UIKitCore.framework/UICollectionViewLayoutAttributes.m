@implementation UICollectionViewLayoutAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listAttributes, 0);
  objc_storeStrong(&self->_preferredSizingData, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_elementKind, 0);
}

- (_QWORD)_listAttributesCreatingIfNecessary
{
  _QWORD *v1;
  void *v2;
  _UICollectionLayoutListAttributes *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[35];
    if (!v2)
    {
      v3 = objc_alloc_init(_UICollectionLayoutListAttributes);
      v4 = (void *)v1[35];
      v1[35] = v3;

      v2 = (void *)v1[35];
    }
    a1 = v2;
  }
  return a1;
}

- (id)_preferredSizingData
{
  if (a1)
    a1 = (id *)a1[34];
  return a1;
}

- (void)setZIndex:(NSInteger)zIndex
{
  self->_zIndex = zIndex;
}

- (NSInteger)zIndex
{
  return self->_zIndex;
}

- (void)setFrame:(CGRect)frame
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGSize v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CATransform3D v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = frame.size.height;
  width = frame.size.width;
  y = frame.origin.y;
  x = frame.origin.x;
  if (dyld_program_sdk_at_least())
  {
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    if (CGRectIsInfinite(v25))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      NSStringFromCGRect(v29);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 451, CFSTR("UICollectionViewLayoutAttributes: -setFrame: with CGRectInfinite is undefined. Attributes: %@; new frame: %@"),
        self,
        v21);

    }
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    if (CGRectIsNull(v26))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30.origin.x = x;
      v30.origin.y = y;
      v30.size.width = width;
      v30.size.height = height;
      NSStringFromCGRect(v30);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 452, CFSTR("UICollectionViewLayoutAttributes: -setFrame: with CGRectNull is undefined. Attributes: %@; new frame: %@"),
        self,
        v23);

    }
  }
  if (dyld_program_sdk_at_least())
  {
    if (fabs(x) == INFINITY || (v9 = fabs(y), v9 >= INFINITY) && v9 <= INFINITY)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      NSStringFromCGRect(v27);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 455, CFSTR("UICollectionViewLayoutAttributes: -setFrame: requires finite coordinates. Attributes: %@; new frame: %@"),
        self,
        v11);

    }
    if (fabs(width) == INFINITY || (v12 = fabs(height), v12 >= INFINITY) && v12 <= INFINITY)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28.origin.x = x;
      v28.origin.y = y;
      v28.size.width = width;
      v28.size.height = height;
      NSStringFromCGRect(v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 456, CFSTR("UICollectionViewLayoutAttributes: -setFrame: requires finite dimensions. Attributes: %@; new frame: %@"),
        self,
        v14);

    }
  }
  -[UICollectionViewLayoutAttributes setSize:](self, "setSize:", width, height);
  -[UICollectionViewLayoutAttributes setCenter:](self, "setCenter:", x + width * 0.5, y + height * 0.5);
  v15 = *(_OWORD *)&self->_transform.m33;
  *(_OWORD *)&v24.m31 = *(_OWORD *)&self->_transform.m31;
  *(_OWORD *)&v24.m33 = v15;
  v16 = *(_OWORD *)&self->_transform.m43;
  *(_OWORD *)&v24.m41 = *(_OWORD *)&self->_transform.m41;
  *(_OWORD *)&v24.m43 = v16;
  v17 = *(_OWORD *)&self->_transform.m13;
  *(_OWORD *)&v24.m11 = *(_OWORD *)&self->_transform.m11;
  *(_OWORD *)&v24.m13 = v17;
  v18 = *(_OWORD *)&self->_transform.m23;
  *(_OWORD *)&v24.m21 = *(_OWORD *)&self->_transform.m21;
  *(_OWORD *)&v24.m23 = v18;
  if (CATransform3DIsIdentity(&v24))
  {
    self->_frame.origin.x = x;
    self->_frame.origin.y = y;
    self->_frame.size.width = width;
    self->_frame.size.height = height;
  }
  else
  {
    v19 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_frame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_frame.size = v19;
  }
}

- (void)setSize:(CGSize)size
{
  double height;
  double width;
  double v7;
  void *v8;
  void *v9;
  CGSize v11;
  CGSize v12;

  height = size.height;
  width = size.width;
  if (dyld_program_sdk_at_least())
  {
    if (fabs(width) == INFINITY || (v7 = fabs(height), v7 >= INFINITY) && v7 <= INFINITY)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12.width = width;
      v12.height = height;
      NSStringFromCGSize(v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 466, CFSTR("UICollectionViewLayoutAttributes: -setSize: requires finite dimensions. Attributes: %@; new size: %@"),
        self,
        v9);

    }
  }
  if (width != self->_size.width || height != self->_size.height)
  {
    self->_size.width = width;
    self->_size.height = height;
    v11 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_frame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_frame.size = v11;
  }
}

- (void)setCenter:(CGPoint)center
{
  int v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  float64x2_t v12;
  double x;
  double y;
  CGPoint v15;

  x = center.x;
  y = center.y;
  v5 = dyld_program_sdk_at_least();
  v7 = x;
  v6 = y;
  if (v5)
  {
    if (fabs(x) == INFINITY || (v8 = fabs(y), v8 >= INFINITY) && v8 <= INFINITY)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15.x = x;
      v15.y = y;
      NSStringFromCGPoint(v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 477, CFSTR("UICollectionViewLayoutAttributes: -setCenter: requires finite coordinates. Attributes: %@; new center: %@"),
        self,
        v10);

      v7 = x;
      v6 = y;
    }
  }
  if (v7 != self->_center.x || v6 != self->_center.y)
  {
    if (!CGRectIsNull(self->_frame))
    {
      v12.f64[0] = x;
      v12.f64[1] = y;
      self->_frame.origin = (CGPoint)vaddq_f64((float64x2_t)self->_frame.origin, vsubq_f64(v12, (float64x2_t)self->_center));
    }
    self->_center.x = x;
    self->_center.y = y;
  }
}

+ (UICollectionViewLayoutAttributes)layoutAttributesForCellWithIndexPath:(NSIndexPath *)indexPath
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  *((_WORD *)v4 + 144) |= 1u;
  objc_storeStrong((id *)v4 + 1, CFSTR("UICollectionElementKindCell"));
  objc_storeStrong((id *)v4 + 2, indexPath);
  return (UICollectionViewLayoutAttributes *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  CGSize size;
  unsigned int v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int16 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CGSize v28;

  v4 = objc_alloc_init((Class)objc_opt_class());
  *((_QWORD *)v4 + 12) = *(_QWORD *)&self->_alpha;
  *((_WORD *)v4 + 144) = *((_WORD *)v4 + 144) & 0xFFFB | *(_WORD *)&self->_layoutFlags & 4;
  objc_storeStrong((id *)v4 + 2, self->_indexPath);
  v5 = -[NSString copy](self->_reuseIdentifier, "copy");
  v6 = (void *)*((_QWORD *)v4 + 3);
  *((_QWORD *)v4 + 3) = v5;

  v7 = -[NSString copy](self->_elementKind, "copy");
  v8 = (void *)*((_QWORD *)v4 + 1);
  *((_QWORD *)v4 + 1) = v7;

  *((_QWORD *)v4 + 37) = self->_zIndex;
  v9 = *((_WORD *)v4 + 144) & 0xFFFE | *(_WORD *)&self->_layoutFlags & 1;
  *((_WORD *)v4 + 144) = *((_WORD *)v4 + 144) & 0xFFFE | *(_WORD *)&self->_layoutFlags & 1;
  v10 = v9 & 0xFFFFFFFD | (2 * ((*(_WORD *)&self->_layoutFlags >> 1) & 1));
  *((_WORD *)v4 + 144) = v10;
  *((_WORD *)v4 + 144) = v10 & 0xFFF7 | *(_WORD *)&self->_layoutFlags & 8;
  *((_QWORD *)v4 + 13) = -[UICollectionViewLayoutAttributes _zPosition](self, "_zPosition");
  v11 = *((_WORD *)v4 + 144) & 0xFFEF | (16 * ((*(_WORD *)&self->_layoutFlags >> 4) & 1));
  *((_WORD *)v4 + 144) = v11;
  v12 = v11 & 0xFFFFFE1F | (32 * ((*(_WORD *)&self->_layoutFlags >> 5) & 0xF));
  *((_WORD *)v4 + 144) = v12;
  *((_QWORD *)v4 + 39) = *(_QWORD *)&self->_cornerRadius;
  size = self->_maskViewFrame.size;
  *((_OWORD *)v4 + 15) = self->_maskViewFrame.origin;
  *((CGSize *)v4 + 16) = size;
  v14 = v12 & 0xFFFFFBFF | (((*(_WORD *)&self->_layoutFlags >> 10) & 1) << 10);
  *((_WORD *)v4 + 144) = v14;
  *((_WORD *)v4 + 144) = v14 & 0xFDFF | *(_WORD *)&self->_layoutFlags & 0x200;
  v15 = *(_OWORD *)&self->_defaultLayoutMargins.bottom;
  *((_OWORD *)v4 + 20) = *(_OWORD *)&self->_defaultLayoutMargins.top;
  *((_OWORD *)v4 + 21) = v15;
  objc_storeStrong((id *)v4 + 34, self->_preferredSizingData);
  v16 = -[_UICollectionLayoutListAttributes copy](self->_listAttributes, "copy");
  v17 = (void *)*((_QWORD *)v4 + 35);
  *((_QWORD *)v4 + 35) = v16;

  _getCustomAttributes(self);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = (void *)objc_msgSend(v18, "mutableCopy");
    objc_setAssociatedObject(v4, &_UICollectionViewLayoutCustomAttributesKey, v20, (void *)1);

    v21 = *((_WORD *)v4 + 144) | 0x1000;
    *((_WORD *)v4 + 144) = v21;
  }
  else
  {
    v21 = *((_WORD *)v4 + 144);
  }
  *((_QWORD *)v4 + 38) = self->_selectionGrouping;
  *((_WORD *)v4 + 144) = *(_WORD *)&self->_layoutFlags & 0x800 | v21 & 0xF7FF;
  v22 = *(_OWORD *)&self->_transform.m11;
  v23 = *(_OWORD *)&self->_transform.m13;
  v24 = *(_OWORD *)&self->_transform.m23;
  *((_OWORD *)v4 + 9) = *(_OWORD *)&self->_transform.m21;
  *((_OWORD *)v4 + 10) = v24;
  *((_OWORD *)v4 + 7) = v22;
  *((_OWORD *)v4 + 8) = v23;
  v25 = *(_OWORD *)&self->_transform.m31;
  v26 = *(_OWORD *)&self->_transform.m33;
  v27 = *(_OWORD *)&self->_transform.m43;
  *((_OWORD *)v4 + 13) = *(_OWORD *)&self->_transform.m41;
  *((_OWORD *)v4 + 14) = v27;
  *((_OWORD *)v4 + 11) = v25;
  *((_OWORD *)v4 + 12) = v26;
  *((_OWORD *)v4 + 2) = self->_center;
  *((_OWORD *)v4 + 3) = self->_size;
  v28 = self->_frame.size;
  *((_OWORD *)v4 + 4) = self->_frame.origin;
  *((CGSize *)v4 + 5) = v28;

  return v4;
}

- (UICollectionViewLayoutAttributes)init
{
  UICollectionViewLayoutAttributes *result;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGPoint v8;
  CGSize v9;
  __int16 layoutFlags;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UICollectionViewLayoutAttributes;
  result = -[UICollectionViewLayoutAttributes init](&v11, sel_init);
  if (result)
  {
    v3 = (_OWORD *)MEMORY[0x1E0CD2610];
    v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&result->_transform.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&result->_transform.m33 = v4;
    v5 = v3[7];
    *(_OWORD *)&result->_transform.m41 = v3[6];
    *(_OWORD *)&result->_transform.m43 = v5;
    v6 = v3[1];
    *(_OWORD *)&result->_transform.m11 = *v3;
    *(_OWORD *)&result->_transform.m13 = v6;
    v7 = v3[3];
    *(_OWORD *)&result->_transform.m21 = v3[2];
    *(_OWORD *)&result->_transform.m23 = v7;
    v8 = (CGPoint)*MEMORY[0x1E0C9D628];
    v9 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    result->_frame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    result->_frame.size = v9;
    layoutFlags = (__int16)result->_layoutFlags;
    result->_alpha = 1.0;
    result->_zPosition = 0;
    result->_maskViewFrame.origin = v8;
    result->_maskViewFrame.size = v9;
    *(_WORD *)&result->_layoutFlags = layoutFlags & 0xFE17 | 0x1E0;
  }
  return result;
}

- (int64_t)_zPosition
{
  return self->_zPosition;
}

- (void)_setMaskedCorners:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    if (a2 >= 0x10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setMaskedCorners_, a1, CFSTR("UICollectionViewLayout.m"), 261, CFSTR("CACornerMask value (%ld) does not fit in bitfield reserved space"), a2);

    }
    *(_WORD *)(a1 + 288) = *(_WORD *)(a1 + 288) & 0xFE1F | (32 * (a2 & 0xF));
  }
}

+ (UICollectionViewLayoutAttributes)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind withIndexPath:(NSIndexPath *)indexPath
{
  id *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;

  v6 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v6 + 2, indexPath);
  v7 = -[NSString copy](decorationViewKind, "copy");
  v8 = v6[1];
  v6[1] = (id)v7;

  v9 = -[NSString copy](decorationViewKind, "copy");
  v10 = v6[3];
  v6[3] = (id)v9;

  *((_WORD *)v6 + 144) |= 2u;
  return (UICollectionViewLayoutAttributes *)v6;
}

- (NSIndexPath)indexPath
{
  char v3;
  NSIndexPath *indexPath;
  uint64_t v5;
  void *v6;

  if (self->_indexPath)
  {
    v3 = dyld_program_sdk_at_least();
    indexPath = self->_indexPath;
    if ((v3 & 1) == 0)
      indexPath = objc_retainAutorelease(indexPath);
  }
  else
  {
    indexPath = (NSIndexPath *)indexPath_sharedNotFoundPath;
    if (!indexPath_sharedNotFoundPath)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)indexPath_sharedNotFoundPath;
      indexPath_sharedNotFoundPath = v5;

      indexPath = (NSIndexPath *)indexPath_sharedNotFoundPath;
    }
  }
  return indexPath;
}

- (void)_setPreferredSizingData:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 272), a2);
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSIndexPath hash](self->_indexPath, "hash");
  v4 = -[NSString hash](self->_elementKind, "hash");
  v5 = 1231;
  if ((*(_WORD *)&self->_layoutFlags & 8) == 0)
    v5 = 1237;
  return v4 ^ v3 ^ v5;
}

- (CGRect)frame
{
  void *v3;
  id v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double x;
  double y;
  double width;
  double height;
  _OWORD v14[8];
  CGRect result;

  if (CGRectIsNull(self->_frame))
  {
    v3 = (void *)__geometryCalculationLayer;
    if (!__geometryCalculationLayer)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
      v5 = (void *)__geometryCalculationLayer;
      __geometryCalculationLayer = (uint64_t)v4;

      v3 = (void *)__geometryCalculationLayer;
    }
    objc_msgSend(v3, "setPosition:", self->_center.x, self->_center.y);
    objc_msgSend((id)__geometryCalculationLayer, "setBounds:", 0.0, 0.0, self->_size.width, self->_size.height);
    v6 = *(_OWORD *)&self->_transform.m33;
    v14[4] = *(_OWORD *)&self->_transform.m31;
    v14[5] = v6;
    v7 = *(_OWORD *)&self->_transform.m43;
    v14[6] = *(_OWORD *)&self->_transform.m41;
    v14[7] = v7;
    v8 = *(_OWORD *)&self->_transform.m13;
    v14[0] = *(_OWORD *)&self->_transform.m11;
    v14[1] = v8;
    v9 = *(_OWORD *)&self->_transform.m23;
    v14[2] = *(_OWORD *)&self->_transform.m21;
    v14[3] = v9;
    objc_msgSend((id)__geometryCalculationLayer, "setTransform:", v14);
    objc_msgSend((id)__geometryCalculationLayer, "frame");
    self->_frame.origin.x = x;
    self->_frame.origin.y = y;
    self->_frame.size.width = width;
    self->_frame.size.height = height;
  }
  else
  {
    x = self->_frame.origin.x;
    y = self->_frame.origin.y;
    width = self->_frame.size.width;
    height = self->_frame.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)_existingListAttributes
{
  if (a1)
    a1 = (id *)a1[35];
  return a1;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[NSIndexPath isEqual:](self->_indexPath, "isEqual:", *((_QWORD *)a3 + 2));
      if (v5)
        LOBYTE(v5) = -[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)self, (uint64_t)a3);
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (CGFloat)alpha
{
  return self->_alpha;
}

- (uint64_t)_isEquivalentTo:(uint64_t)a1
{
  uint64_t result;
  int v5;
  float64x2_t v6;
  int32x2_t v7;
  int32x2_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double v17;
  double v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  CATransform3D v26;
  CATransform3D a;

  result = 0;
  if (!a1 || !a2)
    return result;
  if (*(double *)(a1 + 96) != 0.0)
  {
    v5 = *(unsigned __int16 *)(a1 + 288);
    if (*(double *)(a2 + 96) != 0.0)
    {
      if (((v5 ^ *(unsigned __int16 *)(a2 + 288)) & 4) != 0)
        return 0;
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  if (*(double *)(a2 + 96) != 0.0)
  {
    LOWORD(v5) = *(_WORD *)(a2 + 288);
LABEL_7:
    if ((v5 & 4) == 0)
      return 0;
  }
LABEL_10:
  v6 = (float64x2_t)vdupq_n_s64(0x3E80000000000000uLL);
  v7 = vmovn_s64(vcgtq_f64(v6, vabdq_f64(*(float64x2_t *)(a1 + 32), *(float64x2_t *)(a2 + 32))));
  if ((v7.i32[0] & v7.i32[1] & 1) == 0)
    return 0;
  v8 = vmovn_s64(vcgtq_f64(v6, vabdq_f64(*(float64x2_t *)(a1 + 48), *(float64x2_t *)(a2 + 48))));
  if ((v8.i32[1] & v8.i32[0] & 1) == 0)
    return 0;
  v9 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)&a.m31 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)&a.m33 = v9;
  v10 = *(_OWORD *)(a1 + 224);
  *(_OWORD *)&a.m41 = *(_OWORD *)(a1 + 208);
  *(_OWORD *)&a.m43 = v10;
  v11 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)&a.m11 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)&a.m13 = v11;
  v12 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)&a.m21 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)&a.m23 = v12;
  v13 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)&v26.m31 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)&v26.m33 = v13;
  v14 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)&v26.m41 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)&v26.m43 = v14;
  v15 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)&v26.m11 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)&v26.m13 = v15;
  v16 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)&v26.m21 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)&v26.m23 = v16;
  result = CATransform3DEqualToTransform(&a, &v26);
  if (!(_DWORD)result)
    return result;
  if (*(_QWORD *)(a1 + 296) != *(_QWORD *)(a2 + 296))
    return 0;
  if (((*(unsigned __int16 *)(a2 + 288) ^ *(unsigned __int16 *)(a1 + 288)) & 8) != 0)
    return 0;
  v17 = *(double *)(a1 + 96);
  objc_msgSend((id)a2, "alpha");
  if (v17 != v18
    || ((*(_WORD *)(a2 + 288) ^ *(_WORD *)(a1 + 288)) & 0x1F0) != 0
    || *(double *)(a1 + 312) != *(double *)(a2 + 312)
    || *(_QWORD *)(a1 + 304) != *(_QWORD *)(a2 + 304))
  {
    return 0;
  }
  result = CGRectEqualToRect(*(CGRect *)(a1 + 240), *(CGRect *)(a2 + 240));
  if (!(_DWORD)result)
    return result;
  v19 = *(unsigned __int16 *)(a1 + 288);
  v20 = *(unsigned __int16 *)(a2 + 288);
  if ((((unsigned __int16)v20 ^ (unsigned __int16)v19) & 0xC00) != 0)
    return 0;
  v21 = (v19 >> 9) & 1;
  if (v21 != ((v20 >> 9) & 1)
    || v21
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 320), *(float64x2_t *)(a2 + 320)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 336), *(float64x2_t *)(a2 + 336)))), 0xFuLL))) & 1) == 0)
  {
    return 0;
  }
  v22 = *(void **)(a1 + 8);
  if (v22 == *(void **)(a2 + 8) || (result = objc_msgSend(v22, "isEqualToString:"), (_DWORD)result))
  {
    result = UIEqual(*(void **)(a1 + 272), *(void **)(a2 + 272));
    if ((_DWORD)result)
    {
      result = UIEqual(*(void **)(a1 + 280), *(void **)(a2 + 280));
      if ((_DWORD)result)
      {
        _getCustomAttributes((_WORD *)a1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        _getCustomAttributes((_WORD *)a2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = UIEqual(v23, v24);

        return v25;
      }
    }
  }
  return result;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UICollectionViewLayoutAttributes size](self, "size");
  v3 = v2;
  v5 = v4;
  v6 = 0.0;
  v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
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

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CATransform3D)transform3D
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[1].m31;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[1].m23;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[1].m41;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m33;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m43;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self[1].m21;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[1].m13;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (BOOL)_hasMaskViewFrame
{
  if (result)
    return !CGRectIsNull(*(CGRect *)(result + 240));
  return result;
}

- (void)setAlpha:(CGFloat)alpha
{
  self->_alpha = alpha;
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
  objc_storeStrong((id *)&self->_indexPath, indexPath);
}

- (double)_listLayoutItemMaxWidth
{
  void *v3;
  double *v4;
  double v5;

  -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)&self->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)&self->super.isa);
  v4 = (double *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4[8];
  else
    v5 = 0.0;

  return v5;
}

- (BOOL)isHidden
{
  return (*(_WORD *)&self->_layoutFlags >> 2) & 1;
}

- (void)setHidden:(BOOL)hidden
{
  __int16 v3;

  if (hidden)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_layoutFlags = *(_WORD *)&self->_layoutFlags & 0xFFFB | v3;
}

- (UICollectionElementCategory)representedElementCategory
{
  __int16 v2;
  UICollectionElementCategory v3;

  if (self)
  {
    v2 = *(_WORD *)(self + 288);
    v3 = UICollectionElementCategorySupplementaryView;
    if ((v2 & 2) != 0)
      v3 = UICollectionElementCategoryDecorationView;
    if ((v2 & 1) != 0)
      return 0;
    else
      return v3;
  }
  return self;
}

- (NSString)representedElementKind
{
  NSString *elementKind;

  if ((*(_WORD *)&self->_layoutFlags & 1) != 0)
    elementKind = 0;
  else
    elementKind = self->_elementKind;
  return objc_retainAutorelease(elementKind);
}

- (_QWORD)__indexPath
{
  if (result)
  {
    result = (_QWORD *)result[2];
    if (!result)
    {
      result = (_QWORD *)__indexPath_sharedNotFoundPath;
      if (!__indexPath_sharedNotFoundPath)
      {
        result = (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
        __indexPath_sharedNotFoundPath = (uint64_t)result;
      }
    }
  }
  return result;
}

- (void)setBounds:(CGRect)bounds
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v9;
  void *v10;
  CGRect v11;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  if (bounds.origin.x != 0.0 || bounds.origin.y != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    NSStringFromCGRect(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 444, CFSTR("UICollectionViewLayoutAttributes bounds must be set with a (0,0) origin %@ - %@"), self, v10);

  }
  -[UICollectionViewLayoutAttributes setSize:](self, "setSize:", width, height);
}

+ (UICollectionViewLayoutAttributes)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind withIndexPath:(NSIndexPath *)indexPath
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = objc_alloc_init((Class)a1);
  v7 = -[NSString copy](elementKind, "copy");
  v8 = (void *)*((_QWORD *)v6 + 1);
  *((_QWORD *)v6 + 1) = v7;

  objc_storeStrong((id *)v6 + 2, indexPath);
  return (UICollectionViewLayoutAttributes *)v6;
}

- (void)_setZPosition:(int64_t)a3
{
  self->_zPosition = a3;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  CGAffineTransform transform;
  CATransform3D v18;
  CATransform3D v19;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSIndexPath _ui_shortDescription](self->_indexPath, "_ui_shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("index path: %@; "), v7);

  if ((*(_WORD *)&self->_layoutFlags & 1) == 0)
    objc_msgSend(v6, "appendFormat:", CFSTR("element kind: (%@); "), self->_elementKind);
  -[UICollectionViewLayoutAttributes frame](self, "frame");
  objc_msgSend(v6, "appendFormat:", CFSTR("frame = (%g %g; %g %g); "), v8, v9, v10, v11);
  memset(&v19, 0, sizeof(v19));
  -[UICollectionViewLayoutAttributes transform3D](self, "transform3D");
  v18 = v19;
  if (!CATransform3DIsIdentity(&v18))
  {
    v18 = v19;
    if (MEMORY[0x186DC5824](&v18))
    {
      v18 = v19;
      CATransform3DGetAffineTransform(&transform, &v18);
      NSStringFromCGAffineTransform(&transform);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("transform = %@; "), v12);

    }
    else
    {
      objc_msgSend(v6, "appendString:", CFSTR("non-affine transform; "));
    }
  }
  if (-[UICollectionViewLayoutAttributes isHidden](self, "isHidden"))
    objc_msgSend(v6, "appendFormat:", CFSTR("hidden = YES; "));
  -[UICollectionViewLayoutAttributes alpha](self, "alpha");
  if (v13 != 1.0)
    objc_msgSend(v6, "appendFormat:", CFSTR("alpha = %g; "), *(_QWORD *)&v13);
  if (self->_zIndex)
    objc_msgSend(v6, "appendFormat:", CFSTR("zIndex = %ld; "), self->_zIndex);
  if ((*(_WORD *)&self->_layoutFlags & 8) != 0)
    objc_msgSend(v6, "appendFormat:", CFSTR("IS CLONE; "));
  v14 = objc_msgSend(v6, "rangeOfString:options:", CFSTR("; "), 4);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "appendString:", CFSTR(">"));
  else
    objc_msgSend(v6, "replaceCharactersInRange:withString:", v14, v15, CFSTR(">"));
  return (NSString *)v6;
}

- (void)setTransform3D:(CATransform3D *)transform3D
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGSize v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  CATransform3D b;
  CATransform3D a;

  if (dyld_program_sdk_at_least())
  {
    v6 = *(_OWORD *)&transform3D->m33;
    *(_OWORD *)&a.m31 = *(_OWORD *)&transform3D->m31;
    *(_OWORD *)&a.m33 = v6;
    v7 = *(_OWORD *)&transform3D->m43;
    *(_OWORD *)&a.m41 = *(_OWORD *)&transform3D->m41;
    *(_OWORD *)&a.m43 = v7;
    v8 = *(_OWORD *)&transform3D->m13;
    *(_OWORD *)&a.m11 = *(_OWORD *)&transform3D->m11;
    *(_OWORD *)&a.m13 = v8;
    v9 = *(_OWORD *)&transform3D->m23;
    *(_OWORD *)&a.m21 = *(_OWORD *)&transform3D->m21;
    *(_OWORD *)&a.m23 = v9;
    if ((_UICATransform3DHasFiniteMembers((float64x2_t *)&a) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_OWORD *)&transform3D->m33;
      *(_OWORD *)&a.m31 = *(_OWORD *)&transform3D->m31;
      *(_OWORD *)&a.m33 = v26;
      v27 = *(_OWORD *)&transform3D->m43;
      *(_OWORD *)&a.m41 = *(_OWORD *)&transform3D->m41;
      *(_OWORD *)&a.m43 = v27;
      v28 = *(_OWORD *)&transform3D->m13;
      *(_OWORD *)&a.m11 = *(_OWORD *)&transform3D->m11;
      *(_OWORD *)&a.m13 = v28;
      v29 = *(_OWORD *)&transform3D->m23;
      *(_OWORD *)&a.m21 = *(_OWORD *)&transform3D->m21;
      *(_OWORD *)&a.m23 = v29;
      _NSStringFromCATransform3D(&a);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 493, CFSTR("UICollectionViewLayoutAttributes: -setTransform3D: requires that all members in the transform matrix are finite numbers. Attributes: %@; new transform: %@"),
        self,
        v30);

    }
  }
  v10 = *(_OWORD *)&transform3D->m33;
  *(_OWORD *)&a.m31 = *(_OWORD *)&transform3D->m31;
  *(_OWORD *)&a.m33 = v10;
  v11 = *(_OWORD *)&transform3D->m43;
  *(_OWORD *)&a.m41 = *(_OWORD *)&transform3D->m41;
  *(_OWORD *)&a.m43 = v11;
  v12 = *(_OWORD *)&transform3D->m13;
  *(_OWORD *)&a.m11 = *(_OWORD *)&transform3D->m11;
  *(_OWORD *)&a.m13 = v12;
  v13 = *(_OWORD *)&transform3D->m23;
  *(_OWORD *)&a.m21 = *(_OWORD *)&transform3D->m21;
  *(_OWORD *)&a.m23 = v13;
  v14 = *(_OWORD *)&self->_transform.m33;
  *(_OWORD *)&b.m31 = *(_OWORD *)&self->_transform.m31;
  *(_OWORD *)&b.m33 = v14;
  v15 = *(_OWORD *)&self->_transform.m43;
  *(_OWORD *)&b.m41 = *(_OWORD *)&self->_transform.m41;
  *(_OWORD *)&b.m43 = v15;
  v16 = *(_OWORD *)&self->_transform.m13;
  *(_OWORD *)&b.m11 = *(_OWORD *)&self->_transform.m11;
  *(_OWORD *)&b.m13 = v16;
  v17 = *(_OWORD *)&self->_transform.m23;
  *(_OWORD *)&b.m21 = *(_OWORD *)&self->_transform.m21;
  *(_OWORD *)&b.m23 = v17;
  if (!CATransform3DEqualToTransform(&a, &b))
  {
    v18 = *(_OWORD *)&transform3D->m11;
    v19 = *(_OWORD *)&transform3D->m13;
    v20 = *(_OWORD *)&transform3D->m23;
    *(_OWORD *)&self->_transform.m21 = *(_OWORD *)&transform3D->m21;
    *(_OWORD *)&self->_transform.m23 = v20;
    *(_OWORD *)&self->_transform.m11 = v18;
    *(_OWORD *)&self->_transform.m13 = v19;
    v21 = *(_OWORD *)&transform3D->m31;
    v22 = *(_OWORD *)&transform3D->m33;
    v23 = *(_OWORD *)&transform3D->m43;
    *(_OWORD *)&self->_transform.m41 = *(_OWORD *)&transform3D->m41;
    *(_OWORD *)&self->_transform.m43 = v23;
    *(_OWORD *)&self->_transform.m31 = v21;
    *(_OWORD *)&self->_transform.m33 = v22;
    v24 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_frame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_frame.size = v24;
  }
}

- (id)initialLayoutAttributesForInsertedDecorationElementOfKind:(id)a3 atIndexPath:(id)a4
{
  return 0;
}

- (void)setTransform:(CGAffineTransform *)transform
{
  float64x2_t v6;
  int16x8_t v7;
  float64x2_t v8;
  int8x8_t v9;
  int8x8_t v10;
  int8x8_t v11;
  int8x8_t v12;
  int64x2_t v13;
  int64x2_t v14;
  __int128 v15;
  void *v16;
  __int128 v17;
  void *v18;
  CATransform3D v19;
  CGAffineTransform m;

  if (dyld_program_sdk_at_least())
  {
    v6 = *(float64x2_t *)&transform->tx;
    *(int32x2_t *)v7.i8 = vmovn_s64((int64x2_t)vorrq_s8((int8x16_t)vcltzq_f64(v6), (int8x16_t)vcgezq_f64(v6)));
    v7.i64[1] = -1;
    v8 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
    *(int32x2_t *)&v6.f64[0] = vmovn_s64((int64x2_t)vmvnq_s8((int8x16_t)vceqq_f64(vabsq_f64(v6), v8)));
    v6.f64[1] = NAN;
    v9 = vmovn_s16((int16x8_t)vandq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(vabsq_f64(*(float64x2_t *)&transform->a), v8), (int32x4_t)vceqq_f64(vabsq_f64(*(float64x2_t *)&transform->c), v8))), (int16x8_t)v6), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(*(float64x2_t *)&transform->a), (int8x16_t)vcgezq_f64(*(float64x2_t *)&transform->a)), (int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(*(float64x2_t *)&transform->c), (int8x16_t)vcgezq_f64(*(float64x2_t *)&transform->c))), v7)));
    v10.i32[0] = v9.u8[4];
    v10.i32[1] = v9.u8[5];
    LODWORD(v6.f64[0]) = v9.u8[0];
    HIDWORD(v6.f64[0]) = v9.u8[1];
    v11.i32[0] = v9.u8[6];
    v11.i32[1] = v9.u8[7];
    LODWORD(v8.f64[0]) = v9.u8[2];
    HIDWORD(v8.f64[0]) = v9.u8[3];
    v12 = vand_s8(vand_s8(*(int8x8_t *)&v6.f64[0], v10), vand_s8(*(int8x8_t *)&v8.f64[0], v11));
    v13.i64[0] = v12.u32[0];
    v13.i64[1] = v12.u32[1];
    v14 = vcltzq_s64(vshlq_n_s64(v13, 0x3FuLL));
    if ((vandq_s8((int8x16_t)v14, (int8x16_t)vdupq_laneq_s64(v14, 1)).u64[0] & 0x8000000000000000) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_OWORD *)&transform->c;
      *(_OWORD *)&m.a = *(_OWORD *)&transform->a;
      *(_OWORD *)&m.c = v17;
      *(_OWORD *)&m.tx = *(_OWORD *)&transform->tx;
      NSStringFromCGAffineTransform(&m);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewLayout.m"), 507, CFSTR("UICollectionViewLayoutAttributes: -setTransform: requires that all members in the transform matrix be finite numbers. Attributes: %@; new transform: %@"),
        self,
        v18);

    }
  }
  v15 = *(_OWORD *)&transform->c;
  *(_OWORD *)&m.a = *(_OWORD *)&transform->a;
  *(_OWORD *)&m.c = v15;
  *(_OWORD *)&m.tx = *(_OWORD *)&transform->tx;
  CATransform3DMakeAffineTransform(&v19, &m);
  -[UICollectionViewLayoutAttributes setTransform3D:](self, "setTransform3D:", &v19);
}

- (CGAffineTransform)transform
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGAffineTransform *result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  CATransform3D v16;

  v5 = *(_OWORD *)&self->_transform.m33;
  *(_OWORD *)&v16.m31 = *(_OWORD *)&self->_transform.m31;
  *(_OWORD *)&v16.m33 = v5;
  v6 = *(_OWORD *)&self->_transform.m43;
  *(_OWORD *)&v16.m41 = *(_OWORD *)&self->_transform.m41;
  *(_OWORD *)&v16.m43 = v6;
  v7 = *(_OWORD *)&self->_transform.m13;
  *(_OWORD *)&v16.m11 = *(_OWORD *)&self->_transform.m11;
  *(_OWORD *)&v16.m13 = v7;
  v8 = *(_OWORD *)&self->_transform.m23;
  *(_OWORD *)&v16.m21 = *(_OWORD *)&self->_transform.m21;
  *(_OWORD *)&v16.m23 = v8;
  result = (CGAffineTransform *)MEMORY[0x186DC5824](&v16, a3);
  if ((_DWORD)result)
  {
    v10 = *(_OWORD *)&self->_transform.m33;
    *(_OWORD *)&v16.m31 = *(_OWORD *)&self->_transform.m31;
    *(_OWORD *)&v16.m33 = v10;
    v11 = *(_OWORD *)&self->_transform.m43;
    *(_OWORD *)&v16.m41 = *(_OWORD *)&self->_transform.m41;
    *(_OWORD *)&v16.m43 = v11;
    v12 = *(_OWORD *)&self->_transform.m13;
    *(_OWORD *)&v16.m11 = *(_OWORD *)&self->_transform.m11;
    *(_OWORD *)&v16.m13 = v12;
    v13 = *(_OWORD *)&self->_transform.m23;
    *(_OWORD *)&v16.m21 = *(_OWORD *)&self->_transform.m21;
    *(_OWORD *)&v16.m23 = v13;
    return CATransform3DGetAffineTransform(retstr, &v16);
  }
  else
  {
    v14 = MEMORY[0x1E0C9BAA8];
    v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v15;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v14 + 32);
  }
  return result;
}

- (void)_isTransitionVisibleTo:(void *)result
{
  void *v3;
  double v4;
  int v5;
  double v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  BOOL v15;

  if (result)
  {
    v3 = result;
    objc_msgSend(result, "alpha");
    if (v4 == 0.0)
      v5 = 0;
    else
      v5 = objc_msgSend(v3, "isHidden") ^ 1;
    objc_msgSend(a2, "alpha");
    if (v6 == 0.0)
      v7 = 0;
    else
      v7 = objc_msgSend(a2, "isHidden") ^ 1;
    if ((v5 | v7) != 1)
      return 0;
    objc_msgSend(v3, "size");
    v9 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v12 = v11 == *MEMORY[0x1E0C9D820] && v8 == v10;
    if (v12 && ((objc_msgSend(a2, "size"), v14 == v9) ? (v15 = v13 == v10) : (v15 = 0), v15))
      return 0;
    else
      return (void *)(-[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)v3, (uint64_t)a2) ^ 1);
  }
  return result;
}

@end

@implementation SKUISearchCollectionViewFlowLayout

- (SKUISearchCollectionViewFlowLayout)init
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKUISearchCollectionViewFlowLayout *v11;
  objc_super v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUISearchCollectionViewFlowLayout init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUISearchCollectionViewFlowLayout;
  v11 = -[SKUIItemGridCollectionViewLayout init](&v13, sel_init);
  if (v11)
  {
    -[SKUISearchCollectionViewFlowLayout registerClass:forDecorationViewOfKind:](v11, "registerClass:forDecorationViewOfKind:", objc_opt_class(), CFSTR("a"));
    -[SKUISearchCollectionViewFlowLayout registerClass:forDecorationViewOfKind:](v11, "registerClass:forDecorationViewOfKind:", objc_opt_class(), CFSTR("b"));
  }
  return v11;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  int64_t v16;
  double v17;
  double v18;
  int64_t v19;
  int64_t numberOfRows;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  void *v24;
  void *v25;
  int64_t v26;
  void *v27;
  void *v28;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30.receiver = self;
  v30.super_class = (Class)SKUISearchCollectionViewFlowLayout;
  -[SKUIItemGridCollectionViewLayout layoutAttributesForElementsInRect:](&v30, sel_layoutAttributesForElementsInRect_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  v11 = v10;
  v13 = v12;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v14 = floor((CGRectGetMinY(v31) - self->_headerSize.height) / v13);
  if (v14 < 0.0)
    v14 = 0.0;
  v15 = (uint64_t)v14;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v16 = vcvtpd_s64_f64((CGRectGetMaxY(v32) - self->_headerSize.height) / v13);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v17 = CGRectGetMinX(v33) / v11;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v18 = CGRectGetMaxX(v34) / v11;
  if (self->_backfills)
  {
    if (self->_numberOfRows <= v16)
      v19 = v16 + 6;
    else
      v19 = v16;
  }
  else
  {
    --v15;
    numberOfRows = self->_numberOfRows;
    if (numberOfRows + 1 < v16 - 1)
      v19 = numberOfRows + 1;
    else
      v19 = v16 - 1;
  }
  v21 = vcvtpd_s64_f64(v17);
  v22 = vcvtmd_s64_f64(v18);
  v23 = v19 - 1;
  if (v15 < v19 - 1)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUISearchCollectionViewFlowLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](self, "layoutAttributesForDecorationViewOfKind:atIndexPath:", CFSTR("b"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v25);

      ++v15;
    }
    while (v23 != v15);
  }
  if ((uint64_t)(v22 - 1) > v21)
  {
    v26 = v21 + 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUISearchCollectionViewFlowLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](self, "layoutAttributesForDecorationViewOfKind:atIndexPath:", CFSTR("a"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v28);

      ++v26;
    }
    while (v22 != v26);
  }
  return v9;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  double horizontalPadding;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;

  v6 = a4;
  v7 = a3;
  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(v6, "indexAtPosition:", 0);
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForDecorationViewOfKind:withIndexPath:", v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setZIndex:", 1);
  LODWORD(v6) = objc_msgSend(v7, "isEqualToString:", CFSTR("b"));

  if ((_DWORD)v6)
  {
    horizontalPadding = self->_horizontalPadding;
    v15 = self->_headerSize.height + (double)(v12 + 1) * v11;
    -[UICollectionView frame](self->_collectionView, "frame");
    v17 = v16 + self->_horizontalPadding * -2.0;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scale");
    v20 = 1.0 / v19;
  }
  else
  {
    horizontalPadding = v9 * (double)v12;
    v15 = self->_verticalPadding + self->_headerSize.height;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scale");
    v17 = 1.0 / v21;
    v22 = 6;
    if (!self->_backfills)
      v22 = 0;
    v20 = -(self->_verticalPadding - v11 * (double)(v22 + self->_numberOfRows));
  }
  objc_msgSend(v13, "setFrame:", horizontalPadding, v15, v17, v20);

  return v13;
}

- (void)prepareLayout
{
  UICollectionView *v3;
  UICollectionView *collectionView;
  double v5;
  double v6;
  double v7;
  NSInteger v8;
  uint64_t v9;
  float v10;
  CGFloat v11;
  CGFloat v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SKUISearchCollectionViewFlowLayout;
  -[UICollectionViewFlowLayout prepareLayout](&v13, sel_prepareLayout);
  -[SKUISearchCollectionViewFlowLayout collectionView](self, "collectionView");
  v3 = (UICollectionView *)objc_claimAutoreleasedReturnValue();
  collectionView = self->_collectionView;
  self->_collectionView = v3;

  -[UICollectionView frame](self->_collectionView, "frame");
  v6 = v5;
  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  self->_numberOfColumns = vcvtmd_s64_f64(v6 / v7);
  if (-[UICollectionView numberOfSections](self->_collectionView, "numberOfSections") < 1)
  {
    v10 = 0.0;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    do
      v9 += -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", v8++);
    while (v8 < -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections"));
    v10 = (float)v9;
  }
  self->_numberOfRows = vcvtps_s32_f32(v10 / (float)self->_numberOfColumns);
  -[UICollectionViewFlowLayout headerReferenceSize](self, "headerReferenceSize");
  self->_headerSize.width = v11;
  self->_headerSize.height = v12;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (void)setHorizontalPadding:(double)a3
{
  self->_horizontalPadding = a3;
}

- (double)verticalPadding
{
  return self->_verticalPadding;
}

- (void)setVerticalPadding:(double)a3
{
  self->_verticalPadding = a3;
}

- (BOOL)backfills
{
  return self->_backfills;
}

- (void)setBackfills:(BOOL)a3
{
  self->_backfills = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
}

- (void)init
{
}

@end

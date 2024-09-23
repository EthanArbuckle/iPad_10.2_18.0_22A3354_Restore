@implementation PXExploreLayoutMetrics

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (double)buildingBlockAspectRatio
{
  return self->_buildingBlockAspectRatio;
}

- (int64_t)reorderingTolerance
{
  return self->_reorderingTolerance;
}

- (int64_t)largeHeroDensity
{
  return self->_largeHeroDensity;
}

- (BOOL)allowHeaders
{
  return self->_allowHeaders;
}

- (double)preferredFullWidthHeaderAspectRatio
{
  return self->_preferredFullWidthHeaderAspectRatio;
}

- (BOOL)allowSpecialPanoHeaders
{
  return self->_allowSpecialPanoHeaders;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (PXExploreLayoutMetrics)initWithSpec:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  PXExploreLayoutMetrics *v17;

  v4 = a3;
  if (objc_msgSend(v4, "userInterfaceIdiom") == 2)
    v5 = objc_msgSend(v4, "windowOrientation");
  else
    v5 = objc_msgSend(v4, "layoutOrientation");
  v6 = v5;
  v7 = objc_msgSend(v4, "userInterfaceIdiom");
  v8 = objc_msgSend(v4, "sizeClass");
  objc_msgSend(v4, "layoutReferenceSize");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "safeAreaInsets");
  v17 = -[PXExploreLayoutMetrics initWithUserInterfaceIdiom:sizeClass:orientation:referenceSize:safeAreaInsets:](self, "initWithUserInterfaceIdiom:sizeClass:orientation:referenceSize:safeAreaInsets:", v7, v8, v6, v10, v12, v13, v14, v15, v16);

  return v17;
}

- (PXExploreLayoutMetrics)initWithUserInterfaceIdiom:(int64_t)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5 referenceSize:(CGSize)a6 safeAreaInsets:(UIEdgeInsets)a7
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  PXExploreLayoutMetrics *v14;
  PXExploreLayoutMetrics *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  double v19;
  uint64_t v20;
  id acceptableLargeHeroPredicate;
  double v22;
  objc_super v24;

  right = a7.right;
  bottom = a7.bottom;
  left = a7.left;
  top = a7.top;
  v24.receiver = self;
  v24.super_class = (Class)PXExploreLayoutMetrics;
  v14 = -[PXExploreLayoutMetrics init](&v24, sel_init, a6.width, a6.height);
  v15 = v14;
  if (v14)
  {
    if (a3 == 4)
    {
      v16 = 5;
    }
    else if (a3 == 5)
    {
      v16 = 6;
    }
    else if (a4)
    {
      if (a4 == 2)
      {
        v17 = (unint64_t)a5 >= 2;
        v16 = 3;
      }
      else
      {
        if (a4 != 1)
        {
LABEL_15:
          v14->_layoutSubtype = 0;
          v14->_reorderingTolerance = 0;
          v14->_safeAreaInsets.top = top;
          v14->_safeAreaInsets.left = left;
          v14->_safeAreaInsets.bottom = bottom;
          v14->_safeAreaInsets.right = right;
          +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "interitemSpacingForDays");
          v15->_interitemSpacing = v19;
          v15->_largeHeroDensity = objc_msgSend(v18, "largeHeroDensity");
          objc_msgSend(v18, "acceptableLargeHeroPredicate");
          v20 = objc_claimAutoreleasedReturnValue();
          acceptableLargeHeroPredicate = v15->_acceptableLargeHeroPredicate;
          v15->_acceptableLargeHeroPredicate = (id)v20;

          objc_msgSend(v18, "allowSpecialPanoHeaders");
          v15->_allowSpecialPanoHeaders = v22 != 0.0;
          v15->_allowHeaders = 1;
          v15->_buildingBlockAspectRatio = 0.0;
          v15->_preferredFullWidthHeaderAspectRatio = 0.0;

          return v15;
        }
        v17 = (unint64_t)a5 >= 2;
        v16 = 1;
      }
      if (v17)
        ++v16;
    }
    else
    {
      v16 = 1;
    }
    v14->_layoutType = v16;
    goto LABEL_15;
  }
  return v15;
}

- (PXExploreLayoutMetrics)init
{
  return -[PXExploreLayoutMetrics initWithUserInterfaceIdiom:sizeClass:orientation:referenceSize:safeAreaInsets:](self, "initWithUserInterfaceIdiom:sizeClass:orientation:referenceSize:safeAreaInsets:", 0, 0, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  _QWORD *v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXExploreLayoutMetrics;
  v4 = -[PXLayoutMetrics copyWithZone:](&v11, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    v4[4] = self->_layoutType;
    v4[5] = self->_layoutSubtype;
    v4[6] = self->_reorderingTolerance;
    v6 = *(_OWORD *)&self->_safeAreaInsets.bottom;
    *((_OWORD *)v4 + 6) = *(_OWORD *)&self->_safeAreaInsets.top;
    *((_OWORD *)v4 + 7) = v6;
    v4[7] = *(_QWORD *)&self->_interitemSpacing;
    v4[8] = self->_largeHeroDensity;
    v7 = objc_msgSend(self->_acceptableLargeHeroPredicate, "copy");
    v8 = (void *)v5[9];
    v5[9] = v7;

    *((_BYTE *)v5 + 25) = self->_allowSpecialPanoHeaders;
    *((_BYTE *)v5 + 24) = self->_allowHeaders;
    v5[10] = *(_QWORD *)&self->_buildingBlockAspectRatio;
    v5[11] = *(_QWORD *)&self->_preferredFullWidthHeaderAspectRatio;
    v9 = *(_OWORD *)&self->_padding.bottom;
    *((_OWORD *)v5 + 8) = *(_OWORD *)&self->_padding.top;
    *((_OWORD *)v5 + 9) = v9;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_acceptableLargeHeroPredicate, 0);
}

- (PXExploreLayoutMetrics)initWithExtendedTraitCollection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  PXExploreLayoutMetrics *v17;

  v4 = a3;
  if (objc_msgSend(v4, "userInterfaceIdiom") == 2)
    v5 = objc_msgSend(v4, "windowOrientation");
  else
    v5 = objc_msgSend(v4, "layoutOrientation");
  v6 = v5;
  v7 = objc_msgSend(v4, "userInterfaceIdiom");
  v8 = objc_msgSend(v4, "layoutSizeClass");
  objc_msgSend(v4, "layoutReferenceSize");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "safeAreaInsets");
  v17 = -[PXExploreLayoutMetrics initWithUserInterfaceIdiom:sizeClass:orientation:referenceSize:safeAreaInsets:](self, "initWithUserInterfaceIdiom:sizeClass:orientation:referenceSize:safeAreaInsets:", v7, v8, v6, v10, v12, v13, v14, v15, v16);

  return v17;
}

- (NSString)diagnosticDescription
{
  id v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;
  UIEdgeInsets v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12.receiver = self;
  v12.super_class = (Class)PXExploreLayoutMetrics;
  -[PXLayoutMetrics diagnosticDescription](&v12, sel_diagnosticDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXExploreLayoutMetrics layoutType](self, "layoutType");
  v6 = -[PXExploreLayoutMetrics layoutSubtype](self, "layoutSubtype");
  v7 = -[PXExploreLayoutMetrics reorderingTolerance](self, "reorderingTolerance");
  -[PXExploreLayoutMetrics safeAreaInsets](self, "safeAreaInsets");
  NSStringFromUIEdgeInsets(v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXExploreLayoutMetrics interitemSpacing](self, "interitemSpacing");
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ type=%li subtype=%li reorderTol=%li safeAreaInsets=%@ interitemSpacing=%f largeHeroDensity=%li allowHeaders=%i allowSpecialPanoHeaders=%i"), v4, v5, v6, v7, v8, v9, -[PXExploreLayoutMetrics largeHeroDensity](self, "largeHeroDensity"), -[PXExploreLayoutMetrics allowHeaders](self, "allowHeaders"), -[PXExploreLayoutMetrics allowSpecialPanoHeaders](self, "allowSpecialPanoHeaders"));

  return (NSString *)v10;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_safeAreaInsets.top;
  left = self->_safeAreaInsets.left;
  bottom = self->_safeAreaInsets.bottom;
  right = self->_safeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_safeAreaInsets = a3;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (int64_t)layoutSubtype
{
  return self->_layoutSubtype;
}

- (void)setLayoutSubtype:(int64_t)a3
{
  self->_layoutSubtype = a3;
}

- (void)setReorderingTolerance:(int64_t)a3
{
  self->_reorderingTolerance = a3;
}

- (void)setLargeHeroDensity:(int64_t)a3
{
  self->_largeHeroDensity = a3;
}

- (id)acceptableLargeHeroPredicate
{
  return self->_acceptableLargeHeroPredicate;
}

- (void)setAcceptableLargeHeroPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setAllowHeaders:(BOOL)a3
{
  self->_allowHeaders = a3;
}

- (void)setAllowSpecialPanoHeaders:(BOOL)a3
{
  self->_allowSpecialPanoHeaders = a3;
}

- (void)setBuildingBlockAspectRatio:(double)a3
{
  self->_buildingBlockAspectRatio = a3;
}

- (void)setPreferredFullWidthHeaderAspectRatio:(double)a3
{
  self->_preferredFullWidthHeaderAspectRatio = a3;
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

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

@end

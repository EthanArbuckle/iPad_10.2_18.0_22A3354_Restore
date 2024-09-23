@implementation PXCMMEngineDrivenLayout

- (PXCMMEngineDrivenLayout)initWithLayoutEngineSnapshot:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMEngineDrivenLayout.m"), 67, CFSTR("%s is not available as initializer"), "-[PXCMMEngineDrivenLayout initWithLayoutEngineSnapshot:]");

  abort();
}

- (PXCMMEngineDrivenLayout)initWithDataSource:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMEngineDrivenLayout.m"), 71, CFSTR("%s is not available as initializer"), "-[PXCMMEngineDrivenLayout initWithDataSource:]");

  abort();
}

- (PXCMMEngineDrivenLayout)initWithLayoutEngineSnapshot:(id)a3 configuration:(id)a4
{
  id v6;
  PXCMMEngineDrivenLayout *v7;
  double v8;
  double v9;
  double v10;
  PXCMMAssetStatusBadgeTileUserData *v11;
  PXCMMAssetStatusBadgeTileUserData *copiedUserData;
  PXCMMAssetStatusBadgeTileUserData *v13;
  PXCMMAssetStatusBadgeTileUserData *failedUserData;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PXCMMEngineDrivenLayout;
  v7 = -[PXEngineDrivenAssetsTilingLayout initWithLayoutEngineSnapshot:](&v18, sel_initWithLayoutEngineSnapshot_, a3);
  if (v7)
  {
    v7->_layoutType = objc_msgSend(v6, "layoutType");
    objc_msgSend(v6, "headerHeight");
    v7->_headerHeight = v8;
    objc_msgSend(v6, "bannerHeight");
    v7->_bannerHeight = v9;
    objc_msgSend(v6, "statusFooterHeight");
    v7->_statusFooterHeight = v10;
    v11 = objc_alloc_init(PXCMMAssetStatusBadgeTileUserData);
    copiedUserData = v7->__copiedUserData;
    v7->__copiedUserData = v11;

    -[PXCMMAssetStatusBadgeTileUserData setStatus:](v7->__copiedUserData, "setStatus:", 2);
    v13 = objc_alloc_init(PXCMMAssetStatusBadgeTileUserData);
    failedUserData = v7->__failedUserData;
    v7->__failedUserData = v13;

    -[PXCMMAssetStatusBadgeTileUserData setStatus:](v7->__failedUserData, "setStatus:", -1);
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addIndex:", 8439952);
    objc_msgSend(v15, "addIndex:", 8439964);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexSet:", v15);
    -[PXAssetsTilingLayout setAdditionalAccessoryTileKinds:](v7, "setAdditionalAccessoryTileKinds:", v16);

  }
  return v7;
}

- (void)setPlaceholderMode:(int64_t)a3
{
  PXTilingLayoutInvalidationContext *v4;

  if (self->_placeholderMode != a3)
  {
    self->_placeholderMode = a3;
    v4 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    -[PXTilingLayoutInvalidationContext invalidateAllTiles](v4, "invalidateAllTiles");
    -[PXTilingLayoutInvalidationContext invalidateContentBounds](v4, "invalidateContentBounds");
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (CGRect)contentBounds
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double headerHeight;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[PXEngineDrivenAssetsTilingLayout layoutSnapshot](self, "layoutSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "contentRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  if (-[PXCMMEngineDrivenLayout placeholderMode](self, "placeholderMode"))
  {
    -[PXTilingLayout referenceSize](self, "referenceSize");
    headerHeight = self->_headerHeight;
    if (v15 > v14)
    {
      PXEdgeInsetsInsetSize();
      headerHeight = v16 - headerHeight;
    }
    v12 = v12 + headerHeight;
  }

  v17 = v6;
  v18 = v8;
  v19 = v10;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)setVisibleOrigin:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCMMEngineDrivenLayout;
  -[PXTilingLayout setVisibleOrigin:](&v4, sel_setVisibleOrigin_, a3.x, a3.y);
  if (-[PXCMMEngineDrivenLayout hasFloatingSectionHeaders](self, "hasFloatingSectionHeaders"))
    -[PXCMMEngineDrivenLayout _invalidateSectionHeaders](self, "_invalidateSectionHeaders");
  if (-[PXCMMEngineDrivenLayout hasFloatingBanner](self, "hasFloatingBanner"))
    -[PXCMMEngineDrivenLayout _invalidateBanner](self, "_invalidateBanner");
}

- (BOOL)headerViewIsVisible
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v16;
  CGRect v17;

  -[PXTilingLayout visibleRect](self, "visibleRect");
  -[PXCMMEngineDrivenLayout reviewSafeAreaInsets](self, "reviewSafeAreaInsets");
  PXEdgeInsetsInsetRect();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXCMMEngineDrivenLayout _headerFrame](self, "_headerFrame");
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  return CGRectIntersectsRect(v16, v17);
}

- (void)setHasFloatingBanner:(BOOL)a3
{
  if (self->_hasFloatingBanner != a3)
  {
    self->_hasFloatingBanner = a3;
    -[PXCMMEngineDrivenLayout _invalidateBanner](self, "_invalidateBanner");
  }
}

- (void)setHasFloatingSectionHeaders:(BOOL)a3
{
  if (self->_hasFloatingSectionHeaders != a3)
  {
    self->_hasFloatingSectionHeaders = a3;
    -[PXCMMEngineDrivenLayout _invalidateSectionHeaders](self, "_invalidateSectionHeaders");
  }
}

- (void)setHeaderTopInset:(double)a3
{
  if (self->_headerTopInset != a3)
  {
    self->_headerTopInset = a3;
    -[PXCMMEngineDrivenLayout _invalidateHeader](self, "_invalidateHeader");
    -[PXCMMEngineDrivenLayout _invalidateBanner](self, "_invalidateBanner");
    -[PXCMMEngineDrivenLayout _invalidateStatusFooter](self, "_invalidateStatusFooter");
  }
}

- (void)setFooterBottomInset:(double)a3
{
  if (self->_footerBottomInset != a3)
  {
    self->_footerBottomInset = a3;
    -[PXCMMEngineDrivenLayout _invalidateStatusFooter](self, "_invalidateStatusFooter");
  }
}

- (void)setHeaderFooterSideInset:(double)a3
{
  if (self->_headerFooterSideInset != a3)
  {
    self->_headerFooterSideInset = a3;
    -[PXCMMEngineDrivenLayout _invalidateHeader](self, "_invalidateHeader");
    -[PXCMMEngineDrivenLayout _invalidateBanner](self, "_invalidateBanner");
    -[PXCMMEngineDrivenLayout _invalidateStatusFooter](self, "_invalidateStatusFooter");
  }
}

- (void)setReviewSafeAreaInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_reviewSafeAreaInsets;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_reviewSafeAreaInsets = &self->_reviewSafeAreaInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_reviewSafeAreaInsets->top = top;
    p_reviewSafeAreaInsets->left = left;
    p_reviewSafeAreaInsets->bottom = bottom;
    p_reviewSafeAreaInsets->right = right;
    -[PXCMMEngineDrivenLayout _invalidateHeader](self, "_invalidateHeader");
    -[PXCMMEngineDrivenLayout _invalidateBanner](self, "_invalidateBanner");
    -[PXCMMEngineDrivenLayout _invalidateStatusFooter](self, "_invalidateStatusFooter");
  }
}

- (void)_invalidateSectionHeaders
{
  PXTilingLayoutInvalidationContext *v3;

  v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  -[PXTilingLayoutInvalidationContext invalidateTilesInGroup:](v3, "invalidateTilesInGroup:", 42);
  -[PXTilingLayoutInvalidationContext setTag:](v3, "setTag:", CFSTR("PXCMMSectionHeaderTileGroupInvalidation"));
  -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v3);

}

- (void)_invalidateHeader
{
  PXTilingLayoutInvalidationContext *v3;
  _BYTE v4[88];

  v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  -[PXCMMEngineDrivenLayout _headerTileIdentifier](self, "_headerTileIdentifier");
  -[PXTilingLayoutInvalidationContext invalidateTileWithIdentifier:](v3, "invalidateTileWithIdentifier:", v4);
  -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v3);

}

- (void)_invalidateBanner
{
  PXTilingLayoutInvalidationContext *v3;

  v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  -[PXTilingLayoutInvalidationContext invalidateTilesInGroup:](v3, "invalidateTilesInGroup:", 41);
  -[PXTilingLayoutInvalidationContext setTag:](v3, "setTag:", CFSTR("PXCMMBannerTileGroupInvalidationTag"));
  -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v3);

}

- (void)_invalidateStatusFooter
{
  PXTilingLayoutInvalidationContext *v3;
  _BYTE v4[88];

  v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  -[PXCMMEngineDrivenLayout _statusFooterTileIdentifier](self, "_statusFooterTileIdentifier");
  -[PXTilingLayoutInvalidationContext invalidateTileWithIdentifier:](v3, "invalidateTileWithIdentifier:", v4);
  -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v3);

}

- (void)_invalidateAssetStatusBadgeTiles
{
  PXTilingLayoutInvalidationContext *v3;

  v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  -[PXTilingLayoutInvalidationContext invalidateTilesInGroup:](v3, "invalidateTilesInGroup:", 48);
  -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v3);

}

- (PXTileIdentifier)_identifierForUniqueTileWithKind:(SEL)a3
{
  void *v6;
  uint64_t v7;
  PXTileIdentifier *result;

  -[PXEngineDrivenAssetsTilingLayout dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "identifier");

  retstr->index[9] = 0;
  *(_OWORD *)&retstr->index[5] = 0u;
  *(_OWORD *)&retstr->index[7] = 0u;
  retstr->length = 5;
  retstr->index[0] = a4;
  retstr->index[1] = v7;
  retstr->index[2] = 0;
  retstr->index[3] = 0;
  retstr->index[4] = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (CGRect)_headerFrame
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
  double v16;
  double v17;
  double v18;
  double headerHeight;
  double v20;
  double v21;
  CGRect result;

  -[PXCMMEngineDrivenLayout reviewSafeAreaInsets](self, "reviewSafeAreaInsets");
  v4 = v3;
  -[PXCMMEngineDrivenLayout reviewSafeAreaInsets](self, "reviewSafeAreaInsets");
  v6 = v4 + v5;
  -[PXCMMEngineDrivenLayout contentBounds](self, "contentBounds");
  v8 = v7;
  -[PXCMMEngineDrivenLayout headerFooterSideInset](self, "headerFooterSideInset");
  v10 = fmax(v8 + v9 * -2.0 - v6, 0.0);
  -[PXCMMEngineDrivenLayout reviewSafeAreaInsets](self, "reviewSafeAreaInsets");
  v12 = v11;
  -[PXCMMEngineDrivenLayout headerFooterSideInset](self, "headerFooterSideInset");
  v14 = v12 + v13;
  -[PXCMMEngineDrivenLayout reviewSafeAreaInsets](self, "reviewSafeAreaInsets");
  v16 = v15;
  -[PXCMMEngineDrivenLayout headerTopInset](self, "headerTopInset");
  v18 = v16 + v17;
  headerHeight = self->_headerHeight;
  v20 = v14;
  v21 = v10;
  result.size.height = headerHeight;
  result.size.width = v21;
  result.origin.y = v18;
  result.origin.x = v20;
  return result;
}

- (PXTileIdentifier)_headerTileIdentifier
{
  return -[PXCMMEngineDrivenLayout _identifierForUniqueTileWithKind:](self, "_identifierForUniqueTileWithKind:", 8439980);
}

- (CGRect)_bannerFrame
{
  CGFloat x;
  CGFloat width;
  double MaxY;
  double bannerHeight;
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
  CGRect v17;
  CGRect result;

  -[PXCMMEngineDrivenLayout _headerFrame](self, "_headerFrame");
  x = v17.origin.x;
  width = v17.size.width;
  MaxY = CGRectGetMaxY(v17);
  bannerHeight = self->_bannerHeight;
  if (self->_hasFloatingBanner)
  {
    -[PXTilingLayout contentInset](self, "contentInset");
    v8 = v7;
    -[PXCMMEngineDrivenLayout reviewSafeAreaInsets](self, "reviewSafeAreaInsets");
    v10 = v8 + v9;
    -[PXTilingLayout visibleOrigin](self, "visibleOrigin");
    if (v10 + v11 > MaxY)
    {
      -[PXTilingLayout visibleOrigin](self, "visibleOrigin", v10 + v11);
      MaxY = MaxY + v10 + v12 - MaxY;
    }
  }
  v13 = x;
  v14 = MaxY;
  v15 = width;
  v16 = bannerHeight;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (PXTileIdentifier)_bannerTileIdentifier
{
  return -[PXCMMEngineDrivenLayout _identifierForUniqueTileWithKind:](self, "_identifierForUniqueTileWithKind:", 8439981);
}

- (CGRect)_statusFooterFrame
{
  double *p_statusFooterHeight;
  double MaxY;
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
  CGRect v17;
  CGRect result;

  p_statusFooterHeight = &self->_statusFooterHeight;
  if (self->_statusFooterHeight <= 0.0)
  {
    v13 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    p_statusFooterHeight = (double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    -[PXCMMEngineDrivenLayout contentBounds](self, "contentBounds");
    MaxY = CGRectGetMaxY(v17);
    -[PXCMMEngineDrivenLayout reviewSafeAreaInsets](self, "reviewSafeAreaInsets");
    v6 = MaxY - v5 - *p_statusFooterHeight;
    -[PXCMMEngineDrivenLayout footerBottomInset](self, "footerBottomInset");
    v8 = v6 - v7;
    -[PXCMMEngineDrivenLayout contentBounds](self, "contentBounds");
    v10 = v9;
    -[PXCMMEngineDrivenLayout headerFooterSideInset](self, "headerFooterSideInset");
    v12 = fmax(v10 + v11 * -2.0, 0.0);
    -[PXCMMEngineDrivenLayout headerFooterSideInset](self, "headerFooterSideInset");
  }
  v14 = *p_statusFooterHeight;
  v15 = v8;
  v16 = v12;
  result.size.height = v14;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v13;
  return result;
}

- (PXTileIdentifier)_statusFooterTileIdentifier
{
  return -[PXCMMEngineDrivenLayout _identifierForUniqueTileWithKind:](self, "_identifierForUniqueTileWithKind:", 8439982);
}

- (PXTileIdentifier)_placeholderTileIdentifier
{
  int64_t v5;
  uint64_t v6;
  void *v8;

  v5 = -[PXCMMEngineDrivenLayout placeholderMode](self, "placeholderMode");
  if ((unint64_t)(v5 - 1) >= 2)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXCMMEngineDrivenLayout.m"), 316, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v6 = 0;
  }
  else
  {
    v6 = 8439984;
  }
  return -[PXCMMEngineDrivenLayout _identifierForUniqueTileWithKind:](self, "_identifierForUniqueTileWithKind:", v6);
}

- (CGRect)_sectionHeaderTileFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (!-[PXCMMEngineDrivenLayout placeholderMode](self, "placeholderMode"))
  {
    v7 = -[PXCMMEngineDrivenLayout _generatorGeometryKindForTileKind:](self, "_generatorGeometryKindForTileKind:", 8439963);
    objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathForItem:inSection:withKind:", 0, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXEngineDrivenAssetsTilingLayout layoutSnapshot](self, "layoutSnapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "geometryForItem:", v8);

    PXRectWithCenterAndSize();
    v3 = v11;
    v4 = v12;
    v5 = v13;
    v6 = v14;

  }
  v15 = v3;
  v16 = v4;
  v17 = v5;
  v18 = v6;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_placeholderFrame
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinX;
  CGFloat MaxY;
  double v9;
  double headerHeight;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  -[PXCMMEngineDrivenLayout _headerFrame](self, "_headerFrame");
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  if (CGRectIsEmpty(v17))
  {
    MinX = *MEMORY[0x1E0C9D648];
    MaxY = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    headerHeight = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    -[PXTilingLayout referenceSize](self, "referenceSize");
    headerHeight = self->_headerHeight;
    if (v12 > v11)
    {
      PXEdgeInsetsInsetSize();
      headerHeight = v13 - headerHeight;
    }
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    MinX = CGRectGetMinX(v18);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    MaxY = CGRectGetMaxY(v19);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v9 = CGRectGetWidth(v20);
  }
  v14 = MinX;
  v15 = MaxY;
  v16 = headerHeight;
  result.size.height = v16;
  result.size.width = v9;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  unint64_t length;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGSize v16;
  CGSize v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  BOOL v21;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CGFloat v56;
  CGFloat v57;
  void *v58;
  uint64_t v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  CGFloat v68;
  CGFloat v69;
  void *v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  __int128 v79;
  __int128 v80;
  CGFloat v81;
  CGFloat v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  CGSize v87;
  CGSize v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  objc_super v92;
  _QWORD v93[4];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  CGPoint v104;
  CGSize v105;
  CGPoint v106;
  CGSize v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[48];

  length = a6->length;
  v12 = *((_OWORD *)off_1E50B8940 + 9);
  v112 = *((_OWORD *)off_1E50B8940 + 8);
  *(_OWORD *)v113 = v12;
  v13 = *((_OWORD *)off_1E50B8940 + 11);
  *(_OWORD *)&v113[16] = *((_OWORD *)off_1E50B8940 + 10);
  *(_OWORD *)&v113[32] = v13;
  v14 = *((_OWORD *)off_1E50B8940 + 5);
  v108 = *((_OWORD *)off_1E50B8940 + 4);
  v109 = v14;
  v15 = *((_OWORD *)off_1E50B8940 + 7);
  v110 = *((_OWORD *)off_1E50B8940 + 6);
  v111 = v15;
  v16 = (CGSize)*((_OWORD *)off_1E50B8940 + 1);
  v104 = *(CGPoint *)off_1E50B8940;
  v105 = v16;
  v17 = (CGSize)*((_OWORD *)off_1E50B8940 + 3);
  v106 = (CGPoint)*((_OWORD *)off_1E50B8940 + 2);
  v107 = v17;
  if (length - 3 > 2 || (v18 = a6->index[1], v18 == 0x7FFFFFFFFFFFFFFFLL))
  {
LABEL_3:
    v92.receiver = self;
    v92.super_class = (Class)PXCMMEngineDrivenLayout;
    v19 = *(_OWORD *)&a6->index[5];
    v96 = *(_OWORD *)&a6->index[3];
    v97 = v19;
    v98 = *(_OWORD *)&a6->index[7];
    *(_QWORD *)&v99 = a6->index[9];
    v20 = *(_OWORD *)&a6->index[1];
    v94 = *(_OWORD *)&a6->length;
    v95 = v20;
    return -[PXEngineDrivenAssetsTilingLayout getGeometry:group:userData:forTileWithIdentifier:](&v92, sel_getGeometry_group_userData_forTileWithIdentifier_, a3, a4, a5, &v94);
  }
  v23 = a6->index[0];
  objc_msgSend((id)objc_opt_class(), "_additionalTileKinds");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "containsIndex:", v23) & 1) == 0)
  {

LABEL_13:
    switch(v23)
    {
      case 0x80C8ACuLL:
        -[PXEngineDrivenAssetsTilingLayout dataSource](self, "dataSource");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "identifier");

        if (v18 != v35)
          goto LABEL_3;
        if (self->_headerHeight <= 0.0)
          goto LABEL_29;
        -[PXCMMEngineDrivenLayout _headerFrame](self, "_headerFrame");
        goto LABEL_27;
      case 0x80C8ADuLL:
        -[PXEngineDrivenAssetsTilingLayout dataSource](self, "dataSource");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "identifier");

        if (v18 != v43)
          goto LABEL_3;
        if (self->_bannerHeight <= 0.0)
        {
          v21 = 0;
          v27 = 41;
          if (a3)
            goto LABEL_35;
        }
        else
        {
          -[PXCMMEngineDrivenLayout _bannerFrame](self, "_bannerFrame");
          v45 = v44;
          v47 = v46;
          v49 = v48;
          v51 = v50;
          v52 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
          *(_DWORD *)((char *)&v112 + 1) = 0;
          DWORD1(v112) = 0;
          PXRectGetCenter();
          v53 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          v108 = *MEMORY[0x1E0C9BAA8];
          v109 = v53;
          v54 = *((_OWORD *)off_1E50B86D0 + 1);
          *(_OWORD *)&v113[8] = *(_OWORD *)off_1E50B86D0;
          *(_OWORD *)&v113[24] = v54;
          v55 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
          v104.x = v45;
          v104.y = v47;
          v105.width = v49;
          v105.height = v51;
          v106.x = v56;
          v106.y = v57;
          v107.width = v49;
          v107.height = v51;
          LOBYTE(v112) = 0;
          *((CGFloat *)&v112 + 1) = v49;
          *(CGFloat *)v113 = v51;
          *(_QWORD *)&v113[40] = v52;
          v21 = 1;
          v27 = 41;
          v110 = v55;
          v111 = xmmword_1A7C0C370;
          if (a3)
            goto LABEL_35;
        }
        goto LABEL_36;
      case 0x80C8AEuLL:
        -[PXEngineDrivenAssetsTilingLayout dataSource](self, "dataSource");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "identifier");

        if (v18 != v41)
          goto LABEL_3;
        if (self->_statusFooterHeight <= 0.0)
          goto LABEL_29;
        -[PXCMMEngineDrivenLayout _statusFooterFrame](self, "_statusFooterFrame");
        goto LABEL_27;
      case 0x80C8B0uLL:
        -[PXEngineDrivenAssetsTilingLayout dataSource](self, "dataSource");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "identifier");

        if (v18 != v59)
          goto LABEL_3;
        if (-[PXCMMEngineDrivenLayout placeholderMode](self, "placeholderMode"))
        {
          -[PXCMMEngineDrivenLayout _placeholderFrame](self, "_placeholderFrame");
LABEL_27:
          v60 = v36;
          v61 = v37;
          v62 = v38;
          v63 = v39;
          v64 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
          *(_DWORD *)((char *)&v112 + 1) = 0;
          DWORD1(v112) = 0;
          PXRectGetCenter();
          v27 = 0;
          v65 = *((_OWORD *)off_1E50B86D0 + 1);
          *(_OWORD *)&v113[8] = *(_OWORD *)off_1E50B86D0;
          *(_OWORD *)&v113[24] = v65;
          v66 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          v108 = *MEMORY[0x1E0C9BAA8];
          v109 = v66;
          v67 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
          v104.x = v60;
          v104.y = v61;
          v105.width = v62;
          v105.height = v63;
          v106.x = v68;
          v106.y = v69;
          v107.width = v62;
          v107.height = v63;
          v110 = v67;
          v111 = xmmword_1A7C0C360;
          LOBYTE(v112) = 0;
          *((CGFloat *)&v112 + 1) = v62;
          *(CGFloat *)v113 = v63;
          v21 = 1;
          *(_QWORD *)&v113[40] = v64;
          if (a3)
            goto LABEL_35;
        }
        else
        {
LABEL_29:
          v27 = 0;
          v21 = 0;
          if (a3)
            goto LABEL_35;
        }
        break;
      default:
        goto LABEL_3;
    }
    goto LABEL_36;
  }
  -[PXEngineDrivenAssetsTilingLayout dataSource](self, "dataSource");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "identifier");

  if (v18 != v26)
    goto LABEL_13;
  if (v23 == 8439963)
    v27 = 42;
  else
    v27 = 0;
  v28 = a6->index[2];
  v29 = a6->index[3];
  v90 = a6->index[4];
  v91 = a6->index[1];
  v30 = -[PXCMMEngineDrivenLayout _generatorGeometryKindForTileKind:](self, "_generatorGeometryKindForTileKind:", v23);
  objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathForItem:inSection:withKind:", v29, v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0;
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v94 = 0u;
  -[PXEngineDrivenAssetsTilingLayout layoutSnapshot](self, "layoutSnapshot");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    objc_msgSend(v32, "geometryForItem:", v31);
  }
  else
  {
    v103 = 0;
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v94 = 0u;
  }

  v21 = (_QWORD)v94 != 0x7FFFFFFFFFFFFFFFLL;
  if ((_QWORD)v94 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v89 = v27;
    v70 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
    PXRectWithCenterAndSize();
    v72 = v71;
    v74 = v73;
    v76 = v75;
    v78 = v77;
    PXRectGetCenter();
    v79 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v108 = *MEMORY[0x1E0C9BAA8];
    v109 = v79;
    v110 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v80 = *((_OWORD *)off_1E50B86D0 + 1);
    *(_OWORD *)&v113[8] = *(_OWORD *)off_1E50B86D0;
    *(_OWORD *)&v113[24] = v80;
    v104.x = v72;
    v104.y = v74;
    v105.width = v76;
    v105.height = v78;
    v106.x = v81;
    v106.y = v82;
    v107.width = v76;
    v107.height = v78;
    *(_QWORD *)&v112 = 0;
    v111 = 0x3FF0000000000000uLL;
    *((CGFloat *)&v112 + 1) = v76;
    *(CGFloat *)v113 = v78;
    *(_QWORD *)&v113[40] = v70;
    v93[0] = v91;
    v93[1] = v28;
    v27 = v89;
    v93[2] = v29;
    v93[3] = v90;
    -[PXCMMEngineDrivenLayout adjustGeometry:forAdditionalTileWithKind:indexPath:](self, "adjustGeometry:forAdditionalTileWithKind:indexPath:", &v104, v30, v93);
  }

  if (a3)
  {
LABEL_35:
    v83 = *(_OWORD *)v113;
    *(_OWORD *)&a3->hidden = v112;
    *(_OWORD *)&a3->contentSize.height = v83;
    v84 = *(_OWORD *)&v113[32];
    *(_OWORD *)&a3->contentsRect.origin.y = *(_OWORD *)&v113[16];
    *(_OWORD *)&a3->contentsRect.size.height = v84;
    v85 = v109;
    *(_OWORD *)&a3->transform.a = v108;
    *(_OWORD *)&a3->transform.c = v85;
    v86 = v111;
    *(_OWORD *)&a3->transform.tx = v110;
    *(_OWORD *)&a3->alpha = v86;
    v87 = v105;
    a3->frame.origin = v104;
    a3->frame.size = v87;
    v88 = v107;
    a3->center = v106;
    a3->size = v88;
  }
LABEL_36:
  if (a4)
    *a4 = v27;
  if (a5)
    *a5 = 0;
  return v21;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  _QWORD *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void (*v23)(_QWORD *, __int128 *, __int128 *, uint64_t, uint64_t, unsigned __int8 *);
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void (*v34)(_QWORD *, __int128 *, __int128 *, uint64_t, uint64_t, unsigned __int8 *);
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void (*v45)(_QWORD *, __int128 *, __int128 *, uint64_t, uint64_t, unsigned __int8 *);
  int64_t v46;
  int v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  void (*v58)(_QWORD *, __int128 *, __int128 *, uint64_t, uint64_t, unsigned __int8 *);
  objc_super v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  unsigned __int8 v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v101 = 0;
  -[PXCMMEngineDrivenLayout _headerFrame](self, "_headerFrame");
  v106.origin.x = v13;
  v106.origin.y = v14;
  v106.size.width = v15;
  v106.size.height = v16;
  v102.origin.x = x;
  v102.origin.y = y;
  v102.size.width = width;
  v102.size.height = height;
  if (!CGRectIntersectsRect(v102, v106))
    goto LABEL_5;
  v17 = *((_OWORD *)off_1E50B8940 + 9);
  v97 = *((_OWORD *)off_1E50B8940 + 8);
  v98 = v17;
  v18 = *((_OWORD *)off_1E50B8940 + 11);
  v99 = *((_OWORD *)off_1E50B8940 + 10);
  v100 = v18;
  v19 = *((_OWORD *)off_1E50B8940 + 5);
  v93 = *((_OWORD *)off_1E50B8940 + 4);
  v94 = v19;
  v20 = *((_OWORD *)off_1E50B8940 + 7);
  v95 = *((_OWORD *)off_1E50B8940 + 6);
  v96 = v20;
  v21 = *((_OWORD *)off_1E50B8940 + 1);
  v89 = *(_OWORD *)off_1E50B8940;
  v90 = v21;
  v22 = *((_OWORD *)off_1E50B8940 + 3);
  v91 = *((_OWORD *)off_1E50B8940 + 2);
  v92 = v22;
  v87 = 0;
  v88 = 0;
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v82 = 0u;
  -[PXCMMEngineDrivenLayout _headerTileIdentifier](self, "_headerTileIdentifier");
  v81 = 0;
  v65 = v84;
  v66 = v85;
  v67 = v86;
  *(_QWORD *)&v68 = v87;
  v63 = v82;
  v64 = v83;
  if (-[PXCMMEngineDrivenLayout getGeometry:group:userData:forTileWithIdentifier:](self, "getGeometry:group:userData:forTileWithIdentifier:", &v89, &v88, &v81, &v63))
  {
    v23 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, uint64_t, unsigned __int8 *))v12[2];
    v77 = v84;
    v78 = v85;
    v79 = v86;
    v80 = v87;
    v75 = v82;
    v76 = v83;
    v71 = v97;
    v72 = v98;
    v73 = v99;
    v74 = v100;
    v67 = v93;
    v68 = v94;
    v69 = v95;
    v70 = v96;
    v63 = v89;
    v64 = v90;
    v65 = v91;
    v66 = v92;
    v23(v12, &v75, &v63, v88, v81, &v101);
  }
  if (!v101)
  {
LABEL_5:
    -[PXCMMEngineDrivenLayout _bannerFrame](self, "_bannerFrame");
    v107.origin.x = v24;
    v107.origin.y = v25;
    v107.size.width = v26;
    v107.size.height = v27;
    v103.origin.x = x;
    v103.origin.y = y;
    v103.size.width = width;
    v103.size.height = height;
    if (CGRectIntersectsRect(v103, v107))
    {
      v28 = *((_OWORD *)off_1E50B8940 + 9);
      v97 = *((_OWORD *)off_1E50B8940 + 8);
      v98 = v28;
      v29 = *((_OWORD *)off_1E50B8940 + 11);
      v99 = *((_OWORD *)off_1E50B8940 + 10);
      v100 = v29;
      v30 = *((_OWORD *)off_1E50B8940 + 5);
      v93 = *((_OWORD *)off_1E50B8940 + 4);
      v94 = v30;
      v31 = *((_OWORD *)off_1E50B8940 + 7);
      v95 = *((_OWORD *)off_1E50B8940 + 6);
      v96 = v31;
      v32 = *((_OWORD *)off_1E50B8940 + 1);
      v89 = *(_OWORD *)off_1E50B8940;
      v90 = v32;
      v33 = *((_OWORD *)off_1E50B8940 + 3);
      v91 = *((_OWORD *)off_1E50B8940 + 2);
      v92 = v33;
      v87 = 0;
      v88 = 0;
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v82 = 0u;
      -[PXCMMEngineDrivenLayout _bannerTileIdentifier](self, "_bannerTileIdentifier");
      v62 = 0;
      v65 = v84;
      v66 = v85;
      v67 = v86;
      *(_QWORD *)&v68 = v87;
      v63 = v82;
      v64 = v83;
      if (-[PXCMMEngineDrivenLayout getGeometry:group:userData:forTileWithIdentifier:](self, "getGeometry:group:userData:forTileWithIdentifier:", &v89, &v88, &v62, &v63))
      {
        v34 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, uint64_t, unsigned __int8 *))v12[2];
        v77 = v84;
        v78 = v85;
        v79 = v86;
        v80 = v87;
        v75 = v82;
        v76 = v83;
        v71 = v97;
        v72 = v98;
        v73 = v99;
        v74 = v100;
        v67 = v93;
        v68 = v94;
        v69 = v95;
        v70 = v96;
        v63 = v89;
        v64 = v90;
        v65 = v91;
        v66 = v92;
        v34(v12, &v75, &v63, v88, v62, &v101);
      }
    }
    if (!v101)
    {
      -[PXCMMEngineDrivenLayout _statusFooterFrame](self, "_statusFooterFrame");
      v108.origin.x = v35;
      v108.origin.y = v36;
      v108.size.width = v37;
      v108.size.height = v38;
      v104.origin.x = x;
      v104.origin.y = y;
      v104.size.width = width;
      v104.size.height = height;
      if (CGRectIntersectsRect(v104, v108))
      {
        v39 = *((_OWORD *)off_1E50B8940 + 9);
        v97 = *((_OWORD *)off_1E50B8940 + 8);
        v98 = v39;
        v40 = *((_OWORD *)off_1E50B8940 + 11);
        v99 = *((_OWORD *)off_1E50B8940 + 10);
        v100 = v40;
        v41 = *((_OWORD *)off_1E50B8940 + 5);
        v93 = *((_OWORD *)off_1E50B8940 + 4);
        v94 = v41;
        v42 = *((_OWORD *)off_1E50B8940 + 7);
        v95 = *((_OWORD *)off_1E50B8940 + 6);
        v96 = v42;
        v43 = *((_OWORD *)off_1E50B8940 + 1);
        v89 = *(_OWORD *)off_1E50B8940;
        v90 = v43;
        v44 = *((_OWORD *)off_1E50B8940 + 3);
        v91 = *((_OWORD *)off_1E50B8940 + 2);
        v92 = v44;
        v87 = 0;
        v88 = 0;
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v82 = 0u;
        -[PXCMMEngineDrivenLayout _statusFooterTileIdentifier](self, "_statusFooterTileIdentifier");
        v61 = 0;
        v65 = v84;
        v66 = v85;
        v67 = v86;
        *(_QWORD *)&v68 = v87;
        v63 = v82;
        v64 = v83;
        if (-[PXCMMEngineDrivenLayout getGeometry:group:userData:forTileWithIdentifier:](self, "getGeometry:group:userData:forTileWithIdentifier:", &v89, &v88, &v61, &v63))
        {
          v45 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, uint64_t, unsigned __int8 *))v12[2];
          v77 = v84;
          v78 = v85;
          v79 = v86;
          v80 = v87;
          v75 = v82;
          v76 = v83;
          v71 = v97;
          v72 = v98;
          v73 = v99;
          v74 = v100;
          v67 = v93;
          v68 = v94;
          v69 = v95;
          v70 = v96;
          v63 = v89;
          v64 = v90;
          v65 = v91;
          v66 = v92;
          v45(v12, &v75, &v63, v88, v61, &v101);
        }
      }
    }
  }
  v46 = -[PXCMMEngineDrivenLayout placeholderMode](self, "placeholderMode");
  v47 = v101;
  if (!v101 && v46)
  {
    -[PXCMMEngineDrivenLayout _placeholderFrame](self, "_placeholderFrame");
    v109.origin.x = v48;
    v109.origin.y = v49;
    v109.size.width = v50;
    v109.size.height = v51;
    v105.origin.x = x;
    v105.origin.y = y;
    v105.size.width = width;
    v105.size.height = height;
    if (CGRectIntersectsRect(v105, v109))
    {
      v52 = *((_OWORD *)off_1E50B8940 + 9);
      v97 = *((_OWORD *)off_1E50B8940 + 8);
      v98 = v52;
      v53 = *((_OWORD *)off_1E50B8940 + 11);
      v99 = *((_OWORD *)off_1E50B8940 + 10);
      v100 = v53;
      v54 = *((_OWORD *)off_1E50B8940 + 5);
      v93 = *((_OWORD *)off_1E50B8940 + 4);
      v94 = v54;
      v55 = *((_OWORD *)off_1E50B8940 + 7);
      v95 = *((_OWORD *)off_1E50B8940 + 6);
      v96 = v55;
      v56 = *((_OWORD *)off_1E50B8940 + 1);
      v89 = *(_OWORD *)off_1E50B8940;
      v90 = v56;
      v57 = *((_OWORD *)off_1E50B8940 + 3);
      v91 = *((_OWORD *)off_1E50B8940 + 2);
      v92 = v57;
      v87 = 0;
      v88 = 0;
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v82 = 0u;
      -[PXCMMEngineDrivenLayout _placeholderTileIdentifier](self, "_placeholderTileIdentifier");
      v60 = 0;
      v65 = v84;
      v66 = v85;
      v67 = v86;
      *(_QWORD *)&v68 = v87;
      v63 = v82;
      v64 = v83;
      if (-[PXCMMEngineDrivenLayout getGeometry:group:userData:forTileWithIdentifier:](self, "getGeometry:group:userData:forTileWithIdentifier:", &v89, &v88, &v60, &v63))
      {
        v58 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, uint64_t, unsigned __int8 *))v12[2];
        v77 = v84;
        v78 = v85;
        v79 = v86;
        v80 = v87;
        v75 = v82;
        v76 = v83;
        v71 = v97;
        v72 = v98;
        v73 = v99;
        v74 = v100;
        v67 = v93;
        v68 = v94;
        v69 = v95;
        v70 = v96;
        v63 = v89;
        v64 = v90;
        v65 = v91;
        v66 = v92;
        v58(v12, &v75, &v63, v88, v60, &v101);
      }
    }
    v47 = v101;
  }
  if (!v47)
  {
    v59.receiver = self;
    v59.super_class = (Class)PXCMMEngineDrivenLayout;
    -[PXEngineDrivenAssetsTilingLayout enumerateTilesInRect:withOptions:usingBlock:](&v59, sel_enumerateTilesInRect_withOptions_usingBlock_, v11, v12, x, y, width, height);
  }

}

- (unint64_t)_generatorGeometryKindForTileKind:(unint64_t)a3
{
  int64_t v5;

  v5 = -[PXCMMEngineDrivenLayout layoutType](self, "layoutType");
  if ((unint64_t)(v5 - 2) < 3 || v5 == 0)
    return -[PXCMMEngineDrivenLayout _gridGeneratorGeometryKindForTileKind:](self, "_gridGeneratorGeometryKindForTileKind:", a3);
  if (v5 == 1)
    return -[PXCMMEngineDrivenLayout _editorialGeneratorGeometryKindForTileKind:](self, "_editorialGeneratorGeometryKindForTileKind:", a3);
  return -1;
}

- (unint64_t)_gridGeneratorGeometryKindForTileKind:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 == 8439963)
    return 2;
  if (a3 == 8439962)
    return 1;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Unrecognized grid geometry tile kind: %lu", (uint8_t *)&v6, 0xCu);
  }

  return -1;
}

- (unint64_t)_editorialGeneratorGeometryKindForTileKind:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 == 8439963)
    return 1;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Unrecognized grid geometry tile kind: %lu", (uint8_t *)&v6, 0xCu);
  }

  return -1;
}

- (CGSize)_preferredSelectionBadgeSize
{
  double v2;
  double v3;
  CGSize result;

  +[PXCMMAssetStatusBadgeView preferredSize](PXCMMAssetStatusBadgeView, "preferredSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)getAdditionalAccessoryTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forTileKind:(unint64_t)a7 contentTileGeometry:(const PXTileGeometry *)a8 indexPath:(PXSimpleIndexPath *)a9
{
  __int128 v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  if (a7 == 8439964)
  {
    v11 = *(_OWORD *)&a9->item;
    v12 = *(_OWORD *)&a9->dataSourceIdentifier;
    v13 = v11;
    return -[PXCMMEngineDrivenLayout _getAssetStatusTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getAssetStatusTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", a3, a4, a5, a6, a8, &v12);
  }
  else if (a7 == 8439952)
  {
    v9 = *(_OWORD *)&a9->item;
    v12 = *(_OWORD *)&a9->dataSourceIdentifier;
    v13 = v9;
    return -[PXCMMEngineDrivenLayout _getDuplicateTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getDuplicateTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", a3, a4, a5, a6, a8, &v12);
  }
  else
  {
    return 0;
  }
}

- (BOOL)_getDuplicateTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  void *v15;
  __int128 v16;
  int v17;
  __int128 v18;
  __int128 v19;
  CGPoint origin;
  CGSize size;
  CGSize v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  double zPosition;
  double v30;
  _OWORD v32[2];

  if (a7->hidden)
    return 0;
  -[PXEngineDrivenAssetsTilingLayout delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&a8->item;
  v32[0] = *(_OWORD *)&a8->dataSourceIdentifier;
  v32[1] = v16;
  v17 = objc_msgSend(v15, "engineDrivenLayout:shouldShowDimmingOverlayAtIndexPath:", self, v32);

  if (!v17)
    return 0;
  v18 = *(_OWORD *)&a8->dataSourceIdentifier;
  v19 = *(_OWORD *)&a8->item;
  *(_OWORD *)&a3->length = xmmword_1A7C0C380;
  *(_OWORD *)&a3->index[1] = v18;
  *(_OWORD *)&a3->index[3] = v19;
  *(_OWORD *)&a3->index[5] = 0u;
  *(_OWORD *)&a3->index[7] = 0u;
  a3->index[9] = 0;
  origin = a7->frame.origin;
  size = a7->frame.size;
  v22 = a7->size;
  a4->center = a7->center;
  a4->size = v22;
  a4->frame.origin = origin;
  a4->frame.size = size;
  v23 = *(_OWORD *)&a7->transform.a;
  v24 = *(_OWORD *)&a7->transform.c;
  v25 = *(_OWORD *)&a7->alpha;
  *(_OWORD *)&a4->transform.tx = *(_OWORD *)&a7->transform.tx;
  *(_OWORD *)&a4->alpha = v25;
  *(_OWORD *)&a4->transform.a = v23;
  *(_OWORD *)&a4->transform.c = v24;
  v26 = *(_OWORD *)&a7->hidden;
  v27 = *(_OWORD *)&a7->contentSize.height;
  v28 = *(_OWORD *)&a7->contentsRect.size.height;
  *(_OWORD *)&a4->contentsRect.origin.y = *(_OWORD *)&a7->contentsRect.origin.y;
  *(_OWORD *)&a4->contentsRect.size.height = v28;
  *(_OWORD *)&a4->hidden = v26;
  *(_OWORD *)&a4->contentSize.height = v27;
  zPosition = a7->zPosition;
  -[PXCMMEngineDrivenLayout zPositionOffsetForKind:](self, "zPositionOffsetForKind:", 8439952);
  a4->zPosition = zPosition + v30;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  return 1;
}

- (BOOL)_getAssetStatusTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  void *v15;
  __int128 v16;
  int v17;
  __int128 v18;
  __int128 v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  uint64_t v29;
  __int128 v30;
  CGPoint v31;
  double zPosition;
  double v33;
  void *v34;
  __int128 v35;
  unint64_t v36;
  void *v37;
  id v39;
  __int128 v40;
  __int128 v41;

  if (a7->hidden)
    return 0;
  -[PXEngineDrivenAssetsTilingLayout delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&a8->item;
  v40 = *(_OWORD *)&a8->dataSourceIdentifier;
  v41 = v16;
  v17 = objc_msgSend(v15, "engineDrivenLayout:shouldShowStatusBadgeAtIndexPath:", self, &v40);

  if (!v17)
    return 0;
  v18 = *(_OWORD *)&a8->dataSourceIdentifier;
  v19 = *(_OWORD *)&a8->item;
  *(_OWORD *)&a3->length = xmmword_1A7C0C390;
  *(_OWORD *)&a3->index[1] = v18;
  *(_OWORD *)&a3->index[3] = v19;
  *(_OWORD *)&a3->index[5] = 0u;
  *(_OWORD *)&a3->index[7] = 0u;
  a3->index[9] = 0;
  -[PXCMMEngineDrivenLayout _preferredSelectionBadgeSize](self, "_preferredSelectionBadgeSize");
  v21 = v20;
  v23 = v22;
  v24 = CGRectGetMaxX(a7->frame) - v20;
  v25 = CGRectGetMaxY(a7->frame) - v23;
  v26 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
  PXRectGetCenter();
  a4->frame.origin.x = v24;
  a4->frame.origin.y = v25;
  a4->frame.size.width = v21;
  a4->frame.size.height = v23;
  a4->center.x = v27;
  a4->center.y = v28;
  a4->size.width = v21;
  a4->size.height = v23;
  v29 = MEMORY[0x1E0C9BAA8];
  v30 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&a4->transform.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&a4->transform.c = v30;
  *(_OWORD *)&a4->transform.tx = *(_OWORD *)(v29 + 32);
  a4->zPosition = 0.0;
  *(_QWORD *)&a4->hidden = 0;
  a4->alpha = 1.0;
  a4->contentSize.width = v21;
  a4->contentSize.height = v23;
  v31 = *(CGPoint *)off_1E50B86D0;
  a4->contentsRect.size = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
  a4->contentsRect.origin = v31;
  a4->coordinateSpaceIdentifier = v26;
  zPosition = a7->zPosition;
  -[PXCMMEngineDrivenLayout zPositionOffsetForKind:](self, "zPositionOffsetForKind:", 8439964);
  a4->zPosition = zPosition + v33;
  if (a5)
    *a5 = 48;
  if (a6)
  {
    -[PXEngineDrivenAssetsTilingLayout delegate](self, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *(_OWORD *)&a8->item;
    v40 = *(_OWORD *)&a8->dataSourceIdentifier;
    v41 = v35;
    v36 = objc_msgSend(v34, "engineDrivenLayout:assetStatusAtIndexPath:", self, &v40);

    if (v36 < 2)
    {
      v39 = 0;
LABEL_14:
      *a6 = v39;
      return 1;
    }
    if (v36 == -1)
    {
      -[PXCMMEngineDrivenLayout _failedUserData](self, "_failedUserData");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (v36 == 2)
    {
      -[PXCMMEngineDrivenLayout _copiedUserData](self, "_copiedUserData");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v39 = v37;
      goto LABEL_14;
    }
  }
  return 1;
}

- (double)zPositionOffsetForKind:(unint64_t)a3
{
  double result;
  objc_super v4;

  if (a3 == 8439952)
    return 35.0;
  if (a3 == 8439964)
    return 30.0;
  v4.receiver = self;
  v4.super_class = (Class)PXCMMEngineDrivenLayout;
  -[PXAssetsTilingLayout zPositionOffsetForKind:](&v4, sel_zPositionOffsetForKind_);
  return result;
}

- (BOOL)getAdditionalTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4 layoutGeometryKind:(unint64_t)a5 indexPath:(PXSimpleIndexPath *)a6
{
  int64_t v11;
  __int128 v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v11 = -[PXCMMEngineDrivenLayout layoutType](self, "layoutType");
  if ((unint64_t)(v11 - 2) < 3 || v11 == 0)
  {
    v13 = *(_OWORD *)&a6->item;
    v16 = *(_OWORD *)&a6->dataSourceIdentifier;
    v17 = v13;
    return -[PXCMMEngineDrivenLayout _getAdditionalTileIdentifierForGrid:group:layoutGeometryKind:indexPath:](self, "_getAdditionalTileIdentifierForGrid:group:layoutGeometryKind:indexPath:", a3, a4, a5, &v16);
  }
  else if (v11 == 1)
  {
    v15 = *(_OWORD *)&a6->item;
    v16 = *(_OWORD *)&a6->dataSourceIdentifier;
    v17 = v15;
    return -[PXCMMEngineDrivenLayout _getAdditionalTileIdentifierForEditorial:group:layoutGeometryKind:indexPath:](self, "_getAdditionalTileIdentifierForEditorial:group:layoutGeometryKind:indexPath:", a3, a4, a5, &v16);
  }
  else
  {
    return 0;
  }
}

- (BOOL)_getAdditionalTileIdentifierForGrid:(PXTileIdentifier *)a3 group:(unint64_t *)a4 layoutGeometryKind:(int64_t)a5 indexPath:(PXSimpleIndexPath *)a6
{
  unint64_t v6;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = 8439962;
  if (a5 == 1)
  {
    v8 = 0;
    goto LABEL_5;
  }
  if (a5 == 2)
  {
    v6 = 8439963;
    v8 = 42;
LABEL_5:
    v9 = *(_OWORD *)&a6->dataSourceIdentifier;
    v10 = *(_OWORD *)&a6->item;
    a3->length = 5;
    a3->index[0] = v6;
    *(_OWORD *)&a3->index[1] = v9;
    *(_OWORD *)&a3->index[3] = v10;
    *(_OWORD *)&a3->index[5] = 0u;
    *(_OWORD *)&a3->index[7] = 0u;
    a3->index[9] = 0;
    *a4 = v8;
    return 1;
  }
  PXAssertGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = 136315394;
    v14 = "-[PXCMMEngineDrivenLayout _getAdditionalTileIdentifierForGrid:group:layoutGeometryKind:indexPath:]";
    v15 = 2048;
    v16 = a5;
    _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "%s: Encountered unexpected layoutGeometryKind: %lu", (uint8_t *)&v13, 0x16u);
  }

  return 0;
}

- (BOOL)_getAdditionalTileIdentifierForEditorial:(PXTileIdentifier *)a3 group:(unint64_t *)a4 layoutGeometryKind:(int64_t)a5 indexPath:(PXSimpleIndexPath *)a6
{
  __int128 v7;
  __int128 v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a5 == 1)
  {
    v7 = *(_OWORD *)&a6->dataSourceIdentifier;
    v8 = *(_OWORD *)&a6->item;
    *(_OWORD *)&a3->length = xmmword_1A7C0C3A0;
    *(_OWORD *)&a3->index[1] = v7;
    *(_OWORD *)&a3->index[3] = v8;
    *(_OWORD *)&a3->index[5] = 0u;
    *(_OWORD *)&a3->index[7] = 0u;
    a3->index[9] = 0;
    *a4 = 42;
  }
  else
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[PXCMMEngineDrivenLayout _getAdditionalTileIdentifierForEditorial:group:layoutGeometryKind:indexPath:]";
      v13 = 2048;
      v14 = a5;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "%s: Encountered unexpected layoutGeometryKind: %lu", (uint8_t *)&v11, 0x16u);
    }

  }
  return a5 == 1;
}

- (void)adjustGeometry:(PXTileGeometry *)a3 forAdditionalTileWithKind:(unint64_t)a4 indexPath:(PXSimpleIndexPath *)a5
{
  int64_t v9;
  double y;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGFloat x;
  CGFloat v25;
  CGFloat width;
  CGFloat height;
  CGRect v28;
  CGRect v29;

  v9 = -[PXCMMEngineDrivenLayout layoutType](self, "layoutType");
  if ((unint64_t)(v9 - 2) >= 3)
  {
    if (v9 == 1)
    {
      if (a4 != 1)
        return;
      goto LABEL_5;
    }
    if (v9)
      return;
  }
  if (a4 != 2)
    return;
LABEL_5:
  y = a3->frame.origin.y;
  if (-[PXCMMEngineDrivenLayout hasFloatingSectionHeaders](self, "hasFloatingSectionHeaders"))
  {
    -[PXTilingLayout contentInset](self, "contentInset");
    v12 = v11;
    -[PXTilingLayout visibleOrigin](self, "visibleOrigin");
    if (v12 + v13 > y)
    {
      a3->zPosition = 40.0;
      -[PXTilingLayout contentInset](self, "contentInset", v12 + v13);
      v15 = v14;
      -[PXTilingLayout visibleOrigin](self, "visibleOrigin");
      v17 = v15 + v16 - y;
      a3->center.y = a3->center.y + v17;
      a3->frame.origin.y = a3->frame.origin.y + v17;
      objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathForItem:inSection:withKind:", 0, a5->section + 1, a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXEngineDrivenAssetsTilingLayout layoutSnapshot](self, "layoutSnapshot");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
        objc_msgSend(v19, "geometryForItem:", v18);

      v21 = 0.0;
      -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
      PXRectWithCenterAndSize();
      v23 = v22;
      PXRectGetCenter();
      x = a3->frame.origin.x;
      v25 = a3->frame.origin.y;
      width = a3->frame.size.width;
      height = a3->frame.size.height;
      v28.origin.x = a3->frame.origin.x;
      v28.origin.y = v25;
      v28.size.width = width;
      v28.size.height = height;
      if (CGRectGetMaxY(v28) > v23)
      {
        v29.origin.x = x;
        v29.origin.y = v25;
        v29.size.width = width;
        v29.size.height = height;
        v21 = v23 - CGRectGetMaxY(v29) + 0.0;
      }
      a3->center.y = v21 + a3->center.y;
      a3->frame.origin.y = v21 + a3->frame.origin.y;

    }
  }
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (double)bannerHeight
{
  return self->_bannerHeight;
}

- (double)statusFooterHeight
{
  return self->_statusFooterHeight;
}

- (int64_t)placeholderMode
{
  return self->_placeholderMode;
}

- (void)setHeaderViewIsVisible:(BOOL)a3
{
  self->_headerViewIsVisible = a3;
}

- (BOOL)hasFloatingBanner
{
  return self->_hasFloatingBanner;
}

- (BOOL)hasFloatingSectionHeaders
{
  return self->_hasFloatingSectionHeaders;
}

- (double)headerTopInset
{
  return self->_headerTopInset;
}

- (double)footerBottomInset
{
  return self->_footerBottomInset;
}

- (double)headerFooterSideInset
{
  return self->_headerFooterSideInset;
}

- (UIEdgeInsets)reviewSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_reviewSafeAreaInsets.top;
  left = self->_reviewSafeAreaInsets.left;
  bottom = self->_reviewSafeAreaInsets.bottom;
  right = self->_reviewSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PXCMMAssetStatusBadgeTileUserData)_copiedUserData
{
  return self->__copiedUserData;
}

- (PXCMMAssetStatusBadgeTileUserData)_failedUserData
{
  return self->__failedUserData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__failedUserData, 0);
  objc_storeStrong((id *)&self->__copiedUserData, 0);
}

+ (id)_additionalTileKinds
{
  if (_additionalTileKinds_onceToken != -1)
    dispatch_once(&_additionalTileKinds_onceToken, &__block_literal_global_35836);
  return (id)_additionalTileKinds_additionalTileKinds;
}

void __47__PXCMMEngineDrivenLayout__additionalTileKinds__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", 8439962);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addIndex:", 8439963);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexSet:", v2);
  v1 = (void *)_additionalTileKinds_additionalTileKinds;
  _additionalTileKinds_additionalTileKinds = v0;

}

@end

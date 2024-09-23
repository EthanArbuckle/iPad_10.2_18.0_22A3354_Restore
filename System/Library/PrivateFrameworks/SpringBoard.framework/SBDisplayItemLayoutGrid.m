@implementation SBDisplayItemLayoutGrid

- (SBDisplayItemLayoutGrid)init
{
  SBDisplayItemLayoutGrid *v2;
  uint64_t v3;
  NSMutableDictionary *gridCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDisplayItemLayoutGrid;
  v2 = -[SBDisplayItemLayoutGrid init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    gridCache = v2->_gridCache;
    v2->_gridCache = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (CGSize)nearestGridSizeForProposedSize:(CGSize)a3 countOnStage:(unint64_t)a4 inBounds:(CGRect)a5 contentOrientation:(int64_t)a6 layoutRestrictionInfo:(id)a7 screenScale:(double)a8 chamoisLayoutAttributes:(id)a9
{
  double height;
  double width;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SBDisplayItemLayoutGrid _gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:](self, "_gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", a6, a7, a9, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nearestGridSizeForSize:countOnStage:", a4, width, height);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)minGridSizeForBounds:(CGRect)a3 contentOrientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[SBDisplayItemLayoutGrid _gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:](self, "_gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", a4, a5, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minSize");
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)maxGridSizeForBounds:(CGRect)a3 contentOrientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[SBDisplayItemLayoutGrid _gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:](self, "_gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", a4, a5, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maxSize");
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (id)allGridWidthsForBounds:(CGRect)a3 contentOrientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7
{
  void *v7;
  void *v8;

  -[SBDisplayItemLayoutGrid _gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:](self, "_gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", a4, a5, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allWidths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allGridHeightsForBounds:(CGRect)a3 contentOrientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7
{
  void *v7;
  void *v8;

  -[SBDisplayItemLayoutGrid _gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:](self, "_gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", a4, a5, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allHeights");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_gridForBounds:(CGRect)a3 contentOrientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  _SBDisplayItemGridCacheKey *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  _SBDisplayItemSingleSizeGrid *v25;
  double v26;
  double v27;
  _SBDisplayItemFixedAspectGrid *v28;
  double v29;
  double v30;
  _BOOL8 v31;
  double v32;
  double v33;
  CGRect v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a5;
  v16 = a7;
  v17 = -[_SBDisplayItemGridCacheKey initWithBounds:orientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:]([_SBDisplayItemGridCacheKey alloc], "initWithBounds:orientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", a4, v15, v16, x, y, width, height, a6);
  -[NSMutableDictionary objectForKey:](self->_gridCache, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v19 = objc_msgSend(v15, "layoutRestrictions");
    if (v19)
    {
      v20 = v19;
      if ((v19 & 4) != 0)
      {
        v25 = [_SBDisplayItemSingleSizeGrid alloc];
        v26 = width;
        v27 = height;
      }
      else
      {
        if ((v19 & 2) != 0)
        {
          objc_msgSend(v15, "restrictedSize");
          v31 = (v20 & 8) == 0;
          if ((unint64_t)(a4 - 3) >= 2)
            v32 = v30;
          else
            v32 = v29;
          if ((unint64_t)(a4 - 3) >= 2)
            v33 = v29;
          else
            v33 = v30;
          v28 = -[_SBDisplayItemFixedAspectGrid initWithBounds:fixedSize:screenScale:supportsOrthogonalSizes:chamoisLayoutAttributes:]([_SBDisplayItemFixedAspectGrid alloc], "initWithBounds:fixedSize:screenScale:supportsOrthogonalSizes:chamoisLayoutAttributes:", v31, v16, x, y, width, height, v33, v32, a6);
          goto LABEL_18;
        }
        SBLogCommon();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);

        if (v22)
        {
          v35.origin.x = x;
          v35.origin.y = y;
          v35.size.width = width;
          v35.size.height = height;
          NSStringFromCGRect(v35);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          BSInterfaceOrientationDescription();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("Unsupported layout restrictions permutation: %ld (%@, %@)"), v20, v23, v24);

        }
        v25 = [_SBDisplayItemSingleSizeGrid alloc];
        v26 = 276.0;
        v27 = 314.0;
      }
      v28 = -[_SBDisplayItemSingleSizeGrid initWithSize:](v25, "initWithSize:", v26, v27);
    }
    else
    {
      v28 = -[_SBDisplayItemFlexibleGrid initWithBounds:screenScale:chamoisLayoutAttributes:]([_SBDisplayItemFlexibleGrid alloc], "initWithBounds:screenScale:chamoisLayoutAttributes:", v16, x, y, width, height, a6);
    }
LABEL_18:
    v18 = v28;
    -[NSMutableDictionary setObject:forKey:](self->_gridCache, "setObject:forKey:", v28, v17);
  }

  return v18;
}

- (NSString)description
{
  return (NSString *)-[SBDisplayItemLayoutGrid descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", &stru_1E8EC7EC0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBDisplayItemLayoutGrid descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_gridCache, CFSTR("gridCache"));
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBDisplayItemLayoutGrid succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridCache, 0);
}

@end

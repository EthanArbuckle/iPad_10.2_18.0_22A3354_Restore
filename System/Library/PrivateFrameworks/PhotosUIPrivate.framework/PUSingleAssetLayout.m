@implementation PUSingleAssetLayout

- (void)_invalidateSingleAssetLayout
{
  void *v3;
  void *v4;
  PUTilingLayoutInvalidationContext *v5;

  v5 = objc_alloc_init(PUTilingLayoutInvalidationContext);
  -[PUSingleAssetLayout assetReference](self, "assetReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[PUTilingLayoutInvalidationContext invalidateTileWithIndexPath:kind:](v5, "invalidateTileWithIndexPath:kind:", v4, CFSTR("PUTileKindItemContent"));
  -[PUTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);

}

- (void)setAssetRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_assetRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_assetRect = &self->_assetRect;
  if (!CGRectEqualToRect(a3, self->_assetRect))
  {
    p_assetRect->origin.x = x;
    p_assetRect->origin.y = y;
    p_assetRect->size.width = width;
    p_assetRect->size.height = height;
    -[PUSingleAssetLayout _invalidateSingleAssetLayout](self, "_invalidateSingleAssetLayout");
  }
}

- (void)setCropInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_cropInsets.left
    || a3.top != self->_cropInsets.top
    || a3.right != self->_cropInsets.right
    || a3.bottom != self->_cropInsets.bottom)
  {
    self->_cropInsets = a3;
    -[PUSingleAssetLayout _invalidateSingleAssetLayout](self, "_invalidateSingleAssetLayout");
  }
}

- (void)setContentsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentsRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(a3, self->_contentsRect))
  {
    p_contentsRect->origin.x = x;
    p_contentsRect->origin.y = y;
    p_contentsRect->size.width = width;
    p_contentsRect->size.height = height;
    -[PUSingleAssetLayout _invalidateSingleAssetLayout](self, "_invalidateSingleAssetLayout");
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[PUSingleAssetLayout _invalidateSingleAssetLayout](self, "_invalidateSingleAssetLayout");
  }
}

- (void)setCornerCurve:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *cornerCurve;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_cornerCurve;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      cornerCurve = self->_cornerCurve;
      self->_cornerCurve = v6;

      -[PUSingleAssetLayout _invalidateSingleAssetLayout](self, "_invalidateSingleAssetLayout");
    }
  }

}

- (void)setCornerMask:(unint64_t)a3
{
  if (self->_cornerMask != a3)
  {
    self->_cornerMask = a3;
    -[PUSingleAssetLayout _invalidateSingleAssetLayout](self, "_invalidateSingleAssetLayout");
  }
}

- (CGRect)contentBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PUTilingLayout visibleRect](self, "visibleRect");
  v6 = v2;
  v7 = v3;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (id)layoutInfosForTilesInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[2];
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19[1] = *MEMORY[0x1E0C80C00];
  -[PUSingleAssetLayout assetRect](self, "assetRect");
  v21.origin.x = v8;
  v21.origin.y = v9;
  v21.size.width = v10;
  v21.size.height = v11;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  if (CGRectIntersectsRect(v20, v21))
  {
    -[PUSingleAssetLayout assetReference](self, "assetReference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSingleAssetLayout layoutInfoForTileWithIndexPath:kind:](self, "layoutInfoForTileWithIndexPath:kind:", v13, CFSTR("PUTileKindItemContent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  if (v15)
    v16 = v15;
  else
    v16 = (void *)MEMORY[0x1E0C9AA60];
  v17 = v16;

  return v17;
}

- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  PUCroppedTileLayoutInfo *v33;
  void *v35;
  PUCroppedTileLayoutInfo *v36;
  double MidX;
  double MidY;
  void *v39;
  __int128 v40;
  uint64_t v41;
  double v42;
  CGFloat v43;
  uint64_t v44;
  CGFloat v45;
  double v46;
  double v47;
  _OWORD v48[4];
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v6 = a3;
  v7 = a4;
  -[PUSingleAssetLayout assetReference](self, "assetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSingleAssetLayout assetRect](self, "assetRect");
  v43 = v10;
  v45 = v11;
  v46 = v12;
  v47 = v13;
  -[PUSingleAssetLayout cornerRadius](self, "cornerRadius");
  v44 = v14;
  -[PUSingleAssetLayout cornerCurve](self, "cornerCurve");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PUSingleAssetLayout cornerMask](self, "cornerMask");
  -[PUSingleAssetLayout cropInsets](self, "cropInsets");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[PUSingleAssetLayout contentsRect](self, "contentsRect");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  if (!objc_msgSend(v6, "isEqual:", v9))
    goto LABEL_5;
  v41 = v30;
  v42 = v24;
  if (!objc_msgSend(v7, "isEqual:", CFSTR("PUTileKindItemContent")))
    goto LABEL_5;
  v49.origin.x = v43;
  v49.origin.y = v45;
  v49.size.width = v47;
  v49.size.height = v46;
  if (CGRectIsInfinite(v49))
    goto LABEL_5;
  v50.origin.x = v43;
  v50.origin.y = v45;
  v50.size.width = v47;
  v50.size.height = v46;
  if (!CGRectIsNull(v50))
  {
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v6, v7);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = [PUCroppedTileLayoutInfo alloc];
    v51.origin.x = v43;
    v51.origin.y = v45;
    v51.size.width = v47;
    v51.size.height = v46;
    MidX = CGRectGetMidX(v51);
    v52.origin.x = v43;
    v52.origin.y = v45;
    v52.size.width = v47;
    v52.size.height = v46;
    MidY = CGRectGetMidY(v52);
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v48[0] = *MEMORY[0x1E0C9BAA8];
    v48[1] = v40;
    v48[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v33 = -[PUCroppedTileLayoutInfo initWithTileIdentifier:center:size:cropInsets:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:](v36, "initWithTileIdentifier:center:size:cropInsets:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:", v35, v15, v16, v48, v39, MidX, MidY, v47, v46, v18, v20, v22, v42, 0x3FF0000000000000, v44, 0,
            v26,
            v28,
            v41,
            v32);

  }
  else
  {
LABEL_5:
    v33 = 0;
  }

  return v33;
}

- (PUAssetReference)assetReference
{
  return self->_assetReference;
}

- (void)setAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_assetReference, a3);
}

- (CGRect)assetRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_assetRect.origin.x;
  y = self->_assetRect.origin.y;
  width = self->_assetRect.size.width;
  height = self->_assetRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIEdgeInsets)cropInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_cropInsets.top;
  left = self->_cropInsets.left;
  bottom = self->_cropInsets.bottom;
  right = self->_cropInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (NSString)cornerCurve
{
  return self->_cornerCurve;
}

- (unint64_t)cornerMask
{
  return self->_cornerMask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerCurve, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
}

@end

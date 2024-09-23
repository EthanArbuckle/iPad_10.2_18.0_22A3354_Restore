@implementation BKLibraryBookshelfCoverLayer

- (BKLibraryBookshelfCoverLayer)init
{
  BKLibraryBookshelfCoverLayer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfCoverLayer;
  result = -[BKLibraryBookshelfCoverLayer init](&v3, "init");
  if (result)
    result->_bottomAligned = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[BKLibraryBookshelfCoverLayer setLibraryAsset:](self, "setLibraryAsset:", 0);
  -[BKLibraryBookshelfCoverLayer setCoverEffectsEnvironment:](self, "setCoverEffectsEnvironment:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfCoverLayer;
  -[BKLibraryBookshelfCoverLayer dealloc](&v3, "dealloc");
}

- (void)_layoutImagelayer
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double Width;
  double v20;
  double Height;
  double v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  double MidX;
  double MaxY;
  double v29;
  void *v30;
  CGFloat rect;
  CGFloat rect_8;
  CGRect rect_16;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  -[BKLibraryBookshelfCoverLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  rect_16.size.width = v7;
  rect_16.size.height = v9;
  rect_16.origin.x = v3;
  rect_16.origin.y = v5;
  if (-[BKLibraryBookshelfCoverLayer animateFrameChange](self, "animateFrameChange"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer imageLayer](self, "imageLayer"));
    objc_msgSend(v11, "bounds");
    v13 = v12;
    rect = v12;
    rect_8 = v14;
    v16 = v15;
    v18 = v17;

    v36.origin.x = v4;
    v36.origin.y = v6;
    v36.size.width = v8;
    v36.size.height = v10;
    Width = CGRectGetWidth(v36);
    v37.origin.x = v13;
    v37.origin.y = rect_8;
    v37.size.width = v16;
    v37.size.height = v18;
    v20 = Width / CGRectGetWidth(v37);
    v38.origin.x = v4;
    v38.origin.y = v6;
    v38.size.width = v8;
    v38.size.height = v10;
    Height = CGRectGetHeight(v38);
    v39.origin.x = rect;
    v39.origin.y = rect_8;
    v39.size.width = v16;
    v39.size.height = v18;
    v22 = Height / CGRectGetHeight(v39);
    if (v20 < v22)
      v22 = v20;
    CGAffineTransformMakeScale(&v35, v22, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer imageLayer](self, "imageLayer"));
    v34 = v35;
    objc_msgSend(v23, "setAffineTransform:", &v34);

  }
  else
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  }
  v24 = -[BKLibraryBookshelfCoverLayer bottomAligned](self, "bottomAligned", *(_QWORD *)&rect);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer imageLayer](self, "imageLayer"));
  v26 = v25;
  if (v24)
  {
    objc_msgSend(v25, "setAnchorPoint:", 0.5, 1.0);

    MidX = CGRectGetMidX(rect_16);
    MaxY = CGRectGetMaxY(rect_16);
  }
  else
  {
    objc_msgSend(v25, "setAnchorPoint:", 0.5, 0.5);

    MidX = CGRectGetMidX(rect_16);
    MaxY = CGRectGetMidY(rect_16);
  }
  v29 = MaxY;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer imageLayer](self, "imageLayer"));
  objc_msgSend(v30, "setPosition:", MidX, v29);

  if (!-[BKLibraryBookshelfCoverLayer animateFrameChange](self, "animateFrameChange"))
    +[CATransaction commit](CATransaction, "commit");
}

- (CGRect)coverBounds
{
  void *v2;
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
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer imageLayer](self, "imageLayer"));
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setLibraryAsset:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  BKLibraryAsset *v8;
  BKLibraryAsset *libraryAsset;
  double v10;
  double v11;
  UIBezierPath *boundingPath;
  BKLibraryAsset *v14;

  height = a4.height;
  width = a4.width;
  v8 = (BKLibraryAsset *)a3;
  libraryAsset = self->_libraryAsset;
  v14 = v8;
  if (libraryAsset == v8)
  {
    -[BKLibraryBookshelfCoverLayer coverSize](self, "coverSize");
    if (v11 == width && v10 == height)
      goto LABEL_10;
    libraryAsset = self->_libraryAsset;
    v8 = v14;
  }
  if (libraryAsset != v8)
    -[BKLibraryBookshelfCoverLayer setPreloadedImageLayer:](self, "setPreloadedImageLayer:", 0);
  objc_storeStrong((id *)&self->_libraryAsset, a3);
  boundingPath = self->_boundingPath;
  self->_boundingPath = 0;

  -[BKLibraryBookshelfCoverLayer setCoverSize:](self, "setCoverSize:", width, height);
  -[BKLibraryBookshelfCoverLayer _reloadCoverImage](self, "_reloadCoverImage");
LABEL_10:

}

- (void)preloadCoverImageAtSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer libraryAsset](self, "libraryAsset"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "permanentOrTemporaryAssetID"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer libraryAsset](self, "libraryAsset"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer coverEffectsEnvironment](self, "coverEffectsEnvironment"));
    v11 = +[BKLibraryManager processingOptionsFor:coverEffectsEnvironment:](BKLibraryManager, "processingOptionsFor:coverEffectsEnvironment:", v9, v10);

    v12 = objc_opt_class(BCCacheVendedLayer);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer _cachedCoverIdentifier](self, "_cachedCoverIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fetchLayerForAssetID:size:options:", v14, v11, width, height));
    v16 = BUDynamicCast(v12, v15);
    v18 = (id)objc_claimAutoreleasedReturnValue(v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer vendedLayerDelegate](self, "vendedLayerDelegate"));
    objc_msgSend(v18, "setVendedLayerDelegate:", v17);

    -[BKLibraryBookshelfCoverLayer setPreloadedImageLayer:](self, "setPreloadedImageLayer:", v18);
  }
}

- (void)_reloadCoverImage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer imageLayer](self, "imageLayer"));
  objc_msgSend(v3, "removeFromSuperlayer");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer libraryAsset](self, "libraryAsset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "permanentOrTemporaryAssetID"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v27 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer preloadedImageLayer](self, "preloadedImageLayer"));
    if (v27)
    {
      -[BKLibraryBookshelfCoverLayer coverSize](self, "coverSize");
      v9 = CGSizeScaleToScreen(v7, v8);
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "describedImageRequested"));
      objc_msgSend(v12, "imageSize");
      v14 = v13;
      v16 = v15;

      if (v14 == v9 && v16 == v11)
      {
        +[CATransaction begin](CATransaction, "begin");
        +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
        -[BKLibraryBookshelfCoverLayer addSublayer:](self, "addSublayer:", v27);
        -[BKLibraryBookshelfCoverLayer setImageLayer:](self, "setImageLayer:", v27);
        -[BKLibraryBookshelfCoverLayer _layoutImagelayer](self, "_layoutImagelayer");
        +[CATransaction commit](CATransaction, "commit");
        -[BKLibraryBookshelfCoverLayer setPreloadedImageLayer:](self, "setPreloadedImageLayer:", 0);
LABEL_9:

        return;
      }
      -[BKLibraryBookshelfCoverLayer setPreloadedImageLayer:](self, "setPreloadedImageLayer:", 0);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer libraryAsset](self, "libraryAsset"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer coverEffectsEnvironment](self, "coverEffectsEnvironment"));
    v19 = +[BKLibraryManager processingOptionsFor:coverEffectsEnvironment:](BKLibraryManager, "processingOptionsFor:coverEffectsEnvironment:", v17, v18);

    v20 = objc_opt_class(BCCacheVendedLayer);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer _cachedCoverIdentifier](self, "_cachedCoverIdentifier"));
    -[BKLibraryBookshelfCoverLayer coverSize](self, "coverSize");
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "fetchLayerForAssetID:size:options:", v22, v19));
    v24 = BUDynamicCast(v20, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer vendedLayerDelegate](self, "vendedLayerDelegate"));
    objc_msgSend(v25, "setVendedLayerDelegate:", v26);

    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[BKLibraryBookshelfCoverLayer addSublayer:](self, "addSublayer:", v25);
    -[BKLibraryBookshelfCoverLayer setImageLayer:](self, "setImageLayer:", v25);
    -[BKLibraryBookshelfCoverLayer _layoutImagelayer](self, "_layoutImagelayer");
    +[CATransaction commit](CATransaction, "commit");

    goto LABEL_9;
  }
}

- (id)_cachedCoverIdentifier
{
  void *v2;
  void *v3;
  unsigned int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer libraryAsset](self, "libraryAsset"));
  v4 = objc_msgSend(v3, "iTunesU");
  if (v4)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "temporaryAssetID"));
    if (objc_msgSend(v2, "length"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "temporaryAssetID"));
LABEL_5:

      goto LABEL_6;
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "permanentOrTemporaryAssetID"));
  if (v4)
    goto LABEL_5;
LABEL_6:

  return v5;
}

- (UIBezierPath)boundingPath
{
  void *v3;
  void *v4;
  id v5;
  UIBezierPath *v6;
  UIBezierPath *boundingPath;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double Height;
  double v17;
  CGFloat v18;
  UIBezierPath *v19;
  CGFloat MinX;
  CGAffineTransform v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  if (!self->_boundingPath)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverLayer imageLayer](self, "imageLayer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "describedImageShown"));
    v5 = objc_msgSend(v4, "stackOutline");

    if (v5)
    {
      v6 = (UIBezierPath *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", v5));
      boundingPath = self->_boundingPath;
      self->_boundingPath = v6;

      -[UIBezierPath bounds](self->_boundingPath, "bounds");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[BKLibraryBookshelfCoverLayer bounds](self, "bounds");
      Height = CGRectGetHeight(v23);
      v24.origin.x = v9;
      v24.origin.y = v11;
      v24.size.width = v13;
      v24.size.height = v15;
      v17 = Height - CGRectGetHeight(v24);
      v25.origin.x = v9;
      v25.origin.y = v11;
      v25.size.width = v13;
      v25.size.height = v15;
      v18 = v17 - CGRectGetMinY(v25);
      v19 = self->_boundingPath;
      v26.origin.x = v9;
      v26.origin.y = v11;
      v26.size.width = v13;
      v26.size.height = v15;
      MinX = CGRectGetMinX(v26);
      CGAffineTransformMakeTranslation(&v22, -MinX, v18);
      -[UIBezierPath applyTransform:](v19, "applyTransform:", &v22);
    }
  }
  return self->_boundingPath;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BKLibraryAsset)libraryAsset
{
  return self->_libraryAsset;
}

- (void)setLibraryAsset:(id)a3
{
  objc_storeStrong((id *)&self->_libraryAsset, a3);
}

- (BCUCoverEffectsEnvironment)coverEffectsEnvironment
{
  return (BCUCoverEffectsEnvironment *)objc_loadWeakRetained((id *)&self->_coverEffectsEnvironment);
}

- (void)setCoverEffectsEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_coverEffectsEnvironment, a3);
}

- (BOOL)bottomAligned
{
  return self->_bottomAligned;
}

- (void)setBottomAligned:(BOOL)a3
{
  self->_bottomAligned = a3;
}

- (BOOL)animateFrameChange
{
  return self->_animateFrameChange;
}

- (void)setAnimateFrameChange:(BOOL)a3
{
  self->_animateFrameChange = a3;
}

- (void)setBoundingPath:(id)a3
{
  objc_storeStrong((id *)&self->_boundingPath, a3);
}

- (CGSize)coverSize
{
  double width;
  double height;
  CGSize result;

  width = self->_coverSize.width;
  height = self->_coverSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCoverSize:(CGSize)a3
{
  self->_coverSize = a3;
}

- (BCCacheVendedLayerDelegate)vendedLayerDelegate
{
  return self->_vendedLayerDelegate;
}

- (void)setVendedLayerDelegate:(id)a3
{
  self->_vendedLayerDelegate = (BCCacheVendedLayerDelegate *)a3;
}

- (BCCacheVendedLayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_imageLayer, a3);
}

- (BCCacheVendedLayer)preloadedImageLayer
{
  return self->_preloadedImageLayer;
}

- (void)setPreloadedImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_preloadedImageLayer, a3);
}

- (CGRect)coverFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_coverFrame.origin.x;
  y = self->_coverFrame.origin.y;
  width = self->_coverFrame.size.width;
  height = self->_coverFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCoverFrame:(CGRect)a3
{
  self->_coverFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloadedImageLayer, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_boundingPath, 0);
  objc_destroyWeak((id *)&self->_coverEffectsEnvironment);
  objc_storeStrong((id *)&self->_libraryAsset, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end

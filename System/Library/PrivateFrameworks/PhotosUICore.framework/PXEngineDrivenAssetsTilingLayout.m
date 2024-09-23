@implementation PXEngineDrivenAssetsTilingLayout

- (PXEngineDrivenAssetsTilingLayout)initWithDataSource:(id)a3
{
  PXEngineDrivenAssetsTilingLayout *v3;
  PXEngineDrivenAssetsTilingLayout *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXEngineDrivenAssetsTilingLayout;
  v3 = -[PXAssetsTilingLayout initWithDataSource:](&v6, sel_initWithDataSource_, a3);
  v4 = v3;
  if (v3)
    -[PXEngineDrivenAssetsTilingLayout _commonInit](v3, "_commonInit");
  return v4;
}

- (PXEngineDrivenAssetsTilingLayout)initWithLayoutEngineSnapshot:(id)a3
{
  id v5;
  void *v6;
  PXEngineDrivenAssetsTilingLayout *v7;
  PXEngineDrivenAssetsTilingLayout *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(v5, "dataSourceSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)PXEngineDrivenAssetsTilingLayout;
  v7 = -[PXAssetsTilingLayout initWithDataSource:](&v10, sel_initWithDataSource_, v6);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_layoutSnapshot, a3);
    -[PXEngineDrivenAssetsTilingLayout _commonInit](v8, "_commonInit");
  }

  return v8;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $D3A1CE28DF49C5974B692E500A438A8B *p_delegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToEngineDrivenLayoutReferenceSizeDidChange = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToEngineDrivenLayoutAspectRatioForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToEngineDrivenLayoutZPositionForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToEngineDrivenLayoutContentsRectForItemAtIndexPathForAspectRatio = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToEngineDrivenLayoutPlayButtonSizeForItemAtIndexPathForAspectRatio = objc_opt_respondsToSelector() & 1;
  }

}

- (BOOL)_needsUpdate
{
  return 0;
}

- (void)setReferenceSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v9;
  void *v10;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  -[PXTilingLayout referenceSize](self, "referenceSize");
  if (width != v7 || height != v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)PXEngineDrivenAssetsTilingLayout;
    -[PXTilingLayout setReferenceSize:](&v11, sel_setReferenceSize_, width, height);
    -[PXEngineDrivenAssetsTilingLayout delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (self->_delegateFlags.respondsToEngineDrivenLayoutReferenceSizeDidChange)
      objc_msgSend(v9, "engineDrivenLayoutReferenceSizeDidChange:", self);

  }
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  BOOL v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  -[PXEngineDrivenAssetsTilingLayout dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "identifier");

  v15 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
  v16 = -[PXEngineDrivenAssetsTilingLayout contentMode](self, "contentMode") == 0;
  -[PXEngineDrivenAssetsTilingLayout layoutSnapshot](self, "layoutSnapshot");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80__PXEngineDrivenAssetsTilingLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke;
  v20[3] = &unk_1E511B5C0;
  v25 = v16;
  v23 = v14;
  v24 = v15;
  v21 = v11;
  v22 = v12;
  v20[4] = self;
  v18 = v11;
  v19 = v12;
  objc_msgSend(v17, "enumerateGeometriesForItemsInRect:usingBlock:", v20, x, y, width, height);

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
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  BOOL v30;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  __int128 v42;
  __int128 v43;
  CGFloat v44;
  CGFloat v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CGSize v50;
  CGSize v51;
  void *v52;
  objc_super v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  CGPoint v68;
  CGSize v69;
  CGPoint v70;
  CGSize v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[48];

  length = a6->length;
  v12 = *((_OWORD *)off_1E50B8940 + 9);
  v76 = *((_OWORD *)off_1E50B8940 + 8);
  *(_OWORD *)v77 = v12;
  v13 = *((_OWORD *)off_1E50B8940 + 11);
  *(_OWORD *)&v77[16] = *((_OWORD *)off_1E50B8940 + 10);
  *(_OWORD *)&v77[32] = v13;
  v14 = *((_OWORD *)off_1E50B8940 + 5);
  v72 = *((_OWORD *)off_1E50B8940 + 4);
  v73 = v14;
  v15 = *((_OWORD *)off_1E50B8940 + 7);
  v74 = *((_OWORD *)off_1E50B8940 + 6);
  v75 = v15;
  v16 = (CGSize)*((_OWORD *)off_1E50B8940 + 1);
  v68 = *(CGPoint *)off_1E50B8940;
  v69 = v16;
  v17 = (CGSize)*((_OWORD *)off_1E50B8940 + 3);
  v70 = (CGPoint)*((_OWORD *)off_1E50B8940 + 2);
  v71 = v17;
  if (length - 3 <= 2
    && (v18 = a6->index[1], v18 != 0x7FFFFFFFFFFFFFFFLL)
    && length == 5
    && a6->index[0] == 6432423
    && (-[PXEngineDrivenAssetsTilingLayout dataSource](self, "dataSource"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "identifier"),
        v19,
        v18 == v20))
  {
    v21 = a6->index[1];
    v22 = a6->index[2];
    v24 = a6->index[3];
    v23 = a6->index[4];
    PXIndexPathFromSimpleIndexPath();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v58 = 0u;
    -[PXEngineDrivenAssetsTilingLayout layoutSnapshot](self, "layoutSnapshot");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      objc_msgSend(v26, "geometryForItem:", v25);
    }
    else
    {
      v67 = 0;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v58 = 0u;
    }

    v30 = (_QWORD)v58 != 0x7FFFFFFFFFFFFFFFLL;
    if ((_QWORD)v58 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (-[PXEngineDrivenAssetsTilingLayout contentMode](self, "contentMode"))
      {
        v52 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
      }
      else
      {
        v54 = v21;
        v55 = v22;
        v56 = v24;
        v57 = v23;
        -[PXEngineDrivenAssetsTilingLayout _aspectRatioForItemAtIndexPath:](self, "_aspectRatioForItemAtIndexPath:", &v54);
        v33 = v32;
        v52 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
        MEMORY[0x1A85CD660](v33, *((double *)&v59 + 1), *(double *)&v60);
      }
      PXRectWithCenterAndSize();
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;
      PXRectGetCenter();
      v42 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v72 = *MEMORY[0x1E0C9BAA8];
      v73 = v42;
      v74 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v43 = *((_OWORD *)off_1E50B86D0 + 1);
      *(_OWORD *)&v77[8] = *(_OWORD *)off_1E50B86D0;
      *(_OWORD *)&v77[24] = v43;
      v68.x = v35;
      v68.y = v37;
      v69.width = v39;
      v69.height = v41;
      v70.x = v44;
      v70.y = v45;
      v71.width = v39;
      v71.height = v41;
      *(_QWORD *)&v76 = 0;
      v75 = 0x3FF0000000000000uLL;
      *((CGFloat *)&v76 + 1) = v39;
      *(CGFloat *)v77 = v41;
      *(_QWORD *)&v77[40] = v52;
      v54 = v21;
      v55 = v22;
      v56 = v24;
      v57 = v23;
      -[PXEngineDrivenAssetsTilingLayout adjustGeometry:forContentTileWithIndexPath:](self, "adjustGeometry:forContentTileWithIndexPath:", &v68, &v54);
    }

    if (a3)
    {
      v46 = *(_OWORD *)v77;
      *(_OWORD *)&a3->hidden = v76;
      *(_OWORD *)&a3->contentSize.height = v46;
      v47 = *(_OWORD *)&v77[32];
      *(_OWORD *)&a3->contentsRect.origin.y = *(_OWORD *)&v77[16];
      *(_OWORD *)&a3->contentsRect.size.height = v47;
      v48 = v73;
      *(_OWORD *)&a3->transform.a = v72;
      *(_OWORD *)&a3->transform.c = v48;
      v49 = v75;
      *(_OWORD *)&a3->transform.tx = v74;
      *(_OWORD *)&a3->alpha = v49;
      v50 = v69;
      a3->frame.origin = v68;
      a3->frame.size = v50;
      v51 = v71;
      a3->center = v70;
      a3->size = v51;
    }
    if (a4)
      *a4 = 0;
    if (a5)
      *a5 = 0;
  }
  else
  {
    v53.receiver = self;
    v53.super_class = (Class)PXEngineDrivenAssetsTilingLayout;
    v28 = *(_OWORD *)&a6->index[5];
    v60 = *(_OWORD *)&a6->index[3];
    v61 = v28;
    v62 = *(_OWORD *)&a6->index[7];
    *(_QWORD *)&v63 = a6->index[9];
    v29 = *(_OWORD *)&a6->index[1];
    v58 = *(_OWORD *)&a6->length;
    v59 = v29;
    return -[PXAssetsTilingLayout getGeometry:group:userData:forTileWithIdentifier:](&v53, sel_getGeometry_group_userData_forTileWithIdentifier_, a3, a4, a5, &v58);
  }
  return v30;
}

- (void)adjustGeometry:(PXTileGeometry *)a3 forContentTileWithIndexPath:(PXSimpleIndexPath *)a4
{
  __int128 v7;
  __int128 v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  __int128 v13;
  double v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXEngineDrivenAssetsTilingLayout;
  v7 = *(_OWORD *)&a4->item;
  v15 = *(_OWORD *)&a4->dataSourceIdentifier;
  v16 = v7;
  -[PXAssetsTilingLayout adjustGeometry:forContentTileWithIndexPath:](&v17, sel_adjustGeometry_forContentTileWithIndexPath_, a3, &v15);
  PXSizeGetAspectRatio();
  v8 = *(_OWORD *)&a4->item;
  v15 = *(_OWORD *)&a4->dataSourceIdentifier;
  v16 = v8;
  -[PXEngineDrivenAssetsTilingLayout _contentsRectForItemAtIndexPath:forAspectRatio:](self, "_contentsRectForItemAtIndexPath:forAspectRatio:", &v15);
  a3->contentsRect.origin.x = v9;
  a3->contentsRect.origin.y = v10;
  a3->contentsRect.size.width = v11;
  a3->contentsRect.size.height = v12;
  v13 = *(_OWORD *)&a4->item;
  v15 = *(_OWORD *)&a4->dataSourceIdentifier;
  v16 = v13;
  -[PXEngineDrivenAssetsTilingLayout _zPositionForItemAtIndexPath:](self, "_zPositionForItemAtIndexPath:", &v15);
  a3->zPosition = v14;
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
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[PXEngineDrivenAssetsTilingLayout layoutSnapshot](self, "layoutSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "contentRect");
  -[PXTilingLayout contentInset](self, "contentInset");
  sub_1A7AE3F38();
  PXEdgeInsetsInsetRect();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)getAdditionalTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4 layoutGeometryKind:(unint64_t)a5 indexPath:(PXSimpleIndexPath *)a6
{
  NSObject *v7;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PXAssertGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 134217984;
    v10 = a5;
    _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Unrecognized layout generator geometry kind (%lu). This should be handled by a subclass, otherwise tiles will not be created", (uint8_t *)&v9, 0xCu);
  }

  return 0;
}

- (void)setLayoutSnapshot:(id)a3
{
  PXLayoutSnapshot *v6;
  PXLayoutSnapshot **p_layoutSnapshot;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  PXTilingLayoutInvalidationContext *v19;
  void *v20;
  void *v21;
  PXLayoutSnapshot *v22;

  v6 = (PXLayoutSnapshot *)a3;
  p_layoutSnapshot = &self->_layoutSnapshot;
  if (self->_layoutSnapshot != v6)
  {
    v22 = v6;
    if (v6)
    {
      -[PXLayoutSnapshot dataSourceSnapshot](v6, "dataSourceSnapshot");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "identifier");
      -[PXEngineDrivenAssetsTilingLayout dataSource](self, "dataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "identifier");

      if (v9 != v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEngineDrivenAssetsTilingLayout.m"), 223, CFSTR("Changing to a layoutSnapshot with a new data source version is not supported."));

      }
      if (*p_layoutSnapshot)
      {
        -[PXLayoutSnapshot dataSourceSnapshot](v22, "dataSourceSnapshot");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "identifier");
        -[PXLayoutSnapshot dataSourceSnapshot](*p_layoutSnapshot, "dataSourceSnapshot");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "identifier");

        if (v13 != v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEngineDrivenAssetsTilingLayout.m"), 224, CFSTR("Changing to a layoutSnapshot with a new data source version is not supported."));

        }
      }
      -[PXLayoutSnapshot dataSourceSnapshot](v22, "dataSourceSnapshot");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEngineDrivenAssetsTilingLayout.m"), 225, CFSTR("Requires a layout snapshot with a PXAssetsDataSource data source."));

      }
    }
    objc_storeStrong((id *)&self->_layoutSnapshot, a3);
    v19 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    -[PXTilingLayoutInvalidationContext invalidateAllTiles](v19, "invalidateAllTiles");
    -[PXTilingLayoutInvalidationContext invalidateContentBounds](v19, "invalidateContentBounds");
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v19);

    v6 = v22;
  }

}

- (void)setContentMode:(int64_t)a3
{
  PXTilingLayoutInvalidationContext *v4;

  if (self->_contentMode != a3)
  {
    self->_contentMode = a3;
    v4 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    -[PXTilingLayoutInvalidationContext invalidateAllTiles](v4, "invalidateAllTiles");
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (id)dataSource
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[PXEngineDrivenAssetsTilingLayout layoutSnapshot](self, "layoutSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXEngineDrivenAssetsTilingLayout;
    -[PXAssetsTilingLayout dataSource](&v9, sel_dataSource);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (CGSize)playButtonSizeForItemAtIndexPath:(PXSimpleIndexPath *)a3 contentTileSize:(CGSize)a4
{
  double height;
  double width;
  void *v8;
  __int128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  CGSize result;

  height = a4.height;
  width = a4.width;
  if (self->_delegateFlags.respondsToEngineDrivenLayoutPlayButtonSizeForItemAtIndexPathForAspectRatio)
  {
    -[PXEngineDrivenAssetsTilingLayout delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_OWORD *)&a3->item;
    v20 = *(_OWORD *)&a3->dataSourceIdentifier;
    v21 = v9;
    objc_msgSend(v8, "engineDrivenLayout:playButtonSizeForItemAtIndexPath:contentTileSize:", self, &v20, width, height);
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)PXEngineDrivenAssetsTilingLayout;
    v14 = *(_OWORD *)&a3->item;
    v20 = *(_OWORD *)&a3->dataSourceIdentifier;
    v21 = v14;
    -[PXAssetsTilingLayout playButtonSizeForItemAtIndexPath:contentTileSize:](&v19, sel_playButtonSizeForItemAtIndexPath_contentTileSize_, &v20, a4.width, height);
    v11 = v15;
    v13 = v16;
  }
  v17 = v11;
  v18 = v13;
  result.height = v18;
  result.width = v17;
  return result;
}

- (double)_aspectRatioForItemAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v5;
  __int128 v6;
  double v7;
  double v8;
  _OWORD v10[2];

  if (!self->_delegateFlags.respondsToEngineDrivenLayoutAspectRatioForItemAtIndexPath)
    return 1.0;
  -[PXEngineDrivenAssetsTilingLayout delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->item;
  v10[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v10[1] = v6;
  objc_msgSend(v5, "engineDrivenLayout:aspectRatioForItemAtIndexPath:", self, v10);
  v8 = v7;

  return v8;
}

- (double)_zPositionForItemAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v5;
  __int128 v6;
  double v7;
  double v8;
  _OWORD v10[2];

  if (!self->_delegateFlags.respondsToEngineDrivenLayoutZPositionForItemAtIndexPath)
    return 0.0;
  -[PXEngineDrivenAssetsTilingLayout delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->item;
  v10[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v10[1] = v6;
  objc_msgSend(v5, "engineDrivenLayout:zPositionForItemAtIndexPath:", self, v10);
  v8 = v7;

  return v8;
}

- (CGRect)_contentsRectForItemAtIndexPath:(PXSimpleIndexPath *)a3 forAspectRatio:(double)a4
{
  void *v7;
  __int128 v8;
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
  double v19;
  double v20;
  _OWORD v21[2];
  CGRect result;

  if (self->_delegateFlags.respondsToEngineDrivenLayoutContentsRectForItemAtIndexPathForAspectRatio)
  {
    -[PXEngineDrivenAssetsTilingLayout delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_OWORD *)&a3->item;
    v21[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v21[1] = v8;
    objc_msgSend(v7, "engineDrivenLayout:contentsRectForItemAtIndexPath:forAspectRatio:", self, v21, a4);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

  }
  else
  {
    v10 = *(double *)off_1E50B86D0;
    v12 = *((double *)off_1E50B86D0 + 1);
    v14 = *((double *)off_1E50B86D0 + 2);
    v16 = *((double *)off_1E50B86D0 + 3);
  }
  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (PXEngineDrivenAssetsTilingLayoutDelegate)delegate
{
  return (PXEngineDrivenAssetsTilingLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXLayoutSnapshot)layoutSnapshot
{
  return self->_layoutSnapshot;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutSnapshot, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __80__PXEngineDrivenAssetsTilingLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  uint64_t v30;
  void (*v31)(void);
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  double v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void (*v61)(void);
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  _BYTE v73[32];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE buf[32];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[64];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 56);
  v6 = a2;
  v7 = objc_msgSend(v6, "px_section");
  v8 = objc_msgSend(v6, "px_item");

  v9 = a3[12];
  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 >= objc_msgSend(v10, "numberOfSections"))
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "numberOfItemsInSection:", v7);

      if (v8 < v12)
      {
        v90 = 0u;
        memset(v91, 0, 56);
        v88 = 0u;
        v89 = 0u;
        v87 = 0u;
        if (*(_BYTE *)(a1 + 72))
        {
          v13 = *(void **)(a1 + 32);
          *(_QWORD *)v73 = v5;
          *(_QWORD *)&v73[8] = v7;
          *(_QWORD *)&v73[16] = v8;
          *(_QWORD *)&v73[24] = 0x7FFFFFFFFFFFFFFFLL;
          v14 = objc_msgSend(v13, "_aspectRatioForItemAtIndexPath:", v73);
          v15 = *(_QWORD *)(a1 + 64);
          MEMORY[0x1A85CD660](v14);
        }
        else
        {
          v15 = *(_QWORD *)(a1 + 64);
        }
        PXRectWithCenterAndSize();
        v42 = v41;
        v44 = v43;
        v46 = v45;
        v48 = v47;
        PXRectGetCenter();
        v49 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v87 = *MEMORY[0x1E0C9BAA8];
        v88 = v49;
        v89 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        v50 = *((_OWORD *)off_1E50B86D0 + 1);
        *(_OWORD *)&v91[24] = *(_OWORD *)off_1E50B86D0;
        *(_OWORD *)&v91[40] = v50;
        *(_QWORD *)buf = v42;
        *(_QWORD *)&buf[8] = v44;
        *(_QWORD *)&buf[16] = v46;
        *(_QWORD *)&buf[24] = v48;
        *(double *)&v85 = v51;
        *((_QWORD *)&v85 + 1) = v52;
        *(_QWORD *)&v86 = v46;
        *((_QWORD *)&v86 + 1) = v48;
        *(_QWORD *)v91 = 0;
        v90 = 0x3FF0000000000000uLL;
        *(_QWORD *)&v91[8] = v46;
        *(_QWORD *)&v91[16] = v48;
        *(_QWORD *)&v91[56] = v15;
        if (fabs(v51) != INFINITY && !PXPointIsNull())
        {
          v60 = *(void **)(a1 + 32);
          *(_QWORD *)v73 = v5;
          *(_QWORD *)&v73[8] = v7;
          *(_QWORD *)&v73[16] = v8;
          *(_QWORD *)&v73[24] = 0x7FFFFFFFFFFFFFFFLL;
          objc_msgSend(v60, "adjustGeometry:forContentTileWithIndexPath:", buf, v73);
          v61 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
          v67 = xmmword_1A7C0C200;
          *(_QWORD *)&v68 = v5;
          *((_QWORD *)&v68 + 1) = v7;
          *(_QWORD *)&v69 = v8;
          *((_QWORD *)&v69 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          v70 = 0u;
          v71 = 0u;
          v72 = 0;
          v80 = *(_OWORD *)v91;
          v81 = *(_OWORD *)&v91[16];
          v82 = *(_OWORD *)&v91[32];
          v83 = *(_OWORD *)&v91[48];
          v76 = v87;
          v77 = v88;
          v78 = v89;
          v79 = v90;
          *(_OWORD *)v73 = *(_OWORD *)buf;
          *(_OWORD *)&v73[16] = *(_OWORD *)&buf[16];
          v74 = v85;
          v75 = v86;
          v61();
          v62 = *(void **)(a1 + 32);
          v63 = *(_QWORD *)(a1 + 40);
          v64 = *(_QWORD *)(a1 + 48);
          *(_QWORD *)v73 = v5;
          *(_QWORD *)&v73[8] = v7;
          *(_QWORD *)&v73[16] = v8;
          *(_QWORD *)&v73[24] = 0x7FFFFFFFFFFFFFFFLL;
          objc_msgSend(v62, "enumerateAccessoryTilesForContentTileWithIndexPath:geometry:withOptions:usingBlock:", v73, buf, v63, v64);
          return;
        }
        PLUIGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 32), "layoutSnapshot");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (void *)MEMORY[0x1E0CB3940];
          v55 = *a3;
          NSStringFromCGPoint(*(CGPoint *)(a3 + 1));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromCGSize(*(CGSize *)(a3 + 3));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "stringWithFormat:", CFSTR("  [geometry[%ld] = {center:%@, size:%@}]\r"), v55, v56, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          *(_QWORD *)v73 = v5;
          *(_QWORD *)&v73[8] = v7;
          *(_QWORD *)&v73[16] = v8;
          *(_QWORD *)&v73[24] = 0x7FFFFFFFFFFFFFFFLL;
          PXSimpleIndexPathDescription();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v73 = 138412802;
          *(_QWORD *)&v73[4] = v53;
          *(_WORD *)&v73[12] = 2112;
          *(_QWORD *)&v73[14] = v58;
          *(_WORD *)&v73[22] = 2112;
          *(_QWORD *)&v73[24] = v59;
          _os_log_impl(&dword_1A6789000, v32, OS_LOG_TYPE_ERROR, "Error: LayoutSnapshot(%@) returned invalid geometry(%@) for item(%@)", v73, 0x20u);

        }
        goto LABEL_17;
      }
    }
    v9 = a3[12];
    if (!v9)
    {
      PLUIGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "layoutSnapshot");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x1E0CB3940];
        v34 = *a3;
        NSStringFromCGPoint(*(CGPoint *)(a3 + 1));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromCGSize(*(CGSize *)(a3 + 3));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("  [geometry[%ld] = {center:%@, size:%@}]\r"), v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)buf = v5;
        *(_QWORD *)&buf[8] = v7;
        *(_QWORD *)&buf[16] = v8;
        *(_QWORD *)&buf[24] = 0x7FFFFFFFFFFFFFFFLL;
        v38 = v37;
        PXSimpleIndexPathDescription();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "dataSource");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v65;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v37;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v39;
        LOWORD(v85) = 2112;
        *(_QWORD *)((char *)&v85 + 2) = v40;
        _os_log_impl(&dword_1A6789000, v32, OS_LOG_TYPE_ERROR, "Error: LayoutSnapshot(%@) returned geometry(%@) for an item(%@) not in the data source(%@)", buf, 0x2Au);

      }
LABEL_17:

      return;
    }
  }
  v72 = 0;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v67 = 0u;
  v66 = 0;
  v16 = *(void **)(a1 + 32);
  *(_QWORD *)buf = v5;
  *(_QWORD *)&buf[8] = v7;
  *(_QWORD *)&buf[16] = v8;
  *(_QWORD *)&buf[24] = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(v16, "getAdditionalTileIdentifier:group:layoutGeometryKind:indexPath:", &v67, &v66, v9, buf))
  {
    v17 = *(_QWORD *)(a1 + 64);
    PXRectWithCenterAndSize();
    v19 = v18;
    v21 = v20;
    *(_QWORD *)v91 = 0;
    *(_QWORD *)buf = v22;
    *(_QWORD *)&buf[8] = v23;
    *(_QWORD *)&buf[16] = v18;
    *(_QWORD *)&buf[24] = v20;
    PXRectGetCenter();
    *(_QWORD *)&v85 = v24;
    *((_QWORD *)&v85 + 1) = v25;
    *(_QWORD *)&v86 = v19;
    *((_QWORD *)&v86 + 1) = v21;
    v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v87 = *MEMORY[0x1E0C9BAA8];
    v88 = v26;
    v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v91[0] = 0;
    v89 = v27;
    v90 = xmmword_1A7C0C360;
    *(_OWORD *)&v91[8] = v86;
    v28 = *((_OWORD *)off_1E50B86D0 + 1);
    *(_OWORD *)&v91[24] = *(_OWORD *)off_1E50B86D0;
    *(_OWORD *)&v91[40] = v28;
    *(_QWORD *)&v91[56] = v17;
    v29 = *(void **)(a1 + 32);
    v30 = a3[12];
    *(_QWORD *)v73 = v5;
    *(_QWORD *)&v73[8] = v7;
    *(_QWORD *)&v73[16] = v8;
    *(_QWORD *)&v73[24] = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v29, "adjustGeometry:forAdditionalTileWithKind:indexPath:", buf, v30, v73);
    v31 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    v80 = *(_OWORD *)v91;
    v81 = *(_OWORD *)&v91[16];
    v82 = *(_OWORD *)&v91[32];
    v83 = *(_OWORD *)&v91[48];
    v76 = v87;
    v77 = v88;
    v78 = v89;
    v79 = v90;
    *(_OWORD *)v73 = *(_OWORD *)buf;
    *(_OWORD *)&v73[16] = *(_OWORD *)&buf[16];
    v74 = v85;
    v75 = v86;
    v31();
  }
}

@end

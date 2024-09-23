@implementation TSDTilingLayer

- (TSDTilingLayer)init
{
  TSDTilingLayer *v2;
  TSDTilingLayer *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDTilingLayer;
  v2 = -[TSDTilingLayer init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->mTilingMode = 0;
    objc_msgSend(+[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities"), "maximumTextureSize");
    *(float *)&v4 = v4 * 0.25;
    v5 = fmaxf(*(float *)&v4, 640.0);
    -[TSDTilingLayer contentsScale](v3, "contentsScale");
    v7 = v5 / v6;
    v3->mTileSize.width = v7;
    v3->mTileSize.height = v7;
    *(_BYTE *)&v3->mFlags |= 2u;
    v3->mDirtyTiles = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3->mHasEverHadTileLayout = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDTilingLayer;
  -[TSDTilingLayer dealloc](&v3, sel_dealloc);
}

- (void)setContentsScale:(double)a3
{
  double v5;
  double v6;
  CGFloat v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[TSDTilingLayer contentsScale](self, "contentsScale");
  if (v5 != a3)
  {
    objc_msgSend(+[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities"), "maximumTextureSize");
    *(float *)&v6 = v6 * 0.25;
    v7 = fmaxf(*(float *)&v6, 640.0) / a3;
    self->mTileSize.width = v7;
    self->mTileSize.height = v7;
    -[TSDTilingLayer setNeedsLayout](self, "setNeedsLayout");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = -[TSDTilingLayer p_tileLayers](self, "p_tileLayers");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "setContentsScale:", a3);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)TSDTilingLayer;
  -[TSDTilingLayer setContentsScale:](&v13, sel_setContentsScale_, a3);
}

- (void)setContents:(id)a3
{
  id v5;
  char mFlags;
  objc_super v7;

  v5 = (id)-[TSDTilingLayer contents](self, "contents");
  v7.receiver = self;
  v7.super_class = (Class)TSDTilingLayer;
  -[TSDTilingLayer setContents:](&v7, sel_setContents_, a3);
  if (v5 != a3)
  {
    mFlags = (char)self->mFlags;
    *(_BYTE *)&self->mFlags = mFlags & 0x9D | 2;
    if ((mFlags & 1) != 0)
      -[TSDTilingLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTileContents:(id)a3
{
  char isKindOfClass;
  objc_super v6;
  objc_super v7;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!a3 || (isKindOfClass & 1) != 0)
  {
    if (a3)
      objc_msgSend(a3, "setZPosition:", -10000.0);
    -[TSDTilingLayer setContents:](&v7, sel_setContents_, 0, v6.receiver, v6.super_class, self, TSDTilingLayer);
  }
  else
  {
    -[TSDTilingLayer setContents:](&v6, sel_setContents_, a3, self, TSDTilingLayer, v7.receiver, v7.super_class);
  }
}

- (void)display
{
  objc_super v3;
  objc_super v4;

  if ((*(_BYTE *)&self->mFlags & 1) != 0)
  {
    if (-[TSDTilingLayer contents](self, "contents"))
    {
      v4.receiver = self;
      v4.super_class = (Class)TSDTilingLayer;
      -[TSDTilingLayer setContents:](&v4, sel_setContents_, 0);
    }
  }
  else if (!-[TSDTilingLayer drawsInBackground](self, "drawsInBackground")
         && !-[TSDTilingLayer forceTiling](self, "forceTiling")
         && !self->_geometryProvider)
  {
    v3.receiver = self;
    v3.super_class = (Class)TSDTilingLayer;
    -[TSDTilingLayer display](&v3, sel_display);
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGSize v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v25 = *MEMORY[0x24BDAC8D0];
  -[TSDTilingLayer delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)-[TSDTilingLayer delegate](self, "delegate"), "tilingLayerWillSetNeedsDisplay:", self);
  if ((*(_BYTE *)&self->mFlags & 2) != 0)
  {
    *(_BYTE *)&self->mFlags &= ~2u;
    -[TSDTilingLayer setNeedsLayout](self, "setNeedsLayout");
    v8 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    self->mLastVisibleBounds.origin = (CGPoint)*MEMORY[0x24BDBF070];
    self->mLastVisibleBounds.size = v8;
    self->mLastBoundsSize = (CGSize)*MEMORY[0x24BDBF148];
  }
  v23.receiver = self;
  v23.super_class = (Class)TSDTilingLayer;
  -[TSDTilingLayer setNeedsDisplayInRect:](&v23, sel_setNeedsDisplayInRect_, x, y, width, height);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = -[TSDTilingLayer p_tileLayers](self, "p_tileLayers", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "frame");
        v27.origin.x = v15;
        v27.origin.y = v16;
        v27.size.width = v17;
        v27.size.height = v18;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        if (CGRectIntersectsRect(v26, v27))
        {
          -[TSDTilingLayer convertRect:toLayer:](self, "convertRect:toLayer:", v14, x, y, width, height);
          objc_msgSend(v14, "setNeedsDisplayInRect:");
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v11);
  }
}

- (void)setNeedsLayoutForTilingLayers
{
  objc_super v3;

  -[TSDTilingLayer setNeedsLayout](self, "setNeedsLayout");
  v3.receiver = self;
  v3.super_class = (Class)TSDTilingLayer;
  -[CALayer setNeedsLayoutForTilingLayers](&v3, sel_setNeedsLayoutForTilingLayers);
}

- (void)setNeedsLayout
{
  objc_super v3;

  *(_BYTE *)&self->mFlags |= 0x10u;
  -[TSDTilingLayer delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)-[TSDTilingLayer delegate](self, "delegate"), "tilingLayerWillSetNeedsLayout:", self);
  v3.receiver = self;
  v3.super_class = (Class)TSDTilingLayer;
  -[TSDTilingLayer setNeedsLayout](&v3, sel_setNeedsLayout);
}

- (unint64_t)p_tilesWide
{
  double v4;

  if (self->_geometryProvider)
    return 1;
  -[TSDTilingLayer bounds](self, "bounds");
  return vcvtpd_u64_f64(v4 / self->mTileSize.width);
}

- (unint64_t)p_tilesHigh
{
  TSDTileGeometryProviding *geometryProvider;
  double v5;

  geometryProvider = self->_geometryProvider;
  if (geometryProvider)
  {
    return (unint64_t)(double)(unint64_t)-[TSDTileGeometryProviding tileGeometryCountWithLayer:](geometryProvider, "tileGeometryCountWithLayer:", self);
  }
  else
  {
    -[TSDTilingLayer bounds](self, "bounds");
    return (unint64_t)ceil(v5 / self->mTileSize.height);
  }
}

- (void)p_updateTileIndexes:(id)a3 visibleBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  TSDTileGeometryProviding *geometryProvider;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize *p_mTileSize;
  double v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  geometryProvider = self->_geometryProvider;
  if (geometryProvider)
  {
    -[TSDTileGeometryProviding tileGeometryAddVisibileIndices:withLayer:visibleBounds:](geometryProvider, "tileGeometryAddVisibileIndices:withLayer:visibleBounds:", a3, self, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
  else
  {
    v11 = -[TSDTilingLayer p_tilesWide](self, "p_tilesWide");
    -[TSDTilingLayer bounds](self, "bounds");
    v13 = v12;
    v15 = v14;
    v16 = TSDSubtractPoints(x, y, v12);
    p_mTileSize = &self->mTileSize;
    v27.size.width = p_mTileSize->width;
    v27.size.height = p_mTileSize->height;
    *(float *)&v16 = v16 / p_mTileSize->width;
    *(float *)&v18 = v18 / v27.size.height;
    v19 = (unint64_t)(float)(floorf(*(float *)&v16) + (float)(floorf(*(float *)&v18) * (float)v11));
    v27.origin.x = v13 + p_mTileSize->width * (double)(v19 % v11);
    v27.origin.y = v15 + v27.size.height * (double)(v19 / v11);
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v26 = CGRectUnion(v25, v27);
    v20 = vcvtpd_u64_f64(v26.size.height / p_mTileSize->height);
    if (v20)
    {
      v21 = 0;
      v22 = vcvtpd_u64_f64(v26.size.width / p_mTileSize->width);
      do
      {
        if (v22)
        {
          v23 = v19;
          v24 = v22;
          do
          {
            objc_msgSend(a3, "addIndex:", v23++);
            --v24;
          }
          while (v24);
        }
        ++v21;
        v19 += v11;
      }
      while (v21 != v20);
    }
  }
}

- (void)setEnableContext:(BOOL)a3
{
  if (self->_enableContext != a3)
  {
    self->_enableContext = a3;
    -[TSDTilingLayer setValue:forKeyPath:](self, "setValue:forKeyPath:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:"), CFSTR("separatedOptions.enableContext"));
  }
}

- (void)layoutSublayers
{
  TSDTilingLayer *v2;
  uint64_t v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double y;
  double x;
  double height;
  double width;
  TSDTilingLayer *v20;
  _BOOL4 v21;
  _BOOL4 v22;
  TSDTilingLayer *v23;
  TSDTilingLayer *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v34;
  double v35;
  double v36;
  double v37;
  BOOL v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char mFlags;
  BOOL v43;
  char v44;
  _BOOL4 v45;
  TSDTileGeometryProviding *geometryProvider;
  int v47;
  CGFloat *p_x;
  char v49;
  BOOL IsNull;
  id v51;
  BOOL v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t i;
  void *v60;
  uint64_t v61;
  unint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t j;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  unint64_t v73;
  TSDTilingLayer *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[12];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  objc_super v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v2 = self;
  v87 = *MEMORY[0x24BDAC8D0];
  v3 = 56;
  if ((*(_BYTE *)&self->mFlags & 0x10) == 0)
    goto LABEL_65;
  -[TSDTilingLayer delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend((id)-[TSDTilingLayer delegate](v2, "delegate"), "shouldLayoutTilingLayer:", v2))
  {
    goto LABEL_65;
  }
  v84.receiver = v2;
  v84.super_class = (Class)TSDTilingLayer;
  -[TSDTilingLayer layoutSublayers](&v84, sel_layoutSublayers);
  v2->mHasEverHadTileLayout = 1;
  -[TSDTilingLayer bounds](v2, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (-[TSDTilingLayer superlayer](v2, "superlayer"))
  {
    -[TSDTilingLayer delegate](v2, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend((id)-[TSDTilingLayer delegate](v2, "delegate"), "visibleBoundsForTilingLayer:", v2);
    }
    else
    {
      v20 = (TSDTilingLayer *)-[TSDTilingLayer superlayer](v2, "superlayer");
      v21 = v11 > 0.0;
      v22 = v9 > 0.0;
      if (v20 && v11 > 0.0)
      {
        v23 = v2;
        height = v11;
        width = v9;
        y = v7;
        x = v5;
        if (v9 > 0.0)
        {
          x = v5;
          y = v7;
          width = v9;
          height = v11;
          v24 = v2;
          do
          {
            v23 = v20;
            -[TSDTilingLayer convertRect:fromLayer:](v20, "convertRect:fromLayer:", v24, x, y, width, height);
            x = v25;
            y = v26;
            width = v27;
            height = v28;
            if (-[TSDTilingLayer masksToBounds](v23, "masksToBounds"))
            {
              -[TSDTilingLayer bounds](v23, "bounds");
              v94.origin.x = v29;
              v94.origin.y = v30;
              v94.size.width = v31;
              v94.size.height = v32;
              v88.origin.x = x;
              v88.origin.y = y;
              v88.size.width = width;
              v88.size.height = height;
              v89 = CGRectIntersection(v88, v94);
              x = v89.origin.x;
              y = v89.origin.y;
              width = v89.size.width;
              height = v89.size.height;
            }
            v20 = (TSDTilingLayer *)-[TSDTilingLayer superlayer](v23, "superlayer");
            v21 = height > 0.0;
            v22 = width > 0.0;
            if (!v20)
              break;
            if (height <= 0.0)
              break;
            v24 = v23;
          }
          while (width > 0.0);
        }
      }
      else
      {
        v23 = v2;
        height = v11;
        width = v9;
        y = v7;
        x = v5;
      }
      if (!v21 || !v22)
        goto LABEL_25;
      -[TSDTilingLayer convertRect:fromLayer:](v2, "convertRect:fromLayer:", v23, x, y, width, height);
    }
    x = v12;
    y = v13;
    width = v14;
    height = v15;
  }
  else
  {
    x = *MEMORY[0x24BDBF070];
    y = *(double *)(MEMORY[0x24BDBF070] + 8);
    width = *(double *)(MEMORY[0x24BDBF070] + 16);
    height = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
LABEL_25:
  v90.origin.x = x;
  v90.origin.y = y;
  v90.size.width = width;
  v90.size.height = height;
  v95.origin.x = v5;
  v95.origin.y = v7;
  v95.size.width = v9;
  v95.size.height = v11;
  v91 = CGRectIntersection(v90, v95);
  v34 = v91.origin.x;
  v35 = v91.origin.y;
  v36 = v91.size.width;
  v37 = v91.size.height;
  v38 = -[TSDTilingLayer p_updateTileSizeWithLayerSize:](v2, "p_updateTileSizeWithLayerSize:", v9, v11);
  v39 = -[TSDTilingLayer p_tilesWide](v2, "p_tilesWide");
  v40 = -[TSDTilingLayer p_tilesHigh](v2, "p_tilesHigh");
  v41 = v40;
  mFlags = (char)v2->mFlags;
  v43 = 1;
  v73 = v39;
  if (v39 <= 1 && v40 <= 1)
    v43 = -[TSDTilingLayer drawsInBackground](v2, "drawsInBackground")
       || -[TSDTilingLayer forceTiling](v2, "forceTiling")
       || v2->_geometryProvider != 0;
  v44 = (char)v2->mFlags;
  *(_BYTE *)&v2->mFlags = v44 & 0xEE | v43;
  v45 = (v44 & 2) != 0 && objc_msgSend(-[TSDTilingLayer p_tileLayers](v2, "p_tileLayers"), "count") != 0;
  geometryProvider = v2->_geometryProvider;
  if (geometryProvider)
    v72 = -[TSDTileGeometryProviding tileGeometryDirty](geometryProvider, "tileGeometryDirty");
  else
    v72 = 0;
  v47 = mFlags & 1;
  p_x = &v2->mLastVisibleBounds.origin.x;
  if (!TSDNearlyEqualRects(v34, v35, v36, v37, v2->mLastVisibleBounds.origin.x, v2->mLastVisibleBounds.origin.y, v2->mLastVisibleBounds.size.width, v2->mLastVisibleBounds.size.height)|| v47 != (*(_BYTE *)&v2->mFlags & 1)|| (!TSDNearlyEqualSizes(v2->mLastBoundsSize.width, v2->mLastBoundsSize.height, v9, v11) | v45 | v72) == 1)
  {
    -[TSDTileGeometryProviding setTileGeometryDirty:](v2->_geometryProvider, "setTileGeometryDirty:", 0);
    v49 = (char)v2->mFlags;
    if (v47 != (v49 & 1) && (*(_BYTE *)&v2->mFlags & 2) == 0)
    {
      if ((*(_BYTE *)&v2->mFlags & 1) != 0)
      {
        -[TSDTilingLayer setTileContents:](v2, "setTileContents:", 0);
      }
      else if ((*(_BYTE *)&v2->mFlags & 0x20) == 0)
      {
        *(_BYTE *)&v2->mFlags = v49 | 0x20;
      }
    }
    v92.origin.x = *p_x;
    v92.origin.y = v2->mLastVisibleBounds.origin.y;
    v92.size.width = v2->mLastVisibleBounds.size.width;
    v92.size.height = v2->mLastVisibleBounds.size.height;
    IsNull = CGRectIsNull(v92);
    *p_x = v34;
    v2->mLastVisibleBounds.origin.y = v35;
    v2->mLastVisibleBounds.size.width = v36;
    v2->mLastVisibleBounds.size.height = v37;
    v2->mLastBoundsSize.width = v9;
    v2->mLastBoundsSize.height = v11;
    v51 = objc_alloc_init(MEMORY[0x24BDD1698]);
    v93.origin.x = v34;
    v93.origin.y = v35;
    v93.size.width = v36;
    v93.size.height = v37;
    v52 = CGRectIsNull(v93);
    v70 = 56;
    if ((*(_BYTE *)&v2->mFlags & 3) == 1 && !v52 && v37 > 0.0 && v36 > 0.0)
      -[TSDTilingLayer p_updateTileIndexes:visibleBounds:](v2, "p_updateTileIndexes:visibleBounds:", v51, v34, v35, v36, v37);
    v53 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v74 = v2;
    v54 = -[TSDTilingLayer p_tileLayers](v2, "p_tileLayers");
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v81;
      v58 = IsNull || v38;
      do
      {
        for (i = 0; i != v56; ++i)
        {
          if (*(_QWORD *)v81 != v57)
            objc_enumerationMutation(v54);
          v60 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          v61 = objc_msgSend(v60, "index", v70);
          if (v58 || (v62 = v61, (objc_msgSend(v51, "containsIndex:", v61) & 1) == 0))
          {
            objc_msgSend(v53, "addObject:", v60);
          }
          else
          {
            objc_msgSend(v51, "removeIndex:", v62);
            if (v72)
              -[TSDTileGeometryProviding tileGeometryConfigureWithLayer:tileLayer:atIndex:](v74->_geometryProvider, "tileGeometryConfigureWithLayer:tileLayer:atIndex:", v74, v60, v62);
            objc_msgSend(v60, "updateFrameWithTileSize:tilesWide:tilesHigh:geometryProvider:", v73, v41, v74->_geometryProvider, v74->mTileSize.width, v74->mTileSize.height);
            objc_msgSend(v60, "setLocation:", v62 % v73);
          }
        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
      }
      while (v56);
    }
    v79[0] = MEMORY[0x24BDAC760];
    v79[1] = 3221225472;
    v79[2] = __33__TSDTilingLayer_layoutSublayers__block_invoke;
    v79[3] = &unk_24D82C2B8;
    v2 = v74;
    v79[6] = v73;
    v79[7] = v41;
    *(CGFloat *)&v79[8] = v5;
    *(CGFloat *)&v79[9] = v7;
    *(double *)&v79[10] = v9;
    *(double *)&v79[11] = v11;
    v79[4] = v74;
    v79[5] = v53;
    objc_msgSend(v51, "enumerateIndexesUsingBlock:", v79, v70);
    objc_msgSend(v53, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);

    v3 = v71;
  }
LABEL_65:
  if ((*((_BYTE *)&v2->super.super.isa + v3) & 0x20) != 0 && v2->mHasEverHadTileLayout)
  {
    if ((*((_BYTE *)&v2->super.super.isa + v3) & 1) != 0)
    {
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v63 = -[TSDTilingLayer p_tileLayers](v2, "p_tileLayers");
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
      if (!v64)
        goto LABEL_80;
      v65 = v64;
      v66 = 0;
      v67 = *(_QWORD *)v76;
      do
      {
        for (j = 0; j != v65; ++j)
        {
          if (*(_QWORD *)v76 != v67)
            objc_enumerationMutation(v63);
          v69 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
          if (objc_msgSend(v69, "needsTileDisplay"))
          {
            -[NSMutableArray addObject:](v2->mDirtyTiles, "addObject:", v69);
            v66 = 1;
          }
        }
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
      }
      while (v65);
      if ((v66 & 1) == 0)
        goto LABEL_80;
    }
    else
    {
      *((_BYTE *)&v2->super.super.isa + v3) |= 0x40u;
    }
    -[TSDTilingLayer setNeedsDisplayForDirtyTiles:](v2, "setNeedsDisplayForDirtyTiles:", v2);
LABEL_80:
    *((_BYTE *)&v2->super.super.isa + v3) &= ~0x20u;
  }
}

uint64_t __33__TSDTilingLayer_layoutSublayers__block_invoke(uint64_t a1, unint64_t a2, double a3, double a4)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  TSDTilingTileLayer *v16;
  double v17;
  double v18;
  char v20;
  uint64_t v21;
  void *v22;
  CGImage *v23;
  uint64_t v24;
  uint64_t result;
  CGRect v26;
  CGRect v27;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = a2 / v7;
  v9 = a2 % v7;
  v10 = *(void **)(v6 + 136);
  if (v10)
  {
    objc_msgSend(v10, "tileGeometryRectWithLayer:atIndex:mask:");
LABEL_6:
    v13 = v11;
    v14 = v12;
    goto LABEL_7;
  }
  v13 = *(double *)(v6 + 40);
  v14 = *(double *)(v6 + 48);
  if (v9 == v7 - 1 || v8 == *(_QWORD *)(a1 + 56) - 1)
  {
    v27 = *(CGRect *)(a1 + 64);
    v26.origin.x = v27.origin.x + v13 * (double)v9;
    v26.origin.y = v27.origin.y + v14 * (double)v8;
    v26.size.width = *(CGFloat *)(v6 + 40);
    v26.size.height = *(CGFloat *)(v6 + 48);
    *(CGRect *)&a3 = CGRectIntersection(v26, v27);
    goto LABEL_6;
  }
LABEL_7:
  if ((objc_msgSend(*(id *)(a1 + 32), "drawsInBackground", a3, a4) & 1) == 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "isMainThread"))
  {
    v15 = objc_msgSend(*(id *)(a1 + 40), "count");
    while (v15)
    {
      v16 = (TSDTilingTileLayer *)objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", --v15);
      -[TSDTilingTileLayer bounds](v16, "bounds");
      if (v18 == v13 && v17 == v14)
      {
        objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", v15);
        if (!v16)
          break;
        v20 = 0;
        goto LABEL_19;
      }
    }
  }
  v16 = objc_alloc_init(TSDTilingTileLayer);
  -[TSDTilingTileLayer setZPosition:](v16, "setZPosition:", -10000.0);
  -[TSDTilingTileLayer setOpaque:](v16, "setOpaque:", objc_msgSend(*(id *)(a1 + 32), "isOpaque"));
  -[TSDTilingTileLayer setAnchorPoint:](v16, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  objc_msgSend(*(id *)(a1 + 32), "contentsScale");
  -[TSDTilingTileLayer setContentsScale:](v16, "setContentsScale:");
  -[TSDTilingTileLayer setDrawsAsynchronously:](v16, "setDrawsAsynchronously:", objc_msgSend(*(id *)(a1 + 32), "drawsAsynchronously"));
  objc_msgSend(*(id *)(a1 + 32), "insertSublayer:atIndex:", v16, 0);

  v20 = 1;
LABEL_19:
  -[TSDTilingTileLayer setIndex:](v16, "setIndex:", a2);
  -[TSDTilingTileLayer setLocation:](v16, "setLocation:", v9, v8);
  -[TSDTilingTileLayer setNeedsTileDisplay:](v16, "setNeedsTileDisplay:", 0);
  -[TSDTilingTileLayer setValue:forKeyPath:](v16, "setValue:forKeyPath:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 129)), CFSTR("separatedOptions.enableContext"));
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 136);
  if (v22)
  {
    objc_msgSend(v22, "tileGeometryConfigureWithLayer:tileLayer:atIndex:");
    v21 = *(_QWORD *)(a1 + 32);
  }
  if ((*(_BYTE *)(v21 + 56) & 4) != 0)
  {
    v23 = (CGImage *)objc_msgSend((id)objc_opt_class(), "p_newCheckerboardImage");
    v24 = objc_msgSend(MEMORY[0x24BDE57D8], "disableActions");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[TSDTilingTileLayer setContents:](v16, "setContents:", v23);
    -[TSDTilingTileLayer setContentsGravity:](v16, "setContentsGravity:", *MEMORY[0x24BDE5CB0]);
    -[TSDTilingTileLayer setMasksToBounds:](v16, "setMasksToBounds:", 1);
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", v24);
    CGImageRelease(v23);
    v21 = *(_QWORD *)(a1 + 32);
  }
  result = -[TSDTilingTileLayer updateFrameWithTileSize:tilesWide:tilesHigh:geometryProvider:](v16, "updateFrameWithTileSize:tilesWide:tilesHigh:geometryProvider:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(v21 + 136), *(double *)(v21 + 40), *(double *)(v21 + 48));
  if ((v20 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "i_setNeedsTileDisplayForTile:", v16);
  return result;
}

- (void)setNeedsDisplayForDirtyTiles:(id)a3
{
  objc_super v5;

  -[TSDTilingLayer delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)-[TSDTilingLayer delegate](self, "delegate"), "tilingLayerWillSetNeedsDisplayForDirtyTiles:", self);
  v5.receiver = self;
  v5.super_class = (Class)TSDTilingLayer;
  -[CALayer setNeedsDisplayForDirtyTiles:](&v5, sel_setNeedsDisplayForDirtyTiles_, a3);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v6;
  uint64_t v7;
  TSDTilingLayer *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(a3, "superlayer");
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = (TSDTilingLayer *)objc_msgSend(a3, "superlayer");
  if (v6 == v7)
  {
    if ((TSDTilingLayer *)-[TSDTilingLayer superlayer](v8, "superlayer") != self)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTilingLayer drawLayer:inContext:]");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTilingLayer.m"), 620, CFSTR("This tiling layer is not responsible for the layer asking to be drawn"));
    }
    objc_msgSend((id)objc_msgSend(a3, "superlayer"), "frame");
    -[TSDTilingLayer setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
  }
  else
  {
    if (v8 != self)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTilingLayer drawLayer:inContext:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTilingLayer.m"), 623, CFSTR("This tiling layer is not responsible for the layer asking to be drawn"));
    }
    -[TSDTilingLayer setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setTilingMode:(int)a3
{
  CGSize v4;

  if (self->mTilingMode != a3)
  {
    self->mTilingMode = a3;
    if ((*(_BYTE *)&self->mFlags & 2) == 0)
    {
      v4 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
      self->mLastVisibleBounds.origin = (CGPoint)*MEMORY[0x24BDBF070];
      self->mLastVisibleBounds.size = v4;
      self->mLastBoundsSize = (CGSize)*MEMORY[0x24BDBF148];
      -[TSDTilingLayer setNeedsDisplay](self, "setNeedsDisplay");
      -[TSDTilingLayer setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (BOOL)drawsInBackground
{
  return (*(_BYTE *)&self->mFlags >> 2) & 1;
}

- (void)setDrawsInBackground:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->mFlags = *(_BYTE *)&self->mFlags & 0xFB | v3;
}

- (BOOL)forceTiling
{
  return (*(_BYTE *)&self->mFlags >> 3) & 1;
}

- (void)setForceTiling:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->mFlags = *(_BYTE *)&self->mFlags & 0xF7 | v3;
}

- (void)tilingSafeSetSublayers:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToArray:", -[TSDTilingLayer p_nonTileAndContentLayers](self, "p_nonTileAndContentLayers")) & 1) == 0)-[TSDTilingLayer setSublayers:](self, "setSublayers:", objc_msgSend(-[TSDTilingLayer p_tileAndContentLayers](self, "p_tileAndContentLayers"), "arrayByAddingObjectsFromArray:", a3));
}

- (BOOL)tilingSafeHasContents
{
  objc_super v3;

  if ((*(_BYTE *)&self->mFlags & 1) != 0)
    return objc_msgSend(-[TSDTilingLayer p_tileLayers](self, "p_tileLayers"), "count") != 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDTilingLayer;
  return -[CALayer tilingSafeHasContents](&v3, sel_tilingSafeHasContents);
}

- (void)i_drawTile:(id)a3 inContext:(CGContext *)a4
{
  void *v7;
  uint64_t v8;

  if (CGRectIsNull(self->mLastVisibleBounds))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTilingLayer i_drawTile:inContext:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTilingLayer.m"), 696, CFSTR("Shouldn't be drawing tiles for an hidden layer %p, tile %p index %ld"), self, a3, objc_msgSend(a3, "index"));
  }
  objc_msgSend(a3, "frame");
  -[TSDTilingLayer i_drawRect:inContext:inBackground:](self, "i_drawRect:inContext:inBackground:", a4, 0);
}

- (void)i_drawRect:(CGRect)a3 inContext:(CGContext *)a4 inBackground:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CGContextSaveGState(a4);
  CGContextTranslateCTM(a4, -x, -y);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  CGContextClipToRect(a4, v11);
  -[TSDTilingLayer drawInContext:](self, "drawInContext:", a4);
  CGContextRestoreGState(a4);
}

- (void)i_drawTileInBackground:(id)a3 inRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[12];
  _QWORD v15[6];
  id v16;
  uint64_t v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = objc_msgSend(a3, "index");
  v16 = 0;
  v17 = 0;
  -[TSDTilingLayer delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_msgSend((id)-[TSDTilingLayer delegate](self, "delegate"), "shouldBeginDrawingTilingLayerInBackground:returningToken:andQueue:", self, &v17, &v16);
    v12 = v17;
  }
  else
  {
    v12 = 0;
    v11 = 1;
  }
  v13 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __48__TSDTilingLayer_i_drawTileInBackground_inRect___block_invoke;
  v15[3] = &unk_24D82A5C8;
  v15[4] = self;
  v15[5] = v12;
  if (v11)
  {
    if (objc_msgSend(v16, "isShuttingDown"))
    {
      __48__TSDTilingLayer_i_drawTileInBackground_inRect___block_invoke((uint64_t)v15);
    }
    else
    {
      v14[0] = v13;
      v14[1] = 3221225472;
      v14[2] = __48__TSDTilingLayer_i_drawTileInBackground_inRect___block_invoke_2;
      v14[3] = &unk_24D82C2E0;
      v14[4] = a3;
      v14[5] = v16;
      *(CGFloat *)&v14[8] = x;
      *(CGFloat *)&v14[9] = y;
      *(CGFloat *)&v14[10] = width;
      *(CGFloat *)&v14[11] = height;
      v14[6] = v15;
      v14[7] = v10;
      objc_msgSend(v16, "performAsync:", v14);
    }
  }
}

uint64_t __48__TSDTilingLayer_i_drawTileInBackground_inRect___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didEndDrawingTilingLayerInBackground:withToken:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __48__TSDTilingLayer_i_drawTileInBackground_inRect___block_invoke_2(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "superlayer")
    && objc_msgSend(*(id *)(a1 + 32), "index") == *(_QWORD *)(a1 + 56)
    && (objc_msgSend(*(id *)(a1 + 40), "isShuttingDown") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplayInRectIgnoringBackground:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
    objc_msgSend(*(id *)(a1 + 32), "display");
    objc_msgSend(*(id *)(a1 + 32), "setMasksToBounds:", 0);
    objc_msgSend(MEMORY[0x24BDE57D8], "flush");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)i_setNeedsTileDisplayForTile:(id)a3
{
  objc_msgSend(a3, "setNeedsDisplay");
}

- (BOOL)p_updateTileSizeWithLayerSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double v18;
  _BOOL4 v19;

  height = a3.height;
  width = a3.width;
  -[TSDTilingLayer contentsScale](self, "contentsScale");
  v7 = v6;
  objc_msgSend(+[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities"), "maximumTextureSize");
  v9 = v8 / v7;
  objc_msgSend(+[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities"), "maximumTextureSize");
  *(float *)&v10 = v10 * 0.25;
  v11 = fmaxf(*(float *)&v10, 640.0) / v7;
  v12 = width > v9;
  if (height > v9)
    v12 = 1;
  v13 = width * height;
  v14 = v11 * v11;
  v15 = v9 * v9 * 0.25;
  switch(self->mTilingMode)
  {
    case 1:
      if (v13 > v14)
        v12 = 1;
      goto LABEL_6;
    case 2:
      if (v13 > v14)
        v12 = 1;
      if (v12)
      {
        width = v11 + v11;
        height = v11 * 0.5;
      }
      break;
    case 3:
      if (v13 > v14)
        v12 = 1;
      if (v12)
      {
        width = v11 * 0.5;
        height = v11 + v11;
      }
      break;
    case 4:
      if (v13 > v15)
        v12 = 1;
      if (v12)
      {
        height = v11 + v11;
        width = v9;
      }
      break;
    case 5:
      if (v13 > v15)
        v12 = 1;
      if (v12)
      {
        height = v9;
        width = v11 + v11;
      }
      break;
    case 6:
      if (v13 > v14)
        v12 = 1;
      if (v12)
      {
        v16 = TSDCeilSize(width);
        v17 = v16 / v11;
        *(float *)&v16 = v16 / ceilf(v17);
        width = (float)(floorf(*(float *)&v16) + 1.0);
        *(float *)&v16 = v18 / v11;
        *(float *)&v16 = v18 / ceilf(*(float *)&v16);
        height = (float)(floorf(*(float *)&v16) + 1.0);
      }
      break;
    default:
LABEL_6:
      if (v12)
      {
        height = v11;
        width = v11;
      }
      break;
  }
  v19 = height != self->mTileSize.height || width != self->mTileSize.width;
  if (v19)
  {
    self->mTileSize.width = width;
    self->mTileSize.height = height;
  }
  return v19;
}

+ (CGSize)defaultTileSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(+[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities"), "maximumTextureSize");
  *(float *)&v2 = v2 * 0.25;
  v3 = fmaxf(*(float *)&v2, 640.0);
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)p_tileLayers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  objc_opt_class();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)-[TSDTilingLayer sublayers](self, "sublayers", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)p_tileAndContentLayers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  objc_opt_class();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)-[TSDTilingLayer sublayers](self, "sublayers", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)p_nonTileAndContentLayers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  objc_opt_class();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)-[TSDTilingLayer sublayers](self, "sublayers", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v3)
            v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          objc_msgSend(v3, "addObject:", v9);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

+ (CGImage)p_newCheckerboardImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__TSDTilingLayer_p_newCheckerboardImage__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = a1;
  if (p_newCheckerboardImage_s_checkerboardImageOnce != -1)
    dispatch_once(&p_newCheckerboardImage_s_checkerboardImageOnce, block);
  return (CGImage *)objc_msgSend((id)p_newCheckerboardImage_s_checkerboardImage, "newImage");
}

uint64_t __40__TSDTilingLayer_p_newCheckerboardImage__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x24BEB3C70]), "initWithDelegate:createImageSelector:", *(_QWORD *)(a1 + 32), sel_p_newGeneratedCheckerboardImage);
  p_newCheckerboardImage_s_checkerboardImage = result;
  return result;
}

+ (CGImage)p_newGeneratedCheckerboardImage
{
  CGColor *v2;
  double v3;
  float64x2_t v4;
  float64_t v5;
  float64x2_t v11;
  CGContext *v12;
  CGImage *Image;
  float64_t v15;
  CGRect v16;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "whiteColor"), "CGColor");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithWhite:alpha:", 0.85, 1.0), "CGColor");
  v2 = (CGColor *)TSUCreateCheckerBoardColor();
  objc_msgSend(+[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities"), "maximumTextureSize");
  v15 = v3;
  objc_msgSend(+[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities"), "maximumTextureSize");
  v4.f64[0] = v15;
  v4.f64[1] = v5;
  __asm { FMOV            V0.2D, #0.25 }
  v11 = vcvtq_f64_f32(vmaxnm_f32(vcvt_f32_f64(vmulq_f64(v4, _Q0)), (float32x2_t)vdup_n_s32(0x44200000u)));
  v12 = TSDBitmapContextCreate(11, vaddq_f64(v11, v11).f64[0]);
  CGContextSetFillColorWithColor(v12, v2);
  v16.origin.x = TSDRectWithSize();
  CGContextFillRect(v12, v16);
  Image = CGBitmapContextCreateImage(v12);
  CGContextRelease(v12);
  CGColorRelease(v2);
  return Image;
}

- (TSDTileGeometryProviding)geometryProvider
{
  return self->_geometryProvider;
}

- (void)setGeometryProvider:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (BOOL)enableContext
{
  return self->_enableContext;
}

- (int)tilingMode
{
  return self->mTilingMode;
}

@end

@implementation CRLTilingLayer

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class(CRLTilingRenderable, a2);
}

- (CRLTilingLayer)init
{
  CRLTilingLayer *v2;
  CRLTilingLayer *v3;
  double v4;
  CGFloat v5;
  NSMapTable *v6;
  NSMapTable *deferredTileBlocks;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *deferredTileBlocksLock;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLTilingLayer;
  v2 = -[CRLTilingLayer init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->_tilingMode = 0;
    -[CRLTilingLayer contentsScale](v2, "contentsScale");
    v5 = 640.0 / v4;
    v3->_tileSize.width = v5;
    v3->_tileSize.height = v5;
    *(_BYTE *)&v3->_flags |= 2u;
    v6 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    deferredTileBlocks = v3->_deferredTileBlocks;
    v3->_deferredTileBlocks = v6;

    v8 = dispatch_semaphore_create(1);
    deferredTileBlocksLock = v3->_deferredTileBlocksLock;
    v3->_deferredTileBlocksLock = (OS_dispatch_semaphore *)v8;

    __dmb(0xBu);
  }
  return v3;
}

- (void)setContentsScale:(double)a3
{
  double v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  -[CRLTilingLayer contentsScale](self, "contentsScale");
  if (v5 != a3)
  {
    self->_tileSize.width = 640.0 / a3;
    self->_tileSize.height = 640.0 / a3;
    -[CRLTilingLayer setNeedsLayout](self, "setNeedsLayout");
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer p_tileLayers](self, "p_tileLayers"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), "setContentsScale:", a3);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  v11.receiver = self;
  v11.super_class = (Class)CRLTilingLayer;
  -[CRLTilingLayer setContentsScale:](&v11, "setContentsScale:", a3);
}

- (void)setContents:(id)a3
{
  char flags;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLTilingLayer;
  -[CRLTilingLayer setContents:](&v5, "setContents:", a3);
  flags = (char)self->_flags;
  *(_BYTE *)&self->_flags = flags | 2;
  if ((flags & 1) != 0)
    -[CRLTilingLayer setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTileContents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  objc_super v8;
  objc_super v9;

  v4 = a3;
  objc_opt_class(CALayer, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);
  if (!v4 || (isKindOfClass & 1) != 0)
  {
    if (v4)
      objc_msgSend(v4, "setZPosition:", -10000.0);
    -[CRLTilingLayer setContents:](&v9, "setContents:", 0, v8.receiver, v8.super_class, self, CRLTilingLayer);
  }
  else
  {
    -[CRLTilingLayer setContents:](&v8, "setContents:", v4, self, CRLTilingLayer, v9.receiver, v9.super_class);
  }

}

- (void)display
{
  void *v3;
  objc_super v4;
  objc_super v5;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer contents](self, "contents"));

    if (v3)
    {
      v5.receiver = self;
      v5.super_class = (Class)CRLTilingLayer;
      -[CRLTilingLayer setContents:](&v5, "setContents:", 0);
    }
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CRLTilingLayer;
    -[CRLTilingLayer display](&v4, "display");
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGSize size;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  objc_super v26;
  _QWORD v27[9];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  CGRect v34;
  CGRect v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)&self->_flags &= ~2u;
    -[CRLTilingLayer setNeedsLayout](self, "setNeedsLayout");
    size = CGRectNull.size;
    self->_lastVisibleBounds.origin = CGRectNull.origin;
    self->_lastVisibleBounds.size = size;
    self->_lastBoundsSize = CGSizeZero;
  }
  v32.receiver = self;
  v32.super_class = (Class)CRLTilingLayer;
  -[CRLTilingLayer setNeedsDisplayInRect:](&v32, "setNeedsDisplayInRect:", x, y, width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer p_deferredTileBlocksForCurrentThread](self, "p_deferredTileBlocksForCurrentThread"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer p_tileLayers](self, "p_tileLayers"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "frame");
        v35.origin.x = v16;
        v35.origin.y = v17;
        v35.size.width = v18;
        v35.size.height = v19;
        v34.origin.x = x;
        v34.origin.y = y;
        v34.size.width = width;
        v34.size.height = height;
        if (CGRectIntersectsRect(v34, v35))
        {
          -[CRLTilingLayer convertRect:toLayer:](self, "convertRect:toLayer:", v15, x, y, width, height);
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_100405EC0;
          v27[3] = &unk_10122F7A8;
          v27[4] = v15;
          v27[5] = v20;
          v27[6] = v21;
          v27[7] = v22;
          v27[8] = v23;
          v24 = objc_msgSend(v27, "copy");
          v25 = objc_retainBlock(v24);
          objc_msgSend(v9, "addObject:", v25);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    v26.receiver = self;
    v26.super_class = (Class)CRLTilingLayer;
    -[CRLTilingLayer setNeedsLayout](&v26, "setNeedsLayout");
  }

}

- (void)setNeedsLayout
{
  objc_super v2;

  *(_BYTE *)&self->_flags |= 8u;
  v2.receiver = self;
  v2.super_class = (Class)CRLTilingLayer;
  -[CRLTilingLayer setNeedsLayout](&v2, "setNeedsLayout");
}

- (void)crl_setNeedsLayoutForTilingLayers
{
  objc_super v3;

  -[CRLTilingLayer setNeedsLayout](self, "setNeedsLayout");
  v3.receiver = self;
  v3.super_class = (Class)CRLTilingLayer;
  -[CRLTilingLayer crl_setNeedsLayoutForTilingLayers](&v3, "crl_setNeedsLayoutForTilingLayers");
}

- (void)crl_cancelLayoutForTilingLayers
{
  objc_super v2;

  *(_BYTE *)&self->_flags &= ~8u;
  v2.receiver = self;
  v2.super_class = (Class)CRLTilingLayer;
  -[CRLTilingLayer crl_cancelLayoutForTilingLayers](&v2, "crl_cancelLayoutForTilingLayers");
}

- (void)layoutSublayers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  CRLTilingLayer *v9;
  void *v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  double v24;
  double x;
  double v26;
  double y;
  double v28;
  double width;
  double v30;
  double height;
  CRLTilingLayer *v32;
  void *v33;
  _BOOL4 v34;
  _BOOL4 v35;
  CRLTilingLayer *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CRLTilingLayer *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  unint64_t v54;
  $B7AE2DEE8DBEC4513AEAA069074B9715 flags;
  int v57;
  char v58;
  _BOOL4 v59;
  void *v60;
  int v61;
  CGFloat *p_x;
  int v63;
  BOOL IsNull;
  id v65;
  BOOL v66;
  double v67;
  double v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  uint64_t v79;
  char v80;
  void *j;
  void *v82;
  id v83;
  id v84;
  id v85;
  unsigned __int8 v86;
  CRLTilingLayer *v87;
  double *p_width;
  unint64_t v89;
  unint64_t v90;
  _QWORD v91[5];
  id v92;
  unint64_t v93;
  unint64_t v94;
  double v95;
  double v96;
  double v97;
  double v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  objc_super v103;
  objc_super v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  _BYTE v110[128];
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer p_deferredTileBlocksForCurrentThread](self, "p_deferredTileBlocksForCurrentThread"));
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v105, v110, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v106;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v106 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)i) + 16))();
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v105, v110, 16);
    }
    while (v5);
  }
  objc_msgSend(v3, "removeAllObjects");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer delegate](self, "delegate"));
    v9 = self;
    if ((objc_opt_respondsToSelector(v8, "shouldLayoutTilingLayer:") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer delegate](self, "delegate"));
      v11 = objc_msgSend(v10, "shouldLayoutTilingLayer:", self);

      if (!v11)
        goto LABEL_71;
    }
    else
    {

    }
    v104.receiver = v9;
    v104.super_class = (Class)CRLTilingLayer;
    -[CRLTilingLayer layoutSublayers](&v104, "layoutSublayers");
    -[CRLTilingLayer bounds](v9, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer superlayer](v9, "superlayer"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer delegate](v9, "delegate"));
      v22 = objc_opt_respondsToSelector(v21, "visibleBoundsForTilingLayer:");

      if ((v22 & 1) != 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer delegate](v9, "delegate"));
        objc_msgSend(v23, "visibleBoundsForTilingLayer:", v9);
        x = v24;
        y = v26;
        width = v28;
        height = v30;

      }
      else
      {
        v32 = v9;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer superlayer](v32, "superlayer"));
        v34 = v19 > 0.0;
        v35 = v17 > 0.0;
        if (v33 && v19 > 0.0 && v17 > 0.0)
        {
          x = v13;
          y = v15;
          width = v17;
          height = v19;
          v36 = v32;
          do
          {
            objc_msgSend(v33, "convertRect:fromLayer:", v36, x, y, width, height);
            x = v37;
            y = v38;
            width = v39;
            height = v40;
            if (objc_msgSend(v33, "masksToBounds"))
            {
              objc_msgSend(v33, "bounds");
              v119.origin.x = v41;
              v119.origin.y = v42;
              v119.size.width = v43;
              v119.size.height = v44;
              v111.origin.x = x;
              v111.origin.y = y;
              v111.size.width = width;
              v111.size.height = height;
              v112 = CGRectIntersection(v111, v119);
              x = v112.origin.x;
              y = v112.origin.y;
              width = v112.size.width;
              height = v112.size.height;
            }
            v45 = v33;

            v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer superlayer](v45, "superlayer"));
            v34 = height > 0.0;
            v35 = width > 0.0;
            if (!v33)
              break;
            if (height <= 0.0)
              break;
            v36 = v45;
          }
          while (width > 0.0);
        }
        else
        {
          v45 = v32;
          height = v19;
          width = v17;
          y = v15;
          x = v13;
        }
        if (v34 && v35)
        {
          -[CRLTilingLayer convertRect:fromLayer:](v32, "convertRect:fromLayer:", v45, x, y, width, height);
          x = v46;
          y = v47;
          width = v48;
          height = v49;
        }

      }
    }
    else
    {
      x = CGRectNull.origin.x;
      y = CGRectNull.origin.y;
      width = CGRectNull.size.width;
      height = CGRectNull.size.height;
    }
    v113.origin.x = x;
    v113.origin.y = y;
    v113.size.width = width;
    v113.size.height = height;
    v120.origin.x = v13;
    v120.origin.y = v15;
    v120.size.width = v17;
    v120.size.height = v19;
    v114 = CGRectIntersection(v113, v120);
    v50 = v114.origin.x;
    v51 = v114.origin.y;
    v52 = v114.size.width;
    v53 = v114.size.height;
    v86 = -[CRLTilingLayer p_updateTileSizeWithLayerSize:](v9, "p_updateTileSizeWithLayerSize:", v17, v19);
    p_width = &v9->_tileSize.width;
    v54 = vcvtpd_u64_f64(v19 / v9->_tileSize.height);
    flags = v9->_flags;
    v89 = v54;
    v90 = vcvtpd_u64_f64(v17 / v9->_tileSize.width);
    if (v90 > 1 || v54 > 1)
      LOBYTE(v57) = 1;
    else
      v57 = (*(unsigned int *)&flags >> 2) & 1;
    v58 = *(_BYTE *)&flags & 0xF6 | v57;
    *(_BYTE *)&v9->_flags = v58;
    if ((*(_BYTE *)&flags & 2) != 0)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer p_tileLayers](v9, "p_tileLayers"));
      v59 = objc_msgSend(v60, "count") != 0;

      v58 = (char)v9->_flags;
    }
    else
    {
      v59 = 0;
    }
    v61 = *(_BYTE *)&flags & 1;
    p_x = &v9->_lastVisibleBounds.origin.x;
    v63 = v58 & 1;
    if (!sub_10005FF70(v50, v51, v52, v53, v9->_lastVisibleBounds.origin.x, v9->_lastVisibleBounds.origin.y, v9->_lastVisibleBounds.size.width, v9->_lastVisibleBounds.size.height)|| v61 != v63|| !sub_10005FDF0(v9->_lastBoundsSize.width, v9->_lastBoundsSize.height, v17, v19)|| v59)
    {
      v87 = v9;
      if (v61 != v63 && (v58 & 2) == 0)
      {
        if ((v58 & 1) != 0)
        {
          -[CRLTilingLayer setTileContents:](v9, "setTileContents:", 0);
        }
        else
        {
          v103.receiver = v9;
          v103.super_class = (Class)CRLTilingLayer;
          -[CRLTilingLayer setNeedsDisplayInRect:](&v103, "setNeedsDisplayInRect:", CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height);
        }
      }
      v115.origin.x = *p_x;
      v115.origin.y = v9->_lastVisibleBounds.origin.y;
      v115.size.width = v9->_lastVisibleBounds.size.width;
      v115.size.height = v9->_lastVisibleBounds.size.height;
      IsNull = CGRectIsNull(v115);
      *p_x = v50;
      v9->_lastVisibleBounds.origin.y = v51;
      v9->_lastVisibleBounds.size.width = v52;
      v9->_lastVisibleBounds.size.height = v53;
      v9->_lastBoundsSize.width = v17;
      v9->_lastBoundsSize.height = v19;
      v65 = objc_alloc_init((Class)NSMutableIndexSet);
      v116.origin.x = v50;
      v116.origin.y = v51;
      v116.size.width = v52;
      v116.size.height = v53;
      v66 = CGRectIsNull(v116);
      if ((*(_BYTE *)&v9->_flags & 3) == 1 && !v66 && v53 > 0.0 && v52 > 0.0)
      {
        v67 = sub_1000603B8(v50, v51, v13);
        v121.size.width = *p_width;
        v121.size.height = v9->_tileSize.height;
        *(float *)&v67 = v67 / *p_width;
        *(float *)&v68 = v68 / v121.size.height;
        v69 = (unint64_t)(float)(floorf(*(float *)&v67) + (float)(floorf(*(float *)&v68) * (float)v90));
        v121.origin.x = v13 + *p_width * (double)(v69 % v90);
        v121.origin.y = v15 + v121.size.height * (double)(v69 / v90);
        v117.origin.x = v50;
        v117.origin.y = v51;
        v117.size.width = v52;
        v117.size.height = v53;
        v118 = CGRectUnion(v117, v121);
        v70 = vcvtpd_u64_f64(v118.size.height / v9->_tileSize.height);
        if (v70)
        {
          v71 = 0;
          v72 = vcvtpd_u64_f64(v118.size.width / *p_width);
          do
          {
            if (v72)
            {
              v73 = v69;
              v74 = v72;
              do
              {
                objc_msgSend(v65, "addIndex:", v73++);
                --v74;
              }
              while (v74);
            }
            ++v71;
            v69 += v90;
          }
          while (v71 != v70);
        }
      }
      v75 = objc_alloc_init((Class)NSMutableArray);
      v99 = 0u;
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer p_tileLayers](v87, "p_tileLayers"));
      v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
      if (v77)
      {
        v78 = v77;
        v79 = *(_QWORD *)v100;
        v80 = IsNull | v86;
        do
        {
          for (j = 0; j != v78; j = (char *)j + 1)
          {
            if (*(_QWORD *)v100 != v79)
              objc_enumerationMutation(v76);
            v82 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)j);
            v83 = objc_msgSend(v82, "index");
            if ((v80 & 1) != 0 || (v84 = v83, (objc_msgSend(v65, "containsIndex:", v83) & 1) == 0))
            {
              objc_msgSend(v75, "addObject:", v82);
            }
            else
            {
              objc_msgSend(v65, "removeIndex:", v84);
              objc_msgSend(v82, "updateFrameWithTileSize:tilesWide:tilesHigh:", v90, v89, *p_width, p_width[1]);
            }
          }
          v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
        }
        while (v78);
      }

      v91[0] = _NSConcreteStackBlock;
      v91[1] = 3221225472;
      v91[2] = sub_100406778;
      v91[3] = &unk_10125B708;
      v93 = v90;
      v94 = v89;
      v95 = v13;
      v96 = v15;
      v97 = v17;
      v98 = v19;
      v91[4] = v87;
      v92 = v75;
      v85 = v75;
      objc_msgSend(v65, "enumerateIndexesUsingBlock:", v91);
      objc_msgSend(v85, "makeObjectsPerformSelector:", "removeFromSuperlayer");

    }
  }
LABEL_71:

}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CRLTilingLayer *v13;
  CRLTilingLayer *v14;
  void *v15;
  void *v16;
  void *v17;
  CRLTilingLayer *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superlayer"));
  objc_opt_class(v6, v7);
  v9 = v8;
  objc_opt_class(CRLTilingTileLayer, v10);
  v12 = v11;

  v13 = (CRLTilingLayer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superlayer"));
  v14 = v13;
  if (v9 == v12)
  {
    v18 = (CRLTilingLayer *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer superlayer](v13, "superlayer"));

    if (v18 != self)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B728);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E30444();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B748);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTilingLayer drawLayer:inContext:]"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTilingLayer.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 378, 0, "This tiling layer is not responsible for the layer asking to be drawn");

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superlayer"));
    objc_msgSend(v22, "frame");
    -[CRLTilingLayer setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");

  }
  else
  {

    if (v14 != self)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B768);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E304C8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B788);
      v15 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTilingLayer drawLayer:inContext:]"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTilingLayer.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 381, 0, "This tiling layer is not responsible for the layer asking to be drawn");

    }
    -[CRLTilingLayer setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setTilingMode:(int64_t)a3
{
  CGSize size;

  if (self->_tilingMode != a3)
  {
    self->_tilingMode = a3;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
    {
      size = CGRectNull.size;
      self->_lastVisibleBounds.origin = CGRectNull.origin;
      self->_lastVisibleBounds.size = size;
      self->_lastBoundsSize = CGSizeZero;
      -[CRLTilingLayer setNeedsDisplay](self, "setNeedsDisplay");
      -[CRLTilingLayer setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (BOOL)forceTiled
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)setForceTiled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (void)crl_tilingSafeSetSublayers:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer p_nonTileAndContentLayers](self, "p_nonTileAndContentLayers"));
  v5 = objc_msgSend(v8, "isEqualToArray:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer p_tileAndContentLayers](self, "p_tileAndContentLayers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v8));
    -[CRLTilingLayer setSublayers:](self, "setSublayers:", v7);

  }
}

- (BOOL)crl_tilingSafeHasContents
{
  BOOL v2;
  void *v3;
  objc_super v5;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer p_tileLayers](self, "p_tileLayers"));
    v2 = objc_msgSend(v3, "count") != 0;

  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLTilingLayer;
    return -[CRLTilingLayer crl_tilingSafeHasContents](&v5, "crl_tilingSafeHasContents");
  }
  return v2;
}

- (void)i_drawTile:(id)a3 inContext:(CGContext *)a4
{
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  unsigned int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  CRLTilingLayer *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  v6 = a3;
  if (CGRectIsNull(self->_lastVisibleBounds))
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B7A8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      v12 = v8;
      *(_DWORD *)buf = 67110658;
      v14 = v7;
      v15 = 2082;
      v16 = "-[CRLTilingLayer i_drawTile:inContext:]";
      v17 = 2082;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTilingLayer.m";
      v19 = 1024;
      v20 = 434;
      v21 = 2048;
      v22 = self;
      v23 = 2048;
      v24 = v6;
      v25 = 2048;
      v26 = objc_msgSend(v6, "index");
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Shouldn't be drawing tiles for an hidden layer %p, tile %p index %ld", buf, 0x40u);

    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B7C8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTilingLayer i_drawTile:inContext:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTilingLayer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 434, 0, "Shouldn't be drawing tiles for an hidden layer %p, tile %p index %ld", self, v6, objc_msgSend(v6, "index"));

  }
  objc_msgSend(v6, "frame");
  -[CRLTilingLayer i_drawRect:inContext:inBackground:](self, "i_drawRect:inContext:inBackground:", a4, 0);

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
  -[CRLTilingLayer drawInContext:](self, "drawInContext:", a4);
  CGContextRestoreGState(a4);
}

- (BOOL)p_updateTileSizeWithLayerSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double v18;
  _BOOL4 v19;

  height = a3.height;
  width = a3.width;
  -[CRLTilingLayer contentsScale](self, "contentsScale");
  v7 = 2048.0 / v6;
  v8 = 640.0 / v6;
  v9 = width > 2048.0 / v6;
  if (height > 2048.0 / v6)
    v9 = 1;
  v10 = width * height;
  v11 = v8 * v8;
  v12 = v7 * v7 * 0.25;
  switch(self->_tilingMode)
  {
    case 1:
      if (v10 > v11)
        v9 = 1;
      goto LABEL_6;
    case 2:
      if (v10 > v11)
        v9 = 1;
      v13 = v9;
      v14 = v8 + v8;
      v15 = v8 * 0.5;
      goto LABEL_15;
    case 3:
      if (v10 > v11)
        v9 = 1;
      v13 = v9;
      v14 = v8 * 0.5;
      v15 = v8 + v8;
LABEL_15:
      if (v13)
        height = v15;
      if (v13)
        width = v14;
      break;
    case 4:
      if (v10 > v12)
        v9 = 1;
      if (v9)
      {
        height = v8 + v8;
        width = v7;
      }
      break;
    case 5:
      if (v10 > v12)
        v9 = 1;
      if (v9)
      {
        height = v7;
        width = v8 + v8;
      }
      break;
    case 6:
      if (v10 > v11)
        v9 = 1;
      if (v9)
      {
        v16 = sub_100063090(width);
        v17 = v16 / v8;
        *(float *)&v16 = v16 / ceilf(v17);
        width = (float)(floorf(*(float *)&v16) + 1.0);
        *(float *)&v16 = v18 / v8;
        *(float *)&v16 = v18 / ceilf(*(float *)&v16);
        height = (float)(floorf(*(float *)&v16) + 1.0);
      }
      break;
    default:
LABEL_6:
      if (v9)
      {
        height = v8;
        width = v8;
      }
      break;
  }
  v19 = height != self->_tileSize.height || width != self->_tileSize.width;
  if (v19)
  {
    self->_tileSize.width = width;
    self->_tileSize.height = height;
  }
  return v19;
}

- (id)p_tileLayers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_opt_class(CRLTilingTileLayer, v4);
  v6 = v5;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer sublayers](self, "sublayers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass(v12, v6) & 1) != 0)
          objc_msgSend(v3, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v3;
}

- (id)p_tileAndContentLayers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_opt_class(CRLTilingTileLayer, v4);
  v6 = v5;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer sublayers](self, "sublayers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass(v12, v6) & 1) != 0)
          objc_msgSend(v3, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v3;
}

- (id)p_nonTileAndContentLayers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_opt_class(CRLTilingTileLayer, v4);
  v6 = v5;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingLayer sublayers](self, "sublayers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass(v12, v6) & 1) == 0)
        {
          if (!v3)
            v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          objc_msgSend(v3, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v3;
}

- (id)p_deferredTileBlocksForCurrentThread
{
  void *v3;
  id v4;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_deferredTileBlocksLock, 0xFFFFFFFFFFFFFFFFLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_deferredTileBlocks, "objectForKey:", v3));
  if (!v4)
  {
    v4 = objc_alloc_init((Class)NSMutableArray);
    -[NSMapTable setObject:forKey:](self->_deferredTileBlocks, "setObject:forKey:", v4, v3);
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_deferredTileBlocksLock);
  return v4;
}

- (int64_t)tilingMode
{
  return self->_tilingMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredTileBlocks, 0);
  objc_storeStrong((id *)&self->_deferredTileBlocksLock, 0);
}

@end

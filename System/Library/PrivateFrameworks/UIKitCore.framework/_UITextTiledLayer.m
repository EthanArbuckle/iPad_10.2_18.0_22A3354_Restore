@implementation _UITextTiledLayer

- (_UITextTiledLayer)init
{
  char *v2;
  char *v3;
  __int128 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UITextTiledLayer;
  v2 = -[_UITextTiledLayer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *((_QWORD *)v2 + 15) = 0x4060000000000000;
    *(_OWORD *)(v2 + 40) = xmmword_1866848C0;
    *((_QWORD *)v2 + 16) = 0x3FF0000000000000;
    objc_storeWeak((id *)v2 + 7, 0);
    *((_QWORD *)v3 + 8) = 0;
    v4 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v3 + 72) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v3 + 88) = v4;
  }
  return (_UITextTiledLayer *)v3;
}

- (void)setDelegate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITextTiledLayer;
  -[_UITextTiledLayer setDelegate:](&v4, sel_setDelegate_, a3);
  -[_UITextTiledLayer _didSetDelegate](self, "_didSetDelegate");
}

- (void)setUnsafeUnretainedDelegate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITextTiledLayer;
  -[_UITextTiledLayer setUnsafeUnretainedDelegate:](&v4, sel_setUnsafeUnretainedDelegate_, a3);
  -[_UITextTiledLayer _didSetDelegate](self, "_didSetDelegate");
}

- (void)_didSetDelegate
{
  void *v3;
  char v4;
  char v5;
  id v6;

  -[_UITextTiledLayer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = 64;
  else
    v4 = 0;
  *(_BYTE *)&self->_tcTiledLayerFlags = *(_BYTE *)&self->_tcTiledLayerFlags & 0xBF | v4;

  -[_UITextTiledLayer delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 0x80;
  else
    v5 = 0;
  *(_BYTE *)&self->_tcTiledLayerFlags = v5 & 0x80 | *(_BYTE *)&self->_tcTiledLayerFlags & 0x7F;

}

- (void)layerWillDraw:(id)a3
{
  id v4;

  if ((*(_BYTE *)&self->_tcTiledLayerFlags & 0x80000000) != 0)
  {
    -[_UITextTiledLayer delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layerWillDraw:", self);

  }
}

- (void)_drawInContext:(CGContext *)a3 offset:(CGPoint)a4 clip:(CGPath *)a5
{
  double y;
  double x;
  objc_super v10;

  y = a4.y;
  x = a4.x;
  CGContextSaveGState(a3);
  if (a5)
  {
    CGContextAddPath(a3, a5);
    CGContextEOClip(a3);
  }
  CGContextTranslateCTM(a3, -x, -y);
  v10.receiver = self;
  v10.super_class = (Class)_UITextTiledLayer;
  -[_UITextTiledLayer drawInContext:](&v10, sel_drawInContext_, a3);
  CGContextRestoreGState(a3);
}

- (void)drawInContext:(CGContext *)a3
{
  objc_super v5;
  objc_super v6;

  if ((*(_BYTE *)&self->_tcTiledLayerFlags & 1) != 0
    || self->_clip
    || !-[NSMutableArray count](self->_visibleTiles, "count"))
  {
    if (self->_clip)
    {
      CGContextSaveGState(a3);
      CGContextAddPath(a3, -[UIBezierPath CGPath](self->_clip, "CGPath"));
      CGContextEOClip(a3);
      v6.receiver = self;
      v6.super_class = (Class)_UITextTiledLayer;
      -[_UITextTiledLayer drawInContext:](&v6, sel_drawInContext_, a3);
      CGContextRestoreGState(a3);
    }
    else
    {
      v5.receiver = self;
      v5.super_class = (Class)_UITextTiledLayer;
      -[_UITextTiledLayer drawInContext:](&v5, sel_drawInContext_, a3);
    }
  }
}

- (void)setUsesTiledLayers:(BOOL)a3
{
  $C1BFBCCD4C07A2DD6B683D9DB619C5AB tcTiledLayerFlags;
  NSMutableArray *visibleTiles;

  tcTiledLayerFlags = self->_tcTiledLayerFlags;
  if (((*(unsigned int *)&tcTiledLayerFlags ^ a3) & 1) == 0)
  {
    *(_BYTE *)&self->_tcTiledLayerFlags = *(_BYTE *)&tcTiledLayerFlags & 0xFE | !a3;
    if (a3)
    {
      -[_UITextTiledLayer setContents:](self, "setContents:", 0);
    }
    else
    {
      -[NSMutableArray makeObjectsPerformSelector:](self->_visibleTiles, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);
      visibleTiles = self->_visibleTiles;
      self->_visibleTiles = 0;

    }
    -[_UITextTiledLayer setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (BOOL)usesTiledLayers
{
  return (*(_BYTE *)&self->_tcTiledLayerFlags & 1) == 0;
}

- (void)setMaxPrefetchedTiles:(double)a3
{
  self->_maxPrefetchedTiles = fmax(a3, 0.0);
}

- (NSArray)tiles
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_visibleTiles, "copy");
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  uint64_t i;
  void *v13;
  double x;
  double y;
  double width;
  double height;
  CGRect v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v18 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_tcTiledLayerFlags & 1) != 0 || !-[NSMutableArray count](self->_visibleTiles, "count"))
  {
    v19.receiver = self;
    v19.super_class = (Class)_UITextTiledLayer;
    -[_UITextTiledLayer setNeedsDisplayInRect:](&v19, sel_setNeedsDisplayInRect_, v18.origin.x, v18.origin.y, v18.size.width, v18.size.height, *(_QWORD *)&v18.origin.x, *(_QWORD *)&v18.origin.y, *(_QWORD *)&v18.size.width, *(_QWORD *)&v18.size.height);
  }
  else if ((*(_BYTE *)&self->_tcTiledLayerFlags & 0x3C) == 0)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = self->_visibleTiles;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
      v8 = *MEMORY[0x1E0C9D648];
      v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v4);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v13, "frame", *(_QWORD *)&v18.origin.x, *(_QWORD *)&v18.origin.y, *(_QWORD *)&v18.size.width, *(_QWORD *)&v18.size.height);
          v27 = CGRectIntersection(v26, v18);
          x = v27.origin.x;
          y = v27.origin.y;
          width = v27.size.width;
          height = v27.size.height;
          v28.origin.x = v8;
          v28.origin.y = v9;
          v28.size.width = v10;
          v28.size.height = v11;
          if (!CGRectEqualToRect(v27, v28))
          {
            objc_msgSend(v13, "convertRect:fromLayer:", self, x, y, width, height);
            objc_msgSend(v13, "setNeedsDisplayInRect:");
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v6);
    }

  }
}

- (id)_preparedTileForFrame:(CGRect)a3 mask:(id)a4 opacity:(double)a5 deferred:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  double y;
  double x;
  id v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void (**v21)(void *, id *);
  unsigned __int8 *v22;
  id *v23;
  void *v24;
  double v25;
  unsigned __int8 v26;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;
  CGRect v36;

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v34 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = self->_visibleTiles;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
LABEL_3:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v18)
        objc_enumerationMutation(v15);
      v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v19);
      objc_msgSend(v20, "frame", (_QWORD)v29);
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = height;
      if (CGRectEqualToRect(v35, v36))
        break;
      if (v17 == ++v19)
      {
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v17)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v22 = v20;
    v23 = (id *)v22;
    if (v6)
    {

      v21 = (void (**)(void *, id *))&__block_literal_global_565;
      if (!v23)
        goto LABEL_14;
    }
    else
    {
      v26 = atomic_load(v22 + 40);
      if ((v26 & 1) != 0)
        objc_msgSend(v22, "setNeedsDisplay");

      v21 = (void (**)(void *, id *))&__block_literal_global_50_2;
    }
    -[NSMutableArray removeObject:](self->_visibleTiles, "removeObject:", v23);
  }
  else
  {
LABEL_9:

    if (v6)
      v21 = (void (**)(void *, id *))&__block_literal_global_565;
    else
      v21 = (void (**)(void *, id *))&__block_literal_global_50_2;
LABEL_14:
    v23 = (id *)objc_opt_new();
    objc_msgSend(v23, "setDelegate:", self);
    objc_msgSend(v23, "setFrame:", x, y, width, height);
    -[_UITextTiledLayer contentsScale](self, "contentsScale");
    objc_msgSend(v23, "setContentsScale:");
    -[_UITextTiledLayer rasterizationScale](self, "rasterizationScale");
    objc_msgSend(v23, "setRasterizationScale:");
    objc_msgSend(v23, "setDrawsAsynchronously:", -[_UITextTiledLayer drawsAsynchronously](self, "drawsAsynchronously"));
    -[_UITextTiledLayer contentsFormat](self, "contentsFormat");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setContentsFormat:", v24);

    objc_msgSend(v23, "setContentsMultiplyColor:", -[_UITextTiledLayer contentsMultiplyColor](self, "contentsMultiplyColor"));
    -[_UITextTiledLayer addSublayer:](self, "addSublayer:", v23);
    v21[2](v21, v23);
  }
  v27 = v23[4];
  if (v14)
  {
    if (!v27 || (objc_msgSend(v27, "isEqual:", v14) & 1) == 0)
    {
      objc_storeStrong(v23 + 4, a4);
LABEL_25:
      v21[2](v21, v23);
    }
  }
  else if (v27)
  {
    v23[4] = 0;

    goto LABEL_25;
  }
  *(float *)&v25 = a5;
  objc_msgSend(v23, "setOpacity:", v25, (_QWORD)v29);

  return v23;
}

- (void)setContentsScale:(double)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_UITextTiledLayer;
  -[_UITextTiledLayer setContentsScale:](&v14, sel_setContentsScale_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_visibleTiles;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setContentsScale:", a3, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)setRasterizationScale:(double)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_UITextTiledLayer;
  -[_UITextTiledLayer setRasterizationScale:](&v14, sel_setRasterizationScale_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_visibleTiles;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setRasterizationScale:", a3, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)setDrawsAsynchronously:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_UITextTiledLayer;
  -[_UITextTiledLayer setDrawsAsynchronously:](&v14, sel_setDrawsAsynchronously_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_visibleTiles;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setDrawsAsynchronously:", v3, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)setContentsFormat:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UITextTiledLayer;
  -[_UITextTiledLayer setContentsFormat:](&v14, sel_setContentsFormat_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_visibleTiles;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setContentsFormat:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)setContentsMultiplyColor:(CGColor *)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_UITextTiledLayer;
  -[_UITextTiledLayer setContentsMultiplyColor:](&v14, sel_setContentsMultiplyColor_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_visibleTiles;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setContentsMultiplyColor:", a3, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (id)_prepareTilesForVisibleBounds:(CGRect)a3 inBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  id v13;
  CGSize *p_tileSize;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double MaxY;
  void *v30;
  void *v31;
  int64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  _BOOL8 v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  int64_t v69;
  int64_t v70;
  uint64_t v71;
  int64_t v72;
  void *v73;
  double rect2;
  double v75;
  double v76;
  double rect;
  uint64_t v78;
  double v79;
  double MaxX;
  double v81;
  double MinX;
  double MinY;
  double v84;
  CGFloat v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  uint64_t v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v91 = *MEMORY[0x1E0C80C00];
  if (CGRectIsEmpty(a3))
  {
    v13 = 0;
  }
  else
  {
    p_tileSize = &self->_tileSize;
    v15 = v8;
    v16 = v9;
    v17 = v10;
    v18 = v11;
    v76 = v10;
    rect = v9;
    v75 = v11;
    if (self->_tileSize.height > 0.0)
    {
      v15 = v8;
      v16 = v9;
      v17 = v10;
      v18 = v11;
      if (v9 > 0.0)
      {
        v15 = v8;
        v16 = v9;
        v17 = v10;
        v18 = v11;
        if (v8 > 0.0)
        {
          -[_UITextTiledLayer maxPrefetchedTiles](self, "maxPrefetchedTiles", v11, v10, v9, v8);
          v20 = v19 <= 0.0;
          v15 = v8;
          v17 = v10;
          v16 = v9;
          v18 = v11;
          if (!v20)
          {
            v21 = self->_tileSize.height * -2.0;
            -[_UITextTiledLayer maxPrefetchedTiles](self, "maxPrefetchedTiles");
            v23 = v21 * v22;
            v92.origin.x = v11;
            v92.origin.y = v10;
            v92.size.width = rect;
            v92.size.height = v8;
            v113 = CGRectInset(v92, 0.0, v23);
            v93.origin.x = x;
            v93.origin.y = y;
            v93.size.width = width;
            v93.size.height = height;
            *(CGRect *)&v18 = CGRectIntersection(v93, v113);
          }
        }
      }
    }
    v85 = height;
    rect2 = v8;
    v94 = CGRectOffset(*(CGRect *)&v18, -x, -y);
    v24 = v94.origin.x;
    v25 = v94.origin.y;
    v26 = v94.size.width;
    v27 = v94.size.height;
    v28 = p_tileSize->width;
    v84 = self->_tileSize.height;
    v71 = vcvtmd_s64_f64(CGRectGetMinX(v94) / p_tileSize->width);
    v95.origin.x = v24;
    v95.origin.y = v25;
    v95.size.width = v26;
    v95.size.height = v27;
    MinY = CGRectGetMinY(v95);
    v96.origin.x = v24;
    v96.origin.y = v25;
    v96.size.width = v26;
    v96.size.height = v27;
    v69 = vcvtpd_s64_f64(CGRectGetMaxX(v96) / v28);
    v97.origin.x = v24;
    v97.origin.y = v25;
    v97.size.width = v26;
    v97.size.height = v27;
    MaxY = CGRectGetMaxY(v97);
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((*(_BYTE *)&self->_tcTiledLayerFlags & 0x40) != 0)
    {
      -[_UITextTiledLayer delegate](self, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_textTiledLayer:maskedRectsInVisibleRect:", self, v75, v76, rect, rect2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v30 = 0;
    }
    v98.origin.x = x;
    v98.origin.y = y;
    v98.size.width = width;
    v98.size.height = v85;
    MinX = CGRectGetMinX(v98);
    v99.origin.x = x;
    v99.origin.y = y;
    v99.size.width = width;
    v99.size.height = v85;
    v81 = CGRectGetMinY(v99);
    v100.origin.x = x;
    v100.origin.y = y;
    v100.size.width = width;
    v100.size.height = v85;
    MaxX = CGRectGetMaxX(v100);
    v101.origin.x = x;
    v101.origin.y = y;
    v101.size.width = width;
    v101.size.height = v85;
    v79 = CGRectGetMaxY(v101);
    if (v71 < v69)
    {
      v70 = vcvtmd_s64_f64(MinY / v84);
      v32 = vcvtpd_s64_f64(MaxY / v84);
      v73 = v30;
      v72 = v32;
      do
      {
        if (v70 < v32)
        {
          v33 = v70;
          do
          {
            v35 = p_tileSize->width;
            v34 = p_tileSize->height;
            v36 = MinX + p_tileSize->width * (double)v71;
            v37 = v81 + v34 * (double)v33;
            v102.origin.x = v36;
            v102.origin.y = v37;
            v102.size.width = p_tileSize->width;
            v102.size.height = v34;
            if (CGRectGetMaxX(v102) > MaxX)
            {
              v103.origin.x = v36;
              v103.origin.y = v81 + v34 * (double)v33;
              v103.size.width = v35;
              v103.size.height = v34;
              v35 = MaxX - CGRectGetMinX(v103);
            }
            v104.origin.x = v36;
            v104.origin.y = v81 + v34 * (double)v33;
            v104.size.width = v35;
            v104.size.height = v34;
            if (CGRectGetMaxY(v104) > v79)
            {
              v105.origin.x = v36;
              v105.origin.y = v81 + v34 * (double)v33;
              v105.size.width = v35;
              v105.size.height = v34;
              v34 = v79 - CGRectGetMinY(v105);
            }
            v106.origin.x = v36;
            v106.origin.y = v37;
            v106.size.width = v35;
            v106.size.height = v34;
            if (!CGRectIsEmpty(v106))
            {
              v107.origin.x = v36;
              v107.origin.y = v37;
              v107.size.width = v35;
              v107.size.height = v34;
              v114.origin.x = v75;
              v114.origin.y = v76;
              v114.size.width = rect;
              v114.size.height = rect2;
              v38 = !CGRectIntersectsRect(v107, v114);
              if (objc_msgSend(v30, "count"))
              {
                v78 = v33;
                v88 = 0u;
                v89 = 0u;
                v86 = 0u;
                v87 = 0u;
                v39 = v30;
                v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v86, v90, 16);
                if (v40)
                {
                  v41 = v40;
                  v42 = 0;
                  v43 = *(_QWORD *)v87;
                  do
                  {
                    for (i = 0; i != v41; ++i)
                    {
                      if (*(_QWORD *)v87 != v43)
                        objc_enumerationMutation(v39);
                      v45 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
                      objc_msgSend(v45, "boundingRect", v69);
                      v47 = v46;
                      v49 = v48;
                      v51 = v50;
                      v53 = v52;
                      objc_msgSend(v45, "alpha");
                      if (v54 < 1.0)
                      {
                        v108.origin.x = v47;
                        v108.origin.y = v49;
                        v108.size.width = v51;
                        v108.size.height = v53;
                        v115.origin.x = v36;
                        v115.origin.y = v37;
                        v115.size.width = v35;
                        v115.size.height = v34;
                        if (CGRectIntersectsRect(v108, v115))
                        {
                          v109.origin.x = v47;
                          v109.origin.y = v49;
                          v109.size.width = v51;
                          v109.size.height = v53;
                          v116.origin.x = v36;
                          v116.origin.y = v37;
                          v116.size.width = v35;
                          v116.size.height = v34;
                          v110 = CGRectIntersection(v109, v116);
                          v55 = v110.origin.x;
                          v56 = v110.origin.y;
                          v57 = v110.size.width;
                          v58 = v110.size.height;
                          objc_msgSend(v45, "alpha");
                          if (v59 > 0.0)
                          {
                            objc_msgSend(v45, "alpha");
                            -[_UITextTiledLayer _preparedTileForFrame:mask:opacity:deferred:](self, "_preparedTileForFrame:mask:opacity:deferred:", 0, v38, v55, v56, v57, v58, v60);
                            v61 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v13, "addObject:", v61);

                          }
                          v111.origin.x = v55;
                          v111.origin.y = v56;
                          v111.size.width = v57;
                          v111.size.height = v58;
                          v112 = CGRectOffset(v111, -v36, -v37);
                          v62 = v112.origin.x;
                          v63 = v112.origin.y;
                          v64 = v112.size.width;
                          v65 = v112.size.height;
                          if (!v42)
                          {
                            +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 0.0, 0.0, v35, v34);
                            v42 = (void *)objc_claimAutoreleasedReturnValue();
                          }
                          +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v62, v63, v64, v65);
                          v66 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v42, "appendPath:", v66);

                        }
                      }
                    }
                    v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v86, v90, 16);
                  }
                  while (v41);
                }
                else
                {
                  v42 = 0;
                }

                v30 = v73;
                p_tileSize = &self->_tileSize;
                v32 = v72;
                v33 = v78;
              }
              else
              {
                v42 = 0;
              }
              -[_UITextTiledLayer _preparedTileForFrame:mask:opacity:deferred:](self, "_preparedTileForFrame:mask:opacity:deferred:", v42, v38, v36, v37, v35, v34, 1.0, v69);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v67);

            }
            ++v33;
          }
          while (v33 != v32);
        }
        ++v71;
      }
      while (v71 != v69);
    }

  }
  return v13;
}

- (id)_prepareNonTiledGhostLayersForVisibleBounds:(CGRect)a3 inBounds:(CGRect)a4
{
  double y;
  double width;
  double height;
  UIBezierPath *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double x;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  UIBezierPath *clip;
  UIBezierPath *v38;
  double rect2[5];
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v45 = *MEMORY[0x1E0C80C00];
  rect2[0] = a3.origin.x;
  y = a3.origin.y;
  width = a3.size.width;
  height = a3.size.height;
  if (CGRectIsEmpty(a3))
  {
    v8 = 0;
    v9 = 0;
  }
  else
  {
    -[_UITextTiledLayer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[_UITextTiledLayer delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_textTiledLayer:maskedRectsInVisibleRect:", self, rect2[0], y, width, height);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v13, "count"))
    {
      v42 = 0u;
      v43 = 0u;
      memset(&rect2[1], 0, 32);
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &rect2[1], v44, 16);
      if (v15)
      {
        v16 = v15;
        v8 = 0;
        v17 = **(_QWORD **)&rect2[3];
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (**(_QWORD **)&rect2[3] != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*(_QWORD *)&rect2[2] + 8 * i);
            objc_msgSend(v19, "boundingRect");
            v21 = v20;
            v23 = v22;
            v25 = v24;
            v27 = v26;
            objc_msgSend(v19, "alpha");
            if (v28 < 1.0)
            {
              v46.origin.x = v21;
              v46.origin.y = v23;
              v46.size.width = v25;
              v46.size.height = v27;
              v49.origin.x = rect2[0];
              v49.origin.y = y;
              v49.size.width = width;
              v49.size.height = height;
              if (CGRectIntersectsRect(v46, v49))
              {
                v47.origin.x = v21;
                v47.origin.y = v23;
                v47.size.width = v25;
                v47.size.height = v27;
                v48 = CGRectIntersection(v47, a4);
                x = v48.origin.x;
                v30 = v48.origin.y;
                v31 = v48.size.width;
                v32 = v48.size.height;
                objc_msgSend(v19, "alpha");
                if (v33 > 0.0)
                {
                  objc_msgSend(v19, "alpha");
                  -[_UITextTiledLayer _preparedTileForFrame:mask:opacity:deferred:](self, "_preparedTileForFrame:mask:opacity:deferred:", 0, 0, x, v30, v31, v32, v34);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "addObject:", v35);

                }
                if (!v8)
                {
                  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 0.0, 0.0, a4.size.width, a4.size.height);
                  v8 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
                }
                +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", x, v30, v31, v32);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIBezierPath appendPath:](v8, "appendPath:", v36);

              }
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &rect2[1], v44, 16);
        }
        while (v16);
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  clip = self->_clip;
  self->_clip = v8;
  v38 = v8;

  return v9;
}

- (void)_updateTilingViewportWindow:(id)a3
{
  char tcTiledLayerFlags;
  id WeakRetained;
  id v6;
  double v7;
  CGSize v8;
  CGSize v9;
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  id v27;
  id v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  id obj;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  objc_msgSend(a3, "layer");
  obj = (id)objc_claimAutoreleasedReturnValue();
  tcTiledLayerFlags = (char)self->_tcTiledLayerFlags;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewportLayer);

  if ((tcTiledLayerFlags & 1) != 0)
  {
    objc_storeWeak((id *)&self->_viewportLayer, 0);
    self->_viewportLayerExtraWidthFactor = 0.0;
    v9 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_visibleViewportBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_visibleViewportBounds.size = v9;
    if (WeakRetained)
    {
LABEL_7:
      -[_UITextTiledLayer setNeedsLayout](self, "setNeedsLayout");
      v10 = objc_loadWeakRetained((id *)&self->_viewportLayer);
      objc_msgSend(v10, "bounds");
      objc_msgSend(v10, "convertRect:toLayer:", self);
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;

      v50.origin.x = v12;
      v50.origin.y = v14;
      v50.size.width = v16;
      v50.size.height = v18;
      v51 = CGRectInset(v50, -(v16 * self->_viewportLayerExtraWidthFactor), 0.0);
      x = v51.origin.x;
      y = v51.origin.y;
      width = v51.size.width;
      height = v51.size.height;
      -[_UITextTiledLayer bounds](self, "bounds");
      v57.origin.x = v23;
      v57.origin.y = v24;
      v57.size.width = v25;
      v57.size.height = v26;
      v52.origin.x = x;
      v52.origin.y = y;
      v52.size.width = width;
      v52.size.height = height;
      self->_visibleViewportBounds = CGRectIntersection(v52, v57);
      goto LABEL_8;
    }
  }
  else if (obj != WeakRetained)
  {
    v6 = objc_storeWeak((id *)&self->_viewportLayer, obj);

    v7 = 1.0;
    if (!obj)
    {
      v8 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      self->_visibleViewportBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      self->_visibleViewportBounds.size = v8;
      v7 = 0.0;
    }
    self->_viewportLayerExtraWidthFactor = v7;
    goto LABEL_7;
  }
  v27 = objc_loadWeakRetained((id *)&self->_viewportLayer);

  if (v27)
  {
    v28 = objc_loadWeakRetained((id *)&self->_viewportLayer);
    objc_msgSend(v28, "bounds");
    objc_msgSend(v28, "convertRect:toLayer:", self);
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;

    v53.origin.x = v30;
    v53.origin.y = v32;
    v53.size.width = v34;
    v53.size.height = v36;
    v54 = CGRectInset(v53, -(v34 * self->_viewportLayerExtraWidthFactor), 0.0);
    v37 = v54.origin.x;
    v38 = v54.origin.y;
    v39 = v54.size.width;
    v40 = v54.size.height;
    -[_UITextTiledLayer bounds](self, "bounds");
    v58.origin.x = v41;
    v58.origin.y = v42;
    v58.size.width = v43;
    v58.size.height = v44;
    v55.origin.x = v37;
    v55.origin.y = v38;
    v55.size.width = v39;
    v55.size.height = v40;
    v56 = CGRectIntersection(v55, v58);
    v45 = v56.origin.x;
    v46 = v56.origin.y;
    v47 = v56.size.width;
    v48 = v56.size.height;
    if (!CGRectEqualToRect(self->_visibleViewportBounds, v56))
    {
      -[_UITextTiledLayer setNeedsLayout](self, "setNeedsLayout");
      self->_visibleViewportBounds.origin.x = v45;
      self->_visibleViewportBounds.origin.y = v46;
      self->_visibleViewportBounds.size.width = v47;
      self->_visibleViewportBounds.size.height = v48;
    }
  }
LABEL_8:

}

- (void)layoutSublayers
{
  double v3;
  void *WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double height;
  double width;
  double y;
  double x;
  id v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  UIBezierPath *v26;
  double v27;
  CGSize *p_tileSize;
  double v29;
  double v30;
  double v31;
  char v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  unint64_t v39;
  double v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  unint64_t v48;
  double v49;
  unint64_t v50;
  double v51;
  unint64_t v52;
  double v53;
  double v54;
  UIBezierPath *v55;
  NSMutableArray *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  uint64_t v61;
  void *v62;
  UIBezierPath *clip;
  UIBezierPath *v64;
  UIBezierPath *v65;
  UIBezierPath *v66;
  BOOL v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  objc_super v77;
  objc_super v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  uint64_t v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;

  v84 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_tcTiledLayerFlags & 0x3C) != 0)
    goto LABEL_44;
  -[_UITextTiledLayer maxTileHeight](self, "maxTileHeight");
  v75 = v3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewportLayer);

  -[_UITextTiledLayer bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  height = v11;
  width = v9;
  y = v7;
  x = v5;
  if (WeakRetained)
  {
    v17 = objc_loadWeakRetained((id *)&self->_viewportLayer);
    objc_msgSend(v17, "bounds");
    objc_msgSend(v17, "convertRect:toLayer:", self);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v85.origin.x = v19;
    v85.origin.y = v21;
    v85.size.width = v23;
    v85.size.height = v25;
    v86 = CGRectInset(v85, -(v23 * self->_viewportLayerExtraWidthFactor), 0.0);
    v99.origin.x = v6;
    v99.origin.y = v8;
    v99.size.width = v10;
    v99.size.height = v12;
    v87 = CGRectIntersection(v86, v99);
    x = v87.origin.x;
    y = v87.origin.y;
    width = v87.size.width;
    height = v87.size.height;
  }
  self->_visibleViewportBounds.origin.x = x;
  self->_visibleViewportBounds.origin.y = y;
  self->_visibleViewportBounds.size.width = width;
  self->_visibleViewportBounds.size.height = height;
  v26 = self->_clip;
  if (width <= 0.0)
    goto LABEL_12;
  v27 = 256.0;
  if (v75 <= 256.0)
    v27 = v75;
  if ((*(_BYTE *)&self->_tcTiledLayerFlags & 1) != 0 || v27 >= v12)
  {
LABEL_12:
    if (WeakRetained)
    {
      v89.origin.x = x;
      v89.origin.y = y;
      v89.size.width = width;
      v89.size.height = height;
      if (CGRectIsEmpty(v89))
      {
        v32 = 0;
        WeakRetained = 0;
        goto LABEL_19;
      }
      -[_UITextTiledLayer _prepareNonTiledGhostLayersForVisibleBounds:inBounds:](self, "_prepareNonTiledGhostLayersForVisibleBounds:inBounds:", x, y, width, height, v6, v8, v10, v12);
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_16;
  }
  p_tileSize = &self->_tileSize;
  self->_tileSize.width = width;
  self->_tileSize.height = v27;
  if (!WeakRetained)
  {
LABEL_16:
    v32 = 0;
    goto LABEL_19;
  }
  v88.origin.x = x;
  v88.origin.y = y;
  v88.size.width = width;
  v88.size.height = height;
  v76 = height;
  v29 = v6;
  v100.origin.x = v6;
  v30 = v8;
  v100.origin.y = v8;
  v100.size.width = v10;
  v100.size.height = v12;
  if (CGRectEqualToRect(v88, v100))
  {
    v31 = v76;
  }
  else
  {
    v74 = y;
    v33 = v29;
    v34 = x;
    v35 = v30;
    v36 = p_tileSize->width;
    v37 = self->_tileSize.height;
    v90.origin.x = v33;
    v90.origin.y = v35;
    v90.size.width = v10;
    v90.size.height = v12;
    v38 = CGRectGetMinX(v90) / v36;
    v72 = floor(v38);
    v39 = vcvtmd_s64_f64(v38);
    v91.origin.x = v33;
    v91.origin.y = v35;
    v91.size.width = v10;
    v91.size.height = v12;
    v40 = CGRectGetMinY(v91) / v37;
    v71 = floor(v40);
    v41 = vcvtmd_s64_f64(v40);
    v92.origin.x = v33;
    v92.origin.y = v35;
    v92.size.width = v10;
    v92.size.height = v12;
    v42 = vcvtpd_s64_f64(CGRectGetMaxX(v92) / v36);
    v93.origin.x = v33;
    v93.origin.y = v35;
    v93.size.width = v10;
    v93.size.height = v12;
    v43 = vcvtpd_s64_f64(CGRectGetMaxY(v93) / v37);
    v44 = p_tileSize->width;
    v45 = self->_tileSize.height;
    v46 = p_tileSize->width * (double)(uint64_t)v72;
    v73 = p_tileSize->width * (double)(uint64_t)(v42 - v39);
    v12 = v45 * (double)(uint64_t)(v43 - v41);
    v94.origin.x = v34;
    v94.origin.y = v74;
    v94.size.width = width;
    v94.size.height = v76;
    v47 = CGRectGetMinX(v94) / v44;
    v70 = floor(v47);
    v48 = vcvtmd_s64_f64(v47);
    v95.origin.x = v34;
    v95.origin.y = v74;
    v95.size.width = width;
    v95.size.height = v76;
    v49 = CGRectGetMinY(v95) / v45;
    v69 = floor(v49);
    v50 = vcvtmd_s64_f64(v49);
    v96.origin.x = v34;
    v96.origin.y = v74;
    v96.size.width = width;
    v96.size.height = v76;
    v51 = CGRectGetMaxX(v96) / v44;
    v29 = v46;
    v52 = vcvtpd_s64_f64(v51);
    v97.origin.x = v34;
    v97.origin.y = v74;
    v97.size.width = width;
    v97.size.height = v76;
    v53 = CGRectGetMaxY(v97) / v45;
    v30 = v45 * (double)(uint64_t)v71;
    v10 = v73;
    v54 = self->_tileSize.height;
    x = p_tileSize->width * (double)(uint64_t)v70;
    y = v54 * (double)(uint64_t)v69;
    width = p_tileSize->width * (double)(uint64_t)(v52 - v48);
    v31 = v54 * (double)(uint64_t)(vcvtpd_s64_f64(v53) - v50);
  }
  -[_UITextTiledLayer _prepareTilesForVisibleBounds:inBounds:](self, "_prepareTilesForVisibleBounds:inBounds:", x, y, width, v31, v29, v30, v10, v12);
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 1;
  height = v31;
LABEL_19:
  if (-[NSMutableArray count](self->_visibleTiles, "count"))
  {
    v55 = v26;
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v56 = self->_visibleTiles;
    v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v58; ++i)
        {
          if (*(_QWORD *)v80 != v59)
            objc_enumerationMutation(v56);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "removeFromSuperlayer");
        }
        v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
      }
      while (v58);
    }

    v26 = v55;
  }
  if ((v32 & 1) != 0)
  {
    -[_UITextTiledLayer setContents:](self, "setContents:", 0);
  }
  else
  {
    v98.origin.x = x;
    v98.origin.y = y;
    v98.size.width = width;
    v98.size.height = height;
    if (!CGRectIsEmpty(v98))
    {
      -[_UITextTiledLayer contents](self, "contents");
      v61 = objc_claimAutoreleasedReturnValue();
      if (v61)
      {
        v62 = (void *)v61;
        clip = self->_clip;
        v64 = v26;
        v65 = clip;
        if (v64 == v65)
        {

          goto LABEL_40;
        }
        v66 = v65;
        if (v64 && v65)
        {
          v67 = -[UIBezierPath isEqual:](v64, "isEqual:", v65);

          if (v67)
            goto LABEL_40;
        }
        else
        {

        }
      }
      v78.receiver = self;
      v78.super_class = (Class)_UITextTiledLayer;
      -[_UITextTiledLayer setNeedsDisplayInRect:](&v78, sel_setNeedsDisplayInRect_, x, y, width, height);
    }
  }
LABEL_40:
  if (objc_msgSend(WeakRetained, "count"))
    v68 = WeakRetained;
  else
    v68 = 0;
  objc_storeStrong((id *)&self->_visibleTiles, v68);

LABEL_44:
  v77.receiver = self;
  v77.super_class = (Class)_UITextTiledLayer;
  -[_UITextTiledLayer layoutSublayers](&v77, sel_layoutSublayers);
}

- (void)suspendTiling
{
  *(_BYTE *)&self->_tcTiledLayerFlags = (*(_BYTE *)&self->_tcTiledLayerFlags + 4) & 0x3C | *(_BYTE *)&self->_tcTiledLayerFlags & 0xC3;
}

- (void)resumeTiling
{
  char tcTiledLayerFlags;
  void *v5;

  tcTiledLayerFlags = (char)self->_tcTiledLayerFlags;
  if ((tcTiledLayerFlags & 0x3C) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextTiledLayer.m"), 776, CFSTR("suspendLayout underflow!"));

    tcTiledLayerFlags = (char)self->_tcTiledLayerFlags;
  }
  *(_BYTE *)&self->_tcTiledLayerFlags = (tcTiledLayerFlags + 60) & 0x3C | tcTiledLayerFlags & 0xC3;
  if (!((tcTiledLayerFlags + 60) & 0x3C | tcTiledLayerFlags & 1))
    -[_UITextTiledLayer setNeedsLayout](self, "setNeedsLayout");
}

- (double)maxTileHeight
{
  return self->_maxTileHeight;
}

- (void)setMaxTileHeight:(double)a3
{
  self->_maxTileHeight = a3;
}

- (double)maxPrefetchedTiles
{
  return self->_maxPrefetchedTiles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clip, 0);
  objc_destroyWeak((id *)&self->_viewportLayer);
  objc_storeStrong((id *)&self->_visibleTiles, 0);
}

@end

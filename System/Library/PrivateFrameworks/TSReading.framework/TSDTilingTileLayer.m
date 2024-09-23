@implementation TSDTilingTileLayer

- (void)display
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  _QWORD v8[5];

  v3 = (void *)-[TSDTilingTileLayer superlayer](self, "superlayer");
  v4 = (void *)objc_msgSend(v3, "delegate");
  if (objc_msgSend(v3, "drawsInBackground")
    && (objc_opt_respondsToSelector() & 1) != 0
    && (v5 = objc_msgSend(v4, "queueForDrawingTilingLayerInBackground:", v3)) != 0
    && (v6 = (void *)v5, objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread")))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __29__TSDTilingTileLayer_display__block_invoke;
    v8[3] = &unk_24D829278;
    v8[4] = self;
    objc_msgSend(v6, "drainAndPerformSync:", v8);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TSDTilingTileLayer;
    -[TSDTilingTileLayer display](&v7, sel_display);
  }
}

id __29__TSDTilingTileLayer_display__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)TSDTilingTileLayer;
  return objc_msgSendSuper2(&v2, sel_display);
}

- (void)drawInContext:(CGContext *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "threadDictionary");
  v6 = (void *)MEMORY[0x24BDD1968];
  -[TSDTilingTileLayer position](self, "position");
  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(v6, "valueWithCGPoint:"), CFSTR("TSDTilingTileLayerPositionTLSKey"));
  objc_msgSend((id)-[TSDTilingTileLayer superlayer](self, "superlayer"), "i_drawTile:inContext:", self, a3);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "threadDictionary"), "removeObjectForKey:", CFSTR("TSDTilingTileLayerPositionTLSKey"));
}

- (id)hitTest:(CGPoint)a3
{
  return 0;
}

- (void)updateFrameWithTileSize:(CGSize)a3 tilesWide:(unint64_t)a4 tilesHigh:(unint64_t)a5 geometryProvider:(id)a6
{
  double height;
  double width;
  double v12;
  double v13;
  unint64_t mIndex;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  _BOOL4 v41;
  void *v42;
  uint64_t v43;
  unsigned int v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  unsigned int v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  height = a3.height;
  width = a3.width;
  objc_msgSend((id)-[TSDTilingTileLayer superlayer](self, "superlayer"), "bounds");
  mIndex = self->mIndex;
  v15 = mIndex / a4;
  v16 = mIndex % a4;
  v49 = 0;
  v47 = v13;
  v48 = v12;
  v45 = v18;
  v46 = v17;
  if (a6)
  {
    objc_msgSend(a6, "tileGeometryRectWithLayer:atIndex:mask:", -[TSDTilingTileLayer superlayer](self, "superlayer"), self->mIndex, &v49);
    v20 = v19;
    v22 = v21;
  }
  else
  {
    v20 = v12 + width * (double)v16;
    v22 = v13 + height * (double)v15;
  }
  -[TSDTilingTileLayer position](self, "position");
  if (v20 != v24 || v22 != v23)
    -[TSDTilingTileLayer setPosition:](self, "setPosition:", v20, v22);
  v26 = TSDRectWithSize();
  v28 = v27;
  v30 = v29;
  v32 = v31;
  if (!a6 && (v16 == a4 - 1 || v15 == a5 - 1))
  {
    v50.origin.x = v20;
    v50.origin.y = v22;
    v50.size.width = width;
    v50.size.height = height;
    v53.origin.y = v47;
    v53.origin.x = v48;
    v53.size.height = v45;
    v53.size.width = v46;
    CGRectIntersection(v50, v53);
    v26 = TSDRectWithSize();
    v28 = v34;
    v30 = v35;
    v32 = v36;
  }
  -[TSDTilingTileLayer bounds](self, "bounds");
  v54.origin.x = v37;
  v54.origin.y = v38;
  v54.size.width = v39;
  v54.size.height = v40;
  v51.origin.x = v26;
  v51.origin.y = v28;
  v51.size.width = v30;
  v51.size.height = v32;
  if (!CGRectEqualToRect(v51, v54))
  {
    -[TSDTilingTileLayer bounds](self, "bounds");
    v41 = CGRectEqualToRect(v52, *MEMORY[0x24BDBF090]);
    -[TSDTilingTileLayer setBounds:](self, "setBounds:", v26, v28, v30, v32);
    v42 = (void *)-[TSDTilingTileLayer superlayer](self, "superlayer");
    if (v41)
      objc_msgSend(v42, "i_setNeedsTileDisplayForTile:", self);
    else
      objc_msgSend(v42, "setNeedsDisplay");
  }
  v43 = v49;
  if (!a6)
  {
    v44 = v49 | (v16 == 0);
    if (v16 == a4 - 1)
      v44 |= 2u;
    if (mIndex < a4)
      v44 |= 4u;
    if (v15 == a5 - 1)
      v43 = v44 | 8;
    else
      v43 = v44;
  }
  if (-[TSDTilingTileLayer edgeAntialiasingMask](self, "edgeAntialiasingMask") != (_DWORD)v43)
    -[TSDTilingTileLayer setEdgeAntialiasingMask:](self, "setEdgeAntialiasingMask:", v43);
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)-[TSDTilingTileLayer superlayer](self, "superlayer");
  if (objc_msgSend(v8, "drawsInBackground")
    && (objc_msgSend(v8, "delegate"), (objc_opt_respondsToSelector() & 1) != 0)
    && objc_msgSend((id)objc_msgSend(v8, "delegate"), "canDrawTilingLayerInBackground:", v8))
  {
    objc_msgSend(v8, "i_drawTileInBackground:inRect:", self, x, y, width, height);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TSDTilingTileLayer;
    -[TSDTilingTileLayer setNeedsDisplayInRect:](&v9, sel_setNeedsDisplayInRect_, x, y, width, height);
  }
}

- (void)setNeedsDisplayInRectIgnoringBackground:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDTilingTileLayer;
  -[TSDTilingTileLayer setNeedsDisplayInRect:](&v3, sel_setNeedsDisplayInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)tileContentsLayer
{
  return (id)objc_msgSend((id)-[TSDTilingTileLayer sublayers](self, "sublayers"), "objectAtIndex:", 0);
}

- (unint64_t)index
{
  return self->mIndex;
}

- (void)setIndex:(unint64_t)a3
{
  self->mIndex = a3;
}

- (BOOL)needsTileDisplay
{
  return self->mNeedsTileDisplay;
}

- (void)setNeedsTileDisplay:(BOOL)a3
{
  self->mNeedsTileDisplay = a3;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)location
{
  $E140945EF3E8D97A3C8D58D8215F2D07 *p_mLocation;
  unint64_t x;
  unint64_t y;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  p_mLocation = &self->mLocation;
  x = self->mLocation.x;
  y = p_mLocation->y;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setLocation:(id)a3
{
  self->mLocation = ($E140945EF3E8D97A3C8D58D8215F2D07)a3;
}

@end

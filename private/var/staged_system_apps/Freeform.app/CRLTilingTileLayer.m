@implementation CRLTilingTileLayer

- (void)drawInContext:(CGContext *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "threadDictionary"));
  -[CRLTilingTileLayer position](self, "position");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:"));
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("CRLTilingTileLayerPositionTLSKey"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingTileLayer superlayer](self, "superlayer"));
  objc_msgSend(v8, "i_drawTile:inContext:", self, a3);

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "threadDictionary"));
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("CRLTilingTileLayerPositionTLSKey"));

}

- (id)hitTest:(CGPoint)a3
{
  return 0;
}

- (void)updateFrameWithTileSize:(CGSize)a3 tilesWide:(unint64_t)a4 tilesHigh:(unint64_t)a5
{
  double height;
  double width;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t index;
  unint64_t v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  _BOOL4 v39;
  void *v40;
  unsigned int v41;
  uint64_t v42;
  CGFloat v43;
  CGFloat v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  height = a3.height;
  width = a3.width;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingTileLayer superlayer](self, "superlayer"));
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v43 = v16;
  v44 = v15;

  index = self->_index;
  v18 = index / a4;
  v19 = index % a4;
  v20 = v14 + height * (double)(index / a4);
  -[CRLTilingTileLayer position](self, "position");
  if (v12 + width * (double)(index % a4) != v22 || v20 != v21)
    -[CRLTilingTileLayer setPosition:](self, "setPosition:", v12 + width * (double)(index % a4), v20);
  if (v19 == a4 - 1 || (v24 = sub_10005FDDC(), v18 == a5 - 1))
  {
    v45.origin.x = v12 + width * (double)(index % a4);
    v45.origin.y = v14 + height * (double)(index / a4);
    v45.size.width = width;
    v45.size.height = height;
    v48.origin.x = v12;
    v48.origin.y = v14;
    v48.size.height = v43;
    v48.size.width = v44;
    CGRectIntersection(v45, v48);
    v28 = sub_10005FDDC();
    v30 = v29;
    v32 = v31;
    v34 = v33;
  }
  else
  {
    v32 = v26;
    v34 = v27;
    v28 = v24;
    v30 = v25;
  }
  -[CRLTilingTileLayer bounds](self, "bounds", *(_QWORD *)&v43, *(_QWORD *)&v44);
  v49.origin.x = v35;
  v49.origin.y = v36;
  v49.size.width = v37;
  v49.size.height = v38;
  v46.origin.x = v28;
  v46.origin.y = v30;
  v46.size.width = v32;
  v46.size.height = v34;
  if (!CGRectEqualToRect(v46, v49))
  {
    -[CRLTilingTileLayer bounds](self, "bounds");
    v50.origin.x = CGRectZero.origin.x;
    v50.origin.y = CGRectZero.origin.y;
    v50.size.width = CGRectZero.size.width;
    v50.size.height = CGRectZero.size.height;
    v39 = CGRectEqualToRect(v47, v50);
    -[CRLTilingTileLayer setBounds:](self, "setBounds:", v28, v30, v32, v34);
    if (v39)
    {
      -[CRLTilingTileLayer setNeedsDisplay](self, "setNeedsDisplay");
    }
    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingTileLayer superlayer](self, "superlayer"));
      objc_msgSend(v40, "setNeedsDisplay");

    }
  }
  v41 = v19 == 0;
  if (v19 == a4 - 1)
    v41 |= 2u;
  if (index < a4)
    v41 |= 4u;
  if (v18 == a5 - 1)
    v42 = v41 | 8;
  else
    v42 = v41;
  if (-[CRLTilingTileLayer edgeAntialiasingMask](self, "edgeAntialiasingMask") != (_DWORD)v42)
    -[CRLTilingTileLayer setEdgeAntialiasingMask:](self, "setEdgeAntialiasingMask:", v42);
}

- (void)setNeedsDisplayInRectIgnoringBackground:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLTilingTileLayer;
  -[CRLTilingTileLayer setNeedsDisplayInRect:](&v3, "setNeedsDisplayInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end

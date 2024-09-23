@implementation PUExpandableTileLayoutInfo

- (PUExpandableTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 cornerRadius:(double)a6 alpha:(double)a7 transform:(CGAffineTransform *)a8 zPosition:(double)a9 coordinateSystem:(id)a10
{
  __int128 v10;
  _OWORD v12[3];

  v10 = *(_OWORD *)&a8->c;
  v12[0] = *(_OWORD *)&a8->a;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a8->tx;
  return -[PUExpandableTileLayoutInfo initWithTileIdentifier:center:size:cornerRadius:alpha:transform:zPosition:coordinateSystem:isExpanded:expandedSize:unexpandedSize:](self, "initWithTileIdentifier:center:size:cornerRadius:alpha:transform:zPosition:coordinateSystem:isExpanded:expandedSize:unexpandedSize:", a3, v12, a10, 0, a4.x, a4.y, a5.width, a5.height, a6, a7, a9, *MEMORY[0x1E0C9D820], *(_QWORD *)(MEMORY[0x1E0C9D820] + 8), *MEMORY[0x1E0C9D820], *(_QWORD *)(MEMORY[0x1E0C9D820] + 8));
}

- (PUExpandableTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 cornerRadius:(double)a6 alpha:(double)a7 transform:(CGAffineTransform *)a8 zPosition:(double)a9 coordinateSystem:(id)a10 isExpanded:(BOOL)a11 expandedSize:(CGSize)a12 unexpandedSize:(CGSize)a13
{
  uint64_t v14;
  __int128 v15;
  PUExpandableTileLayoutInfo *result;
  _OWORD v17[3];
  objc_super v18;
  CGFloat v19;
  CGFloat v20;

  v14 = *MEMORY[0x1E0CD2A60];
  v18.receiver = self;
  v18.super_class = (Class)PUExpandableTileLayoutInfo;
  v15 = *(_OWORD *)&a8->c;
  v17[0] = *(_OWORD *)&a8->a;
  v17[1] = v15;
  v17[2] = *(_OWORD *)&a8->tx;
  result = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:](&v18, sel_initWithTileIdentifier_center_size_alpha_cornerRadius_cornerCurve_cornerMask_transform_zPosition_contentsRect_coordinateSystem_, a3, v14, 15, v17, a10, *(_QWORD *)&a13.height, a4.x, a4.y, a5.width, a5.height, a7, a6, a9, *MEMORY[0x1E0D7D078], *(_QWORD *)(MEMORY[0x1E0D7D078] + 8), *(_QWORD *)(MEMORY[0x1E0D7D078] + 16), *(_QWORD *)(MEMORY[0x1E0D7D078] + 24));
  if (result)
  {
    result->_unexpandedSize.width = v19;
    result->_unexpandedSize.height = v20;
    result->_isExpanded = a11;
    result->_expandedSize = a12;
  }
  return result;
}

- (id)clone
{
  id v3;
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
  double v17;
  void *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v28;
  _BYTE v29[48];

  v3 = objc_alloc((Class)objc_opt_class());
  -[PUTileLayoutInfo tileIdentifier](self, "tileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo center](self, "center");
  v28 = v5;
  v7 = v6;
  -[PUTileLayoutInfo size](self, "size");
  v9 = v8;
  v11 = v10;
  -[PUTileLayoutInfo cornerRadius](self, "cornerRadius");
  v13 = v12;
  -[PUTileLayoutInfo alpha](self, "alpha");
  v15 = v14;
  -[PUTileLayoutInfo transform](self, "transform");
  -[PUTileLayoutInfo zPosition](self, "zPosition");
  v17 = v16;
  -[PUTileLayoutInfo coordinateSystem](self, "coordinateSystem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PUExpandableTileLayoutInfo isExpanded](self, "isExpanded");
  -[PUExpandableTileLayoutInfo expandedSize](self, "expandedSize");
  v21 = v20;
  v23 = v22;
  -[PUExpandableTileLayoutInfo unexpandedSize](self, "unexpandedSize");
  v26 = (void *)objc_msgSend(v3, "initWithTileIdentifier:center:size:cornerRadius:alpha:transform:zPosition:coordinateSystem:isExpanded:expandedSize:unexpandedSize:", v4, v29, v18, v19, v28, v7, v9, v11, v13, v15, v17, v21, v23, v24, v25);

  return v26;
}

- (BOOL)isGeometryEqualToLayoutInfo:(id)a3
{
  id v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  BOOL v10;
  BOOL v11;
  int isExpanded;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUExpandableTileLayoutInfo;
  if (-[PUTileLayoutInfo isGeometryEqualToLayoutInfo:](&v14, sel_isGeometryEqualToLayoutInfo_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ((objc_msgSend(v4, "expandedSize"), self->_expandedSize.width == v6)
      ? (v7 = self->_expandedSize.height == v5)
      : (v7 = 0),
        v7
     && ((objc_msgSend(v4, "unexpandedSize"), self->_unexpandedSize.width == v9)
       ? (v10 = self->_unexpandedSize.height == v8)
       : (v10 = 0),
         v10)))
  {
    isExpanded = self->_isExpanded;
    v11 = isExpanded == objc_msgSend(v4, "isExpanded");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (CGSize)expandedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_expandedSize.width;
  height = self->_expandedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)unexpandedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_unexpandedSize.width;
  height = self->_unexpandedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end

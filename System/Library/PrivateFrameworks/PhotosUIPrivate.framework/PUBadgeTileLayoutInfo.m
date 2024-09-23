@implementation PUBadgeTileLayoutInfo

- (PUBadgeTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 coordinateSystem:(id)a9
{
  __int128 v9;
  _OWORD v11[3];

  v9 = *(_OWORD *)&a7->c;
  v11[0] = *(_OWORD *)&a7->a;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a7->tx;
  return -[PUBadgeTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:hitTestOutset:coordinateSystem:isOverContent:contentWidth:leadingContentWidth:](self, "initWithTileIdentifier:center:size:alpha:transform:zPosition:hitTestOutset:coordinateSystem:isOverContent:contentWidth:leadingContentWidth:", a3, v11, a9, 0, a4.x, a4.y, a5.width, a5.height, a6, a8, *MEMORY[0x1E0DC49E8], *(_QWORD *)(MEMORY[0x1E0DC49E8] + 8), *(_QWORD *)(MEMORY[0x1E0DC49E8] + 16), *(_QWORD *)(MEMORY[0x1E0DC49E8] + 24), 0, 0);
}

- (PUBadgeTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 hitTestOutset:(UIEdgeInsets)a9 coordinateSystem:(id)a10 isOverContent:(BOOL)a11 contentWidth:(double)a12 leadingContentWidth:(double)a13
{
  __int128 v14;
  PUBadgeTileLayoutInfo *result;
  _OWORD v16[3];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PUBadgeTileLayoutInfo;
  v14 = *(_OWORD *)&a7->c;
  v16[0] = *(_OWORD *)&a7->a;
  v16[1] = v14;
  v16[2] = *(_OWORD *)&a7->tx;
  result = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:](&v17, sel_initWithTileIdentifier_center_size_alpha_cornerRadius_cornerCurve_cornerMask_borderWidth_borderColor_transform_zPosition_contentsRect_hitTestOutset_coordinateSystem_, a3, 0, 0, 0, v16, a10, a4.x, a4.y, a5.width, a5.height, a6, 0.0, 0.0, a8, *MEMORY[0x1E0D7D078], *(_QWORD *)(MEMORY[0x1E0D7D078] + 8), *(_QWORD *)(MEMORY[0x1E0D7D078] + 16),
             *(_QWORD *)(MEMORY[0x1E0D7D078] + 24),
             *(_QWORD *)&a9.top,
             *(_QWORD *)&a9.left,
             *(_QWORD *)&a9.bottom,
             *(_QWORD *)&a9.right);
  if (result)
  {
    result->_isOverContent = a11;
    result->_contentWidth = a12;
    result->_leadingContentWidth = a13;
  }
  return result;
}

- (BOOL)isGeometryEqualToLayoutInfo:(id)a3
{
  id v4;
  int isOverContent;
  double contentWidth;
  double v7;
  double leadingContentWidth;
  double v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUBadgeTileLayoutInfo;
  if (-[PUTileLayoutInfo isGeometryEqualToLayoutInfo:](&v12, sel_isGeometryEqualToLayoutInfo_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (isOverContent = self->_isOverContent, isOverContent == objc_msgSend(v4, "isOverContent"))
    && (contentWidth = self->_contentWidth, objc_msgSend(v4, "contentWidth"), contentWidth == v7))
  {
    leadingContentWidth = self->_leadingContentWidth;
    objc_msgSend(v4, "leadingContentWidth");
    v10 = leadingContentWidth == v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v29;
  double v30;
  double v31;
  _BYTE v32[48];

  v3 = objc_alloc((Class)objc_opt_class());
  -[PUTileLayoutInfo tileIdentifier](self, "tileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo center](self, "center");
  v30 = v6;
  v31 = v5;
  -[PUTileLayoutInfo size](self, "size");
  v29 = v7;
  v9 = v8;
  -[PUTileLayoutInfo alpha](self, "alpha");
  v11 = v10;
  -[PUTileLayoutInfo transform](self, "transform");
  -[PUTileLayoutInfo zPosition](self, "zPosition");
  v13 = v12;
  -[PUTileLayoutInfo hitTestOutset](self, "hitTestOutset");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[PUTileLayoutInfo coordinateSystem](self, "coordinateSystem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PUBadgeTileLayoutInfo isOverContent](self, "isOverContent");
  -[PUBadgeTileLayoutInfo contentWidth](self, "contentWidth");
  v25 = v24;
  -[PUBadgeTileLayoutInfo leadingContentWidth](self, "leadingContentWidth");
  v27 = (void *)objc_msgSend(v3, "initWithTileIdentifier:center:size:alpha:transform:zPosition:hitTestOutset:coordinateSystem:isOverContent:contentWidth:leadingContentWidth:", v4, v32, v22, v23, v31, v30, v29, v9, v11, v13, v15, v17, v19, v21, v25, v26);

  return v27;
}

- (BOOL)isOverContent
{
  return self->_isOverContent;
}

- (double)contentWidth
{
  return self->_contentWidth;
}

- (double)leadingContentWidth
{
  return self->_leadingContentWidth;
}

@end

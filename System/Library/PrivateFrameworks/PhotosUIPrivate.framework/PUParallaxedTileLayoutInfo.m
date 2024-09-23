@implementation PUParallaxedTileLayoutInfo

- (PUParallaxedTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 coordinateSystem:(id)a9
{
  __int128 v9;
  _OWORD v11[3];

  v9 = *(_OWORD *)&a7->c;
  v11[0] = *(_OWORD *)&a7->a;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a7->tx;
  return -[PUParallaxedTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:parallaxOffset:coordinateSystem:](self, "initWithTileIdentifier:center:size:alpha:transform:zPosition:parallaxOffset:coordinateSystem:", a3, v11, a9, a4.x, a4.y, a5.width, a5.height, a6, a8, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (PUParallaxedTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 parallaxOffset:(CGPoint)a9 coordinateSystem:(id)a10
{
  __int128 v10;
  _OWORD v12[3];

  v10 = *(_OWORD *)&a7->c;
  v12[0] = *(_OWORD *)&a7->a;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a7->tx;
  return -[PUParallaxedTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:parallaxOffset:contentsRect:coordinateSystem:](self, "initWithTileIdentifier:center:size:alpha:transform:zPosition:parallaxOffset:contentsRect:coordinateSystem:", a3, v12, a10, a4.x, a4.y, a5.width, a5.height, a6, a8, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 0, 0, 0x3FF0000000000000, 0x3FF0000000000000);
}

- (uint64_t)initWithTileIdentifier:(double)a3 center:(double)a4 size:(double)a5 alpha:(double)a6 transform:(double)a7 zPosition:(double)a8 parallaxOffset:(double)a9 contentsRect:(uint64_t)a10 coordinateSystem:(uint64_t)a11
{
  __int128 v19;
  _OWORD v21[3];

  v19 = a12[1];
  v21[0] = *a12;
  v21[1] = v19;
  v21[2] = a12[2];
  return objc_msgSend(a1, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:parallaxOffset:contentsRect:coordinateSystem:", a11, 0, 0, 0, v21, a13, a2, a3, a4, a5, a6, 0.0, 0.0, a7, *(_QWORD *)&a8, *(_QWORD *)&a9,
           a17,
           a18,
           a19);
}

- (double)initWithTileIdentifier:(uint64_t)a3 center:(uint64_t)a4 size:(uint64_t)a5 alpha:(uint64_t)a6 cornerRadius:(_OWORD *)a7 cornerCurve:(uint64_t)a8 cornerMask:(double)a9 borderWidth:(double)a10 borderColor:(double)a11 transform:(double)a12 zPosition:(double)a13 parallaxOffset:(double)a14 contentsRect:(double)a15 coordinateSystem:(double)a16
{
  __int128 v13;
  double *v14;
  double result;
  _OWORD v16[3];
  objc_super v17;

  v17.receiver = a1;
  v17.super_class = (Class)PUParallaxedTileLayoutInfo;
  v13 = a7[1];
  v16[0] = *a7;
  v16[1] = v13;
  v16[2] = a7[2];
  v14 = (double *)objc_msgSendSuper2(&v17, sel_initWithTileIdentifier_center_size_alpha_cornerRadius_cornerCurve_cornerMask_borderWidth_borderColor_transform_zPosition_contentsRect_hitTestOutset_coordinateSystem_, a3, a4, a5, a6, v16, a19, a20, a21, *MEMORY[0x1E0DC49E8], *(_QWORD *)(MEMORY[0x1E0DC49E8] + 8), *(_QWORD *)(MEMORY[0x1E0DC49E8] + 16), *(_QWORD *)(MEMORY[0x1E0DC49E8] + 24));
  if (v14)
  {
    result = a18;
    *((_QWORD *)v14 + 32) = a17;
    v14[33] = a18;
  }
  return result;
}

- (BOOL)isGeometryEqualToLayoutInfo:(id)a3
{
  id v4;
  CGPoint *p_parallaxOffset;
  double v6;
  double v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUParallaxedTileLayoutInfo;
  if (-[PUTileLayoutInfo isGeometryEqualToLayoutInfo:](&v10, sel_isGeometryEqualToLayoutInfo_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    p_parallaxOffset = &self->_parallaxOffset;
    objc_msgSend(v4, "parallaxOffset");
    v8 = p_parallaxOffset->y == v7 && p_parallaxOffset->x == v6;
  }
  else
  {
    v8 = 0;
  }

  return v8;
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
  void *v11;
  unint64_t v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  _BYTE v39[48];

  v3 = objc_alloc((Class)objc_opt_class());
  -[PUTileLayoutInfo tileIdentifier](self, "tileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo center](self, "center");
  v37 = v6;
  v38 = v5;
  -[PUTileLayoutInfo size](self, "size");
  v35 = v8;
  v36 = v7;
  -[PUTileLayoutInfo alpha](self, "alpha");
  v34 = v9;
  -[PUTileLayoutInfo cornerRadius](self, "cornerRadius");
  v33 = v10;
  -[PUTileLayoutInfo cornerCurve](self, "cornerCurve");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PUTileLayoutInfo cornerMask](self, "cornerMask");
  -[PUTileLayoutInfo borderWidth](self, "borderWidth");
  v14 = v13;
  -[PUTileLayoutInfo borderColor](self, "borderColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo transform](self, "transform");
  -[PUTileLayoutInfo zPosition](self, "zPosition");
  v17 = v16;
  -[PUParallaxedTileLayoutInfo parallaxOffset](self, "parallaxOffset");
  v19 = v18;
  v21 = v20;
  -[PUTileLayoutInfo contentsRect](self, "contentsRect");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[PUTileLayoutInfo coordinateSystem](self, "coordinateSystem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v3, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:parallaxOffset:contentsRect:coordinateSystem:", v4, v11, v12, v15, v39, v30, v38, v37, v36, v35, v34, v33, v14, v17, v19, v21,
                  v23,
                  v25,
                  v27,
                  v29);

  return v31;
}

- (CGPoint)parallaxOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_parallaxOffset.x;
  y = self->_parallaxOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

@end

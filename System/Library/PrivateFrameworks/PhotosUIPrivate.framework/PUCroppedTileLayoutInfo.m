@implementation PUCroppedTileLayoutInfo

- (PUCroppedTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 contentsRect:(CGRect)a9 coordinateSystem:(id)a10
{
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  _OWORD v16[3];

  v10 = *MEMORY[0x1E0DC49E8];
  v11 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v13 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v14 = *(_OWORD *)&a7->c;
  v16[0] = *(_OWORD *)&a7->a;
  v16[1] = v14;
  v16[2] = *(_OWORD *)&a7->tx;
  return -[PUCroppedTileLayoutInfo initWithTileIdentifier:center:size:cropInsets:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:](self, "initWithTileIdentifier:center:size:cropInsets:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:", a3, 0, 0, v16, a10, a4.x, a4.y, a5.width, a5.height, v10, v11, v12, v13, *(_QWORD *)&a6, 0, *(_QWORD *)&a8,
           *(_QWORD *)&a9.origin.x,
           *(_QWORD *)&a9.origin.y,
           *(_QWORD *)&a9.size.width,
           *(_QWORD *)&a9.size.height);
}

- (double)initWithTileIdentifier:(double)a3 center:(double)a4 size:(double)a5 cropInsets:(double)a6 alpha:(double)a7 cornerRadius:(double)a8 cornerCurve:(double)a9 cornerMask:(uint64_t)a10 transform:(uint64_t)a11 zPosition:(uint64_t)a12 contentsRect:(uint64_t)a13 coordinateSystem:(_OWORD *)a14
{
  __int128 v26;
  double *result;
  _OWORD v28[3];
  objc_super v29;

  v29.receiver = a1;
  v29.super_class = (Class)PUCroppedTileLayoutInfo;
  v26 = a14[1];
  v28[0] = *a14;
  v28[1] = v26;
  v28[2] = a14[2];
  result = (double *)objc_msgSendSuper2(&v29, sel_initWithTileIdentifier_center_size_alpha_cornerRadius_cornerCurve_cornerMask_transform_zPosition_contentsRect_coordinateSystem_, a11, a12, a13, v28, a2, a3, a4, a5, a17, a18, a19, a20, a21, a22);
  if (result)
  {
    result[32] = a6;
    result[33] = a7;
    result[34] = a8;
    result[35] = a9;
  }
  return result;
}

- (BOOL)isGeometryEqualToLayoutInfo:(id)a3
{
  id v4;
  UIEdgeInsets *p_cropInsets;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  BOOL v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PUCroppedTileLayoutInfo;
  if (-[PUTileLayoutInfo isGeometryEqualToLayoutInfo:](&v13, sel_isGeometryEqualToLayoutInfo_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    p_cropInsets = &self->_cropInsets;
    objc_msgSend(v4, "cropInsets");
    v9 = p_cropInsets->left == v8;
    if (p_cropInsets->top != v10)
      v9 = 0;
    if (p_cropInsets->right != v7)
      v9 = 0;
    v11 = p_cropInsets->bottom == v6 && v9;
  }
  else
  {
    v11 = 0;
  }

  return v11;
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
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _BYTE v41[48];

  v3 = objc_alloc((Class)objc_opt_class());
  -[PUTileLayoutInfo tileIdentifier](self, "tileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo center](self, "center");
  v39 = v6;
  v40 = v5;
  -[PUTileLayoutInfo size](self, "size");
  v37 = v8;
  v38 = v7;
  -[PUCroppedTileLayoutInfo cropInsets](self, "cropInsets");
  v35 = v10;
  v36 = v9;
  v34 = v11;
  v13 = v12;
  -[PUTileLayoutInfo alpha](self, "alpha");
  v15 = v14;
  -[PUTileLayoutInfo cornerRadius](self, "cornerRadius");
  v17 = v16;
  -[PUTileLayoutInfo cornerCurve](self, "cornerCurve");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  v20 = -[PUTileLayoutInfo cornerMask](self, "cornerMask");
  -[PUTileLayoutInfo transform](self, "transform");
  -[PUTileLayoutInfo zPosition](self, "zPosition");
  v22 = v21;
  -[PUTileLayoutInfo contentsRect](self, "contentsRect");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[PUTileLayoutInfo coordinateSystem](self, "coordinateSystem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v3, "initWithTileIdentifier:center:size:cropInsets:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:", v4, v19, v20, v41, v31, v40, v39, v38, v37, v36, v35, v34, v13, v15, v17, v22,
                  v24,
                  v26,
                  v28,
                  v30);

  return v32;
}

- (id)layoutInfoByInterpolatingWithLayoutInfo:(id)a3 mixFactor:(double)a4 coordinateSystem:(id)a5
{
  id v8;
  void *v9;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PUCroppedTileLayoutInfo;
  v8 = a3;
  -[PUTileLayoutInfo layoutInfoByInterpolatingWithLayoutInfo:mixFactor:coordinateSystem:](&v27, sel_layoutInfoByInterpolatingWithLayoutInfo_mixFactor_coordinateSystem_, v8, a5, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCroppedTileLayoutInfo cropInsets](self, "cropInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v26 = v16;
  objc_msgSend(v8, "cropInsets");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  objc_msgSend(v9, "_setCropInsets:", v18 * a4 + (1.0 - a4) * v11, v20 * a4 + (1.0 - a4) * v13, v22 * a4 + (1.0 - a4) * v15, v24 * a4 + (1.0 - a4) * v26);
  return v9;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  CGAffineTransform transform;
  CGPoint v26;
  CGSize v27;
  UIEdgeInsets v28;
  CGRect v29;

  v22 = (id)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo indexPath](self, "indexPath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "pu_shortDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo tileKind](self, "tileKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo dataSourceIdentifier](self, "dataSourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo center](self, "center");
  NSStringFromCGPoint(v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo size](self, "size");
  NSStringFromCGSize(v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCroppedTileLayoutInfo cropInsets](self, "cropInsets");
  NSStringFromUIEdgeInsets(v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo alpha](self, "alpha");
  v10 = v9;
  -[PUTileLayoutInfo cornerRadius](self, "cornerRadius");
  v12 = v11;
  -[PUTileLayoutInfo cornerCurve](self, "cornerCurve");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PUTileLayoutInfo cornerMask](self, "cornerMask");
  -[PUTileLayoutInfo transform](self, "transform");
  NSStringFromCGAffineTransform(&transform);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo zPosition](self, "zPosition");
  v17 = v16;
  -[PUTileLayoutInfo contentsRect](self, "contentsRect");
  NSStringFromCGRect(v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@: %p; indexPath: %@; tileKind: %@; dataSourceIdentifier: %@; center: %@; size: %@; cropInsets: %@; alpha: %f; cornerRadius: %f; cornerCurve: %@; cornerMask: %lu; transform: %@; zPosition: %f; contentsRect: %@>"),
    v21,
    self,
    v20,
    v4,
    v5,
    v6,
    v7,
    v8,
    v10,
    v12,
    v13,
    v14,
    v15,
    v17,
    v18);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (UIEdgeInsets)cropInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_cropInsets.top;
  left = self->_cropInsets.left;
  bottom = self->_cropInsets.bottom;
  right = self->_cropInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_setCropInsets:(UIEdgeInsets)a3
{
  self->_cropInsets = a3;
}

@end

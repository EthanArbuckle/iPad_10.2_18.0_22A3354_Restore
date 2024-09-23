@implementation PUAccessoryTileLayoutInfo

- (PUAccessoryTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 coordinateSystem:(id)a9
{
  __int128 v9;
  _OWORD v11[3];

  v9 = *(_OWORD *)&a7->c;
  v11[0] = *(_OWORD *)&a7->a;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a7->tx;
  return -[PUAccessoryTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:contentInsets:minimumVisibleHeight:](self, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:contentInsets:minimumVisibleHeight:", a3, v11, a9, a4.x, a4.y, a5.width, a5.height, a6, a8, *MEMORY[0x1E0C9D628], *(_QWORD *)(MEMORY[0x1E0C9D628] + 8), *(_QWORD *)(MEMORY[0x1E0C9D628] + 16), *(_QWORD *)(MEMORY[0x1E0C9D628] + 24), *MEMORY[0x1E0DC49E8], *(_QWORD *)(MEMORY[0x1E0DC49E8] + 8), *(_QWORD *)(MEMORY[0x1E0DC49E8] + 16),
           *(_QWORD *)(MEMORY[0x1E0DC49E8] + 24),
           0);
}

- (double)initWithTileIdentifier:(uint64_t)a3 center:(_OWORD *)a4 size:(uint64_t)a5 alpha:(uint64_t)a6 transform:(uint64_t)a7 zPosition:(uint64_t)a8 coordinateSystem:(double)a9 untransformedContentFrame:(double)a10 contentInsets:(double)a11 minimumVisibleHeight:(double)a12
{
  __int128 v17;
  double *v18;
  double result;
  _OWORD v20[3];
  objc_super v21;

  v21.receiver = a1;
  v21.super_class = (Class)PUAccessoryTileLayoutInfo;
  v17 = a4[1];
  v20[0] = *a4;
  v20[1] = v17;
  v20[2] = a4[2];
  v18 = (double *)objc_msgSendSuper2(&v21, sel_initWithTileIdentifier_center_size_alpha_transform_zPosition_coordinateSystem_, a3, v20);
  if (v18)
  {
    result = a24;
    *((_QWORD *)v18 + 33) = a17;
    *((_QWORD *)v18 + 34) = a18;
    *((_QWORD *)v18 + 35) = a19;
    *((_QWORD *)v18 + 36) = a20;
    *((_QWORD *)v18 + 37) = a21;
    *((_QWORD *)v18 + 38) = a22;
    *((_QWORD *)v18 + 39) = a23;
    v18[40] = a24;
    *((_QWORD *)v18 + 32) = a25;
  }
  return result;
}

- (BOOL)isGeometryEqualToLayoutInfo:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  double v29;
  double v30;
  double v31;
  double v32;
  objc_super v34;
  CGRect v35;
  CGRect v36;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PUAccessoryTileLayoutInfo;
  if (!-[PUTileLayoutInfo isGeometryEqualToLayoutInfo:](&v34, sel_isGeometryEqualToLayoutInfo_, v4))
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  -[PUAccessoryTileLayoutInfo untransformedContentFrame](self, "untransformedContentFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "untransformedContentFrame");
  v36.origin.x = v13;
  v36.origin.y = v14;
  v36.size.width = v15;
  v36.size.height = v16;
  v35.origin.x = v6;
  v35.origin.y = v8;
  v35.size.width = v10;
  v35.size.height = v12;
  if (CGRectEqualToRect(v35, v36))
  {
    -[PUAccessoryTileLayoutInfo contentInsets](self, "contentInsets");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(v4, "contentInsets");
    v28 = 0;
    if (v20 == v29 && v18 == v25 && v24 == v27 && v22 == v26)
    {
      -[PUAccessoryTileLayoutInfo minimumVisibleHeight](self, "minimumVisibleHeight");
      v31 = v30;
      objc_msgSend(v4, "minimumVisibleHeight");
      v28 = v31 == v32;
    }
  }
  else
  {
LABEL_9:
    v28 = 0;
  }

  return v28;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  void *v29;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _BYTE v37[48];

  v3 = objc_alloc((Class)objc_opt_class());
  -[PUTileLayoutInfo tileIdentifier](self, "tileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo center](self, "center");
  v35 = v6;
  v36 = v5;
  -[PUTileLayoutInfo size](self, "size");
  v33 = v8;
  v34 = v7;
  -[PUTileLayoutInfo alpha](self, "alpha");
  v32 = v9;
  -[PUTileLayoutInfo transform](self, "transform");
  -[PUTileLayoutInfo zPosition](self, "zPosition");
  v31 = v10;
  -[PUTileLayoutInfo coordinateSystem](self, "coordinateSystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAccessoryTileLayoutInfo untransformedContentFrame](self, "untransformedContentFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[PUAccessoryTileLayoutInfo contentInsets](self, "contentInsets");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[PUAccessoryTileLayoutInfo minimumVisibleHeight](self, "minimumVisibleHeight");
  v29 = (void *)objc_msgSend(v3, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:contentInsets:minimumVisibleHeight:", v4, v37, v11, v36, v35, v34, v33, v32, v31, v13, v15, v17, v19, v21, v23, v25,
                  v27,
                  v28);

  return v29;
}

- (CGRect)untransformedContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_untransformedContentFrame.origin.x;
  y = self->_untransformedContentFrame.origin.y;
  width = self->_untransformedContentFrame.size.width;
  height = self->_untransformedContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)minimumVisibleHeight
{
  return self->_minimumVisibleHeight;
}

@end

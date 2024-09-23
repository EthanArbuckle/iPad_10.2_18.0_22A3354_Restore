@implementation PUUserTransformTileLayoutInfo

- (PUUserTransformTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 coordinateSystem:(id)a9
{
  __int128 v9;
  _OWORD v11[3];

  v9 = *(_OWORD *)&a7->c;
  v11[0] = *(_OWORD *)&a7->a;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a7->tx;
  return -[PUUserTransformTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:chromeInsets:contentPixelSize:](self, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:chromeInsets:contentPixelSize:", a3, v11, a9, a4.x, a4.y, a5.width, a5.height, a6, a8, *MEMORY[0x1E0C9D628], *(_QWORD *)(MEMORY[0x1E0C9D628] + 8), *(_QWORD *)(MEMORY[0x1E0C9D628] + 16), *(_QWORD *)(MEMORY[0x1E0C9D628] + 24), *MEMORY[0x1E0D7CEC0], *(_QWORD *)(MEMORY[0x1E0D7CEC0] + 8), *(_QWORD *)(MEMORY[0x1E0D7CEC0] + 16),
           *(_QWORD *)(MEMORY[0x1E0D7CEC0] + 24),
           *MEMORY[0x1E0C9D820],
           *(_QWORD *)(MEMORY[0x1E0C9D820] + 8));
}

- (double)initWithTileIdentifier:(uint64_t)a3 center:(_OWORD *)a4 size:(uint64_t)a5 alpha:(uint64_t)a6 transform:(uint64_t)a7 zPosition:(uint64_t)a8 coordinateSystem:(double)a9 untransformedContentFrame:(double)a10 chromeInsets:(double)a11 contentPixelSize:(double)a12
{
  __int128 v18;
  double *v19;
  double result;
  _OWORD v21[3];
  objc_super v22;

  v22.receiver = a1;
  v22.super_class = (Class)PUUserTransformTileLayoutInfo;
  v18 = a4[1];
  v21[0] = *a4;
  v21[1] = v18;
  v21[2] = a4[2];
  v19 = (double *)objc_msgSendSuper2(&v22, sel_initWithTileIdentifier_center_size_alpha_transform_zPosition_coordinateSystem_, a3, v21);
  if (v19)
  {
    result = a26;
    *((_QWORD *)v19 + 34) = a17;
    *((_QWORD *)v19 + 35) = a18;
    *((_QWORD *)v19 + 36) = a19;
    *((_QWORD *)v19 + 37) = a20;
    *((_QWORD *)v19 + 38) = a21;
    *((_QWORD *)v19 + 39) = a22;
    *((_QWORD *)v19 + 40) = a23;
    *((_QWORD *)v19 + 41) = a24;
    *((_QWORD *)v19 + 32) = a25;
    v19[33] = a26;
  }
  return result;
}

- (BOOL)isGeometryEqualToLayoutInfo:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGSize *p_contentPixelSize;
  double v10;
  double v11;
  BOOL v12;
  objc_super v14;
  CGRect v15;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUUserTransformTileLayoutInfo;
  if (-[PUTileLayoutInfo isGeometryEqualToLayoutInfo:](&v14, sel_isGeometryEqualToLayoutInfo_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v4, "untransformedContentFrame"),
        v15.origin.x = v5,
        v15.origin.y = v6,
        v15.size.width = v7,
        v15.size.height = v8,
        CGRectEqualToRect(self->_untransformedContentFrame, v15))
    && (objc_msgSend(v4, "chromeInsets"), PXEdgeInsetsEqualToEdgeInsets()))
  {
    p_contentPixelSize = &self->_contentPixelSize;
    objc_msgSend(v4, "contentPixelSize");
    v12 = p_contentPixelSize->height == v11 && p_contentPixelSize->width == v10;
  }
  else
  {
    v12 = 0;
  }

  return v12;
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
  uint64_t v29;
  void *v30;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  _BYTE v38[48];

  v3 = objc_alloc((Class)objc_opt_class());
  -[PUTileLayoutInfo tileIdentifier](self, "tileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo center](self, "center");
  v36 = v6;
  v37 = v5;
  -[PUTileLayoutInfo size](self, "size");
  v34 = v8;
  v35 = v7;
  -[PUTileLayoutInfo alpha](self, "alpha");
  v33 = v9;
  -[PUTileLayoutInfo transform](self, "transform");
  -[PUTileLayoutInfo zPosition](self, "zPosition");
  v32 = v10;
  -[PUTileLayoutInfo coordinateSystem](self, "coordinateSystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUUserTransformTileLayoutInfo untransformedContentFrame](self, "untransformedContentFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[PUUserTransformTileLayoutInfo chromeInsets](self, "chromeInsets");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[PUUserTransformTileLayoutInfo contentPixelSize](self, "contentPixelSize");
  v30 = (void *)objc_msgSend(v3, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:chromeInsets:contentPixelSize:", v4, v38, v11, v37, v36, v35, v34, v33, v32, v13, v15, v17, v19, v21, v23, v25,
                  v27,
                  v28,
                  v29);

  return v30;
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

- (UIEdgeInsets)chromeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_chromeInsets.top;
  left = self->_chromeInsets.left;
  bottom = self->_chromeInsets.bottom;
  right = self->_chromeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGSize)contentPixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentPixelSize.width;
  height = self->_contentPixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end

@implementation UIKBRenderGeometry

- (void)setRoundRectCorners:(unint64_t)a3
{
  self->_roundRectCorners = a3;
}

- (void)setSymbolFrame:(CGRect)a3
{
  self->_symbolFrame = a3;
}

- (CGRect)symbolFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_symbolFrame.origin.x;
  y = self->_symbolFrame.origin.y;
  width = self->_symbolFrame.size.width;
  height = self->_symbolFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPaddedFrame:(CGRect)a3
{
  self->_paddedFrame = a3;
}

- (void)setRoundRectRadius:(double)a3
{
  self->_roundRectRadius = a3;
}

+ (id)geometryWithShape:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithShape:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splitRightRect, 0);
  objc_storeStrong((id *)&self->_splitLeftRect, 0);
}

- (UIKBRenderGeometry)initWithShape:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  __int128 v24;
  __int128 v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)UIKBRenderGeometry;
  v5 = -[UIKBRenderGeometry init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "frame");
    *((_QWORD *)v5 + 15) = v6;
    *((_QWORD *)v5 + 16) = v7;
    *((_QWORD *)v5 + 17) = v8;
    *((_QWORD *)v5 + 18) = v9;
    objc_msgSend(v4, "paddedFrame");
    *((_QWORD *)v5 + 19) = v10;
    *((_QWORD *)v5 + 20) = v11;
    *((_QWORD *)v5 + 21) = v12;
    *((_QWORD *)v5 + 22) = v13;
    objc_msgSend(v4, "paddedFrame");
    *((_QWORD *)v5 + 23) = v14;
    *((_QWORD *)v5 + 24) = v15;
    *((_QWORD *)v5 + 25) = v16;
    *((_QWORD *)v5 + 26) = v17;
    objc_msgSend(v4, "paddedFrame");
    *((_QWORD *)v5 + 27) = v18;
    *((_QWORD *)v5 + 28) = v19;
    *((_QWORD *)v5 + 29) = v20;
    *((_QWORD *)v5 + 30) = v21;
    *((_QWORD *)v5 + 2) = objc_msgSend(v4, "concaveCorner");
    objc_msgSend(v4, "concaveCornerOffset");
    *((_QWORD *)v5 + 13) = v22;
    *((_QWORD *)v5 + 14) = v23;
    *((_QWORD *)v5 + 5) = -3;
    v24 = *MEMORY[0x1E0C9D628];
    v25 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v5 + 280) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v5 + 296) = v25;
    *(_OWORD *)(v5 + 312) = v24;
    *(_OWORD *)(v5 + 328) = v25;
  }

  return (UIKBRenderGeometry *)v5;
}

- (UIEdgeInsets)displayInsets
{
  double v3;
  double v4;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIEdgeInsets result;

  -[UIKBRenderGeometry displayFrame](self, "displayFrame");
  v4 = v3;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  v6 = v4 - v5;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  v9 = v7 + v8;
  -[UIKBRenderGeometry displayFrame](self, "displayFrame");
  v12 = v9 - (v10 + v11);
  -[UIKBRenderGeometry displayFrame](self, "displayFrame");
  v14 = v13;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  v16 = v14 - v15;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  v19 = v17 + v18;
  -[UIKBRenderGeometry displayFrame](self, "displayFrame");
  v22 = v19 - (v20 + v21);
  v23 = v6;
  v24 = v16;
  v25 = v12;
  result.right = v22;
  result.bottom = v25;
  result.left = v24;
  result.top = v23;
  return result;
}

- (CGRect)paddedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_paddedFrame.origin.x;
  y = self->_paddedFrame.origin.y;
  width = self->_paddedFrame.size.width;
  height = self->_paddedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)displayFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_displayFrame.origin.x;
  y = self->_displayFrame.origin.y;
  width = self->_displayFrame.size.width;
  height = self->_displayFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

+ (id)geometryWithFrame:(CGRect)a3 paddedFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  UIKBRenderGeometry *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v12 = objc_alloc_init(UIKBRenderGeometry);
  -[UIKBRenderGeometry setFrame:](v12, "setFrame:", v11, v10, v9, v8);
  -[UIKBRenderGeometry setPaddedFrame:](v12, "setPaddedFrame:", x, y, width, height);
  -[UIKBRenderGeometry setSymbolFrame:](v12, "setSymbolFrame:", x, y, width, height);
  -[UIKBRenderGeometry setDisplayFrame:](v12, "setDisplayFrame:", x, y, width, height);
  -[UIKBRenderGeometry setConcaveCorner:](v12, "setConcaveCorner:", 0);
  -[UIKBRenderGeometry setConcaveCornerOffset:](v12, "setConcaveCornerOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[UIKBRenderGeometry setFlickDirection:](v12, "setFlickDirection:", -3);
  v13 = *MEMORY[0x1E0C9D628];
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[UIKBRenderGeometry setLayeredBackgroundPaddedFrame:](v12, "setLayeredBackgroundPaddedFrame:", *MEMORY[0x1E0C9D628], v14, v15, v16);
  -[UIKBRenderGeometry setLayeredForegroundPaddedFrame:](v12, "setLayeredForegroundPaddedFrame:", v13, v14, v15, v16);
  return v12;
}

- (void)setLayeredForegroundPaddedFrame:(CGRect)a3
{
  CGSize v3;

  v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_layeredForegroundPaddedFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_layeredForegroundPaddedFrame.size = v3;
}

- (void)setLayeredBackgroundPaddedFrame:(CGRect)a3
{
  CGSize v3;

  v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_layeredBackgroundPaddedFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_layeredBackgroundPaddedFrame.size = v3;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void)setFlickDirection:(int64_t)a3
{
  self->_flickDirection = a3;
}

- (void)setDisplayFrame:(CGRect)a3
{
  self->_displayFrame = a3;
}

- (void)setConcaveCornerOffset:(CGSize)a3
{
  self->_concaveCornerOffset = a3;
}

- (void)setConcaveCorner:(unint64_t)a3
{
  self->_concaveCorner = a3;
}

- (double)roundRectRadius
{
  return self->_roundRectRadius;
}

- (unint64_t)roundRectCorners
{
  return self->_roundRectCorners;
}

- (unint64_t)adjustForTranslucentGapsWithSize:(CGSize)a3 inFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double MidX;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  unint64_t v19;
  double MinX;
  double v21;
  CGFloat v22;
  double MinY;
  CGFloat v24;
  BOOL v25;
  _BOOL8 v26;
  double v27;
  double v28;
  double v29;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.height;
  v9 = a3.width;
  if (CGRectIsEmpty(a4))
    return 0;
  if (v9 == *MEMORY[0x1E0C9D820] && v8 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    return 0;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v31 = v8;
  MidX = CGRectGetMidX(v34);
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  v13 = v35.origin.x;
  v14 = v35.size.width;
  v32 = v35.size.height;
  v33 = v35.origin.y;
  if (MidX <= CGRectGetMaxX(v35))
  {
    v36.origin.x = v13;
    v36.size.height = v32;
    v36.origin.y = v33;
    v36.size.width = v14;
    MinX = CGRectGetMinX(v36);
    if (MidX < MinX)
      v21 = v9 + v13;
    else
      v21 = v13;
    if (MidX < MinX)
      v13 = v9 + v13;
    v17 = v33;
    if (MidX < MinX)
      v15 = v14 - v9;
    else
      v15 = v14;
    v18 = v21;
    if (MidX < MinX)
      v16 = 2;
    else
      v16 = 0;
  }
  else
  {
    v15 = v14 - v9;
    v16 = 8;
    v17 = v33;
    v18 = v13;
  }
  v37.origin.x = x;
  v22 = v17;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  MinY = CGRectGetMinY(v37);
  v38.origin.x = v13;
  v38.origin.y = v22;
  v38.size.width = v15;
  v38.size.height = v32;
  v24 = CGRectGetMinY(v38);
  v25 = MinY == v24;
  v26 = MinY != v24;
  v27 = 0.0;
  if (!v25)
    v27 = v31;
  v28 = v32 - v27;
  v29 = -0.0;
  if (!v25)
    v29 = v31;
  v19 = v16 | v26;
  -[UIKBRenderGeometry setPaddedFrame:](self, "setPaddedFrame:", v18, v33 + v29, v15, v28, *(_QWORD *)&MidX);
  return v19;
}

- (unint64_t)adjustForTranslucentGapsInFrameWithSize_10Key:(CGSize)a3 centerX:(double)a4 bottomEdge:(BOOL)a5 topEdge:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  double height;
  double width;
  double x;
  double y;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double MinX;
  uint64_t v19;
  uint64_t v20;
  CGRect v22;
  CGRect v23;

  v6 = a6;
  v7 = a5;
  height = a3.height;
  width = a3.width;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  x = v22.origin.x;
  y = v22.origin.y;
  v14 = v22.size.width;
  v15 = v22.size.height;
  if (CGRectGetMaxX(v22) >= a4)
  {
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = v14;
    v23.size.height = v15;
    MinX = CGRectGetMinX(v23);
    if (MinX <= a4)
    {
      v16 = v14;
    }
    else
    {
      x = width + x;
      v16 = v14 - width;
    }
    if (MinX > a4)
      v17 = 2;
    else
      v17 = 0;
  }
  else
  {
    v16 = v14 - width;
    v17 = 8;
  }
  v19 = 4;
  if (!v7)
    v19 = 0;
  v20 = v19 | v6;
  -[UIKBRenderGeometry setPaddedFrame:](self, "setPaddedFrame:", UIRectInsetEdges(v20, x, y, v16, v15, height));
  return v17 | v20;
}

- (void)adjustForConsistentGapsWithSize:(CGSize)a3 inFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  BOOL v11;
  double MidX;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double MinY;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double MaxY;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat rect;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.height;
  v9 = a3.width;
  if (!CGRectIsEmpty(a4))
  {
    v11 = v9 == *MEMORY[0x1E0C9D820] && v8 == *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (!v11)
    {
      v31 = v8;
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = height;
      MidX = CGRectGetMidX(v36);
      -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
      v13 = v37.origin.y;
      v14 = v37.size.width;
      v33 = v37.origin.x;
      rect = v37.size.height;
      v32 = MidX;
      if (MidX <= CGRectGetMaxX(v37))
      {
        v17 = v33;
        v38.size.height = rect;
        v38.origin.x = v33;
        v38.origin.y = v13;
        v38.size.width = v14;
        if (v32 >= CGRectGetMinX(v38))
          v15 = v9;
        else
          v15 = 1.0;
        v16 = v15;
      }
      else
      {
        v15 = 1.0;
        v16 = v9;
        v17 = v33;
      }
      v18 = v13;
      v19 = v14 - (v9 + v15);
      v20 = v18 + 0.0;
      v30 = v9;
      v21 = v17 + v16;
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      MinY = CGRectGetMinY(v39);
      v40.origin.x = v21;
      v34 = v19;
      v40.origin.y = v20;
      v40.size.width = v19;
      v40.size.height = rect;
      if (MinY == CGRectGetMinY(v40))
      {
        v23 = v21;
        v24 = v31;
        v25 = v31 + v30 * 0.5 + -1.0;
        v26 = v34;
        v27 = rect;
      }
      else
      {
        v41.origin.x = x;
        v41.origin.y = y;
        v41.size.width = width;
        v41.size.height = height;
        MaxY = CGRectGetMaxY(v41);
        v23 = v21;
        v42.origin.x = v21;
        v42.origin.y = v20;
        v42.size.width = v34;
        v27 = rect;
        v42.size.height = rect;
        v29 = CGRectGetMaxY(v42);
        v24 = v31 * 0.5 + 2.0;
        v11 = MaxY == v29;
        v25 = v24 + v30 * 0.5 + -1.0;
        if (v11)
          v25 = v30 * 0.5 + v24;
        v26 = v34;
      }
      -[UIKBRenderGeometry setPaddedFrame:](self, "setPaddedFrame:", v23 + 0.0, v20 + v24, v26, v27 - v25);
    }
  }
}

- (void)adjustToTopWithInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[UIKBRenderGeometry frame](self, "frame");
  if (v8 != 0.0)
  {
    -[UIKBRenderGeometry frame](self, "frame");
    v11 = left + right;
    v13 = top + bottom;
    -[UIKBRenderGeometry setFrame:](self, "setFrame:", left + v9, top + v10, v12 - v11, v14 - v13);
    -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
    -[UIKBRenderGeometry setPaddedFrame:](self, "setPaddedFrame:", left + v15, top + v16, v17 - v11, v18 - v13);
    -[UIKBRenderGeometry displayFrame](self, "displayFrame");
    -[UIKBRenderGeometry setDisplayFrame:](self, "setDisplayFrame:", left + v19, top + v20, v21 - v11, v22 - v13);
  }
}

- (void)makeIntegralWithScale:(double)a3
{
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
  double v18;
  double v19;
  double v20;

  -[UIKBRenderGeometry frame](self, "frame");
  -[UIKBRenderGeometry setFrame:](self, "setFrame:", UIRectIntegralWithScale(v5, v6, v7, v8, a3));
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  -[UIKBRenderGeometry setPaddedFrame:](self, "setPaddedFrame:", UIRectIntegralWithScale(v9, v10, v11, v12, a3));
  -[UIKBRenderGeometry displayFrame](self, "displayFrame");
  -[UIKBRenderGeometry setDisplayFrame:](self, "setDisplayFrame:", UIRectIntegralWithScale(v13, v14, v15, v16, a3));
  -[UIKBRenderGeometry symbolFrame](self, "symbolFrame");
  -[UIKBRenderGeometry setSymbolFrame:](self, "setSymbolFrame:", UIRectIntegralWithScale(v17, v18, v19, v20, a3));
}

- (void)applyOffset:(CGPoint)a3
{
  double y;
  double x;
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
  double v18;
  double v19;
  double v20;
  double v21;

  y = a3.y;
  x = a3.x;
  -[UIKBRenderGeometry frame](self, "frame");
  -[UIKBRenderGeometry setFrame:](self, "setFrame:", x + v6, y + v8, v7 - (x - x), v9 - (y - y));
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  -[UIKBRenderGeometry setPaddedFrame:](self, "setPaddedFrame:", x + v10, y + v12, v11 - (x - x), v13 - (y - y));
  -[UIKBRenderGeometry displayFrame](self, "displayFrame");
  -[UIKBRenderGeometry setDisplayFrame:](self, "setDisplayFrame:", x + v14, y + v16, v15 - (x - x), v17 - (y - y));
  -[UIKBRenderGeometry symbolFrame](self, "symbolFrame");
  -[UIKBRenderGeometry setSymbolFrame:](self, "setSymbolFrame:", x + v18, y + v20, v19 - (x - x), v21 - (y - y));
}

- (id)copyForFlickDirection:(int64_t)a3 scale:(double)a4
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v5 = -[UIKBRenderGeometry _copyForDirection:positionFactor:inwardSizeFactor:outwardSizeFactor:perpendicularSizeFactor:sizeAspectRatio:scale:](self, "_copyForDirection:positionFactor:inwardSizeFactor:outwardSizeFactor:perpendicularSizeFactor:sizeAspectRatio:scale:", a3, 1.0, 0.12, -0.12, -0.125, 0.8, a4);
  objc_msgSend(v5, "displayFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIKBRenderGeometry displayFrame](self, "displayFrame");
  v21.origin.x = v14;
  v21.origin.y = v15;
  v21.size.width = v16;
  v21.size.height = v17;
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  v20 = CGRectUnion(v19, v21);
  objc_msgSend(v5, "setDisplayFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
  return v5;
}

- (id)copyForPopupDirection:(int64_t)a3 scale:(double)a4
{
  return -[UIKBRenderGeometry _copyForDirection:positionFactor:inwardSizeFactor:outwardSizeFactor:perpendicularSizeFactor:sizeAspectRatio:scale:](self, "_copyForDirection:positionFactor:inwardSizeFactor:outwardSizeFactor:perpendicularSizeFactor:sizeAspectRatio:scale:", a3, 1.0, 0.0, -0.0125, 0.0, 0.5, a4);
}

- (id)_copyForDirection:(int64_t)a3 positionFactor:(double)a4 inwardSizeFactor:(double)a5 outwardSizeFactor:(double)a6 perpendicularSizeFactor:(double)a7 sizeAspectRatio:(double)a8 scale:(double)a9
{
  void *v16;
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;

  v16 = (void *)-[UIKBRenderGeometry copy](self, "copy");
  objc_msgSend(v16, "paddedFrame");
  v19 = v17;
  v20 = v18;
  switch(a3)
  {
    case 0:
      objc_msgSend(v16, "applyOffset:", 0.0, -(v18 * a4));
      objc_msgSend(v16, "paddedFrame");
      v21 = v20 * a6;
      v22 = v19 * a7 * a8;
      objc_msgSend(v16, "setPaddedFrame:", v22 + v23, v21 + v25, v24 - (v22 + v22), v26 - (v21 + v20 * a5));
      objc_msgSend(v16, "displayFrame");
      v28 = v22 + v27;
      v30 = v29 - (v22 + v22);
      v32 = v21 + v31;
      v34 = v33 - (v21 + v20 * a5);
      v35 = 3;
      goto LABEL_6;
    case 1:
      objc_msgSend(v16, "applyOffset:", v17 * a4, 0.0);
      objc_msgSend(v16, "paddedFrame");
      v36 = v20 * a7;
      v37 = v19 * a6 * a8;
      v38 = v19 * a5 * a8;
      v40 = v37 + v38;
      objc_msgSend(v16, "setPaddedFrame:", v38 + v39, v36 + v42, v41 - (v37 + v38), v43 - (v36 + v36));
      objc_msgSend(v16, "displayFrame");
      v28 = v38 + v44;
      v30 = v45 - v40;
      v32 = v36 + v46;
      v34 = v47 - (v36 + v36);
      v35 = 10;
      goto LABEL_6;
    case 2:
      objc_msgSend(v16, "applyOffset:", 0.0, v18 * a4);
      objc_msgSend(v16, "paddedFrame");
      v48 = v20 * a5;
      v49 = v19 * a7 * a8;
      objc_msgSend(v16, "setPaddedFrame:", v49 + v50, v48 + v52, v51 - (v49 + v49), v53 - (v48 + v20 * a6));
      objc_msgSend(v16, "displayFrame");
      v28 = v49 + v54;
      v30 = v55 - (v49 + v49);
      v32 = v48 + v56;
      v34 = v57 - (v48 + v20 * a6);
      v35 = 12;
      goto LABEL_6;
    case 3:
      objc_msgSend(v16, "applyOffset:", -(v17 * a4), 0.0);
      objc_msgSend(v16, "paddedFrame");
      v58 = v20 * a7;
      v59 = v19 * a5 * a8;
      v60 = v19 * a6 * a8;
      v62 = v59 + v60;
      objc_msgSend(v16, "setPaddedFrame:", v60 + v61, v58 + v64, v63 - (v59 + v60), v65 - (v58 + v58));
      objc_msgSend(v16, "displayFrame");
      v28 = v60 + v66;
      v30 = v67 - v62;
      v32 = v58 + v68;
      v34 = v69 - (v58 + v58);
      v35 = 5;
LABEL_6:
      objc_msgSend(v16, "setDisplayFrame:", v28, v32, v30, v34);
      objc_msgSend(v16, "setRoundRectCorners:", v35);
      break;
    default:
      break;
  }
  objc_msgSend(v16, "setRoundRectRadius:", 8.0);
  objc_msgSend(v16, "makeIntegralWithScale:", a9);
  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CGSize v21;
  CGPoint v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[UIKBRenderGeometry frame](self, "frame");
  NSStringFromCGRect(v23);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; frame = %@"), v4);

  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  NSStringFromCGRect(v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; paddedFrame = %@"), v5);

  -[UIKBRenderGeometry displayFrame](self, "displayFrame");
  NSStringFromCGRect(v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; displayFrame = %@"), v6);

  -[UIKBRenderGeometry symbolFrame](self, "symbolFrame");
  NSStringFromCGRect(v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; symbolFrame = %@"), v7);

  if (-[UIKBRenderGeometry concaveCorner](self, "concaveCorner"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; concaveCorner = %lux"),
      -[UIKBRenderGeometry concaveCorner](self, "concaveCorner"));
  -[UIKBRenderGeometry concaveCornerOffset](self, "concaveCornerOffset");
  if (v9 != *MEMORY[0x1E0C9D820] || v8 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[UIKBRenderGeometry concaveCornerOffset](self, "concaveCornerOffset");
    NSStringFromCGSize(v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; concaveCornerOffset = %@"), v10);

  }
  -[UIKBRenderGeometry popupSource](self, "popupSource");
  if (v12 != *MEMORY[0x1E0C9D538] || v11 != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    -[UIKBRenderGeometry popupSource](self, "popupSource");
    NSStringFromCGPoint(v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; popupSource = %@"), v13);

  }
  if (-[UIKBRenderGeometry roundRectCorners](self, "roundRectCorners"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; roundRectCorners = %lux"),
      -[UIKBRenderGeometry roundRectCorners](self, "roundRectCorners"));
  enumStringForAttributeValue(-[UIKBRenderGeometry popupBias](self, "popupBias"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    enumStringForAttributeValue(-[UIKBRenderGeometry popupBias](self, "popupBias"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; popupBias = %@"), v15);

  }
  if (-[UIKBRenderGeometry flickDirection](self, "flickDirection") != -3)
    objc_msgSend(v3, "appendFormat:", CFSTR("; flickDirection = %d"),
      -[UIKBRenderGeometry flickDirection](self, "flickDirection"));
  if (-[UIKBRenderGeometry detachedVariants](self, "detachedVariants"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; detachedVariants = YES"));
  if (-[UIKBRenderGeometry tallPopup](self, "tallPopup"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; tallPopup = %d"), -[UIKBRenderGeometry tallPopup](self, "tallPopup"));
  if (-[UIKBRenderGeometry popupDirection](self, "popupDirection"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; popupDirection = %ld"),
      -[UIKBRenderGeometry popupDirection](self, "popupDirection"));
  -[UIKBRenderGeometry splitLeftRect](self, "splitLeftRect");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[UIKBRenderGeometry splitLeftRect](self, "splitLeftRect");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; splitLeftRect = %@"), v17);

  }
  -[UIKBRenderGeometry splitRightRect](self, "splitRightRect");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[UIKBRenderGeometry splitRightRect](self, "splitRightRect");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; splitRightRect = %@"), v19);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  UIKBRenderGeometry *v4;
  char v5;
  NSValue *splitLeftRect;
  NSValue *splitRightRect;

  v4 = (UIKBRenderGeometry *)a3;
  if (v4 == self)
    goto LABEL_27;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !CGRectEqualToRect(self->_frame, v4->_frame)
    || !CGRectEqualToRect(self->_paddedFrame, v4->_paddedFrame)
    || !CGRectEqualToRect(self->_displayFrame, v4->_displayFrame)
    || !CGRectEqualToRect(self->_symbolFrame, v4->_symbolFrame)
    || self->_concaveCorner != v4->_concaveCorner)
  {
LABEL_26:
    v5 = 0;
    goto LABEL_28;
  }
  v5 = 0;
  if (self->_concaveCornerOffset.width == v4->_concaveCornerOffset.width
    && self->_concaveCornerOffset.height == v4->_concaveCornerOffset.height)
  {
    v5 = 0;
    if (self->_popupSource.x == v4->_popupSource.x && self->_popupSource.y == v4->_popupSource.y)
    {
      if (self->_roundRectCorners == v4->_roundRectCorners
        && self->_roundRectRadius == v4->_roundRectRadius
        && self->_popupBias == v4->_popupBias
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_layoutMargins.top, *(float64x2_t *)&v4->_layoutMargins.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_layoutMargins.bottom, *(float64x2_t *)&v4->_layoutMargins.bottom))), 0xFuLL))) & 1) != 0&& self->_flickDirection == v4->_flickDirection&& self->_detachedVariants == v4->_detachedVariants&& self->_tallPopup == v4->_tallPopup&& self->_popupDirection == v4->_popupDirection)
      {
        splitLeftRect = self->_splitLeftRect;
        if ((splitLeftRect != 0) != (v4->_splitLeftRect == 0)
          && (!splitLeftRect || -[NSValue isEqualToValue:](splitLeftRect, "isEqualToValue:")))
        {
          splitRightRect = self->_splitRightRect;
          if ((splitRightRect != 0) != (v4->_splitRightRect == 0))
          {
            if (splitRightRect)
            {
              v5 = -[NSValue isEqualToValue:](splitRightRect, "isEqualToValue:");
              goto LABEL_28;
            }
LABEL_27:
            v5 = 1;
            goto LABEL_28;
          }
        }
      }
      goto LABEL_26;
    }
  }
LABEL_28:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIKBRenderGeometry *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(UIKBRenderGeometry);
  -[UIKBRenderGeometry frame](self, "frame");
  -[UIKBRenderGeometry setFrame:](v4, "setFrame:");
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  -[UIKBRenderGeometry setPaddedFrame:](v4, "setPaddedFrame:");
  -[UIKBRenderGeometry displayFrame](self, "displayFrame");
  -[UIKBRenderGeometry setDisplayFrame:](v4, "setDisplayFrame:");
  -[UIKBRenderGeometry symbolFrame](self, "symbolFrame");
  -[UIKBRenderGeometry setSymbolFrame:](v4, "setSymbolFrame:");
  -[UIKBRenderGeometry setConcaveCorner:](v4, "setConcaveCorner:", -[UIKBRenderGeometry concaveCorner](self, "concaveCorner"));
  -[UIKBRenderGeometry concaveCornerOffset](self, "concaveCornerOffset");
  -[UIKBRenderGeometry setConcaveCornerOffset:](v4, "setConcaveCornerOffset:");
  -[UIKBRenderGeometry popupSource](self, "popupSource");
  -[UIKBRenderGeometry setPopupSource:](v4, "setPopupSource:");
  -[UIKBRenderGeometry setRoundRectCorners:](v4, "setRoundRectCorners:", -[UIKBRenderGeometry roundRectCorners](self, "roundRectCorners"));
  -[UIKBRenderGeometry roundRectRadius](self, "roundRectRadius");
  -[UIKBRenderGeometry setRoundRectRadius:](v4, "setRoundRectRadius:");
  -[UIKBRenderGeometry setPopupBias:](v4, "setPopupBias:", -[UIKBRenderGeometry popupBias](self, "popupBias"));
  -[UIKBRenderGeometry layoutMargins](self, "layoutMargins");
  -[UIKBRenderGeometry setLayoutMargins:](v4, "setLayoutMargins:");
  -[UIKBRenderGeometry setFlickDirection:](v4, "setFlickDirection:", -[UIKBRenderGeometry flickDirection](self, "flickDirection"));
  -[UIKBRenderGeometry setDetachedVariants:](v4, "setDetachedVariants:", -[UIKBRenderGeometry detachedVariants](self, "detachedVariants"));
  -[UIKBRenderGeometry setTallPopup:](v4, "setTallPopup:", -[UIKBRenderGeometry tallPopup](self, "tallPopup"));
  -[UIKBRenderGeometry setPopupDirection:](v4, "setPopupDirection:", -[UIKBRenderGeometry popupDirection](self, "popupDirection"));
  -[UIKBRenderGeometry splitLeftRect](self, "splitLeftRect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[UIKBRenderGeometry setSplitLeftRect:](v4, "setSplitLeftRect:", v6);

  -[UIKBRenderGeometry splitRightRect](self, "splitRightRect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[UIKBRenderGeometry setSplitRightRect:](v4, "setSplitRightRect:", v8);

  return v4;
}

- (void)overlayWithGeometry:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "roundRectRadius");
  if (v4 > 0.0)
  {
    objc_msgSend(v5, "roundRectRadius");
    -[UIKBRenderGeometry setRoundRectRadius:](self, "setRoundRectRadius:");
  }
  if (objc_msgSend(v5, "roundRectCorners"))
    -[UIKBRenderGeometry setRoundRectCorners:](self, "setRoundRectCorners:", objc_msgSend(v5, "roundRectCorners"));
  if (objc_msgSend(v5, "popupBias"))
    -[UIKBRenderGeometry setPopupBias:](self, "setPopupBias:", objc_msgSend(v5, "popupBias"));
  if (objc_msgSend(v5, "flickDirection") != -3)
    -[UIKBRenderGeometry setFlickDirection:](self, "setFlickDirection:", objc_msgSend(v5, "flickDirection"));
  if (objc_msgSend(v5, "detachedVariants"))
    -[UIKBRenderGeometry setDetachedVariants:](self, "setDetachedVariants:", objc_msgSend(v5, "detachedVariants"));
  if (objc_msgSend(v5, "tallPopup"))
    -[UIKBRenderGeometry setTallPopup:](self, "setTallPopup:", objc_msgSend(v5, "tallPopup"));
  if (objc_msgSend(v5, "popupDirection"))
    -[UIKBRenderGeometry setPopupDirection:](self, "setPopupDirection:", objc_msgSend(v5, "popupDirection"));

}

- (void)applyInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
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
  int64_t v28;
  double v29;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (a3.left != 0.0 || a3.top != 0.0 || a3.right != 0.0 || a3.bottom != 0.0)
  {
    -[UIKBRenderGeometry frame](self, "frame");
    -[UIKBRenderGeometry setFrame:](self, "setFrame:", left + v8, top + v9, v10 - (left + right), v11 - (top + bottom));
    -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
    -[UIKBRenderGeometry setPaddedFrame:](self, "setPaddedFrame:", left + v12, top + v13, v14 - (left + right), v15 - (top + bottom));
    -[UIKBRenderGeometry displayFrame](self, "displayFrame");
    -[UIKBRenderGeometry setDisplayFrame:](self, "setDisplayFrame:", left + v16, top + v17, v18 - (left + right), v19 - (top + bottom));
    -[UIKBRenderGeometry symbolFrame](self, "symbolFrame");
    -[UIKBRenderGeometry setSymbolFrame:](self, "setSymbolFrame:", left + v20, top + v21, v22 - (left + right), v23 - (top + bottom));
    -[UIKBRenderGeometry popupSource](self, "popupSource");
    v25 = v24;
    v27 = v26;
    if (-[UIKBRenderGeometry flickDirection](self, "flickDirection"))
    {
      if (-[UIKBRenderGeometry flickDirection](self, "flickDirection") == 2)
      {
        v27 = top + v27;
      }
      else if (-[UIKBRenderGeometry flickDirection](self, "flickDirection") == 3)
      {
        v25 = v25 - right;
      }
      else
      {
        v28 = -[UIKBRenderGeometry flickDirection](self, "flickDirection");
        v29 = -0.0;
        if (v28 == 1)
          v29 = left;
        v25 = v25 + v29;
      }
    }
    else
    {
      v27 = v27 - bottom;
    }
    -[UIKBRenderGeometry setPopupSource:](self, "setPopupSource:", v25, v27);
  }
}

- (void)applyShadowInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
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
  double v28;
  double v29;
  CGRect v30;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (a3.left != 0.0 || a3.top != 0.0 || a3.right != 0.0 || a3.bottom != 0.0)
  {
    if (-[UIKBRenderGeometry detachedVariants](self, "detachedVariants")
      || !-[UIKBRenderGeometry popupBias](self, "popupBias")
      || -[UIKBRenderGeometry popupDirection](self, "popupDirection") == 3)
    {
      if ((-[UIKBRenderGeometry flickDirection](self, "flickDirection") & 0x8000000000000000) == 0)
      {
        if (!-[UIKBRenderGeometry flickDirection](self, "flickDirection"))
        {
          -[UIKBRenderGeometry popupSource](self, "popupSource");
          v9 = v12;
          -[UIKBRenderGeometry popupSource](self, "popupSource");
          v11 = v13 - bottom;
          bottom = 0.0;
          goto LABEL_20;
        }
        if (-[UIKBRenderGeometry flickDirection](self, "flickDirection") == 2)
        {
          -[UIKBRenderGeometry popupSource](self, "popupSource");
          v9 = v8;
          -[UIKBRenderGeometry popupSource](self, "popupSource");
          v11 = top + v10;
          top = 0.0;
LABEL_20:
          -[UIKBRenderGeometry setPopupSource:](self, "setPopupSource:", v9, v11);
          goto LABEL_21;
        }
        if (-[UIKBRenderGeometry flickDirection](self, "flickDirection") == 3)
        {
          -[UIKBRenderGeometry popupSource](self, "popupSource");
          v9 = v14 - right;
          -[UIKBRenderGeometry popupSource](self, "popupSource");
          right = 0.0;
          goto LABEL_20;
        }
        if (-[UIKBRenderGeometry flickDirection](self, "flickDirection") == 1)
        {
          -[UIKBRenderGeometry popupSource](self, "popupSource");
          v9 = left + v29;
          -[UIKBRenderGeometry popupSource](self, "popupSource");
          left = 0.0;
          goto LABEL_20;
        }
      }
LABEL_21:
      -[UIKBRenderGeometry applyInsets:](self, "applyInsets:", top, left, bottom, right);
      return;
    }
    -[UIKBRenderGeometry displayFrame](self, "displayFrame");
    v17 = left + right;
    -[UIKBRenderGeometry setDisplayFrame:](self, "setDisplayFrame:", left + v15, top + v16, v18 - (left + right), v19 - (top + bottom));
    -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
    v21 = v20;
    v23 = left + v22;
    v25 = v24 - v17;
    -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
    v27 = v25 / v26;
    if (v25 / v26 < 0.785)
      v27 = v25 / v26 * 0.5;
    v28 = ceil(v21 * v27);
    -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
    -[UIKBRenderGeometry setPaddedFrame:](self, "setPaddedFrame:", v23, CGRectGetMaxY(v30) - bottom - v28, v25, v28);
  }
}

- (id)iPhoneVariantGeometries:(unint64_t)a3 annotationIndex:(unint64_t)a4
{
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double MaxX;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  long double v49;
  uint64_t v50;
  BOOL v52;
  double v53;
  double v54;
  double v57;
  BOOL v58;
  double v59;
  CGFloat v60;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  double v69;
  double v70;
  double v71;
  _BOOL4 v72;
  BOOL v73;
  double v74;
  _BOOL4 v75;
  double v76;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  CGFloat v89;
  double v90;
  CGFloat v91;
  CGFloat v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double rect1;
  double MinX;
  double v102;
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderGeometry displayFrame](self, "displayFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIKBRenderGeometry symbolFrame](self, "symbolFrame");
  v17 = v16;
  v19 = v18;
  v89 = v20;
  v94 = v21;
  v103.origin.x = v9;
  v103.origin.y = v11;
  v103.size.width = v13;
  v103.size.height = v15;
  v104 = CGRectInset(v103, 8.0, -8.0);
  x = v104.origin.x;
  y = v104.origin.y;
  width = v104.size.width;
  height = v104.size.height;
  +[UIKBGeometry geometry](UIKBGeometry, "geometry");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderGeometry frame](self, "frame");
  v28 = v27;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  objc_msgSend(v26, "setPaddingTop:", fabs(v28 - v29), 3);
  -[UIKBRenderGeometry frame](self, "frame");
  v32 = v30 + v31;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  objc_msgSend(v26, "setPaddingBottom:", fabs(v32 - (v33 + v34)), 3);
  -[UIKBRenderGeometry frame](self, "frame");
  v36 = v35;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  objc_msgSend(v26, "setPaddingLeft:", fabs(v36 - v37), 3);
  -[UIKBRenderGeometry frame](self, "frame");
  v40 = v38 + v39;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  objc_msgSend(v26, "setPaddingRight:", fabs(v40 - (v41 + v42)), 3);
  objc_msgSend(v26, "setExplicitlySpecified:", 1);
  v105.origin.x = v17;
  v105.origin.y = v19;
  v105.size.width = v89;
  v105.size.height = v94;
  MinX = CGRectGetMinX(v105);
  v106.origin.x = x;
  v106.origin.y = y;
  v106.size.width = width;
  v106.size.height = height;
  v98 = CGRectGetMinX(v106);
  rect1 = y;
  v92 = width;
  v93 = x;
  v107.origin.x = x;
  v107.origin.y = y;
  v107.size.width = width;
  v91 = height;
  v107.size.height = height;
  MaxX = CGRectGetMaxX(v107);
  v88 = v17;
  v108.origin.x = v17;
  v44 = v19;
  v108.origin.y = v19;
  v108.size.width = v89;
  v45 = v94;
  v108.size.height = v94;
  v46 = CGRectGetMaxX(v108);
  if (a3)
  {
    v47 = v46;
    v48 = fmod(MinX - v98, v89);
    v49 = fmod(MaxX - v47, v89);
    v50 = 0;
    v86 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v87 = *MEMORY[0x1E0C9D648];
    v84 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v85 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v52 = v48 < v49 || a4 >= a3;
    v53 = v88 + v89;
    v54 = v88 + v89;
    do
    {
      if (v89 >= v45 || v50 != 1 || a4 >= a3)
        v57 = v89;
      else
        v57 = v45;
      if (v50 == 1)
        v58 = v52;
      else
        v58 = v50;
      v59 = v88;
      if (!v58)
        v59 = v88 + v89;
      v90 = v59;
      v97 = v86;
      v99 = v87;
      v95 = v84;
      v96 = v85;
      v60 = v93;
      v61 = rect1;
      while (1)
      {
        v62 = v53 - v57;
        v102 = v53;
        v63 = v60;
        v64 = v61;
        v65 = v92;
        v66 = v91;
        if (v58)
        {
          v112.origin.x = v54;
          v112.origin.y = v44;
          v112.size.width = v57;
          v67 = v44;
          v68 = v94;
          v112.size.height = v94;
          if (CGRectContainsRect(*(CGRect *)&v63, v112))
          {
            v62 = v54;
            v54 = v57 + v54;
LABEL_29:
            v69 = v67;
            v70 = v57;
            v71 = v68;
            goto LABEL_44;
          }
          v109.origin.x = v60;
          v109.origin.y = rect1;
          v109.size.width = v92;
          v109.size.height = v91;
          v114.origin.x = v62;
          v114.origin.y = v67;
          v114.size.width = v57;
          v114.size.height = v94;
          v72 = CGRectContainsRect(v109, v114);
          v73 = !v72;
          v74 = v102;
          if (v72)
            v74 = v62;
          v102 = v74;
          if (!v72)
            v62 = v99;
        }
        else
        {
          v113.origin.x = v62;
          v113.origin.y = v44;
          v113.size.width = v57;
          v67 = v44;
          v68 = v94;
          v113.size.height = v94;
          if (CGRectContainsRect(*(CGRect *)&v63, v113))
          {
            v102 = v62;
            goto LABEL_29;
          }
          v110.origin.x = v60;
          v110.origin.y = rect1;
          v110.size.width = v92;
          v110.size.height = v91;
          v115.origin.x = v54;
          v115.origin.y = v67;
          v115.size.width = v57;
          v115.size.height = v94;
          v75 = CGRectContainsRect(v110, v115);
          v76 = v57 + v54;
          v73 = !v75;
          if (!v75)
            v76 = v54;
          v62 = v99;
          if (v75)
            v62 = v54;
          v54 = v76;
        }
        v70 = v96;
        v69 = v97;
        if (!v73)
        {
          v69 = v67;
          v70 = v57;
        }
        v71 = v95;
        if (!v73)
          v71 = v68;
LABEL_44:
        v44 = v67;
        v61 = rect1;
        v111.origin.x = v62;
        v111.origin.y = v69;
        v111.size.width = v70;
        v111.size.height = v71;
        if (!CGRectIsEmpty(v111) || v44 < rect1)
          break;
        v95 = v71;
        v96 = v70;
        v97 = v69;
        v99 = v62;
        v53 = v90;
        v44 = v44 - (v94 + 10.0);
        v54 = v90;
        v60 = v93;
      }
      objc_msgSend(v26, "paddedFrameWithResolvedFrame:", v62, v69, v70, v71);
      +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v62, v69, v70, v71, v78, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setRoundRectCorners:", -[UIKBRenderGeometry roundRectCorners](self, "roundRectCorners"));
      -[UIKBRenderGeometry roundRectRadius](self, "roundRectRadius");
      objc_msgSend(v82, "setRoundRectRadius:");
      objc_msgSend(v7, "addObject:", v82);

      ++v50;
      v45 = v94;
      v53 = v102;
    }
    while (v50 != a3);
  }
  if (a4 < a3 && (unint64_t)objc_msgSend(v7, "count", v46) >= 2)
    objc_msgSend(v7, "exchangeObjectAtIndex:withObjectAtIndex:", 1, a4);

  return v7;
}

- (id)watchVariantGeometries:(unint64_t)a3 annotationIndex:(unint64_t)a4
{
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double MaxX;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  long double v41;
  uint64_t v42;
  BOOL v44;
  double v45;
  double v46;
  double v49;
  BOOL v50;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  double v63;
  _BOOL4 v64;
  BOOL v65;
  double v66;
  _BOOL4 v67;
  double v68;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  CGFloat v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double rect1;
  double MinX;
  double v94;
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderGeometry displayFrame](self, "displayFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIKBRenderGeometry symbolFrame](self, "symbolFrame");
  v17 = v16;
  v19 = v18;
  v81 = v20;
  v86 = v21;
  v95.origin.x = v9;
  v95.origin.y = v11;
  v95.size.width = v13;
  v95.size.height = v15;
  v96 = CGRectInset(v95, 0.0, -0.0);
  x = v96.origin.x;
  y = v96.origin.y;
  width = v96.size.width;
  height = v96.size.height;
  +[UIKBGeometry geometry](UIKBGeometry, "geometry");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPaddingTop:", 0x4000000000000000, 3);
  objc_msgSend(v26, "setPaddingBottom:", 0x4000000000000000, 3);
  -[UIKBRenderGeometry frame](self, "frame");
  v28 = v27;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  objc_msgSend(v26, "setPaddingLeft:", fabs(v28 - v29), 3);
  -[UIKBRenderGeometry frame](self, "frame");
  v32 = v30 + v31;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  objc_msgSend(v26, "setPaddingRight:", fabs(v32 - (v33 + v34)), 3);
  objc_msgSend(v26, "setExplicitlySpecified:", 1);
  v97.origin.x = v17;
  v97.origin.y = v19;
  v97.size.width = v81;
  v97.size.height = v86;
  MinX = CGRectGetMinX(v97);
  v98.origin.x = x;
  v98.origin.y = y;
  v98.size.width = width;
  v98.size.height = height;
  v90 = CGRectGetMinX(v98);
  rect1 = y;
  v84 = width;
  v85 = x;
  v99.origin.x = x;
  v99.origin.y = y;
  v99.size.width = width;
  v83 = height;
  v99.size.height = height;
  MaxX = CGRectGetMaxX(v99);
  v80 = v17;
  v100.origin.x = v17;
  v36 = v19;
  v100.origin.y = v19;
  v100.size.width = v81;
  v37 = v86;
  v100.size.height = v86;
  v38 = CGRectGetMaxX(v100);
  if (a3)
  {
    v39 = v38;
    v40 = fmod(MinX - v90, v81);
    v41 = fmod(MaxX - v39, v81);
    v42 = 0;
    v78 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v79 = *MEMORY[0x1E0C9D648];
    v76 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v77 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v44 = v40 < v41 || a4 >= a3;
    v45 = v80 + v81;
    v46 = v80 + v81;
    do
    {
      if (v81 >= v37 || v42 != 1 || a4 >= a3)
        v49 = v81;
      else
        v49 = v37;
      if (v42 == 1)
        v50 = v44;
      else
        v50 = v42;
      v51 = v80;
      if (!v50)
        v51 = v80 + v81;
      v82 = v51;
      v89 = v78;
      v91 = v79;
      v87 = v76;
      v88 = v77;
      v52 = v85;
      v53 = rect1;
      while (1)
      {
        v54 = v45 - v49;
        v94 = v45;
        v55 = v52;
        v56 = v53;
        v57 = v84;
        v58 = v83;
        if (v50)
        {
          v104.origin.x = v46;
          v104.origin.y = v36;
          v104.size.width = v49;
          v59 = v36;
          v60 = v86;
          v104.size.height = v86;
          if (CGRectContainsRect(*(CGRect *)&v55, v104))
          {
            v54 = v46;
            v46 = v49 + v46;
LABEL_29:
            v61 = v59;
            v62 = v49;
            v63 = v60;
            goto LABEL_44;
          }
          v101.origin.x = v52;
          v101.origin.y = rect1;
          v101.size.width = v84;
          v101.size.height = v83;
          v106.origin.x = v54;
          v106.origin.y = v59;
          v106.size.width = v49;
          v106.size.height = v86;
          v64 = CGRectContainsRect(v101, v106);
          v65 = !v64;
          v66 = v94;
          if (v64)
            v66 = v54;
          v94 = v66;
          if (!v64)
            v54 = v91;
        }
        else
        {
          v105.origin.x = v54;
          v105.origin.y = v36;
          v105.size.width = v49;
          v59 = v36;
          v60 = v86;
          v105.size.height = v86;
          if (CGRectContainsRect(*(CGRect *)&v55, v105))
          {
            v94 = v54;
            goto LABEL_29;
          }
          v102.origin.x = v52;
          v102.origin.y = rect1;
          v102.size.width = v84;
          v102.size.height = v83;
          v107.origin.x = v46;
          v107.origin.y = v59;
          v107.size.width = v49;
          v107.size.height = v86;
          v67 = CGRectContainsRect(v102, v107);
          v68 = v49 + v46;
          v65 = !v67;
          if (!v67)
            v68 = v46;
          v54 = v91;
          if (v67)
            v54 = v46;
          v46 = v68;
        }
        v62 = v88;
        v61 = v89;
        if (!v65)
        {
          v61 = v59;
          v62 = v49;
        }
        v63 = v87;
        if (!v65)
          v63 = v60;
LABEL_44:
        v36 = v59;
        v53 = rect1;
        v103.origin.x = v54;
        v103.origin.y = v61;
        v103.size.width = v62;
        v103.size.height = v63;
        if (!CGRectIsEmpty(v103) || v36 < rect1)
          break;
        v87 = v63;
        v88 = v62;
        v89 = v61;
        v91 = v54;
        v45 = v82;
        v36 = v36 - (v86 + 16.0);
        v46 = v82;
        v52 = v85;
      }
      objc_msgSend(v26, "paddedFrameWithResolvedFrame:", v54, v61, v62, v63);
      +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v54, v61, v62, v63, v70, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setRoundRectCorners:", -1);
      objc_msgSend(v74, "setRoundRectRadius:", 2.0);
      objc_msgSend(v7, "addObject:", v74);

      ++v42;
      v37 = v86;
      v45 = v94;
    }
    while (v42 != a3);
  }
  if (a4 < a3 && (unint64_t)objc_msgSend(v7, "count", v38) >= 2)
    objc_msgSend(v7, "exchangeObjectAtIndex:withObjectAtIndex:", 1, a4);

  return v7;
}

- (id)iPadVariantGeometries:(unint64_t)a3 rowLimit:(int64_t)a4
{
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat width;
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
  double v25;
  double v26;
  void *v27;
  unint64_t v28;
  BOOL v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  unint64_t v38;
  double v39;
  int v40;
  double v41;
  double v42;
  void *v43;
  double v45;
  double v46;
  double v47;
  double x;
  double v49;
  double v50;
  CGRect v51;
  CGRect v52;

  -[UIKBRenderGeometry roundRectRadius](self, "roundRectRadius");
  v8 = v7;
  if ((unint64_t)(a4 - 1) >= 0x7FFFFFFFFFFFFFFELL)
    v9 = 5;
  else
    v9 = a4;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  v11 = v10;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  v13 = v12;
  -[UIKBRenderGeometry displayFrame](self, "displayFrame");
  v52 = CGRectInset(v51, 40.0, -40.0);
  x = v52.origin.x;
  width = v52.size.width;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  v16 = v15;
  -[UIKBRenderGeometry frame](self, "frame");
  v49 = v17;
  -[UIKBRenderGeometry frame](self, "frame");
  v46 = v19;
  v47 = v18;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  v21 = v20;
  v23 = v22;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  v45 = v24;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  v26 = v25;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v28 = 0;
    v29 = 0;
    v30 = width;
    v31 = v8 * 0.5;
    v32 = v11 - (v8 + v8);
    v33 = v13 - (v8 + v8);
    v34 = v45 - (v8 + (v16 - v49 + 0.0 + v47 + v46 - (v21 + v23) + 0.0) * 0.5 + 1.0) - v33;
    v35 = v8 + v26;
    v50 = x + v30;
    v36 = 0.0;
    v37 = v35;
    do
    {
      v38 = v28 % v9;
      if (v29)
        v39 = v35;
      else
        v39 = v37;
      if (v29)
        v36 = 0.0;
      if (v36 == 0.0)
      {
        if ((v38 & 1) != 0)
          v40 = 1;
        else
          v40 = -1;
        v41 = v39 + v32 * (double)v38 * (double)v40;
        if ((v38 & 1) != 0 && v32 + v41 > v50)
        {
          v36 = -1.0;
        }
        else if ((v38 & 1) == 0 && v41 < x)
        {
          v36 = 1.0;
        }
        else
        {
          v39 = v39 + v32 * (double)v38 * (double)v40;
        }
      }
      v42 = v32 * v36;
      if (v36 == 0.0)
        v42 = -0.0;
      v37 = v39 + v42;
      v29 = v9 - 1 == v38;
      +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v39 + v42, v34 - v33 * (double)(v28 / v9), v32, v33, v39 + v42, v34 - v33 * (double)(v28 / v9), v32, v33);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setRoundRectCorners:", -[UIKBRenderGeometry roundRectCorners](self, "roundRectCorners"));
      objc_msgSend(v43, "setRoundRectRadius:", v31);
      objc_msgSend(v27, "addObject:", v43);

      ++v28;
    }
    while (a3 != v28);
  }
  return v27;
}

+ (id)sortedGeometries:(id)a3 leftToRight:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v6, "sortedArrayUsingFunction:context:", geometryPositionSort, objc_msgSend(v5, "numberWithBool:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)similarShape
{
  void *v3;

  +[UIKBShape shape](UIKBShape, "shape");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderGeometry frame](self, "frame");
  objc_msgSend(v3, "setFrame:");
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  objc_msgSend(v3, "setPaddedFrame:");
  return v3;
}

- (UIEdgeInsets)paddedInsets
{
  double v3;
  double v4;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIEdgeInsets result;

  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  v4 = v3;
  -[UIKBRenderGeometry frame](self, "frame");
  v6 = v4 - v5;
  -[UIKBRenderGeometry frame](self, "frame");
  v9 = v7 + v8;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  v12 = v9 - (v10 + v11);
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  v14 = v13;
  -[UIKBRenderGeometry frame](self, "frame");
  v16 = v14 - v15;
  -[UIKBRenderGeometry frame](self, "frame");
  v19 = v17 + v18;
  -[UIKBRenderGeometry paddedFrame](self, "paddedFrame");
  v22 = v19 - (v20 + v21);
  v23 = v6;
  v24 = v16;
  v25 = v12;
  result.right = v22;
  result.bottom = v25;
  result.left = v24;
  result.top = v23;
  return result;
}

- (void)setLayeredBackgroundRoundRectRadius:(double)a3
{
  self->_layeredBackgroundRoundRectRadius = 0.0;
}

- (void)setLayeredForegroundRoundRectRadius:(double)a3
{
  self->_layeredForegroundRoundRectRadius = 0.0;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)popupSource
{
  double x;
  double y;
  CGPoint result;

  x = self->_popupSource.x;
  y = self->_popupSource.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPopupSource:(CGPoint)a3
{
  self->_popupSource = a3;
}

- (unint64_t)concaveCorner
{
  return self->_concaveCorner;
}

- (CGSize)concaveCornerOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_concaveCornerOffset.width;
  height = self->_concaveCornerOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int)popupBias
{
  return self->_popupBias;
}

- (void)setPopupBias:(int)a3
{
  self->_popupBias = a3;
}

- (UIEdgeInsets)layoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_layoutMargins.top;
  left = self->_layoutMargins.left;
  bottom = self->_layoutMargins.bottom;
  right = self->_layoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  self->_layoutMargins = a3;
}

- (int64_t)flickDirection
{
  return self->_flickDirection;
}

- (BOOL)detachedVariants
{
  return self->_detachedVariants;
}

- (void)setDetachedVariants:(BOOL)a3
{
  self->_detachedVariants = a3;
}

- (BOOL)tallPopup
{
  return self->_tallPopup;
}

- (void)setTallPopup:(BOOL)a3
{
  self->_tallPopup = a3;
}

- (NSValue)splitLeftRect
{
  return self->_splitLeftRect;
}

- (void)setSplitLeftRect:(id)a3
{
  objc_storeStrong((id *)&self->_splitLeftRect, a3);
}

- (NSValue)splitRightRect
{
  return self->_splitRightRect;
}

- (void)setSplitRightRect:(id)a3
{
  objc_storeStrong((id *)&self->_splitRightRect, a3);
}

- (int64_t)popupDirection
{
  return self->_popupDirection;
}

- (void)setPopupDirection:(int64_t)a3
{
  self->_popupDirection = a3;
}

- (CGRect)layeredBackgroundPaddedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_layeredBackgroundPaddedFrame.origin.x;
  y = self->_layeredBackgroundPaddedFrame.origin.y;
  width = self->_layeredBackgroundPaddedFrame.size.width;
  height = self->_layeredBackgroundPaddedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)layeredBackgroundRoundRectRadius
{
  return self->_layeredBackgroundRoundRectRadius;
}

- (CGRect)layeredForegroundPaddedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_layeredForegroundPaddedFrame.origin.x;
  y = self->_layeredForegroundPaddedFrame.origin.y;
  width = self->_layeredForegroundPaddedFrame.size.width;
  height = self->_layeredForegroundPaddedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)layeredForegroundRoundRectRadius
{
  return self->_layeredForegroundRoundRectRadius;
}

@end

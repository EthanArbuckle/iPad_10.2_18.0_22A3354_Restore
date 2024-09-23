@implementation UISelectionGrabberCustomPath

- (BOOL)containsZeroPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;
  double v9;

  -[UISelectionGrabberCustomPath bottomPoint](self, "bottomPoint");
  v5 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v6 == *MEMORY[0x1E0C9D538] && v3 == v4)
    return 1;
  -[UISelectionGrabberCustomPath topPoint](self, "topPoint");
  return v9 == v4 && v8 == v5;
}

- (CGRect)boundingRect
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
  CGRect result;

  -[UISelectionGrabberCustomPath topPoint](self, "topPoint");
  v4 = v3;
  v6 = v5;
  -[UISelectionGrabberCustomPath bottomPoint](self, "bottomPoint");
  if (v4 >= v7)
    v9 = v7;
  else
    v9 = v4;
  if (v4 >= v7)
    v7 = v4;
  if (v6 >= v8)
    v10 = v8;
  else
    v10 = v6;
  if (v6 >= v8)
    v8 = v6;
  v11 = v7 - v9;
  v12 = v8 - v10;
  v13 = v9;
  v14 = v10;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)boundingEdgeRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UISelectionGrabberCustomPath boundingRect](self, "boundingRect");
  v5 = 1.0;
  result.size.height = v4;
  result.size.width = v5;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)summaryDescription
{
  void *v3;
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UISelectionGrabberCustomPath topPoint](self, "topPoint");
  v5 = (uint64_t)v4;
  -[UISelectionGrabberCustomPath topPoint](self, "topPoint");
  v7 = (uint64_t)v6;
  -[UISelectionGrabberCustomPath bottomPoint](self, "bottomPoint");
  v9 = (uint64_t)v8;
  -[UISelectionGrabberCustomPath bottomPoint](self, "bottomPoint");
  v11 = (uint64_t)v10;
  -[UISelectionGrabberCustomPath lineWidth](self, "lineWidth");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("top: [%ld, %ld] bottom: [%ld, %ld] lineWidth: %0.1f"), v5, v7, v9, v11, v12);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UISelectionGrabberCustomPath topPoint](self, "topPoint");
  v5 = v4;
  -[UISelectionGrabberCustomPath topPoint](self, "topPoint");
  v7 = v6;
  -[UISelectionGrabberCustomPath bottomPoint](self, "bottomPoint");
  v9 = v8;
  -[UISelectionGrabberCustomPath bottomPoint](self, "bottomPoint");
  v11 = v10;
  -[UISelectionGrabberCustomPath lineWidth](self, "lineWidth");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("top    : %.2f %.2f \nbottom   : %.2f %.2f \nlineWidth %.1f"), v5, v7, v9, v11, v12);
}

- (id)bezierPathForHostView:(id)a3 targetView:(id)a4
{
  id v6;
  id v7;
  UIBezierPath *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(UIBezierPath);
  -[UISelectionGrabberCustomPath bottomPoint](self, "bottomPoint");
  objc_msgSend(v7, "convertPoint:toView:", v6);
  v10 = v9;
  v12 = v11;
  -[UISelectionGrabberCustomPath topPoint](self, "topPoint");
  objc_msgSend(v7, "convertPoint:toView:", v6);
  v14 = v13;
  v16 = v15;

  -[UIBezierPath moveToPoint:](v8, "moveToPoint:", v10, v12);
  -[UIBezierPath addLineToPoint:](v8, "addLineToPoint:", v14, v16);
  return v8;
}

- (CGPoint)topPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_topPoint.x;
  y = self->_topPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTopPoint:(CGPoint)a3
{
  self->_topPoint = a3;
}

- (CGPoint)bottomPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomPoint.x;
  y = self->_bottomPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setBottomPoint:(CGPoint)a3
{
  self->_bottomPoint = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

@end

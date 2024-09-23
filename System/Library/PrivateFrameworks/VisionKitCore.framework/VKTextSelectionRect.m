@implementation VKTextSelectionRect

- (VKTextSelectionRect)initWithRect:(CGRect)a3 containsStart:(BOOL)a4 containsEnd:(BOOL)a5 layoutDirection:(unint64_t)a6 quad:(id)a7
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v16;
  VKTextSelectionRect *v17;
  VKTextSelectionRect *v18;
  uint64_t v19;
  UIBezierPath *path;
  uint64_t v21;
  VKTextSelectionRectCustomHandleInfo *customHandleInfo;
  objc_super v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)VKTextSelectionRect;
  v17 = -[VKTextSelectionRect init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_rect.origin.x = x;
    v17->_rect.origin.y = y;
    v17->_rect.size.width = width;
    v17->_rect.size.height = height;
    v17->_containsStart = a4;
    v17->_containsEnd = a5;
    v17->_layoutDirection = a6;
    objc_msgSend(v16, "path");
    v19 = objc_claimAutoreleasedReturnValue();
    path = v18->__path;
    v18->__path = (UIBezierPath *)v19;

    -[VKTextSelectionRect handleInfoForQuad:origin:](v18, "handleInfoForQuad:origin:", v16, x, y);
    v21 = objc_claimAutoreleasedReturnValue();
    customHandleInfo = v18->__customHandleInfo;
    v18->__customHandleInfo = (VKTextSelectionRectCustomHandleInfo *)v21;

    objc_storeStrong((id *)&v18->_quad, a7);
  }

  return v18;
}

- (id)handleInfoForQuad:(id)a3 origin:(CGPoint)a4
{
  double x;
  id v5;
  VKTextSelectionRectCustomHandleInfo *v6;
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

  x = a4.x;
  v5 = a3;
  v6 = objc_alloc_init(VKTextSelectionRectCustomHandleInfo);
  objc_msgSend(v5, "bottomLeft");
  -[VKTextSelectionRectCustomHandleInfo setBottomLeft:](v6, "setBottomLeft:", VKMAddPoints(v7, v8, x));
  objc_msgSend(v5, "bottomRight");
  -[VKTextSelectionRectCustomHandleInfo setBottomRight:](v6, "setBottomRight:", VKMAddPoints(v9, v10, x));
  objc_msgSend(v5, "topLeft");
  -[VKTextSelectionRectCustomHandleInfo setTopLeft:](v6, "setTopLeft:", VKMAddPoints(v11, v12, x));
  objc_msgSend(v5, "topRight");
  v14 = v13;
  v16 = v15;

  -[VKTextSelectionRectCustomHandleInfo setTopRight:](v6, "setTopRight:", VKMAddPoints(v14, v16, x));
  return v6;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  char v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  -[VKTextSelectionRect rect](self, "rect");
  v6 = v15.origin.x;
  v14.x = x;
  v14.y = y;
  v7 = CGRectContainsPoint(v15, v14);
  if (v7)
  {
    v8 = VKMSubtractPoints(x, y, v6);
    v10 = v9;
    -[VKTextSelectionRect quad](self, "quad");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsPoint:", v8, v10);

    LOBYTE(v7) = v12;
  }
  return v7;
}

- (id)summaryDescription
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[VKTextSelectionRect rect](self, "rect");
  VKMUIStringForRect(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isVertical
{
  return -[VKTextSelectionRect layoutDirection](self, "layoutDirection") == 5;
}

- (int64_t)writingDirection
{
  return ((-[VKTextSelectionRect layoutDirection](self, "layoutDirection") - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (BOOL)containsStart
{
  return self->_containsStart;
}

- (void)setContainsStart:(BOOL)a3
{
  self->_containsStart = a3;
}

- (BOOL)containsEnd
{
  return self->_containsEnd;
}

- (void)setContainsEnd:(BOOL)a3
{
  self->_containsEnd = a3;
}

- (UIBezierPath)_path
{
  return self->__path;
}

- (void)set_path:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (VKTextSelectionRectCustomHandleInfo)_customHandleInfo
{
  return self->__customHandleInfo;
}

- (void)set_customHandleInfo:(id)a3
{
  objc_storeStrong((id *)&self->__customHandleInfo, a3);
}

- (VKQuad)quad
{
  return self->_quad;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_layoutDirection = a3;
}

- (NSString)_transcript
{
  return self->__transcript;
}

- (void)set_transcript:(id)a3
{
  objc_storeStrong((id *)&self->__transcript, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__transcript, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->__customHandleInfo, 0);
  objc_storeStrong((id *)&self->__path, 0);
}

@end

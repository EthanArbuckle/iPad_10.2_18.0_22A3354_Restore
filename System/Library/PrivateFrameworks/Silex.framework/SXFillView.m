@implementation SXFillView

- (SXFillView)initWithFill:(id)a3
{
  id v5;
  SXFillView *v6;
  SXFillView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXFillView;
  v6 = -[SXFillView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fill, a3);

  return v7;
}

- (CGRect)fillFrameWithBoundingSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  CGRect result;

  height = a3.height;
  width = a3.width;
  v5 = 0.0;
  v6 = 0.0;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)contentFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (SXFill)fill
{
  return self->_fill;
}

- (CGRect)originalFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originalFrame.origin.x;
  y = self->_originalFrame.origin.y;
  width = self->_originalFrame.size.width;
  height = self->_originalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginalFrame:(CGRect)a3
{
  self->_originalFrame = a3;
}

- (SXDraggable)dragable
{
  return self->_dragable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragable, 0);
  objc_storeStrong((id *)&self->_fill, 0);
}

@end

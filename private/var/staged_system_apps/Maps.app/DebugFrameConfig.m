@implementation DebugFrameConfig

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

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (UILayoutGuide)layoutGuide
{
  return (UILayoutGuide *)objc_loadWeakRetained((id *)&self->_layoutGuide);
}

- (void)setLayoutGuide:(id)a3
{
  objc_storeWeak((id *)&self->_layoutGuide, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (unint64_t)edges
{
  return self->_edges;
}

- (void)setEdges:(unint64_t)a3
{
  self->_edges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_destroyWeak((id *)&self->_layoutGuide);
}

@end

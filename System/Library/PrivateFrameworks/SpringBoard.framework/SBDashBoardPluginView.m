@implementation SBDashBoardPluginView

- (id)presentationRegions
{
  double x;
  double y;
  double width;
  double height;
  void *v7;
  void *v8;
  _QWORD v10[2];
  CGRect v11;

  v10[1] = *MEMORY[0x1E0C80C00];
  -[SBDashBoardPluginView presentationRegion](self, "presentationRegion");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  if (CGRectEqualToRect(v11, *MEMORY[0x1E0C9D648]))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1BC40], "regionForCoordinateSpace:withExtent:", self, x, y, width, height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (CGRect)presentationRegion
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_presentationRegion.origin.x;
  y = self->_presentationRegion.origin.y;
  width = self->_presentationRegion.size.width;
  height = self->_presentationRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPresentationRegion:(CGRect)a3
{
  self->_presentationRegion = a3;
}

@end

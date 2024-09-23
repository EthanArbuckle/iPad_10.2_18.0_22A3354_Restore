@implementation PPKGPMagicPaperState

- (PPKGPMagicPaperState)initWithFrame:(CGRect)a3 isEditing:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  PPKGPMagicPaperState *v9;
  PPKGPMagicPaperState *v10;
  objc_super v12;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)PPKGPMagicPaperState;
  v9 = -[PPKGPMagicPaperState init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[PPKGPMagicPaperState setFrame:](v9, "setFrame:", x, y, width, height);
    -[PPKGPMagicPaperState setIsEditing:](v10, "setIsEditing:", v4);
  }
  return v10;
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

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

@end

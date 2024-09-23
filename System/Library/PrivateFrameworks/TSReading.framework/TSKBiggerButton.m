@implementation TSKBiggerButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  BOOL result;
  double top;
  double left;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGPoint v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)TSKBiggerButton;
  result = -[TSKBiggerButton pointInside:withEvent:](&v14, sel_pointInside_withEvent_, a4);
  if (self->mHitTestWithOutsets && !result)
  {
    -[TSKBiggerButton bounds](self, "bounds");
    top = self->mOutsets.top;
    left = self->mOutsets.left;
    v16.origin.x = v10 + left;
    v16.origin.y = v11 + top;
    v16.size.width = v12 - (left + self->mOutsets.right);
    v16.size.height = v13 - (top + self->mOutsets.bottom);
    v15.x = x;
    v15.y = y;
    return CGRectContainsPoint(v16, v15);
  }
  return result;
}

- (void)setHitBufferTop:(double)a3 left:(double)a4 bottom:(double)a5 right:(double)a6
{
  self->mOutsets.top = -a3;
  self->mOutsets.left = -a4;
  self->mOutsets.bottom = -a5;
  self->mOutsets.right = -a6;
  self->mHitTestWithOutsets = 1;
}

+ (id)tsdPlatformButtonWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  TSKBiggerButton *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = +[TSKBiggerButton buttonWithType:](TSKBiggerButton, "buttonWithType:", 0);
  -[TSKBiggerButton setFrame:](v7, "setFrame:", x, y, width, height);
  return v7;
}

@end

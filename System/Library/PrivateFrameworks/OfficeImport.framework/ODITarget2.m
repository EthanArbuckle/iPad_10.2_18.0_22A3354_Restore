@implementation ODITarget2

- (void)mapPoint:(id)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  unsigned int v10;
  __CFString *v11;
  objc_super v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = -[ODIState pointIndex](self->super.mState, "pointIndex");
  if (v10 >= 3)
    v11 = 0;
  else
    v11 = off_24F39E148[v10];
  -[ODIState setPresentationName:forPointType:](self->super.mState, "setPresentationName:forPointType:", v11, 2);
  v12.receiver = self;
  v12.super_class = (Class)ODITarget2;
  -[ODILinear mapPoint:bounds:](&v12, sel_mapPoint_bounds_, v9, x, y, width, height);

}

@end

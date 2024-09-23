@implementation ODIVenn2

- (void)mapPoint:(id)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  objc_super v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("circle%d"), -[ODIState pointIndex](self->super.mState, "pointIndex") + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODIState setPresentationName:forPointType:](self->super.mState, "setPresentationName:forPointType:", v10, 2);
  v11.receiver = self;
  v11.super_class = (Class)ODIVenn2;
  -[ODILinear mapPoint:bounds:](&v11, sel_mapPoint_bounds_, v9, x, y, width, height);

}

@end

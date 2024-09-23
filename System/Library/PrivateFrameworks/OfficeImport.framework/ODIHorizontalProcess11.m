@implementation ODIHorizontalProcess11

- (void)mapPoint:(id)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  char v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = -[ODIState pointIndex](self->super.mState, "pointIndex");
  v11 = 65;
  if ((v10 & 1) != 0)
    v11 = 66;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("circle%c"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODIState setPresentationName:forPointType:](self->super.mState, "setPresentationName:forPointType:", v12, 2);
  v13.receiver = self;
  v13.super_class = (Class)ODIHorizontalProcess11;
  -[ODILinear mapPoint:bounds:](&v13, sel_mapPoint_bounds_, v9, x, y, width, height);

}

@end

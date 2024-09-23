@implementation ODIVerticalProcess2

- (void)mapPoint:(id)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  signed int v10;
  __CFString *v11;
  __CFString *v12;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = -[ODIState pointIndex](self->super.mState, "pointIndex");
  if (v10 >= -[ODIState pointCount](self->super.mState, "pointCount") - 1)
    v11 = CFSTR("parentTextBox");
  else
    v11 = CFSTR("parentTextArrow");
  v12 = v11;
  -[ODIState setPresentationName:forPointType:](self->super.mState, "setPresentationName:forPointType:", v12, 2);
  v13.receiver = self;
  v13.super_class = (Class)ODIVerticalProcess2;
  -[ODILinear mapPoint:bounds:](&v13, sel_mapPoint_bounds_, v9, x, y, width, height);

}

- (void)mapStyleFromTransition:(id)a3 shape:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[ODIState diagram](self->super.mState, "diagram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentPoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", -[ODIState pointIndex](self->super.mState, "pointIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[ODIDrawable mapStyleFromPoint:shape:state:](ODIDrawable, "mapStyleFromPoint:shape:state:", v8, v9, self->super.mState);
}

@end

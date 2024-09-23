@implementation TouchExclusionView

- (TouchExclusionView)initWithFrame:(CGRect)a3 excludingView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  TouchExclusionView *v11;
  TouchExclusionView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TouchExclusionView;
  v11 = -[TouchExclusionView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
    objc_storeStrong((id *)&v11->_excludingView, a4);

  return v12;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  BOOL v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIView convertPoint:fromView:](self->_excludingView, "convertPoint:fromView:", self, x, y);
  if (-[UIView pointInside:withEvent:](self->_excludingView, "pointInside:withEvent:", v7))
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TouchExclusionView;
    v8 = -[TouchExclusionView pointInside:withEvent:](&v10, sel_pointInside_withEvent_, v7, x, y);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludingView, 0);
}

@end

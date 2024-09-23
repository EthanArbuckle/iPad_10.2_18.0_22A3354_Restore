@implementation UITextRefinementPanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  CGPoint *p_startPoint;
  id v7;
  id v8;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  objc_super v13;

  p_startPoint = &self->_startPoint;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationInView:", v10);
  p_startPoint->x = v11;
  p_startPoint->y = v12;

  v13.receiver = self;
  v13.super_class = (Class)UITextRefinementPanGestureRecognizer;
  -[UIPanGestureRecognizer touchesBegan:withEvent:](&v13, sel_touchesBegan_withEvent_, v8, v7);

}

- (CGPoint)startPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPoint.x;
  y = self->_startPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

@end

@implementation UITextRangeAdjustmentGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  CGPoint *p_startPoint;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  objc_super v14;

  p_startPoint = &self->_startPoint;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textInputView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationInView:", v11);
  p_startPoint->x = v12;
  p_startPoint->y = v13;

  v14.receiver = self;
  v14.super_class = (Class)UITextRangeAdjustmentGestureRecognizer;
  -[UIPanGestureRecognizer touchesBegan:withEvent:](&v14, sel_touchesBegan_withEvent_, v8, v7);

}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return objc_msgSend(a3, "_isGestureType:", 8);
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
